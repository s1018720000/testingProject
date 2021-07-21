package com.as.order.service;

import com.as.order.domain.PF2AccountInfo;
import com.as.order.domain.PF2OrderNumber;
import com.as.order.domain.PF2OrderNumberDetail;
import com.as.order.domain.PF2OrderNumberInfo;

import java.util.List;

/**
 * PF2订单查询Service接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface IPF2OrderNumberService {
    /**
     * 查询PF2订单 db
     *
     * @param orderNo PF2订单查询ID
     * @return PF2订单查询
     */
    public PF2OrderNumber selectPF2OrderNumberDB(String orderNo);

    /**
     * 查询PF2订单 rdc
     *
     * @param orderNo PF2订单查询ID
     * @return PF2订单查询
     */
    public PF2OrderNumber selectPF2OrderNumberRDC(String orderNo);

    /**
     * 查询PF2订单 详情
     *
     * @param orderNo PF2订单查询ID
     * @return PF2订单查询
     */
    public PF2OrderNumberDetail selectPF2OrderNumberDetail(String orderNo);

    /**
     *查询单倍投注注数
     * @param orderNo
     * @return
     */
    public String selectBetStakeByOrderNum(String orderNo);

    /**
     *查询投注信息
     * @param orderNo
     * @return
     */
    public List<PF2OrderNumberInfo> selectOrderInfoByOrderNum(String orderNo);

    /**
     *查询投注会员信息
     * @param orderNo
     * @return
     */
    public List<PF2AccountInfo> selectAccountInfoByOrderNum(String orderNo);
}
