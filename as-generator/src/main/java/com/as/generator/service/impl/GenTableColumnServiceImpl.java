package com.as.generator.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.as.common.core.text.Convert;
import com.as.generator.domain.GenTableColumn;
import com.as.generator.mapper.GenTableColumnMapper;
import com.as.generator.service.IGenTableColumnService;

/**
 * 业务字段 服务层实现
 * 
 * @author kolin
 */
@Service
public class GenTableColumnServiceImpl implements IGenTableColumnService
{
    @Autowired
    private GenTableColumnMapper genTableColumnMapper;

    /**
     * 查询业务字段列表
     * 
     * @param genTableColumn 业务字段信息
     * @return 业务字段集合
     */
    @Override
    public List<GenTableColumn> selectGenTableColumnListByTableId(GenTableColumn genTableColumn)
    {
        return genTableColumnMapper.selectGenTableColumnListByTableId(genTableColumn);
    }

    /**
     * 新增业务字段
     * 
     * @param genTableColumn 业务字段信息
     * @return 结果
     */
    @Override
    public int insertGenTableColumn(GenTableColumn genTableColumn)
    {
        return genTableColumnMapper.insertGenTableColumn(genTableColumn);
    }

    /**
     * 修改业务字段
     * 
     * @param genTableColumn 业务字段信息
     * @return 结果
     */
    @Override
    public int updateGenTableColumn(GenTableColumn genTableColumn)
    {
        return genTableColumnMapper.updateGenTableColumn(genTableColumn);
    }

    /**
     * 删除业务字段对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteGenTableColumnByIds(String ids)
    {
        return genTableColumnMapper.deleteGenTableColumnByIds(Convert.toLongArray(ids));
    }
}