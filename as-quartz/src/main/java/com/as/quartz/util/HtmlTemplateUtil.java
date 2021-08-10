package com.as.quartz.util;

import com.as.common.config.ASConfig;
import com.as.quartz.job.MoniElasticExecution;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;

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
    private static final Logger log = LoggerFactory.getLogger(HtmlTemplateUtil.class);
    /**
     * @param filePath
     * @return
     * @Description 读取HTML模板文件，获取字符内容
     */
    public static String getHtmlContent(String filePath) {
        log.info("FilePath:{}",filePath);
        String line = null;
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = null;
        InputStream is = null;

        try {
            ClassPathResource cpr = new ClassPathResource(filePath);
            is = cpr.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
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
    public static String getPath(String fileName) throws IOException {
        File desc = new File(ASConfig.getTelegramPhotoPath() + File.separator + fileName);
        if (!desc.exists())
        {
            if (!desc.getParentFile().exists())
            {
                desc.getParentFile().mkdirs();
            }
        }
        Path filePath = Paths.get(ASConfig.getTelegramPhotoPath(), fileName);
        return filePath.toString();
    }
}
