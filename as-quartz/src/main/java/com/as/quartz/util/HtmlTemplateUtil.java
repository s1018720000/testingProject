package com.as.quartz.util;

import com.as.common.config.ASConfig;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;

/**
 * HTML工具类
 *
 * @author kolin
 */
public class HtmlTemplateUtil {
    /**
     * @param FilePath
     * @return
     * @Description 读取HTML模板文件，获取字符内容
     */
    public static String getHtmlContent(String FilePath) {

        String line = null;
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = null;

        try {
            String path = Objects.requireNonNull(Thread.currentThread().getContextClassLoader().getResource("vm")).getPath();
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(new File(path.concat(FilePath))), StandardCharsets.UTF_8));
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("读取HTML文件，获取字符内容异常");
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("关闭流异常");
            }
        }
        return sb.toString();
    }

    /**
     * 获取图片文件存储路径
     *
     * @param fileName
     * @return
     */
    public static String getPath(String fileName) {
        Path filePath = Paths.get(ASConfig.getTelegramPhoto(), fileName);
        return filePath.toString();
    }
}
