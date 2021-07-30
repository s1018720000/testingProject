package com.as.web.controller.order;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.order.domain.PF1OrderNumber;
import com.as.order.domain.PF1OrderNumberData;
import com.as.order.service.IPF1OrderNumberService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.LinkedList;
import java.util.List;

/**
 * PF1订单查询Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/order/pf1")
public class PF1OrderNumberController extends BaseController {
    private String prefix = "order";

    @Autowired
    private IPF1OrderNumberService pf1OrderNumberService;

    @RequiresPermissions("order:pf1:view")
    @GetMapping()
    public String pf1() {
        return prefix + "/pf1";
    }

    /**
     * 查询PF1订单列表
     */
    @RequiresPermissions("order:pf1:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(@Validated PF1OrderNumber pf1OrderNumber) {
        PF1OrderNumber result = pf1OrderNumberService.selectPF1OrderNumber(pf1OrderNumber.getOrderNo());
        if (result != null) {
            List<PF1OrderNumberData> list = getPf1OrderNumberData(result);
            return getDataTable(list);
        }
        return getDataTable(new LinkedList<>());
    }

    private List<PF1OrderNumberData> getPf1OrderNumberData(PF1OrderNumber pf1OrderNumber) {
        List<PF1OrderNumberData> list = new LinkedList<>();
        PF1OrderNumberData pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("系列模式(Series)");
        pf1OrderNumberData.setDbValue(Integer.toString((int)((Double.parseDouble(pf1OrderNumber.getSeriesValue()) + 1) * 1000)));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("玩法ID(Play ID)");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getSortId()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("是否追號(IS Chase)[0:不追號/No、1:追號/Yes、2:預選號/Pre-selection]");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getRecall()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("追號起始號(Chase Start)");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getRestarNo()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("追號倍數(Multiples)");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getTotalTimes()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("中獎後停止(Winning Stop)[0:否/No、1:是/Yes]");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getWinStop()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("出號即放棄(Abandoned)[0:否/No、1:是/Yes]");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getWinQuit()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("訂單號(Order Number)");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getOrderNo()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("當前用戶名(Account)");
        pf1OrderNumberData.setDbValue(String.valueOf(pf1OrderNumber.getAccount()));
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        pf1OrderNumberData = new PF1OrderNumberData();
        pf1OrderNumberData.setColumnName("投註詳情(Betting Content)");
        pf1OrderNumberData.setDbValue(null);
        pf1OrderNumberData.setLogValue(null);
        list.add(pf1OrderNumberData);
        return list;
    }
}
