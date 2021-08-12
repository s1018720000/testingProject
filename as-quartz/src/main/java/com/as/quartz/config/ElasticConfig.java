package com.as.quartz.config;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Elastic配置
 *
 * @author kolin
 */
@Configuration
public class ElasticConfig {
    private Logger logger = LoggerFactory.getLogger(ElasticConfig.class);

    /**
     * pf1 url
     */
    @Value("${elastic.pf1.url}")
    private String pf1Url;

    /**
     * pf1 port
     */
    @Value("${elastic.pf1.port}")
    private int pf1Port;

    /**
     * pf2 url
     */
    @Value("${elastic.pf2.url}")
    private String pf2Url;

    /**
     * pf2 port
     */
    @Value("${elastic.pf2.port}")
    private int pf2Port;

    @Bean(name = "PF1Elasticsearch")
    public RestHighLevelClient PF1Client() {

        RestHighLevelClient client = null;
        try {
            //UAT  172.27.130.48  172.27.1.48  172.27.101.48
            //kibana2.pf1uat1-oob.com 172.27.101.48
            //PROD  172.30.1.48
            client = new RestHighLevelClient(
                    RestClient.builder(
                            new HttpHost(pf1Url, pf1Port, "http")));

            logger.info("PF1 ElasticsearchClient 连接成功 ===");
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return client;
    }

    @Bean(name = "PF2Elasticsearch")
    public RestHighLevelClient PF2Client() {

        RestHighLevelClient client = null;
        try {
            //UAT  172.27.130.95
            //log-kafka1.pf2uat1-oob.com 172.27.113.95
            //PROD  172.30.13.95
            client = new RestHighLevelClient(
                    RestClient.builder(
                            new HttpHost(pf2Url, pf2Port, "http")));

            logger.info("PF2 ElasticsearchClient 连接成功 ===");
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return client;
    }
}
