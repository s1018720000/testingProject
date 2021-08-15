package com.as.web.controller.funds;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.common.utils.StringUtils;
import com.as.funds.domain.PF2SourceOfFunds;
import com.as.funds.domain.PF2SourceOfFundsSummary;
import com.as.funds.service.IPF2SourceOfFundsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * PF2订单查询Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/funds/pf2")
public class PF2SourceOfFundsController extends BaseController {
    private String prefix = "funds";

    @Autowired
    private IPF2SourceOfFundsService pf2SourceOfFundsService;

    @RequiresPermissions("funds:pf2:view")
    @GetMapping()
    public String pf2() {
        return prefix + "/pf2";
    }

    /**
     * 查询PF2资金来源
     */
    @RequiresPermissions("funds:pf2:list")
    @PostMapping("/listDetail")
    @ResponseBody
    public TableDataInfo listDetail(@RequestParam(name = "account") String account,
                                    @RequestParam(name = "startTime", required = false) String startTime,
                                    @RequestParam(name = "endTime", required = false) String endTime) {
        startPage();
        Map<String, Object> map = new HashMap<>();
        String[] accounts = account.split(",");
        map.put("accounts", accounts);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        List<PF2SourceOfFunds> pf2SourceOfFounds = pf2SourceOfFundsService.getPF2SourceOfFound(map);
        if (StringUtils.isNotNull(pf2SourceOfFounds)) {
            return getDataTable(pf2SourceOfFounds);
        }
        return getDataTable(new LinkedList<>());
    }

    /**
     * 查询PF2资金来源总和
     */
    @RequiresPermissions("funds:pf2:list")
    @PostMapping("/listTotal")
    @ResponseBody
    public TableDataInfo listTotal(@RequestParam(name = "account") String account,
                                   @RequestParam(name = "startTime", required = false) String startTime,
                                   @RequestParam(name = "endTime", required = false) String endTime) {
        Map<String, Object> map = new HashMap<>();
        String[] accounts = account.split(",");
        map.put("accounts", accounts);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        List<PF2SourceOfFundsSummary> pf2SourceOfFundsSummaries = pf2SourceOfFundsService.getPF2SourceOfFoundSummary(map);
        if (StringUtils.isNotNull(pf2SourceOfFundsSummaries)) {
            return getDataTable(pf2SourceOfFundsSummaries);
        }
        return getDataTable(new LinkedList<>());
    }
}
