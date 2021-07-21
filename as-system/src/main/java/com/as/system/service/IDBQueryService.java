package com.as.system.service;

import java.util.List;
import java.util.Map;

/**
 * DB 数据查询 服务层
 *
 * @author kolin
 */
public interface IDBQueryService {
    /**
     * as sql 查询
     *
     * @param script
     * @param database
     * @return
     */
    Map<String, Object> query(String script, String database);

    /**
     * sql 查询 列获取
     *
     * @return
     */
    String[] queryColumns(String script, String database);
}
