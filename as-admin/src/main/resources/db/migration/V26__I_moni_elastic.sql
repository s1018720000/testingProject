truncate table moni_elastic;

INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-1','','PF2 Draw Number Compare','PF2开奖号码比对','0','5.0','0 0/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','[L1] please call L2 and Jason if manual check was abnormal
 [L2] if issue confirmed, please remind Frank, Mario and Jeffrey via Teams','action-*','context.win_nos:*','now-10m','now-5m','3','1','admin','2021-05-06 01:01:41','testAs','2021-07-25 17:10:56',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-2','','PF1 Draw Number Compare','PF1开奖号码比对','0','1.0','0 0/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','[L1] please call L2 and Jason if manual check was abnormal
 [L2] if issue confirmed, please remind Frank, Mario and Jeffrey via Teams','tomcat*','winningnumber AND NOT TWLSSC AND NOT JSK3 AND NOT HLJSSC','now-10m','now-5m','3','1','admin','2021-05-06 01:01:41','testAs','2021-07-13 09:59:54',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-183','','PF1 Class not found','PF1 Class not found','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-183> , Please check deploy status or attack]','tomcat*','"no such class found"','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:24:54',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-184','','PF1 Monitor DB connection','PF1 無法取得DB連線(連接已滿)','0','1.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-184> , PF1 Monitor DB connection, please assist if PF1 ~ PF4 needs restart. 2. Create AS task ticket and post on Teams
