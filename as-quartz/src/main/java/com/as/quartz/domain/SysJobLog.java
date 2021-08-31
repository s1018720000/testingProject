package com.as.quartz.domain;


import com.as.common.annotation.Excel;
import com.as.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 定时任务调度日志表 sys_job_log
 *
 * @author ruoyi
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysJobLog extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Excel(name = "日志序号")
    private Long id;

    /**
     * 任务名称
     */
    @Excel(name = "任务名称")
    private String jobName;

    /**
     * 调用目标字符串
     */
    @Excel(name = "调用目标字符串")
    private String invokeTarget;

    /**
     * 日志信息
     */
    @Excel(name = "日志信息")
    private String jobMessage;

    /**
     * 执行状态（0正常 1失败）
     */
    @Excel(name = "执行状态", readConverterExp = "0=正常,1=失败")
    private String status;

    /**
     * 异常信息
     */
    @Excel(name = "异常信息")
    private String exceptionInfo;

    /**
     * 开始时间
     */
    @Excel(name = "开始时间")
    private Date startTime;

    /**
     * 结束时间
     */
    @Excel(name = "结束时间")
    private Date endTime;

    /**
     * 执行时长(秒)
     */
    @Excel(name = "执行时长(秒)")
    private Long executeTime;

    /**
     * 操作者,系统则为system
     */
    @Excel(name = "操作者" , readConverterExp = "系统则为system")
    private String operator;

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("jobName", getJobName())
                .append("jobMessage", getJobMessage())
                .append("status", getStatus())
                .append("exceptionInfo", getExceptionInfo())
                .append("startTime", getStartTime())
                .append("endTime", getEndTime())
                .toString();
    }
}
