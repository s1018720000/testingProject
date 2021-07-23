package com.as.query;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 数据查询对象
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DBQuery implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * sql
     */
    @NotBlank(message = "script不能为空")
    private String script;
    /**
     * 字段
     */
    @NotBlank(message = "DataSource不能为空")
    private String datasource;
}
