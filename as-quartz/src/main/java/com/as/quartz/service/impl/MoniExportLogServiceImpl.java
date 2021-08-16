package com.as.quartz.service.impl;

import com.as.common.constant.Constants;
import com.as.common.core.text.Convert;
import com.as.common.utils.ShiroUtils;
import com.as.quartz.domain.MoniExportLog;
import com.as.quartz.domain.MoniJobLog;
import com.as.quartz.mapper.MoniExportLogMapper;
import com.as.quartz.service.IMoniExportLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 自动报表任务LOGService业务层处理
 *
 * @author kolin
 * @date 2021-07-23
 */
@Service
public class MoniExportLogServiceImpl implements IMoniExportLogService {
    @Autowired
    private MoniExportLogMapper moniExportLogMapper;

    /**
     * 查询自动报表任务LOG
     *
     * @param id 自动报表任务LOGID
     * @return 自动报表任务LOG
     */
    @Override
    public MoniExportLog selectMoniExportLogById(Long id) {
        return moniExportLogMapper.selectMoniExportLogById(id);
    }

    /**
     * 查询自动报表任务LOG列表
     *
     * @param moniExportLog 自动报表任务LOG
     * @return 自动报表任务LOG
     */
    @Override
    public List<MoniExportLog> selectMoniExportLogList(MoniExportLog moniExportLog) {
        return moniExportLogMapper.selectMoniExportLogList(moniExportLog);
    }

    /**
     * 新增自动报表任务LOG
     *
     * @param moniExportLog 自动报表任务LOG
     * @return 结果
     */
    @Override
    public int addExportLog(MoniExportLog moniExportLog) {
        return moniExportLogMapper.insertMoniExportLog(moniExportLog);
    }

    /**
     * 修改自动报表任务LOG
     *
     * @param moniExportLog 自动报表任务LOG
     * @return 结果
     */
    @Override
    public int updateMoniExportLog(MoniExportLog moniExportLog) {
        return moniExportLogMapper.updateMoniExportLog(moniExportLog);
    }

    /**
     * 删除自动报表任务LOG对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMoniExportLogByIds(String ids) {
        return moniExportLogMapper.deleteMoniExportLogByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除自动报表任务LOG信息
     *
     * @param id 自动报表任务LOGID
     * @return 结果
     */
    @Override
    public int deleteMoniExportLogById(Long id) {
        return moniExportLogMapper.deleteMoniExportLogById(id);
    }

    /**
     * 清空任务日志
     */
    @Override
    public void cleanExportJobLog() {
        moniExportLogMapper.cleanExportJobLog();
    }

    /**
     * 查询Export任務未成功LOG
     *
     * @return Export任務集合
     */
    @Override
    public List<MoniExportLog> selectMoniExportLogListNoSuccess() {
        return moniExportLogMapper.selectMoniExportLogListNoSuccess();
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
        MoniExportLog moniExportLog = moniExportLogMapper.selectMoniExportLogById(id);
        moniExportLog.setOperator(ShiroUtils.getSysUser().getLoginName());
        return moniExportLogMapper.callbackExportJobLog(moniExportLog);
    }
}
