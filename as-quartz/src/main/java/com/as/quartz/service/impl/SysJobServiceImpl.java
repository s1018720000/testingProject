package com.as.quartz.service.impl;

import com.as.quartz.domain.MoniJob;
import com.as.quartz.job.MoniJobExecution;
import com.as.quartz.mapper.MoniJobMapper;
import com.as.quartz.service.ISysJobService;
import com.as.quartz.util.CronUtils;
import com.as.quartz.util.ScheduleUtils;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定时任务调度 公共服务层
 *
 * @author kolin
 */
@Service
public class SysJobServiceImpl implements ISysJobService {
    @Autowired
    private Scheduler scheduler;

    @Autowired
    private MoniJobMapper moniJobMapper;


    @Autowired
    @Qualifier("masterDataSource")
    DataSource masterDataSource;

    @Autowired
    @Qualifier("pf1DataSource")
    DataSource pf1DataSource;

    @Autowired
    @Qualifier("pf1SecDataSource")
    DataSource pf1SecDataSource;

    @Autowired
    @Qualifier("pf2CoreDataSource")
    DataSource pf2CoreDataSource;

    @Autowired
    @Qualifier("pf2CoreSecDataSource")
    DataSource pf2CoreSecDataSource;

    @Autowired
    @Qualifier("pf2DrawDataSource")
    DataSource pf2DrawDataSource;

    @Autowired
    @Qualifier("pf2DwDataSource")
    DataSource pf2DwDataSource;

    @Autowired
    @Qualifier("pf2OdsDataSource")
    DataSource pf2OdsDataSource;

    Map<String, JdbcTemplate> jdbcMap = new HashMap<String, JdbcTemplate>();

    /**
     * 项目启动时，初始化定时器
     * 主要是防止手动修改数据库导致未同步到定时任务处理（注：不能手动修改数据库ID和任务组名，否则会导致脏数据）
     */
    @PostConstruct
    public void init() throws SchedulerException {
        scheduler.clear();
        List<MoniJob> jobList = moniJobMapper.selectMoniJobAll();
        for (MoniJob job : jobList) {
            MoniJobExecution moniJobExecution = MoniJobExecution.buildJob(job);
            ScheduleUtils.createScheduleJob(scheduler, moniJobExecution);
        }
        setjdbcTemplateMap();
    }

    /**
     * 校验cron表达式是否有效
     *
     * @param cronExpression 表达式
     * @return 结果
     */
    @Override
    public boolean checkCronExpressionIsValid(String cronExpression) {
        return CronUtils.isValid(cronExpression);
    }

    @Override
    public boolean sqlTest(String script, String jdbc) {
        String sql;
        if (jdbc.toUpperCase().indexOf("MYSQL") >= 0) {
            sql = "SELECT COUNT(0) FROM ( " + script + ") t limit 1";
        } else {
            sql = "SELECT COUNT(0) FROM ( " + script + ") WHERE ROWNUM =1";
        }
        jdbcMap.get(jdbc.trim()).queryForList(sql);
        return true;
    }

    private void setjdbcTemplateMap() {
        jdbcMap.put("mysql-as-portal", new JdbcTemplate(masterDataSource));
        jdbcMap.put("ub8-pf1", new JdbcTemplate(pf1DataSource));
        jdbcMap.put("ub8-pf1-sec", new JdbcTemplate(pf1SecDataSource));
        jdbcMap.put("ub8-pf5-core", new JdbcTemplate(pf2CoreDataSource));
        jdbcMap.put("ub8-pf5-core-sec", new JdbcTemplate(pf2CoreSecDataSource));
        jdbcMap.put("ub8-pf5-draw", new JdbcTemplate(pf2DrawDataSource));
        jdbcMap.put("ub8-pf5-ods", new JdbcTemplate(pf2OdsDataSource));
        jdbcMap.put("data-warehouse", new JdbcTemplate(pf2DwDataSource));
//        switch (database) {
//            case "mysql-as-portal":
//                jdbcTemplate = new JdbcTemplate(masterDataSource);
//                break;
//            case "ub8-pf1":
//                jdbcTemplate = new JdbcTemplate(pf1DataSource);
//                break;
//            case "ub8-pf1-sec":
//                jdbcTemplate = new JdbcTemplate(pf1SecDataSource);
//                break;
//            case "ub8-pf5-core":
//                jdbcTemplate = new JdbcTemplate(pf2CoreDataSource);
//                break;
//            case "ub8-pf5-core-sec":
//                jdbcTemplate = new JdbcTemplate(pf2CoreSecDataSource);
//                break;
//            case "ub8-pf5-draw":
//                jdbcTemplate = new JdbcTemplate(pf2DrawDataSource);
//                break;
//            case "ub8-pf5-ods":
//                jdbcTemplate = new JdbcTemplate(pf2OdsDataSource);
//                break;
//            case "data-warehouse":
//                jdbcTemplate = new JdbcTemplate(pf2DwDataSource);
//                break;
//        }
    }

    public Map<String, JdbcTemplate> getJdbcMap() {
        return jdbcMap;
    }
}