2. L2: 確認是哪個APP發生DB連接異常，通知1.0生產群','tomcat*','"Couldn''t get connection"','now-1m','now','3','1','admin','2021-05-06 01:03:32','testAs','2021-08-06 14:51:31',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-185','','PF1 REDIS 启动初始化程序时REDIS建立连接失败','PF1 REDIS 启动初始化程序时REDIS建立连接失败','0','1.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy [ Hi L2, GY <URG-CAL2-ELM-185> , PF1 REDIS 启动初始化程序时REDIS建立连接失败 (严重) . REDIS配置详解及相关问题处理方案 ] 2. Create AS task ticket and post on Teams','tomcat*','[REDIS.POOL.ERROR]','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:27:19',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-186','','PF1 REDIS 从连接池获取连接失败','PF1 REDIS 从连接池获取连接失败','0','1.0','0 */1 0-6,7-23 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-186> , PF1 REDIS 从连接池获取连接失败 (严重) , REDIS配置详解及相关问题处理方案 ] 2. Create AS task ticket and post on Teams','tomcat*','[REDIS.RESOURCE.FAIL]','now-1m','now','3','25','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:27:37',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-187','','PF1 REDIS 重试失败','PF1 REDIS 重试失败','0','1.0','0 */1 0-6,7-23 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-187> , PF1 REDIS 重试失败 ( 严重 ) , REDIS配置详解及相关问题处理方案 ] 2. Create AS task ticket and post on Teams','tomcat*','[REDIS.RETRY.FAIL]','now-1m','now','3','70','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:27:57',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-188','','PF1 REDIS 工具类出现错误','PF1 REDIS 工具类出现错误','0','1.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Copy to AS Teams [ Hi L2, GY <CHK-ELM-188> , PF1 REDIS 工具类出现错误  (中等) , REDIS配置详解及相关问题处理方案 ]','tomcat*','[REDIS.redisCacheUtils.ERROR]','now-1m','now','3','30','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:28:13',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('NU-CHK-ELM-189','','PF1 REDIS 重新计算超时次数','PF1 REDIS 重新计算超时次数','0','1.0','0 */1 0-6,7-23 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Copy to AS Teams [ Hi L2, GY <NU-CHK-ELM-189> ,  PF1 REDIS 重新计算超时次数 (轻微), REDIS配置详解及相关问题处理方案 ]','tomcat*','REDIS.RETRY.RETIMES','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:28:50',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-190','','PF1 手动开彩推送失败','PF1 手动开彩推送失败','0','1.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-190> , PF1 手动开彩推送失败 ] 2. Create AS task ticket and post on Teams','tomcat*','pushDrawingMessage.error.pf1admin.run','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:29:03',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-191','','PF1 手动开彩推送其它失败','PF1 手动开彩推送其它失败','0','1.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-191> , PF1 手动开彩推送其它失败 ] 2. Create AS task ticket and post on Teams','tomcat*','[pushDrawingMessage.error.pf1admin.runAll]','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:29:19',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-192','','PF1 自动开彩推送失败','PF1 自动开彩推送失败','0','1.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-192> , PF1 自动开彩推送失败 ] 2. Create AS task ticket and post on Teams','tomcat*','[pushDrawingMessage.error.consolelib.run]','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:29:44',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-193','','PF1 自动开彩推送其它失败','PF1 自动开彩推送其它失败','0','1.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1. Copy  to AS Teams [ Hi L2, GY <URG-CAL2-ELM-193> , PF1 自动开彩推送其它失败 ] 2. Create AS task ticket and post on Teams','tomcat*','[pushDrawingMessage.error.consolelib.runAll]','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:30:02',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-194','','PF1 Monitor Release error','PF1 Monitor Release error','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Contact Mark and copy Copy [ Hi, GY <CHK-ELM-194> , PF1 發生找不到對應的方法，可能是上版有問題或被攻擊 ]','tomcat*','NoSuchMethodException','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:30:17',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-195','','PF1 Failure To Get Win Number','PF1 Failure To Get Win Number','0','1.0','0 */3 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','1.Copy to AS Teams [ Hi L2, GY <URG-CAL2-ELM-195> , PF1 Failure To Get Win Number ]  2.Then copy to UBPED技术沟通组 - Payment支付技術溝通 [ Hi PED, PF1  取不到獎號 ] 3. Create AS task ticket and post on Teams','tomcat*','failureToGetWinNumber','now-3m','now','3','3','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:30:38',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-196','','PF1 開元轉帳發生異常，需要進行確認','PF1 開元轉帳發生異常，需要進行確認','0','1.0','0 3/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Copy to AS Teams [ Hi L2, Kaiyuan transfer failed ] then check if you can transfer to KY','tomcat*','"kaiyuan deposit have reduced from balance but no response from kaiyuan httpserver"','now-5m','now','3','1','admin','2021-05-06 01:04:24','testAs','2021-07-13 11:04:47',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-197','','PF1 充值到帳來源異常，需要進行確認','PF1 充值到帳來源異常，需要進行確認','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Copy to AS Teams [ Hi L2, GY <CHK-ELM-197> , PF1 充值到帳來源異常，需要進行確認 https://tinyurl.com/y5cxevoq ] ','tomcat*','logger_name:"com.ubg.pf1.external.game.pay.cpay.CpayCallbackController"  AND NOT ip:"182.16.37.34"','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:31:18',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-198','','PED deposit order not exist in DB','PED deposit order not exist in DB','0','1.0','0 1/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Copy to AS Teams  [ Hi L2, GY <CHK-ELM-198> , PED deposit order not exist in DB ]','tomcat*','*ped* AND *Error* AND *requestWithdrawApproveInformation*','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-08-06 15:30:46',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELK-199','','PF1 UPAY Send Deposit Fail','PF1 UPAY Send Deposit Fail','0','1.0','0 */10 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','1.Test deposit on front-end and do SOP: https://wiki.yxunistar.com/x/KICgAg 2. Copy [ Hi PED, PF1 UPAY Send Deposit Fail ] with result copy of SOP','tomcat*','Rollback req sentDepositApplication" AND requestURI: "/pay/deposit"','now-10m','now','3','10','admin','2021-05-06 01:01:42','testAs','2021-07-13 11:05:28',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-200','','PF1 PED Send Deposit Fail','PF1 PED Send Deposit Fail','0','1.0','0 */10 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','1.Test deposit on front-end and do SOP: https://wiki.yxunistar.com/x/KICgAg 2. Copy [ Hi PED, PF1 PED Send Deposit Fail ] with result copy of SOP','tomcat*','"Rollback req sentDepositApplication" AND requestURI: "/secure/account.do"','now-10m','now','3','10','admin','2021-05-06 01:01:42','testAs','2021-07-13 11:05:40',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-201','','PF1 UPAY Get Available Banks empty','PF1 UPAY Get Available Banks empty','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Do SOP https://wiki.yxunistar.com/x/XHuJAw then copy to UBPED技术沟通组 - Payment 支付技術溝通 the result of SOP','tomcat*','"getAvailableBanks empty" AND requestURI: "/pay/deposit"','now-5m','now','3','3','admin','2021-05-06 01:01:42','testAs','2021-07-13 11:05:51',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-202','','PF1 PED Get Available Banks empty','PF1 PED Get Available Banks empty','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Do SOP https://wiki.yxunistar.com/x/XHuJAw then copy to UBPED技术沟通组 - Payment 支付技術溝通 the result of SOP','tomcat*','"getAvailableBanks empty" AND requestURI: "/secure/account.do"','now-5m','now','3','3','admin','2021-05-06 01:01:42','testAs','2021-07-13 11:06:06',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-203','','PF1 comm100 用户无法开启客服链结','PF1 comm100 用户无法开启客服链结','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Check alert https://tinyurl.com/4td34b57 and find loginUID on Kibana and inform SRV to contact user that need help but can not link to comm100 ','tomcat*','(CustomerServiceCallback AND error) AND NOT UNKNOW','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 11:06:22',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-204','','Redis is too tired, please check redis status and request','Redis is too tired, please check redis status and request','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','http://pf2kibana.nuttli.com/goto/42b4ed8ed0df0081227ce67f74b735bc','metricbeat-*','redis.keyspace.avg_ttl: * ','now-5m','now','3','2','admin','2021-05-06 01:01:42','testAs','2021-07-13 09:58:13',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-205','','Third-party game can''t be opened','Third-party game can''t be opened','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','do SOP https://wiki.yxunistar.com/x/2F_JAw','action-*','Kaiyuan AND ERROR','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 09:58:49',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-206','','PF2 HTTP REQUEST FAILED','PF2 HTTP REQUEST FAILED','0','5.0','0 9/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check kibana log https://tinyurl.com/y68spkbe to see which service with many failed http, do a test, if there is an issue, tag L2 duty or Sir. Jason ("Hi L2, CHK-ELM-206：PF2 HTTP REQUEST FAILED") and inform AS-OD on General then report to 3rd party provider on Skype.','action-*','*HTTP_REQUEST_FAILED*','now-5m','now','3','10','admin','2021-05-06 01:01:42','testAs','2021-07-23 20:12:35',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-207','','PF2 Read timed out','PF2 Read timed out','0','5.0','0 11/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert https://tinyurl.com/y5jxxd56 and do SOP https://wiki.yxunistar.com/x/OIFMB','action-*','SLOW_HTTP AND *ped*','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 09:59:57',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-208','','PF2 MGS Connect Timed out','PF2 MGS Connect Timed out','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','1. Test MGS game then ask MGS if its under maintenance or not 2. Create ASI ticket if there''s a real problem and post on Teams','action-*','HTTP ','now-5m','now','3','3','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:01:08',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-209','','PF2 Mobile APP x03','PF2 Mobile APP x03','0','5.0','0 */10 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','1. Mobile APP with some network problem, please inform IT to handle it 2. Create AS task ticketand post on Teams','action-*','%x03','now-10m','now','3','10','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:02:04',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-210','','PF2 DP sendDeposit connection error','PF2 DP sendDeposit connection error','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','do SOP https://wiki.yxunistar.com/x/64CgAg','action-*','DP sendDeposit connection Error','now-5m','now','3','5','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:02:33',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-211','','PF2 UNBAN IP','PF2 UNBAN IP','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','do SOP https://wiki.yxunistar.com/x/RoDAAQ','action-*','Maybe ban with web','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:13:46',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-212','','PF2 Mobile APP x07','PF2 Mobile APP x07','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Mobile App with some network issue, please call IT to check mobile domain','action-*','x07','now-5m','now','3','10','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:06:15',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-213','','PF2 Oracle Error Code (Except ORA-00001)','PF2 Oracle Error Code (Except ORA-00001)','0','5.0','0 */10 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Please check with DBA','action-*','"ORA-"-"ORA-00001"','now-10m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:14:42',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-214','','PF2 GC overhead limit exceeded','PF2 GC overhead limit exceeded','0','5.0','* */3 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','1. After Calling L2, do SOP https://wiki.yxunistar.com/x/-ok4 2. CreateAS task ticket and post on Teams','action-*','GCoverhead limit','now-3m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:14:53',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-215','','PF2 JPS_Win_Customer is null','PF2 JPS_Win_Customer is null','0','5.0','0 */30 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','do Datapatch https://jira.yxunistar.com/browse/CM-3265','action-*','GetWinnder List AND Error','now-30m','now','3','5','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:08:10',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-216','','PF2 has stuck https://tinyurl.com/yxhdypss','PF2 has stuck https://tinyurl.com/yxhdypss','0','5.0','0 */1 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','1. If 2 or more servers CALL L2 and if just 1 post and screenshot checking then keep on monitoring 2. Create AS task ticket and post on Teams','action-*','STUCK','now-1m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:11:23',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-218','','PF2 Deposit Is Under Maintenance','PF2 Deposit Is Under Maintenance','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','do SOP https://wiki.yxunistar.com/x/bmWJAw','action-*','SYSTEM_MAINTENANCE','now-5m','now','3','14','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:09:12',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-219','','PF2 KY連線發生異常','PF2 KY連線發生異常','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check if KY is normal, If not check with KY in skype and inform SRV https://tinyurl.com/y6fnee9v','action-*','*Error* AND *KaiyuanBillServiceBean*','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:11:02',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-220','','PF2 第三方遊戲無法開啟','PF2 第三方遊戲無法開啟','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert https://tinyurl.com/52f46spr and do SOP https://wiki.yxunistar.com/x/2F_JAw','action-*','*findLoadCasualGameCheck* AND error_code:HTTP_REQUEST_FAILED','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-26 19:39:14',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-221','','PF2 UPAY Deposit Is Under Maintenance','PF2 UPAY Deposit Is Under Maintenance','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','do SOP https://wiki.yxunistar.com/x/bmWJAw','action-*','action:"api:post:/upay-deposit/apply"  AND SYSTEM_MAINTENANCE','now-5m','now','3','14','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:18:34',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-222','','PF2 PED Deposit Is Under Maintenance','PF2 PED Deposit Is Under Maintenance','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','do SOP https://wiki.yxunistar.com/x/bmWJAw','action-*','action:"api:post:/ped-deposit/exception/apply"  AND SYSTEM_MAINTENANCE','now-5m','now','3','14','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:18:55',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-223','','PF2 PED Read timed out','PF2 PED Read timed out','0','5.0','0 11/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert https://tinyurl.com/y5jxxd56 and do SOP https://wiki.yxunistar.com/x/OIFMB','action-*','SLOW_HTTP AND *ped*','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:19:17',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-224','','PF2 UPAY Read timed out','PF2 UPAY Read timed out','0','5.0','0 11/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert https://tinyurl.com/y64uorva and do SOP https://wiki.yxunistar.com/x/OIFMB','action-*','SLOW_HTTP AND *upay*','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-14 15:05:46',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-225','','PF2 UPAY SendWithdraw failed','PF2 UPAY SendWithdraw failed','0','5.0','0 2 0/1 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Please check withdraw ID and check with PED','action-*','SEND WITHDRAW AND ERROR AND *upay*','now-1h','now','3','40','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:47:46',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-226','','PF2 PED SendWithdraw failed','PF2 PED SendWithdraw failed','0','5.0','0 2 0/1 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Please check withdraw ID and check with PED','action-*','SEND WITHDRAW AND ERROR AND *ped*','now-1h','now','3','40','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:48:11',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-227','','PF2 comm100 can not be open 用户无法开启客服链结','PF2 comm100 can not be open 用户无法开启客服链结','0','5.0','0 0/5 0 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert https://tinyurl.com/mkw7ttc and do sop: https://wiki.yxunistar.com/x/ByVpB','action-*','*customer-service-html*','now-5m','now','3','1','admin','2021-05-06 01:01:42','testAs','2021-07-13 10:48:35',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-228','','PF1 blacklist(IP/UUID) is trying to login platform','后台黑名单(IP/UUID)尝试登录1.0平台','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Check alert https://tinyurl.com/4e6we5rs and do sop https://wiki.yxunistar.com/x/NIDYB','tomcat*','json.exception.stacktrace : *checkBlackListParameter*','now-5m','now','3','1','kolin','2021-05-17 02:12:08','testAs','2021-07-14 14:36:32',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-229','','Hacker is using a large number of accounts(>=100) to try to login PF1','可能有黑客使用大量帐号(>=100)尝试登录1.0平台','0','1.0','0 0 0/1 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Check https://pf1kibana2.nuttli.com/goto/58232809cf9d36b26a71128796e7428e and do SOP https://wiki.yxunistar.com/x/OoDYB','tomcat*','json.message : "login error"','now-1h','now','3','100','kolin','2021-05-27 02:01:55','testAs','2021-07-13 11:06:52',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-230','','PF1 illegal betting string monitor','可能有用戶嘗試非法投注但未成功','0','1.0','0 */30 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','1','CHK','Check kibana https://pf1kibana2.nuttli.com/goto/4c2066fafba98d4570d9157eb1eeda1f
 [L1] provide value of ''json.mdc.loginUID''and ''json.mdc.remoteAddr'' in AS-RC
 [L1] report ASI issue','tomcat*','json.logger_name: com.ubg.game.controller.GenerateOrdersAction AND json.message : ex','now-30m','now','3','2','mickey','2021-05-19 12:08:49','testAs','2021-07-13 11:07:13',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-231','','PF2 Bulk login request error','批量登入請求錯誤>50','0','5.0','0 0 0/1 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert http://pf2kibana.nuttli.com/goto/d5d818c938524f46e2fe1e064abf3e35 [L1]provide value of ''context.client_ip'' in AS-RC','action-*','context.path_pattern : "/customer-web-service/resources/sessions" AND NOT context.response_code : 200 AND NOT context.request_body : *lala2015*','now-1h','now','3','50','mickey','2021-05-25 03:56:34','testAs','2021-08-09 12:06:31',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-232','','PF2 Blacklist (IP/UUID) register','防刷黑名單(IP/UUID)嘗試註冊帳號','0','5.0','0 0/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert http://pf2kibana.nuttli.com/goto/bbbb31b8842e8de726de05f57e9bc3c9','action-*','error_code : CP_USER_REGISTER_DENY','now-5m','now','3','1','mickey','2021-05-21 12:45:37','testAs','2021-07-13 10:51:42',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-233','','PF2 Blacklist (IP/UUID) withdraw','防刷黑名單(IP/UUID)嘗試申請提現','0','5.0','0 0/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert http://pf2kibana.nuttli.com/goto/c8b6e88edf34ee01da657b0e3276afce
 [L1]provide value of ''context.client_ip'' in AS-RC','action-*','error_code : CP_USER_WITHDRAW_DENY','now-5m','now','3','1','mickey','2021-07-08 03:20:43','testAs','2021-07-13 10:52:04',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-234','','PF2 Blacklist (IP/UUID) login','防刷黑名單(IP/UUID)嘗試登入平台','0','5.0','0 0/5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert http://pf2kibana.nuttli.com/goto/6417114f94b8af24932f0f532d35ef4c','action-*','error_code : CP_USER_LOGIN_DENY','now-5m','now','3','1','mickey','2021-05-21 12:43:24','testAs','2021-07-13 10:52:23',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-235','','PF2 3RD sync bill data error','PF2第三方同步數據到帳變異常','0','5.0','0 15 0/1 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','Check alert https://pf2kibana.nuttli.com/goto/77b79b191d6826ab0e08a8a36b5f6196
[L1]Plase copy error_message to ASI for CMS <URG-CAL2-MID-298>, PF2 第三方同步數據到帳變異常
[L2]查看PF2第三方同步數據到帳變異常的kibana','action-*','action: "topic:CASUAL_GAME_BONUS_TASK:task:executor" AND result : ERROR','now-1h','now','3','1','mickey','2021-06-23 11:49:13','testAs','2021-07-13 11:20:42',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-ELM-236','','PF2 red envelope invalid','紅包領取失效','0','5.0','0 0 0/12 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','1','CHK','Check alert http://pf2kibana.nuttli.com/goto/8769082a0a8ae90a286800fd2e521d08 [L1]check','action-*','NOT context.user_agent:"APIClient" AND *red_envelope_invalid*','now-12h','now','3','1','mickey','2021-06-30 05:49:45','testAs','2021-07-14 16:53:09',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-237','','PF1 FE Unavailable','前端不可用','0','1.0','0 */5 1-23 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','Check kibana https://tinyurl.com/yukjww78 if there''s no result, check if PF1 FE is accessible
*please disable during 2nd sunday maintenance*','tomcat*','*login*','now-5m','now','5','','testAs','2021-07-12 08:45:39','testAs','2021-07-20 02:59:24',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-238','','PF2 FE Unavailable','前端不可用','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','Check kibana https://tinyurl.com/2f8f5su8 if there''s no result, check if PF2 FE is accessible
*please disable during 2nd sunday maintenance*','action-*','*loginOpenHome*','now-5m','now','5','','testAs','2021-07-12 03:54:26','testAs','2021-08-04 10:01:26',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-239','','PF1 BE Unavailable','服務暫時不可用','0','1.0','0 */5 1-23 * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','Check kibana https://tinyurl.com/4kw4hjbw if there''s no result, check if PF1 BE is accessible
*please disable during 2nd sunday maintenance*','tomcat-*','*taskAction.do*','now-5m','now','5','','testAs','2021-07-12 05:56:30','testAs','2021-07-20 03:00:08',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-240','','PF2 BE Unavailable','服務暫時不可用','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CAL2','Check kibana https://tinyurl.com/hb5dbdjf if there''s no result, check if PF2 BE is accessible
*please disable during 2nd sunday maintenance*','action-*','*allMission*','now-5m','now','5','','testAs','2021-07-12 06:10:32','testAs','2021-07-20 03:00:27',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-CAL2-ELM-241','','PF1 5 minute no login request','PF1 5分鐘未有登入請求','1','1.0','0 */5 * * * ?','1','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CAL2','minute no login request(5分鐘未接獲請求)
[Step]
1.please check PF1 website & login function if normal
2.if website abnormal call L2','tomcat*','*login.do* AND *com.ubg.login.AAUtils*','now-5m','now','5','','testAs02','2021-07-13 04:59:30','testAs','2021-08-04 09:59:37',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('CHK-CAL2-ELM-242','','PF2 5 minute no login request','PF2 5分鐘未有登入請求','0','5.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','4','AS','0','CHK','minute no login request(5分鐘未接獲請求)
[Step]
1.please check PF2 website & login function if normal
2.if website abnormal call L2','action-*','context.path_pattern : "/customer-web-service/resources/sessions"','now-5m','now','5','','testAs02','2021-07-21 01:51:05','testAs02','2021-07-21 13:55:29',null);
INSERT INTO moni_elastic (asid,TICKET_NUMBER,EN_NAME,CH_NAME,STATUS,PLATFORM,CRON_EXPRESSION,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,DESCR,`INDEX`,QUERY,TIME_FROM,TIME_TO,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,LAST_ALERT) VALUES
('URG-CAL2-ELM-243','','PF1 microWithdraw stuck(failed)','PF2 小額提現卡住(失敗)','0','1.0','0 */5 * * * ?','0','*LOG Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*

` {result}`

` {descr}`','3','AS','0','CHK','PF1 microWithdraw stuck(failed)
[Step]
1.FOLLOW SOP
   https://wiki.yxunistar.com/pages/viewpage.action?pageId=74005547
   MicroWithdraw Stuck DATA_PATCH
2.Prepare datapatch & call L2','tomcat*',' "json.message": "runUbHedgeSchedule ex"','now-5m','now','3','1','testAs02','2021-08-05 02:50:50','testAs','2021-08-06 14:39:29',null);