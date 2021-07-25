package com.as.quartz.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

/**
 * Mail配置
 *
 * @author kolin
 */
@Configuration
public class MailConfig {

    /**
     * 主机
     */
    @Value("${mail.host}")
    private String host;

    /**
     * 端口
     */
    @Value("${mail.port}")
    private Integer port;

    /**
     * 协议
     */
    @Value("${mail.protocol}")
    private String protocol;

    /**
     * 编码
     */
    @Value("${mail.DefaultEncoding}")
    private String DefaultEncoding;

    /**
     * 用户名
     */
    @Value("${mail.username}")
    private String username;

    /**
     * 密码
     */
    @Value("${mail.password}")
    private String password;

    /**
     * 安全验证
     */
    @Value("${mail.smtp.auth}")
    private String smtpAuth;

    /**
     * STARTTLS安全连接
     */
    @Value("${mail.smtp.starttls.enable}")
    private String starttls;

    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost(host);
        javaMailSender.setPort(port);
        javaMailSender.setUsername(username);
        javaMailSender.setPassword(password);
        javaMailSender.setDefaultEncoding(DefaultEncoding);
        javaMailSender.setProtocol(protocol);
        Properties props = new Properties();
        //设置使用验证
        props.setProperty("mail.smtp.auth", smtpAuth);
        //使用 STARTTLS安全连接
        props.setProperty("mail.smtp.starttls.enable", starttls);
        javaMailSender.setJavaMailProperties(props);
        return javaMailSender;
    }
}
