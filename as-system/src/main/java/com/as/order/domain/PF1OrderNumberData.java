package com.as.order.domain;

import com.as.common.annotation.Excel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;

/**
 * PF1订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PF1OrderNumberData implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 栏位名
     */
    @Excel(name = "栏位名")
    private String columnName;

    /**
     * 数据库值
     */
    @Excel(name = "数据库值")
    private String dbValue;

    /**
     * log值
     */
    @Excel(name = "log值")
    private String logValue;

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("columnName" , getColumnName())
                .append("dbValue" , getDbValue())
                .append("logValue" , getLogValue())
                .toString();
    }
}
