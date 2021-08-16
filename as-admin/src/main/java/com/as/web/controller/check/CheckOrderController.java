package com.as.web.controller.check;

import com.as.checkOrder.domain.CheckOrder;
import com.as.checkOrder.domain.OdsCheckOrder;
import com.as.checkOrder.service.ICheckOrderService;
import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

/**
 * 多平台订单比对Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/check/order")
public class CheckOrderController extends BaseController {
    private String prefix = "checkOrder";

    @Autowired
    private ICheckOrderService checkOrderService;

    @RequiresPermissions("check:order:view")
    @GetMapping()
    public String checkOrder() {
        return prefix + "/checkOrder";
    }

    /**
     * 多平台订单比对
     */
    @RequiresPermissions("check:order:list")
    @PostMapping("/listPlatform")
    @ResponseBody
    public TableDataInfo listPlatform(@RequestParam(name = "account") String account) {
        LinkedList<Object> list = new LinkedList<>();
        CheckOrder pf1CheckOrder = checkOrderService.findAllPf1ByAccounts(account);
        CheckOrder pf2CheckOrder = checkOrderService.findAllPf2ByAccounts(account);
        if (StringUtils.isNotNull(pf1CheckOrder)) {
            list.add(pf1CheckOrder);
        }
        if (StringUtils.isNotNull(pf2CheckOrder)) {
            list.add(pf2CheckOrder);
        }
        return getDataTable(list);
    }

    @RequiresPermissions("check:order:list")
    @PostMapping("/listAll")
    @ResponseBody
    public TableDataInfo listAll(@RequestParam(name = "account") String account) {
        List<OdsCheckOrder> odsCheckOrders = checkOrderService.findAllOdsByAccounts(account);
        if (StringUtils.isNotNull(odsCheckOrders)) {
            return getDataTable(odsCheckOrders);
        }
        return getDataTable(new LinkedList<>());
    }
}
