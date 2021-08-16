package com.as.quartz.mapper;

import java.util.List;
import com.as.quartz.domain.MoniApiLog;
import com.as.quartz.domain.MoniExportLog;
import com.as.quartz.domain.MoniJobLog;

/**
 * 自动API检测任务LOGMapper接口
 * 
 * @author kolin
 * @date 2021-07-26
 */
public interface MoniApiLogMapper 
{
    /**
     * 查询自动API检测任务LOG
     * 
     * @param id 自动API检测任务LOGID
     * @return 自动API检测任务LOG
     */
    public MoniApiLog selectMoniApiLogById(Long id);

    /**
     * 查询自动API检测任务LOG列表
     * 
     * @param moniApiLog 自动API检测任务LOG
     * @return 自动API检测任务LOG集合
     */
    public List<MoniApiLog> selectMoniApiLogList(MoniApiLog moniApiLog);

    /**
     * 新增自动API检测任务LOG
     * 
     * @param moniApiLog 自动API检测任务LOG
     * @return 结果
     */
    public int insertMoniApiLog(MoniApiLog moniApiLog);

    /**
     * 修改自动API检测任务LOG
     * 
     * @param moniApiLog 自动API检测任务LOG
     * @return 结果
     */
    public int updateMoniApiLog(MoniApiLog moniApiLog);

    /**
     * 删除自动API检测任务LOG
     * 
     * @param id 自动API检测任务LOGID
     * @return 结果
     */
    public int deleteMoniApiLogById(Long id);

    /**
     * 批量删除自动API检测任务LOG
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMoniApiLogByIds(String[] ids);

    /**
     * 清空任务日志
     */
    public void cleanApiJobLog();

    /**
     * 查询自动API检测未成功LOG
     *
     * @return 自动API检测LOG集合
     */
    public List<MoniApiLog> selectMoniApiLogListNoSuccess();

    /**
     * 回调
     *
     * @param moniApiLog
     * @return
     */
    public int callbackMoniApiLog(MoniApiLog moniApiLog);
}
