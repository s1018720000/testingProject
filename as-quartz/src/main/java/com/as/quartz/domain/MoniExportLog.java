package com.as.quartz.domain;

import com.as.common.annotation.Excel;
import com.as.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 自动报表任务LOG对象 moni_export_log
 *
 * @author kolin
 * @date 2021-07-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MoniExportLog extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Excel(name = "ID")
    private Long id;

    /**
     * 任务ID
     */
    @Excel(name = "任务ID")
    private Long exportId;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间" , width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间" , width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /**
     * 文件名称
     */
    @Excel(name = "文件名称")
    private String fileName;

    /**
     * 异常信息
     */
    @Excel(name = "异常信息")
    private String exceptionLog;

    /**
     * 执行时长(秒)
     */
    @Excel(name = "执行时长(秒)")
    private Long executeTime;

    /**
     * 执行状态（0成功 1失败 2错误）
     */
    @Excel(name = "执行状态" , readConverterExp = "0=成功,1=失败,2=错误")
    private String status;

    /**
     * 操作者,系统则为system
     */
    @Excel(name = "操作者,系统则为system")
    private String operator;

    private MoniExport moniExport;

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id" , getId())
                .append("exportId" , getExportId())
                .append("startTime" , getStartTime())
                .append("endTime" , getEndTime())
                .append("fileName" , getFileName())
                .append("exceptionLog" , getExceptionLog())
                .append("executeTime" , getExecuteTime())
                .append("status" , getStatus())
                .append("operator" , getOperator())
                .toString();
    }
}
