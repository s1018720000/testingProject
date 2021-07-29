package com.as.quartz.util;

import com.as.common.utils.DateUtils;
import org.quartz.CronExpression;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.TriggerBuilder;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * cron表达式工具类
 *
 * @author kolin
 */
public class CronUtils {
    /**
     * 返回一个布尔值代表一个给定的Cron表达式的有效性
     *
     * @param cronExpression Cron表达式
     * @return boolean 表达式是否有效
     */
    public static boolean isValid(String cronExpression) {
        return CronExpression.isValidExpression(cronExpression);
    }

    /**
     * 返回一个字符串值,表示该消息无效Cron表达式给出有效性
     *
     * @param cronExpression Cron表达式
     * @return String 无效时返回表达式错误描述,如果有效返回null
     */
    public static String getInvalidMessage(String cronExpression) {
        try {
            new CronExpression(cronExpression);
            return null;
        } catch (ParseException pe) {
            return pe.getMessage();
        }
    }

    /**
     * 返回下一个执行时间根据给定的Cron表达式
     *
     * @param cronExpression Cron表达式
     * @return Date 下次Cron表达式执行时间
     */
    public static Date getNextExecution(String cronExpression) {
        try {
            CronExpression cron = new CronExpression(cronExpression);
            return cron.getNextValidTimeAfter(new Date(System.currentTimeMillis()));
        } catch (ParseException e) {
            throw new IllegalArgumentException(e.getMessage());
        }
    }

    /**
     * 根据Cron表达式获取任务最近 几次的执行时间
     *
     * @param cron  cron表达式
     * @param count 次数
     * @return
     */
    public static List<String> getCronSchdule(String cron, int count) {
        List<String> retList = new ArrayList<String>();
        if (!CronExpression.isValidExpression(cron)) {
            //Cron表达式不正确
            return retList;
        }
        CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity("Caclulate Date").withSchedule(CronScheduleBuilder.cronSchedule(cron)).build();
        Date startTime = trigger.getStartTime();
        for (int i = 0; i < count; i++) {
            Date time = trigger.getFireTimeAfter(startTime);
            retList.add(DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, time));
            startTime = time;
        }
        return retList;
    }

}
