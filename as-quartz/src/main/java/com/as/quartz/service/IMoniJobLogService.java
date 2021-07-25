package com.as.quartz.service;

import com.as.quartz.domain.MoniJobLog;

import java.util.List;

/**
 * SQL检测任務LOGService接口
 * 
 * @author kolin
 * @date 2021-07-16
 */
public interface IMoniJobLogService 
{
    /**
     * 查询SQL检测任務LOG
     * 
     * @param id SQL检测任務LOGID
     * @return SQL检测任務LOG
     */
    public MoniJobLog selectMoniJobLogById(Long id);

    /**
     * 查询SQL检测任務LOG列表
     * 
     * @param moniJobLog SQL检测任務LOG
     * @return SQL检测任務LOG集合
     */
    public List<MoniJobLog> selectMoniJobLogList(MoniJobLog moniJobLog);

    /**
     * 查询SQL检测任務未成功LOG
     *
     * @return SQL检测任務LOG集合
     */
    public List<MoniJobLog> selectMoniJobLogListNoSuccess();

    /**
     * 新增SQL检测任務LOG
     *
     * @param moniJobLog 调度日志信息
     */
    public void addJobLog(MoniJobLog moniJobLog);

    /**
     * 更新SQL检测任務LOG
     *
     * @param moniJobLog 调度日志信息
     */
    public void updateJobLog(MoniJobLog moniJobLog);

    /**
     * 批量删除SQL检测任務LOG
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMoniJobLogByIds(String ids);

    /**
     * 删除SQL检测任務LOG信息
     * 
     * @param id SQL检测任務LOGID
     * @return 结果
     */
    public int deleteMoniJobLogById(Long id);

    /**
     * 清空任务日志
     */
    public void cleanSqlJobLog();

    /**
     * 回调
     */
    public int callback(Long id);
}
