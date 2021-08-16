package com.as.quartz.service.impl;

import com.as.common.constant.Constants;
import com.as.common.core.text.Convert;
import com.as.common.utils.ShiroUtils;
import com.as.quartz.domain.MoniElasticLog;
import com.as.quartz.domain.MoniExportLog;
import com.as.quartz.mapper.MoniElasticLogMapper;
import com.as.quartz.service.IMoniElasticLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ElasticSearch任务LOGService业务层处理
 *
 * @author kolin
 * @date 2021-07-28
 */
@Service
public class MoniElasticLogServiceImpl implements IMoniElasticLogService {
    @Autowired
    private MoniElasticLogMapper moniElasticLogMapper;

    /**
     * 查询ElasticSearch任务LOG
     *
     * @param id ElasticSearch任务LOGID
     * @return ElasticSearch任务LOG
     */
    @Override
    public MoniElasticLog selectMoniElasticLogById(Long id) {
        return moniElasticLogMapper.selectMoniElasticLogById(id);
    }

    /**
     * 查询ElasticSearch任务LOG列表
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return ElasticSearch任务LOG
     */
    @Override
    public List<MoniElasticLog> selectMoniElasticLogList(MoniElasticLog moniElasticLog) {
        return moniElasticLogMapper.selectMoniElasticLogList(moniElasticLog);
    }

    /**
     * 新增ElasticSearch任务LOG
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return 结果
     */
    @Override
    public int addJobLog(MoniElasticLog moniElasticLog) {
        return moniElasticLogMapper.insertMoniElasticLog(moniElasticLog);
    }

    /**
     * 修改ElasticSearch任务LOG
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return 结果
     */
    @Override
    public int updateMoniElasticLog(MoniElasticLog moniElasticLog) {
        return moniElasticLogMapper.updateMoniElasticLog(moniElasticLog);
    }

    /**
     * 删除ElasticSearch任务LOG对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMoniElasticLogByIds(String ids) {
        return moniElasticLogMapper.deleteMoniElasticLogByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除ElasticSearch任务LOG信息
     *
     * @param id ElasticSearch任务LOGID
     * @return 结果
     */
    @Override
    public int deleteMoniElasticLogById(Long id) {
        return moniElasticLogMapper.deleteMoniElasticLogById(id);
    }

    /**
     * 查询ElasticSearch任务未成功LOG
     *
     * @return ElasticSearch任务LOG集合
     */
    @Override
    public List<MoniElasticLog> selectMoniElasticLogListNoSuccess() {
        return moniElasticLogMapper.selectMoniElasticLogListNoSuccess();
    }

    /**
     * 清空任务日志
     */
    @Override
    public void cleanElasticJobLog() {
        moniElasticLogMapper.cleanElasticJobLog();
    }

    /**
     * 回调
     *
     * @param id
     * @return
     */
    @Override
    @Transactional
    public int callback(Long id) {
        MoniElasticLog moniElasticLog = moniElasticLogMapper.selectMoniElasticLogById(id);
        moniElasticLog.setAlertStatus(Constants.FAIL);
        moniElasticLog.setOperator(ShiroUtils.getSysUser().getLoginName());
        return moniElasticLogMapper.callbackElasticLog(moniElasticLog);
    }
}
