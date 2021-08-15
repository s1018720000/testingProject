package com.as.checkOrder.mapper;

import com.as.checkOrder.domain.CheckOrder;
import com.as.checkOrder.domain.OdsCheckOrder;

import java.util.List;

/**
 * 多平台订单比对Mapper接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface CheckOrderMapper {

    public CheckOrder findAllPf1ByAccounts(String account);

    public CheckOrder findAllPf2ByAccounts(String account);

    public List<OdsCheckOrder> findAllOdsByAccounts(String account);

}
