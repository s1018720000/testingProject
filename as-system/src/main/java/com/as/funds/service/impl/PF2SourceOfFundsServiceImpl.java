package com.as.funds.service.impl;

import com.as.common.annotation.DataSource;
import com.as.common.enums.DataSourceType;
import com.as.funds.domain.PF2SourceOfFunds;
import com.as.funds.domain.PF2SourceOfFundsSummary;
import com.as.funds.mapper.PF2SourceOfFundsMapper;
import com.as.funds.service.IPF2SourceOfFundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * PF2资金来源Service业务层处理
 *
 * @author kolin
 * @date 2021-07-05
 */
@Service
@DataSource(value = DataSourceType.PF2_DW)
public class PF2SourceOfFundsServiceImpl implements IPF2SourceOfFundsService {
    @Autowired
    private PF2SourceOfFundsMapper pf2SourceOfFundsMapper;

    @Override
    public List<PF2SourceOfFunds> getPF2SourceOfFound(Map<String, Object> map) {
        return pf2SourceOfFundsMapper.getPF2SourceOfFound(map);
    }

    @Override
    public List<PF2SourceOfFundsSummary> getPF2SourceOfFoundSummary(Map<String, Object> map) {
        return pf2SourceOfFundsMapper.getPF2SourceOfFoundSummary(map);
    }
}
