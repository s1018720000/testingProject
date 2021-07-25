package com.as.quartz.mapper;

import com.as.quartz.domain.MoniExport;

import java.util.List;

/**
 * 自动报表任务Mapper接口
 *
 * @author kolin
 * @date 2021-07-23
 */
public interface MoniExportMapper {
    /**
     * 查询自动报表任务
     *
     * @param id 自动报表任务ID
     * @return 自动报表任务
     */
    public MoniExport selectMoniExportById(Long id);

    /**
     * 查询自动报表任务列表
     *
     * @param moniExport 自动报表任务
     * @return 自动报表任务集合
     */
    public List<MoniExport> selectMoniExportList(MoniExport moniExport);

    /**
     * 新增自动报表任务
     *
     * @param moniExport 自动报表任务
     * @return 结果
     */
    public int insertMoniExport(MoniExport moniExport);

    /**
     * 修改自动报表任务
     *
     * @param moniExport 自动报表任务
     * @return 结果
     */
    public int updateMoniExport(MoniExport moniExport);

    /**
     * 查询全部Export任务
     *
     * @return
     */
    public List<MoniExport> selectMoniExportAll();

    /**
     * 删除自动报表任务
     *
     * @param id 自动报表任务ID
     * @return 结果
     */
    public int deleteMoniExportById(Long id);

    /**
     * 修改最后导出时间
     *
     * @param moniExport
     */
    int updateMoniExportLastExportTime(MoniExport moniExport);
}
