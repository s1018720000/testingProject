package com.as.quartz.mapper;

import com.as.quartz.domain.MoniJobLog;

import java.util.List;

/**
 * SQL检测任務LOGMapper接口
 *
 * @author kolin
 * @date 2021-07-16
 */
public interface MoniJobLogMapper {
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
     * 新增SQL检测任務LOG
     *
     * @param moniJobLog SQL检测任務LOG
     * @return 结果
     */
    public int insertMoniJobLog(MoniJobLog moniJobLog);

    /**
     * 更新SQL检测任務LOG
     *
     * @param moniJobLog SQL检测任務LOG
     */
    public void updateMoniJobLog(MoniJobLog moniJobLog);

    /**
     * 删除SQL检测任務LOG
     *
     * @param id SQL检测任務LOGID
     * @return 结果
     */
    public int deleteMoniJobLogById(Long id);

    /**
     * 批量删除SQL检测任務LOG
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMoniJobLogByIds(String[] ids);

    /**
     * 清空任务日志
     */
    public void cleanSqlJobLog();

    /**
     * 回调
     *
     * @param moniJobLog
     * @return
     */
    public int callbackMoniJobLog(MoniJobLog moniJobLog);

    /**
     * 查询SQL检测任務未成功LOG
     *
     * @return SQL检测任務LOG集合
     */
    public List<MoniJobLog> selectMoniJobLogListNoSuccess();


    public List<MoniJobLog> selectLossByIds(String[] jobIds);
}
