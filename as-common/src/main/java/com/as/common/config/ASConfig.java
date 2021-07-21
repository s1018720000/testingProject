package com.as.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 全局配置类
 *
 * @author kolin
 */
@Component
@ConfigurationProperties(prefix = "as")
public class ASConfig {
    /**
     * 项目名称
     */
    private static String name;

    /**
     * 版本
     */
    private static String version;

    /**
     * 版权年份
     */
    private static String copyrightYear;

    /**
     * 实例演示开关
     */
    private static boolean demoEnabled;

    /**
     * 上传路径
     */
    private static String profile;

    /**
     * 获取地址开关
     */
    private static boolean addressEnabled;

    /**
     * 获取项目域名
     */
    private static String asDomain;


    public static String getName() {
        return name;
    }

    public void setName(String name) {
        ASConfig.name = name;
    }

    public static String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        ASConfig.version = version;
    }

    public static String getCopyrightYear() {
        return copyrightYear;
    }

    public void setCopyrightYear(String copyrightYear) {
        ASConfig.copyrightYear = copyrightYear;
    }

    public static boolean isDemoEnabled() {
        return demoEnabled;
    }

    public void setDemoEnabled(boolean demoEnabled) {
        ASConfig.demoEnabled = demoEnabled;
    }

    public static String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        ASConfig.profile = profile;
    }

    public static boolean isAddressEnabled() {
        return addressEnabled;
    }

    public void setAddressEnabled(boolean addressEnabled) {
        ASConfig.addressEnabled = addressEnabled;
    }

    public static String getAsDomain() {
        return asDomain;
    }

    public void setAsDomain(String asDomain) {
        ASConfig.asDomain = asDomain;
    }

    /**
     * 获取头像上传路径
     */
    public static String getAvatarPath() {
        return getProfile() + "/avatar";
    }

    /**
     * 获取下载路径
     */
    public static String getDownloadPath() {
        return getProfile() + "/download/";
    }

    /**
     * 获取上传路径
     */
    public static String getUploadPath() {
        return getProfile() + "/upload";
    }

    /**
     * 获取telegram推送图片路径
     */
    public static String getTelegramPhotoPath() {
        return getProfile() + "/photo";
    }
}
