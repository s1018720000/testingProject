package com.as.quartz.service;

import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Map;

/**
 * 定时任务调度 公共服务层
 *
 * @author kolin
 */
public interface ISysJobService {

    /**
     * 校验cron表达式是否有效
     *
     * @param cronExpression 表达式
     * @return 结果
     */
    public boolean checkCronExpressionIsValid(String cronExpression);

    /**
     * 校验cron表达式是否有效
     *
     * @param script sql
     * @param jdbc   数据源
     * @return 结果
     */
    public boolean sqlTest(String script, String jdbc);

    /**
     * 获取JDBC MAP
     *
     * @return 结果
     */
    public Map<String, JdbcTemplate> getJdbcMap();
}