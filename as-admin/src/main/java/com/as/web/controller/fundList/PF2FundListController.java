package com.as.web.controller.fundList;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.fundList.domain.PF2FundList;
import com.as.fundList.service.IPF2FundListService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

/**
 * PF2订单查询Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/fundList/pf2")
public class PF2FundListController extends BaseController {
    private String prefix = "fundList";

    @Autowired
    private IPF2FundListService pf2FundListService;

    @RequiresPermissions("fundList:pf2:view")
    @GetMapping()
    public String pf2() {
        return prefix + "/pf2";
    }

    /**
     * 查询PF2资金对账
     */
    @RequiresPermissions("fundList:pf2:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestParam(name = "account") String account) {
        String[] accounts = account.split(",");
        List<PF2FundList> pf2FoundList = pf2FundListService.getPF2FundList(accounts);
        if (pf2FoundList != null) {
            return getDataTable(pf2FoundList);
        }
        return getDataTable(new LinkedList<>());
    }
}
