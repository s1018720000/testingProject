-- ----------------------------
-- 23、自动API检测任务表
-- ----------------------------
DROP TABLE IF EXISTS MONI_API;
CREATE TABLE MONI_API (
  ID INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  ASID VARCHAR(30) DEFAULT NULL COMMENT 'ASID',
  TICKET_NUMBER VARCHAR(20) DEFAULT NULL COMMENT 'TICKET NUMBER',
  EN_NAME VARCHAR(200) NOT NULL COMMENT '任务名称-英文',
  CH_NAME VARCHAR(200) NOT NULL COMMENT '任务名称-中文',
  DESCR TEXT COMMENT '说明',
  STATUS CHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0正常 1停用）',
  PLATFORM CHAR(10) DEFAULT NULL COMMENT '平台',
  CRON_EXPRESSION VARCHAR(100) DEFAULT NULL COMMENT '频率',
  URL VARCHAR(256) NOT NULL COMMENT 'URL',
  METHOD VARCHAR(10) NOT NULL COMMENT '请求方法',
  HEADER TEXT COMMENT '请求头',
  BODY TEXT COMMENT '请求内容',
  CONTENT_TYPE VARCHAR(256) DEFAULT NULL COMMENT '请求类型',
  CREATE_BY VARCHAR(30) NOT NULL COMMENT '建立人员',
  CREATE_TIME DATETIME NOT NULL COMMENT '建立时间',
  UPDATE_BY VARCHAR(30) DEFAULT NULL COMMENT '修改人员',
  UPDATE_TIME DATETIME DEFAULT NULL COMMENT '修改时间',
  TELEGRAM_ALERT VARCHAR(1) DEFAULT '0' COMMENT '是否TELEGRAM告警（0正常 1停用）',
  TELEGRAM_INFO VARCHAR(500) DEFAULT NULL COMMENT '告警信息',
  TELEGRAM_CONFIG VARCHAR(256) DEFAULT NULL COMMENT 'telegram发送群组配置',
  REQUESTER VARCHAR(12) DEFAULT NULL COMMENT '请求者',
  PRIORITY VARCHAR(12) DEFAULT NULL COMMENT '优先级',
  ACTION_ITEM VARCHAR(30) DEFAULT NULL COMMENT '实施项目',
  LAST_ALERT DATETIME DEFAULT NULL COMMENT '最后告警时间',
  PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='自动API检测任务表';


-- ----------------------------
-- 22、SQL检测任务LOG表
-- ----------------------------
DROP TABLE IF EXISTS MONI_API_LOG;
CREATE TABLE MONI_API_LOG (
  ID bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  API_ID INT(11) NOT NULL COMMENT '任务ID',
  START_TIME DATETIME DEFAULT NULL COMMENT '开始时间',
  END_TIME DATETIME DEFAULT NULL COMMENT '结束时间',
  EXECUTE_RESULT TEXT COMMENT '执行结果',
  EXCEPTION_LOG TEXT COMMENT '异常信息',
  EXECUTE_TIME INT(11) DEFAULT 0 COMMENT '执行时长(秒)',
  STATUS VARCHAR(1) DEFAULT NULL COMMENT '执行状态（0成功 1失败 2错误）',
  ALERT_STATUS VARCHAR(1) DEFAULT NULL COMMENT '告警（0正常 1停用）',
  OPERATOR VARCHAR(30) DEFAULT NULL COMMENT '操作者,系统则为system',
  PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='自动API检测任务LOG表';

INSERT INTO sys_dict_type values(21, '请求方法','api_job_method','0','admin',sysdate(),'',NULL,'请求方法');
insert into sys_dict_data values(273, 1,  'GET',     'GET',       'api_job_method',   '',   '',  'Y', '0', 'admin', sysdate(), '', null, 'GET请求');
insert into sys_dict_data values(274, 2,  'POST',     'POST',       'api_job_method',   '',   '',  'N', '0', 'admin', sysdate(), '', null, 'POST请求');

INSERT INTO sys_dict_type values(22, '请求类型','api_job_content','0','admin',sysdate(),'',NULL,'请求类型');
insert into sys_dict_data values(275, 1,  'application/json;charset=UTF-8',     'application/json',       'api_job_content',   '',   '',  'N', '0', 'admin', sysdate(), '', null, 'json请求');
insert into sys_dict_data values(276, 2,  'application/x-www-form-urlencoded;charset=UTF-8',     'application/x-www-form-urlencoded',       'api_job_content',   '',   '',  'Y', '0', 'admin', sysdate(), '', null, 'form请求');


