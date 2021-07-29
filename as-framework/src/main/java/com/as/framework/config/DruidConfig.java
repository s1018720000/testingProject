package com.as.framework.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import com.alibaba.druid.spring.boot.autoconfigure.properties.DruidStatProperties;
import com.alibaba.druid.util.Utils;
import com.as.common.enums.DataSourceType;
import com.as.common.utils.spring.SpringUtils;
import com.as.framework.config.properties.DruidProperties;
import com.as.framework.datasource.DynamicDataSource;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.servlet.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * druid 配置多数据源
 *
 * @author kolin
 */
@Configuration
public class DruidConfig {
    @Bean
    @ConfigurationProperties("spring.datasource.druid.master")
    public DataSource masterDataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.pf1.main")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.pf1.main", name = "enabled", havingValue = "true")
    public DataSource pf1DataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.pf1.sec")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.pf1.sec", name = "enabled", havingValue = "true")
    public DataSource pf1SecDataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.pf2-core.main")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.pf2-core.main", name = "enabled", havingValue = "true")
    public DataSource pf2CoreDataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.pf2-core.sec")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.pf2-core.sec", name = "enabled", havingValue = "true")
    public DataSource pf2CoreSecDataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.pf2-draw")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.pf2-draw", name = "enabled", havingValue = "true")
    public DataSource pf2DrawDataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.pf2-dw")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.pf2-dw", name = "enabled", havingValue = "true")
    public DataSource pf2DwDataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.pf2-ods")
    @ConditionalOnProperty(prefix = "spring.datasource.druid.pf2-ods", name = "enabled", havingValue = "true")
    public DataSource pf2OdsDataSource(DruidProperties druidProperties) {
        DruidDataSource dataSource = DruidDataSourceBuilder.create().build();
        return druidProperties.dataSource(dataSource);
    }

    @Bean(name = "dynamicDataSource")
    @Primary
    public DynamicDataSource dataSource(DataSource masterDataSource) {
        Map<Object, Object> targetDataSources = new HashMap<>();
        targetDataSources.put(DataSourceType.MASTER.name(), masterDataSource);
        setDataSource(targetDataSources, DataSourceType.PF1.name(), "pf1DataSource");
        setDataSource(targetDataSources, DataSourceType.PF1_SEC.name(), "pf1SecDataSource");
        setDataSource(targetDataSources, DataSourceType.PF2_CORE.name(), "pf2CoreDataSource");
        setDataSource(targetDataSources, DataSourceType.PF2_CORE_SEC.name(), "pf2CoreSecDataSource");
        setDataSource(targetDataSources, DataSourceType.PF2_DRAW.name(), "pf2DrawDataSource");
        setDataSource(targetDataSources, DataSourceType.PF2_DW.name(), "pf2DwDataSource");
        setDataSource(targetDataSources, DataSourceType.PF2_ODS.name(), "pf2OdsDataSource");
        return new DynamicDataSource(masterDataSource, targetDataSources);
    }

//    @Bean(name = "pf2DwJdbcTemplate")
//    public JdbcTemplate pf2DwJdbcTemplate(
//            @Qualifier("pf2DwDataSource") DataSource dataSource) {
//        return new JdbcTemplate(dataSource);
//    }

    /**
     * 设置数据源
     *
     * @param targetDataSources 备选数据源集合
     * @param sourceName        数据源名称
     * @param beanName          bean名称
     */
    public void setDataSource(Map<Object, Object> targetDataSources, String sourceName, String beanName) {
        try {
            DataSource dataSource = SpringUtils.getBean(beanName);
            targetDataSources.put(sourceName, dataSource);
        } catch (Exception e) {
        }
    }

    /**
     * 去除监控页面底部的广告
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @Bean
    @ConditionalOnProperty(name = "spring.datasource.druid.statViewServlet.enabled", havingValue = "true")
    public FilterRegistrationBean removeDruidFilterRegistrationBean(DruidStatProperties properties) {
        // 获取web监控页面的参数
        DruidStatProperties.StatViewServlet config = properties.getStatViewServlet();
        // 提取common.js的配置路径
        String pattern = config.getUrlPattern() != null ? config.getUrlPattern() : "/druid/*";
        String commonJsPattern = pattern.replaceAll("\\*", "js/common.js");
        final String filePath = "support/http/resources/js/common.js";
        // 创建filter进行过滤
        Filter filter = new Filter() {
            @Override
            public void init(javax.servlet.FilterConfig filterConfig) throws ServletException {
            }

            @Override
            public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
                    throws IOException, ServletException {
                chain.doFilter(request, response);
                // 重置缓冲区，响应头不会被重置
                response.resetBuffer();
                // 获取common.js
                String text = Utils.readFromResource(filePath);
                // 正则替换banner, 除去底部的广告信息
                text = text.replaceAll("<a.*?banner\"></a><br/>", "");
                text = text.replaceAll("powered.*?shrek.wang</a>", "");
                response.getWriter().write(text);
            }

            @Override
            public void destroy() {
            }
        };
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(filter);
        registrationBean.addUrlPatterns(commonJsPattern);
        return registrationBean;
    }
}
