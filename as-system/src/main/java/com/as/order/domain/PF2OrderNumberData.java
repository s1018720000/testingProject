package com.as.order.domain;

import com.as.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;

/**
 * PF2订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
public class PF2OrderNumberData implements Serializable {
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
    @Excel(name = "RDC值")
    private String rdcValue;

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

    public String getRdcValue() {
        return rdcValue;
    }

    public void setRdcValue(String rdcValue) {
        this.rdcValue = rdcValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("columnName", getColumnName())
                .append("dbValue", getDbValue())
                .append("rdcValue", getRdcValue())
                .toString();
    }
}
