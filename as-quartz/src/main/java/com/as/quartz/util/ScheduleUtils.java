package com.as.quartz.util;

import com.as.common.constant.ScheduleConstants;
import com.as.common.utils.spring.SpringUtils;
import com.as.quartz.service.ISysJobService;
import org.quartz.*;

/**
 * 定时任务工具类
 *
 * @author kolin
 */
public class ScheduleUtils {

    /**
     * 得到quartz任务类
     *
     * @param job 执行计划
     * @return 具体执行任务类
     */
    private static Class<? extends Job> getQuartzJobClass(AbstractQuartzJob job) {
        return job.getClass();
    }

    /**
     * 构建任务触发对象
     */
    public static TriggerKey getTriggerKey(String jobId, String jobGroup) {
        return TriggerKey.triggerKey(jobId, jobGroup);
    }

    /**
     * 构建任务键对象
     */
    public static JobKey getJobKey(String jobCode, String jobGroup) {
        return JobKey.jobKey(jobCode, jobGroup);
    }

    /**
     * 创建定时任务
     */
    public static void createScheduleJob(Scheduler scheduler, AbstractQuartzJob job) throws SchedulerException {
        Class<? extends Job> jobClass = getQuartzJobClass(job);
        // 构建job信息
        String jobCode = job.toString();
        String jobGroup = job.getJobPlatform();
        JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(getJobKey(jobCode, jobGroup)).build();

        // 表达式调度构建器
        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

        // 按新的cronExpression表达式构建一个新的trigger
        CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(getTriggerKey(jobCode, jobGroup))
                .withSchedule(cronScheduleBuilder).build();

        // 放入参数，运行时的方法可以获取
        jobDetail.getJobDataMap().put(ScheduleConstants.TASK_PROPERTIES, job.getJobContent());

        // 判断是否存在
        if (scheduler.checkExists(getJobKey(jobCode, jobGroup))) {
            // 防止创建时存在数据问题 先移除，然后在执行创建操作
            scheduler.deleteJob(getJobKey(jobCode, jobGroup));
        }

        scheduler.scheduleJob(jobDetail, trigger);

        // 暂停任务
        if (job.getStatus().equals(ScheduleConstants.Status.PAUSE.getValue())) {
            scheduler.pauseJob(ScheduleUtils.getJobKey(jobCode, jobGroup));
        }
    }

}