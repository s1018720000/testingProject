package com.as.quartz.service;

import com.as.quartz.domain.MoniExportLog;
import com.as.quartz.domain.MoniJobLog;

import java.util.List;

/**
 * 自动报表任务LOGService接口
 * 
 * @author kolin
 * @date 2021-07-23
 */
public interface IMoniExportLogService 
{
    /**
     * 查询自动报表任务LOG
     * 
     * @param id 自动报表任务LOGID
     * @return 自动报表任务LOG
     */
    public MoniExportLog selectMoniExportLogById(Long id);

    /**
     * 查询自动报表任务LOG列表
     * 
     * @param moniExportLog 自动报表任务LOG
     * @return 自动报表任务LOG集合
     */
    public List<MoniExportLog> selectMoniExportLogList(MoniExportLog moniExportLog);

    /**
     * 新增自动报表任务LOG
     * 
     * @param moniExportLog 自动报表任务LOG
     * @return 结果
     */
    public int addExportLog(MoniExportLog moniExportLog);

    /**
     * 修改自动报表任务LOG
     * 
     * @param moniExportLog 自动报表任务LOG
     * @return 结果
     */
    public int updateMoniExportLog(MoniExportLog moniExportLog);

    /**
     * 批量删除自动报表任务LOG
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMoniExportLogByIds(String ids);

    /**
     * 删除自动报表任务LOG信息
     * 
     * @param id 自动报表任务LOGID
     * @return 结果
     */
    public int deleteMoniExportLogById(Long id);

    /**
     * 清空任务日志
     */
    public void cleanExportJobLog();

    /**
     * 查询Export任務未成功LOG
     *
     * @return Export任務集合
     */
    List<MoniExportLog> selectMoniExportLogListNoSuccess();

    /**
     * 回调
     */
    public int callback(Long id);
}
