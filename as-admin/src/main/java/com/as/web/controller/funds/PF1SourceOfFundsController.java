package com.as.web.controller.funds;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.common.utils.StringUtils;
import com.as.funds.domain.PF1SourceOfFunds;
import com.as.funds.domain.PF1SourceOfFundsSummary;
import com.as.funds.service.IPF1SourceOfFundsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * PF1资金来源Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/funds/pf1")
public class PF1SourceOfFundsController extends BaseController {
    private String prefix = "funds";

    @Autowired
    private IPF1SourceOfFundsService pf1SourceOfFundsService;

    @RequiresPermissions("funds:pf1:view")
    @GetMapping()
    public String pf1() {
        return prefix + "/pf1";
    }

    /**
     * 查询PF1资金来源
     */
    @RequiresPermissions("funds:pf1:list")
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
        List<PF1SourceOfFunds> pf1SourceOfFounds = pf1SourceOfFundsService.getPF1SourceOfFound(map);
        if (StringUtils.isNotNull(pf1SourceOfFounds)) {
            return getDataTable(pf1SourceOfFounds);
        }
        return getDataTable(new LinkedList<>());
    }

    /**
     * 查询PF1资金来源总和
     */
    @RequiresPermissions("funds:pf1:list")
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
        List<PF1SourceOfFundsSummary> pf1SourceOfFundsSummaries = pf1SourceOfFundsService.getPF1SourceOfFoundSummary(map);
        if (StringUtils.isNotNull(pf1SourceOfFundsSummaries)) {
            return getDataTable(pf1SourceOfFundsSummaries);
        }
        return getDataTable(new LinkedList<>());
    }
}
