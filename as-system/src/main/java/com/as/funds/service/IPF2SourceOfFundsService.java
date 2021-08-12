package com.as.funds.service;

import com.as.funds.domain.PF2SourceOfFunds;
import com.as.funds.domain.PF2SourceOfFundsSummary;

import java.util.List;
import java.util.Map;

/**
 * PF2资金来源Mapper接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface IPF2SourceOfFundsService {
    /**
     * 查询PF1资金来源
     *
     * @return PF1资金来源
     */
    public List<PF2SourceOfFunds> getPF2SourceOfFound(Map<String, Object> map);

    /**
     * 查询PF1资金来源总和
     *
     * @return PF1资金来源总和
     */
    public List<PF2SourceOfFundsSummary> getPF2SourceOfFoundSummary(Map<String, Object> map);
}
