package com.as.history.service.impl;

import com.as.common.annotation.DataSource;
import com.as.common.enums.DataSourceType;
import com.as.history.domain.FundHistory;
import com.as.history.mapper.FundHistoryMapper;
import com.as.history.service.IFundHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 客户历史盈亏数据Service业务层处理
 *
 * @author kolin
 * @date 2021-07-05
 */
@Service
@DataSource(value = DataSourceType.PF2_DW)
public class IFundHistoryServiceImpl implements IFundHistoryService {
    @Autowired
    private FundHistoryMapper fundHistoryMapper;

    @Override
    public List<FundHistory> getFundHistory(Map<String, Object> map) {
        return fundHistoryMapper.getFundHistory(map);
    }

    @Override
    public List<FundHistory> getFundHistorySummary(Map<String, Object> map) {
        return fundHistoryMapper.getFundHistorySummary(map);
    }

}
