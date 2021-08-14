package com.as.fundList.mapper;

import com.as.fundList.domain.PF2FundList;

import java.util.List;

/**
 * PF2资金对账Mapper接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface PF2FundListMapper {
    /**
     * 查询PF2资金对账
     *
     * @return PF2资金对账
     */
    public List<PF2FundList> getPF2FundList(String[] accounts);

}
