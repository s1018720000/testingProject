package com.as.quartz.util;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.File;

/**
 * 邮件对象
 *
 * @author kolin
 * @date 2021-07-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Mail {
    private String[] to;
    private String[] cc;
    private String[] bcc;
    private String subject;
    private String content;
    private String template;
    private File attachment;
}
