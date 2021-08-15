package com.as.history.service;

import com.as.history.domain.FundHistory;

import java.util.List;
import java.util.Map;

/**
 * 客户历史盈亏数据Service接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface IFundHistoryService {
    /**
     * 查询客户历史盈亏数据
     *
     * @return 客户历史盈亏数据
     */
    public List<FundHistory> getFundHistory(Map<String, Object> map);

    /**
     * 查询客户历史盈亏数据总和
     *
     * @return客户历史盈亏数据总和
     */
    public List<FundHistory> getFundHistorySummary(Map<String, Object> map);

}
