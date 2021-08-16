package com.as.web.controller.history;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.common.utils.StringUtils;
import com.as.history.domain.FundHistory;
import com.as.history.service.IFundHistoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 客户历史盈亏数据Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/fund/history")
public class FundHistoryController extends BaseController {
    private String prefix = "history";

    @Autowired
    private IFundHistoryService fundHistoryService;

    @RequiresPermissions("fund:history:view")
    @GetMapping()
    public String history() {
        return prefix + "/history";
    }

    /**
     * 客户历史盈亏数据
     */
    @RequiresPermissions("fund:history:list")
    @PostMapping("/listDetail")
    @ResponseBody
    public TableDataInfo listDetail(@RequestParam(name = "account") String account,
                                    @RequestParam(name = "startTime", required = false) String startTime,
                                    @RequestParam(name = "endTime", required = false) String endTime) {
        startPage();
        Map<String, Object> map = new HashMap<>();
        map.put("account", account);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        List<FundHistory> fundHistory = fundHistoryService.getFundHistory(map);
        if (StringUtils.isNotNull(fundHistory)) {
            return getDataTable(fundHistory);
        }
        return getDataTable(new LinkedList<>());
    }

    /**
     * 客户历史盈亏数据总和
     */
    @RequiresPermissions("fund:history:list")
    @PostMapping("/listTotal")
    @ResponseBody
    public TableDataInfo listTotal(@RequestParam(name = "account") String account,
                                   @RequestParam(name = "startTime", required = false) String startTime,
                                   @RequestParam(name = "endTime", required = false) String endTime) {
        Map<String, Object> map = new HashMap<>();
        map.put("account", account);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        List<FundHistory> fundHistorySummary = fundHistoryService.getFundHistorySummary(map);
        if (StringUtils.isNotNull(fundHistorySummary)) {
            return getDataTable(fundHistorySummary);
        }
        return getDataTable(new LinkedList<>());
    }
}
