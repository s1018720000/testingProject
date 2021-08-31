package com.as.quartz.job;

import com.as.common.constant.Constants;
import com.as.common.utils.ExceptionUtil;
import com.as.common.utils.StringUtils;
import com.as.quartz.domain.SysJob;
import com.as.quartz.domain.SysJobLog;
import com.as.quartz.util.AbstractQuartzJob;
import com.as.quartz.util.JobInvokeUtil;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.quartz.PersistJobDataAfterExecution;

import java.util.Date;

/**
 * 系统定时任务处理（禁止并发执行）
 *
 * @author ruoyi
 */
@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class SysJobExecution extends AbstractQuartzJob {

    private SysJobLog sysJobLog = new SysJobLog();

    private SysJob sysJob = new SysJob();

    @Override
    protected void doExecute(JobExecutionContext context, Object job) throws Exception {
        JobInvokeUtil.invokeMethod(sysJob);
    }

    @Override
    protected void before(JobExecutionContext context, Object job) {
        sysJob = (SysJob) job;
        sysJobLog.setStartTime(new Date());
        sysJobLog.setJobName(sysJob.getJobName());
        sysJobLog.setInvokeTarget(sysJob.getInvokeTarget());
    }

    @Override
    protected void after(JobExecutionContext context, Object job, Exception e) {
        if (e != null) {
            sysJobLog.setStatus(Constants.ERROR);
            sysJobLog.setExceptionInfo(ExceptionUtil.getExceptionMessage(e).replace("\"", "'"));
        }
    }

    @Override
    protected void doFinally(JobExecutionContext context, Object job) {
        sysJobLog.setEndTime(new Date());
        long runTime = (sysJobLog.getEndTime().getTime() - sysJobLog.getStartTime().getTime()) / 1000;
        sysJobLog.setExecuteTime(runTime);
        String operator = (String) context.getMergedJobDataMap().get("operator");
        if (StringUtils.isNotEmpty(operator)) {
            sysJobLog.setOperator(operator);
        } else {
            sysJobLog.setOperator("system");
        }
    }
}
