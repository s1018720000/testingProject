package com.as.quartz.service.impl;

import com.as.common.core.text.Convert;
import com.as.quartz.domain.MoniApiLog;
import com.as.quartz.mapper.MoniApiLogMapper;
import com.as.quartz.service.IMoniApiLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 自动API检测任务LOGService业务层处理
 *
 * @author kolin
 * @date 2021-07-26
 */
@Service
public class MoniApiLogServiceImpl implements IMoniApiLogService {
    @Autowired
    private MoniApiLogMapper moniApiLogMapper;

    /**
     * 查询自动API检测任务LOG
     *
     * @param id 自动API检测任务LOGID
     * @return 自动API检测任务LOG
     */
    @Override
    public MoniApiLog selectMoniApiLogById(Long id) {
        return moniApiLogMapper.selectMoniApiLogById(id);
    }

    /**
     * 查询自动API检测任务LOG列表
     *
     * @param moniApiLog 自动API检测任务LOG
     * @return 自动API检测任务LOG
     */
    @Override
    public List<MoniApiLog> selectMoniApiLogList(MoniApiLog moniApiLog) {
        return moniApiLogMapper.selectMoniApiLogList(moniApiLog);
    }

    /**
     * 查询自动API检测任务未成功LOG
     *
     * @return 自动API检测任务LOG集合
     */
    @Override
    public List<MoniApiLog> selectMoniApiLogListNoSuccess() {
        return moniApiLogMapper.selectMoniApiLogListNoSuccess();
    }


    /**
     * 新增自动API检测任务LOG
     *
     * @param moniApiLog 自动API检测任务LOG
     * @return 结果
     */
    @Override
    public int addJobLog(MoniApiLog moniApiLog) {
        return moniApiLogMapper.insertMoniApiLog(moniApiLog);
    }

    /**
     * 修改自动API检测任务LOG
     *
     * @param moniApiLog 自动API检测任务LOG
     * @return 结果
     */
    @Override
    public int updateMoniApiLog(MoniApiLog moniApiLog) {
        return moniApiLogMapper.updateMoniApiLog(moniApiLog);
    }

    /**
     * 删除自动API检测任务LOG对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMoniApiLogByIds(String ids) {
        return moniApiLogMapper.deleteMoniApiLogByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除自动API检测任务LOG信息
     *
     * @param id 自动API检测任务LOGID
     * @return 结果
     */
    @Override
    public int deleteMoniApiLogById(Long id) {
        return moniApiLogMapper.deleteMoniApiLogById(id);
    }

    /**
     * 清空任务日志
     */
    @Override
    public void cleanApiJobLog() {
        moniApiLogMapper.cleanApiJobLog();
    }
}
