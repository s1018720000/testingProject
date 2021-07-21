package com.as.web.controller.order;

import com.as.common.core.controller.BaseController;
import com.as.common.core.page.TableDataInfo;
import com.as.order.domain.*;
import com.as.order.service.IPF2OrderNumberService;
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
 * PF2订单查询Controller
 *
 * @author kolin
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/order/pf2")
public class PF2OrderNumberController extends BaseController {
    private String prefix = "order/pf2";

    @Autowired
    private IPF2OrderNumberService pf2OrderNumberService;

    @RequiresPermissions("order:pf2:view")
    @GetMapping()
    public String pf2() {
        return prefix + "/pf2";
    }

    /**
     * 查询PF2订单列表
     */
    @RequiresPermissions("order:pf2:list")
    @PostMapping("/listContent")
    @ResponseBody
    public TableDataInfo listContent(@Validated PF2OrderNumber pf2OrderNumber) {
        PF2OrderNumber resultDB = pf2OrderNumberService.selectPF2OrderNumberDB(pf2OrderNumber.getOrderNo());
        PF2OrderNumber resultRDC = pf2OrderNumberService.selectPF2OrderNumberRDC(pf2OrderNumber.getOrderNo());
        if (resultDB != null && resultRDC != null) {
            List<PF2OrderNumberData> list = getPf2OrderNumberData(resultDB, resultRDC);
            return getDataTable(list);
        }
        return getDataTable(new LinkedList<>());
    }

    /**
     * 查询PF2订单列表
     */
    @RequiresPermissions("order:pf2:list")
    @PostMapping("/listDetail")
    @ResponseBody
    public TableDataInfo listDetail(@Validated PF2OrderNumber pf2OrderNumber) {
        PF2OrderNumberDetail resultDetail = pf2OrderNumberService.selectPF2OrderNumberDetail(pf2OrderNumber.getOrderNo());
        String betStake = pf2OrderNumberService.selectBetStakeByOrderNum(pf2OrderNumber.getOrderNo());
        if (resultDetail != null) {
            List<PF2OrderNumberData> list = getPf2OrderNumberDataDetail(resultDetail, betStake);
            return getDataTable(list);
        }
        return getDataTable(new LinkedList<>());
    }

    /**
     * 查询PF2订单列表
     */
    @RequiresPermissions("order:pf2:list")
    @PostMapping("/listInfo")
    @ResponseBody
    public TableDataInfo listInfo(@Validated PF2OrderNumber pf2OrderNumber) {
        List<PF2OrderNumberInfo> pf2OrderNumberInfos = pf2OrderNumberService.selectOrderInfoByOrderNum(pf2OrderNumber.getOrderNo());
        return getDataTable(pf2OrderNumberInfos);
    }

    /**
     * 查询PF2订单列表
     */
    @RequiresPermissions("order:pf2:list")
    @PostMapping("/listAgent")
    @ResponseBody
    public TableDataInfo listAgent(@Validated PF2OrderNumber pf2OrderNumber) {
        List<PF2AccountInfo> pf2AccountInfos = pf2OrderNumberService.selectAccountInfoByOrderNum(pf2OrderNumber.getOrderNo());
        return getDataTable(pf2AccountInfos);
    }

    private List<PF2OrderNumberData> getPf2OrderNumberData(PF2OrderNumber pf2OrderNumberDB, PF2OrderNumber pf2OrderNumberRDC) {
        List<PF2OrderNumberData> list = new LinkedList<>();
        PF2OrderNumberData PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("系列模式(Series)");
        PF2OrderNumberData.setDbValue(pf2OrderNumberDB.getSeries());
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getSeries());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("彩種類別(Game)");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getCode()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getCode());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("投注模式(Mode)[1元模式/yuan、 2角模式/dime、 3分模式/penny、 4十模式/ten、 5百模式/hundred]");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getBetMode()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getBetMode());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("總追號數(Total Chase)");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getTotalChasePhases()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getTotalChasePhases());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("投注期號(Numero)");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getNumero()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getNumero());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("追號即停(Winning Stop)[0:否/No、1:是/Yes]");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getWinningStop()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getWinningStop());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("出號即放棄(Abandoned)[0:否/No、1:是/Yes]");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getAbandoning()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getAbandoning());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("追號倍數(Chase Times)");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getMultiple()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getMultiple());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("投註時間(Betting Time)");
        PF2OrderNumberData.setDbValue(String.valueOf(pf2OrderNumberDB.getCreateTime()));
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getCreateTime());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("投註IP(IP)");
        PF2OrderNumberData.setDbValue(pf2OrderNumberDB.getClientIp());
        PF2OrderNumberData.setRdcValue(pf2OrderNumberRDC.getClientIp());
        list.add(PF2OrderNumberData);
        return list;
    }

    private List<PF2OrderNumberData> getPf2OrderNumberDataDetail(PF2OrderNumberDetail pf2OrderNumberDetail, String betStake) {
        List<PF2OrderNumberData> list = new LinkedList<>();
        PF2OrderNumberData PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("單倍投註註數(Bet Stake)");
        PF2OrderNumberData.setDbValue(betStake);
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("投註倍數(Bet Times)");
        PF2OrderNumberData.setDbValue(pf2OrderNumberDetail.getMultiple());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("投註金額(Bet Amount)");
        PF2OrderNumberData.setDbValue(pf2OrderNumberDetail.getBetAmount());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("開獎號碼(Winning Number)");
        PF2OrderNumberData.setDbValue(pf2OrderNumberDetail.getWinningNumber());
        list.add(PF2OrderNumberData);
        PF2OrderNumberData = new PF2OrderNumberData();
        PF2OrderNumberData.setColumnName("中獎金額(Winning Prize)");
        PF2OrderNumberData.setDbValue(pf2OrderNumberDetail.getWinAmount());
        list.add(PF2OrderNumberData);
        return list;
    }
}
