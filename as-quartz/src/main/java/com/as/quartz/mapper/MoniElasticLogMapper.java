package com.as.quartz.mapper;

import com.as.quartz.domain.MoniElasticLog;

import java.util.List;

/**
 * ElasticSearch任务LOGMapper接口
 *
 * @author kolin
 * @date 2021-07-28
 */
public interface MoniElasticLogMapper {
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
     * 新增ElasticSearch任务LOG
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return 结果
     */
    public int insertMoniElasticLog(MoniElasticLog moniElasticLog);

    /**
     * 修改ElasticSearch任务LOG
     *
     * @param moniElasticLog ElasticSearch任务LOG
     * @return 结果
     */
    public int updateMoniElasticLog(MoniElasticLog moniElasticLog);

    /**
     * 删除ElasticSearch任务LOG
     *
     * @param id ElasticSearch任务LOGID
     * @return 结果
     */
    public int deleteMoniElasticLogById(Long id);

    /**
     * 批量删除ElasticSearch任务LOG
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMoniElasticLogByIds(String[] ids);

    /**
     * 清空任务日志
     */
    public void cleanElasticJobLog();

    /**
     * 查询ElasticSearch任务未成功LOG
     *
     * @return ElasticSearch任务LOG集合
     */
    public List<MoniElasticLog> selectMoniElasticLogListNoSuccess();
}
