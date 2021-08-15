package com.as.web.controller.system;

import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.domain.entity.SysUser;
import com.as.common.utils.CookieUtils;
import com.as.common.utils.MessageUtils;
import com.as.framework.shiro.service.SysRegisterService;
import com.as.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

/**
 * 注册验证
 *
 * @author kolin
 */
@Controller
public class SysRegisterController extends BaseController {
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    @ResponseBody
    public AjaxResult ajaxRegister(SysUser user) {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return error(MessageUtils.message("user.no.register"));
        }
        String msg = registerService.register(user);
        HttpServletResponse response = getResponse();
        CookieUtils.setCookie(response, "locale", LocaleContextHolder.getLocale().toString());
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
