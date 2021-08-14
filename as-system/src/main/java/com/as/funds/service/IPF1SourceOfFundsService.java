package com.as.funds.service;

import com.as.funds.domain.PF1SourceOfFunds;
import com.as.funds.domain.PF1SourceOfFundsSummary;

import java.util.List;
import java.util.Map;

/**
 * PF1资金来源Service接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface IPF1SourceOfFundsService {
    /**
     * 查询PF1资金来源
     *
     * @return PF1资金来源
     */
    public List<PF1SourceOfFunds> getPF1SourceOfFound(Map<String, Object> map);

    /**
     * 查询PF1资金来源总和
     *
     * @return PF1资金来源总和
     */
    public List<PF1SourceOfFundsSummary> getPF1SourceOfFoundSummary(Map<String, Object> map);

}
