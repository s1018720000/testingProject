package com.as.fundList.service;

import com.as.fundList.domain.PF1FundList;

import java.util.List;

/**
 * PF1资金对账Service接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface IPF1FundListService {
    /**
     * 查询PF1资金对账
     *
     * @return PF1资金对账
     */
    public List<PF1FundList> getPF1FundList(String[] accounts);


}
