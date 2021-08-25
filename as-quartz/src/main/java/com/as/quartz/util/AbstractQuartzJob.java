package com.as.quartz.util;

import com.as.common.constant.ScheduleConstants;
import com.as.common.utils.StringUtils;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 定时任务执行类基类，由子类实现
 *
 * @author kolin
 */
public abstract class AbstractQuartzJob implements Job {
    private static final Logger log = LoggerFactory.getLogger(AbstractQuartzJob.class);

    /**
     * ID
     */
    protected String id;

    /**
     * 计划任务
     */
    protected Object JobContent;

    /**
     * 执行频率
     */
    protected String cronExpression;

    /**
     * 平台  用平台做 job group
     */
    protected String jobPlatform;

    /**
     * 状态
     */
    protected String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Object getJobContent() {
        return JobContent;
    }

    public void setJobContent(Object jobContent) {
        JobContent = jobContent;
    }

    public String getCronExpression() {
        return cronExpression;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    public String getJobPlatform() {
        return jobPlatform;
    }

    public void setJobPlatform(String jobPlatform) {
        this.jobPlatform = jobPlatform;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public void execute(JobExecutionContext context) {
        Object job = context.getMergedJobDataMap().get(ScheduleConstants.TASK_PROPERTIES);
        try {
            if (StringUtils.isNotNull(job)) {
                before(context, job);
                doExecute(context, job);
                after(context, job, null);
            }
        } catch (Exception e) {
            log.error("任务执行异常  - ：", e);
            after(context, job, e);
        } finally {
            doFinally(context, job);
        }
    }

    /**
     * 执行前方法，由子类重载
     *
     * @param context 工作执行上下文对象
     */
    protected abstract void before(JobExecutionContext context, Object job);

    /**
     * 执行后方法，由子类重载
     *
     * @param context 工作执行上下文对象
     * @param job     系统计划任务
     */
    protected abstract void after(JobExecutionContext context, Object job, Exception e);

    /**
     * 执行方法，由子类重载
     *
     * @param context 工作执行上下文对象
     * @param job     系统计划任务
     * @throws Exception 执行过程中的异常
     */
    protected abstract void doExecute(JobExecutionContext context, Object job) throws Exception;

    /**
     * finally中执行方法，由子类重载
     *
     * @param context 工作执行上下文对象
     * @param job     系统计划任务
     * @throws Exception 执行过程中的异常
     */
    protected abstract void doFinally(JobExecutionContext context, Object job);

}
