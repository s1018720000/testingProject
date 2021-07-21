package com.as.order.service;

import java.util.List;
import com.as.order.domain.PF1OrderNumber;

/**
 * PF1订单查询Service接口
 * 
 * @author kolin
 * @date 2021-07-05
 */
public interface IPF1OrderNumberService 
{
    /**
     * 查询PF1订单查询
     * 
     * @param orderNo PF1订单查询ID
     * @return PF1订单查询
     */
    public PF1OrderNumber selectPF1OrderNumber(String orderNo);
}
