package com.as.web.controller.system;

import com.as.common.annotation.Log;
import com.as.common.constant.UserConstants;
import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.domain.Ztree;
import com.as.common.core.domain.entity.SysMenu;
import com.as.common.core.domain.entity.SysRole;
import com.as.common.enums.BusinessType;
import com.as.common.utils.MessageUtils;
import com.as.common.utils.ShiroUtils;
import com.as.framework.shiro.util.AuthorizationUtils;
import com.as.system.service.ISysMenuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜单信息
 *
 * @author kolin
 */
@Controller
@RequestMapping("/system/menu")
public class SysMenuController extends BaseController {
    private String prefix = "system/menu";

    @Autowired
    private ISysMenuService menuService;

    @RequiresPermissions("system:menu:view")
    @GetMapping()
    public String menu() {
        return prefix + "/menu";
    }

    @RequiresPermissions("system:menu:list")
    @PostMapping("/list")
    @ResponseBody
    public List<SysMenu> list(SysMenu menu) {
        Long userId = ShiroUtils.getUserId();
        List<SysMenu> menuList = menuService.selectMenuList(menu, userId);
        return menuList;
    }

    /**
     * 删除菜单
     */
    @Log(title = "菜单管理", businessType = BusinessType.DELETE)
    @RequiresPermissions("system:menu:remove")
    @GetMapping("/remove/{menuId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("menuId") Long menuId) {
        if (menuService.selectCountMenuByParentId(menuId) > 0) {
            return AjaxResult.warn(MessageUtils.message("menu.son.exist"));
        }
        if (menuService.selectCountRoleMenuByMenuId(menuId) > 0) {
            return AjaxResult.warn(MessageUtils.message("menu.assigned"));
        }
        AuthorizationUtils.clearAllCachedAuthorizationInfo();
        return toAjax(menuService.deleteMenuById(menuId));
    }

    /**
     * 新增
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap) {
        SysMenu menu = null;
        if (0L != parentId) {
            menu = menuService.selectMenuById(parentId);
        } else {
            menu = new SysMenu();
            menu.setMenuId(0L);
            menu.setMenuName(MessageUtils.message("menu.main.catalogue"));
        }
        mmap.put("menu", menu);
        return prefix + "/add";
    }

    /**
     * 新增保存菜单
     */
    @Log(title = "菜单管理", businessType = BusinessType.INSERT)
    @RequiresPermissions("system:menu:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated SysMenu menu) {
        if (UserConstants.MENU_NAME_NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return error(MessageUtils.message("menu.add") + " '" + menu.getMenuName() + "' " + MessageUtils.message("menu.add.failed"));
        }
        menu.setCreateBy(ShiroUtils.getLoginName());
        AuthorizationUtils.clearAllCachedAuthorizationInfo();
        return toAjax(menuService.insertMenu(menu));
    }

    /**
     * 修改菜单
     */
    @GetMapping("/edit/{menuId}")
    public String edit(@PathVariable("menuId") Long menuId, ModelMap mmap) {
        mmap.put("menu", menuService.selectMenuById(menuId));
        return prefix + "/edit";
    }

    /**
     * 修改保存菜单
     */
    @Log(title = "菜单管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:menu:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated SysMenu menu) {
        if (UserConstants.MENU_NAME_NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return error(MessageUtils.message("menu.add.modify") + " '" + menu.getMenuName() + "' " + MessageUtils.message("menu.add.failed"));
        }
        menu.setUpdateBy(ShiroUtils.getLoginName());
        AuthorizationUtils.clearAllCachedAuthorizationInfo();
        return toAjax(menuService.updateMenu(menu));
    }

    /**
     * 选择菜单图标
     */
    @GetMapping("/icon")
    public String icon() {
        return prefix + "/icon";
    }

    /**
     * 校验菜单名称
     */
    @PostMapping("/checkMenuNameUnique")
    @ResponseBody
    public String checkMenuNameUnique(SysMenu menu) {
        return menuService.checkMenuNameUnique(menu);
    }

    /**
     * 加载角色菜单列表树
     */
    @GetMapping("/roleMenuTreeData")
    @ResponseBody
    public List<Ztree> roleMenuTreeData(SysRole role) {
        Long userId = ShiroUtils.getUserId();
        List<Ztree> ztrees = menuService.roleMenuTreeData(role, userId);
        return ztrees;
    }

    /**
     * 加载所有菜单列表树
     */
    @GetMapping("/menuTreeData")
    @ResponseBody
    public List<Ztree> menuTreeData() {
        Long userId = ShiroUtils.getUserId();
        List<Ztree> ztrees = menuService.menuTreeData(userId);
        return ztrees;
    }

    /**
     * 选择菜单树
     */
    @GetMapping("/selectMenuTree/{menuId}")
    public String selectMenuTree(@PathVariable("menuId") Long menuId, ModelMap mmap) {
        mmap.put("menu", menuService.selectMenuById(menuId));
        return prefix + "/tree";
    }
}