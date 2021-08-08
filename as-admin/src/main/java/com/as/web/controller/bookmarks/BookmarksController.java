package com.as.web.controller.bookmarks;

import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.entity.SysMenu;
import com.as.common.utils.ShiroUtils;
import com.as.system.service.ISysMenuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * as sql查询
 *
 * @author kolin
 */
@Controller
@RequestMapping("/as/bookmarks")
public class BookmarksController extends BaseController {

    @Autowired
    private ISysMenuService menuService;

    private String prefix = "bookmarks";

    @RequiresPermissions("bookmarks:as:view")
    @GetMapping()
    public String build(ModelMap mmap) {
        Long userId = ShiroUtils.getUserId();
        List<SysMenu> menus = menuService.getChildPerms(menuService.selectMenuAll(userId), 8);
        mmap.put("locale", LocaleContextHolder.getLocale().toString());
        mmap.put("menus", menus);
        return prefix + "/bookmarks";
    }

//    @PostMapping("/list")
//    @ResponseBody
//    public List<Ztree> query() {
//        Long userId = ShiroUtils.getUserId();
//        List<Ztree> ztrees = menuService.menuTreeData(userId);
//        return ztrees;
//    }

//    /**
//     * 动态获取列
//     */
//    @PostMapping("/ajaxColumns")
//    @ResponseBody
//    public AjaxResult ajaxColumns(@Validated DBQuery dbQuery) {
//        String[] columnNames = queryService.queryColumns(dbQuery.getScript(), dbQuery.getDatasource());
//        return AjaxResult.success(columnNames);
//    }
}
