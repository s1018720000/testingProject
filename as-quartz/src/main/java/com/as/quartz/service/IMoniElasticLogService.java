package com.as.quartz.service;

import com.as.quartz.domain.MoniElasticLog;

import java.util.List;

/**
 * ElasticSearch任务LOGService接口
 *
 * @author kolin
 * @date 2021-07-28
 */
public interface IMoniElasticLogService {
    /**
     * 查询ElasticSearch任务LOG
     *
     * @param id ElasticSearch任务LOGID
     * @return ElasticSearch任务LOG
     */
    public MoniElasticLog selectMoniElasticLogById(Long id);

    /**
     * 查询ElasticSearch任务LOG列表
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return ElasticSearch任务LOG集合
     */
    public List<MoniElasticLog> selectMoniElasticLogList(MoniElasticLog moniElasticLog);

    /**
     * 查询ElasticSearch任务未成功LOG
     *
     * @return ElasticSearch任务LOG集合
     */
    public List<MoniElasticLog> selectMoniElasticLogListNoSuccess();

    /**
     * 新增ElasticSearch任务LOG
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return 结果
     */
    public int addJobLog(MoniElasticLog moniElasticLog);

    /**
     * 修改ElasticSearch任务LOG
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return 结果
     */
    public int updateMoniElasticLog(MoniElasticLog moniElasticLog);

    /**
     * 批量删除ElasticSearch任务LOG
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMoniElasticLogByIds(String ids);

    /**
     * 删除ElasticSearch任务LOG信息
     *
     * @param id ElasticSearch任务LOGID
     * @return 结果
     */
    public int deleteMoniElasticLogById(Long id);

    /**
     * 清空任务日志
     */
    public void cleanElasticJobLog();
}
