package com.as.web.controller.query;

import com.as.common.core.controller.BaseController;
import com.as.common.core.domain.AjaxResult;
import com.as.common.core.page.TableDataInfo;
import com.as.query.DBQuery;
import com.as.system.service.IDBQueryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * DB sql查询
 *
 * @author kolin
 */
@Controller
@RequestMapping("/query/db")
public class DBQueryController extends BaseController {

    @Autowired
    private IDBQueryService queryService;

    private String prefix = "query";

    @RequiresPermissions("query:as:view")
    @GetMapping("/as")
    public String as() {
        return prefix + "/as";
    }

    @RequiresPermissions("query:pf1:view")
    @GetMapping("/pf1")
    public String pf1() {
        return prefix + "/pf1";
    }

    @RequiresPermissions("query:pf2:view")
    @GetMapping("/pf2")
    public String pf2() {
        return prefix + "/pf2";
    }

    @PostMapping("/query")
    @ResponseBody
    public TableDataInfo query(@Validated DBQuery dbQuery) {
        Map<String, Object> map = queryService.query(dbQuery.getScript(), dbQuery.getDatasource());
        List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("result");
        int total = (int) map.get("total");
        return getDataTable(list, total);
    }

    /**
     * 动态获取列
     */
    @PostMapping("/ajaxColumns")
    @ResponseBody
    public AjaxResult ajaxColumns(@Validated DBQuery dbQuery) {
        String[] columnNames = queryService.queryColumns(dbQuery.getScript(), dbQuery.getDatasource());
        return AjaxResult.success(columnNames);
    }
}
