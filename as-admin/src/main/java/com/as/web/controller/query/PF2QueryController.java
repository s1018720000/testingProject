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
 * pf2 sql查询
 *
 * @author kolin
 */
@Controller
@RequestMapping("/query/pf2")
public class PF2QueryController extends BaseController {

    @Autowired
    private IDBQueryService queryService;

    private String prefix = "query";

    @RequiresPermissions("query:pf2:view")
    @GetMapping()
    public String build() {
        return prefix + "/pf2";
    }

    @RequiresPermissions("query:pf2:query")
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
