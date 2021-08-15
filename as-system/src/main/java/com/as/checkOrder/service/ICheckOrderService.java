package com.as.checkOrder.service;

import com.as.checkOrder.domain.CheckOrder;
import com.as.checkOrder.domain.OdsCheckOrder;

import java.util.List;

/**
 * 多平台订单比对Service接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface ICheckOrderService {

    public CheckOrder findAllPf1ByAccounts(String account);

    public CheckOrder findAllPf2ByAccounts(String account);

    public List<OdsCheckOrder> findAllOdsByAccounts(String account);


}
