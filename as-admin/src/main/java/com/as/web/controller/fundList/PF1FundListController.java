package com.as.web.controller.fundList;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.fundList.domain.PF1FundList;
import com.as.fundList.service.IPF1FundListService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

/**
 * PF1资金对账Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/fundList/pf1")
public class PF1FundListController extends BaseController {
    private String prefix = "fundList";

    @Autowired
    private IPF1FundListService pf1FundListService;

    @RequiresPermissions("fundList:pf1:view")
    @GetMapping()
    public String pf1() {
        return prefix + "/pf1";
    }

    /**
     * 查询PF1资金对账
     */
    @RequiresPermissions("fundList:pf1:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@RequestParam(name = "account") String account) {
        List<PF1FundList> pf1FoundList = pf1FundListService.getPF1FundList(account);
        if (pf1FoundList != null) {
            return getDataTable(pf1FoundList);
        }
        return getDataTable(new LinkedList<>());
    }
}
