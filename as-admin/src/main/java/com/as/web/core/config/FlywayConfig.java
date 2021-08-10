package com.as.web.core.config;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.FlywayException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

@Configuration
public class FlywayConfig {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    @Qualifier("masterDataSource")
    private DataSource dataSource;

    @PostConstruct
    public void migrate() {

        Flyway flyway = Flyway.configure()
                .dataSource(dataSource)
                .locations("db/migration")
                .baselineOnMigrate(true)
                .encoding("UTF-8")
                .load();
        try {
            flyway.migrate();

        } catch (FlywayException e) {

            logger.error("Flyway配置第一次加载出错", e);

            try {

                flyway.repair();
                logger.info("Flyway配置修复成功");
                flyway.migrate();
                logger.info("Flyway配置重新加载成功");
            } catch (Exception e1) {
                logger.error("Flyway配置第二次加载出错", e1);
                throw e1;
            }

        }

    }
}