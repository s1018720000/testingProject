package com.as.web.controller.system;

import com.as.common.utils.MessageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.as.common.annotation.Log;
import com.as.common.config.ASConfig;
import com.as.common.constant.UserConstants;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.domain.entity.SysUser;
import com.as.common.enums.BusinessType;
import com.as.common.utils.DateUtils;
import com.as.common.utils.ShiroUtils;
import com.as.common.utils.StringUtils;
import com.as.common.utils.file.FileUploadUtils;
import com.as.framework.shiro.service.SysPasswordService;
import com.as.system.service.ISysUserService;

/**
 * 个人信息 业务处理
 * 
 * @author kolin
 */
@Controller
@RequestMapping("/system/user/profile")
public class SysProfileController extends BaseController
{
    private static final Logger log = LoggerFactory.getLogger(SysProfileController.class);

    private String prefix = "system/user/profile";

    @Autowired
    private ISysUserService userService;
    
    @Autowired
    private SysPasswordService passwordService;

    /**
     * 个人信息
     */
    @GetMapping()
    public String profile(ModelMap mmap)
    {
        SysUser user = ShiroUtils.getSysUser();
        mmap.put("user", user);
        mmap.put("roleGroup", userService.selectUserRoleGroup(user.getUserId()));
        mmap.put("postGroup", userService.selectUserPostGroup(user.getUserId()));
        return prefix + "/profile";
    }

    @GetMapping("/checkPassword")
    @ResponseBody
    public boolean checkPassword(String password)
    {
        SysUser user = ShiroUtils.getSysUser();
        if (passwordService.matches(user, password))
        {
            return true;
        }
        return false;
    }

    @GetMapping("/resetPwd")
    public String resetPwd(ModelMap mmap)
    {
        SysUser user = ShiroUtils.getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/resetPwd";
    }

    @Log(title = "重置密码", businessType = BusinessType.UPDATE)
    @PostMapping("/resetPwd")
    @ResponseBody
    public AjaxResult resetPwd(String oldPassword, String newPassword)
    {
        SysUser user = ShiroUtils.getSysUser();
        if (!passwordService.matches(user, oldPassword))
        {
            return error(MessageUtils.message("user.modify.pwd.error"));
        }
        if (passwordService.matches(user, newPassword))
        {
            return error(MessageUtils.message("user.pwd.no.same"));
        }
        user.setSalt(ShiroUtils.randomSalt());
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), newPassword, user.getSalt()));
        user.setPwdUpdateDate(DateUtils.getNowDate());
        if (userService.resetUserPwd(user) > 0)
        {
            ShiroUtils.setSysUser(userService.selectUserById(user.getUserId()));
            return success();
        }
        return error(MessageUtils.message("user.modify.ex"));
    }

    /**
     * 修改用户
     */
    @GetMapping("/edit")
    public String edit(ModelMap mmap)
    {
        SysUser user = ShiroUtils.getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/edit";
    }

    /**
     * 修改头像
     */
    @GetMapping("/avatar")
    public String avatar(ModelMap mmap)
    {
        SysUser user = ShiroUtils.getSysUser();
        mmap.put("user", userService.selectUserById(user.getUserId()));
        return prefix + "/avatar";
    }

    /**
     * 修改用户
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(SysUser user)
    {
        SysUser currentUser = ShiroUtils.getSysUser();
        currentUser.setUserName(user.getUserName());
        currentUser.setEmail(user.getEmail());
        currentUser.setSex(user.getSex());
        if (StringUtils.isNotEmpty(user.getEmail())
                && UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(currentUser)))
        {
            return error(MessageUtils.message("user.modify.user") + " '" + currentUser.getLoginName() + "' " + MessageUtils.message("user.modify.user.error"));
        }
        if (userService.updateUserInfo(currentUser) > 0)
        {
            ShiroUtils.setSysUser(userService.selectUserById(currentUser.getUserId()));
            return success();
        }
        return error();
    }

    /**
     * 保存头像
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PostMapping("/updateAvatar")
    @ResponseBody
    public AjaxResult updateAvatar(@RequestParam("avatarfile") MultipartFile file)
    {
        SysUser currentUser = ShiroUtils.getSysUser();
        try
        {
            if (!file.isEmpty())
            {
                String avatar = FileUploadUtils.upload(ASConfig.getAvatarPath(), file);
                currentUser.setAvatar(avatar);
                if (userService.updateUserInfo(currentUser) > 0)
                {
                    ShiroUtils.setSysUser(userService.selectUserById(currentUser.getUserId()));
                    return success();
                }
            }
            return error();
        }
        catch (Exception e)
        {
            log.error(MessageUtils.message("user.modify.avatar.error"), e);
            return error(e.getMessage());
        }
    }
}
