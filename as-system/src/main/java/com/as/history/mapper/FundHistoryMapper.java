package com.as.history.mapper;

import com.as.history.domain.FundHistory;

import java.util.List;
import java.util.Map;

/**
 * 客户历史盈亏数据Mapper接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface FundHistoryMapper {
    /**
     * 查询PF1资金来源
     *
     * @return PF1资金来源
     */
    public List<FundHistory> getFundHistory(Map<String, Object> map);

    /**
     * 查询PF1资金来源总和
     *
     * @return PF1资金来源总和
     */
    public List<FundHistory> getFundHistorySummary(Map<String, Object> map);

}
