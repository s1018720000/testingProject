package com.as.order.domain;

import com.as.common.annotation.Excel;
import com.as.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * PF1订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
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

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getDbValue() {
        return dbValue;
    }

    public void setDbValue(String dbValue) {
        this.dbValue = dbValue;
    }

    public String getLogValue() {
        return logValue;
    }

    public void setLogValue(String logValue) {
        this.logValue = logValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("columnName", getColumnName())
                .append("dbValue", getDbValue())
                .append("logValue", getLogValue())
                .toString();
    }
}
