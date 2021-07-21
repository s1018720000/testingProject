package com.as.query;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 数据查询对象
 *
 * @author kolin
 * @date 2021-07-05
 */
public class DBQuery implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * sql
     */
    private String script;
    /**
     * 字段
     */
    private String datasource;

    @NotBlank(message = "script不能为空")
    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }

    @NotBlank(message = "DataSource不能为空")
    public String getDatasource() {
        return datasource;
    }

    public void setDatasource(String datasource) {
        this.datasource = datasource;
    }
}
