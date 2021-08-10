truncate table moni_job;

INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-3:EID-265','',' Check negative return point',' 檢查是否有負返點產生','【 L1 Actions 】
1. Callback alert and check if export was sent to AS Teams

【 L2 Actions 】
1. 不需要立即處理，於上班日再做處理','0','ub8-pf1-sec','1.0','0 32 2,10,14 * * ?','SELECT ACCOUNTS, BILLTYPE, BILL_AMOUNT, TO_CHAR( BILL_TIME, ''yyyy-mm-dd hh24:mi:ss'' ) AS BILL_TIME, ORDERNO, SORTID
FROM LOTT_NEW_A3D1.LOTT_ACCOUNTS_BILL
WHERE BILLTYPE IN (''1100'', ''0001'')
    AND BILL_TIME + 1 > SYSDATE
    AND BILL_AMOUNT < 0','5','','admin','2015-08-19 14:42:24','martmil.n','2021-06-11 15:10:39','265','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-4','',' Check miss lott_member_info_assi data',' 檢查lott_member_info_assi是否有資料移漏','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-4> ，PF1，DB trigger 被關閉了，很有可能是被黑了，請 DBA 開啓 trigger ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
檢查 DB trigger用的, 當 assi表有數據遺漏，表示 DB trigger 被關閉了，很有可能是被黑了
需要馬上處理 ( 請 DBA 開啓 trigger )','0','ub8-pf1-sec','1.0','0 33 2,10,14 * * ?','SELECT ACCOUNTS, REGTIME FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO WHERE ACCOUNTS NOT IN (SELECT ACCOUNTS FROM LOTT_NEW_A3D1.LOTT_MEMBER_INFO_ASSI)ORDER BY REGTIME','5','','admin','2015-08-19 14:43:12','martmil.n','2021-06-11 15:11:41','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-5:EID-269','',' Find out undraw order',' 查詢應開獎而未開獎訂單','【 L1 Actions 】
1. Callback alert and check if export was sent to AS Teams

【 L2 Actions 】
1. 不需要立即處理，於上班日再做處理','0','ub8-pf1-sec','1.0','0 0/1 * * * ?','SELECT lb.orderno,lb.accounts,lb.numero,to_char(lb.bet_time,''yyyy-mm-dd hh24:mi:ss'') bet,to_char(lt.win_date,''yyyy-mm-dd hh24:mi:ss'') win,to_char(lr.last_date,''yyyy-mm-dd hh24:mi:ss'') last,lb.device,lb.total_amount,lb.total_num,lb.total_winprice,lb.device ,lb.recall
FROM LOTT_NEW_A3D1.lott_fc3d_order_main lb,LOTT_NEW_A3D1.lott_win_records lr,LOTT_NEW_A3D1.lott_manaul_temp lt,LOTT_NEW_A3D1.lott_current_numero ln
WHERE lb.numero= lr.numero
	AND lt.numero=lr.numero
	AND lr.sortid=lt.sortid
	AND lb.sortid=lr.sortid
	AND lt.sortid=ln.sortid
	AND lb.numero < ln.cnumero
	AND lb.bet_time > SYSDATE-1/24/60*2
	AND lb.status=''002''','5','','admin','2015-08-19 14:44:25','martmil.n','2021-06-11 15:12:48','269','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-6','',' Find out order that is over draw time',' 超過開獎時間後投注進來的訂單','If Order Count is > 5 , <<CALL L2>>
Otherwise do checking:
【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <CHK-MID-6> ，PF1，超過開獎時間後投注進來的訂單 ]
2. Follow SOP to check if normal: https://wiki.yxunistar.com/x/JpI4','0','ub8-pf1-sec','1.0','1 0/5 * * * ?','SELECT lb.orderno, lb.accounts, lb.numero, to_char(lb.bet_time,''yyyy-mm-dd hh24:mi:ss'')bet_time, to_char(lt.win_date,''yyyy-mm-dd hh24:mi:ss'')expect_win_date,to_char(lr.last_date,''yyyy-mm-dd hh24:mi:ss'') really_win_date,lb.total_amount,lb.total_num,lb.total_times,lb.total_winprice
FROM LOTT_NEW_A3D1.lott_fc3d_order_main lb,LOTT_NEW_A3D1.lott_win_records lr,LOTT_NEW_A3D1.lott_manaul_temp lt
WHERE lb.numero= lr.numero
	AND lt.numero=lr.numero
	AND lr.sortid=lt.sortid
	AND lb.sortid=lr.sortid
	AND lb.bet_time >= lt.win_date
	AND lb.bet_time<=lr.last_date
	AND lb.bet_time > SYSDATE-1/24/60*6','5','','admin','2015-08-19 14:46:03','martmil.n','2021-06-11 15:13:28','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-7','',' Find out account from block IP',' 利用黑名單IP查詢登入的帳號','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-7> ，PF1，有黑名單用戶IP登入，L2 須立即通知SRV-ACS ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1.需要立刻由L2通知SRV-ACS','0','ub8-pf1-sec','1.0','2 0/5 * * * ?','SELECT ACCOUNT,TO_CHAR(REG_TIME,''YYYY-MM-DD HH24:MI:SS'') REGTIME
FROM LOTT_NEW_A3D1.lott_auto_reg_link_account
WHERE reg_ip IN (''119.90.13.92'',''222.240.92.158'',''113.246.61.169'',''118.249.113.102'',''118.249.113.102'',''118.249.19.239'',''113.240.85.194'',''222.247.238.62'',''222.240.92.158'',''175.0.63.67'')
	AND ACCOUNT NOT IN (''wangpengnimei'',''xieyanyang'',''woaialibaba'',''xiaoxiaoyanzi'',''touwenzid'')','5','','admin','2015-08-19 14:46:55','martmil.n','2021-06-11 15:13:51','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-8','',' Find out accounts from block bank account',' 利用黑名單銀行帳戶查詢登入的帳號','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-8> ，PF1，有用戶利用黑名單銀行帳戶查詢登入的帳號，L2 須立即通知SRV-ACS ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1.需要立刻由L2通知SRV-ACS','0','ub8-pf1-sec','1.0','3 0/5 * * * ?','SELECT ACCOUNTS,BANKNAME,BANKCARDNO
FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK
WHERE BANKCARDNO IN (''6212262010018423205'',''6222081103002996178'',''6212261702002745204'',''6212262010018427721'',''6212261703000393602'')
	AND ACCOUNTS NOT IN (''wangpengnimei'',''xieyanyang'',''woaialibaba'',''xiaoxiaoyanzi'',''touwenzid'')','5','','admin','2015-08-19 14:49:03','martmil.n','2021-06-11 15:14:44','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-9','',' Find out accounts by different name',' 透過不同綁定姓名查詢被竄改的帳號。银行卡姓名与绑卡姓名不同','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-9> ，PF1，有用戶透過不同綁定姓名查詢被竄改的帳號(注意是否被盜用帳號)，L2 須立即通知SRV-ACS ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. 需要立刻由L2通知SRV-ACS

','0','ub8-pf1-sec','1.0','4 0/5 * * * ?','SELECT ACCOUNTS
FROM LOTT_NEW_A3D1.LOTT_CARDNAME_UPDATE_HIS
WHERE ACCOUNTS IN (SELECT DISTINCT LM.ACCOUNTS
					FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO LM, LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK LB
					WHERE LM.ACCOUNTS = LB.ACCOUNTS
						AND LM.CARD_NAME <> LB.REALNAME
						AND TRUNC(LM.REGTIME) > TO_DATE(''2014-01-01'', ''yyyy-mm-dd'')
						AND LM.ACCOUNTS NOT IN ('''',''wangpengnimei'', ''xieyanyang'', ''woaialibaba'',''88798gogo'', ''xiaoxiaoyanzi'',''touwenzid''))
HAVING COUNT(1) = 1
GROUP BY ACCOUNTS','5','','admin','2015-08-19 14:52:41','martmil.n','2021-06-11 15:15:16','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-10','',' Find out accounts by register link',' 透過注冊連結IP取得違法帳號	','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-10> ，PF1，有用戶透過註冊連結IP取得違法帳號，L2 須立即通知SRV-ACS ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. 需要立刻由L2通知SRV-ACS','0','ub8-pf1-sec','1.0','5 0/5 * * * ?','SELECT  ACCOUNT,TO_CHAR(REG_TIME,''YYYY-MM-DD HH24:MI:SS'') REGTIME
FROM LOTT_NEW_A3D1.LOTT_AUTO_REG_LINK_ACCOUNT
WHERE REG_IP IN(''119.90.13.92'',''222.240.92.158'',''113.246.61.169'',''118.249.113.102'',''118.249.113.102'',''118.249.19.239'',''113.240.85.194'',''222.247.238.62'',''222.240.92.158'',''175.0.63.67'')
	AND ACCOUNT NOT IN(''wangpengnimei'',''xieyanyang'',''woaialibaba'',''xiaoxiaoyanzi'',''touwenzid'')','5','','admin','2015-08-19 14:54:26','martmil.n','2021-06-11 15:15:42','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-11','',' Check trigger is enable',' 檢查trigger是否運行','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-11>，PF1，DB trigger 被關閉了，很有可能是被黑了，請 DBA 開啓 trigger ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. 請 DBA 開啓 trigger','0','ub8-pf1-sec','1.0','6 0/5 * * * ?','SELECT TRIGGER_NAME,STATUS
FROM ALL_TRIGGERS
WHERE STATUS <> ''ENABLED''','5','','admin','2015-08-19 14:55:41','martmil.n','2021-06-11 15:16:18','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-15','',' Super Admin monitoring',' 超級管理員監控','If count is greater than 5
<<CALL L2 and L2 TEAM LEADER>>
【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-15>，PF1，Super Admin monitoring, please L2 Team Leader 處理]
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','SELECT CASE WHEN COUNT(1) > 7 THEN 1 ELSE 0 END
FROM LOTT_NEW_A3D1.LOTT_VW_ADMIN
WHERE ROLEID=7097','1','0','admin','2015-08-19 15:01:09','martmil.n','2021-06-11 15:16:45','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CHK-CAL2-MID-17','',' daily_backup_check',' daily_backup執行檢查','【 L1 Actions 】
1. After the call, do checking: if no result or less than 50, pls do the following check at 6:10.
2. select count(*) from lott_oper_log where oper_type = ''05'' and oper_time + 1/24 > sysdate and oper_context = ''業務日期更新結束'';
3. If the count = 1 then means OK, otherwise CALL L2!
4. Copy to AS Teams [ Hi L2, CMS <URG-CHK-CAL2-MID-17>，PF1，daily_backup 檢查異常，請依照https://wiki.yxunistar.com/x/So44step 3 步驟處理]
5. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1.https://wiki.yxunistar.com/x/So44do step 3','0','ub8-pf1-sec','1.0','0 15 6 * * ?','SELECT COUNT(*) AS TOTAL FROM LOTT_NEW_A3D1.LOTT_OPER_LOG
WHERE OPER_TIME + 0.5 > SYSDATE
	AND TO_CHAR(OPER_TIME,''HH24:MI'') BETWEEN ''06:00'' AND ''06:07''
	AND OPER_TYPE = ''05''
GROUP BY TO_CHAR(OPER_TIME, ''YYYY-MM-DD'' )','3','50','admin','2015-08-19 15:11:33','riel_john','2021-06-11 15:16:29','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-19','',' Check lott_recall_stop',' 出號放棄殘留訂單檢查','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-MID-19>，PF1，出號放棄殘留訂單檢查異常，有殘留數據 ]
【 L2 Actions 】
1. 不需要立即處理，於上班日再做處理
2.https://wiki.yxunistar.com/x/qYk4','0','ub8-pf1-sec','1.0','0 0 7 * * ?','SELECT COUNT(*) AS TOTAL
FROM LOTT_NEW_A3D1.LOTT_RECALL_STOP A
WHERE  (
	NOT EXISTS (SELECT 1 FROM LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN WHERE ORDERNO = A.ORDERNO)
	OR EXISTS (SELECT 1 FROM LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN WHERE ORDERNO = A.ORDERNO AND STATUS = ''012'')
)  AND STATUS = ''1''','1','0','admin','2015-08-19 15:16:54','riel_john','2021-06-11 15:16:58','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-RST-CAL2-MID-22','',' Find which FE stop updating Numero',' 檢查內存期號未更新服務器','【 L1 Actions 】
1. Call L2 and inform them you will restart the FE server, Copy to AS Teams [ Hi L2, CMS <URG-RST-CAL2-MID-22>，PF1，檢查內存期號未更新服務器，L2 需要過來整理理賠訂單明細，https://wiki.yxunistar.com/x/UJA4]
2. Stop nginx of FE on alert https://wiki.yxunistar.com/x/9ow4
3. Get Tomcat Thread log (before tomcat restart):https://wiki.yxunistar.com/x/UJA4
4. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1.L2 需要整理理賠訂單明細
2.L2 需要打電話通知team leader
3.https://wiki.yxunistar.com/x/UJA4','0','ub8-pf1-sec','1.0','8 0/1 * * * ?','with aa as (
select substr( orderno , -1 ) as orderno, count(*) as cnt
from LOTT_NEW_A3D1.lott_fc3d_order_main A
left join LOTT_NEW_A3D1.lott_manaul_temp B on A.sortid = B.sortid
 and A.numero = B.numero

 where A.status = ''002''
 and B.state = ''1''
 and A.bet_time + 20/24/60 > sysdate
 and A.bet_time > B.WIN_DATE + 5/24/60/60
group by substr( orderno , -1 )
)
select
 case when orderno = ''A'' then ''FE1''
      when orderno = ''B'' then ''FE2''
	  when orderno = ''C'' then ''FE3''
	  when orderno = ''D'' then ''FE4''
	  when orderno = ''F'' then ''VIP'' end as VM,
 CNT
from  aa
where CNT > 2
','5','','admin','2015-08-19 15:20:58','riel_john','2021-06-11 15:18:11','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-25','',' Check if there are duplicate withdrawal tasks',' 檢查是否有重複的提現審單任務','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-MID-25>，PF1，不是緊急，重覆的提現審單任務 ]
【 L2 Actions 】
1. 不需要立即處理

','0','ub8-pf1-sec','1.0','0 0 * * * ?','select task_id, max( GENERATE_TIME) ,
max( case when OPERATOR_ID = 0 or remarks like ''%自动审单%'' then gid end) as sys_gid,
max( case when nvl( OPERATOR_ID, 99 ) <> 0 and remarks not like ''%自动审单%''  then gid end) as other_gid,
count(*) as cnt
from LOTT_NEW_A3D1.wkf_tasks
where task_type = 1
 and task_subtype = 1
group by task_id
having count(*) > 1','5','','joseph','2015-09-07 17:20:00','jason','2020-09-28 09:47:58','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-27','',' Check PF1 Lott bet count',' 確認PF1彩種是否有投注量','【 L1 Actions 】
1. If have data, pls do the following check at 11:00 AM
2. Go to PF1 and try to bet the game, if can bet it''s normal and if can''t CALL L2.
3. Copy to AS Teams [ Hi L2, CMS <CHK-MID-27>，PF1，是緊急的，目前有彩種無法進行投注 ]
【 L2 Actions 】
通知L2 Leader協助調查','0','ub8-pf1-sec','1.0','0 0 11 * * ?','with aa as (
  select *
  from LOTT_NEW_A3D1.LOTT_GROUP_SERIES
  where GROUP_TYPE = ''1''and GROUP_VALUE NOT IN (''20001'',''20002'', ''20003'', ''145'',''1792103'')
 ), bb as (
 select
   sortid, count(*) order_cnt
   from LOTT_NEW_A3D1.lott_fc3d_order_main
   where bet_time between trunc(sysdate)+(7/24) and trunc(sysdate)+(11/24)
   group by sortid
)
select
  aa.param_one as lott_kind,
  nvl ( bb.order_cnt , 0 )
from aa
left join LOTT_NEW_A3D1.bb on aa.GROUP_VALUE = bb.sortid
where nvl ( bb.order_cnt , 0 ) = 0
and aa.param_one not like ''%JXSSC%''','5','','vicky','2015-12-04 11:58:11','martmil.n','2019-11-21 20:08:14','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-28','',' Check PF2 Lott bet count',' PF2 監控各彩種投注量是否正常','【 L1 Actions 】
1. If have data, pls do the following check at 11:00 AM
2. Go to PF2 and try to bet the game, if can bet it''s normal and if can''t check Draw Number Provider in https://wiki.yxunistar.com/pages/viewpage.action?pageId=73994717
(1) PED : ask PED
(2) UU/JY8 : call L2
3.Copy to AS Teams [ Hi L2, CMS <CHK-MID-28>，PF2 是緊急的，目前有彩種疑似無法進行投注，請測試遊戲是否能夠順利投注，若無法請調查問題 ]

【 L2 Actions 】
若短時間無法解決，請通知其他L2並通報2.0開發協助調查。','0','ub8-pf5-core-sec','5.0','0 0 11 * * ?','WITH AA AS (
  SELECT *
  FROM CORE.LGS_GAME LG
  WHERE GAME_SWITCH != ''0''
), BB AS (
 SELECT
   GAME_ID, COUNT(*) ORDER_CNT
   FROM CORE.LGS_ORDER_MASTER LM
   WHERE CREATE_TIME BETWEEN TRUNC(SYSDATE)+(7/24) AND TRUNC(SYSDATE)+(11/24)
   GROUP BY GAME_ID
)
SELECT
  AA.CODE AS LOTT_KIND,
  NVL ( BB.ORDER_CNT , 0 )
FROM AA
LEFT JOIN BB ON AA.GAME_ID = BB.GAME_ID
WHERE NVL ( BB.ORDER_CNT , 0 ) = 0','5','','vicky','2015-12-04 12:25:03','jason','2020-11-17 15:06:15','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-31','',' Check PF1 FE dead or alive',' 檢查PF1 FE是死還是活','【 L1 Actions 】
1. If you find any result, it means the server may be dead
2.Check PF1 Login & Lott betting if abnormal
  call L2
3.Check PF1 process by used jump_server  connect to
  172.30.101.71 and ps -ef | grep java
4.Login to the FE to check the catalina.out if there is any error in the end of the file: (tail -200
catalina.out | grep ''SEVERE'' -A3)
5.try  to restart FE1&FE2
http://jenkins.nuttli.com/view/PF-AS/job/AS_PF1_Service_Restart/','0','ub8-pf1-sec','1.0','0 10,20,30,40,50,59 0-5,7-23 ? * MON-SAT','with aa as (
select substr( orderno , -1 ) as orderno, count(*) as cnt
from LOTT_NEW_A3D1.lott_fc3d_order_main A
where A.bet_time + 10/24/60 > sysdate
group by substr( orderno , -1 )
), bb as (
 select ''B'' as orderno, ''FE1'' as FE from dual
 union all
 select ''A'' as orderno, ''FE2'' as FE from dual
 --union all
 --select ''D'' as orderno, ''FE4'' as FE from dual
 --union all
 --select ''E'' as orderno, ''FE3'' as FE from dual
 --union all
 --select ''F'' as orderno, ''VIP'' as FE from dual
)
select
  bb.*
from  LOTT_NEW_A3D1.bb
left join LOTT_NEW_A3D1.aa on aa.orderno = bb.orderno
where aa.orderno is null','5','','joseph','2016-01-20 16:45:49','lance','2021-07-12 18:03:16','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-32','',' Check PF1 FE dead or alive',' 檢查PF1 FE是死還是活','【 L1 Actions 】
1. If you find any result, it means the server may be dead
2. Telnet 172.30.101.XX 8080 , to see if there is any response. change the IP by yourself.
3. Login to the FE to check the catalina.out if there is any error in the end of the file: (tail -200 catalina.out | grep ''SEVERE'' -A3)
4. Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-31>，PF1，Check PF1 FE dead or alive，我們已經重起此伺服器 ]','0','ub8-pf1-sec','1.0','0 10,20,30,40,50,59 0-2,8-23 ? * SUN','with aa as (
select substr( orderno , -1 ) as orderno, count(*) as cnt
from LOTT_NEW_A3D1.lott_fc3d_order_main A
where A.bet_time + 8/24/60 > sysdate
group by substr( orderno , -1 )
), bb as (
 select ''B'' as orderno, ''FE1'' as FE from dual
 --union all
 --select ''A'' as orderno, ''FE2'' as FE from dual
 --union all
 --select ''D'' as orderno, ''FE4'' as FE from dual
 --union all
 --select ''E'' as orderno, ''FE3'' as FE from dual
 --union all
 --select ''F'' as orderno, ''VIP'' as FE from dual
)
select
  bb.*
from  LOTT_NEW_A3D1.bb
left join LOTT_NEW_A3D1.aa on aa.orderno = bb.orderno
where aa.orderno is null','5','','joseph','2016-01-20 16:48:40','martmil.n','2019-11-21 20:10:18','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-34','',' PF2 Check double send bonus for agent',' PF2 代理返点重复派发监控','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-34>，PF2，是緊急的，代理返點重復派發監控異常。]
【 L2 Actions 】
2. Create an ASI for this urgent MID and post it on AS General
通知L2 Leader協助調查。

','0','ub8-pf5-core-sec','5.0','0 0 10 * * ?','---select ACCOUNT_ID,ORDERNO,NUMERO, SUM(AMT) AMT, trunc(AMT_TIME) AMT_TIME,COUNT(1) CNT
---from ODS.ODS_ACCOUNT_BILL
---where BILL_TYPE = 1100 AND trunc(AMT_TIME)=trunc(sysdate)
---group by trunc(AMT_TIME),ORDERNO,NUMERO,ACCOUNT_ID
---having count(0) > 1
---ORDER BY 1 DESC
---新的
select ACCOUNT_ID,ORDER_NO,NUMERO,TX_BIZ_DATE,COUNT(1) CNT
from CORE.ACS_TRANSACTION WHERE TX_TYPE_ID=1100 AND CREATE_TIME > trunc(sysdate)
group by ACCOUNT_ID,ORDER_NO,NUMERO,TX_BIZ_DATE
having count(0) > 1
ORDER BY 1 DESC','5','','phoenix','2016-02-21 04:21:49','jason','2021-07-20 16:47:27','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-35','',' PF2 Check double send bonus for Betting',' PF2 投注返點重复派发监控','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-35>，PF2，是緊急的，投注返點重復派發監控異常 ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
通知L2 Leader協助調查。','0','ub8-pf5-core-sec','5.0','0 55 9 * * ?','select
order_no,account_id,numero,count(0) , max(remark), max(amount)
from core.acs_transaction
where tx_time >= trunc(sysdate -1)
  and tx_time < trunc(sysdate )
and tx_type_id = 1
group by order_no,account_id,numero having count(0) > 1
','5','','phoenix','2016-02-24 11:57:02','Nikki.o','2020-10-06 15:08:38','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-36','',' PF2 Check double send bonus for Winning',' PF2 投注中獎重复派发监控','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-36>，PF2，是緊急的，投注中獎重復派發監控異常]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
通知L2 Leader協助調查。','0','ub8-pf5-core-sec','5.0','0 2 10 * * ?','select
order_no,account_id,numero,count(0) , max(remark) remark , max(amount)  amount
from core.acs_transaction
where
 tx_time >= trunc(sysdate - 1 ) and tx_time < trunc( sysdate )
 and tx_type_id = 2005
 and order_no is not null
group by order_no,account_id,numero having count(0) > 1 ','5','','phoenix','2016-02-24 14:51:43','Nikki.o','2020-10-06 15:22:59','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-37','',' PF2 Check double send bonus for Casual Game Rebates',' PF2 休閒遊戲投注返點重复派发监控','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-37>，PF2，是緊急的，休閒遊戲投注返點重復派發監控 ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
通知L2 Leader協助調查。','0','ub8-pf5-core-sec','5.0','0 3 10 * * ?','select
order_no,account_id,numero,count(0) cnt, max(remark) remark , max(amount) amount
from core.acs_transaction
where
 tx_time >= trunc(sysdate - 1)
 and tx_time < trunc(sysdate )
and tx_type_id = 2
group by order_no,account_id,numero having count(0) > 1
','5','','phoenix','2016-02-24 14:53:36','Nikki.o','2020-10-06 15:56:14','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-38','',' PF2 Check double send bonus for Agent Rebates Casual Game',' PF2 休閒遊戲代理返點重复派发监控','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-38>，PF2，是緊急的，休閒遊戲代理返點重復派發監控異常 ]
【 L2 Actions 】
2. Create an ASI for this urgent MID and post it on AS General
通知L2 Leader協助調查。','0','ub8-pf5-core-sec','5.0','0 1 10 * * ?','select
order_no,account_id,numero,count(0) , max(remark), max(amount)
from core.acs_transaction
where
 tx_time >= trunc(sysdate - 1)
 and tx_time < trunc(sysdate )
and tx_type_id = 1200
group by order_no,account_id,numero having count(0) > 1
','5','','phoenix','2016-02-24 14:57:50','denice.d','2020-12-01 17:10:16','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-39','',' Check PF1 drawing process stop',' 檢查PF1開奬中斷','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-39>，PF1，是緊急的，檢查PF1開獎中斷異常。 ]
【 L2 Actions 】
通知L2 Leader協助調查。
參考wiki進行patch https://wiki.yxunistar.com/x/Ro44','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','select * from LOTT_NEW_A3D1.lott_queue_info
where COMMENTS like ''%ORA%''
 and (  CREATE_TIME + 10/24/60 > sysdate or end_time + 10/24/60 > sysdate ) ','5','','joseph','2016-03-04 00:33:23','gavin.h','2020-10-01 16:42:32','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-40','',' PF2 Draw abnormally stopped',' PF2 開奬中斷檢查','【 L1 Actions 】
1.Copy [ Hi L2, CMS <URG-CAL2-MID-40>，PF2，是緊急的，開獎中斷 ] to Telegram and AS Teams
2. Inform AS that you doing now the SOP.
3. Do this SOP and check with L2: https://wiki.yxunistar.com/x/VAfhB
4. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','0 0/2 * * * ?','SELECT
 GAME_CODE,
 MAX( CASE WHEN REWARD_STATUS  IN (1,2) THEN NUMERO END ) AS 最後成功開奬期號,
 MAX( CASE WHEN REWARD_STATUS  = ''0'' THEN NUMERO END ) AS 卡住的期號,
 MAX( CASE WHEN REWARD_STATUS  = ''0'' THEN LOG_STEP END ) AS 卡在哪一步
FROM CORE.LGS_DRAW_NUMBER_RESULT WHERE
(CREATE_TIME  < SYSDATE -3/24/60 ) and
(GAME_CODE <> ''UUBJ5FC'') AND
(GAME_CODE <> ''TXFFC'') AND
(GAME_CODE <> ''UUFF11X5'') AND
(GAME_CODE <> ''BJKL8'')
GROUP BY GAME_CODE
HAVING COUNT( CASE WHEN REWARD_STATUS   = ''2'' THEN 1 END ) > 0','5','','monti','2016-03-08 21:45:28','lance','2021-08-02 15:02:35','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-42','',' PF2 Check if Repeat Send Award for our rule1',' PF2 重复派奖监控1(MON-SAT','【 L1 Actions 】
1. If data more than 0 , Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-42>，PF2, Repeat Send Award ]
2. ASAP do SOP:https://wiki.yxunistar.com/x/3ok4
3. Copy to Telegram and AS Teams [ Hi L2, CMS <URG-CAL2-MID-42> ，PF2，是緊急的，重復派獎監控1(MON-SAT)監控提示異常 ]
4. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-draw','5.0','0 0/1 0-5,7-23 ? * MON-SAT','select *  from draw.dcs_ub8_numero
where VERSION > 1 and WIN_TIME >= sysdate -5/24/60','5','','jordan','2016-03-15 10:23:17','Nikki.o','2020-10-06 15:58:01','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-43','',' PF2 Check if Repeat Send Award for our rule2',' PF2 重复派奖监控2(SUN','【 L1 Actions 】
1. If data more than 0 , Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-43>，PF2, Repeat Send Award ]
2. ASAP do SOP:https://wiki.yxunistar.com/x/3ok4
3.Copy to Telegram and AS Teams [ Hi L2, CMS <URG-CAL2-MID-43>，PF2，是緊急的，PF2 重復派獎監控2(SUN)監控提示異常 ]
4. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-draw','5.0','0 0/1 0-3,8-23 ? * SUN','select *  from draw.dcs_ub8_numero
where VERSION > 1 and WIN_TIME >= sysdate -5/24/60','5','','jordan','2016-03-16 10:04:42','Nikki.o','2020-10-06 15:58:31','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-47','',' Abnormal cancel order check',' 不正常個人撤單監控','【 L1 Actions 】
1. Copy immediately to AS-RC General [ 開獎後撤單訂單 ] with the account and orderno
2. Copy to AS Teams [ Hi L2, CMS <NU-MID-47> ，PF1，不是緊急，開獎後撤單訂單 ]','0','ub8-pf1-sec','1.0','0 0 * * * ?','select A.orderno, A.accounts,  B.win_date , A.into_time, A.total_amount
 from LOTT_NEW_A3D1.lott_fc3d_order_main A
 left join LOTT_NEW_A3D1.lott_manaul_temp B on A.sortid = B.sortid
  and A.numero = B.numero
where status = ''008''
 and A.into_time > B.win_date
 and A.into_time + 61/24/60 > sysdate','5','','joseph','2016-04-14 01:02:26','kimberlyclaire','2020-03-08 13:18:35','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-48','',' PF2 Abnormal cancel order check',' PF2 不正常個人撤單監控','【 L1 Actions 】
1. Do SOP
https://wiki.yxunistar.com/x/qo44
2. Post result to AS Teams [ Hi L2, CMS <NU-CHK-MID-48>，PF2，不正常個人撤單監控 ]','0','ub8-pf5-core-sec','5.0','0 40 7 * * ?','SELECT
A.GAME_CODE, A.NUMERO, D.ORDER_NUM, D.CUSTOMER_ID, A.UPDATE_TIME AS CANCEL_TIME,
 A.DRAW_TIME AS ACTUAL_DRAW_TIME,
 B.WINNING_TIME AS PLANED_DRAW_TIME,
 B.CREATE_TIME ACTUAL_DRAW
FROM CORE.LGS_ORDER_DETAIL A
LEFT JOIN CORE.LGS_DRAW_NUMBER_RESULT B ON A.GAME_CODE = B.GAME_CODE AND A.NUMERO = B.NUMERO
LEFT JOIN CORE.LGS_GAME_SETTING C ON A.GAME_CODE = C.GAME_CODE
LEFT JOIN CORE.LGS_ORDER_MASTER D ON A.ORDER_MASTER_ID = D.ORDER_MASTER_ID
WHERE A.UPDATE_TIME > B.WINNING_TIME - C.LOCKED/24/60/60
AND A.STATUS = 8
AND A.UPDATE_TIME >= TRUNC( SYSDATE -1 ) + 6/24
 AND A.UPDATE_TIME < TRUNC( SYSDATE ) + 6/24 ','5','','joseph','2016-04-14 09:56:38','mediza.p','2019-12-06 14:46:11','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-49','',' PF2 Cancel time after than locked period check',' PF2 鎖定期後投注監控','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <NU-MID-49>，PF2，不是緊急，鎖定期後投注監控 ]','0','ub8-pf5-core-sec','5.0','0 40 7 * * ?','SELECT
  A.GAME_CODE, A.NUMERO,  A.CREATE_TIME AS BET_TIME,
 A.DRAW_TIME AS ACTUAL_DRAW_TIME,
 B.WINNING_TIME AS PLANED_DRAW_TIME
FROM CORE.LGS_ORDER_DETAIL A
LEFT JOIN CORE.LGS_DRAW_NUMBER_RESULT B ON A.GAME_CODE = B.GAME_CODE
AND A.NUMERO = B.NUMERO
LEFT JOIN CORE.LGS_GAME_SETTING C ON A.GAME_CODE = C.GAME_CODE
WHERE A.CREATE_TIME > B.WINNING_TIME - C.LOCKED/24/60/60
AND A.CREATE_TIME >= TRUNC( SYSDATE -1 ) + 6/24
 AND A.CREATE_TIME < TRUNC( SYSDATE ) + 6/24','5','','joseph','2016-04-20 10:03:27','mediza.p','2019-12-06 14:46:39','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-50:EID-176/177/178/179/180/305','',' PF1_lott_profit_monitor',' PF1_lott盈利監控','【 L1 Actions 】
1. Callback alert and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 3 * * * ?','with aa as (
 select  sum( A.bill_amount )*-1 profit
 from LOTT_NEW_A3D1.lott_accounts_bill A
 join LOTT_NEW_A3D1.lott_fc3d_order_main B on A.orderno = B.orderno
  and B.status in ( ''004'' , ''005'' , ''020'' )
  and trunc(B.into_time) = trunc( sysdate )
)
select * from LOTT_NEW_A3D1.aa
where profit < -200000','5','','joseph','2016-04-28 15:39:06','martmil.n','2020-03-06 18:02:22','176,177,178,179,180,305','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-51','',' PF1 Cancelled orders transaction summation check',' PF1撤單訂單帳變檢查','【 L1 Actions 】
1. Copy to Telegram and AS Teams [ Hi L2, CMS <URG-CAL2-MID-51>，PF1，是緊急的，撤單訂單帳變檢查異常 ]
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf1-sec','1.0','0 0 0/1 * * ?','select A.orderno, sum( B.BILL_AMOUNT ) as amt
from LOTT_NEW_A3D1.lott_fc3d_order_main A
left join LOTT_NEW_A3D1.lott_accounts_bill B on A.orderno = B.orderno  and B.billtype <> ''2051''
where status not in ( ''002'' , ''004'', ''005'' , ''020'' )
 and bet_time between sysdate -1.1/24 and sysdate
group by A.orderno
having sum( B.BILL_AMOUNT ) > 0','5','','joseph','2016-05-11 11:26:26','Nikki.o','2020-10-06 15:59:09','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-52','',' PF2 Cancelled orders transaction summation check',' PF2 撤單訂單帳變檢查','【 L1 Actions 】
1. Copy the warning message to AS-RC on Teams
2. Copy to Telegram and AS Teams [ Hi L2, CMS <URG-CAL2-MID-52>，PF2，是緊急的，撤單訂單帳變檢查異常 ]
3. Create an ASI for this urgent MID and post it on AS General

','0','ub8-pf5-core-sec','5.0','0 0/5 * * * ?','WITH AA AS (
SELECT C.ORDER_NO,SUM( C.AMOUNT ) AMT , C.CUSTOMER_NAME
FROM CORE.LGS_ORDER_DETAIL A
LEFT JOIN CORE.LGS_ORDER_MASTER B ON A.ORDER_MASTER_ID = B.ORDER_MASTER_ID
LEFT JOIN CORE.ACS_TRANSACTION C ON B.ORDER_NUM = C.ORDER_NO
 AND A.NUMERO = C.NUMERO
 AND C.TX_TYPE_ID <> ''2051''
WHERE A.STATUS NOT IN ( 2, 4, 5 , 20 )
 AND A.CREATE_TIME BETWEEN SYSDATE -1/48 AND SYSDATE + 1/48
GROUP BY C.ORDER_NO, C.CUSTOMER_NAME HAVING SUM( C.AMOUNT ) > 0
)
SELECT  ''用户 ''||CUSTOMER_NAME||''订单号 ''|| ORDER_NO||'' 撤单重复给钱, 總金额 ''||AMT AS WARNING_MESSAGE
FROM AA

','5','','joseph','2016-05-11 11:48:43','lance','2021-07-20 16:22:35','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-53:EID-181/182/183/184/307','',' PF2_lott_profit_monitor',' PF2_lott盈利監控','【 L1 Actions 】
1. Callback alert and check if export was sent to RC Monitor Alert','0','ub8-pf5-core-sec','5.0','20 3 * * * ?','WITH AA AS (
  SELECT
    B.GAME_CODE GAME_CODE, C.ORDER_NUM ORDER_NO, D.REMARK GAME_NAME, B.NUMERO
  FROM CORE.LGS_ORDER_DETAIL B
  LEFT JOIN CORE.LGS_ORDER_MASTER C ON C.ORDER_MASTER_ID = B.ORDER_MASTER_ID
  LEFT JOIN CORE.LGS_GAME D ON D.CODE = B.GAME_CODE
  WHERE B.STATUS IN ( 4,  5 ) AND  TRUNC(B.DRAW_TIME) = TRUNC( SYSDATE - 1/24 )
)
SELECT SUM(平台利润)
  FROM(SELECT AA.GAME_NAME 彩种, SUM(A.AMOUNT)*-1 平台利润
         FROM CORE.ACS_TRANSACTION A
         JOIN AA ON A.ORDER_NO = AA.ORDER_NO
          AND AA.NUMERO = A.NUMERO
         GROUP BY AA.GAME_NAME
         ORDER BY 平台利润 DESC)
 HAVING SUM(平台利润) < -200000 ','5','','joseph','2016-05-30 12:03:31','jason','2021-07-20 16:48:10','181,182,183,184,307','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-55','',' Order hourly check',' 每小時開獎訂單確認','每小時開獎訂單確認，在下一小時的第10分鐘計算有效與無效訂單數，並個別列出
The hourly lottery order confirmation, the number of valid and invalid orders is calculated in the 10th minute of the next hour, and is listed separately
【 L1 Actions 】
1. CallBack alert','0','ub8-pf1-sec','1.0','0 10 * * * ?','with tt as (
	select
		orderno ,
		sum( case when billtype = ''0001'' then BILL_AMOUNT end) as bet_ret_amount,
		sum( case when billtype = ''1100'' then BILL_AMOUNT end) as agent_ret_amount
	from LOTT_NEW_A3D1.lott_accounts_bill
	where billtype in (  ''0001'' , ''1100'' )
	and BILL_TIME >= trunc( SYSDATE - 1/24, ''hh'') and BILL_TIME < trunc( SYSDATE , ''hh'')
	group by orderno
), order_table as(
	select
		trunc(o.into_time, ''hh'') as into_time,
		o.accounts,
		g.param_one as sortid,
		sum(o.total_amount) as bet,
		sum(o.total_winprice) as win,
		sum( tt.bet_ret_amount ) as bet_ret_amount,
		sum( tt.agent_ret_amount ) as agent_ret_amount,
		count(1) as recall_counter,
		count(case when o.orderno = o.restarno then 1 end ) as order_counter
	from LOTT_NEW_A3D1.lott_fc3d_order_main o
	left join LOTT_NEW_A3D1.tt on o.orderno = tt.orderno
	left join LOTT_NEW_A3D1.lott_group_series g on o.sortid = g.group_value and g.GROUP_TYPE = ''1''
	where o.status in (''004'',''005'',''020'')
	and o.into_time >= trunc( SYSDATE - 1/24, ''hh'') and o.into_time < trunc( SYSDATE , ''hh'')
	group by trunc(o.into_time, ''hh''), o.accounts, g.param_one
	order by accounts, sortid
), bb as (
    select
          trunc( A.BILL_TIME, ''hh'') as into_time,
          A.accounts,
          ''Casual ''||tgi_id as sortid,
          sum( case when bill_type = ''2007'' then AMOUNT else 0 end  ) as bet,
          sum( case when bill_type = ''2005'' then AMOUNT else 0 end  ) as win,
          sum( case when bill_type = ''2007'' then AMOUNT * nvl( B.RET_VALUE , 0 ) else 0 end  )  as bet_ret_amount,
		  0 as agent_ret_amount,
          0 as recall_counter,
          0 as order_counter
        from LOTT_NEW_A3D1.lott_3rd_accounts_bill_data A
                left join LOTT_NEW_A3D1.lott_accounts_series B on A.accounts = B.accounts
                 and B.GROUP_ID = 4
        where BILL_TIME >= trunc( SYSDATE - 1/24, ''hh'') and BILL_TIME < trunc( SYSDATE , ''hh'')
   group by A.accounts , trunc( BILL_TIME, ''hh'') , tgi_id
), other_status as(
	select
		trunc(o.into_time, ''hh'') as into_time,
		o.accounts,
		g.param_one as sortid,
		sum(o.total_amount) as bet,
		sum(o.total_winprice) as win,
		sum( tt.bet_ret_amount ) as bet_ret_amount,
		sum( tt.agent_ret_amount ) as agent_ret_amount,
		count(1) as recall_counter,
		count(case when o.orderno = o.restarno then 1 end ) as order_counter
	from LOTT_NEW_A3D1.lott_fc3d_order_main o
	left join LOTT_NEW_A3D1.tt on o.orderno = tt.orderno
	left join LOTT_NEW_A3D1.lott_group_series g on o.sortid = g.group_value and g.GROUP_TYPE = ''1''
	where o.status not in (''004'',''005'',''020'')
	and o.into_time >= trunc( SYSDATE - 1/24, ''hh'') and o.into_time < trunc( SYSDATE , ''hh'')
	group by trunc(o.into_time, ''hh''), o.accounts, g.param_one
	order by accounts, sortid
)
select ''OrderCount'' ORDERCOUNT,
   count(*) COUNT
from LOTT_NEW_A3D1.order_table
union all
select ''ThirdCount'',
   count(*)
from LOTT_NEW_A3D1.bb
union all
select ''Others'',
   count(*)
from LOTT_NEW_A3D1.other_status','0','','kevin','2016-10-03 13:54:03','martmil.n','2019-11-21 20:19:46','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-57','',' PF2 check JPS drawing process stop',' 檢查PF2超級大奬開奬中斷','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-57>, PF2，是緊急的，檢查PF2超級大獎開獎中斷異常 ] 【 L2 Actions 】 Do SOP https://wiki.yxunistar.com/x/b5A4
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','0 5 21 ? * SAT *','SELECT * FROM CORE.JPS_WIN_RECORD OJ WHERE OJ.ACCOUNT_ID IN (1) AND TRUNC(OJ.CREATE_TIME, ''DD'') = TRUNC(SYSDATE, ''DD'') ORDER BY OJ.CREATE_TIME DESC
','6','','george','2016-10-17 10:55:44','Nikki.o','2020-10-06 16:01:51','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-59','',' PED responded to PF1 withdrawal request for more than one day',' PED回應PF1提現請求超過一天','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <NU-MID-59>，PF1，PED回應PF1提現請求超過一天數據監控 ] 【 L2 Actions 】 1.依據數據檢查後台日誌是否有異常現象','0','ub8-pf1-sec','1.0','0 11 7 * * ?','select
  A.APPLIED_ORDER_NUM as UB_REFID,
  B.req_time,
  B.OPERTIME as UB_approve_time,
  A.CREATE_TIME as DP_response_time,
  B.TRANSID as DP_ORDERNO
from LOTT_NEW_A3D1.LOTT_BANK_WITHDRAW_ARRIVALS_VW A
left join LOTT_NEW_A3D1.lott_atm_req B on A.APPLIED_ORDER_NUM = B.refid
where cast( A.CREATE_TIME as date ) - B.OPERTIME > 1
 and A.CREATE_TIME + 1 > sysdate','5','','joseph','2016-11-10 16:09:12','jason','2020-09-28 09:57:36','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-61','',' PF2 Deposit success but without transaction record',' PF2 充值到帳但帳變交易無記錄檢查','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-61>，PF2，是緊急的，目前有充值到帳但帳變交易無記錄狀況，請通知L2 TEAM LEADER進行處理 ]
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','0 55 9 ? * *','SELECT * from core.bps_deposit_record_vw where record_id in(
	SELECT A.record_id
	FROM (
			(
				SELECT record_id
				FROM   core.bps_deposit_record_vw
				WHERE  arrival_time > SYSDATE - 1
					   AND status = 1
			) A LEFT JOIN
			(
				SELECT order_no
				FROM   core.acs_transaction
				WHERE  tx_time > SYSDATE - 1  AND TX_TYPE_ID IN (2001,2070)

			)B
			ON A.record_id = B.order_no
		)
	WHERE B.order_no = null
)','5','','kevin','2016-12-07 17:16:19','Nikki.o','2020-10-06 16:07:05','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-62','',' PF2 Check should be the status of the lottery order update',' PF2 檢查應開獎訂單更新狀態','【 L1 Actions 】 1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-62>，PF2，目前有應開獎但訂單未更新狀況，請確認LGS SERVER是否異常。 ] 2. Do SOP check https://wiki.yxunistar.com/x/otpE4
2. Create an ASI for this urgent MID and post it on AS General

【 L2 Actions 】
1.檢查LGS SERVER狀態(CPU、RAM、LOG) 2.檢查開獎日誌 LOTT.LGS_OPERATION_LOG 3.反應至Teams PF2疑難雜解決團 或 生產問題應急組','0','ub8-pf5-core-sec','5.0','0 0 * * * ?','SELECT TRUNC(A.UPDATE_TIME),
       B.ORDER_NUM,
	   D.CUSTOMER_NAME,
	   A.PLAN_BET_AMOUNT,
	   A.GAME_CODE,
	   C.WINNING_TIME,
	   ''HTTP://PROD-DRAWMONITOR.CPG-LTD.COM/#/DISCOVER?_G=(REFRESHINTERVAL:(DISPLAY:OFF,SECTION:0,VALUE:0),TIME:(FROM:NOW-24H,MODE:QUICK,TO:NOW))&_A=(COLUMNS:!(_SOURCE),INDEX:%27LOGSTASH-*%27,INTERVAL:AUTO,QUERY:(QUERY_STRING:(ANALYZE_WILDCARD:!T,QUERY:%27*''||B.ORDER_NUM||''%20%26%26%20MODE%20%26%26%20LOCATIONINFO.METHOD:ORDERLOG%27)),SORT:!(%27@TIMESTAMP%27,DESC))'' KIBANA_URL
FROM CORE.LGS_ORDER_DETAIL A
     LEFT OUTER JOIN CORE.LGS_ORDER_MASTER B ON A.ORDER_MASTER_ID = B.ORDER_MASTER_ID
     LEFT JOIN CORE.LGS_DRAW_NUMBER_RESULT C ON A.NUMERO = C.NUMERO AND A.GAME_CODE = C.GAME_CODE
     LEFT JOIN CORE.US_CUSTOMER_VW D ON B.CUSTOMER_ID = D.CUSTOMER_ID
WHERE A.STATUS = ''2''
AND C.REWARD_STATUS = 1
AND A.UPDATE_TIME > SYSDATE - 1 - 1/24/60*5','5','','kevin','2016-12-12 18:58:11','Nikki.o','2020-10-06 16:06:34','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-63','',' PF2 Already win but without ACS record',' PF2 已中獎但帳變交易無記錄','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-63>，PF2，是緊急的，目前有已中獎但帳變交易無記錄問題，請確認LGS SERVER是否異常 ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1.檢查LGS SERVER狀態(CPU、RAM、LOG) 2.檢查開獎日誌 LOTT.LGS_OPERATION_LOG 3.反應至Teams 2.0疑難雜解決團 或 生產問題應急組','0','ub8-pf5-core-sec','5.0','0 51 */3 * * ?','SELECT B.ORDER_NUM FROM CORE.LGS_ORDER_DETAIL A LEFT OUTER JOIN CORE.LGS_ORDER_MASTER B ON A.ORDER_MASTER_ID = B.ORDER_MASTER_ID
WHERE A.STATUS = 4
AND A.UPDATE_TIME BETWEEN SYSDATE-3/24 AND SYSDATE-3/24/60
MINUS
SELECT ORDER_NO FROM CORE.ACS_TRANSACTION
WHERE  TX_TYPE_ID = ''2005'' AND TX_TIME BETWEEN SYSDATE-1 AND SYSDATE','5','','kevin','2016-12-16 14:37:35','Nikki.o','2020-10-06 16:07:55','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CHK-MID-64','',' PF2 UU game win result delay',' PF2 UU比賽勝利結果延遲	','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CHK-MID-64> , PF2 UU比賽勝利結果延遲 ]
2. Check the games on the alert if there''s draw delay, call L2 if there''s delay
4. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','40 0/2 0-2,8-23 ? * SUN','WITH AA AS (
SELECT
   GAME_CODE,
   MAX( WINNING_TIME ) AS MAX_WIN_TIME,
   MAX( NUMERO ) AS MAX_NUMERO,
   MAX( REWARD_STATUS ) AS REWARD_STATUS,
   MAX( CREATE_TIME ) AS MAX_RUN_TIME,
   MIN( LOG_STEP ) AS MIN_LOG_STEP,
   MAX( CASE WHEN LOG_STEP <> ''17'' THEN LOG_STEP END )   AS MAX_LOG_STEP,
   MAX( CASE WHEN LOG_STEP NOT IN ( 8 , 17 ) THEN NUMERO END ) AS STUCK_NUMERO
FROM CORE.LGS_DRAW_NUMBER_RESULT
WHERE CREATE_TIME + 6/24 > SYSDATE
AND GAME_CODE LIKE ''UU%''
AND GAME_CODE NOT IN (''UUBJ5FC'')
GROUP BY GAME_CODE
ORDER BY 2 DESC
)

SELECT *
FROM(
SELECT
  AA.*,
   CASE WHEN REWARD_STATUS <> 1 THEN ''DRAW STUCK''
   WHEN GAME_CODE IN ( ''UU30S'' ,''UUFFC'', ''UUFF11X5'') AND  ( SYSDATE - CAST( MAX_WIN_TIME AS DATE )  )*24*60 > 2 THEN ''TOO LONG TIME NO WIN RESULT''
   WHEN GAME_CODE IN ( ''UU2FC'' , ''UU2F11X5'') AND  ( SYSDATE - CAST( MAX_WIN_TIME AS DATE )  )*24*60 > 3 THEN ''TOO LONG TIME NO WIN RESULT''
   WHEN GAME_CODE NOT IN ( ''UU30S'' ,''UUFFC'', ''UUFF11X5'' , ''UU2FC'' , ''UU2F11X5'' ) AND  ( SYSDATE - CAST( MAX_WIN_TIME AS DATE )  )*24*60 > 10 THEN ''TOO LONG TIME NO WIN RESULT''
   ELSE ''NORMAL'' END AS REMARK
FROM AA
)
WHERE REMARK<>''NORMAL''','5','','monti','2016-12-16 17:10:42','kimberlyclaire','2021-08-08 09:31:37','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-65','',' High PCT detect for UU30S',' 優遊30秒彩開獎效能監控','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <CHK-MID-65> , PF1, 優游30秒彩開獎效能監控，請通知phd團隊關注效能問題 ]
【 L2 Actions 】
1. 需要與phd共同關注效能問題

','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','SELECT a.*,b.total_order ,b.total_betting
    FROM (  SELECT oper_type3 memberno,
                   MIN (oper_time) start_time,
                   MAX (oper_time) finish_time,
                   MAX (elapsed_time) elapsed_time,
                   ROUND (TO_NUMBER (MAX (oper_time) - MIN (oper_time)) * 24 * 60 * 60) all_use_age
              FROM lott_new_a3d1.lott_operation_log
             WHERE oper_type2 = ''5000'' AND TO_CHAR (oper_time, ''yyyymmdd'') = ''20190711''
          GROUP BY oper_type3) a
         LEFT JOIN (  SELECT numero,count(*) total_order, SUM (total_num) total_betting
                        FROM lott_new_a3d1.lott_fc3d_order_main
                    GROUP BY numero) b
            ON (a.memberno = b.numero)
where elapsed_time>14
and START_TIME > sysdate -5/24/60
ORDER BY finish_time DESC','5','','marou','2016-12-19 12:35:18','martmil.n','2019-11-21 20:23:57','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-66','',' PF2 Mobile Login Count Monitor',' PF2 手機登入次數監控','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <CHK-MID-66>，PF2，目前監控手機登入次數異常，低於上周同期的一成，請確認手機連線域名是否異常 ]
2.Check the url Availability Statistics status on JKB
http://download1.ub8joy.com/client/mobile/android/prd/url.txt,
http://download1.ub8joy.com/client/mobile/ios/prd/prd-url.txt
【 L2 Actions 】
1.手機版登入狀態
2.檢查手機域名狀態http://download1.ub8joy.com/client/mobile/android/prd/url.txt,
http://download1.ub8joy.com/client/mobile/ios/prd/prd-url.txt
3.反應至Teams PF2疑難雜解決團 或 生產問題應急組','0','ub8-pf5-core-sec','5.0','0 59 * * * ?','SELECT COUNT(*) FROM (WITH A AS
(SELECT TO_CHAR(LOGIN_TIME, ''HH24'') HOUR, COUNT(*) PC FROM CORE.US_CUSTOMER_LOGIN_LOG
WHERE DEVICE_USER_AGENT NOT IN (''Web'',''Air'',''undefined'',''WEB'',''Java1.7.0_60'')
AND LOGIN_TIME BETWEEN SYSDATE-7 AND SYSDATE -6
GROUP BY TO_CHAR(LOGIN_TIME, ''HH24'')
ORDER BY TO_CHAR(LOGIN_TIME, ''HH24'')
),
B AS
(SELECT TO_CHAR(LOGIN_TIME, ''HH24'') HOUR, COUNT(*) AC FROM CORE.US_CUSTOMER_LOGIN_LOG
WHERE DEVICE_USER_AGENT NOT IN (''Web'',''Air'',''undefined'',''WEB'',''Java1.7.0_60'')
AND LOGIN_TIME BETWEEN SYSDATE-1 AND SYSDATE
GROUP BY TO_CHAR(LOGIN_TIME, ''HH24'')
ORDER BY TO_CHAR(LOGIN_TIME, ''HH24'')
)
SELECT A.HOUR Hour, A.PC LastWeekCount, B.AC TodayCount FROM A join B on A.HOUR= B.HOUR
AND B.AC < A.PC*0.1)
','4','5','kevin','2016-12-27 15:05:59','mediza.p','2019-12-06 12:50:27','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-67','',' PF2 Betting Info Monitor',' PF2 膽拖投注內容監控','【 L1 Actions 】
1. If any error, copy to AS-RC General [ CMS <NU-MID-67>, PF2 膽拖投注內容監控, 膽碼與拖碼重復 ] with screenshot
2. If RC has a problem then CALL L2.','0','ub8-pf5-core-sec','5.0','0 0/10 * * * ?','WITH AA AS (
  SELECT ORDER_MASTER_ID , FIRST_, SECOND_, PLAY_ID, CREATE_TIME FROM CORE.LGS_ORDER_INFO
  WHERE BETTING_TYPE =3
  AND (
   INSTR(SECOND_,SUBSTR(FIRST_,1,2) ) > 0  OR
   INSTR(SECOND_,SUBSTR(FIRST_,4,2) ) > 0  OR
   INSTR(SECOND_,SUBSTR(FIRST_,7,2) ) > 0  OR
   INSTR(SECOND_,SUBSTR(FIRST_,10,2) ) > 0 OR
   INSTR(SECOND_,SUBSTR(FIRST_,13,2) ) > 0 OR
   INSTR(SECOND_,SUBSTR(FIRST_,16,2) ) > 0 OR
   INSTR(SECOND_,SUBSTR(FIRST_,19,2) ) > 0 )
  AND CREATE_TIME + 10.2/24/60 > SYSDATE
)
SELECT B.ORDER_NUM , D.PLAY_NAME , AA.FIRST_ AS 胆码, B.ORDER_NUM AS 拖码,  C.CUSTOMER_NAME FROM AA
LEFT JOIN CORE.LGS_ORDER_MASTER B ON AA.ORDER_MASTER_ID = B.ORDER_MASTER_ID
LEFT JOIN CORE.US_CUSTOMER_VW C ON B.CUSTOMER_ID = C.CUSTOMER_ID
LEFT JOIN CORE.LGS_PLAY_MENU D ON AA.PLAY_ID = D.PLAY_ID','5','','joseph','2017-01-03 22:13:48','kimberlyclaire','2020-03-08 13:19:40','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-72','',' CMS MONITOR HOUSEKEEPING',' CMS MONITOR HOUSEKEEPING','【 L1 Actions 】
1. If this alert is on 2nd Sunday of the Month please proceed on CMS MONITOR HOUSEKEEPING, otherwise ignore this alert.
SOP:https://wiki.yxunistar.com/x/c4g4','0','ub8-pf1-sec','1.0','1 1 3 ? * SUN','select 1 from dual','5','','monti','2017-02-08 11:19:45','martmil.n','2019-11-21 20:27:16','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-73:EID-276','',' PF2 WIN NUM Repeatability Monitor',' PF2 獎號重複性監控','【 L1 Actions 】
1. CallBack then Check if System post to UBG獎號監控群 > 2.0','0','data-warehouse','5.0','20 1 */1 * * ?	','SELECT *  FROM DW.DW_A_NUM_DUP WHERE
( DW_SOURCE = ''2'') AND
( BIZ_DATE=TRUNC(SYSDATE-1) ) AND
(( ALERT_01<>0 ) OR ( ALERT_07<>0 ) OR ( ALERT_15<>0 ) OR ( ALERT_30<>0 ))','5','','kevin','2017-02-08 17:25:09','martmil.n','2019-11-21 20:27:58','276','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-75','',' PF2 Detect 3rd game bet amount',' PF2 偵測第三方遊戲投注量','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-75>，PF2，是需要進行確認的，目前發現第三方遊戲在過去3小時沒有任何投注量，請測試是否可順利進行遊戲 ]
2. Then try to login and bet on the 3rd party game, and post result if maintenance, normal or has error with screenshot to AS Teams','0','ub8-pf5-core-sec','5.0','0 01 9 ? * *','SELECT * FROM (
WITH A AS (SELECT PROVIDER, TGI_ID FROM CORE.LOTT_3RD_GAME_INFO WHERE TGI_ID IN (2,4,10)),
B AS (SELECT TGI_ID, COUNT(*) COUNT FROM CORE.LOTT_3RD_ACCOUNTS_BILL_DATA WHERE BILL_TIME > SYSDATE -3/24
AND BILL_TIME < SYSDATE
AND BILL_TYPE = ''2007'' GROUP BY TGI_ID)
SELECT * FROM A LEFT OUTER JOIN B ON A.TGI_ID = B.TGI_ID) A
WHERE A.COUNT IS NULL
','5','','kevin','2017-02-20 14:27:07','kimberlyclaire','2020-04-30 09:31:56','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-78','',' PF1 Detect 3rd game bet amount',' PF1 偵測第三方遊戲投注量','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-78>，PF1，是需要進行確認的，目前發現第三方遊戲在過去3小時沒有任何投注量，請測試是否可順利進行遊戲 ]
2. Then try to login and bet on the 3rd party game, and post result if maintenance, normal or has error with screenshot to AS Teams

','0','ub8-pf1-sec','1.0','0 02 9 ? * *','select a.Provider, b.count, ''bet'' as billtype from LOTT_NEW_A3D1.LOTT_3RD_GAME_INFO a left join (
select TGI_ID, count(*) as count from LOTT_NEW_A3D1.LOTT_3RD_ACCOUNTS_BILL_DATA
where BILL_TIME > SYSDATE -3/24 AND BILL_TIME < SYSDATE AND BILL_TYPE = ''2007'' group by tgi_id
) b on a.TGI_ID=b.TGI_ID
where b.count is null and a.TGI_ID<>0

union all

select a.Provider, b.count, ''win'' as billtype from LOTT_NEW_A3D1.LOTT_3RD_GAME_INFO a left join (
select TGI_ID, count(*) as count from LOTT_NEW_A3D1.LOTT_3RD_ACCOUNTS_BILL_DATA
where BILL_TIME > SYSDATE -3/24 AND BILL_TIME < SYSDATE AND BILL_TYPE = ''2005'' group by tgi_id
) b on a.TGI_ID=b.TGI_ID
where b.count is null and a.TGI_ID<>0','0','','AS_Team','2017-02-23 12:29:09','martmil.n','2019-11-21 20:29:03','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-81:EID-304/186','ASI-10613',' ASI-10613 PF1 Lottery Loss More Than 200K',' PF1 ASI-10613 彩种亏损20万','【 L1 Actions 】
1. Callback alert and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 2 * * * ?	','with aa as (
 select B.sortid , sum( A.bill_amount )*-1 profit
 from LOTT_NEW_A3D1.lott_accounts_bill A
 join LOTT_NEW_A3D1.lott_fc3d_order_main B on A.orderno = B.orderno
  and B.status in ( ''004'' , ''005'' , ''020'' )
  and trunc(B.into_time) = trunc( sysdate )
 group by B.sortid
)
select
         B.remark as 彩种, b.PARAM_ONE, aa.profit as 利润
       from aa
       left join LOTT_NEW_A3D1.lott_group_series B on B.GROUP_TYPE = ''1''
        and aa.sortid = B.group_value
where aa.profit < -200000
order by 3','5','','yorkx','2017-03-15 13:53:25','martmil.n','2020-03-06 18:16:33','304,186','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-83','ASI-10613',' ASI-10613 PF1 Order Win',' PF1 ASI-10613 中奖订单告警','【 L1 Actions 】
1. Callback alert','0','ub8-pf1-sec','1.0','2 1/5 * * * ?','select
   orderno 订单号,
   b.accounts 账号,
   total_amount 投注金额 ,
   total_winprice 中奖金额,
   TOTAL_WINPRICE - TOTAL_AMOUNT as 平台损失 ,
   bet_time 投注时间,
   c.WIN_DATE as 表定开奖时间,
   into_time as 实际开奬时间,
   c.WIN_NO 开奖号码,
   case when bet_time > WIN_DATE then ''超过开奖时间后投注'' end as 警告讯息
 from LOTT_NEW_A3D1.lott_fc3d_order_main B
 left join LOTT_NEW_A3D1.lott_manaul_temp c on b.SORTID=c.SORTID and b.NUMERO=c.NUMERO
 where --trunc(B.into_time, ''HH24'') = trunc(sysdate - 1/24, ''HH24'')
B.into_time< trunc( sysdate , ''hh24'' ) + floor( to_number ( to_char( sysdate , ''mi'') )/5 )* 5/24/60
and B.into_time>= trunc( sysdate , ''hh24'' ) + floor( to_number ( to_char( sysdate , ''mi'') )/5 )* 5/24/60 - 5/24/60
 and status in ( ''004'' , ''020'' )
 and ( (total_amount < 100 and total_winprice/total_amount >= 100 and total_winprice > 5000) or (total_amount >= 100 and total_winprice/total_amount >= 40 and total_winprice > 5000) or total_winprice>200000)
 order by TOTAL_WINPRICE - TOTAL_AMOUNT desc','5','','yorkx','2017-03-15 14:59:11','jason','2019-12-05 16:55:22','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-93:EID-275','',' PF1 WIN NUM Repeatability Monitor',' PF1 獎號重複性監控','【 L1 Actions 】
1. CallBack alert and check if export was sent to UBG獎號監控群 > 1.0','0','data-warehouse','1.0','10 1 */1 * * ?	','SELECT *  FROM DW.DW_A_NUM_DUP WHERE
( DW_SOURCE = ''1'') AND
( BIZ_DATE=TRUNC(SYSDATE-1) ) AND
(( ALERT_01<>0 ) OR ( ALERT_07<>0 ) OR ( ALERT_15<>0 ) OR ( ALERT_30<>0 )) ','5','','joseph','2017-04-17 19:18:45','martmil.n','2019-11-21 20:30:50','275','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-95','ASI-10613',' ASI-10613 PF1 Customer Win',' PF1 ASI-10613 用户盈利告警','【 L1 Actions 】
1. CallBack alert','0','ub8-pf1-sec','1.0','1 3 * * * ?','with aaa as (
 select  orderno , accounts , total_amount, total_winprice, TOTAL_WINPRICE - TOTAL_AMOUNT , bet_time, into_time, status
 from LOTT_NEW_A3D1.lott_fc3d_order_main B
 where trunc(B.into_time, ''HH24'') = trunc(sysdate-1/24, ''HH24'')
 and status in (  ''004'' , ''005'' , ''020'' )
)
select
   accounts 账号,
   trunc(into_time, ''HH24'') 时间,
   sum( total_winprice  ) as 中奖金额,
   sum( total_amount  ) as 投注金额,
   trunc ( sum( total_winprice  )/sum( total_amount  ) , 2 )  as 返奖率
from aaa
group by accounts, trunc(into_time, ''HH24'')
having (sum( total_winprice  ) >= 150000 and sum( total_winprice  )/sum( total_amount  ) >= 1 )','5','','yorkx','2017-04-20 18:44:25','jason','2019-12-05 16:55:45','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','DAU','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-97','ASI-14398',' ASI-14398 PF2 double arrived deposit check',' ASI-14398 PF2 線下充值重覆到帳','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-MID-97>，PF2，plz check double deposit ]
【 L2 Actions 】
1.檢查相關訂單號 是否有線下充值重復的狀況','0','ub8-pf5-core-sec','5.0','0 0/1 * * * ?','select ORDER_NO,AMOUNT,REMARK ,count(*) from core.ACS_TRANSACTION
where tx_type_id in (2001)
and REMARK in (''888:OfflineDeposit'',''889:OfflineDeposit'',''890:OfflineDeposit'',''891:OfflineDeposit'')
group by ORDER_NO,AMOUNT,REMARK
having count(*) > 1','5','','monti','2017-04-24 11:30:47','mediza.p','2019-12-06 12:48:45','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-100:EID-274','',' PF1 The number of repeat login customer more than 10',' PF1 重复登录人数超10个','【 L1 Actions 】
1.Callback then Check if System post to AS General on Teams

','0','ub8-pf1-sec','1.0','20 45 * * * ?','select count(*) from (
select
 ACCOUNTS, count(*), max( LOGIN_IP)
from LOTT_NEW_A3D1.accounts_login_logs
where LOGIN_TIME >= trunc(sysdate, ''HH24'')
 and LOGIN_TIME <= trunc(sysdate, ''HH24'') + 40/60/24
 and loginway in (''Web'')
group by accounts
having count(*) > 4
) a
having count(*)>10','5','','yorkx','2017-04-25 10:03:46','riel_john','2021-06-11 15:20:06','274','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-103','',' PF1 Monitor Register Amount every hour',' PF1 每小時註冊人數監控','【 L1 Actions 】
1.In this monitor , we need to check the register function if normal or not normal
2. If the [Status] is ''1'' , copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-103> ，PF1，目前這小時的註冊人數過低 , 請L1確認PF1註冊聯結是否正常 ] if not normal, CALL L2.
3. If the [Status] is ''2'' , copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-103> ，PF1，目前連續2小時的註冊人數過低 , 請確認PF1註冊聯結是否正常 ] and do SOP:https://wiki.yxunistar.com/x/p4o4 if not normal, CALL L2.','0','ub8-pf1-sec','1.0','00 58 0-3,7-23 * * ?','/* 20170517 新版 - 多監控連續兩小時都沒人註冊 */


with AA as (
	select 	TO_CHAR( B.REG_TIME, ''YYYYMMDD HH24'') as Date_
	from  	LOTT_NEW_A3D1.LOTT_AUTO_REG A left join LOTT_NEW_A3D1.LOTT_AUTO_REG_LINK_ACCOUNT B on A.REG_ID = B.REG_ID
	where 	(To_CHAR(B.REG_TIME,''HH24'')=To_CHAR(sysdate , ''HH24'') or To_CHAR(B.REG_TIME,''HH24'')=To_CHAR(sysdate , ''HH24'')-1  )
		and B.REG_TIME  > sysdate-6.5
                --and B.REG_TIME  > sysdate-1
	order by B.REG_TIME
),BB as(
	select  DATE_ , count(*) as count_ from AA group by DATE_
)
,Last_Five_Day_CHour as(        -- 前五天這個小時的平均註冊人數
	select ROUND(AVG(count_ ),1) as Last_AVG_Reg from BB where substr(DATE_ ,0,8) != To_CHAR(sysdate , ''YYYYMMDD'')  and substr(DATE_ , 10) = To_CHAR(sysdate , ''HH24'')
)
,Last_Five_Day_LHour as(        -- 前五天上個小時的平均註冊人數
	select ROUND(AVG(count_ ),1) as Last_AVG_Reg from BB where substr(DATE_ ,0,8) != To_CHAR(sysdate , ''YYYYMMDD'')  and substr(DATE_ , 10) = To_CHAR(sysdate , ''HH24'')-1
)
,Today_CHour as(         --這個小時的註冊人數
	select nvl(ROUND(AVG(count_ ),1) , ''0'')  as Current_Reg from BB where substr(DATE_ ,0,8) = To_CHAR(sysdate , ''YYYYMMDD'')  and substr(DATE_ , 10) = To_CHAR(sysdate , ''HH24'')
),Today_LHour as(        --上個小時的註冊人數
	select nvl(ROUND(AVG(count_ ),1) , ''0'')  as Current_Reg from BB where substr(DATE_ ,0,8) = To_CHAR(sysdate , ''YYYYMMDD'')  and substr(DATE_ , 10) = To_CHAR(sysdate , ''HH24'')-1
)
,Current_Time as(        --上個小時的時間
	select to_char(sysdate , ''YYYY-MM-DD HH24 AM'') as Time from dual
),Last_Time as(          --這個小時的時間
	select to_char(sysdate , ''YYYY-MM-DD '') || (to_char(sysdate , ''HH24'')-1)  as Time from dual
)
,LResult as(             --上個小時結果表
	select TIME as LTIME, LAST_AVG_REG as LLAST_AVG_REG, CURRENT_REG as LCURRENT_REG,
	CASE WHEN LAST_AVG_REG*0.05 > CURRENT_REG and LAST_AVG_REG - CURRENT_REG>2 THEN ''No One Register''
	ELSE ''Normal'' END as LStatus
	from (select * from Last_Time , Last_Five_Day_LHour , Today_LHour )
),CResult as(            --這個小時結果表
	select TIME , LAST_AVG_REG , CURRENT_REG ,
	CASE WHEN LAST_AVG_REG*0.05 > CURRENT_REG and LAST_AVG_REG - CURRENT_REG>2 THEN ''No One Register''
	ELSE ''Normal'' END as CStatus
	from (select * from Current_Time , Last_Five_Day_CHour , Today_CHour )
)
select
CASE
WHEN CSTATUS=''No One Register'' and LSTATUS=''No One Register'' THEN ''2''
WHEN CSTATUS=''No One Register'' and LSTATUS=''Normal'' THEN ''1''
ELSE ''0'' END as Status
,LTIME , LLAST_AVG_REG , LCURRENT_REG , TIME , LAST_AVG_REG , CURRENT_REG
FROM  LOTT_NEW_A3D1.CResult , LResult
where CSTATUS=''No One Register''

/* 20170517 舊版

select * from
( select to_char(sysdate , ''YYYY-MM-DD HH24 PM'') as Time from dual) SysDate_,
(
        -- 前五天這個小時的平均註冊人數
	with AA as (
		select 	TO_CHAR( B.REG_TIME, ''YYYYMMDD HH24'') as Date_
		from  	LOTT_NEW_A3D1.LOTT_AUTO_REG A left join LOTT_NEW_A3D1.LOTT_AUTO_REG_LINK_ACCOUNT B on A.REG_ID = B.REG_ID
		where 	To_CHAR(B.REG_TIME,''HH24'')=To_CHAR(sysdate , ''HH24'')
		        and To_CHAR(B.REG_TIME,''YYYYMMDD'')!=To_CHAR(sysdate , ''YYYYMMDD'')
				and B.REG_TIME  > sysdate-6.5
		order by B.REG_TIME
	)
	select 	ROUND(AVG(count_ ),1) as AVG_Reg
	from 	(select  DATE_ , count(*) as count_ from AA group by DATE_ )
) Last_Five_Day
,
(
        -- 今天這個小時的註冊人數
	select 	count(*) as REG
	from 	LOTT_NEW_A3D1.LOTT_AUTO_REG A left join LOTT_NEW_A3D1.LOTT_AUTO_REG_LINK_ACCOUNT B on A.REG_ID = B.REG_ID
	where 	To_CHAR(B.REG_TIME,''YYYYMMDD HH24'')=To_CHAR(sysdate , ''YYYYMMDD HH24'')
) Today
-- 今天的人數小於前五天平均人數的40%以下就報警
where Last_Five_Day.AVG_Reg*0.4 > Today.REG and Last_Five_Day.AVG_Reg - Today.REG>2

*/','5','','wilson','2017-05-05 14:19:58','denice.d','2020-12-01 18:18:31','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-104','',' PF2 Monitor Register Amount every day',' PF2 每天註冊人數監控','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <NU-MID-104>，PF2，目前今天的註冊人數低於前五天平均註冊人數的40%,請確認PF2 註冊聯結是否正常 ]

','0','ub8-pf5-core-sec','5.0','00 00 23 * * ?','select * from (
        -- 前五天這個小時的平均註冊人數
	with AA as (
		select 	TO_CHAR( B.CREATE_TIME, ''YYYYMMDD'') as Date_
		from  	CORE.CP_AUTO_REG A left join CORE.CP_AUTO_REG_LINK_ACCOUNT B on A.REG_ID = B.REG_ID
		where 	To_CHAR(B.CREATE_TIME,''YYYYMMDD'')!=To_CHAR(sysdate , ''YYYYMMDD'')
				and B.CREATE_TIME> sysdate-6.5
                                --and B.CREATE_TIME> sysdate-1
		order by B.CREATE_TIME
	)
	select 	ROUND(AVG(count_ ),1) as Last_Five_AVG_Reg
	from 	(select  DATE_ , count(*) as count_ from AA group by DATE_ )
) Last_Five_Day
,
(
        -- 今天這個小時的註冊人數
	select 	count(*) as Today_REG
	from  	CORE.CP_AUTO_REG A left join CORE.CP_AUTO_REG_LINK_ACCOUNT B on A.REG_ID = B.REG_ID
	where 	To_CHAR(B.CREATE_TIME,''YYYYMMDD'')=To_CHAR(sysdate , ''YYYYMMDD'')
) Today
-- 今天的人數小於前五天平均人數的40%以下就報警
where Last_Five_Day.Last_Five_AVG_Reg *0.4 > Today.Today_REG','5','','wilson','2017-05-05 16:19:32','mediza.p','2019-12-06 12:48:22','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-105','',' AS TASK [6:30AM] Monitor Daily Crontab ',' 檢查資料庫預儲程序是否正常執行','【 L1 Actions 】

1.In this monitor, we need to check the number should be equals 5 or more
2.If any is missing, please post the missing name at AS Teams and inform DBA
3.Please use the sql check below
"select ''ENABLE GEN OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''05''
and oper_context =''每30分钟生成报表数据脚本开启''
and OPER_TIME > sysdate -2/24
union all
select ''DISABLE GEN OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''05''
and oper_context =''每30分钟生成报表数据脚本关闭''
and OPER_TIME > sysdate -2/24
union all
select ''DAILY BACKUP OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''05''
and oper_context = ''All closing balances backed up successfully''
and OPER_TIME > sysdate -2/24
and rownum =1
union all
select ''PURGE OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''92''
and oper_context like ''%Data purging successfull for data before%''
and OPER_TIME > sysdate -2/24
union all
select ''PLETT_ACCOUNTANT_REPORT OK'' from lott_accountant_report
where operationdate > sysdate -2/24"
4.The returned list should be ENABLE GEN OK, DISABLE GEN OK, DAILY BACKUP OK, PURGE OK, PLETT_ACCOUNTANT_REPORT OK
5.If any one missed, please post the item to AS Teams','0','ub8-pf1-sec','1.0','0 50 6 * * ?','WITH PROC AS (select ''ENABLE GEN OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''05''
and oper_context =''每30分钟生成报表数据脚本开启''
and OPER_TIME > sysdate -2/24
union all
select ''DISABLE GEN OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''05''
and oper_context =''每30分钟生成报表数据脚本关闭''
and OPER_TIME > sysdate -2/24
union all
select ''DAILY BACKUP OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''05''
and oper_context = ''All closing balances backed up successfully''
and OPER_TIME > sysdate -2/24
and rownum =1
union all
select ''PURGE OK'' from LOTT_NEW_A3D1.lott_oper_log
where oper_type = ''92''
and oper_context like ''%Data purging successfull for data before%''
and OPER_TIME > sysdate -2/24
union all
select ''PLETT_ACCOUNTANT_REPORT OK'' from LOTT_NEW_A3D1.lott_accountant_report
where operationdate > sysdate -2/24)
SELECT COUNT(*) FROM PROC ','4','5','kevin','2017-05-12 12:32:22','martmil.n','2019-11-21 20:34:17','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-106','',' Check if missing rebates task',' 檢查是否缺少折扣任務','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-106>，PF2，缺失返點任務 ]','0','ub8-pf5-core-sec','5.0','4 2/30 * * * ?','WITH AA AS (
 SELECT GAME_CODE, NUMERO , COUNT(*) AS CNT
 FROM CORE.LGS_ORDER_DETAIL
 WHERE STATUS IN ( 4, 5 )
 AND CREATE_TIME + 3 > SYSDATE
 GROUP BY GAME_CODE, NUMERO
 HAVING COUNT(*)>0
)
SELECT A.NUMERO, A.GAME_CODE, A.WINNING_TIME, AA.CNT
FROM CORE.LGS_DRAW_NUMBER_RESULT  A
 LEFT JOIN CORE.BCS_TASK B ON A.GAME_CODE = B.GAME_CODE AND A.NUMERO = B.NUMERO
 LEFT JOIN AA ON A.GAME_CODE = AA.GAME_CODE AND A.NUMERO = AA.NUMERO
WHERE B.GAME_CODE IS NULL
 AND A.CREATE_TIME + 2/24 > SYSDATE
 AND AA.GAME_CODE IS NOT NULL
 AND A.WINNING_TIME + 20/60/24 < SYSDATE
ORDER BY A.WINNING_TIME DESC','5','','yorkx','2017-05-17 19:07:00','kimberlyclaire','2020-06-01 13:45:39','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
(' NU-CHK-MID-107','',' PF2 Sanity test result monitor',' PF2 基本整合測試結果監控','【 L1 Actions 】
1.Do the NG part again','0','ub8-pf5-core-sec','5.0','0 29 8,21 ? * *','WITH AA AS (SELECT ''UU GAME BET TEST'' TEST, DECODE(COUNT(CUSTOMER_ID),0,''NG'',''OK'') STATUS
FROM CORE.LGS_ORDER_MASTER A LEFT JOIN CORE.LGS_GAME B ON A.GAME_ID = B.GAME_ID
WHERE A.CUSTOMER_ID IN (1077, 6523)
AND A.CREATE_TIME > SYSDATE -3/24
AND B.CODE LIKE ''UU%''
UNION ALL
SELECT ''SSC GAME BET TEST'' TEST, DECODE(COUNT(CUSTOMER_ID),0,''NG'',''OK'') STATUS
FROM CORE.LGS_ORDER_MASTER A LEFT JOIN CORE.LGS_GAME B ON A.GAME_ID = B.GAME_ID
WHERE A.CUSTOMER_ID IN (1077, 6523)
AND A.CREATE_TIME > SYSDATE -3/24
AND B.CODE LIKE ''%SSC''
UNION ALL
SELECT ''11X5 GAME BET TEST'' TEST, DECODE(COUNT(CUSTOMER_ID),0,''NG'',''OK'') STATUS
FROM CORE.LGS_ORDER_MASTER A LEFT JOIN CORE.LGS_GAME B ON A.GAME_ID = B.GAME_ID
WHERE A.CUSTOMER_ID IN (1077, 6523)
AND A.CREATE_TIME > SYSDATE -3/24
AND B.CODE LIKE ''%11X5''
UNION ALL
SELECT ''LF GAME BET TEST'' TEST, DECODE(COUNT(CUSTOMER_ID),0,''NG'',''OK'') STATUS
FROM CORE.LGS_ORDER_MASTER A LEFT JOIN CORE.LGS_GAME B ON A.GAME_ID = B.GAME_ID
WHERE A.CUSTOMER_ID IN (1077, 6523)
AND A.CREATE_TIME > SYSDATE -3/24
AND B.CODE IN (''TCP3P5'', ''FC3D'')
UNION ALL
SELECT ''KENO GAME BET TEST'' TEST, DECODE(COUNT(CUSTOMER_ID),0,''NG'',''OK'') STATUS
FROM CORE.LGS_ORDER_MASTER A LEFT JOIN CORE.LGS_GAME B ON A.GAME_ID = B.GAME_ID
WHERE A.CUSTOMER_ID IN (1077, 6523)
AND A.CREATE_TIME > SYSDATE -3/24
AND B.CODE LIKE ''%KENO''
UNION ALL
SELECT ''PK10 GAME BET TEST'' TEST, DECODE(COUNT(CUSTOMER_ID),0,''NG'',''OK'') STATUS
FROM CORE.LGS_ORDER_MASTER A LEFT JOIN CORE.LGS_GAME B ON A.GAME_ID = B.GAME_ID
WHERE A.CUSTOMER_ID IN (1077, 6523)
AND A.CREATE_TIME > SYSDATE -3/24
AND B.CODE LIKE ''%PK10''
UNION ALL
SELECT ''WIN TEST'' TEST, DECODE(COUNT(TX_TIME),0,''NG'',''OK'') STATUS FROM CORE.ACS_TRANSACTION
WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM CORE.ACS_ACCOUNT WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM CORE.US_CUSTOMER_VW WHERE CUSTOMER_NAME IN (''lala2015'', ''lala2012'')))
AND TX_TIME > SYSDATE -15/24
AND TX_TYPE_ID = 2005
UNION ALL
SELECT ''DRAWBACK TEST'' TEST, DECODE(COUNT(TX_TIME),0,''NG'',''OK'') STATUS FROM CORE.ACS_TRANSACTION
WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM CORE.ACS_ACCOUNT WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM CORE.US_CUSTOMER_VW WHERE CUSTOMER_NAME IN (''lala2015'', ''lala2012'')))
AND TX_TIME > SYSDATE -15/24
AND TX_TYPE_ID = 2012
UNION ALL
SELECT ''DEPOSIT REQUEST TEST'' TEST, DECODE(COUNT(REQUEST_TIME ),0,''NG'',''OK'') STATUS FROM CORE.BPS_DEPOSIT_RECORD_VW
WHERE CUSTOMER_NAME IN (''lala2015'', ''lala2012'')
AND REQUEST_TIME > SYSDATE -15/24
UNION ALL
SELECT ''3RD GAME OPEN TEST'' TEST, DECODE(COUNT(START_TIME),0,''NG'',''OK'') FROM CORE.LOTT_3RD_INTERNAL_TRANSFER
WHERE ATP_ID IN (SELECT ATP_ID FROM CORE.LOTT_3RD_ACCOUNTS WHERE ACCOUNTS IN (''lala2015'', ''lala2012''))
AND TRANSFER_TYPE = 2008
AND START_TIME > SYSDATE -15/24
UNION ALL
SELECT ''3RD GAME CLOSE TEST'' TEST, DECODE(COUNT(START_TIME),0,''NG'',''OK'') FROM CORE.LOTT_3RD_INTERNAL_TRANSFER
WHERE ATP_ID IN (SELECT ATP_ID FROM CORE.LOTT_3RD_ACCOUNTS WHERE ACCOUNTS IN (''lala2015'', ''lala2012''))
AND TRANSFER_TYPE = 2010
AND START_TIME > SYSDATE -15/24)
SELECT * FROM AA WHERE STATUS = ''NG''
','5','','kevin','2017-05-29 16:53:49','kimberlyclaire','2021-04-01 08:38:42','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-108','',' PF1 Sanity test result monitor',' PF1 基本整合測試結果監控','【 L1 Actions 】
1.Do the NG part again','0','ub8-pf1-sec','1.0','0 30 8,21 ? * *','with AA as (
(select ''UUSSC Test''  as step  , ''UUSSC''  as  PARAM_ONE from  dual) UNION
(select ''CQSSC Test''  as step  , ''CQSSC''  as  PARAM_ONE from  dual) UNION
(select ''UU11X5 Test'' as step  , ''UU11X5'' as  PARAM_ONE from  dual) UNION
(select ''UUKENO Test'' as step  , ''UUKENO'' as  PARAM_ONE from  dual) UNION
(select ''UUFFC Test'' as step  , ''UUFFC'' as  PARAM_ONE from  dual) UNION
(select ''UU30S Test'' as step  , ''UU30S'' as  PARAM_ONE from  dual) UNION
(select ''UUK3 Test'' as step  , ''UUK3'' as  PARAM_ONE from  dual) UNION
(select ''UUFF11X5 Test'' as step  , ''UUFF11X5'' as  PARAM_ONE from  dual) UNION
(select ''UUSHB Test'' as step  , ''UUSHB'' as  PARAM_ONE from  dual) UNION
(select ''FC3D Test''   as step  , ''FC3D''   as  PARAM_ONE from  dual)
), BB as (
select * from LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN A LEFT JOIN LOTT_NEW_A3D1.LOTT_GROUP_SERIES B on A.SORTID=B.GROUP_VALUE
where (ACCOUNTS like ''lala2015%'' or ACCOUNTS like ''lala2012%'') and BET_TIME>sysdate-3/24
)
, Result as (
(
select AA.step as STEP,MAX(BET_TIME) as TIME, '''' as Context ,
CASE WHEN MAX(BET_TIME) is not null THEN ''OK''
ELSE ''NG!!'' END as CHECKTEST
from AA left join BB on AA.PARAM_ONE = BB.PARAM_ONE
group by AA.step
)
union all(
-- Login 的檢查
select   ''Login Test'' as Step , MAX(LOGIN_TIME) as TIME , Max(ACCOUNTS) as Context ,
CASE WHEN MAX(LOGIN_TIME) > sysdate-15/24  THEN ''OK''
ELSE ''NG!!'' END as CHECKTEST
FROM LOTT_NEW_A3D1.ACCOUNTS_LOGIN_LOGS
where (ACCOUNTS =''lala2015'' or ACCOUNTS =''lala2012'') and LOGIN_TIME= (select MAX(LOGIN_TIME) from LOTT_NEW_A3D1.ACCOUNTS_LOGIN_LOGS where (ACCOUNTS =''lala2015'' or ACCOUNTS =''lala2012'') )
)union all(
-- Deposit  的檢查
select   ''Deposit Test'' as Step , CHARFETIME as TIME , ''Account(''|| ACCOUNTS || '')     Deposit('' || AMOUNTS ||'')'' as Context ,
CASE WHEN CHARFETIME > sysdate-15/24  THEN ''OK''
ELSE ''NG!!'' END as CHECKTEST
FROM LOTT_NEW_A3D1.LOTT_VW_CHARFE_REC
where (ACCOUNTS =''lala2015'' or ACCOUNTS =''lala2012'') and CHARFETIME = (select MAX(CHARFETIME ) from LOTT_NEW_A3D1.LOTT_VW_CHARFE_REC where (ACCOUNTS =''lala2015'' or ACCOUNTS =''lala2012'') )
)
)
select * from Result where CHECKTEST!=''OK''','5','','wilson','2017-05-30 13:30:28','kimberlyclaire','2021-04-01 09:50:49','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-112','',' PF1 Show before and after bet amount details',' 在前後顯示PF1下注金額詳情','This shows and records the before and after PF1 bet money when doing a sanity test.','0','ub8-pf1-sec','1.0','0 59 9,21 ? * *','select a.accounts,
       a.amounts current_amount,
      (a.amounts + b.total_bet) before_amount,
       b.total_bet,
       b.total_win
from LOTT_NEW_A3D1.lott_accounts_info a,
    (select accounts,
          SUM(TOTAL_AMOUNT) total_bet,
          SUM(TOTAL_WINPRICE)total_win
     from LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN
    where accounts in (''lala2015'',''lala2012'')
      and BET_TIME > sysdate-3/24
      and status not in (''008'',''001'',''002'')
    group by accounts) b
where a.accounts= b.accounts','5','','monti','2017-06-23 22:26:17','martmil.n','2019-11-21 20:36:30','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-113','',' PF2 Show before and after bet amount details',' 顯示PF2的下注金額詳細信息之前和之後','This shows and records the before and after PF2 bet money when doing a sanity test.','0','ub8-pf5-core-sec','5.0','0 59 9,21 ? * *','SELECT US2.CUSTOMER_NAME,
       US1.AVAIL_BALANCE CURRENT_AMOUNT,
       (US1.AVAIL_BALANCE + US2.BET_AMOUNT) BEFORE_BETTING_AMOUNT,
       US2.BET_AMOUNT
 FROM CORE.ACS_ACCOUNT US1,
(SELECT CST.CUSTOMER_NAME,
       LGS.CUSTOMER_ID,
       ACS.AVAIL_BALANCE,
       SUM(LGS.TOTAL_ACTUAL_BET_AMOUNT) BET_AMOUNT
 FROM CORE.LGS_ORDER_MASTER LGS
      JOIN CORE.US_CUSTOMER_VW  CST ON LGS.CUSTOMER_ID =CST.CUSTOMER_ID
      JOIN CORE.ACS_ACCOUNT ACS ON ACS.CUSTOMER_ID =CST.CUSTOMER_ID
   WHERE TRUNC(LGS.UPDATE_TIME) = TRUNC(SYSDATE)
     AND LGS.ORDER_MASTER_ID NOT IN (SELECT 1 FROM CORE.LGS_ORDER_DETAIL WHERE STATUS=8)
     AND CST.CUSTOMER_NAME IN (''LALA2015'')
     AND ACS.VERSION <> 0
GROUP BY CST.CUSTOMER_NAME,LGS.CUSTOMER_ID,ACS.AVAIL_BALANCE) US2
WHERE US1.CUSTOMER_ID= US2.CUSTOMER_ID
     AND US1.VERSION <> 0','5','','monti','2017-06-29 22:12:40','mediza.p','2019-12-06 12:46:45','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-116','',' Check every Device Login and Betting',' 各Device的登入和投注監控','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-116>，PF2，To check betting device, if just few or zero, please try to check any abnormal at PF2 (PF2 近期登入裝置與與投注裝置的監控，請確認是否有任一裝置投注量過低的現象，若有請進行測試是否異常) ]
2. Check affected device and bet','0','ub8-pf5-core-sec','5.0','0 0 10 * * ?','WITH CUSTOMERLOGIN AS(
        SELECT  REPLACE(UPPER(DEVICE_USER_AGENT),''UB8CLIENT201905'', ''CLIENT'') DEVICE_USER_AGENT , CUSTOMER_ID
        FROM CORE.US_CUSTOMER_LOGIN_LOG B
        WHERE LOGIN_TIME > SYSDATE-1
        GROUP BY DEVICE_USER_AGENT , CUSTOMER_ID
        )
        , BET AS( --登入投注
        SELECT  DEVICE_USER_AGENT , COUNT(*) AS BETTINGCOUNT
        FROM CUSTOMERLOGIN B
        WHERE (SELECT COUNT(*)FROM CORE.LGS_ORDER_MASTER A WHERE CREATE_TIME  > SYSDATE-1 AND A.CUSTOMER_ID=B.CUSTOMER_ID AND A.DEVICE =B.DEVICE_USER_AGENT  ) > 0
        GROUP BY B.DEVICE_USER_AGENT
        ),NOBET AS(   --登入沒投注
        SELECT  DEVICE_USER_AGENT , COUNT(*) AS NOBETTINGCOUNT
        FROM CUSTOMERLOGIN B
        WHERE (SELECT COUNT(*)FROM CORE.LGS_ORDER_MASTER A WHERE CREATE_TIME  > SYSDATE-1 AND A.CUSTOMER_ID=B.CUSTOMER_ID AND A.DEVICE =B.DEVICE_USER_AGENT  ) = 0
        GROUP BY B.DEVICE_USER_AGENT
        ),LOGIN AS(
        SELECT DEVICE_USER_AGENT , COUNT(*) AS LOGINCOUNT
        FROM CUSTOMERLOGIN B
        GROUP BY DEVICE_USER_AGENT
        )
        SELECT A.DEVICE_USER_AGENT AS "DEVICE" ,B.LOGINCOUNT AS "客戶登入人數" , A.NOBETTINGCOUNT AS "沒投注的客人人數" , C.BETTINGCOUNT  AS "有投注的客人人數" ,
        CASE
        WHEN C.BETTINGCOUNT = 0 THEN ''ABNORMAL''
        WHEN C.BETTINGCOUNT IS NULL THEN ''ABNORMAL''
        WHEN C.BETTINGCOUNT = 0 THEN ''ABNORMAL''
        WHEN B.LOGINCOUNT = 0 THEN ''ABNORMAL''
        ELSE ''NORMAL''
        END AS 狀態
        FROM NOBET A
        LEFT JOIN LOGIN B ON A.DEVICE_USER_AGENT =B.DEVICE_USER_AGENT
        LEFT JOIN BET C ON A.DEVICE_USER_AGENT =C.DEVICE_USER_AGENT
        WHERE A.DEVICE_USER_AGENT NOT IN (''JAVA1.7.0_60'', ''UNISTAR'', ''IPAD'')
        AND C.BETTINGCOUNT =0 OR C.BETTINGCOUNT IS NULL OR B.LOGINCOUNT =0
        ORDER BY LOGINCOUNT DESC','5','','wilson','2017-07-05 21:58:25','kevin','2020-12-29 18:18:22','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-118','',' PF2 Check every Device Login and Betting Detail',' PF2 各Device的登入和投注監控明細','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-118>，PF2，檢查登入和投注的Device欄位是否正常 ]
2. If there is abnormality, do SOP:
https://wiki.yxunistar.com/x/2Y04','0','ub8-pf5-core-sec','5.0','0 0 10 * * ?','with AA as(
        select Device, max(CREATE_TIME) as CREATE_TIME
        from core.lgs_order_master where DEVICE is not null
        and DEVICE!=''undefined''
        group by Device),
        BB as(select B.CUSTOMER_ID , B.CREATE_TIME , C.code , B.Device
        from AA A
        LEFT JOIN core.lgs_order_master B on A.CREATE_TIME=B.CREATE_TIME
        LEFT JOIN Core.LGS_GAME C on B.GAME_ID=C.GAME_ID),
        CC as (select B.CUSTOMER_ID ,B.code, max(C.LOGIN_TIME) as LOGIN_TIME,
        B.CREATE_TIME ,B.Device as BITDEVICE from BB B
        LEFT JOIN CORE.US_CUSTOMER_LOGIN_LOG C on B.CUSTOMER_ID=C.CUSTOMER_ID
        where C.LOGIN_TIME < B.CREATE_TIME
        group by B.CUSTOMER_ID ,B.code , B.CREATE_TIME ,B.Device),
        DD as (select C.* ,case when D.DEVICE_USER_AGENT like ''%CLIENT%'' then ''CLIENT'' else D.DEVICE_USER_AGENT END as DEVICE_USER_AGENT
        from CC C Left Join CORE.US_CUSTOMER_LOGIN_LOG D
        on C.LOGIN_TIME=D.LOGIN_TIME)
        select FF.CUSTOMER_name , DD.LOGIN_TIME as "登入時間" ,
        DD.Code, DD.DEVICE_USER_AGENT as "登入裝置",
        DD.CREATE_TIME as "投注時間" , DD.BITDEVICE as "投注裝置",
        CASE
        WHEN upper(DD.DEVICE_USER_AGENT) != DD.BITDEVICE THEN ''Abnormal''
        ELSE ''Normal''
        END AS status
        from DD
        Left join CORE.US_CUSTOMER_VW FF on DD.CUSTOMER_ID=FF.CUSTOMER_ID
        where upper(DD.DEVICE_USER_AGENT) != upper(DD.BITDEVICE)
        order by "投注裝置"','5','','wilson','2017-07-08 14:57:09','kevin','2020-12-29 16:48:39','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-119','',' Check JPS_SUPER_ALL_CUSTOMER_ODDS if empty',' 超级大奖候选人名单未生成','【 L1 Actions 】
1. If today is Friday, CALL L2 and check if we need to patch:https://jira.yxunistar.com/browse/CM-2567
2. Copy to Telegram and AS Teams [ Hi L2, CMS <URG-CAL2-MID-119>，PF2，lott.JPS_SUPER_ALL_CUSTOMER_ODDS is empty ]
3. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','2 35 7 * * ?','SELECT * FROM (
SELECT COUNT(*) COUNT FROM CORE.JPS_SUPER_ALL_CUSTOMER_ODDS WHERE TRUNC(CREATE_TIME)=TRUNC(SYSDATE)
) A WHERE COUNT>0','6','','yorkx','2017-07-17 16:20:38','denice.d','2020-12-01 18:24:45','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-120','',' Daily reward send status check',' 每日送是否正常派獎偵測','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-120>，PF2，每日送是否正常派獎偵測 ]
2. Do SOP:https://wiki.yxunistar.com/x/BZA4
3. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','0 30 8 * * ?','WITH A AS (
SELECT TRUNC(LOGIN_TIME) TIME FROM core.US_CUSTOMER_LOGIN_LOG
where customer_id in (SELECT B.CUSTOMER_ID FROM CORE.PAS_ACTIVITY A LEFT JOIN CORE.PAS_ACT_CUSTOMER B ON A.ID = B.ACT_ID WHERE A.ACT_TYPE = ''DailyReward'' AND A.ACT_STATUS = ''Available'')
AND LOGIN_TIME BETWEEN (SELECT min(ACT_START_TIME) FROM CORE.PAS_ACTIVITY WHERE ACT_TYPE = ''DailyReward'' AND ACT_STATUS = ''Available'')
AND (SELECT max(ACT_END_TIME) FROM CORE.PAS_ACTIVITY WHERE ACT_TYPE = ''DailyReward'' AND ACT_STATUS = ''Available'')
GROUP BY TRUNC(LOGIN_TIME)), B AS (select TRUNC(REWARD_DATE) TIME, COUNT(CUSTOMER_ID) SENT from core.PAS_CUSTOMER_REWARD_RECORD
GROUP BY TRUNC(REWARD_DATE))
SELECT A.TIME, B.SENT FROM A LEFT JOIN B ON A.TIME = B.TIME
WHERE A.TIME BETWEEN SYSDATE -2 AND SYSDATE -1
AND B.SENT IS NULL','5','','kevin','2017-07-21 17:44:10','Nikki.o','2020-10-06 16:11:56','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-121','',' PF1 20170724大小单双',' PF1 20170724大小单双','','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','select A.*, B.TOTAL_AMOUNT, B.TOTAL_WINPRICE, B.bet_time , B.accounts from LOTT_NEW_A3D1.lott_ssc_order_detail A
left join LOTT_NEW_A3D1.lott_fc3d_order_main B on A.orderno = B.RESTARNO
where A.sortid = ''1324.21882''
 and length( FIRST_ ) < 3
 and B.bet_time > sysdate - 6/24/60','5','','joseph','2017-07-24 10:29:18','martmil.n','2019-11-21 20:42:28','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-123','',' PF2 Jackpot check',' PF2 奖池吸纳检查','【 L1 Actions 】
1. Copy to AS Group Teams and CALL L2
[  Hi L2, CMS <URG-CAL2-MID-123> , 當此警告出現
代表獎池吸納停止 ]
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','13 7 * * * ?','select count(*) from core.acs_transaction
where account_id = 1
 and TX_TYPE_ID = 2037
 and CREATE_TIME > sysdate - 1.1/24
having count(*)=0','5','','yorkx','2017-07-26 11:55:15','martmil.n','2020-11-18 10:32:02','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-124','',' PF1 PED Lottery encoding delay check',' PF1 PED開獎中心入號延遲監控','此監控主要目的
是要避免後台報錯造成無法入號
The purpose of this monitor is to
monitor if the backend is abnormal and then
encoder cannot encode anymore.
【 L1 Actions 】
1. Check UB&PED技術溝通組 - Encoding 開獎技術溝通 (EG-AS) if they informed about any delay
2. If no message, ask them, "Do you have problem in encoding?"','0','ub8-pf1-sec','1.0','0 0/15 * * * ?','with aa as(
select * from lott_new_a3d1.LOTT_MANAUL_TEMP a, lott_new_a3d1.LOTT_GROUP_SERIES b
where a.SORTID = b.GROUP_VALUE and a.sortid in (''182'',''3'')
 and a.WIN_DATE > sysdate -20/24/60
 and a.WIN_DATE < sysdate
 and a.state <> 1
), bb as (
 select count(*) as batch_cnt,trunc((sysdate - nvl ( min( WIN_DATE ) , sysdate ) ) *24*60) as lag_in_minutes,
LISTAGG(param_one , '';'' ) WITHIN GROUP (ORDER BY param_one)  as game_list
 from aa
)
select * from LOTT_NEW_A3D1.bb
where ( BATCH_CNT > 2 and lag_in_minutes >5 )
 or lag_in_minutes >10','5','','joseph','2017-07-27 14:08:33','kolin','2021-02-09 15:51:47','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-125','',' PF1 Check 3rd Game Transfer',' PF1 第三方游戏内转交易纪录负数金额监控','【 L1 Actions 】
1. There is a wrong amount transfer in 3rd party game PF1
2. Copy to AS Group Teams and AS-RC Teams [ Hi! CMS <URG-CAL2-MID-125>，PF1，第三方轉帳狀態異常,有負數資金 ]
3. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. 查詢此玩家是否有作弊行為
2. 非常緊急可聯絡RC 二線華人telegram 0998 265 8872
或是打電話通知RC 0917 620 8776
3. RC 會立即調查， pending 提現， 打上標籤， 資金凍結','0','ub8-pf1-sec','1.0','0 0 * * * ?','select B.ACCOUNTS , A.TRANSFER_TYPE , A.AMOUNTS ,A.START_TIME
from LOTT_NEW_A3D1.lott_3rd_internal_transfer A Left join LOTT_NEW_A3D1.lott_3rd_accounts B on A.atp_id=B.atp_id
where A.transfer_type in (''2010'', ''2056'' , ''2008'', ''2057'')
and  A.transfer_status = 100
and A.amounts < 0
and START_TIME>sysdate-(1/24)','5','','wilson','2017-08-02 13:53:22','Nikki.o','2020-10-06 16:13:58','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-126','',' PF2 Check 3rd Game Transfer',' PF2 第三方游戏内转交易纪录负数金额监控','【 L1 Actions 】
1. There is a wrong amount transfer between PF1 and 3rd
2.Copy to AS Group and AS-RC on Teams [ Hi! CMS <URG-CAL2-MID-126>，PF2，第三方轉帳狀態異常,有負數資金 ]
3. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. 查詢此玩家是否有作弊行為
2. 非常緊急可聯絡RC 二線華人telegram 0998 265 8872
或是打電話通知RC 0917 620 8776
3. RC 會立即調查， pending 提現， 打上標籤， 資金凍結','0','ub8-pf5-core-sec','5.0','0 0 * * * ?','SELECT B.ACCOUNTS , A.TRANSFER_TYPE , A.AMOUNTS ,A.START_TIME
FROM CORE.LOTT_3RD_INTERNAL_TRANSFER A LEFT JOIN CORE.LOTT_3RD_ACCOUNTS B ON A.ATP_ID=B.ATP_ID
WHERE A.TRANSFER_TYPE IN (''2010'', ''2056'' , ''2008'', ''2057'')
AND  A.TRANSFER_STATUS = 100
AND A.AMOUNTS < 0
AND START_TIME>SYSDATE-(1/24)','5','','wilson','2017-08-02 13:55:07','Nikki.o','2020-10-06 16:14:32','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-127','',' Bcs task can not finished over 10 minutes',' 遊戲返點未在10分鐘內派發完成','【 L1 Actions 】
1. This alarm is about bcs task not finish in 10 mins
2. Copy to AS Group Teams [ Hi L2, CMS <CHK-MID-127>, PF2 遊戲返點未在10分鐘內進行派發完成，請確認 ]
3. If this alarm appears many times with same game and numero please do SOP https://wiki.yxunistar.com/x/MUOJAw','0','ub8-pf5-core-sec','5.0','0 10 0/1 * * ?','WITH BCS_TABLE AS(
	SELECT GAME_CODE,NUMERO,CASE WHEN IS_NORMAL = 0 THEN ''NORMAL'' ELSE REMARK END IS_NORMAL,CASE WHEN STATUS=0 THEN ''STANDYBY''
	WHEN STATUS=1 THEN ''REBATE_FINISHED'' WHEN STATUS=2 THEN ''AGENT_FINISHED'' END STATUS
	,CASE WHEN REBATE_AC_SUCCESS=1 THEN ''SUCCESS'' ELSE '''' END REBATE_AC_SUCCESS
	,CASE WHEN AGENT_AC_SUCCESS=1 THEN ''SUCCESS'' ELSE '''' END AGENT_AC_SUCCESS,TO_CHAR(CREATE_TIME,''YYYY-MM-DD HH24:MI:SS'') AS CREATE_TIME
	FROM CORE.BCS_TASK
	WHERE (STATUS !=2 OR (REBATE_AC_SUCCESS=0 OR AGENT_AC_SUCCESS =0))
	AND CREATE_TIME BETWEEN SYSDATE-3 AND (SYSDATE -20/(60*24))
	ORDER BY CREATE_TIME
),TEMP_TABLE AS(
	SELECT GAME_CODE, NUMERO, IS_NORMAL,STATUS,REBATE_AC_SUCCESS,AGENT_AC_SUCCESS,CREATE_TIME,SUM(1) OVER() AS CNT, ROWNUM AS CNT1
	FROM BCS_TABLE
)


SELECT GAME_CODE 返點類型, NUMERO 期號, IS_NORMAL 錯誤訊息, STATUS 狀態, REBATE_AC_SUCCESS 代理返點, CREATE_TIME 計劃時間
FROM TEMP_TABLE','5','','kevin','2017-08-09 16:55:51','mickey','2021-06-30 16:56:10','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-128','',' JPS_OPER_LOG ERROR',' 獎池日誌發生錯誤','【 L1 Actions 】
1. Copy to AS Group Teams [ Hi L2, CMS <URG-CAL2-MID-128>, 獎池日誌發生錯誤，請確認 ]
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','28 0/10 * * * ?','WITH OPER_LOG AS(
	SELECT GAME_CODE, NUMERO AS NUMERO_NO, OPER_TIME, OPER_INFORMATION
	FROM CORE.JPS_OPER_LOG
	WHERE LOG_TYPE = ''ERROR''
		AND OPER_TIME BETWEEN SYSDATE-1*5/(24*60) AND SYSDATE
	ORDER BY GAME_CODE, NUMERO_NO
), TEMP_TABLE AS(
	SELECT GAME_CODE, NUMERO_NO, OPER_TIME, OPER_INFORMATION, SUM(1) OVER() AS CNT, ROWNUM AS CNT1
	FROM OPER_LOG
)SELECT ''{"SUB_SYSTEM":"JGS","GAME_CODE":"''||GAME_CODE||''","NUMERO":"''||NUMERO_NO||''","TIME":"''||TO_CHAR(OPER_TIME,''YYYY-MM-DD HH24:MI:SS'')||''","ISSUE":"''||OPER_INFORMATION||''."}''||(CASE WHEN CNT != CNT1 THEN '','' ELSE '''' END)  DATA
FROM TEMP_TABLE','5','','kevin','2017-08-09 17:05:02','Nikki.o','2020-10-06 16:15:04','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-131','',' PF1 Fraud Bank Card',' PF1 恶意投诉勒索涉案出款卡','ASI-11796

【 L1 Actions 】
1. Copy to AS General and AS-RC on Teams [ Hi! CMS <NU-CHK-MID-131>，PF1, 恶意投诉勒索涉案出款卡 ]
2. Do SOP: https://wiki.yxunistar.com/x/oyOJAw

【 L2 Actions 】
1.非常紧急可联络RC 二线华人telegram 0998 265 8872
或是打电话通知RC 0917 620 8776
2. RC 会立即调查， pending 提现， 打上标签， 资金冻结','0','ub8-pf1-sec','1.0','0 */20 * * * ?','SELECT ACCOUNTS AS "ACCOUNT 账户" , ''1.0'' AS "PLATFORM 平台" , BANKCARDNO AS "BANK CARD提现银行卡" , REALNAME AS "PAYEE NAME提款人姓名" FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK
WHERE BANKCARDNO IN
(
''6222020506004955189'',
''6217004470026680079'',
''6228481208280518976'',
''6217857600028157746'',
''6212261102030802824'',
''6235213288006157713'',
''6212263602025583782'',
''6236683950000641823'',
''6217007200020873967'',
''4367421375200059851'',
''6215590602003275291'',
''6222083901000129810'',
''6217852700016860585'',
''6228480298561401977'',
''411024198409197713'',
''6228461208001307372'',
''6228480360884256619'',
''6212261603001953710'',
''6217001430016762843'',
''6214850280677433'',
''6225880173817587'',
''6212261001040446574'',
''6228481454438757013'',
''6217000010103088921'',
''622908373010420110'',
''6214836351414269'',
''622908373105668912'',
''6214835498992062'',
''6210812550004918653'',
''6216917001307620'',
''6217995030013781966'',
''6217002020039474788'',
''6217856101009001483'',
''6222081207002015482'',
''6228480368022407978'',
''6214835711954642'',
''6228480070138970317'',
''6212262014003175675'',
''6217996730006053682'',
''6210985131008553597'',
''6217001830025259378'',
''6212264100032716817'',
''370204197201021329'',
''6222081208002704059'',
''4367421760310814750'',
''6217001760007789490'',
''6217001830031642393'',
''621202000000000000'',
''6228480383263170417'',
''6236681460008273795'',
''6226194100311204'',
''6222024000084323530'',
''6217002430011039204'',
''6212262305004484912'',
''6236682020000006251'',
''6212261402035189346'',
''6212262102013331543'',
''6226090202792905'',
''6217002020000007799'',
''6230580000123706785'',
''6212261702009259763'',
''6222021510005795692'',
''6222021207014303085'',
''6222024000074485265'',
''6222022703019182838'',
''6228480751078816913'',
''6215584402005085832'',
''6214852118856288'',
''6228480708206208579'',
''6214993860364129'',
''6217002930109674960'',
''6227003765080095613'',
''6228480246137606769'',
''6227001020410288369'',
''6225885351693015'',
''6230521720009376872'',
''6236681300000776579'',
''6228480218693660779'',
''6212260408006387265'',
''6217000150022823915'',
''6230582000057691993'',
''6214835850816701'',
''6217580500002381367'',
''6225887841912591'',
''6217681000240864'',
''6230523170013330000'',
''6215581105003798719'',
''6212261001085973938'',
''6212264000006878736'',
''6222621310017812062'',
''6228451268015223876'',
''6222629530008593841'',
''6228482208977983276'',
''6212262316004295810'',
''6214830240829258'',
''6214831270605808'',
''6222000200104332812'',
''6222621410006623239'',
''6217000430004444322'',
''6212262502024126180'',
''6212261406003393699'',
''6212262005004019821'',
''6236683150001258335'',
''6228480719529979671'',
''6217002340003861632'',
''6217001860006047112'',
''6214661144665757'',
''6212261402013634347'',
''6230582000051877374'',
''6222024301034096659'',
''6221500000000000000'',
''6214833518451433'',
''6212260407008221704'',
''6217923576736309'',
''6222021714005603621'',
''6216695000001300496'',
''6217000150022727090'',
''6217933501294878'',
''6212261001064061036'',
''6217003690002837283'',
''6216698000002810409'',
''6212261408006485282'',
''6212260711001499914'',
''6230523160033430000'',
''6222081203008774016'',
''6212260408011940751'',
''6236680150002926834'',
''6228483038621395778'',
''6214830113450976'',
''6214600180010584238'',
''6227002342341471222'',
''6217003020107062100'',
''6230580000132636569'',
''6215581105011796630'',
''6230521320011404174'',
''6215593700013827445'',
''6212261608006513302'',
''6214832009521688'',
''6217003810042993744'',
''6214620239000491402'',
''6217003110026584076'',
''6228481136762504778'',
''6212260809002044042'',
''6228480086766747777'',
''6217002210028953815'',
''6217004260001270081'',
''6217001930009725590'',
''6013822000591269298'',
''6228480316053853362'',
''6217000130020616057'',
''6212264301002427878'',
''6222023602092048115'',
''6222082403001382564'',
''6212262201033754203'',
''6214852107488796'',
''6236681430001261311'',
''6228480156016459166'',
''6228411080394009910'',
''6230520830002100871'',
''6212263602078217056'',
''6230580000134030258'',
''6227002980350601286'',
''6215584402018155937'',
''6212262013017172884'',
''6212264301025137264'',
''6228480329387767976'',
''6212261502009803309'',
''6217000150001641304'',
''6212260412008054881'',
''6217000150014379595'',
''6228481739131499677'',
''6216608000004879120'',
''6212262708000018321'',
''6236683760003161400'',
''6215683100002951333'',
''6216603600002269623'',
''6222082003001148120'',
''6217680901422316'',
''6228480482379040413'',
''6228480343107390811'',
''6212260302025041534'',
''6217002050002294913'',
''6214835194580013'',
''6214660635566888'',
''6212263100037677031'',
''6214855492902933'',
''6222800000000000000'',
''6210812530004827120'',
''6230583000012115665'',
''6230943240001179034'',
''6227000012510430836'',
''6236682340006472301'',
''6222032102004491247'',
''6217003150005638345'',
''6217003320048543477'',
''6228480930911958211'',
''6214832511635182'',
''6215581507000112515'',
''6228481538563520970'',
''6222081901004059973'',
''6217996100098769431'',
''6222021408016684049'',
''6230200092612030'',
''6227003040140410016'',
''6217003320063996584'',
''6217002870073594705'',
''6212260200144403389'',
''6228480038111575171'',
''6214832804383169'',
''6226631500532079'',
''6217993900061781922'',
''6212262201012585222'',
''6228482118151363072'',
''6214830170226939'',
''6215591302002846288'',
''6214920202519110'',
''6226621703960201'',
''6217231211000444636'',
''6228480580540635613'',
''6226220630762853'',
''6212263100025448718'',
''6212261602002681353'',
''6217007200030236445'',
''6222081404000524660'',
''6227001935550500846'',
''6217003760007235146'',
''6217000660002672447'',
''6217922070388237'',
''6228480900796093814'',
''6217004470008291721'',
''9558804301103805923'',
''6214832510486678'',
''6222031207003160825'',
''6217992400053177792'',
''6210812500003982341'',
''6215590603001173926'',
''6217003240017172217'',
''6217001330015743317'',
''6217001880003336748'',
''6228480322033365816'',
''6222032010007842805'',
''6217003320033815336'',
''6214835733170706'',
''6212261709004396425'',
''6217003810056272670'',
''6217001830036624099'',
''6212260411007128340'',
''6222080610000511751'',
''6226197900246769'',
''4367420132049156625'',
''6228481258760428774'',
''6228480469743677079'',
''6212262012011970780'',
''6236683140001379199'',
''6217003960001562954'',
''6217002430040556210'',
''6212264000046498701'',
''6228481336702800464'',
''6214832168919038'',
''6217002280012395174'',
''6228481208168685178'',
''6228480048626517873'',
''6228483471570631614'',
''6222021717003172911'',
''6214837631488859'',
''6212261709003902702'',
''6222002008103409087'',
''6212260409011741421'',
''6222020905008111346'',
''6228481598418801173'',
''6214830203331334'',
''6217000460012060968'',
''6217858400018353143'',
''6230930030004614250'',
''6214834573444487'',
''6236681540008684131'',
''6212260505006225815'',
''6215582603000439054'',
''6214921103162430'',
''622908473393655215'',
''6217003130009547650'',
''6217001850004638111'',
''6228410423034748664'',
''6217002590001996448'',
''6222081203006156877'',
''6215686000007525909'',
''6217002220013074097'',
''6227007201280460346'',
''6217858300029929982'',
''6215581109008077087'',
''6212260905005107669'',
''6217007110003001066'',
''6212262312002137914'',
''6212262902015878734'',
''6214832804360845'',
''6217001210090317221'',
''6228480038998430979'',
''6217002220012856049'',
''6214838983696461'',
''6217002200012398994'',
''6217865000009125400'',
''6217991770002323270'',
''6212260904004345842'',
''6227002671050501849'',
''6212262011028413610'',
''6222080200017306815'',
''6217003370002428652'',
''6230520680025501070'',
''6217002210026839131'',
''6212260200130308568'',
''6212261001064110528'',
''4367420130668399088'',
''6217852000019397143'',
''6217996710010262370'',
''6228481150714465814'',
''6228480329265488174'',
''6212260302001289628'',
''6222620340004088641'',
''6217004470012301573'',
''6228482118169074976'',
''6222031309000057168'',
''6222032116001260256'',
''6222083602013993891'',
''6217003150003106774'',
''6212264402055236115'',
''6217001820001527120'',
''6225880002195692'',
''6222022017004009546'',
''6217001830025761704'',
''6212261102021123123'',
''6216260000015837025'',
''6222001402100986224'',
''6227001376600031518'',
''6212261405009752288'',
''6228460000000000000'',
''6212261203016848714'',
''6217001070003251671'',
''6217993300090865517'',
''6214837714798455'',
''6212261207009815663'',
''6228480086820499274'',
''6214837710367057'',
''6222021001124124402'',
''6212262408005391993'',
''6212263500026951034'',
''6217003810053069731'',
''6212261613004824552'',
''6214835433874243'',
''6214855746631007'',
''6214832027355325'',
''6212262013015753230'',
''6236683480001721549'',
''6212263602044031417'',
''6225380089999207'',
''6217000010121616703'',
''6214834113936315'',
''622033100021977144'',
''6226600000000000'',
''6226630901966068'',
''622908153049612717'',
''6217003230029282765'',
''6228480240524751411'',
''6212260408004324930'',
''6210812831000661939'',
''6210812440001912968'',
''6212261911001103461'',
''6230523170014470000'',
''6215593202018762966'',
''6222623730006081577'',
''6217683101370723'',
''6212260408009993499'',
''6215581313000961062'',
''6236682830000871243'',
''6217003320064262432'',
''6228413164511720000'',
''6222021910002892726'',
''6228483368409231071'',
''6212262116002747873'',
''6222032116000123513'',
''6236683480001653494'',
''6228483178414303777'',
''6215581818005431051'',
''6222030714000133631'',
''6228413170026555311'',
''6216913400644044'',
''6222022008014662606'',
''6222020411002018488'',
''6222023803015687647'',
''6217004470021956532'',
''6212260408008934619'',
''6222021705006220829'',
''6217002340017342884'',
''6212261905004965090'',
''6226097690991386'',
''6217003800009955844'',
''6217230406000437025'',
''6217002120009514587'',
''6217231510001345316'',
''6212261717008219634'',
''6212261203013186746'',
''6217003120011745665'',
''6222081208007177988'',
''6228482399468118876'',
''6217857600032159951'',
''6230810324547778'',
''6214830109881572'',
''6230580000069536261'',
''6214833612900053'',
''6212261202004706645'',
''6215593700007268101'',
''6228480329473602574'',
''6217001260003467993'',
''6212264402000628531'',
''6212264000060270002'',
''6236683810000776922'',
''6217004220031998217'',
''6212264000047257494'',
''6222022010028497961'',
''6228480086945622370'',
''6210181478802343879'',
''6212261211006439782'',
''620522156220085884'',
''6217000830003466244'',
''6217001140010787791'',
''6222020302052585619'',
''6217002250003924670'',
''6222000200122402126'',
''4340613811803510'',
''6214832915227768'',
''6217003810030746724'',
''6228483626139671068'',
''6222021702043142652'',
''6212263901017268729'',
''6212262902003781965'',
''6222023602103783684'',
''6214855912269905'',
''6226632703533419'',
''6226632703507520'',
''6222022002005509249'',
''6228481165278860317'',
''6222031207004620355'',
''6222080402008888831'',
''6217001290000183293'',
''6214850254840348'',
''6222021204010384128'',
''6212261116000402290'',
''6217002170003420455'',
''6225882139633439'',
''6227003150190340417'',
''6222082102001990232'',
''6212262102011203645'',
''6217221812000102769'',
''6214830161589865'',
''6217905300003966029'',
''6212261203016459892'',
''6217920116688933'',
''6212261907006658996'',
''6222020407000323003'',
''6212261202048712328'',
''6214835907021826'',
''6217001540024297424'',
''6217856200044231061'',
''6217920275862774'',
''6217560800002040557'',
''6212264000066640935'',
''6228480128660868471'',
''6212262504001096923'',
''6222620590008620100'',
''6222082402002497272'',
''6215593901003243664'',
''6212262010024425164'',
''6217231818000637512'',
''6222020712002277846'',
''4340610150328802'',
''6236981430000018941'',
''6228480089188549672'',
''6215996400001254354'',
''6212262316003428396'',
''6214661084473949'',
''6216260000008831019'',
''6225885865203038'',
''6212262003009384761'',
''6212261202037895837'',
''6217001820002556714'',
''6222023100072952224'',
''6217002280018484345'',
''6228480405840734579'',
''6236683760002175336'',
''6227001464580409720'',
''6217231702003133937'',
''6217003320049649711'',
''6212260200144314024'',
''6214833806781012'',
''6230523170014490000'',
''6228481258586222971'',
''6228480469830800279'',
''6217002180003880400'',
''6212261901015308081'',
''6212262902015565927'',
''6222020609006631665'',
''6222032702000128550'',
''6222801142471073994'',
''6236682870009715900'',
''6215591901000498230'',
''6228480068835702777'',
''6217001340006486032'',
''6217002100004127957'',
''6222801375081080799'',
''6217856000002240843'',
''6212260200071874388'',
''6222620810014777953'',
''6222020406016165143'',
''6212261211005660818'',
''6222620620029667804'',
''6222020907000081311'',
''6225885924728967'',
''6214854712721108'',
''6212262011032888328'',
''6228480568095964272'',
''6212261306001119205'',
''6217001630045385561'',
''6217002000042530000'',
''6212260200078279953'',
''6226194801003548'',
''6228481269243159779'',
''6236684140002170240'',
''6236680130003780364'',
''6222022304000657795'',
''6212261202043709105'',
''6231810012500657606'',
''6217002030002783867'',
''6217002430009194599'',
''6228482550982836019'',
''6217004150004031301'',
''6222022603004921713'',
''6217230912001950650'',
''6217000780012291770'',
''6226227900298773'',
''6214835328172042'',
''6212261712005738173'',
''6222024402051074783'',
''6222081607002623245'',
''6217003800024629309'',
''6222620710011189063'',
''6217996100090192129'',
''6222032116001260199'',
''6217996100101246898'',
''6217232502000447572'',
''6214832804395155'',
''6228482441764146613'',
''6230520690003714777'',
''6217230614000120166'',
''6228480529085462479'',
''6217003800021929371'',
''6217002660008792858'',
''6212261611002132382'',
''6228481829038565777'',
''6222031709000418148'',
''6217003020103475017'',
''6227004222700058703'',
''6236680190000525998'',
''6212263202004270327'',
''4367421432217116073'',
''6227002746080257511'',
''6212262103005405279'',
''6216606300006260309'',
''6214837672139429'',
''6217230504001806105'',
''6222020406014716699'',
''6228410394525778470'',
''6210812450003284753'',
''6210982600087446587'',
''6212261406002353223'',
''6214830116762773'',
''6214921205082551'',
''6217001860002794972'',
''6217230608000280194'',
''6217852700020303218'',
''6217995950005007577'',
''6222004000113401905'',
''6222023004003495842'',
''6222621030000012971'',
''6228480758718129276'',
''6236683760006350901'',
''6228480218733612673'',
''6228450088102325371'',
''6214854514812683'',
''6217000060032637876'',
''6227000061891757150'',
''6227003525240249686'',
''6222033100021392223'',
''6214835374292132'',
''6228480031295307610'',
''6228481829077580679'',
''6215591702000535066'',
''5522451590032978'',
''6214832919274816'',
''6228484122215299916'',
''6227002920180233157'',
''6212262514000032217'',
''6228481408203837277'',
''6215590603002702798'',
''6228480395788657579'',
''6212261609006508748'',
''6230523170015284678'',
''6212262902004695248'',
''6215584402004242269'',
''6217004470002116247'',
''6228480298848705174'',
''6227002745040271364'',
''6217003810016094313'',
''6212261605003333940'',
''6214830129233051'',
''6212261402015805341'',
''6228483465320041579'',
''6217002290005283444'',
''6217920805917767'',
''6217000460003170404'',
''6212262402019700703'',
''6212260908002009193'',
''6217002500009257529'',
''6222620920007126868'',
''6226620306419987'',
''6230523170015420000'',
''6228481358978330976'',
''6214830192866845'',
''6217003760021938949'',
''6217004640000483696'',
''6214920207286798'',
''6214992430048618'',
''6226730200557533'',
''6212261106001096035'',
''6222081814000603662'',
''6236681460006649129'',
''6236682700003048323'',
''6212261901017341288'',
''6212261407005968306'',
''6216696200004167186'',
''6222080402006109008'',
''6228480084547039119'',
''652270023915900980853'',
''6217986020000024653'',
''6228480388019180271'',
''6217003810058699235'',
''6215593202018212459'',
''6212260707002021764'',
''6212261202034004912'',
''6228480381439157318'',
''6222081402004419127'',
''6217003800021431121'',
''6217001850015243752'',
''6217001670011780000'',
''6228480478674580871'',
''6217003810030809423'',
''6222083301000199337'',
''6222629530003637734'',
''4340624580036091'',
''6222020904005708998'',
''6217567600022993212'',
''6230200700031649'',
''6222033301002802913'',
''6222003602112660836'',
''6228482038815822273'',
''622908503008234368'',
''6228480462892166317'',
''6222082104000595855'',
''6217007180003542245'',
''6214672120001914336'',
''6217003800017238092'',
''6222032107001178994'',
''6222082402003797167'',
''6217003230023745213'',
''6212264402064447810'',
''6217001370024715005'',
''211022197609263000'',
''6228480379403706276'',
''6225880000000000'',
''6222031001006390079'',
''6212264000011850589'',
''6212263602125049775'',
''6230521120009552871'',
''6222033100024092564'',
''612326198508016516'',
''6214831242723812'',
''6217994910139107942'',
''6217231208010447302'',
''6217231208011263815'',
''6212262902014788736'',
''6226090218881486'',
''6222081202007532706'',
''6217003320020075936'',
''6217857000013498256'',
''6217002000058099195'',
''6217000360004683944'',
''6217007110014817120'',
''6217002960103716400'',
''6222021001041629921'',
''6217001340006906070'',
''6214830207743112'',
''6236681540007293926'',
''6222033301007978833'',
''6222084402010033661'',
''320911199004223417'',
''6210812450007737483'',
''6212262902009808887'',
''6222032103002238820'',
''6230520140006568879'',
''6217000150013776841'',
''6226190901023329'',
''6215591714001214187'',
''6217933135218723'',
''6217901400002725261'',
''6228480318299924478'',
''6217906400028529130'',
''6228480089492257277'',
''6222022314005919090'',
''6212261408005671379'',
''6212261906001661732'',
''6212263100027300362'',
''6228480469842916675'',
''6222020200091593133'',
''6217002060002241137'',
''6212264402075034185'',
''6222620250011041659'',
''6217007200078471144'',
''6222082502002930394'',
''6212262013005643730'',
''6217000350009913057'',
''6217003980002505265'',
''6228482449347505676'',
''6217003860026464006'',
''6222022102001714908'',
''6212262902016602950'',
''6212262905000442655'',
''6212262902016602968'',
''6214835776513358'',
''6215581302000469341'',
''6228482299191604079'',
''6214832015876985'',
''6217003760017730532'',
''6222629530000390444'',
''6214680181974187'',
''6217002020030179915'',
''6217922873036314'',
''6222030409000819830'',
''6215593202002206780'',
''6210817200040474239'',
''6214857556077446'',
''6217007200077581927'',
''6226097812597715'',
''6217007200026666209'',
''6228480468918048579'',
''6226192001058015'',
''6212261607013837316'',
''6228450876014840069'',
''6222032703000851043'',
''6214837906577907'',
''6236682870008511490'',
''6228482326172389667'',
''6217995520009767854'',
''6228480768773385275'',
''6214921206995157'',
''6215581115005753307'',
''6217000150014818089'',
''6215581116005152490'',
''6230523170015275874'',
''6222081717001303978'',
''6230521260011497176'',
''6228480340825079916'',
''6217000010118522732'',
''6217003760016107674'',
''6228482478486710276'',
''622848317919289000'',
''6228482920761386611'',
''6222081001017124706'',
''6217000130000517085'',
''6217230411000471784'',
''6222030409002261304'',
''6217858000084394342'',
''6212262502025209373'',
''6217003860001836525'',
''9558801001163076307'',
''6228481728552439973'',
''6216693100001375761'',
''6212261608006187370'',
''6217930462060660'',
''6230523170014530000'',
''6214835191132602'',
''6212264000068833900'',
''6230580000156161858'',
''6228480409358551573'',
''6217001830023901260'',
''6217231614000028491'',
''6230523170014580000'',
''6212263100027009765'',
''6214835221129453'',
''6221504980000246702'',
''6217007200043333296'',
''6214880942605555'',
''6222620310001030490'',
''6227000731430171184'',
''6228480048520463372'',
''6228482058291784474'',
''6222032405002118476'',
''6214920208981108'',
''6212260411008268855'',
''6217000010125967201'',
''6227000351080043276'',
''6221503410001460640'',
''6236681540013337212'',
''6222023500031705540'',
''6217003490000665640'',
''6217007200039952513'',
''6227002090170459061'',
''6212261704009290228'',
''6214850282404869'',
''6227004220810155617'',
''6227004660300148400'',
''6217002220010487078'',
''6214835414777753'',
''6236681300002377251'',
''6217000260010445314'',
''6228480469687945375'',
''6214921600398487'',
''6222081001007048659'',
''6217880800001969999'',
''6222081903000514290'',
''6222032003000543009'',
''6227000190200013961'',
''6217002480003008956'',
''6228480638499782271'',
''6214835793429273'',
''6214923007022587'',
''6212262407003011892'',
''6222001606100262648'',
''6222031203003368278'',
''6222033100016328182'',
''6212261617001286665'',
''6215688000008802404'',
''6236680690001440626'',
''6217856200031608495'',
''6217991650000443116'',
''6215583901000946006'',
''6215592606002115166'',
''6228481729121459476'',
''6217857000075390581'',
''6210812590002029715'',
''6236682390001879133'',
''6210812390005610912'',
''6212262009003260451'',
''6226221700795575'',
''6217007180002126081'',
''6228483471312562010'',
''6214837974924502'',
''6212262201039649902'',
''6228460460017932716'',
''6217922002767342'',
''6222033301009521698'',
''6217000170004847229'',
''6222080200016699129'',
''6217231811000319207'',
''6222020402045163043'',
''6217001490002995229'',
''6226224400289691'',
''6212261716003600798'',
''6210812430019532304'',
''6222081001012665737'',
''6212261001063158544'',
''6222023100081505617'',
''6217004260008765117'',
''6228480170783842314'',
''6216696500001830466'',
''6217994350012880002'',
''6228410430196443117'',
''6230582000083398159'',
''6230582000074535934'',
''6217231811000812060'',
''6217868000004081621'',
''623059125601326709'',
''6210817200014336125'',
''6222021605004058793'',
''6217231604001455041'',
''6217681802233943'',
''6212260407006454208'',
''6212390000002663808'',
''6215695000002463303'',
''6226174800268722'',
''6222021102068326951'',
''6212261603015330434'',
''6228450288066015378'',
''6217003230041819545'',
''6227002349381049321'',
''6013827005014901927'',
''6217003320045864827'',
''6236681470003230492'',
''6215581714003396687'',
''6214855127345391'',
''6222021116014600418'',
''6217003370006008674'',
''6228480455799463076'',
''6212261110001049440'',
''6217001650003353518'',
''4100622518878899'',
''4367420013500892165'',
''4367421215904102013'',
''4367421217384062774'',
''6210810730001082842'',
''6210810730020667417'',
''6210810730030460761'',
''6210814220006694446'',
''6210814220007272528'',
''6212252312000010313'',
''6212253602006215315'',
''6212260302015848757'',
''6212260405000784778'',
''6212260406001239598'',
''6212260409016090139'',
''6212260502000510631'',
''6212260502010986144'',
''6212260511006152173'',
''6212260613000989475'',
''6212260905007066731'',
''6212261001070654485'',
''6212261205004791434'',
''6212261603013046529'',
''6212261610010963127'',
''6212261715008840631'',
''6212261716003040102'',
''6212262008018288150'',
''6212262012004247485'',
''6212262013014039961'',
''6212262102006170189'',
''6212262115002739930'',
''6212262201032337133'',
''6212262314001903445'',
''6212262406004537319'',
''6212262603000018241'',
''6212263500029806474'',
''6212263602015941982'',
''6212263602067700674'',
''6212263602097760482'',
''6212263602110580685'',
''6212264402010303489'',
''6212883012000020307'',
''6214830127319837'',
''6214830165956029'',
''6214830169041232'',
''6214830176991122'',
''6214830178625132'',
''6214830221508079'',
''6214831234075486'',
''6214831297432509'',
''6214832903310675'',
''6214832917696135'',
''6214832918500682'',
''6214835215491588'',
''6214835414974541'',
''6214835418234967'',
''6214835494557521'',
''6214835713021069'',
''6214835923541682'',
''6214837311977163'',
''6214837554193015'',
''6214837555343973'',
''6214837699131177'',
''6214837845941107'',
''6214837878244361'',
''6214837903592586'',
''6214839561213513'',
''6214850230610872'',
''6214850239696591'',
''6214854713022175'',
''6214855713082952'',
''6214855911656102'',
''6214855912060056'',
''6214856551042983'',
''6214857802824351'',
''6214857812496208'',
''6214857910505124'',
''6215581105004209005'',
''6215581507003592994'',
''6215581507003593000'',
''6215581812004573138'',
''6215590603007383552'',
''6215591302002179839'',
''6215592102000836987'',
''6217000500001354284'',
''6217001040004958129'',
''6217001780006873749'',
''6217001820015986569'',
''6217001840006320776'',
''6217001840011361617'',
''6217002170005394161'',
''6217002230001721880'',
''6217002290023074585'',
''6217002300015649953'',
''6217003120008115716'',
''6217003160002570250'',
''6217003200003616908'',
''6217003230033541602''
)
UNION
SELECT ACCOUNTS AS "ACCOUNT 账户" , ''1.0'' AS "PLATFORM 平台" , BANKCARDNO AS "BANK CARD提现银行卡" , REALNAME AS "PAYEE NAME提款人姓名" FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK
WHERE BANKCARDNO IN
(
''6217003760038163903'',
''6217003800012460857'',
''6217003810039901205'',
''6217004180003770468'',
''6217004190001368660'',
''6217004220044988297'',
''6217004220045325226'',
''6217004220045433756'',
''6217004550001885395'',
''6217230705000610543'',
''6217230710000646430'',
''6217231001001466245'',
''6217232605002388197'',
''6217681500624369'',
''6217713001828221'',
''6217770470386560'',
''6217857000067511533'',
''6217903100005583711'',
''6217906000001585339'',
''6222001001107695687'',
''6222003803100211570'',
''6222020705006940195'',
''6222021001101229943'',
''6222021611007043857'',
''6222022201016969539'',
''6222022304006545606'',
''6222022313004162314'',
''6222023100042907092'',
''6222023500031615962'',
''6222031203002061833'',
''6222032014000410784'',
''6222032105001364036'',
''6222080603003491428'',
''6222080808000575160'',
''6222081102007220254'',
''6222081105000617061'',
''6222081106001472357'',
''6222081203001828074'',
''6222081604000257126'',
''6222082105001621517'',
''6222083400004447120'',
''6222083602005684417'',
''6222083602013111155'',
''6222084000008491378'',
''6222600610017881149'',
''6222620250008801172'',
''6222980019825639'',
''6225882134388096'',
''6225884201006973'',
''6226097310229522'',
''6226225600839904'',
''6226622806668261'',
''6226961200166070'',
''6227002661800045361'',
''6227002870810081239'',
''6227002872380275605'',
''6228270146064546471'',
''6228270651234766776'',
''6228270771250971272'',
''6228271631240255179'',
''6228480078209717277'',
''6228480086787586972'',
''6228480089780826676'',
''6228480098481194375'',
''6228480136706060276'',
''6228480218767937376'',
''6228480268860870370'',
''6228480289017131078'',
''6228480318128708779'',
''6228480318240890570'',
''6228480382642604716'',
''6228480431124025419'',
''6228480631851164014'',
''6228480669073290472'',
''6228480688562215774'',
''6228480819448137177'',
''6228481139537015070'',
''6228481198848377777'',
''6228481269225229376'',
''6228481332988301616'',
''6228481619104444175'',
''6228481758353024278'',
''6228481988932848877'',
''6228482028574207378'',
''6228482309196611977'',
''622908373060405417'',
''6230520210020812874'',
''6230520210020993476'',
''6230520460057971172'',
''6230521000000019270'',
''6230522080019735271'',
''6230580000071054501'',
''6230580000088255307'',
''6230580000098109395'',
''6230580000114321990'',
''6230580000117351572'',
''6230580000123743739'',
''6230582000046148030'',
''6230943210000207250'',
''6236682340007176026'',
''6236682830005136311'',
''6236683610001916430'',
''6236683630000400814'',
''6236684160003356473'',
''6236684220001924100'',
''6217991410006575084'',
''6212260302037351160'',
''6236682870012027079'',
''6214837664668393'',
''6222032116001441948'',
''6217003590006259817'',
''6214855711190005'',
''6222620170014643162'',
''6212263500041291143'',
''6212261907007305902'',
''6217905300005420223'',
''6217001870002949856'',
''6217002950105780348'',
''6222033100021677144'',
''6228480608148437478'',
''6217003590006259825'',
''6215593202009515324'',
''6217921408224833'',
''6214680131826263'',
''6228480128455331172'',
''330424199602262017'',
''6228580499014617180'',
''6228480383393380712'',
''62170018930023900000'',
''6217905300005420000'',
''6217001870002940000'',
''6217001370024710000'',
''6216608000004870000'',
''6217003320049640000'',
''6236682940004017444'',
''6230521100014134279'',
''6230520050059670375'',
''6215591904001999446'',
''621700720006344093'',
''622908433047561714'',
''6214837970500066'',
''6214837856820042'',
''6215581813007272769'',
''6228480086792788571'',
''6222620750010138463'',
''6212262109001650560'',
''6217906500035320041'',
''6217997900062415054'',
''6227003811990406803'',
''6227000730340059950'',
''6236680010002198505'',
''6228480068825005678'',
''6212262106000555881'',
''6222629530010001296'',
''6230523470025030677'',
''6228482168964614773'',
''6212264402028319923'',
''6217003390007518984'',
''6217712000198420'',
''6228481028959581976'',
''6217001250010325870'',
''6230520790020308379'',
''6222021108015149586'',
''6215581102007925232'',
''6216606100002638882'',
''6221871000002642009'',
''6217731203389784'',
''6217921601959839'',
''6214920604191864'',
''6214857160026821'',
''6226630204319155'',
''6214855160183987'',
''6217001830033852784'',
''6217256300009023887'',
''6212262502037600460'',
''6212262502036958851'',
''6216690100005294136'',
''6214831008728781'',
''6222030802002499678'',
''6214837970788349'',
''6212261510002301965'',
''6217002120004827992'',
''6228480469624752975'',
''6217903100010305787'',
''6212252006000971967'',
''6214830161890842'',
''6217001140010373956'',
''6217002110003291779'',
''6228482316063756363'',
''6228480156032466765'',
''6228480156024604464'',
''6228481308433929276'',
''6212843191360052354'',
''6212843191360052354'',
''6217858100029509366'',
''6212838105000144741'',
''6226630204922818'',
''6217865000009637255'',
''6228480378257556670'',
''411325198206052912'',
''6217880800010974691'',
''6210812470001673609'',
''6217001830037658435'',
''6217866400004872973'',
''6230521820046461370'',
''6217001830037550483'',
''6217004220050918188'',
''6222620280003284660'',
''6222623550003039729'',
''6226220318302444'',
''6226631702375301'',
''6228430338048575976'',
''6228480819437778379'',
''6228482479617118579'',
''6230520680054044075'',
''6217000270000245302'',
''6228460718021617676'',
''6228480136742388277'',
''6222032003003915477'',
''6228270146069680374'',
''6215582603000997283'',
''6228482409750483175'',
''6217923671249240'',
''6222620720006100777'',
''6217906400019589127'',
''6212261512003918045'',
''6217921802107311'',
''6222034000005908136'',
''6222032015001049927'',
''6222032015000881858'',
''6217001820027547870'',
''6217003030108656792'',
''6217582000045808169'',
''6214837789525312'',
''6216667500002190220'',
''6214857822754638'',
''6215697500014265396'',
''6212261906005911943'',
''6228210399028053075'',
''6217996020049279779'',
''6236683030001081384'',
''6212262408003577080'',
''6212261913006871134'',
''6217000120022515290'',
''6217002920001543546'',
''6222021901007260019'',
''6228480086962717178'',
''6230580000222047685'',
''6236681930009157361'',
''6222030713000813184'',
''6226630204922818'',
''6230522380006783478'',
''6212264402005765742'',
''6228411933042586368'',
''6213363154002546173'',
''6217903100034208850'',
''6222620910030475242'',
''6217710724643374'',
''6212260200166693800'',
''6217930675389328'',
''6228480018948435971'',
''6221871000011063064'',
''6212260200171601681'',
''6222620910030475242'',
''62170072000072100632'',
''6217993680017711971'',
''6228482309027340176'',
''6230520860019898373'',
''6217560500035398291'',
''6214832047383455'',
''6222032102007768906'',
''6217003810042592306'',
''6228481028960031870'',
''6226221700382812'',
''6228480328882618478'',
''6222081001024943833'',
''6217001210075995421'',
''6230520030075894076'',
''6228480038104447370'',
''6217001210027834876'',
''6222620910030475242'',
''6217230903002109891'',
''6214832707995572'',
''421083198804155320'',
''6230523460018133976'',
''6217001340006750635'',
''6228483465805621879'',
''6222623710000816061'',
''6217856100091483682'',
''6226662001298928'',
''6217921771938381'',
''6013821900070837716'',
''6212262201042889784'',
''6228481629554933973'',
''6212262016005410588'',
''6217906400028731520'',
''6228482578099336771'',
''6229538106600344498'',
''6217906300021667426'',
''6217568300000165441'',
''6230580000227461584'',
''6222620710032143458'',
''6214832022626787'',
''6217566300000165441'',
''6226482578099336771'',
''6227082430090492513'',
''6217858000107144831'',
''6217995910006018189'',
''6217000150025821817'',
''6216910316065637'',
''6217853100025846403'',
''6236683690000165940'',
''6212262317012262543'',
''6228480688350241370'',
''6227001833310286238'',
''6228480683009574016'',
''6217001830036103003'',
''6227002120690165526'',
''622908436229518519'',
''6230520460163926276'',
''6222620530012916574'',
''6216693100005008103'',
''6222022008018717539'',
''6225887521071759'',
''6226221105768748'',
''6212262010029456388'',
''6228480269026512872'',
''6222022102016888622'',
''6228480395881297976'',
''6217002190017067175'',
''6216912702162291'',
''6228270081492688779'',
''6222629530007560411'',
''6230520460203211473'',
''6214838986579797'',
''6217257500003252205'',
''6217003730002317108'',
''6217993900037031980'',
''6217003810057586102'',
''6228413854653466179'',
''6217977151001738909'',
''6217993000318144410'',
''6212262010005203184'',
''6222081607002520839'',
''6228480208318206777'',
''622908376266247715 '',
''6222020200115997401'',
''6228460028001283774'',
''6222021617001990688'',
''4367420012690066721'',
''6222023700018946188'',
''6227003631120333374'',
''6212261402003388698'',
''6227000167970095881'',
''6212263602008661696'',
''6228282130924567215'',
''6222020407002119094'',
''6212261406002431912'',
''6217003230019164759'',
''6217001930019027110'',
''6226903800025504'',
''6212261703003845938'',
''622709108971617'',
''6227001892560238612'',
''6217001830003033639'',
''6227001264290223522'',
''6227001824360057856'',
''6227000167970020012'',
''6222020502002227127'',
''6212261703000393602'',
''6212262010018423205'',
''6222081103002996178'',
''6212262010018427721'',
''6212261702002745204'',
''6217002660006633112'',
''6227002664090149570'',
''6217002230006570316'',
''6222023700038164754'',
''6212262603000187202'',
''6222022603003411294'',
''6212262603001337384'',
''6212262603000187194'',
''6212262603001332708'',
''6217220200002018947'',
''6228482828515763870'',
''6222021313006440263'',
''6228483151320723719'',
''6236681540003019085'',
''6227002463010121821'',
''6212261712003088845'',
''6217002580000323579'',
''6228481258975460778'',
''6212262110000211602'',
''6228482018261639579'',
''6212261602002150060'',
''6217850500010719429'',
''6222023400028183662'',
''6259960046798823'',
''5287080009172565'',
''622848056026797413'',
''6222023400025803171'',
''6227000786120083297'',
''6227000786110098834'',
''6212263301008842337'',
''6214835491176705'',
''6222021302028362738'',
''6228480660513315516'',
''6222021602020442929'',
''6212262513000953232'',
''6212262513000419721'',
''6212262513000975458'',
''6212262513000681015'',
''6212260606001127566'',
''6222020606000847040'',
''6717000130033403790'',
''6227002031010536411'',
''6222023301035053866'',
''6217001070009633104'',
''6217001140017906295'',
''6214671070003166453'',
''6217000210008657503'',
''6222023301040093949'',
''6217001070008617900'',
''6217001070002041354'',
''6217000210007847733'',
''6217001140026763620'',
''6217001070006700575'',
''6217001070000285748'',
''6217001070009631595'',
''6222024200028609578'',
''6217000990004768533'',
''6217001070009635448'',
''6217001070009633567'',
''6228482660635749517'',
''6217000210002050564'',
''6217001070008621902'',
''6212260200116699253'',
''6228480011017746014'',
''4340621022798189'',
''6217855000048930184'',
''6217001070009631785'',
''6217001070006213793'',
''6217001070006685081'',
''6222623310003701178'',
''6217001070003195589'',
''6215581103002839519'',
''6217002830004236479'',
''6228481558538313970'',
''6212261410002465102'',
''6228481552308516516'',
''6227001882840398013'',
''6212261410000289074'',
''6217003520006246928'',
''6217001880000808434'',
''6228481552587532317'',
''6228481552092932317'',
''6222021410003179140'',
''6217002920116145997'',
''6212261911004873144'',
''6215591911000633264'',
''6221215212321563256'',
''621226040202512783'',
''6214832009412052'',
''6227007201541267191'',
''6212262115002712945'',
''6212262112002506403'',
''6217682901289687'',
''6222082102001843720'',
''6217000140023764572'',
''622908127378779412'',
''6217714900950462'',
''622908123008655858'',
''6222020402038022727'',
''6222021502019065436'',
''6214835218997888'',
''6217000010062442515'',
''6217001210031205485'',
''6212264000042160529'',
''6212264000043460373'',
''6212262010026802188'',
''6212262004004764221'',
''6212261716003018488'',
''6222021906005426819'',
''6212262105000532296'',
''6228480838425524074'',
''6222020402032715151'',
''6222023202033001966'',
''6227002871580337280'',
''6228481436698787772'',
''6212261702016757841'',
''6222370125807608'',
''6222020408016990033'',
''6212261713002355037'',
''6217857500009085579'',
''6222340037711800'',
''4563517500024406108'',
''6222021901023421884'',
''6226220115871153'',
''6226900717320176'',
''6212261603000462697'',
''6222083500003419184'',
''6222023500007745918'',
''6212260200058902137'',
''6228480018335163079'',
''6225880159285767'',
''6225880159284398'',
''6227000581380120487'',
''6210810580001928753'',
''6210810580000465724'',
''6222020704009805448'',
''6227000581410029641'',
''6222020704006280843'',
''6228480018609697471'',
''6217856200016144540'',
''6217004280009986637'',
''6212251813001076741'',
''6228480791116706015'',
''6222020710004177477'',
''6228480258879872970'',
''6214835760188977'',
''6222081404001003680'',
''6222021606008662168'',
''5309900017054253'',
''6225882013152688'',
''6222021606010912957'',
''6227002192453558484'',
''6222022703017076610'',
''6222020604004034855'',
''6222021609006306028'',
''6222021814001993396'',
''6222021303001964557'',
''6228480291428959311'',
''6222620910017027388'',
''6222081607000101814'',
''6222081607002260915'',
''6227002200036830724'',
''6222600910074506419'',
''6217995030000934784'',
''6228480058576601072'',
''6222020713003853155'',
''6236682530002796527'',
''6222021706003969830'',
''6217908000001080883'',
''6215581503000395366'',
''6217004260006774061'',
''6227004381010071580'',
''6217004380000781290'',
''6227002476030028552'',
''6222370034901831'',
''6228480405802637778'',
''6222021503001526039'',
''6215580912000049918'',
''4270200017243727'',
''6215581405000294245'',
''6217001840007584586'',
''6215581405000169439'',
''6217002230004037664'',
''6216917902436031'',
''6228480268083550874'',
''6222100102206643'',
''4367420012510402759'',
''4563510100887934457'',
''6212260712001457282'',
''6230943240001661239'',
''6222022104001226610'',
''6227003100160144711'',
''6222022003008560957'',
''6222021611007542312'',
''6222022002006955540'',
''622202200200695540'',
''6227003234120018143'',
''6222022609003239288'',
''6228482920365379517'',
''6222023100044417470'',
''6228480291207277018'',
''6217996900087243946'',
''6222023100014279033'',
''6212261602006673059'',
''6228482301127495513'',
''6212261211001243429'',
''6222021609002998455'',
''6228481831755620819'',
''6222601040002629445'',
''6222802397581036690'',
''6222021309002588816'',
''6228481730647168716'',
''6222080200017477947'',
''6222023100083104310'',
''6222022706003072915'',
''6227004227240019438'',
''6227002548010234937'',
''6227003114130115388'',
''9558821109001104607'',
''6228481388458096474'',
''1912101701002976831'',
''6217003010000279612'',
''6227075770150882'',
''6222081912000885469'',
''6222624390000701867'',
''4340623010027514'',
''6222021912000885469'',
''6225887317400808'',
''6217007200048185683'',
''6215983010200018321'',
''6217003010104006762'',
''6212262111004767904'',
''6217003010104277223'',
''6222080302002811476'',
''6228480778354229677'',
''6222021912000512751'',
''6222081912000504037'',
''6222081912000709040'',
''6222021912004919432'',
''6222021508006041967'',
''6228484178497806372'',
''6217003640006181998'',
''6222022102003101880'',
''6222081607001837614'',
''6222021607010173947'',
''4367422200037259863'',
''6228480928266241274'',
''6222021604001297744'',
''6222021102033688873'',
''6227002006730038062'',
''6214850254262311'',
''6228481841932736511'',
''6212260200127580187'',
''6215983760008810986'',
''6222022105009784369'',
''6222082105001090119'',
''6212261001015518415'',
''6214835121984189'',
''6222022403005480052'',
''6222022010033185916'',
''6227002454810291583'',
''6236681840001721736'',
''6212261408012678763'',
''6222021408018405682'',
''6222021613008210394'',
''6222802349961078297'',
''6222023202012783964'',
''6228481261306894517'',
''6222020409008073077'',
''6222380037539066'',
''6222021914003546125'',
''6227001274570022361'',
''6212261717001429370'',
''6217001210051848180'',
''6222802430161022960'',
''6222021702040763112'',
''6212261718001915996'',
''6222113957593304'',
''6222621030001504992'',
''6212262405004380167'',
''6212262405001555803'',
''6222022405003901773'',
''6228481208142416674'',
''6228481163988289018'',
''6228480329448374374'',
''6228480328705476872'',
''6222520178399982'',
''6222020408016815537'',
''622202048016815537'',
''6227002951240486774'',
''6222021905002954211'',
''6212261206000605966'',
''6212263602072352370'',
''6212260200013319963'',
''6212262402004221616'',
''6222021505001682894'',
''6222021901015877341'',
''6222021906004186257'',
''6222021404001227894'',
''6227003191110027783'',
''6215592006000234822'',
''621700319000530352'',
''6221881600039338857'',
''6222021706017213902'',
''6222021706010117316'',
''6222020503005988871'',
''6222022201011805290'',
''6222022315006807101'',
''6222021102055553807'',
''6227002301081803317'',
''9558803602163650633'',
''6227002942310133057'',
''6222021903003682246'',
''6212250603000307218'',
''6212262012004058304'',
''6222020409012336262'',
''6212261404000550544'',
''6228482038140494178'',
''6212261611001346504'',
''6212261611001446064'',
''6214835102189733'',
''6228480518610915879'',
''6215581103006020710'',
''6227002260020646908'',
''6217856100069044653'',
''6221507970002065926'',
''6215582316003681198'',
''6228480404836035117'',
''6212264402047486448'',
''6227003813850049095'',
''6217996730000148389'',
''6217995030013766462'',
''6228481849051009073'',
''6228481849002682374'',
''6216602700000863731'',
''6236692390000990574'',
''6228480246022168263'',
''6228482131722361319'',
''6228480048527982176'',
''4340620160030835'',
''6222020407000686649'',
''6222080407000152862'',
''6217003620002384465'',
''6228482868722153473'',
''6217903100031655152'',
''6214833781894715'',
''6236682920008938464'',
''6222022608001907938'',
''6217232608000880991'',
''6222021311006825558'',
''6222024000041633229'',
''6222022010028485636'',
''6222004000109703215'',
''6222022010024610021'',
''6227004310550040838'',
''6222022103006837462'',
''6222021901002657334'',
''62220220100284856363'',
''62220220100246100212'',
''6222021817001133046'',
''6222021804003198052'',
''6222024000000999371'',
''6222022020001402243'',
''6222021305003466432'',
''6227002920770602159'',
''6210810940001872080'',
''6222021714005526871'',
''6212261309001546765'',
''6222021309006743193'',
''6228483331016058816'',
''6222022103006881791'',
''6222021908006194586'',
''6222021804003652546'',
''6222022010030170945'',
''4000026501111335289'',
''6228480329292662874'',
''6228480328660218277'',
''6222080407001456775'',
''6214660160102893'',
''6222080407001632300'',
''6228413854647190778'',
''6215582318000497610'',
''6212264402005492982'',
''6228483858529534578'',
''6226194801119385'',
''6217001280001719351'',
''6215581807002548298'',
''6228271057001453474'',
''6222021103022211685'',
''6227001030720035129'',
''6212260909002877308'',
''6222082320000041613'',
''6222022320000797332'',
''6217996840002196334'',
''6215683100018178483'',
''2320632401101024191'',
''6216910104937955'',
''6212261309000319255'',
''6214835210685432'',
''6217993000102006676'',
''6217856101016199379'',
''6228481628835591378'',
''6222802732601000468'',
''6217921774167087'',
''6228480298971541172'',
''6217002200004048805'',
''6236681820007820963'',
''6228480068831694572'',
''6225880159253575'',
''6214837715339853'',
''6217002460016570457'',
''6217002460022480394'',
''6212261706012877149'',
''6212261709001426787'',
''6217002480005317025'',
''6227002481310090694'',
''6222625980000768962'',
''6217856100007313007'',
''6222031001013180448''
)','5','','wilson','2017-09-29 16:16:19','martmil.n','2020-03-06 18:34:43','213','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-132','',' PF2 Fraud Bank Card',' PF2 恶意投诉勒索涉案出款卡','ASI-11796

【 L1 Actions 】
1. Copy to AS General and AS-RC on Teams [ Hi! CMS <NU-CHK-MID-132>，PF2，恶意投诉勒索涉案出款卡 ]
2. Do SOP: https://wiki.yxunistar.com/x/oyOJAw

【 L2 Actions 】
1.非常紧急可联络RC 二线华人telegram 0998 265 8872
或是打电话通知RC 0917 620 8776
2. RC 会立即调查， pending 提现， 打上标签， 资金冻结','0','ub8-pf5-core-sec','5.0','0 */20 * * * ?','select CUSTOMER_ID as "Account 账户" , ''2.0'' as "Platform 平台" , CARD_NO as "Bank Card提现银行卡"
from CORE.BPS_CUSTOMER_BANK_VW
where CARD_NO in
(
''6222020506004955189'',
''6217004470026680079'',
''6228481208280518976'',
''6217857600028157746'',
''6212261102030802824'',
''6235213288006157713'',
''6212263602025583782'',
''6236683950000641823'',
''6217007200020873967'',
''4367421375200059851'',
''6215590602003275291'',
''6222083901000129810'',
''6217852700016860585'',
''6228480298561401977'',
''411024198409197713'',
''6228461208001307372'',
''6228480360884256619'',
''6212261603001953710'',
''6217001430016762843'',
''6214850280677433'',
''6225880173817587'',
''6212261001040446574'',
''6228481454438757013'',
''6217000010103088921'',
''622908373010420110'',
''6214836351414269'',
''622908373105668912'',
''6214835498992062'',
''6210812550004918653'',
''6216917001307620'',
''6217995030013781966'',
''6217002020039474788'',
''6217856101009001483'',
''6222081207002015482'',
''6228480368022407978'',
''6214835711954642'',
''6228480070138970317'',
''6212262014003175675'',
''6217996730006053682'',
''6210985131008553597'',
''6217001830025259378'',
''6212264100032716817'',
''370204197201021329'',
''6222081208002704059'',
''4367421760310814750'',
''6217001760007789490'',
''6217001830031642393'',
''621202000000000000'',
''6228480383263170417'',
''6236681460008273795'',
''6226194100311204'',
''6222024000084323530'',
''6217002430011039204'',
''6212262305004484912'',
''6236682020000006251'',
''6212261402035189346'',
''6212262102013331543'',
''6226090202792905'',
''6217002020000007799'',
''6230580000123706785'',
''6212261702009259763'',
''6222021510005795692'',
''6222021207014303085'',
''6222024000074485265'',
''6222022703019182838'',
''6228480751078816913'',
''6215584402005085832'',
''6214852118856288'',
''6228480708206208579'',
''6214993860364129'',
''6217002930109674960'',
''6227003765080095613'',
''6228480246137606769'',
''6227001020410288369'',
''6225885351693015'',
''6230521720009376872'',
''6236681300000776579'',
''6228480218693660779'',
''6212260408006387265'',
''6217000150022823915'',
''6230582000057691993'',
''6214835850816701'',
''6217580500002381367'',
''6225887841912591'',
''6217681000240864'',
''6230523170013330000'',
''6215581105003798719'',
''6212261001085973938'',
''6212264000006878736'',
''6222621310017812062'',
''6228451268015223876'',
''6222629530008593841'',
''6228482208977983276'',
''6212262316004295810'',
''6214830240829258'',
''6214831270605808'',
''6222000200104332812'',
''6222621410006623239'',
''6217000430004444322'',
''6212262502024126180'',
''6212261406003393699'',
''6212262005004019821'',
''6236683150001258335'',
''6228480719529979671'',
''6217002340003861632'',
''6217001860006047112'',
''6214661144665757'',
''6212261402013634347'',
''6230582000051877374'',
''6222024301034096659'',
''6221500000000000000'',
''6214833518451433'',
''6212260407008221704'',
''6217923576736309'',
''6222021714005603621'',
''6216695000001300496'',
''6217000150022727090'',
''6217933501294878'',
''6212261001064061036'',
''6217003690002837283'',
''6216698000002810409'',
''6212261408006485282'',
''6212260711001499914'',
''6230523160033430000'',
''6222081203008774016'',
''6212260408011940751'',
''6236680150002926834'',
''6228483038621395778'',
''6214830113450976'',
''6214600180010584238'',
''6227002342341471222'',
''6217003020107062100'',
''6230580000132636569'',
''6215581105011796630'',
''6230521320011404174'',
''6215593700013827445'',
''6212261608006513302'',
''6214832009521688'',
''6217003810042993744'',
''6214620239000491402'',
''6217003110026584076'',
''6228481136762504778'',
''6212260809002044042'',
''6228480086766747777'',
''6217002210028953815'',
''6217004260001270081'',
''6217001930009725590'',
''6013822000591269298'',
''6228480316053853362'',
''6217000130020616057'',
''6212264301002427878'',
''6222023602092048115'',
''6222082403001382564'',
''6212262201033754203'',
''6214852107488796'',
''6236681430001261311'',
''6228480156016459166'',
''6228411080394009910'',
''6230520830002100871'',
''6212263602078217056'',
''6230580000134030258'',
''6227002980350601286'',
''6215584402018155937'',
''6212262013017172884'',
''6212264301025137264'',
''6228480329387767976'',
''6212261502009803309'',
''6217000150001641304'',
''6212260412008054881'',
''6217000150014379595'',
''6228481739131499677'',
''6216608000004879120'',
''6212262708000018321'',
''6236683760003161400'',
''6215683100002951333'',
''6216603600002269623'',
''6222082003001148120'',
''6217680901422316'',
''6228480482379040413'',
''6228480343107390811'',
''6212260302025041534'',
''6217002050002294913'',
''6214835194580013'',
''6214660635566888'',
''6212263100037677031'',
''6214855492902933'',
''6222800000000000000'',
''6210812530004827120'',
''6230583000012115665'',
''6230943240001179034'',
''6227000012510430836'',
''6236682340006472301'',
''6222032102004491247'',
''6217003150005638345'',
''6217003320048543477'',
''6228480930911958211'',
''6214832511635182'',
''6215581507000112515'',
''6228481538563520970'',
''6222081901004059973'',
''6217996100098769431'',
''6222021408016684049'',
''6230200092612030'',
''6227003040140410016'',
''6217003320063996584'',
''6217002870073594705'',
''6212260200144403389'',
''6228480038111575171'',
''6214832804383169'',
''6226631500532079'',
''6217993900061781922'',
''6212262201012585222'',
''6228482118151363072'',
''6214830170226939'',
''6215591302002846288'',
''6214920202519110'',
''6226621703960201'',
''6217231211000444636'',
''6228480580540635613'',
''6226220630762853'',
''6212263100025448718'',
''6212261602002681353'',
''6217007200030236445'',
''6222081404000524660'',
''6227001935550500846'',
''6217003760007235146'',
''6217000660002672447'',
''6217922070388237'',
''6228480900796093814'',
''6217004470008291721'',
''9558804301103805923'',
''6214832510486678'',
''6222031207003160825'',
''6217992400053177792'',
''6210812500003982341'',
''6215590603001173926'',
''6217003240017172217'',
''6217001330015743317'',
''6217001880003336748'',
''6228480322033365816'',
''6222032010007842805'',
''6217003320033815336'',
''6214835733170706'',
''6212261709004396425'',
''6217003810056272670'',
''6217001830036624099'',
''6212260411007128340'',
''6222080610000511751'',
''6226197900246769'',
''4367420132049156625'',
''6228481258760428774'',
''6228480469743677079'',
''6212262012011970780'',
''6236683140001379199'',
''6217003960001562954'',
''6217002430040556210'',
''6212264000046498701'',
''6228481336702800464'',
''6214832168919038'',
''6217002280012395174'',
''6228481208168685178'',
''6228480048626517873'',
''6228483471570631614'',
''6222021717003172911'',
''6214837631488859'',
''6212261709003902702'',
''6222002008103409087'',
''6212260409011741421'',
''6222020905008111346'',
''6228481598418801173'',
''6214830203331334'',
''6217000460012060968'',
''6217858400018353143'',
''6230930030004614250'',
''6214834573444487'',
''6236681540008684131'',
''6212260505006225815'',
''6215582603000439054'',
''6214921103162430'',
''622908473393655215'',
''6217003130009547650'',
''6217001850004638111'',
''6228410423034748664'',
''6217002590001996448'',
''6222081203006156877'',
''6215686000007525909'',
''6217002220013074097'',
''6227007201280460346'',
''6217858300029929982'',
''6215581109008077087'',
''6212260905005107669'',
''6217007110003001066'',
''6212262312002137914'',
''6212262902015878734'',
''6214832804360845'',
''6217001210090317221'',
''6228480038998430979'',
''6217002220012856049'',
''6214838983696461'',
''6217002200012398994'',
''6217865000009125400'',
''6217991770002323270'',
''6212260904004345842'',
''6227002671050501849'',
''6212262011028413610'',
''6222080200017306815'',
''6217003370002428652'',
''6230520680025501070'',
''6217002210026839131'',
''6212260200130308568'',
''6212261001064110528'',
''4367420130668399088'',
''6217852000019397143'',
''6217996710010262370'',
''6228481150714465814'',
''6228480329265488174'',
''6212260302001289628'',
''6222620340004088641'',
''6217004470012301573'',
''6228482118169074976'',
''6222031309000057168'',
''6222032116001260256'',
''6222083602013993891'',
''6217003150003106774'',
''6212264402055236115'',
''6217001820001527120'',
''6225880002195692'',
''6222022017004009546'',
''6217001830025761704'',
''6212261102021123123'',
''6216260000015837025'',
''6222001402100986224'',
''6227001376600031518'',
''6212261405009752288'',
''6228460000000000000'',
''6212261203016848714'',
''6217001070003251671'',
''6217993300090865517'',
''6214837714798455'',
''6212261207009815663'',
''6228480086820499274'',
''6214837710367057'',
''6222021001124124402'',
''6212262408005391993'',
''6212263500026951034'',
''6217003810053069731'',
''6212261613004824552'',
''6214835433874243'',
''6214855746631007'',
''6214832027355325'',
''6212262013015753230'',
''6236683480001721549'',
''6212263602044031417'',
''6225380089999207'',
''6217000010121616703'',
''6214834113936315'',
''622033100021977144'',
''6226600000000000'',
''6226630901966068'',
''622908153049612717'',
''6217003230029282765'',
''6228480240524751411'',
''6212260408004324930'',
''6210812831000661939'',
''6210812440001912968'',
''6212261911001103461'',
''6230523170014470000'',
''6215593202018762966'',
''6222623730006081577'',
''6217683101370723'',
''6212260408009993499'',
''6215581313000961062'',
''6236682830000871243'',
''6217003320064262432'',
''6228413164511720000'',
''6222021910002892726'',
''6228483368409231071'',
''6212262116002747873'',
''6222032116000123513'',
''6236683480001653494'',
''6228483178414303777'',
''6215581818005431051'',
''6222030714000133631'',
''6228413170026555311'',
''6216913400644044'',
''6222022008014662606'',
''6222020411002018488'',
''6222023803015687647'',
''6217004470021956532'',
''6212260408008934619'',
''6222021705006220829'',
''6217002340017342884'',
''6212261905004965090'',
''6226097690991386'',
''6217003800009955844'',
''6217230406000437025'',
''6217002120009514587'',
''6217231510001345316'',
''6212261717008219634'',
''6212261203013186746'',
''6217003120011745665'',
''6222081208007177988'',
''6228482399468118876'',
''6217857600032159951'',
''6230810324547778'',
''6214830109881572'',
''6230580000069536261'',
''6214833612900053'',
''6212261202004706645'',
''6215593700007268101'',
''6228480329473602574'',
''6217001260003467993'',
''6212264402000628531'',
''6212264000060270002'',
''6236683810000776922'',
''6217004220031998217'',
''6212264000047257494'',
''6222022010028497961'',
''6228480086945622370'',
''6210181478802343879'',
''6212261211006439782'',
''620522156220085884'',
''6217000830003466244'',
''6217001140010787791'',
''6222020302052585619'',
''6217002250003924670'',
''6222000200122402126'',
''4340613811803510'',
''6214832915227768'',
''6217003810030746724'',
''6228483626139671068'',
''6222021702043142652'',
''6212263901017268729'',
''6212262902003781965'',
''6222023602103783684'',
''6214855912269905'',
''6226632703533419'',
''6226632703507520'',
''6222022002005509249'',
''6228481165278860317'',
''6222031207004620355'',
''6222080402008888831'',
''6217001290000183293'',
''6214850254840348'',
''6222021204010384128'',
''6212261116000402290'',
''6217002170003420455'',
''6225882139633439'',
''6227003150190340417'',
''6222082102001990232'',
''6212262102011203645'',
''6217221812000102769'',
''6214830161589865'',
''6217905300003966029'',
''6212261203016459892'',
''6217920116688933'',
''6212261907006658996'',
''6222020407000323003'',
''6212261202048712328'',
''6214835907021826'',
''6217001540024297424'',
''6217856200044231061'',
''6217920275862774'',
''6217560800002040557'',
''6212264000066640935'',
''6228480128660868471'',
''6212262504001096923'',
''6222620590008620100'',
''6222082402002497272'',
''6215593901003243664'',
''6212262010024425164'',
''6217231818000637512'',
''6222020712002277846'',
''4340610150328802'',
''6236981430000018941'',
''6228480089188549672'',
''6215996400001254354'',
''6212262316003428396'',
''6214661084473949'',
''6216260000008831019'',
''6225885865203038'',
''6212262003009384761'',
''6212261202037895837'',
''6217001820002556714'',
''6222023100072952224'',
''6217002280018484345'',
''6228480405840734579'',
''6236683760002175336'',
''6227001464580409720'',
''6217231702003133937'',
''6217003320049649711'',
''6212260200144314024'',
''6214833806781012'',
''6230523170014490000'',
''6228481258586222971'',
''6228480469830800279'',
''6217002180003880400'',
''6212261901015308081'',
''6212262902015565927'',
''6222020609006631665'',
''6222032702000128550'',
''6222801142471073994'',
''6236682870009715900'',
''6215591901000498230'',
''6228480068835702777'',
''6217001340006486032'',
''6217002100004127957'',
''6222801375081080799'',
''6217856000002240843'',
''6212260200071874388'',
''6222620810014777953'',
''6222020406016165143'',
''6212261211005660818'',
''6222620620029667804'',
''6222020907000081311'',
''6225885924728967'',
''6214854712721108'',
''6212262011032888328'',
''6228480568095964272'',
''6212261306001119205'',
''6217001630045385561'',
''6217002000042530000'',
''6212260200078279953'',
''6226194801003548'',
''6228481269243159779'',
''6236684140002170240'',
''6236680130003780364'',
''6222022304000657795'',
''6212261202043709105'',
''6231810012500657606'',
''6217002030002783867'',
''6217002430009194599'',
''6228482550982836019'',
''6217004150004031301'',
''6222022603004921713'',
''6217230912001950650'',
''6217000780012291770'',
''6226227900298773'',
''6214835328172042'',
''6212261712005738173'',
''6222024402051074783'',
''6222081607002623245'',
''6217003800024629309'',
''6222620710011189063'',
''6217996100090192129'',
''6222032116001260199'',
''6217996100101246898'',
''6217232502000447572'',
''6214832804395155'',
''6228482441764146613'',
''6230520690003714777'',
''6217230614000120166'',
''6228480529085462479'',
''6217003800021929371'',
''6217002660008792858'',
''6212261611002132382'',
''6228481829038565777'',
''6222031709000418148'',
''6217003020103475017'',
''6227004222700058703'',
''6236680190000525998'',
''6212263202004270327'',
''4367421432217116073'',
''6227002746080257511'',
''6212262103005405279'',
''6216606300006260309'',
''6214837672139429'',
''6217230504001806105'',
''6222020406014716699'',
''6228410394525778470'',
''6210812450003284753'',
''6210982600087446587'',
''6212261406002353223'',
''6214830116762773'',
''6214921205082551'',
''6217001860002794972'',
''6217230608000280194'',
''6217852700020303218'',
''6217995950005007577'',
''6222004000113401905'',
''6222023004003495842'',
''6222621030000012971'',
''6228480758718129276'',
''6236683760006350901'',
''6228480218733612673'',
''6228450088102325371'',
''6214854514812683'',
''6217000060032637876'',
''6227000061891757150'',
''6227003525240249686'',
''6222033100021392223'',
''6214835374292132'',
''6228480031295307610'',
''6228481829077580679'',
''6215591702000535066'',
''5522451590032978'',
''6214832919274816'',
''6228484122215299916'',
''6227002920180233157'',
''6212262514000032217'',
''6228481408203837277'',
''6215590603002702798'',
''6228480395788657579'',
''6212261609006508748'',
''6230523170015284678'',
''6212262902004695248'',
''6215584402004242269'',
''6217004470002116247'',
''6228480298848705174'',
''6227002745040271364'',
''6217003810016094313'',
''6212261605003333940'',
''6214830129233051'',
''6212261402015805341'',
''6228483465320041579'',
''6217002290005283444'',
''6217920805917767'',
''6217000460003170404'',
''6212262402019700703'',
''6212260908002009193'',
''6217002500009257529'',
''6222620920007126868'',
''6226620306419987'',
''6230523170015420000'',
''6228481358978330976'',
''6214830192866845'',
''6217003760021938949'',
''6217004640000483696'',
''6214920207286798'',
''6214992430048618'',
''6226730200557533'',
''6212261106001096035'',
''6222081814000603662'',
''6236681460006649129'',
''6236682700003048323'',
''6212261901017341288'',
''6212261407005968306'',
''6216696200004167186'',
''6222080402006109008'',
''6228480084547039119'',
''652270023915900980853'',
''6217986020000024653'',
''6228480388019180271'',
''6217003810058699235'',
''6215593202018212459'',
''6212260707002021764'',
''6212261202034004912'',
''6228480381439157318'',
''6222081402004419127'',
''6217003800021431121'',
''6217001850015243752'',
''6217001670011780000'',
''6228480478674580871'',
''6217003810030809423'',
''6222083301000199337'',
''6222629530003637734'',
''4340624580036091'',
''6222020904005708998'',
''6217567600022993212'',
''6230200700031649'',
''6222033301002802913'',
''6222003602112660836'',
''6228482038815822273'',
''622908503008234368'',
''6228480462892166317'',
''6222082104000595855'',
''6217007180003542245'',
''6214672120001914336'',
''6217003800017238092'',
''6222032107001178994'',
''6222082402003797167'',
''6217003230023745213'',
''6212264402064447810'',
''6217001370024715005'',
''211022197609263000'',
''6228480379403706276'',
''6225880000000000'',
''6222031001006390079'',
''6212264000011850589'',
''6212263602125049775'',
''6230521120009552871'',
''6222033100024092564'',
''612326198508016516'',
''6214831242723812'',
''6217994910139107942'',
''6217231208010447302'',
''6217231208011263815'',
''6212262902014788736'',
''6226090218881486'',
''6222081202007532706'',
''6217003320020075936'',
''6217857000013498256'',
''6217002000058099195'',
''6217000360004683944'',
''6217007110014817120'',
''6217002960103716400'',
''6222021001041629921'',
''6217001340006906070'',
''6214830207743112'',
''6236681540007293926'',
''6222033301007978833'',
''6222084402010033661'',
''320911199004223417'',
''6210812450007737483'',
''6212262902009808887'',
''6222032103002238820'',
''6230520140006568879'',
''6217000150013776841'',
''6226190901023329'',
''6215591714001214187'',
''6217933135218723'',
''6217901400002725261'',
''6228480318299924478'',
''6217906400028529130'',
''6228480089492257277'',
''6222022314005919090'',
''6212261408005671379'',
''6212261906001661732'',
''6212263100027300362'',
''6228480469842916675'',
''6222020200091593133'',
''6217002060002241137'',
''6212264402075034185'',
''6222620250011041659'',
''6217007200078471144'',
''6222082502002930394'',
''6212262013005643730'',
''6217000350009913057'',
''6217003980002505265'',
''6228482449347505676'',
''6217003860026464006'',
''6222022102001714908'',
''6212262902016602950'',
''6212262905000442655'',
''6212262902016602968'',
''6214835776513358'',
''6215581302000469341'',
''6228482299191604079'',
''6214832015876985'',
''6217003760017730532'',
''6222629530000390444'',
''6214680181974187'',
''6217002020030179915'',
''6217922873036314'',
''6222030409000819830'',
''6215593202002206780'',
''6210817200040474239'',
''6214857556077446'',
''6217007200077581927'',
''6226097812597715'',
''6217007200026666209'',
''6228480468918048579'',
''6226192001058015'',
''6212261607013837316'',
''6228450876014840069'',
''6222032703000851043'',
''6214837906577907'',
''6236682870008511490'',
''6228482326172389667'',
''6217995520009767854'',
''6228480768773385275'',
''6214921206995157'',
''6215581115005753307'',
''6217000150014818089'',
''6215581116005152490'',
''6230523170015275874'',
''6222081717001303978'',
''6230521260011497176'',
''6228480340825079916'',
''6217000010118522732'',
''6217003760016107674'',
''6228482478486710276'',
''622848317919289000'',
''6228482920761386611'',
''6222081001017124706'',
''6217000130000517085'',
''6217230411000471784'',
''6222030409002261304'',
''6217858000084394342'',
''6212262502025209373'',
''6217003860001836525'',
''9558801001163076307'',
''6228481728552439973'',
''6216693100001375761'',
''6212261608006187370'',
''6217930462060660'',
''6230523170014530000'',
''6214835191132602'',
''6212264000068833900'',
''6230580000156161858'',
''6228480409358551573'',
''6217001830023901260'',
''6217231614000028491'',
''6230523170014580000'',
''6212263100027009765'',
''6214835221129453'',
''6221504980000246702'',
''6217007200043333296'',
''6214880942605555'',
''6222620310001030490'',
''6227000731430171184'',
''6228480048520463372'',
''6228482058291784474'',
''6222032405002118476'',
''6214920208981108'',
''6212260411008268855'',
''6217000010125967201'',
''6227000351080043276'',
''6221503410001460640'',
''6236681540013337212'',
''6222023500031705540'',
''6217003490000665640'',
''6217007200039952513'',
''6227002090170459061'',
''6212261704009290228'',
''6214850282404869'',
''6227004220810155617'',
''6227004660300148400'',
''6217002220010487078'',
''6214835414777753'',
''6236681300002377251'',
''6217000260010445314'',
''6228480469687945375'',
''6214921600398487'',
''6222081001007048659'',
''6217880800001969999'',
''6222081903000514290'',
''6222032003000543009'',
''6227000190200013961'',
''6217002480003008956'',
''6228480638499782271'',
''6214835793429273'',
''6214923007022587'',
''6212262407003011892'',
''6222001606100262648'',
''6222031203003368278'',
''6222033100016328182'',
''6212261617001286665'',
''6215688000008802404'',
''6236680690001440626'',
''6217856200031608495'',
''6217991650000443116'',
''6215583901000946006'',
''6215592606002115166'',
''6228481729121459476'',
''6217857000075390581'',
''6210812590002029715'',
''6236682390001879133'',
''6210812390005610912'',
''6212262009003260451'',
''6226221700795575'',
''6217007180002126081'',
''6228483471312562010'',
''6214837974924502'',
''6212262201039649902'',
''6228460460017932716'',
''6217922002767342'',
''6222033301009521698'',
''6217000170004847229'',
''6222080200016699129'',
''6217231811000319207'',
''6222020402045163043'',
''6217001490002995229'',
''6226224400289691'',
''6212261716003600798'',
''6210812430019532304'',
''6222081001012665737'',
''6212261001063158544'',
''6222023100081505617'',
''6217004260008765117'',
''6228480170783842314'',
''6216696500001830466'',
''6217994350012880002'',
''6228410430196443117'',
''6230582000083398159'',
''6230582000074535934'',
''6217231811000812060'',
''6217868000004081621'',
''623059125601326709'',
''6210817200014336125'',
''6222021605004058793'',
''6217231604001455041'',
''6217681802233943'',
''6212260407006454208'',
''6212390000002663808'',
''6215695000002463303'',
''6226174800268722'',
''6222021102068326951'',
''6212261603015330434'',
''6228450288066015378'',
''6217003230041819545'',
''6227002349381049321'',
''6013827005014901927'',
''6217003320045864827'',
''6236681470003230492'',
''6215581714003396687'',
''6214855127345391'',
''6222021116014600418'',
''6217003370006008674'',
''6228480455799463076'',
''6212261110001049440'',
''6217001650003353518'',
''4100622518878899'',
''4367420013500892165'',
''4367421215904102013'',
''4367421217384062774'',
''6210810730001082842'',
''6210810730020667417'',
''6210810730030460761'',
''6210814220006694446'',
''6210814220007272528'',
''6212252312000010313'',
''6212253602006215315'',
''6212260302015848757'',
''6212260405000784778'',
''6212260406001239598'',
''6212260409016090139'',
''6212260502000510631'',
''6212260502010986144'',
''6212260511006152173'',
''6212260613000989475'',
''6212260905007066731'',
''6212261001070654485'',
''6212261205004791434'',
''6212261603013046529'',
''6212261610010963127'',
''6212261715008840631'',
''6212261716003040102'',
''6212262008018288150'',
''6212262012004247485'',
''6212262013014039961'',
''6212262102006170189'',
''6212262115002739930'',
''6212262201032337133'',
''6212262314001903445'',
''6212262406004537319'',
''6212262603000018241'',
''6212263500029806474'',
''6212263602015941982'',
''6212263602067700674'',
''6212263602097760482'',
''6212263602110580685'',
''6212264402010303489'',
''6212883012000020307'',
''6214830127319837'',
''6214830165956029'',
''6214830169041232'',
''6214830176991122'',
''6214830178625132'',
''6214830221508079'',
''6214831234075486'',
''6214831297432509'',
''6214832903310675'',
''6214832917696135'',
''6214832918500682'',
''6214835215491588'',
''6214835414974541'',
''6214835418234967'',
''6214835494557521'',
''6214835713021069'',
''6214835923541682'',
''6214837311977163'',
''6214837554193015'',
''6214837555343973'',
''6214837699131177'',
''6214837845941107'',
''6214837878244361'',
''6214837903592586'',
''6214839561213513'',
''6214850230610872'',
''6214850239696591'',
''6214854713022175'',
''6214855713082952'',
''6214855911656102'',
''6214855912060056'',
''6214856551042983'',
''6214857802824351'',
''6214857812496208'',
''6214857910505124'',
''6215581105004209005'',
''6215581507003592994'',
''6215581507003593000'',
''6215581812004573138'',
''6215590603007383552'',
''6215591302002179839'',
''6215592102000836987'',
''6217000500001354284'',
''6217001040004958129'',
''6217001780006873749'',
''6217001820015986569'',
''6217001840006320776'',
''6217001840011361617'',
''6217002170005394161'',
''6217002230001721880'',
''6217002290023074585'',
''6217002300015649953'',
''6217003120008115716'',
''6217003160002570250'',
''6217003200003616908'',
''6217003230033541602''
)
UNION
select CUSTOMER_ID as "Account 账户" , ''2.0'' as "Platform 平台" , CARD_NO as "Bank Card提现银行卡"
from CORE.BPS_CUSTOMER_BANK_VW
where CARD_NO in
(
''6217003760038163903'',
''6217003800012460857'',
''6217003810039901205'',
''6217004180003770468'',
''6217004190001368660'',
''6217004220044988297'',
''6217004220045325226'',
''6217004220045433756'',
''6217004550001885395'',
''6217230705000610543'',
''6217230710000646430'',
''6217231001001466245'',
''6217232605002388197'',
''6217681500624369'',
''6217713001828221'',
''6217770470386560'',
''6217857000067511533'',
''6217903100005583711'',
''6217906000001585339'',
''6222001001107695687'',
''6222003803100211570'',
''6222020705006940195'',
''6222021001101229943'',
''6222021611007043857'',
''6222022201016969539'',
''6222022304006545606'',
''6222022313004162314'',
''6222023100042907092'',
''6222023500031615962'',
''6222031203002061833'',
''6222032014000410784'',
''6222032105001364036'',
''6222080603003491428'',
''6222080808000575160'',
''6222081102007220254'',
''6222081105000617061'',
''6222081106001472357'',
''6222081203001828074'',
''6222081604000257126'',
''6222082105001621517'',
''6222083400004447120'',
''6222083602005684417'',
''6222083602013111155'',
''6222084000008491378'',
''6222600610017881149'',
''6222620250008801172'',
''6222980019825639'',
''6225882134388096'',
''6225884201006973'',
''6226097310229522'',
''6226225600839904'',
''6226622806668261'',
''6226961200166070'',
''6227002661800045361'',
''6227002870810081239'',
''6227002872380275605'',
''6228270146064546471'',
''6228270651234766776'',
''6228270771250971272'',
''6228271631240255179'',
''6228480078209717277'',
''6228480086787586972'',
''6228480089780826676'',
''6228480098481194375'',
''6228480136706060276'',
''6228480218767937376'',
''6228480268860870370'',
''6228480289017131078'',
''6228480318128708779'',
''6228480318240890570'',
''6228480382642604716'',
''6228480431124025419'',
''6228480631851164014'',
''6228480669073290472'',
''6228480688562215774'',
''6228480819448137177'',
''6228481139537015070'',
''6228481198848377777'',
''6228481269225229376'',
''6228481332988301616'',
''6228481619104444175'',
''6228481758353024278'',
''6228481988932848877'',
''6228482028574207378'',
''6228482309196611977'',
''622908373060405417'',
''6230520210020812874'',
''6230520210020993476'',
''6230520460057971172'',
''6230521000000019270'',
''6230522080019735271'',
''6230580000071054501'',
''6230580000088255307'',
''6230580000098109395'',
''6230580000114321990'',
''6230580000117351572'',
''6230580000123743739'',
''6230582000046148030'',
''6230943210000207250'',
''6236682340007176026'',
''6236682830005136311'',
''6236683610001916430'',
''6236683630000400814'',
''6236684160003356473'',
''6236684220001924100'',
''6217991410006575084'',
''6212260302037351160'',
''6236682870012027079'',
''6214837664668393'',
''6222032116001441948'',
''6217003590006259817'',
''6214855711190005'',
''6222620170014643162'',
''6212263500041291143'',
''6212261907007305902'',
''6217905300005420223'',
''6217001870002949856'',
''6217002950105780348'',
''6222033100021677144'',
''6228480608148437478'',
''6217003590006259825'',
''6215593202009515324'',
''6217921408224833'',
''6214680131826263'',
''6228480128455331172'',
''330424199602262017'',
''6228580499014617180'',
''6228480383393380712'',
''62170018930023900000'',
''6217905300005420000'',
''6217001870002940000'',
''6217001370024710000'',
''6216608000004870000'',
''6217003320049640000'',
''6236682940004017444'',
''6230521100014134279'',
''6230520050059670375'',
''6215591904001999446'',
''621700720006344093'',
''622908433047561714'',
''6214837970500066'',
''6214837856820042'',
''6215581813007272769'',
''6228480086792788571'',
''6222620750010138463'',
''6212262109001650560'',
''6217906500035320041'',
''6217997900062415054'',
''6227003811990406803'',
''6227000730340059950'',
''6236680010002198505'',
''6228480068825005678'',
''6212262106000555881'',
''6222629530010001296'',
''6230523470025030677'',
''6228482168964614773'',
''6212264402028319923'',
''6217003390007518984'',
''6217712000198420'',
''6228481028959581976'',
''6217001250010325870'',
''6230520790020308379'',
''6222021108015149586'',
''6215581102007925232'',
''6216606100002638882'',
''6221871000002642009'',
''6217731203389784'',
''6217921601959839'',
''6214920604191864'',
''6214857160026821'',
''6226630204319155'',
''6214855160183987'',
''6217001830033852784'',
''6217256300009023887'',
''6212262502037600460'',
''6212262502036958851'',
''6216690100005294136'',
''6214831008728781'',
''6222030802002499678'',
''6214837970788349'',
''6212261510002301965'',
''6217002120004827992'',
''6228480469624752975'',
''6217903100010305787'',
''6212252006000971967'',
''6214830161890842'',
''6217001140010373956'',
''6217002110003291779'',
''6228482316063756363'',
''6228480156032466765'',
''6228480156024604464'',
''6228481308433929276'',
''6212843191360052354'',
''6212843191360052354'',
''6217858100029509366'',
''6212838105000144741'',
''6226630204922818'',
''6217865000009637255'',
''6228480378257556670'',
''411325198206052912'',
''6217880800010974691'',
''6210812470001673609'',
''6217001830037658435'',
''6217866400004872973'',
''6230521820046461370'',
''6217001830037550483'',
''6217004220050918188'',
''6222620280003284660'',
''6222623550003039729'',
''6226220318302444'',
''6226631702375301'',
''6228430338048575976'',
''6228480819437778379'',
''6228482479617118579'',
''6230520680054044075'',
''6217000270000245302'',
''6228460718021617676'',
''6228480136742388277'',
''6222032003003915477'',
''6228270146069680374'',
''6215582603000997283'',
''6228482409750483175'',
''6217923671249240'',
''6222620720006100777'',
''6217906400019589127'',
''6212261512003918045'',
''6217921802107311'',
''6222034000005908136'',
''6222032015001049927'',
''6222032015000881858'',
''6217001820027547870'',
''6217003030108656792'',
''6217582000045808169'',
''6214837789525312'',
''6216667500002190220'',
''6214857822754638'',
''6215697500014265396'',
''6212261906005911943'',
''6228210399028053075'',
''6217996020049279779'',
''6236683030001081384'',
''6212262408003577080'',
''6212261913006871134'',
''6217000120022515290'',
''6217002920001543546'',
''6222021901007260019'',
''6228480086962717178'',
''6230580000222047685'',
''6236681930009157361'',
''6222030713000813184'',
''6226630204922818'',
''6230522380006783478'',
''6212264402005765742'',
''6228411933042586368'',
''6213363154002546173'',
''6217903100034208850'',
''6222620910030475242'',
''6217710724643374'',
''6212260200166693800'',
''6217930675389328'',
''6228480018948435971'',
''6221871000011063064'',
''6212260200171601681'',
''6222620910030475242'',
''62170072000072100632'',
''6217993680017711971'',
''6228482309027340176'',
''6230520860019898373'',
''6217560500035398291'',
''6214832047383455'',
''6222032102007768906'',
''6217003810042592306'',
''6228481028960031870'',
''6226221700382812'',
''6228480328882618478'',
''6222081001024943833'',
''6217001210075995421'',
''6230520030075894076'',
''6228480038104447370'',
''6217001210027834876'',
''6222620910030475242'',
''6217230903002109891'',
''6214832707995572'',
''421083198804155320'',
''6230523460018133976'',
''6217001340006750635'',
''6228483465805621879'',
''6222623710000816061'',
''6217856100091483682'',
''6226662001298928'',
''6217921771938381'',
''6013821900070837716'',
''6212262201042889784'',
''6228481629554933973'',
''6212262016005410588'',
''6217906400028731520'',
''6228482578099336771'',
''6229538106600344498'',
''6217906300021667426'',
''6217568300000165441'',
''6230580000227461584'',
''6222620710032143458'',
''6214832022626787'',
''6217566300000165441'',
''6226482578099336771'',
''6227082430090492513'',
''6217858000107144831'',
''6217995910006018189'',
''6217000150025821817'',
''6216910316065637'',
''6217853100025846403'',
''6236683690000165940'',
''6212262317012262543'',
''6228480688350241370'',
''6227001833310286238'',
''6228480683009574016'',
''6217001830036103003'',
''6227002120690165526'',
''622908436229518519'',
''6230520460163926276'',
''6222620530012916574'',
''6216693100005008103'',
''6222022008018717539'',
''6225887521071759'',
''6226221105768748'',
''6212262010029456388'',
''6228480269026512872'',
''6222022102016888622'',
''6228480395881297976'',
''6217002190017067175'',
''6216912702162291'',
''6228270081492688779'',
''6222629530007560411'',
''6230520460203211473'',
''6214838986579797'',
''6217257500003252205'',
''6217003730002317108'',
''6217993900037031980'',
''6217003810057586102'',
''6228413854653466179'',
''6217977151001738909'',
''6217993000318144410'',
''6212262010005203184'',
''6222081607002520839'',
''6228480208318206777'',
''622908376266247715'',
''6222020200115997401'',
''6228460028001283774'',
''6222021617001990688'',
''4367420012690066721'',
''6222023700018946188'',
''6227003631120333374'',
''6212261402003388698'',
''6227000167970095881'',
''6212263602008661696'',
''6228282130924567215'',
''6222020407002119094'',
''6212261406002431912'',
''6217003230019164759'',
''6217001930019027110'',
''6226903800025504'',
''6212261703003845938'',
''622709108971617'',
''6227001892560238612'',
''6217001830003033639'',
''6227001264290223522'',
''6227001824360057856'',
''6227000167970020012'',
''6222020502002227127'',
''6212261703000393602'',
''6212262010018423205'',
''6222081103002996178'',
''6212262010018427721'',
''6212261702002745204'',
''6217002660006633112'',
''6227002664090149570'',
''6217002230006570316'',
''6222023700038164754'',
''6212262603000187202'',
''6222022603003411294'',
''6212262603001337384'',
''6212262603000187194'',
''6212262603001332708'',
''6217220200002018947'',
''6228482828515763870'',
''6222021313006440263'',
''6228483151320723719'',
''6236681540003019085'',
''6227002463010121821'',
''6212261712003088845'',
''6217002580000323579'',
''6228481258975460778'',
''6212262110000211602'',
''6228482018261639579'',
''6212261602002150060'',
''6217850500010719429'',
''6222023400028183662'',
''6259960046798823'',
''5287080009172565'',
''622848056026797413'',
''6222023400025803171'',
''6227000786120083297'',
''6227000786110098834'',
''6212263301008842337'',
''6214835491176705'',
''6222021302028362738'',
''6228480660513315516'',
''6222021602020442929'',
''6212262513000953232'',
''6212262513000419721'',
''6212262513000975458'',
''6212262513000681015'',
''6212260606001127566'',
''6222020606000847040'',
''6717000130033403790'',
''6227002031010536411'',
''6222023301035053866'',
''6217001070009633104'',
''6217001140017906295'',
''6214671070003166453'',
''6217000210008657503'',
''6222023301040093949'',
''6217001070008617900'',
''6217001070002041354'',
''6217000210007847733'',
''6217001140026763620'',
''6217001070006700575'',
''6217001070000285748'',
''6217001070009631595'',
''6222024200028609578'',
''6217000990004768533'',
''6217001070009635448'',
''6217001070009633567'',
''6228482660635749517'',
''6217000210002050564'',
''6217001070008621902'',
''6212260200116699253'',
''6228480011017746014'',
''4340621022798189'',
''6217855000048930184'',
''6217001070009631785'',
''6217001070006213793'',
''6217001070006685081'',
''6222623310003701178'',
''6217001070003195589'',
''6215581103002839519'',
''6217002830004236479'',
''6228481558538313970'',
''6212261410002465102'',
''6228481552308516516'',
''6227001882840398013'',
''6212261410000289074'',
''6217003520006246928'',
''6217001880000808434'',
''6228481552587532317'',
''6228481552092932317'',
''6222021410003179140'',
''6217002920116145997'',
''6212261911004873144'',
''6215591911000633264'',
''6221215212321563256'',
''621226040202512783'',
''6214832009412052'',
''6227007201541267191'',
''6212262115002712945'',
''6212262112002506403'',
''6217682901289687'',
''6222082102001843720'',
''6217000140023764572'',
''622908127378779412'',
''6217714900950462'',
''622908123008655858'',
''6222020402038022727'',
''6222021502019065436'',
''6214835218997888'',
''6217000010062442515'',
''6217001210031205485'',
''6212264000042160529'',
''6212264000043460373'',
''6212262010026802188'',
''6212262004004764221'',
''6212261716003018488'',
''6222021906005426819'',
''6212262105000532296'',
''6228480838425524074'',
''6222020402032715151'',
''6222023202033001966'',
''6227002871580337280'',
''6228481436698787772'',
''6212261702016757841'',
''6222370125807608'',
''6222020408016990033'',
''6212261713002355037'',
''6217857500009085579'',
''6222340037711800'',
''4563517500024406108'',
''6222021901023421884'',
''6226220115871153'',
''6226900717320176'',
''6212261603000462697'',
''6222083500003419184'',
''6222023500007745918'',
''6212260200058902137'',
''6228480018335163079'',
''6225880159285767'',
''6225880159284398'',
''6227000581380120487'',
''6210810580001928753'',
''6210810580000465724'',
''6222020704009805448'',
''6227000581410029641'',
''6222020704006280843'',
''6228480018609697471'',
''6217856200016144540'',
''6217004280009986637'',
''6212251813001076741'',
''6228480791116706015'',
''6222020710004177477'',
''6228480258879872970'',
''6214835760188977'',
''6222081404001003680'',
''6222021606008662168'',
''5309900017054253'',
''6225882013152688'',
''6222021606010912957'',
''6227002192453558484'',
''6222022703017076610'',
''6222020604004034855'',
''6222021609006306028'',
''6222021814001993396'',
''6222021303001964557'',
''6228480291428959311'',
''6222620910017027388'',
''6222081607000101814'',
''6222081607002260915'',
''6227002200036830724'',
''6222600910074506419'',
''6217995030000934784'',
''6228480058576601072'',
''6222020713003853155'',
''6236682530002796527'',
''6222021706003969830'',
''6217908000001080883'',
''6215581503000395366'',
''6217004260006774061'',
''6227004381010071580'',
''6217004380000781290'',
''6227002476030028552'',
''6222370034901831'',
''6228480405802637778'',
''6222021503001526039'',
''6215580912000049918'',
''4270200017243727'',
''6215581405000294245'',
''6217001840007584586'',
''6215581405000169439'',
''6217002230004037664'',
''6216917902436031'',
''6228480268083550874'',
''6222100102206643'',
''4367420012510402759'',
''4563510100887934457'',
''6212260712001457282'',
''6230943240001661239'',
''6222022104001226610'',
''6227003100160144711'',
''6222022003008560957'',
''6222021611007542312'',
''6222022002006955540'',
''622202200200695540'',
''6227003234120018143'',
''6222022609003239288'',
''6228482920365379517'',
''6222023100044417470'',
''6228480291207277018'',
''6217996900087243946'',
''6222023100014279033'',
''6212261602006673059'',
''6228482301127495513'',
''6212261211001243429'',
''6222021609002998455'',
''6228481831755620819'',
''6222601040002629445'',
''6222802397581036690'',
''6222021309002588816'',
''6228481730647168716'',
''6222080200017477947'',
''6222023100083104310'',
''6222022706003072915'',
''6227004227240019438'',
''6227002548010234937'',
''6227003114130115388'',
''9558821109001104607'',
''6228481388458096474'',
''1912101701002976831'',
''6217003010000279612'',
''6227075770150882'',
''6222081912000885469'',
''6222624390000701867'',
''4340623010027514'',
''6222021912000885469'',
''6225887317400808'',
''6217007200048185683'',
''6215983010200018321'',
''6217003010104006762'',
''6212262111004767904'',
''6217003010104277223'',
''6222080302002811476'',
''6228480778354229677'',
''6222021912000512751'',
''6222081912000504037'',
''6222081912000709040'',
''6222021912004919432'',
''6222021508006041967'',
''6228484178497806372'',
''6217003640006181998'',
''6222022102003101880'',
''6222081607001837614'',
''6222021607010173947'',
''4367422200037259863'',
''6228480928266241274'',
''6222021604001297744'',
''6222021102033688873'',
''6227002006730038062'',
''6214850254262311'',
''6228481841932736511'',
''6212260200127580187'',
''6215983760008810986'',
''6222022105009784369'',
''6222082105001090119'',
''6212261001015518415'',
''6214835121984189'',
''6222022403005480052'',
''6222022010033185916'',
''6227002454810291583'',
''6236681840001721736'',
''6212261408012678763'',
''6222021408018405682'',
''6222021613008210394'',
''6222802349961078297'',
''6222023202012783964'',
''6228481261306894517'',
''6222020409008073077'',
''6222380037539066'',
''6222021914003546125'',
''6227001274570022361'',
''6212261717001429370'',
''6217001210051848180'',
''6222802430161022960'',
''6222021702040763112'',
''6212261718001915996'',
''6222113957593304'',
''6222621030001504992'',
''6212262405004380167'',
''6212262405001555803'',
''6222022405003901773'',
''6228481208142416674'',
''6228481163988289018'',
''6228480329448374374'',
''6228480328705476872'',
''6222520178399982'',
''6222020408016815537'',
''622202048016815537'',
''6227002951240486774'',
''6222021905002954211'',
''6212261206000605966'',
''6212263602072352370'',
''6212260200013319963'',
''6212262402004221616'',
''6222021505001682894'',
''6222021901015877341'',
''6222021906004186257'',
''6222021404001227894'',
''6227003191110027783'',
''6215592006000234822'',
''621700319000530352'',
''6221881600039338857'',
''6222021706017213902'',
''6222021706010117316'',
''6222020503005988871'',
''6222022201011805290'',
''6222022315006807101'',
''6222021102055553807'',
''6227002301081803317'',
''9558803602163650633'',
''6227002942310133057'',
''6222021903003682246'',
''6212250603000307218'',
''6212262012004058304'',
''6222020409012336262'',
''6212261404000550544'',
''6228482038140494178'',
''6212261611001346504'',
''6212261611001446064'',
''6214835102189733'',
''6228480518610915879'',
''6215581103006020710'',
''6227002260020646908'',
''6217856100069044653'',
''6221507970002065926'',
''6215582316003681198'',
''6228480404836035117'',
''6212264402047486448'',
''6227003813850049095'',
''6217996730000148389'',
''6217995030013766462'',
''6228481849051009073'',
''6228481849002682374'',
''6216602700000863731'',
''6236692390000990574'',
''6228480246022168263'',
''6228482131722361319'',
''6228480048527982176'',
''4340620160030835'',
''6222020407000686649'',
''6222080407000152862'',
''6217003620002384465'',
''6228482868722153473'',
''6217903100031655152'',
''6214833781894715'',
''6236682920008938464'',
''6222022608001907938'',
''6217232608000880991'',
''6222021311006825558'',
''6222024000041633229'',
''6222022010028485636'',
''6222004000109703215'',
''6222022010024610021'',
''6227004310550040838'',
''6222022103006837462'',
''6222021901002657334'',
''62220220100284856363'',
''62220220100246100212'',
''6222021817001133046'',
''6222021804003198052'',
''6222024000000999371'',
''6222022020001402243'',
''6222021305003466432'',
''6227002920770602159'',
''6210810940001872080'',
''6222021714005526871'',
''6212261309001546765'',
''6222021309006743193'',
''6228483331016058816'',
''6222022103006881791'',
''6222021908006194586'',
''6222021804003652546'',
''6222022010030170945'',
''4000026501111335289'',
''6228480329292662874'',
''6228480328660218277'',
''6222080407001456775'',
''6214660160102893'',
''6222080407001632300'',
''6228413854647190778'',
''6215582318000497610'',
''6212264402005492982'',
''6228483858529534578'',
''6226194801119385'',
''6217001280001719351'',
''6215581807002548298'',
''6228271057001453474'',
''6222021103022211685'',
''6227001030720035129'',
''6212260909002877308'',
''6222082320000041613'',
''6222022320000797332'',
''6217996840002196334'',
''6215683100018178483'',
''2320632401101024191'',
''6216910104937955'',
''6212261309000319255'',
''6214835210685432'',
''6217993000102006676'',
''6217856101016199379'',
''6228481628835591378'',
''6222802732601000468'',
''6217921774167087'',
''6228480298971541172'',
''6217002200004048805'',
''6236681820007820963'',
''6228480068831694572'',
''6225880159253575'',
''6214837715339853'',
''6217002460016570457'',
''6217002460022480394'',
''6212261706012877149'',
''6212261709001426787'',
''6217002480005317025'',
''6227002481310090694'',
''6222625980000768962'',
''6217856100007313007'',
''6222031001013180448''
)','5','','wilson','2017-09-29 16:18:15','martmil.n','2020-03-06 18:37:20','214','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-136:EID-216','ASI-11798',' PF2 ASI-11798 Recharge Deposit Data',' PF2 ASI-11798 充值回調記錄','报表将输出近一期所有的充值回调任务，任务与充值的关联使用任务表中的备注栏位中的交易号进行关联

The report will output all the recharge callback tasks of the recent period. The association of the task with the recharge is associated with the transaction number in the remarks field in the task table.','0','ub8-pf5-core-sec','5.0','0 15 10 ? * *','WITH TASK AS (select CUSTOMER_NAME, APPLICANT, CREATE_TIME, EXECUTOR, UPDATE_TIME, TASK_STATUS,
  REGEXP_SUBSTR(PROCESS_REMARK , ''UB([[:alnum:]]+\.?){5,5}'') TID
from core.BPM_WORKFLOW_TASK
where process_definition = ''CS''
and process_name = ''RECHARGE_DEPOSIT''), DEPOSIT AS (
select RECORD_ID,ARRIVAL_AMOUNT from core.BPS_DEPOSIT_RECORD_VW
where base_info = ''RECHARGE_DEPOSIT''
)
SELECT
TASK.CUSTOMER_NAME 用戶名稱,
TASK.TID 交易號碼,
DEPOSIT.ARRIVAL_AMOUNT 到帳金額,
TASK.APPLICANT 申請人,
TASK.CREATE_TIME 申請時間,
TASK.EXECUTOR 審核人,
TASK.UPDATE_TIME 通過時間,
DECODE(TASK.TASK_STATUS, 0, ''申請中'', 1, ''審核通過'', 2, ''審核駁回'', 3,''部分提現成功'', 4,''提現成功'',5,''提現失敗'' , TASK.TASK_STATUS) 審核狀態
FROM TASK LEFT JOIN DEPOSIT ON TASK.TID = DEPOSIT.RECORD_ID
WHERE TASK.CREATE_TIME > SYSDATE -1
ORDER BY TASK.CREATE_TIME DESC','0','','kevin','2017-10-13 13:41:20','mediza.p','2019-12-06 12:40:41','216','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-141','',' PF1 new register with a negative frozen amount',' PF1 新手注册用户冻结余额少于0的监控','【 L1 Actions 】
1. Copy to AS-RC Teams [ 會員凍結金額為負，請注意會員提現異常，建議加入至人工審單列表中 ]','0','ub8-pf1-sec','1.0','0 0/30 * * * ?','select ACCOUNTS,DJAMOUNT,U_TIME from LOTT_NEW_A3D1.LOTT_FROST
  where DJAMOUNT < 0 and AVFLAG = 1
        and u_time between sysdate -1/24 and sysdate -0.5/24
        and ACCOUNTS not in (''656930440'',''bmw320'',''lcx16888'')
        and  ACCOUNTS in (
             select ACCOUNTS from LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO
             where REGTIME >=  to_date(''2017-11-01 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')
             )','5','','NorthT','2017-11-08 18:06:37','martmil.n','2020-03-06 18:38:40','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-142','',' 11X5 and PK Game draw stop API',' 官彩11選5系列開獎中斷偵測','【 L1 Actions 】
1. Do the API url on the alert
2. Do not call API twice','0','ub8-pf5-core-sec','5.0','0 0/2 * * * ?','WITH NUMERO_TABLE AS(
     SELECT GAME_CODE, NUMERO_NO, SECOND_INPUT_TIME
     FROM DRAW.DCS_11X5_NUMERO A
     WHERE WIN_NO IS NOT NULL
	AND WIN_TIME BETWEEN SYSDATE-1 AND SYSDATE
           AND NOT EXISTS (SELECT GAME_CODE, NUMERO FROM CORE.LGS_DRAW_NUMBER_RESULT B WHERE A.GAME_CODE = B.GAME_CODE AND A.NUMERO_NO = B.NUMERO)
     UNION ALL
     SELECT GAME_CODE, NUMERO_NO, SECOND_INPUT_TIME
     FROM DRAW.DCS_PK_NUMERO A
     WHERE WIN_NO IS NOT NULL
	AND WIN_TIME BETWEEN SYSDATE-1 AND SYSDATE
           AND NOT EXISTS (SELECT GAME_CODE, NUMERO FROM CORE.LGS_DRAW_NUMBER_RESULT B WHERE A.GAME_CODE = B.GAME_CODE AND A.NUMERO_NO = B.NUMERO)
), TEMP_TABLE AS(
   SELECT GAME_CODE, NUMERO_NO, SECOND_INPUT_TIME, SUM(1) OVER() AS CNT, ROWNUM AS CNT1
   FROM DRAW.NUMERO_TABLE
)SELECT GAME_CODE, NUMERO_NO, ''HTTP://JMS.NUTTLI.COM/JOB-MANAGEMENT-SERVICE/RESOURCES/PROCESSQUEUEDDRAW/''||GAME_CODE DO_THIS_URL
FROM TEMP_TABLE
WHERE SECOND_INPUT_TIME< SYSDATE - 1/60/24','5','','kevin','2017-11-16 14:43:20','mediza.p','2019-12-06 12:40:10','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-149','',' Monitor Jackpot over 500',' 監控 PF2幸运奖超500','【 L1 Actions 】
1. Copy to AS-RC Teams [ Hi RC, CMS <NU-MID-149>, PF5, Monitor Jackpot over 500 ] Copy the account and screenshot alert.','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','with AA as(
select v.customer_name , sum(r.amount) as total_amount
 from core.US_CUSTOMER_vw v
inner join core.JPS_WIN_RECORD r on r.customer_id = v.customer_id
where   r.CREATE_TIME > sysdate-5/24/60
and WIN_GAME_CODE is not null
group by v.customer_name
)
select * from AA
where TOTAL_AMOUNT>500','5','','wilson','2018-03-15 17:57:33','denice.d','2020-03-11 15:00:21','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-150','',' Detect duplicate transaction record',' 偵測重覆帳變','【 L1 Actions 】
1. Copy to AS General Teams [ Hi L2, CMS <URG-CAL2-MID-150> 發生重覆帳變情形，請進行確認 ]
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','with aa as (select customer_name, ORDER_NO, NUMERO, TX_TYPE_ID, TX_TIME ,AMOUNT from core.acs_transaction
where TX_TIME > sysdate -5/24/60
group by customer_name, ORDER_NO, NUMERO, TX_TYPE_ID, TX_TIME ,AMOUNT
having count(*)>1)
select aa.*, bb.tx_reason from aa left join core.acs_transaction_type bb on aa.TX_TYPE_ID = bb.TX_TYPE_ID','0','','kevin','2018-03-22 17:24:21','Nikki.o','2020-10-06 16:15:41','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CALWA-MID-151','ASI-13037',' ASI-13037 PF1 ill customer can login',' ASI-13037 PF1 手工禁用后可登陆监控','【 L1 Actions 】
1. Copy to AS General and AS-RC on Teams [ CMS <URG-CALWA-MID-151>，PF1，手工禁用後可登陸監控 ]
2. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf1-sec','1.0','0 */5 * * * ?','select ''PF1'' PF1,m.accounts, l.LOGIN_TIME from LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO m
inner join LOTT_NEW_A3D1.ACCOUNTS_LOGIN_LOGS l on m.accounts = l.accounts
where m.AVFLAG = ''0''
and l.LOGIN_TIME between sysdate - 1/24/12 and sysdate
and l.STATE = 0','5','','Dave.S','2018-03-28 10:34:43','denice.d','2020-12-01 18:40:23','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CALWA',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CALWA-MID-152','ASI-13037',' ASI-13037 PF2 illegal customer can login',' ASI-13037 PF2 手工禁用后可登陆监控','【 L1 Actions 】
1. Copy to AS Teams and AS-RC Teams [ CMS <URG-CALWA-MID-152>，PF2，手工禁用後可登陸監控]
2. Create an ASI for this urgent MID if RC replied it''s abnormal and post it on AS General','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','with aa as (
select CUSTOMER_NAME,max(LOGIN_TIME) LOGIN_TIME
from core.US_CUSTOMER_LOGIN_LOG
where LOGIN_TIME > sysdate - 1/24/60
group by CUSTOMER_NAME
)
select ''pf2'' PF,aa.* from core.US_CUSTOMER_vw c
inner join aa on c.CUSTOMER_NAME = aa.CUSTOMER_NAME
where c.ACTIVE_FLAG = ''0''','5','','Dave.S','2018-03-28 10:42:54','kimberlyclaire','2020-12-07 00:09:06','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CALWA',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-153','',' gameLoss for RC tools',' PF1 審單工具平台虧損','No need to post on group, it''s a test
審單工具遊戲虧損資料讀取

No need to post on group, it''s a test
Review tool game loss data reading','0','ub8-pf1-sec','1.0','0 55 * * * ?','select GAME_CODE 游戏彩种,
ACCOUNTS 中奖帐号,
ORDERNO 中奖订单号,
NUMERO 中奖期号,
SUM_BET_ACTUAL 投注金额,
SUM_WIN_ACTUAL 中奖总额,
SUM_WIN_ACTUAL-SUM_BET_ACTUAL  平台损失,
EXPECTED_TIME 表定开奖时间,
INTO_TIME 实际开奖时间,
BET_TIME 投注时间,
WIN_NUMBER 开奖号码
from LOTT_NEW_A3D1.RPT_R_ALERT_ORDER
WHERE INTO_TIME > sysdate -1/24
and ALERT_TYPE = ''GAME''
order by into_time desc','5','','shanti','2018-03-28 20:48:03','martmil.n','2020-03-06 18:44:34','325','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-154','',' Monitor PF1 Activity Give Amount',' 不满足提现条件的所有赠送活动游标','【 L1 Actions 】
1.Copy to AS General Teams [ Hi L2, CMS <NU-MID-154>, PF1, 不滿足提現條件的所有贈送活動游標 ]

【 L2 Actions 】
1. 檢查是否派錯贈送金額給不符合條件的用戶
可以去查詢後台活動贈送是否有人為操作失誤導致派送金額給不該派給的用戶','0','ub8-pf1-sec','1.0','0 0 * * * ?','select a.gid,a.send_amounts,a.effect_bet,a.residual_bet,a.active_code,b.active_name , charfetime
from LOTT_NEW_A3D1.lott_charfe_active a
left join LOTT_NEW_A3D1.lott_prom_active b on b.active_code=a.active_code
where  a.account_flag=''1'' and a.state=''0''
 and a.send_amounts>0 and audit_status=''1''
and (residual_bet<effect_bet or (residual_bet=effect_bet and status=''0''))
and charfetime > sysdate-1/24
order by charfetime desc','5','','wilson','2018-04-02 13:41:08','martmil.n','2019-11-21 20:54:01','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-155','ASI-13036',' ASI-13036 PF1 Withdraw Error: 提款人姓名與卡片不一致、提現未綁卡',' ASI-13036 PF1 提现異常監控','【 L1 Actions 】
1. Copy to AS-RC on Teams [CMS <NU-MID-155>, PF1, ASI-13036 提現異常監控 ]
【 L2 Actions 】
1. 提現成功的記錄但沒有綁卡記錄
2. 提現成功的記錄但當前提款人姓名 提款卡名不一致','0','ub8-pf1-sec','1.0','0 */5 * * * ?','WITH AA  AS(
SELECT A.ACCOUNTS FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO B
LEFT JOIN LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK A ON B.ACCOUNTS=A.ACCOUNTS
WHERE A.REALNAME = B.CARD_NAME
AND A.BANK_TYPE = 1
GROUP BY A.ACCOUNTS
), TMP AS ( SELECT ACCOUNTS FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK WHERE BANK_TYPE = 1
), BB AS (
SELECT * FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO WHERE ACCOUNTS NOT IN (SELECT ACCOUNTS FROM AA)
AND ACCOUNTS IN ( SELECT ACCOUNTS FROM TMP )
), CC AS (  --1. 提现成功的记录但当前提款人姓名&AMP;提款卡名不一致
SELECT ACCOUNTS, ''提款人姓名和提款卡名不一致'' AS REASON FROM LOTT_NEW_A3D1.LOTT_ATM_REQ
WHERE ACCOUNTS IN (SELECT ACCOUNTS FROM LOTT_NEW_A3D1.BB)
AND REQ_TIME > SYSDATE-1/24/60*5
AND DIGITAL_CURRENCY_AMOUNT = 0
GROUP BY ACCOUNTS
), DD AS(  --2. 提现成功的记录但没有绑卡记录
SELECT ACCOUNTS, ''沒綁定銀行卡'' AS REASON FROM LOTT_NEW_A3D1.LOTT_ATM_REQ
WHERE REQ_TIME > SYSDATE-1/24/60*5
AND DIGITAL_CURRENCY_AMOUNT = 0
AND ACCOUNTS NOT IN ( SELECT ACCOUNTS FROM TMP )
) , EE AS( --3. USDT提現沒綁定電子錢包
SELECT ACCOUNTS, ''沒綁定電子錢包'' AS REASON FROM LOTT_NEW_A3D1.LOTT_ATM_REQ
WHERE REQ_TIME > SYSDATE-1/24/60*5
AND DIGITAL_CURRENCY_AMOUNT != 0
AND ACCOUNTS NOT IN (SELECT ACCOUNTS FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK WHERE BANK_TYPE = 2)
)
SELECT ACCOUNTS, REASON  FROM LOTT_NEW_A3D1.CC
UNION ALL
SELECT ACCOUNTS, REASON  FROM LOTT_NEW_A3D1.DD
UNION ALL
SELECT ACCOUNTS, REASON  FROM LOTT_NEW_A3D1.EE','5','','wilson','2018-04-03 12:44:35','raphael','2020-12-29 18:08:31','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-156','ASI-13036',' ASI-13036 PF2 Withdraw Error',' ASI-13036 PF2 提现异常监控(有多种情境','【 L1 Actions 】
1. Copy to AS-RC on Teams [ CMS <NU-MID-156>, PF2, ASI-13036 提現異常監控 ]
2. Mention DRC-RC to make sure they will check immediately
【 L2 Actions 】
1. 提現成功的記錄但沒有綁卡記錄
2. 提現成功的記錄但當前提款人姓名 提款卡名不一致','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','WITH aa AS ( --1. 提现成功的记录但没有绑卡记录
    SELECT
        customer_name,
        ''沒綁定銀行卡'' AS reason
    FROM
        core.bps_withdraw_record_vw
    WHERE
        request_time > SYSDATE - 1 / 24 / 60 * 5
        AND digital_currency_amount IS NULL
        AND customer_id NOT IN (
            SELECT
                customer_id
            FROM
                core.bps_customer_bank_vw
            GROUP BY
                customer_id
        )
), bb AS ( -- 提現成功的卡號和提款人姓名
    SELECT
        customer_name,
        customer_id,
        withdraw_card_holder,
        withdraw_card_no
    FROM
        core.bps_withdraw_record_vw
    WHERE
        request_time > SYSDATE - 1 / 24 / 60 * 5
        AND digital_currency_amount IS NULL
    GROUP BY
        customer_name,
        customer_id,
        withdraw_card_holder,
        withdraw_card_no
), cc AS ( -- 提现成功的记录與当前提款人姓名不一致
    SELECT
        customer_name,
        ''提款人姓名紀錄和當前提款人姓名不一致'' AS reason
    FROM
        bb                            b
        LEFT JOIN core.us_customer_profile_vw   c ON b.customer_id = c.customer_id
    WHERE
        c.payee_name != b.withdraw_card_holder
), dd AS (-- 提现成功的记录與当前提款卡名不一致
    SELECT
        customer_name
    FROM
        bb                          b
        LEFT JOIN core.bps_customer_bank_vw   c ON b.customer_id = c.customer_id
                                                 AND status = 1
                                                 AND b.withdraw_card_holder = card_holder
                                                 AND b.withdraw_card_no = card_no
), usdt AS ( -- USDT提現但沒綁電子錢包
    SELECT
        customer_name,
        ''沒綁定電子錢包'' AS reason
    FROM
        core.bps_withdraw_record_vw
    WHERE
        request_time > SYSDATE - 1 / 24 / 60 * 5
        AND digital_currency_amount IS NOT NULL
        AND customer_id NOT IN (
            SELECT
                customer_id
            FROM
                core.bps_digital_wallet_vw
            GROUP BY
                customer_id
        )
)
SELECT
    customer_name,
    reason
FROM
    aa
UNION ALL
SELECT
    customer_name,
    reason
FROM
    cc
UNION ALL
SELECT
    customer_name,
    ''提款人姓名和提款卡名不一致'' AS reason
FROM
    bb
WHERE
    customer_name NOT IN (
        SELECT
            customer_name
        FROM
            dd
    )
UNION ALL
SELECT
    customer_name,
    reason
FROM
    usdt','5','','wilson','2018-04-03 13:14:21','jason','2021-07-13 12:03:33','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-157','',' Batch List Error',' 批次手工贈送名單 異常','【 L1 Actions 】
1. Copy to AS-RC on Teams [ CMS <NU-MID-157> , 批次手工贈送名單異常 請確認名單是否有空白 ]','0','ub8-pf1-sec','1.0','0 5 */1 * * ?','select ACCOUNTS,SEND_AMOUNTS,REMARK,ITEM_ID,STATE,SENT_DATE from LOTT_NEW_A3D1.lott_manual_send_apply
where ACCOUNTS not in (select ACCOUNTS from LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO)
and SENT_DATE > sysdate - 1/24','5','','Dave.S','2018-04-10 18:00:24','martmil.n','2020-03-06 18:47:29','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-158','ASI-13110',' PF1 ASI-13110 Abnormal Unlock Account',' PF1 ASI-13110 手工禁用后解禁监控 ','【 L1 Actions 】
1. Copy to AS-RC Teams, example message: [ 2018-04-13 17:31:29 操作類型：登錄解禁 ,操作者名:OEloise160718, 解禁的會員賬號為：lala2012 ]
Translation:
2018-04-13 17:31:29 Operation Type: Login Unblocking, Operator Name: OEloise160718, Unlocked Member Account: lala2012','0','ub8-pf1-sec','1.0','0 */5 * * * ?','select OPER_TIme , REGEXP_SUBSTR( OPER_CONTEXT , ''[^;]+'', 1, 10 )||'' ,''||REGEXP_SUBSTR( OPER_CONTEXT , ''[^;]+'', 1, 2 )||'', ''||REGEXP_SUBSTR( OPER_CONTEXT , ''[^;]+'', 1, 11 ) MSG
from LOTT_NEW_A3D1.LOTT_OPER_LOG
where OPER_TIme > SYSDATE -5/24/60
AND OPRATEOR <> -1
AND OPER_CONTEXT LIKE ''%登录解禁;解禁的会员账号为%''','0','','kevin','2018-04-13 18:43:08','martmil.n','2020-03-06 18:48:05','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-159','',' PF2 ASI-13110 Abnormal Unlock Account',' PF2 ASI-13110 手工禁用后解禁监控','【 L1 Actions 】
1. Copy to AS-RC Teams, example message: [ 2018-04-13 17:31:29 操作類型：登錄解禁 ,操作者名:OEloise160718, 解禁的會員賬號為：lala2012 ]
Translation:
2018-04-13 17:31:29 Operation Type: Login Unblocking, Operator Name: OEloise160718, Unlocked Member Account: lala2012','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','select APPLICANT, EXECUTOR, PROCESS_NAME ACTION, CUSTOMER_NAME ACCOUNT, TASK_START_TIME TIME from core.BPM_WORKFLOW_TASK
where PROCESS_START_TIME > sysdate - 5/24/60
and PROCESS_NAME <> ''WA''
and PROCESS_NAME = ''ENABLE_LOGIN''','0','','kevin','2018-04-13 19:11:49','martmil.n','2020-03-06 18:48:38','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-162','',' PF1 DB Error Log',' PF1 DB Error 報錯確認','【 L1 Actions 】
1.Copy to AS General Teams [ Hi L2, CMS <NU-MID-162>, PF1 DB error 報錯確認 ]
2.Select data according to description
【 L2 Actions 】
1.確認資料庫報錯是否造成不良影響','0','ub8-pf1-sec','1.0','0 */5 * * * ?','select * from LOTT_NEW_A3D1.lott_oper_log where OPRATEOR=''-1'' and OPER_TYPE=''05''
and OPER_TIME>sysdate-1/24/60*5
and OPER_CONTEXT  like ''%ORA%''
and OPER_CONTEXT  not  like ''%ORA-01403%''
and OPER_CONTEXT  not  like ''%ORA-06503%''
and OPER_CONTEXT  not  like ''%ORA-20001%''','5','','lucker.z','2018-04-17 14:50:22','martmil.n','2019-11-21 20:58:11','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CHK-MID-164','',' PF1 Numero generate',' PF1 期号生成監控','【 L1 Actions 】
1. Copy to Telegram and AS General Teams [ Hi L2, CMS <URG-CHK-MID-164>, PF1 期號未生成 ]
2. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
查看PF1排程是否有正常運行
https://wiki.yxunistar.com/x/tIo4','0','ub8-pf1-sec','1.0','0 0 7 * * ?','with aa as (
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%期号生成结束''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1
union all
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%Marketing Report 生成结束''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1
union all
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%不活跃账号清理结束''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1
union all
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%开奖日志清理结束''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1
union all
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%会员报表数据生成结束''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1
union all
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%会员会员组升级调整结束''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1
union all
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%奖池报表计算完毕''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1
union all
select * from LOTT_NEW_A3D1.lott_oper_log
where OPER_CONTEXT like ''%业务日期更新结束''
and OPRATEOR = ''-1''
and OPER_TYPE = ''05''
and OPER_TIME > sysdate -1)
select count(1) from aa
','3','27','lucker.z','2018-04-17 14:58:27','Nikki.o','2020-10-06 16:23:45','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-165','ASI-13145',' PF2 ASI-13145 Monitor Illegal Betting',' PF2 ASI-13145 監控11選五非法投注','【 L1 Actions 】
1. Screenshot alert and copy to AS-RC Teams [ CMS <NU-MID-165>, PF2, ASI-13145 監控11選五非法投注 ]','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','select  B.CREATE_TIME , ORDER_NUM  from core.LGS_ORDER_INFO A
left join core.LGS_ORDER_MASTER B on A.ORDER_MASTER_ID=B.ORDER_MASTER_ID
where BETTING_TYPE=''3'' and SECOND_ is null
and B.CREATE_TIME > sysdate-5/24/60','5','','wilson','2018-04-24 19:00:29','camelle.d','2020-03-06 17:44:35','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
(' NU-MID-168','',' PF2 Order Double Withdrawal',' PF2 訂單異常重複撤單','【 L1 Actions 】
1.Copy to AS General Teams [ Hi L2, CMS <NU-MID-169>，PF1，紅包重復派送 ]
【 L2 Actions 】
1.提供重復紅包給OD做扣錢','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','with AA as (
select ORDER_NO from core.ACS_TRANSACTION where TX_TYPE_ID=2013 and CREATE_TIME > sysdate-1/24/12
), BB as (
select * from AA  where ORDER_NO  not in (select ORDER_NUM from core.LGS_ORDER_MASTER)
)
select ORDER_NO  from BB group by ORDER_NO order by ORDER_NO','5','','Dave.S','2018-06-19 14:23:08','mediza.p','2019-12-06 12:34:50','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-170','',' PF1 Betting Time during Locktime',' PF1 鎖定期投注訂單','【 L1 Actions 】
1. Copy to AS General and AS-RC on Teams including the orderno list [ Hi, CMS <NU-MID-170>，PF1，鎖定期投注訂單 ]','0','ub8-pf1-sec','1.0','30 */5 * * * ?','with aa as(
select replace( GROUPNAMES,''_LotteryParameterSetting'','''') as game_code,PARAMVALUES from LOTT_NEW_A3D1.lott_para_all where PARAMNAMES= ''LockingTime''
)

select m.ORDERNO,m.ACCOUNTS,m.NUMERO,s.REMARK,s.PARAM_ONE,m.BET_TIME,t.WIN_DATE ,a.PARAMVALUES from LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN m
inner join LOTT_NEW_A3D1.LOTT_GROUP_SERIES s on m.SORTID = s.GROUP_VALUE
inner join LOTT_NEW_A3D1.LOTT_MANAUL_TEMP t on (t.SORTID = m.SORTID and t.NUMERO = m.NUMERO)
inner join aa a on a.game_code = s.PARAM_ONE
where m.BET_TIME between sysdate - 1/24/12 and sysdate
and m.BET_TIME > t.WIN_DATE - (a.PARAMVALUES-1)/24/60/60','5','','Dave.S','2018-07-18 11:59:35','lance','2021-03-11 17:53:59','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-171','',' PF2 Betting Time during Locktime',' PF2 鎖定期投注訂單','【 L1 Actions 】
1. Copy to AS General and AS-RC on Teams including the orderno list [ Hi, CMS <NU-MID-171>，PF1，鎖定期投注訂單 ]','0','ub8-pf5-core-sec','5.0','0 */5 * * * ?','select m.ORDER_NUM,m.CUSTOMER_ID,m.NUMERO,g.CODE,s.LOCKED,r.WINNING_TIME,m.CREATE_TIME as betting_time
from core.LGS_ORDER_MASTER m
inner join core.LGS_GAME g on g.GAME_ID = m.GAME_ID
inner join core.LGS_DRAW_NUMBER_RESULT r on (r.NUMERO = m.NUMERO and r.GAME_CODE = g.CODE)
inner join core.LGS_GAME_SETTING s on s.GAME_CODE = g.code
where m.CREATE_TIME between sysdate -1/24/60/12 and sysdate
and  m.CREATE_TIME > WINNING_TIME -  s.LOCKED/24/60/60
order by m.CREATE_TIME','5','','Dave.S','2018-07-18 12:20:37','camelle.d','2020-03-06 17:47:55','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-172','',' PF1 Station letter test',' PF1 站內信測試','【 L1 Actions 】
1.CallBack alert','0','ub8-pf1-sec','1.0','0 */1 * * * ?','with aa as (
select count(*),r.STATE ,r.DELET_FLAG,r.HUIFU,r.messageID
from LOTT_NEW_A3D1.lott_sms_receive r
where messageID = ''20180720110656724416''
group by STATE,DELET_FLAG,HUIFU,r.messageID
)

select * from LOTT_NEW_A3D1.l0tt_smsinfo s
inner join LOTT_NEW_A3D1.aa a on a.messageID = s.gid
where s.gid = ''20180720110656724416''','6','','Dave.S','2018-07-20 11:39:46','martmil.n','2019-11-21 21:01:59','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-174','',' PF2 Jackpot Winner has been deleted',' PF2 獎池名單玩家不存在','【 L1 Actions 】
1. Copy to AS General Teams [ Hi L2, CMS <NU-CHK-MID-174>，PF2 獎池名單玩家不存在 ASI-13484 ]
2. Do patch: https://jira.yxunistar.com/browse/CM-3265','0','ub8-pf5-core-sec','5.0','0 */30 * * * ?','select * from CORE.JPS_WIN_RECORD
where CUSTOMER_ID
in (select j.CUSTOMER_ID from CORE.JPS_WIN_RECORD j left JOIN CORE.US_CUSTOMER_VW u on j.CUSTOMER_ID = u.CUSTOMER_ID where u.CUSTOMER_ID is null group by j.CUSTOMER_ID)','5','','shanti','2018-07-23 15:37:22','mediza.p','2019-12-06 12:33:19','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-185:EID326','',' pfLoss for RC tools',' PF1 審單工具平台虧損資料讀取','Pfloss data for RC tools
審單工具平台虧損資料讀取
【 L1 Actions 】
1.CallBack alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','15,50 2,12,22,32,42,52 * * * ?','with aa as
(select trunc(max(BIZ_TIME)) time, game_code game, sum(sum_bet_actual-SUM_WIN_ACTUAL-SUM_RET_AGENT-SUM_RET_BET) profit from LOTT_NEW_A3D1.RPT_R_GAME_STATISTIC
where trunc(BIZ_TIME) = trunc(sysdate)
group by game_code), bb as (
select trunc(BIZ_TIME) time, sum(sum_bet_actual-SUM_WIN_ACTUAL-SUM_RET_BET-SUM_RET_AGENT) platProfit from LOTT_NEW_A3D1.RPT_R_GAME_STATISTIC
where trunc(BIZ_TIME) = trunc(sysdate)
group by trunc(BIZ_TIME))
select aa.game 彩种, aa.profit 彩种当日盈亏, bb.platProfit 当日平台盈亏 from aa left join bb on aa.time = bb.time
where aa.profit < 0
order by aa.profit asc','0','','riel_john','2018-08-06 20:00:07','riel_john','2021-06-11 15:21:05','326','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-210:EID327','',' PF1 Loss Customer Data for RC tools ',' PF1 審單工具平台玩家虧損資料讀取','【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 56 * * * ?','select * from (with aa as
(select BIZ_TIME time, accounts , sum(SUM_WIN_ACTUAL-sum_bet_actual) profit, sum(sum_bet_actual-SUM_WIN_ACTUAL-SUM_RET_AGENT-SUM_RET_BET) platformloss from LOTT_NEW_A3D1.RPT_R_CUSTOMER_STATISTIC
where BIZ_TIME > sysdate -1/24
group by accounts, biz_time)
select aa.accounts 帐号, sum(aa.profit) 用户一小時盈亏 from aa
group by aa.accounts having sum(aa.profit) > ''150000''
order by sum(aa.profit) desc) ','5','','Nikki.o','2018-08-07 02:30:03','riel_john','2021-06-11 15:22:08','327','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-211','',' Customer Date Fetch for RC Tools',' 平台告警用戶資料獲取','【 L1 Actions 】
1. Screenshot alert and Copy to AS Teams [ 平台告警用戶資料獲取 ]','0','ub8-pf1-sec','1.0','1 2,12,22,32,42,52 * * * ?	','with aa as
(select accounts accounts,
create_time time,
sum_bet_actual bet,
sum_win_actual win,
sum_ret_bet+sum_ret_agent ret,
sum_bet_actual-sum_win_actual-sum_ret_bet-sum_ret_agent platloss,
round(sum_win_actual/sum_bet_actual,4) winrate
from LOTT_NEW_A3D1.RPT_R_ALERT_CUSTOMER), bb as
(
select accounts ,sum(sum_win_actual-sum_bet_actual) profit
from LOTT_NEW_A3D1.RPT_R_ALERT_CUSTOMER
where create_time > sysdate -1
group by accounts
), cc as
(
select accounts ,count(*) times
from LOTT_NEW_A3D1.RPT_R_ALERT_CUSTOMER
where create_time > sysdate -1
group by accounts
)
select aa.accounts 帐号,
       aa.time 告警时间,
       aa.bet 前一小时投注金额,
       aa.win 前一小时累计中奖金额,
       aa.ret 前一小时投注返点,
       aa.platloss 前一小时平台损失,
       bb.profit 当天盈利,
       aa.winrate 返奖率,
       cc.times 当日累计告警次数
from aa left join bb on aa.accounts = bb.accounts
        left join cc on aa.accounts = cc.accounts
WHERE aa.time > SYSDATE -1
ORDER BY CC.TIMES, AA.ACCOUNTS
','0','','aljen','2018-08-07 04:46:32','denice.d','2020-12-01 19:03:34','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-228:EID-328','',' Order Data Fetch for RC tools',' PF1 審單工具訂單告警','審單工具訂單告警
Review order tool order alert
【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 57 * * * ?','select orderno 订单号码,
accounts 投注帐号,
sum_bet_actual 投注金额,
sum_win_actual 中奖金额,
round(sum_win_actual/sum_bet_actual) 返奖率,
sum_bet_actual-sum_win_actual- sum_ret_bet- sum_ret_agent 平台损失,
bet_time 投注时间,
EXPECTED_TIME 表定开奖时间,
into_time 实际开奖时间,
numero 期号,
win_number 开奖号码
from LOTT_NEW_A3D1.RPT_R_ALERT_ORDER
where into_time > sysdate -1/24
and ALERT_TYPE = ''ORDER''
and ((sum_bet_actual <= 100 and sum_win_actual >= 5000 and round(sum_win_actual/sum_bet_actual) >= 100)
or (sum_bet_actual > 100 and sum_win_actual >= 5000 and round(sum_win_actual/sum_bet_actual) >= 40)
or (sum_win_actual >= 20000))
order by into_time desc','5','','aljen','2018-08-07 05:26:52','camelle.d','2020-03-06 17:55:44','328','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-233:EID-329','',' PF1 Play Warning Data fetch for RC tools',' PF1 審單工具玩法虧損資料讀取','playWarning RC工具的數據獲取
【 L1 Actions 】
1.1. Callback Alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 58 * * * ?	','select CREATE_TIME 时间,
game_code 彩种,
play_name 玩法组,
play_group_name 玩法,
sum_bet_actual 投注额,
sum_win_actual 中奖额,
sum_ret_bet 投注返点,
sum_ret_agent 代理返点,
sum_bet_actual-sum_win_actual-sum_ret_bet-sum_ret_agent 当天利润,
round((sum_bet_actual-sum_win_actual-sum_ret_bet-sum_ret_agent )/sum_bet_actual*100) 利润率
from LOTT_NEW_A3D1.RPT_R_ALERT_PLAY
where CREATE_TIME > sysdate -1/24
and sum_win_actual > 200000
order by 利润率 asc','5','','aljen','2018-08-07 05:33:43','camelle.d','2020-03-06 17:56:47','329','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-237','',' PF1 UU Game Keyin Delay',' PF1 UU自主彩入號延遲','【 L1 Actions 】
1. Copy to AS Genreal Teams [ Hi L2, CMS <URG-CAL2-MID-237>，PF1 獎號無法正常寫入請確認autocraw 狀況是否重啓 ]
2. Do SOP:
https://wiki.yxunistar.com/x/VYBiAg
3. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. 決定是否重啓','0','ub8-pf1-sec','1.0','45 0/2 * * * ?','select t.NUMERO ,t.WIN_DATE,s.REMARK,s.PARAM_ONE,t.OPERTIME1,t.OPERTIME2,t.STATE,t.WIN_NO1,t.WIN_NO2,t.WIN_NO
from LOTT_NEW_A3D1.LOTT_GROUP_SERIES s
inner join LOTT_NEW_A3D1.LOTT_MANAUL_TEMP t on t.SORTID = s.GROUP_VALUE
where s.PARAM_ONE in (''UUSSC'',''UU11X5'',''UUKENO'',''UUFFC'',''UUK3'',''UU30S'',''UUSHB'',''UUFF11X5'')
and t.WIN_DATE < sysdate-1/24/60
and t.WIN_NO is null
and WIN_DATE > sysdate - 1/24','5','','Dave.S','2018-10-16 14:42:17','riel_john','2021-06-11 15:23:37','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-239','',' PF1 IP Login Problem',' PF1 问题ip登入','【 L1 Actions 】
1. Copy to AS General Teams [ Hi L2, CMS <NU-MID-239>, PF1, "此IP曾經利用老虎機漏洞來獲利" ]

','0','ub8-pf1-sec','1.0','5 */10 * * * ?','select distinct accounts from LOTT_NEW_A3D1.ACCOUNTS_LOGIN_LOGS where login_ip in (''59.62.164.181'',''118.116.112.184'',''113.64.138.68'',''222.209.60.75'',''183.148.142.51'')
and LOGIN_TIME between sysdate - 1/24/6 and sysdate','5','','Dave.S','2018-10-19 11:23:07','riel_john','2021-05-21 13:11:59','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-245','ASI-13845',' PF1 ASI-13845 Attention UUID Login',' PF1 ASI-13845 關注 UUID 登入','【 L1 Actions 】
1.Copy to AS General and AS-RC on Teams [ CMS <NU-MID-245>，PF1, ASI-13845 關注UUID 登入 ]','0','ub8-pf1-sec','1.0','11 */5 * * * ?','select ACCOUNTS,LOGIN_TIME,UUID,LOGINWAY from LOTT_NEW_A3D1.ACCOUNTS_LOGIN_LOGS where
(  LOGIN_TIME > sysdate - 1/24/12   ) AND
( UUID = ''a59b8dd260356edf39fbe21faaff26ee'' )','5','','shanti','2018-11-28 17:08:36','camelle.d','2020-03-06 18:03:21','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-246','ASI-13845',' PF2 ASI-13845 Attention UUID Login',' PF2 ASI-13845注意UUID登录','【 L1 Actions 】
1.Copy to AS General and AS-RC on Teams [ CMS <NU-MID-246>，PF2, ASI-13845 關注UUID 登入 ]','0','ub8-pf5-core-sec','5.0','13 */5 * * * ?','select CUSTOMER_NAME,LOGIN_TIME,UUID,DEVICE_USER_AGENT from CORE.US_CUSTOMER_LOGIN_LOG where
(  LOGIN_TIME > sysdate - 1/24/12   ) AND
( UUID = ''a59b8dd260356edf39fbe21faaff26ee'' )','5','','shanti','2018-11-28 17:12:26','camelle.d','2020-03-06 18:04:05','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','DAU','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-249','',' PF2 Too many login of an IP',' PF2 同一IP登入多筆帳號 並修改密碼','【 L1 Actions 】
1.Copy to AS General and AS-RC on Teams [ CMS ，PF2, 同一IP登入多筆帳號 ]','0','ub8-pf5-core-sec','5.0','40 5 */1 * * ?','with bb as (
select UUID ,count(*) from (
select distinct CUSTOMER_NAME,UUID from core.US_CUSTOMER_LOGIN_LOG
where LOGIN_TIME > sysdate - 1/24
)group by UUID
having count(*) > 3
), cc as (
SELECT CUSTOMER_NAME FROM CORE.US_CUSTOMER_PASSWORD_HISTORY
where CREATE_TIME > sysdate - 1/24
)

select LISTAGG(CUSTOMER_NAME, '', '') WITHIN GROUP (ORDER BY CUSTOMER_NAME) "CUSTOMER_List",LISTAGG(status, '', '') WITHIN GROUP (ORDER BY status) "status_List",UUID,LOGIN_IP,count(*) from (
select distinct l.CUSTOMER_NAME,l.UUID,l.LOGIN_IP,
CASE WHEN cc.CUSTOMER_NAME is not null THEN ''abnormal''
ELSE ''normal'' END as status
from core.US_CUSTOMER_LOGIN_LOG l
inner join bb on bb.uuid  = l.uuid
left join cc on cc.CUSTOMER_NAME = l.CUSTOMER_NAME
where LOGIN_TIME > sysdate - 1/24
)
group by UUID, LOGIN_IP
having LISTAGG(status, '', '') WITHIN GROUP (ORDER BY status) like ''%abnormal%''','5','','Dave.S','2018-12-19 17:48:12','camelle.d','2020-03-06 18:04:35','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-250','',' PF1 SMS XSS Monitor',' PF1 SMS XSS 偵測',' 【 L1 Actions 】
1. Callback alert and check if export was sent to AS Teams','0','ub8-pf1-sec','1.0','1 */10 * * * ?','SELECT  COUNT(*) FROM LOTT_NEW_A3D1.l0tt_smsinfo  WHERE
( SENDTIME > SYSDATE - 1/24/5 ) AND
( ( lower(SMSCONTENT) LIKE ''%script%'') or ( lower(SMSCONTENT) LIKE ''%select%'') or ( lower(SMSCONTENT) LIKE ''%print%'') )','1','0','shanti','2018-12-22 17:23:38','camelle.d','2020-05-15 02:10:08','270','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-253:EID-278','',' PF1 WIN NUM Randomness Monitor',' PF1 獎號隨機性監控','【 L1 Actions 】
1. Check export in 1.0 - UBG奖号监控群 on Teams
2. Encode the result on google: https://tinyurl.com/y2gobpzg','0','data-warehouse','1.0','31 2 */1 * * ?','SELECT *  FROM DW.DW_A_NUM_RANDOMTEST WHERE
( DW_SOURCE = ''1'') AND
( BIZ_DATE=TRUNC(SYSDATE-1) ) AND
(( ALERT_01<>0 ) OR ( ALERT_03<>0 ) OR ( ALERT_05<>0 ) OR ( ALERT_07<>0 ) OR ( ALERT_30<>0 ))','5','','shanti','2019-01-10 18:45:52','denice.d','2020-12-06 17:54:42','278','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-254:EID-279','',' PF2 WIN NUM Randomness Monitor',' PF2 獎號隨機性監控','【 L1 Actions 】
1. Check export in 5.0 - UBG奖号监控群 on Teams
2. Encode the result on google: https://tinyurl.com/y2gobpzg','0','data-warehouse','5.0','31 3 */1 * * ?','SELECT *  FROM DW.DW_A_NUM_RANDOMTEST WHERE
( DW_SOURCE = ''2'') AND
( BIZ_DATE=TRUNC(SYSDATE-1) ) AND
(( ALERT_01<>0 ) OR ( ALERT_03<>0 ) OR ( ALERT_05<>0 ) OR ( ALERT_07<>0 ) OR ( ALERT_30<>0 ))','5','','shanti','2019-01-10 18:52:34','kimberlyclaire','2020-09-06 11:06:35','279','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-258:EID-282','',' PF2 SMS XSS Monitor',' PF2 SMS XSS 偵測','【 L1 Actions 】
1. Callback alert and check if export was sent to AS Teams','0','ub8-pf5-core-sec','5.0','1 */10 * * * ?','SELECT  COUNT(*)  FROM CORE.PMS_SHORT_MSG M
LEFT JOIN CORE.PMS_SHORT_MSG_RECIPIENT MR ON M.MSG_ID = MR.MSG_ID WHERE
( M.PUBLISH_TIME> SYSDATE - 1/24/5 ) AND
( ( lower(M.SM_CONTENT) LIKE ''%script%'') or ( lower(M.SM_CONTENT) LIKE ''%select%'') or ( lower(M.SM_CONTENT) LIKE ''%print%'') )

','1','0','shanti','2019-02-12 15:34:26','mediza.p','2019-12-06 12:28:00','282','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-270:EID-293','ASI-14236',' PF1 ASI-14236 monitoring by numero profit',' PF1 ASI-14236 期號盈利率監控','【 L1 Actions 】
1. Callback alert and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','7 */3 * * * ?','WITH DRAW AS (
SELECT LGS.PARAM_ONE "GAME_CODE" ,LMT.SORTID,LMT.NUMERO ,LMT.WIN_DATE,(LMT.WIN_DATE - LPA.PARAMVALUES/24/60/60) "LOCKTIME",LMT.WIN_NO
FROM LOTT_NEW_A3D1.LOTT_MANAUL_TEMP LMT
INNER JOIN LOTT_NEW_A3D1.LOTT_GROUP_SERIES LGS on LMT.SORTID = LGS.GROUP_VALUE
INNER JOIN
 (SELECT replace( GROUPNAMES,''_LotteryParameterSetting'','''') AS GAME_CODE,PARAMVALUES FROM LOTT_NEW_A3D1.lott_para_all WHERE PARAMNAMES= ''LockingTime'') LPA ON LPA.GAME_CODE = LGS.PARAM_ONE
WHERE LMT.WIN_DATE > ( SYSDATE - 1/24/12) AND  LMT.STATE = ''1''
),BET AS (
SELECT SORTID,NUMERO,COUNT(*) "CNT_BET" , SUM(TOTAL_AMOUNT) "SUM_BET"
FROM LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN
WHERE STATUS IN (''004'',''005'')
GROUP BY SORTID,NUMERO
),WIN AS (
SELECT SORTID,NUMERO,COUNT(*) "CNT_WIN",SUM(TOTAL_WIN_AMOUNT) "SUM_WIN"
FROM LOTT_NEW_A3D1.LOTT_WIN_RECORDS
GROUP BY SORTID,NUMERO
)
SELECT SYSDATE "日期", DRAW.GAME_CODE "彩种",DRAW.NUMERO "期号",DRAW.WIN_DATE "开奖时间",DRAW.LOCKTIME "进入锁定期时间",
DRAW.WIN_NO "开奖号码",BET.CNT_BET "投注人数",WIN.CNT_WIN "中奖人数", BET.SUM_BET "投注额", WIN.SUM_WIN "中奖额",
(WIN.SUM_WIN / BET.SUM_BET) "盈利率"
FROM LOTT_NEW_A3D1.DRAW
INNER JOIN LOTT_NEW_A3D1.BET ON BET.SORTID = DRAW.SORTID AND BET.NUMERO = DRAW.NUMERO
INNER JOIN LOTT_NEW_A3D1.WIN ON WIN.SORTID = BET.SORTID AND WIN.NUMERO = BET.NUMERO
WHERE ( ( WIN.SUM_WIN > 100000 ) AND (WIN.SUM_WIN / BET.SUM_BET) > 20 )  OR  (WIN.SUM_WIN - BET.SUM_BET > 200000)','5','','shanti','2019-03-19 12:15:05','camelle.d','2020-03-06 18:16:57','293','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','DAU','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-275:EID-301','',' PF1 3RD party accounts balance error',' PF1 老虎機遊戲帳戶餘額異常','【 L1 Actions 】
1. Callback alert and check if it will send to AS-General','0','ub8-pf1-sec','1.0','15 10 10  * * ?','SELECT ACCOUNTS FROM LOTT_NEW_A3D1.LOTT_3RD_ACCOUNTS WHERE AMOUNTS > 0 GROUP BY ACCOUNTS HAVING COUNT(*) > 1','5','','shanti','2019-04-11 16:10:54','raphael','2019-12-02 10:55:11','301','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-276','',' PF1 Illegal Withdraw Order Check',' PF1 違法撤單','【 L1 Actions 】
1. Do SOP: https://wiki.yxunistar.com/x/moo4
2. Then copy to AS General Teams [ Hi L2, CMS <NU-CHK-MID-276>, PF1, 違法撤單 ]','0','ub8-pf1-sec','1.0','24 24 */1 * * ?','select * from lott_new_a3d1.lott_oper_log where oper_type=5 and OPER_CONTEXT like （''%非法%''）
      and  OPER_TIME > sysdate - 1/24','5','','Dave.S','2019-04-11 18:46:30','martmil.n','2019-11-21 21:19:38','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-279','',' PF1 IPs been monitored have logged in',' PF1 全平台用户IP异常登陆预警提示','【 L1 Actions 】
1. IPs been monitored have logged in
2. Copy to AS General Teams [ Hi L2, CMS <NU-MID-279>, PF1，不是緊急，被監控IP登入 ]
【 L2 Actions 】
1. 不需要立即處理','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','select ACCOUNTS,LOGIN_IP,LOGINWAY,LOGIN_TIME from LOTT_NEW_A3D1.ACCOUNTS_LOGIN_LOGS where LOGIN_IP IN (''112.116.183.149'',''112.116.160.76'',''116.53.174.213'',''60.160.104.205'',''220.165.33.32'',''222.221.54.143'',''116.53.174.129'',''39.128.58.244'',''183.224.98.22'') AND LOGIN_TIME > sysdate-5/60/24','5','','raphael','2019-07-04 12:04:43','lance','2021-03-05 12:42:26','312','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-280','',' PF2 IPs been monitored have logged in',' PF2 全平台用户IP异常登陆预警提示','【 L1 Actions 】
1. IPs been monitored have logged in
2. Copy to AS General Teams [ Hi L2, CMS <NU-MID-280>, PF2，不是緊急，被監控IP登入 ]
【 L2 Actions 】
1. 不需要立即處理','0','ub8-pf5-core-sec','5.0','0 0/5 * * * ?','select aa.CUSTOMER_NAME,aa.LOGIN_IP,aa.DEVICE_USER_AGENT,aa.LOGIN_TIME from core.US_CUSTOMER_LOGIN_LOG aa JOIN (select MAX(LOGIN_TIME) AS LOGIN_TIME,CUSTOMER_NAME from core.US_CUSTOMER_LOGIN_LOG where LOGIN_IP IN (''112.116.183.149'',''112.116.160.76'',''116.53.174.213'',''60.160.104.205'',''220.165.33.32'',''222.221.54.143'',''116.53.174.129'',''39.128.58.244'',''183.224.98.22'') AND LOGIN_TIME > sysdate-5/60/24 group by CUSTOMER_NAME) bb on aa.LOGIN_TIME = bb.LOGIN_TIME AND aa.CUSTOMER_NAME = bb.CUSTOMER_NAME','5','','raphael','2019-07-04 16:47:17','lance','2021-03-05 12:43:22','313','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-281','',' Update AS CMS Alerts','更新 AS CMS Alerts','【 L1 Actions 】
1. Compare changes from alert then copy and update it inside: https://tinyurl.com/yxu3bf4p
2. If SQL Script was changed, please record the AFTER SQL, AUDIT_USER and AUDIT_TIME column','0','mysql-as-portal','1.0','30 0 23 ? * SUN *','select * from MONI_JOB
where AUDIT_TIME > (DATE(NOW()) - INTERVAL 7 DAY)
and ID not in (''131'',''132'')
','5','','denice.d','2019-07-21 21:06:28','kolin','2021-08-02 14:39:55','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-282','',' Update ASID',' 更新ASID','【 L1 Actions 】
1. Update ASID, EN_NAME, and CH_NAME of alert. If it''s Auto Export, update mail subject and content also to include ASID.
','0','mysql-as-portal','AS','1 1 0 * * ?','SELECT ''Auto SQL Alert''
as TYPE, ID, ASID,EN_NAME,CH_NAME FROM MONI_JOB WHERE ASID is null and (en_name not like ''(%'' or ch_name not like ''(%'') and status=1
union
SELECT ''Auto Export''
as TYPE, ID, ASID,EN_NAME,CH_NAME FROM MONI_EXPORT WHERE ASID is null and (en_name not like ''(%'' or ch_name not like ''(%'') and (status=1 or ID in (SELECT rel_export FROM MONI_JOB where status=1))','5','','denice.d','2019-07-21 21:08:18','kimberlyclaire','2019-12-16 12:20:39','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-283','',' PF1 3rd Party Transfer Abnormal',' PF1 休閒遊戲上下分異常','【 L1 Actions 】
1. PF1 KY transfer abnormal﻿.
2. Copy to AS General Teams [ Hi L2, CMS <CHK-MID-283>, PF1，不是緊急，休閒遊戲上下分異常 ]
3. Do SOP: https://wiki.yxunistar.com/x/rCeJAw
【 L2 Actions 】
1. 不需要立即處理，除非OD認為是緊急的','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','SELECT to_char(TX_ID) id ,ACCOUNT_NAME acct,MERCHANT_NAME, to_char(TX_AMOUNT) amt FROM LOTT_NEW_A3D1.LOTT_EXT_CREDIT_TX
where  TX_STATUS=1
and TX_TIME BETWEEN (sysdate-6/24/60) AND ((sysdate-1/24/60))','5','','raphael','2019-07-29 18:58:56','kimberlyclaire','2020-07-15 15:24:59','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-284','ASI-14537',' PF1 ASI-14537 offline deposit request has been double arrived',' PF1 ASI-14537 線下充值重覆到帳','【 L1 Actions 】
1. PF1 double arrived deposit check
2. Copy to AS General Teams [ Hi L2, CMS <URG-CAL2-MID-284>, PF1 plz check double deposit ]
3. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. 檢查相關訂單號 是否有線下充值重復的狀況
2. Copy AS-RC General [ MID，是緊急，PF1線下商城充值重復推送，請執行充負操作 PROVIDER_ORDER_NUM:]','0','ub8-pf1-sec','1.0','0 0/1 * * * ?','select PROVIDER_ORDER_NUM from lott_new_a3d1.LOTT_BANK_DEPOSIT_ARRIVALS_VW
where bank_id in (''1046'',''1047'')
GROUP BY PROVIDER_ORDER_NUM HAVING COUNT(*) > 1','5','','raphael','2019-07-31 11:28:24','Nikki.o','2020-10-06 16:25:58','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','PD','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-285','',' PF2 deposit duplicate number',' PF2 充值重複單號','If count is greater than 1 , CALL SRV AND L2.

【 L1 Actions 】
1. Copy to SRV and L2

【 L2 Actions 】
1. Copy to PED Teams','0','ub8-pf5-core-sec','5.0','0 0/2 * * * ?','select CUSTOMER_NAME, DP_TRANSACTION_ID, count(DP_TRANSACTION_ID)
from CORE.BPS_DEPOSIT_RECORD_VW
where  REQUEST_TIME > sysdate-3/24/60
group by CUSTOMER_NAME, DP_TRANSACTION_ID
having count(*) > 1','5','','garys','2019-08-23 19:53:18','martmil.n','2019-11-21 21:23:33','315','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-286','',' PF1 duplicate deposit serial number found',' PF1 充值申請序號重複','If count is greater than 1 , CALL SRV AND L2.

【 L1 Actions 】
1. Copy to SRV and L2

【 L2 Actions 】
1. Copy to PED Teams','0','ub8-pf1-sec','1.0','0 0/2 * * * ?','select count(PROVIDER_ORDER_NUM),z.ACCOUNTS
from LOTT_NEW_A3D1.LOTT_BANK_DEPOSIT_ARRIVALS_VW y  left join LOTT_NEW_A3D1.LOTT_VW_CHARFE_REC  z on y.PROVIDER_ORDER_NUM = z.TRANSID
where y.bank_id in (''1046'',''1047'') and y.UPDATE_TIME > sysdate -3/24/60
group by y.PROVIDER_ORDER_NUM,z.ACCOUNTS having count(PROVIDER_ORDER_NUM) > 1
','5','','lance','2019-08-27 09:59:58','jason','2020-09-28 10:39:14','314','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-MID-288:EID-318','',' PF1 each numero with relative account wins more than the limit',' PF1  各期期號關聯用戶中獎超過限制','【 L1 Actions 】
1. PF1 relative account wins over limit
2. Copy to AS General Teams [ Hi L2, CMS <NU-MID-288>, PF1 plz check  relative account wins over limit]
3. Inform AS-RC PF1此期開獎中獎超過限制，請查詢關聯帳號
【 L2 Actions 】
1. 若OD有疑問，協助查詢關聯帳戶','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','WITH LIST AS (
select tempt2.*, info.QQNO, info.EMAIL, info.CARD_NAME,bank.BANKCARDNO from (
select tempt.NUMERO, tempt.SORTID, tempt.REMARK, LIST2.ACCOUNTS, NVL(SUM(LIST2.TOTAL_WINPRICE),0) WIN from (
select * from (
SELECT NUMERO, SORTID, S.REMARK, NVL(SUM(TOTAL_WINPRICE),0) WIN FROM LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN test
join (select * from LOTT_NEW_A3D1.LOTT_GROUP_SERIES where GROUP_TYPE=1) S on test.SORTID=S.GROUP_VALUE
WHERE INTO_TIME > SYSDATE -9/24/60
AND REMARK IN (''福彩3D'',''体彩P3/P5'')
GROUP BY NUMERO, SORTID, S.REMARK
order by NUMERO )
where WIN > 300000
UNION
select * from (
SELECT NUMERO, SORTID, S.REMARK, NVL(SUM(TOTAL_WINPRICE),0) WIN FROM LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN test
join (select * from LOTT_NEW_A3D1.LOTT_GROUP_SERIES where GROUP_TYPE=1) S on test.SORTID=S.GROUP_VALUE
WHERE INTO_TIME > SYSDATE -9/24/60
AND REMARK NOT IN (''福彩3D'',''体彩P3/P5'')
GROUP BY NUMERO, SORTID, S.REMARK
order by NUMERO )
where WIN > 500000 ) tempt, LOTT_NEW_A3D1.LOTT_FC3D_ORDER_MAIN LIST2
where tempt.NUMERO=LIST2.NUMERO
and tempt.SORTID=LIST2.SORTID
and TOTAL_WINPRICE > 0
group by tempt.NUMERO, tempt.SORTID, tempt.REMARK, LIST2.ACCOUNTS) tempt2
left join LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO info on tempt2.ACCOUNTS=info.ACCOUNTS
left join LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK bank on tempt2.ACCOUNTS=bank.ACCOUNTS
),
QQ as (
select * from (
SELECT QQNO, LISTAGG(ACCOUNTS, '','') WITHIN GROUP (ORDER BY ACCOUNTS) QQLIST FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO
where QQNO is not null
GROUP BY QQNO)
where (LENGTH(QQLIST)-LENGTH(REPLACE(QQLIST,'','',''''))) > 0),
MAIL as (
select * from (
SELECT EMAIL, LISTAGG(ACCOUNTS, '','') WITHIN GROUP (ORDER BY ACCOUNTS) MAILLIST FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO
where EMAIL is not null
GROUP BY EMAIL)
where (LENGTH(MAILLIST)-LENGTH(REPLACE(MAILLIST,'','',''''))) > 0),
CNAME as (
select * from (
SELECT CARD_NAME, LISTAGG(ACCOUNTS, '','') WITHIN GROUP (ORDER BY ACCOUNTS) NAMELIST FROM LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO
where CARD_NAME is not null
GROUP BY CARD_NAME)
where (LENGTH(NAMELIST)-LENGTH(REPLACE(NAMELIST,'','',''''))) > 0),
BCARD as (
select * from (
SELECT t.BANKCARDNO, LISTAGG(t.ACCOUNTS, '','') WITHIN GROUP (ORDER BY t.ACCOUNTS) CARDLIST FROM
(select distinct s.ACCOUNTS,s.BANKCARDNO from LOTT_NEW_A3D1.LOTT_VW_MEMBER_BANK s) t
where t.BANKCARDNO is not null
GROUP BY t.BANKCARDNO)
where (LENGTH(CARDLIST)-LENGTH(REPLACE(CARDLIST,'','',''''))) > 0)

select LIST.NUMERO, LIST.REMARK, LIST.ACCOUNTS, LIST.WIN, QQLIST, MAILLIST, NAMELIST, LISTAGG(CARDLIST, '','') WITHIN GROUP (ORDER BY CARDLIST) BANKCARDLIST from LIST
left join QQ on LIST.QQNO=QQ.QQNO
left join MAIL on LIST.EMAIL=MAIL.EMAIL
left join CNAME on LIST.CARD_NAME=CNAME.CARD_NAME
left join BCARD on LIST.BANKCARDNO=BCARD.BANKCARDNO
group by LIST.NUMERO, LIST.REMARK, LIST.ACCOUNTS, LIST.WIN, QQLIST, MAILLIST, NAMELIST

order by LIST.NUMERO, LIST.REMARK, WIN desc','5','','raphael','2019-09-23 23:19:58','riel_john','2021-06-11 15:24:40','318','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-290','',' PF2 Duplicate Lottery Time',' PF2 開獎時間重複','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-290>， 不同期號,開獎時間卻重複,需進行data patch]
【 L2 Actions 】
1. 需立即檢查 CORE.LGS_NUMERO_RECORD 與相對應的DRAW table,找到重複的開獎時間進行data patch
2.相關wiki: https://wiki.yxunistar.com/x/6juJAw','0','ub8-pf5-core-sec','5.0','0 15 0 * * ?','-- 低頻彩
select NUMERO_NO,WIN_TIME,GAME_CODE
from DRAW.DCS_LF_NUMERO
where GAME_CODE IN (''TCP3P5'',''FC3D'',''UUFF3D'')
AND WIN_TIME > SYSDATE
group by NUMERO_NO,WIN_TIME,GAME_CODE
having count(win_time) > = 2
union all
-- SSC
select NUMERO_NO,WIN_TIME,GAME_CODE
from DRAW.DCS_SSC_NUMERO
where GAME_CODE IN (''TB2F'',''BJ5FC'',''TJSSC'',''HLJSSC'',''CQSSC'',''XJSSC'',''UU30S'',''UUFFC'',''UU2FC'',''UUSSC'',''TXFFC'',''SHSSL'',''CQSSCHS'')
AND WIN_TIME > SYSDATE
group by NUMERO_NO,WIN_TIME,GAME_CODE
having count(win_time) > = 2
union all
-- PK
select NUMERO_NO,WIN_TIME,GAME_CODE
from DRAW.DCS_PK_NUMERO
where GAME_CODE IN (''XYFT'',''BJPK10'',''UUFFPK10'')
AND WIN_TIME > SYSDATE
group by NUMERO_NO,WIN_TIME,GAME_CODE
having count(win_time) > = 2
union all
-- 11X5
select NUMERO_NO,WIN_TIME,GAME_CODE
from DRAW.DCS_11X5_NUMERO
where GAME_CODE IN (''SH11X5'',''JX11X5'',''GD11X5'',''SD11X5'',''UU11X5'',''UUFF11X5'',''UU2F11X5'',''UU30S11X5'')
AND WIN_TIME > SYSDATE
group by NUMERO_NO,WIN_TIME,GAME_CODE
having count(win_time) > = 2
union all
-- LGS_NUMERO_RECORD
select NUMERO,WINNING_TIME,GAME_CODE
from CORE.LGS_NUMERO_RECORD
where GAME_CODE IN(
''TCP3P5'',''FC3D'',''UUFF3D'',''TB2F'',''BJ5FC'',''TJSSC'',''HLJSSC'',''CQSSC'',''XJSSC'',''UU30S'',''UUFFC'',''UU2FC'',''UUSSC'',''TXFFC'',''SHSSL'',''CQSSCHS'',''XYFT'',''BJPK10'',''UUFFPK10'',''XYFT'',''BJPK10'',''UUFFPK10'',''SH11X5'',''JX11X5'',''GD11X5'',''SD11X5'',''UU11X5'',''UUFF11X5'',''UU2F11X5'',''UU30S11X5''
)
AND WINNING_TIME > SYSDATE
group by NUMERO,WINNING_TIME,GAME_CODE
having count(WINNING_TIME) > = 2','5','','garys','2019-10-18 10:55:14','kolin','2020-11-20 17:29:47','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-291','ASI-15105',' PF1 ASI-15105 Super-jackpot Winner',' PF1 ASI-15105 中超级大奖名單','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-291> , PF1 ASI-15105 中超级大奖名單 ]

【 L2 Actions 】
1.監控中超级大奖名單，運營須做輪播圖展示中獎者','0','ub8-pf1-sec','1.0','0 0 0/1 * * ?','select aa.ACCOUNTS ,bb.REALNAME ,aa.AMOUNTS ,aa.TRANS_TIME
from lott_new_a3d1.LOTT_JACKPOT_RECORD aa
left join lott_new_a3d1.LOTT_VW_MEMBER_INFO bb on aa.ACCOUNTS = bb.ACCOUNTS
where aa.TRANS_TYPE = ''02''
and aa.jackpot = ''super-jackpot''
and aa.trans_time > sysdate -1/24
order by aa.TRANS_TIME desc','5','','lance','2019-10-25 18:14:01','lance','2019-12-05 11:11:35','323','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','OP','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-292:EID-324','ASI-15105',' PF2 ASI-15105 Super-jackpot Winner',' PF2 ASI-15105 中超级大奖名單','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-292> , PF2 ASI-15105 中超级大奖名單 ]

【 L2 Actions 】
1. 監控中超级大奖名單，運營須做輪播圖展示中獎者','0','ub8-pf5-core-sec','5.0','0 0 0/1 * * ?','select cc.CUSTOMER_NAME 会员账号, bb.NICKNAME 会员昵称, aa.AMOUNT 中奖金额, aa.BIZ_TIME 中奖时间by小時,
(CASE aa.BILL_TYPE
    WHEN 2043 THEN ''彩票''
    WHEN 2071 THEN ''老虎機''
END)類型
from CORE.RPT_CUSTOMER_BILL_DATA aa
left join core.US_CUSTOMER_PROFILE_VW bb on aa.CUSTOMER_ID = bb.CUSTOMER_ID
left join core.US_CUSTOMER_VW cc on aa.CUSTOMER_ID = cc.CUSTOMER_ID
where aa.BILL_TYPE = ''2043'' and aa.CREATE_TIME > sysdate -1/24
OR aa.BILL_TYPE = ''2071'' and AMOUNT > 10000  and aa.CREATE_TIME > sysdate -1/24','5','','lance','2019-10-25 18:42:41','jason','2021-07-20 16:48:51','324','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','OP','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-296','',' PF2 JY8 Lottery Draw Delay',' PF2 獎源8彩種入號延遲','【 L1 Actions 】
1. If alert appears during maintenance time, please ignore.
2.If TWBGS lottery game draw delay. please do SOP:
https://wiki.yxunistar.com/x/6R1pB
3.Call L2 and inform that PF2 JY8 Lottery Game Draw Delay
4-1.Copy to Application Support (AS) General [ CMS
 <URG-CAL2-MID-296>, PF2 ''Game name'' 目前開獎延遲 ]
4-2.Copy to SLA问题通报 JY8 [''Game name'' 目前開獎延遲 ]
5. Assist L2 to call DEV if necessary. please refer to this wiki sched: https://wiki.yxunistar.com/x/RoCXAQ
6. Create an ASI for this urgent MID and post it on AS General

【 L2 Actions 】
1.確認獎源8彩種是否正常，通知PD關閉彩種，聯繫RD','0','ub8-pf5-core-sec','5.0','0 */10 * * * ?','-- 2021/07/20 update by jason
-- DRAW.DCS_XXXXX_NUMERO
-- 監控DCS所有JY8獎源彩種最新一期未開獎期号，預計開獎時間超過10分鐘後，FIRST_INPUT_NO(首次入号)還未寫入獎號
-- review獎源網出号GAME_CODE
select GAME_CODE,min(WIN_TIME),min(NUMERO_NO) from draw.DCS_SSC_NUMERO
where  GAME_CODE in (''TB2F'',''TXFFC'',''CQSSC'',''HLJSSC'',''XJSSC'',''TJSSC'',''SHSSL'',''BJ5FC'',''TWBGS'')
and FIRST_INPUT_NO is null
group by GAME_CODE
having min(WIN_TIME) < sysdate - 1/24/60*10
union all
select GAME_CODE,min(WIN_TIME),min(NUMERO_NO) from draw.DCS_PK_NUMERO
where  GAME_CODE in (''XYFT'',''BJPK10'')
and FIRST_INPUT_NO is null
group by GAME_CODE
having min(WIN_TIME) < sysdate - 1/24/60*10
union all
select GAME_CODE,min(WIN_TIME),min(NUMERO_NO) from draw.DCS_KENO_NUMERO
where  GAME_CODE in (''BJKL8'',''FCKL8'',''TWK8'')
and FIRST_INPUT_NO is null
group by GAME_CODE
having min(WIN_TIME) < sysdate - 1/24/60*10
union all
select GAME_CODE,min(WIN_TIME),min(NUMERO_NO) from draw.DCS_11X5_NUMERO
where  GAME_CODE in (''SD11X5'',''JX11X5'',''GD11X5'',''SH11X5'')
and FIRST_INPUT_NO is null
group by GAME_CODE
having min(WIN_TIME) < sysdate - 1/24/60*10
union all
select GAME_CODE,min(WIN_TIME),min(NUMERO_NO) from draw.DCS_K3_NUMERO
where  GAME_CODE in (''JSK3'')
and FIRST_INPUT_NO is null
group by GAME_CODE
having min(WIN_TIME) < sysdate - 1/24/60*10
union all
select GAME_CODE,min(WIN_TIME),min(NUMERO_NO) from draw.DCS_SB_NUMERO
where  GAME_CODE in (''JSSB'')
and FIRST_INPUT_NO is null
group by GAME_CODE
having min(WIN_TIME) < sysdate - 1/24/60*10
union all
select GAME_CODE,min(WIN_TIME),min(NUMERO_NO) from draw.DCS_SSQ_NUMERO
where  GAME_CODE in (''SSQ'')
and FIRST_INPUT_NO is null
group by GAME_CODE
having min(WIN_TIME) < sysdate - 1/24/60*10','5','','Denmark','2019-11-07 14:58:22','jason','2021-07-20 16:11:15','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-297','',' PF1 JY8 Lottery Game Draw Delay',' PF1 獎源8彩種入號延遲','【 L1 Actions 】
1.Call L2 and inform that PF1 JY8 have a delay
2-1.Copy to Application Support (AS) General [ CMS <URG-CAL2-MID-297>, PF1 JY8 延遲 ]
2-2.Copy to SLA问题通报 JY8 [''Game name'' 目前開獎延遲 ]
3. If TWBGS lottery game draw delay. please do SOP:
https://wiki.yxunistar.com/x/6R1pB
4. Assist L2 to call DEV if necessary. please refer to this wiki sched: https://wiki.yxunistar.com/x/RoCXAQ
5. If alert appears during maintenance time, please ignore.
6. Create an ASI for this urgent MID and post it on AS General
6.Check https://www.jy8web.com/lotteryList
【 L2 Actions 】
1.若是獎源8彩種入獎延遲，L2確認問題後立即Call DEV/TA duty','0','ub8-pf1-sec','1.0','0 0/10 * * * ?',' select * from (select t.NUMERO ,t.WIN_DATE,s.REMARK,s.PARAM_ONE,t.OPERTIME1,t.OPERTIME2,t.STATE,t.WIN_NO1,t.WIN_NO2,t.WIN_NO, count(*) over () cnt
from LOTT_NEW_A3D1.LOTT_GROUP_SERIES s
inner join LOTT_NEW_A3D1.LOTT_MANAUL_TEMP t on t.SORTID = s.GROUP_VALUE
where s.PARAM_ONE in (''TB2F'',''TXFFC'',''CQSSC'',''BJKL8'',''SHSSL'',''TJSSC'',''HLJSSC'',''TWBGS'',''XYFT'',''XJSSC'',''SD11X5'',''JX11X5'',''GD11X5'',''JSSHB'',''JSK3'')
and t.WIN_DATE < sysdate - 5/60/24
and  t.WIN_NO is null
and WIN_DATE > sysdate - 1/24 order by WIN_DATE desc)
where cnt >= 1','5','','kimberlyclaire','2019-11-10 22:51:41','kolin','2021-06-28 19:18:40','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-298','',' PF2 Third party data to transaction abnormal',' PF2 第三方同步數據到帳變異常','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-298> , PF2 第三方同步數據到帳變異常 ]
2. do SOP https://wiki.yxunistar.com/x/hkeJAw
3. Create an ASI for this urgent MID and post it on AS General
【 L2 Actions 】
1. PF2 第三方數據由bill_tmp寫入ACS_Transaction 並計算返點，因此若有數據卡在bill_tmp，需查看是否正常
SOP(需依照情況而定)
https://wiki.yxunistar.com/x/MGqJAw
2.查看URG-GYM-43的kibana於TG告警','0','ub8-pf5-core-sec','5.0','0 15 0/1 * * ?','select * from core.lott_3rd_bill_tmp
','5','','lance','2019-11-21 14:43:58','lance','2021-07-29 16:49:13','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-300:EID-331','ASI-15283',' PF1 ASI-15283 Apply Deposit but not arrival',' PF1 ASI-15283 频繁申请充值监控报警','Please just call back first

【 L1 Actions 】
1. Callback alert and check if export is sent to AS-RC Deposit Alert on Teams','0','ub8-pf1-sec','1.0','5 53 * * * ?','select REC.ACCOUNTS 用戶, count(1) 嘗試充值次數, UUID from lott_new_a3d1.LOTT_VW_CHARFE_REC REC
left join (
select A.ACCOUNTS, A.LOGIN_TIME, UUID from lott_new_a3d1.ACCOUNTS_LOGIN_LOGS A
inner join (
select ACCOUNTS ,MAX(LOGIN_TIME) as time from lott_new_a3d1.ACCOUNTS_LOGIN_LOGS
group by ACCOUNTS ) B
on A.ACCOUNTS = B.ACCOUNTS and A.LOGIN_TIME = B.time
) logs on REC.ACCOUNTS = logs.ACCOUNTS
where CHARFETIME > sysdate -1/24
and ARRIVAL_AMOUNT is null
and state != 0
group by REC.accounts, bank_id, UUID
having count(1) > 10
','5','','kevin','2019-11-27 11:47:32','kolin','2021-06-14 16:30:54','331','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','DAU','0','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-301:EID-332','ASI-15283',' PF2 ASI-15283 Apply Deposit but not arrival',' PF2 ASI-15283 用户大量申请充值订单','Please just call back first

【 L1 Actions 】
1. Callback alert and check if export is sent to AS-RC Deposit Alert on Teams','0','ub8-pf5-core-sec','5.0','10 59 * * * ?','SELECT a.*,
       b.last_login_time,
       c.uuid,
       c.login_time
FROM
  (SELECT customer_id,
          customer_name,
          bank_id,
          COUNT(1) cnt
   FROM core.bps_deposit_record_vw rec
   WHERE request_time > SYSDATE - 5 / 24
     AND STATUS = 0
     AND BANK_ID not in (''3210'')
   GROUP BY customer_id,
            customer_name,
            bank_id
   HAVING COUNT(1) > 10) a
INNER JOIN core.us_customer_profile_vw b ON a.customer_id = b.customer_id
LEFT JOIN
  (SELECT customer_id,
          customer_name,
          login_time,
          uuid
   FROM core.us_customer_login_log) c ON c.login_time >= b.last_login_time
AND b.customer_id = c.customer_id','5','','kevin','2019-11-27 12:29:41','kimberlyclaire','2021-07-13 12:19:10','332','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','DAU','0','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-302:EID-333','ASI-15214',' PF2 Loss Customer Data for WA tools ',' PF2  審單工具平台玩家虧損資料讀取','【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf5-core-sec','5.0','0 59 * * * ?','with aa as
 (select CREATE_TIME time, CUSTOMER_NAME , sum(SUM_WIN_AMOUNT-SUM_BET_AMOUNT) profit, sum(SUM_BET_AMOUNT-SUM_WIN_AMOUNT-SUM_REBATE) platformloss
from core.RALERT_CUSTOMER_LIST
where CREATE_TIME > sysdate -1/24
group by CUSTOMER_NAME , CREATE_TIME)
select CUSTOMER_NAME 帐号, sum(aa.profit) 用户一小時盈亏 from aa
group by CUSTOMER_NAME
having sum(aa.profit) > ''150000''','5','','raphael','2019-11-29 11:44:15','kimberlyclaire','2020-03-08 13:23:17','333','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','DAU','0','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-303:EID-334','',' PF2 pfLoss for RC tools',' PF2 審單工具平台虧損資料讀取','【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf5-core-sec','5.0','0 59 */1 * * ?','with aa as
(select trunc(max(BIZ_DATE)) time, game_code game, sum(SUM_BET_ACTUAL-SUM_WIN_ACTUAL-SUM_RET_AGENT-SUM_RET_BET) profit from core.RPT6_TEAM_LOTT_GAME_BT_TODAY
where trunc(BIZ_DATE) = trunc(sysdate)
group by game_code), bb as (
select trunc(BIZ_DATE) time, sum(SUM_BET_ACTUAL-SUM_WIN_ACTUAL-SUM_RET_BET-SUM_RET_AGENT) platProfit from core.RPT6_TEAM_LOTT_GAME_BT_TODAY
where trunc(BIZ_DATE) = trunc(sysdate)
group by trunc(BIZ_DATE))
select aa.game 彩种, aa.profit 彩种当日盈亏, bb.platProfit 当日平台盈亏 from aa left join bb on aa.time = bb.time
where aa.profit < -50000','5','','kevin','2019-12-03 12:28:07','camelle.d','2020-03-06 18:31:25','334','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-304:EID-335','',' PF2 gameLoss for RC tools',' PF2 審單工具遊戲虧損資料讀取','審單工具遊戲虧損資料讀取(PF2)
Review tool game loss data reading
【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf5-core-sec','5.0','0 * */1 * * ?','select GAME_CODE 游戏彩种,
CUSTOMER_NAME 中奖帐号,
ORDER_NUM 中奖订单号,
NUMERO 中奖期号,
TOTAL_ACTUAL_BET_AMOUNT 投注金额,
WIN_AMOUNT 中奖总额,
PLATFORM_LOSS  平台损失,
WINNING_TIME 表定开奖时间,
DRAW_TIME 实际开奖时间,
BETTING_TIME 投注时间,
WINNING_NUMBER 开奖号码
from core.RALERT_ORDER_LIST
WHERE DRAW_TIME > sysdate -1/24
order by DRAW_TIME desc','5','','kevin','2019-12-03 15:06:51','camelle.d','2020-03-06 18:33:40','335','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-305:EID-336','',' PF2 Order Data Fetch for RC tools',' PF2 審單工具訂單告警','【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf5-core-sec','5.0','0 59 */1 * * ?','select ORDER_NUM 订单号码,
CUSTOMER_NAME 投注帐号,
TOTAL_ACTUAL_BET_AMOUNT 投注金额,
WIN_AMOUNT 中奖金额,
round(WIN_AMOUNT/TOTAL_ACTUAL_BET_AMOUNT) 返奖率,
TOTAL_ACTUAL_BET_AMOUNT-WIN_AMOUNT 平台损失,
BETTING_TIME 投注时间,
WINNING_TIME 表定开奖时间,
DRAW_TIME 实际开奖时间,
numero 期号,
WINNING_NUMBER 开奖号码
from core.RALERT_ORDER_LIST
where DRAW_TIME > sysdate -1/24
and ((TOTAL_ACTUAL_BET_AMOUNT <= 100 and WIN_AMOUNT >= 5000 and round(WIN_AMOUNT/TOTAL_ACTUAL_BET_AMOUNT) >= 100)
or (TOTAL_ACTUAL_BET_AMOUNT > 100 and WIN_AMOUNT >= 5000 and round(WIN_AMOUNT/TOTAL_ACTUAL_BET_AMOUNT) >= 40)
or (WIN_AMOUNT >= 20000))
order by DRAW_TIME desc','5','','kevin','2019-12-03 17:34:25','camelle.d','2020-03-06 18:34:51','336','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','DAU','0','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-307:EID-326','ASI-15214',' PF1 Lottloss for EC',' PF1 審單工具彩種大額虧損','WA报表的触发器
WA PF1 Lottloss Report Trigger
【 L1 Actions 】
1. Callback alert and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 59 * * * ?','with aa as
(select trunc(max(BIZ_TIME)) time, game_code game, sum(sum_bet_actual-SUM_WIN_ACTUAL-SUM_RET_AGENT-SUM_RET_BET) profit from LOTT_NEW_A3D1.RPT_R_GAME_STATISTIC
where trunc(BIZ_TIME) = trunc(sysdate)
group by game_code), bb as (
select trunc(BIZ_TIME) time, sum(sum_bet_actual-SUM_WIN_ACTUAL-SUM_RET_BET-SUM_RET_AGENT) platProfit from LOTT_NEW_A3D1.RPT_R_GAME_STATISTIC
where trunc(BIZ_TIME) = trunc(sysdate)
group by trunc(BIZ_TIME))
select aa.game 彩种, aa.profit 彩种当日盈亏, bb.platProfit 当日平台盈亏 from aa left join bb on aa.time = bb.time
where aa.profit < -200000
order by aa.profit asc','5','','lance','2019-12-04 16:21:23','camelle.d','2020-03-06 18:39:05','326','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','DAU','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-309:EID-337','ASI-15214',' PF2 Play Warning Data fetch for RC tools',' PF2 審單工具玩法虧損資料讀取','【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf5-core-sec','5.0','0 58 * * * ?','SELECT sysdate 时间, a.game_code 彩种, c.play_name 玩法组,
 sum(a.ACTUAL_BET_AMOUNT) 投注额,sum(a.WIN_AMOUNT) 中奖额, sum(a.ACTUAL_BET_AMOUNT)*0.0495 投注返点, sum(a.ACTUAL_BET_AMOUNT)*0.0109 代理返点,
 sum(a.ACTUAL_BET_AMOUNT)-sum(a.WIN_AMOUNT) 当天利润,
 ROUND(((sum(a.ACTUAL_BET_AMOUNT)-sum(a.WIN_AMOUNT*1.0604))/sum(a.ACTUAL_BET_AMOUNT))*100,2)||''%'' 利潤率
FROM core.LGS_ORDER_DETAIL a join (select ORDER_MASTER_ID, PLAY_ID from core.LGS_ORDER_INFO where END_WINNING_TIME> sysdate -1/24 group by ORDER_MASTER_ID, play_id) b on a.ORDER_MASTER_ID = b.ORDER_MASTER_ID join core.LGS_PLAY_MENU c on b.play_id = c.play_id join core.lgs_order_master d on a.ORDER_MASTER_ID = d.ORDER_MASTER_ID
where a.DRAW_TIME > sysdate -1/24
and a.win_amount > 185000
group by a.game_code, c.play_name','5','','kevin','2019-12-13 15:17:10','camelle.d','2020-03-06 18:41:04','337','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','DAU','0','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-311:EID-340','',' NumeroLoss  for RC tools',' PF1 審單工具期號虧損','WA报表的触发器
RC PF1 Lottloss Report Trigger
【 L1 Actions 】
1. Callback alert and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 54 * * * ?','with WW  as
(select  CARRY_NUMERO 期号, SORTID 彩种, sum(BILL_AMOUNT) 中奖额
from lott_new_a3d1.LOTT_ACCOUNTS_BILL
where BILLTYPE = ''2005''
and BILL_TIME > sysdate -1/24
group by SORTID,CARRY_NUMERO),

RR as
(select NUMERO 期号, sortid 彩种, sum(TOTAL_AMOUNT) 投注额
from lott_new_a3d1.LOTT_FC3D_ORDER_MAIN
where NUMERO in (select WW.期号 from WW)
and STATUS in (020, 004, 005, 011, 009)
group by NUMERO,sortid)

select WW.期号 , RR.投注额, WW.中奖额,
(case WW.彩种
	WHEN ''20005'' THEN ''优游快三''
	WHEN ''331'' THEN ''经典天津时时彩''
	WHEN ''443'' THEN ''经典上海时时乐''
	WHEN ''20000'' THEN ''经典北京快乐8''
	WHEN ''20004'' THEN ''优游快乐彩''
	WHEN ''3'' THEN ''福彩3D''
	WHEN ''5000'' THEN ''优游30秒彩''
	WHEN ''71'' THEN ''山东十一选五''
	WHEN ''182'' THEN ''体彩P3P5''
	WHEN ''108'' THEN ''广东十一选五''
	WHEN ''811'' THEN ''优游时时彩''
	WHEN ''20007'' THEN ''优游骰宝''
	WHEN ''219'' THEN ''新疆时时彩''
	WHEN ''475'' THEN ''经典欢乐生肖''
	WHEN ''10000'' THEN ''淘宝两分彩''
	WHEN ''20006'' THEN ''江苏快三''
	WHEN ''923'' THEN ''优游十一选五''
	WHEN ''1242'' THEN ''优游分分彩''
	WHEN ''34'' THEN ''江西十一选五''
	WHEN ''699'' THEN ''经典黑龙江时时彩''
	WHEN ''20503'' THEN ''优游分分十一选五''
	WHEN ''21000'' THEN ''腾讯分分彩''
	WHEN ''20010'' THEN ''幸运飞艇''
	WHEN ''20008'' THEN ''江苏骰宝''
END)彩种
from WW Right join RR on WW.期号 = RR.期号
where (中奖额 > 100000 and 中奖额/投注额 > 20) or 中奖额-投注额 > 200000
order by 期号,彩种','0','','lance','2019-12-23 15:51:25','kolin','2020-11-19 17:53:34','340','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-312','',' PF1 Test account apply deposit and money have been arrival',' PF1 測試帳號申請充值，且已到帳','【 L1 Actions 】
1. Copy to AS Teams and AS-OD General [ Hi! PF1 測試帳號申請充值，且已到帳檢查是否異常，異常請通知PED索取第三方交易明細]','0','ub8-pf1-sec','1.0','0 0 */1 * * ?','select REFID 平台訂單號, TRANSID PED訂單號, ACCOUNTS 帳號, AMOUNTS 金額 from LOTT_NEW_A3D1.LOTT_VW_CHARFE_REC
where ACCOUNTS like ''Test%''
and STATE=2
and CHARFETIME > TRUNC(sysdate-1/24)','5','','raphael','2020-01-08 18:44:15','denice.d','2020-01-08 19:24:23','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CALOD',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-313','',' PF2 Test account apply deposit and money have been arrival',' PF2 測試帳號申請充值，且已到帳','【 L1 Actions 】
1. Copy to AS Teams and AS-OD General [ Hi! PF2 測試帳號申請充值，且已到帳檢查是否異常，異常請通知PED索取第三方交易明細]','0','ub8-pf5-core-sec','5.0','0 0 */1 * * ?','select RECORD_ID 平台訂單號, DP_TRANSACTION_ID PED訂單號, CUSTOMER_NAME 帳號, ARRIVAL_AMOUNT 金額 from core.BPS_DEPOSIT_RECORD_VW
where CUSTOMER_NAME like ''Test%''
and status=1
and ARRIVAL_TIME > TRUNC(sysdate-1/24)','5','','raphael','2020-01-08 19:01:14','lance','2020-10-20 13:29:30','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CALOD',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-316','ASI-15554',' PF2 BE [DIRECT_CUSTOMER mgmt] bulk export monitor',' PF2後台[直客用戶管理]大量導出告警','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <CHK-MID-316> , PF2, 後台[直客用戶管理]有大量用戶數據導出，請關注。 ]
2. message Jason about this alert','0','ub8-pf5-core-sec','5.0','0 10 * ? * * *','select * from CORE.OP_DIRECT_CUSTOMER_LOG where OPERATION_TYPE =''export'' and RESULT_COUNT >50 and OPERATION_TIME > sysdate -15/24/60','5','','denice.d','2020-01-20 18:27:58','denice.d','2020-01-20 18:46:23','341','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CHK-MID-317','',' PF2 BE [DIRECT_CUSTOMER mgmt] bulk export monitor',' PF2後台[直客用戶管理]大量導出告警','【 L1 Actions 】
1. Copy to AS Teams [ Hi L2, CMS <CHK-MID-317> , PF2, 後台[直客用戶管理]在非工作時間有操作行為，請關注。 ]
2. message Jason about this alert via telegram','0','ub8-pf5-core-sec','5.0','0 10 * ? * * *','select * from CORE.OP_DIRECT_CUSTOMER_LOG where TO_CHAR(OPERATION_TIME,''HH24'') not between 8 and 20 and OPERATION_TIME > sysdate -15/24/60','5','','Denmark','2020-01-20 18:30:27','Denmark','2020-01-20 18:52:47','342','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-318:EID-343','ASI-15682',' PF2 Third Party Game Loss',' PF2 審單工具"第三方遊戲平台"虧損資料讀取','【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf5-core-sec','5.0','0 59 * * * ?','with aa as(
select sum(amount) 總中獎,TGI_ID  from core.LOTT_3RD_ACCOUNTS_BILL_DATA
where bill_type = ''2005''
and bill_time > trunc(sysdate)
group by TGI_ID),
bb as (
select sum(amount) 總投注,TGI_ID  from core.LOTT_3RD_ACCOUNTS_BILL_DATA
where bill_type = ''2007''
and bill_time > trunc(sysdate)
group by TGI_ID),
cc as (
select (aa.總中獎 - bb.總投注) 平台虧損, aa.TGI_ID
from aa left join bb on aa.TGI_ID = bb.TGI_ID
where (aa.TGI_ID=9 AND (aa.總中獎 - bb.總投注) >= 80000)
or (aa.TGI_ID!=9 AND (aa.總中獎 - bb.總投注) >= 50000)
),
dd as (
select TGI_ID, ACCOUNTS, SUM(CASE WHEN BILL_TYPE=2005 THEN AMOUNT WHEN BILL_TYPE=2007 THEN -AMOUNT ELSE 0 END) 平台虧損 from core.LOTT_3RD_ACCOUNTS_BILL_DATA
where bill_time > trunc(sysdate)
group by TGI_ID, ACCOUNTS
)

select
(case TGI_ID
        WHEN 1 THEN ''MGS''
        WHEN 2 THEN ''LX''
        WHEN 3 THEN ''連環奪寶''
        WHEN 4 THEN ''PT''
        WHEN 6 THEN ''TTG''
        WHEN 7 THEN ''KY''
        WHEN 8 THEN ''FMC''
        WHEN 9 THEN ''AG''
END)供應商, ACCOUNTS ,平台虧損 from (
select TGI_ID,ACCOUNTS,平台虧損 from (
select * from (
select ROW_NUMBER() OVER(PARTITION BY TGI_ID ORDER BY 平台虧損 desc) rn, dd.* from dd
where 平台虧損 > 0
and TGI_ID in (select TGI_ID from cc))
where rn <= 10
)
UNION ALL
select cc.TGI_ID,null, cc.平台虧損 from cc
)
order by TGI_ID,平台虧損 desc ','5','','lance','2020-02-05 16:55:43','lance','2020-08-18 15:46:45','343','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','DAU','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-319:EID-344','ASI-15682',' PF1 Third Party Game Loss',' PF1 審單工具"第三方遊戲平台"虧損資料讀取','【 L1 Actions 】
1. Callback alert immediately and check if export was sent to RC Monitor Alert','0','ub8-pf1-sec','1.0','0 59 * * * ?','with aa as(
select sum(amount) 中獎, TGI_ID  from LOTT_new_A3D1.LOTT_3RD_ACCOUNTS_BILL_DATA
where bill_type = ''2005''
and bill_time > trunc(sysdate) and bill_time < trunc(sysdate + 1)
group by TGI_ID
UNION ALL
select sum(tx_amount) 中獎, decode(MERCHANT_NAME,''KAIYUAN'',7, ''FMC'', 8, 0) TGI_ID  from LOTT_NEW_A3D1.LOTT_EXT_GAME_TX
where tx_type = ''2005''
and tx_time > trunc(sysdate) and tx_time < trunc(sysdate + 1)
group by MERCHANT_NAME
),
bb as (
select sum(amount) 投注,TGI_ID  from LOTT_new_A3D1.LOTT_3RD_ACCOUNTS_BILL_DATA
where bill_type = ''2007''
and bill_time > trunc(sysdate)and bill_time < trunc(sysdate + 1)
group by TGI_ID
UNION ALL
select sum(-tx_amount) 投注, decode(MERCHANT_NAME,''KAIYUAN'',7, ''FMC'', 8, 0) TGI_ID from LOTT_NEW_A3D1.LOTT_EXT_GAME_TX
where tx_type = ''2007''
and tx_time > trunc(sysdate) and tx_time < trunc(sysdate + 1)
group by MERCHANT_NAME
),
cc as (
select (aa.中獎 - bb.投注) 平台虧損, aa.TGI_ID
from aa left join bb on aa.TGI_ID = bb.TGI_ID
where (aa.TGI_ID=9 AND (aa.中獎 - bb.投注) >= 80000)
or (aa.TGI_ID!=9 AND (aa.中獎 - bb.投注) >= 50000)
),
dd as (
select TGI_ID, ACCOUNTS, SUM(CASE WHEN BILL_TYPE=2005 THEN AMOUNT WHEN BILL_TYPE=2007 THEN -AMOUNT ELSE 0 END) 平台虧損 from LOTT_new_A3D1.LOTT_3RD_ACCOUNTS_BILL_DATA
where bill_time > trunc(sysdate) and bill_time < trunc(sysdate + 1)
group by TGI_ID, ACCOUNTS
UNION ALL
select decode(MERCHANT_NAME,''KAIYUAN'',7, ''FMC'', 8, 0) TGI_ID, ACCOUNT_NAME as ACCOUNTS, SUM(CASE WHEN TX_TYPE=2005 THEN TX_AMOUNT WHEN TX_TYPE=2007 THEN TX_AMOUNT ELSE 0 END) 平台虧損 from LOTT_NEW_A3D1.LOTT_EXT_GAME_TX
where tx_time > trunc(sysdate) and tx_time < trunc(sysdate + 1)
group by MERCHANT_NAME, ACCOUNT_NAME
)

select
(case TGI_ID
        WHEN 1 THEN ''MGS''
        WHEN 2 THEN ''LX''
        WHEN 3 THEN ''連環奪寶''
        WHEN 4 THEN ''PT''
        WHEN 6 THEN ''TTG''
        WHEN 7 THEN ''KY''
        WHEN 8 THEN ''FMC''
        WHEN 9 THEN ''AG''
END)供應商, ACCOUNTS ,平台虧損 from (
select TGI_ID,ACCOUNTS,平台虧損 from (
select * from (
select ROW_NUMBER() OVER(PARTITION BY TGI_ID ORDER BY 平台虧損 desc) rn, dd.* from dd
where 平台虧損 > 0
and TGI_ID in (select TGI_ID from cc))
where rn <= 10
)
UNION ALL
select cc.TGI_ID,null, cc.平台虧損 from cc)
order by TGI_ID, 平台虧損 desc','5','','riel_john','2020-02-05 19:19:59','kimberlyclaire','2020-03-08 13:27:31','344','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','DAU','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-322','',' PF1 have encode a game that UB haven''t open yet',' PF1 PED 推送了一個尚未開啟的遊戲','【 L1 Actions 】
1. check with PED, if the game is opening
2. if it''s opening call L2 and Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-322> , PF1, PED 推送了一個尚未開啟的遊戲 ], after L2 confirmed proceed the following steps
3. Post the sceenshot to SLA 1.0 and @John.J
4. Remove the game from sql
5. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf1-sec','1.0','0 0/1 * * * ?','select aa.NUMERO,aa.WIN_NO,aa.SORTID,aa.WIN_DATE,bb.PARAM_ONE from (
select NUMERO,WIN_NO,SORTID,WIN_DATE from lott_new_a3d1.LOTT_MANAUL_TEMP
where sortid in (
select GROUP_VALUE as sortid  from lott_new_a3d1.LOTT_GROUP_SERIES
where PARAM_ONE in
(
--''CQSSC'',
--''JSK3'',
--''FC3D'',
--''SHSSL'',
--''JX11X5'',
--''TCP3P5'',
--''SD11X5'',
--''XJSSC'',
--''TJSSC'',
--''HLJSSC'',
--''GD11X5'',
--''BJKL8'',
''BJPK10''
))
and WIN_DATE > sysdate -20/24/60
and WIN_DATE < sysdate
and WIN_NO is not null
and WIN_NO not like ''%x%''
order by WIN_DATE desc ) aa
left join ( select GROUP_VALUE,PARAM_ONE  from lott_new_a3d1.LOTT_GROUP_SERIES ) bb
on aa.SORTID = bb.GROUP_VALUE','5','','raphael','2020-03-13 17:08:52','Nikki.o','2020-10-06 16:28:55','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','PD','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-323','',' PF2 PED have encode a game that UB haven''t open yet',' PF2 PED 推送了一個尚未開啟的遊戲','【 L1 Actions 】
1. check with PED, if the game is opening
2. if it''s opening call L2and Copy to AS Teams [ Hi L2, CMS <URG-CAL2-MID-323> , PF2, PED 推送了一個尚未開啟的遊戲 ], after L2 confirmed proceed the following steps
3. Post the sceenshot to SLA 2.0 and @Sandy.C
4. remove the game from sql','0','ub8-pf5-core-sec','5.0','0 0/1 * * * ?','select * from (select NUMERO_NO,WIN_NO,WIN_TIME,GAME_CODE from draw.DCS_SB_NUMERO
union
select NUMERO_NO,WIN_NO,WIN_TIME,GAME_CODE from draw.DCS_K3_NUMERO
union
select NUMERO_NO,WIN_NO,WIN_TIME,GAME_CODE from draw.DCS_UB8_NUMERO
union
select NUMERO_NO,WIN_NO,WIN_TIME,GAME_CODE from draw.DCS_SSC_NUMERO
union
select NUMERO_NO,WIN_NO,WIN_TIME,GAME_CODE from draw.DCS_KENO_NUMERO
union
select NUMERO_NO,WIN_NO,WIN_TIME,GAME_CODE from draw.DCS_LF_NUMERO
union
select NUMERO_NO,WIN_NO,WIN_TIME,GAME_CODE from draw.DCS_11X5_NUMERO )
where GAME_CODE in (
--''CQSSC'',
--''JSK3'',
--''JSSB'',
--''FC3D'',
--''SHSSL'',
--''JX11*5'',
--''SH11X5'',
--''TP3P5'',
--''SD11X5'',
--''XJSSC'',
--''TJSSC'',
--''HLJSSC'',
--''GD11X5'',
''BJPK10''
--''BJKL8'',
--''BJ5FC''
)
and WIN_TIME > sysdate -20/24/60
and WIN_TIME < sysdate
and WIN_NO is not null
and WIN_NO not like ''%x%''
order by WIN_TIME desc','5','','raphael','2020-03-13 17:37:10','Nikki.o','2020-10-06 16:29:35','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','PD','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-326:EID-350','ASI-16468',' PF2.0 Monitor ThirdParty:AG TYPE:2100',' 第三方:AG 資料類型:2100(對賭','[English Description]
export lott_3rd_accounts_bill_data which type is 2100

[中文]
在對賭情況下type 2100紀錄客戶輸分，用以扣除2005贏分，
以達到AG對帳的一致性','0','ub8-pf5-core-sec','5.0','0 0 10 * * ?','select *
from core.lott_3rd_accounts_bill_data
where TGI_ID = 9
and bill_type = 2100
and bill_time > sysdate -1','5','','lance','2020-07-07 11:38:14','kimberlyclaire','2020-07-26 21:04:59','350','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','OP','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-327','',' PF1 FC3D have a price change number',' PF1 FC3D產生變價號碼','【 L1 Actions 】
1. Try bet on those number, if the series equals to 1800 it''s normal, if not proceed step 2
2. Copy to AS-OD General [ Hi OD, Please be noted there is an unexpected price changing in 1.0 FC3D ]
3. call L2
4. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf1-sec','1.0','0 0 0/1 * * ?','select NUMERO,NUM,PRICE from lott_new_a3d1.LOTT_CHANGED_PRICE
where SORITID = 3
and numero like ( select CNUMERO from lott_new_a3d1.LOTT_CURRENT_NUMERO where SORTID= 3 )
and PRICE != 0','5','','raphael','2020-07-18 21:09:12','Nikki.o','2020-10-06 16:30:39','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CAL2-MID-328','',' PF1 checking ORA error',' PF1 檢查ORA報錯','【 L1 Actions 】
1. If the context include failed or ORA-01502，call L2. Copy to AS Teams [ Hi L2, CMS <NU-CAL2-MID-328> , PF1, 檢查ORA報錯 ]
2. If happens only once, just post to AS-General
3. If alert continually, create an ASI for this MID and post it on AS General, call L2','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','select * from lott_new_a3d1.LOTT_OPER_LOG
where OPER_CONTEXT like ''%ORA%''
and OPER_TIME > sysdate -5/24/60
order by OPER_TIME desc','5','','raphael','2020-09-03 20:17:38','raphael','2020-11-21 21:37:09','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-329','',' PF2 Test account apply deposit and money have been arrival',' PF2 測試帳號申請充值，且已到帳','【 L1 Actions 】
1. Copy to AS Teams and AS-OD General [ Hi! PF2 測試帳號申請充值，且已到帳檢查是否異常，異常請通知PED索取第三方交易明細]','0','ub8-pf5-core-sec','5.0','0 0 */1 * * ?','--與MID313差別在此為撈取內部總代代理鍊以及內部測試帳號標籤
select RECORD_ID 平台訂單號, DP_TRANSACTION_ID PED訂單號, CUSTOMER_NAME 帳號, ARRIVAL_AMOUNT 金額,ARRIVAL_TIME 時間
from core.BPS_DEPOSIT_RECORD_VW
where status=1
and (CUSTOMER_ID in (
SELECT CUSTOMER_ID FROM CORE.US_CUSTOMER_GROUP_MAPPER WHERE GROUP_ID in (''39'',''44''))
or CUSTOMER_ID in (
select customer_id from core.US_CUSTOMER_PROFILE_vw  where LEVEL_ID like ''202716%''))
and ARRIVAL_TIME > TRUNC(sysdate)','5','','lance','2020-09-09 15:27:39','lance','2021-01-07 22:42:33','','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CHK-MID-330','',' PF2 game win result delay',' PF2 自主彩开奖延迟','【 L1 Actions 】
1.Copy to AS Teams [ Hi L2, CMS <URG-CHK-MID-330> , PF2 自主彩开奖延迟 ]
2. Check the games on the alert if there''s draw delay, call L2 if there''s delay
4. Create an ASI for this urgent MID and post it on AS General','0','ub8-pf5-core-sec','5.0','44 0/2 * * * ?','WITH AA AS (
SELECT
   GAME_CODE,
   MAX( WINNING_TIME ) AS MAX_WIN_TIME,
   MAX( NUMERO ) AS MAX_NUMERO,
   MAX( REWARD_STATUS ) AS REWARD_STATUS,
   MAX( CREATE_TIME ) AS MAX_RUN_TIME,
   MIN( LOG_STEP ) AS MIN_LOG_STEP,
   MAX( CASE WHEN LOG_STEP <> ''17'' THEN LOG_STEP END )   AS MAX_LOG_STEP,
   MAX( CASE WHEN LOG_STEP NOT IN ( 8 , 17 ) THEN NUMERO END ) AS STUCK_NUMERO
FROM CORE.LGS_DRAW_NUMBER_RESULT
WHERE CREATE_TIME + 2/24 > SYSDATE
AND GAME_CODE LIKE ''UU%''
 AND GAME_CODE NOT IN ( ''UUBJ5FC'',''UUKENO'')
GROUP BY GAME_CODE
ORDER BY 2 DESC
)

SELECT *
FROM(
SELECT
  AA.*,
   CASE WHEN REWARD_STATUS <> 1 THEN ''DRAW STUCK''
   WHEN GAME_CODE IN ( ''UU30S'' ,''UUFFC'', ''UUFF11X5'', ''UU30S11X5'',''UUFF3D'',''UUFFPK10'', ''UUSB'',''UU30SKENO'',''UUFFKENO'') AND  ( SYSDATE - CAST( MAX_WIN_TIME AS DATE )  )*24*60 > 2 THEN ''TOO LONG TIME NO WIN RESULT''
   WHEN GAME_CODE IN ( ''UU2F11X5'',''UU2FC'') AND  ( SYSDATE - CAST( MAX_WIN_TIME AS DATE )  )*24*60 > 3 THEN ''TOO LONG TIME NO WIN RESULT''
   WHEN GAME_CODE NOT IN ( ''UU30S'' ,''UUFFC'', ''UUFF11X5'' , ''UU2FC'' , ''UU2F11X5'',''UU30S11X5'',''UUFF3D'',''UUFFPK10'', ''UUSB'',''UU30SKENO'',''UUFFKENO'') AND  ( SYSDATE - CAST( MAX_WIN_TIME AS DATE )  )*24*60 > 10 THEN ''TOO LONG TIME NO WIN RESULT''
   ELSE ''NORMAL'' END AS REMARK
FROM AA
)
WHERE REMARK<>''NORMAL''','5','','kolin','2020-11-20 16:12:18','kolin','2021-08-08 08:30:44','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-331:EID-352','',' PF1 MGS2 ''REFUND'' type data',' PF1 MGS2 ''退款'' 數據','【 L1 Actions 】
1. Callback alert','0','ub8-pf1-sec','1.0','0 0 9 * * ?','select ACCOUNT_NAME 帳號,MERCHANT_NAME 供應商,TX_AMOUNT 退款額度,TX_TIME 時間
from lott_new_a3d1.LOTT_EXT_GAME_TX
where MERCHANT_NAME =  ''MGS2''
and TX_GAME_INFO like ''%REFUND%''
and TX_TIME > trunc(sysdate -1) and TX_TIME  < trunc(sysdate)','5','','lance','2020-11-25 13:47:36','kimberlyclaire','2021-02-10 09:05:46','352','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','OP','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-332','',' PF2 JY8 Lottery Game Draw Early',' PF2 獎源8彩種提早入號','【 L1 Actions 】
1. If alert appears during maintenance time, please ignore.
2.If TWBGS lottery game draw early. please refer to this wiki sched:
https://wiki.yxunistar.com/x/6R1pB
3.Call L2 and inform that PF2 JY8 Lottery Game Draw Delay
4.Copy to Application Support (AS) General [ CMS
 &lt;URG-CAL2-MID-332&gt;, PF2 &#39;Game name&#39; 提早入號 ]
5. Assist L2 to call DEV if necessary. please refer to this wiki sched: https://wiki.yxunistar.com/x/RoCXAQ
6. Create an ASI for this urgent MID and post it on AS General

【 L2 Actions 】
1.確認獎源8彩種是否正常，通知PD關閉彩種，聯繫RD','0','ub8-pf5-core-sec','5.0','0 */10 * * * ?','select GAME_CODE,max(WIN_TIME),max(NUMERO_NO) from draw.DCS_SSC_NUMERO
where  GAME_CODE in (''TB2F'', ''TXFFC'', ''CQSSC'', ''HLJSSC'', ''TJSSC'', ''SHSSL'', ''BJ5FC'', ''TWBGS'')
and FIRST_INPUT_NO is not null
group by GAME_CODE
having max(WIN_TIME) > sysdate
union all
select GAME_CODE,max(WIN_TIME),max(NUMERO_NO) from draw.DCS_PK_NUMERO
where  GAME_CODE in (''XYFT'', ''BJPK10'')
and FIRST_INPUT_NO is not null
group by GAME_CODE
having max(WIN_TIME) > sysdate
union all
select GAME_CODE,max(WIN_TIME),max(NUMERO_NO) from draw.DCS_KENO_NUMERO
where  GAME_CODE in (''BJKL8'')
and FIRST_INPUT_NO is not null
group by GAME_CODE
having max(WIN_TIME) > sysdate','5','','kevin','2021-01-12 17:47:51','',null,'','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-333','',' PF1 JY8 Lottery Game Draw Early',' PF1 獎源8彩種提早入號','【 L1 Actions 】
1.Call L2 and inform that PF1 JY8 have a early
2.Copy to Application Support (AS) General [ CMS &lt;URG-CAL2-MID-297&gt;, PF1 JY8 提早入號 ]
3. Assist L2 to call DEV if necessary. please refer to this wiki sched: https://wiki.yxunistar.com/x/RoCXAQ
4. If alert appears during maintenance time, please ignore.
5. Create an ASI for this urgent MID and post it on AS General
6.Check https://www.jy8web.com/lotteryList
【 L2 Actions 】
1.若是獎源8彩種入獎提早，L2確認問題後立即Call DEV/TA duty','0','ub8-pf1-sec','1.0','0 0/10 * * * ?','select * from (select t.NUMERO ,t.WIN_DATE,s.REMARK,s.PARAM_ONE,t.OPERTIME1,t.OPERTIME2,t.STATE,t.WIN_NO1,t.WIN_NO2,t.WIN_NO, count(*) over () cnt
from LOTT_NEW_A3D1.LOTT_GROUP_SERIES s
inner join LOTT_NEW_A3D1.LOTT_MANAUL_TEMP t on t.SORTID = s.GROUP_VALUE
where s.PARAM_ONE in (''TB2F'',''TXFFC'',''CQSSC'',''BJKL8'',''SHSSL'',''TJSSC'',''HLJSSC'')
and t.WIN_DATE > sysdate
and t.WIN_NO is not null )
where cnt > 1','5','','kevin','2021-01-12 18:56:31','',null,'','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-335:EID-357','ASI-16896','Withdraw, PED didn''t callback more than 7 days','提現卡在審核通過超過七天','Withdraw status is audit passed  but PED didn''t callback more than 7 days','0','ub8-pf5-core-sec','5.0','0 0 13 * * ?','select UB_ORDER_ID 流水號,CUSTOMER_NAME 客戶名,CREATE_TIME 創建時間,UPDATE_TIME 更新時間
from core.BPS_WITHDRAW_RECORD_VW where STATUS = 1
and REQUEST_TIME < sysdate -7 and REQUEST_TIME	> sysdate -180','5','','lance','2021-02-19 18:01:37','lance','2021-07-20 09:19:50','357','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-337:EID-347',' ASI-16221',' Withdrawal Frequency Monitoring','  PF1提现次数监控','Withdrawal Frequency Monitoring','0','ub8-pf1-sec','1.0','0 0 0/1 * * ?','with aa as (select a.ACCOUNTS, a.AMOUNT, a.REQ_TIME, a.STATE, case when b.VIP_GID is null then ''NO'' else ''YES'' end as VIP from LOTT_NEW_A3D1.LOTT_ATM_REQ a inner join LOTT_NEW_A3D1.LOTT_VW_MEMBER_INFO b on a.accounts=b.accounts)
select * from (select accounts,vip, sum(amount) as total_amount, count(*) as number_of_withdrawal from aa where REQ_TIME >= trunc(sysdate) and STATE=2 group by accounts, vip) a where NUMBER_OF_WITHDRAWAL>5','5','','lance','2021-03-31 11:21:10','lance','2021-03-31 11:26:43','347','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','DAU','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('CB-MID-338:EID-348',' ASI-16221',' PF2 ASI-16221 Withdrawal Frequency Monitoring',' PF2 ASI-16221 提现次数监控','(MID-338:EID-348) PF2 ASI-16221 Withdrawal Frequency Monitoring','0','ub8-pf5-core-sec','5.0','0 0 0/1 * * ?','with list as (select customer_name, customer_id , count(*) times from core.BPS_WITHDRAW_RECORD_VW
where REQUEST_TIME >= trunc(sysdate)
and STATUS = 4
group by customer_name, customer_id
having count(*)>5)
select list.customer_name, list.times,decode(mapper.customer_id, null, ''REGULAR'', ''VIP'') as VIP from list left join core.US_CUSTOMER_GROUP_MAPPER mapper on list.customer_id = mapper.customer_id and mapper.GROUP_ID=45','5','','lance','2021-03-31 11:29:31','lance','2021-03-31 11:30:22','348','1','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','DAU','1','CB',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CHK-MID-339','ASI-17796','PF1 Monitor bulk test login of IP or UUID','PF1 監控進行大量測試登入的IP或UUID','【 L1 Actions 】
1.Monitor bulk test login of IP or UUID.write down the IP or UUID.find the corresponding account in the log of normal login.pay high attention to
監控大量測試登入的IP或UUID，將IP或UUID記下，到正常登入的日誌找出對應帳號，進行關注

2.Copy to AS General and AS-RC on Teams [CMS <URG-CHK-MID-339>，PF1, 有特定IP or UUID发生【登入错误次数】or【用不存在的帐号】尝试登入平台 > 20次，接着有相同IP or UUID登入成功，须关注]

3. Do SOP: https://wiki.yxunistar.com/x/nz9pB','0','ub8-pf1-sec','1.0','0 0 0/1 * * ?','SELECT accounts
FROM   lott_new_a3d1.accounts_login_logs
WHERE  uuid IN (SELECT uuid
                FROM   lott_new_a3d1.lott_login_logs_fail
                WHERE  login_time > sysdate - 1 / 24
                       AND remarks IN (
''登录失败原因: 您输入的账号不存在，请重新输入！'',
''登录失败原因: 您輸入的帳號不存在，請重新輸入！'' )
 GROUP  BY uuid
 HAVING Count(1) > 20)
AND login_time > sysdate - 1 / 24
GROUP  BY accounts
UNION ALL
SELECT accounts
FROM   lott_new_a3d1.accounts_login_logs
WHERE  login_ip IN (SELECT login_ip
                    FROM   lott_new_a3d1.lott_login_logs_fail
                    WHERE  login_time > sysdate - 1 / 24
                           AND remarks IN (
       ''登录失败原因: 您输入的账号不存在，请重新输入！'',
       ''登录失败原因: 您輸入的帳號不存在，請重新輸入！'' )
        GROUP  BY login_ip
        HAVING Count(1) > 20)
       AND login_time > sysdate - 1 / 24
GROUP  BY accounts','5','','mickey','2021-04-16 16:25:54','jason','2021-05-28 09:27:24','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-340','ASI-17793','PF2 Monitor transfer to SASB','PF2 体育钱包转账监控','【 L1 Actions 】
1.Copy to AS General and AS-RC on Teams [ CMS ，PF2, SABA轉賬金額過高、转账金额>50000 ]','0','ub8-pf5-core-sec','5.0','0 0/15 * * * ?','select CUSTOMER_NAME,AMOUNT,TX_TIME,GAME_CODE
from CORE.ACS_TRANSACTION
where TX_TYPE_ID=2008
and ACCOUNT_TYPE_ID =2
and GAME_CODE=''SABA''
and AMOUNT>50000
and TX_TIME > SYSDATE-15/24/60','5','','mickey','2021-04-19 12:04:55','mickey','2021-08-06 14:58:42','358','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CHK',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-341','ASI-18034','PF2 All 5 straight win a lottery','PF2 五星直選中獎訂單告警','【 L1 Actions 】
1.Copy to AS General and AS-RC on Teams [ CMS ，PF2, 五星直選中獎訂單告警 ]','0','ub8-pf5-core-sec','5.0','0 0/5 * * * ?','SELECT D.CUSTOMER_NAME,M.ORDER_NUM,M.CREATE_TIME,D.DRAW_TIME,D.STATUS,D.GAME_CODE,D.ACTUAL_BET_AMOUNT,D.WIN_AMOUNT
FROM CORE.LGS_ORDER_MASTER M
LEFT JOIN CORE.LGS_ORDER_DETAIL D ON D.ORDER_MASTER_ID = M.ORDER_MASTER_ID
LEFT JOIN CORE.LGS_ORDER_INFO I ON I.ORDER_MASTER_ID = M.ORDER_MASTER_ID
LEFT JOIN CORE.LGS_PLAY_INFO PI ON PI.PLAY_ID = I.PLAY_ID
LEFT JOIN CORE.LGS_PLAY_DETAIL PD ON PD.PLAY_DETAIL_ID = PI.PLAY_DETAIL_ID
WHERE D.STATUS=4 AND (PD.REMARK = ''五星直選'' OR PD.REMARK =''五星直选'') AND D.ACTUAL_BET_AMOUNT*10000<D.WIN_AMOUNT AND D.WIN_AMOUNT>20000 AND
D.DRAW_TIME BETWEEN (sysdate-6/24/60) AND ((sysdate-1/24/60))
GROUP BY D.CUSTOMER_NAME,M.ORDER_NUM,M.CREATE_TIME,D.DRAW_TIME,D.STATUS,D.GAME_CODE,D.ACTUAL_BET_AMOUNT,D.WIN_AMOUNT
ORDER BY CREATE_TIME DESC','5','','mickey','2021-05-26 14:39:53','kimberlyclaire','2021-06-11 14:58:38','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-342','ASI-18033','PF1 All 5 straight win a lottery','PF1 五星直选中奖订单告警','【 L1 Actions 】
1.Copy to AS General and AS-RC on Teams [ CMS ，PF1, 五星直选中奖订单告警]','0','ub8-pf1-sec','1.0','0 2/5 * * * ? ','SELECT
	t1.accounts,
	t1.restarno AS orderno,
	t1.numero,
	t6.PARAM_ONE AS game_code ,
	t3.SINGLE_WIN_PRICE total_winprice ,
	(t1.total_amount / t1.total_num)* t1.total_times*t2.BET_NUM AS bet_amount,
	t3.win_number AS winno,
	t4.play_name
FROM
	(
	SELECT
		a.accounts,
		a.orderno ,
		a.restarno,
		a.numero,
		a.total_num,
		a.total_times,
		a.total_amount,
		a.total_winprice,
		a.sortid
	FROM
		LOTT_NEW_A3D1.lott_fc3d_order_main a
	WHERE
		BET_TIME BETWEEN (sysdate-5/24/60) AND sysdate
		AND status IN (''004'', ''020'') ) t1,
	LOTT_NEW_A3D1.lott_SSC_order_detail t2,
	LOTT_NEW_A3D1.lott_fc3d_order_data t3,
	LOTT_NEW_A3D1.lott_play_menu t4,
	LOTT_NEW_A3D1.lott_win_records t5,
	LOTT_NEW_A3D1.LOTT_GROUP_SERIES t6
WHERE
	t1.restarno = t2.orderno
	AND t3.pid = t2.gid
	AND t1.orderno = t3.orderno
	AND t4.play_id || ''.'' || t4.gpid = t2.sortid
	AND t5.numero = t1.numero
	AND t5.STATE = ''0''
	AND t1.sortid = t5.sortid
	AND t1.sortid = t6.GROUP_VALUE
	AND (t4.play_name LIKE ''%五星直选%''
		OR t4.play_name LIKE ''%五星直選%'' )
	AND t3.SINGLE_WIN_PRICE > 10000
	AND t3.SINGLE_WIN_PRICE > (t1.total_amount / t1.total_num)* t1.total_times*t2.BET_NUM * 10000','5','','kolin','2021-05-27 16:58:06','riel_john','2021-06-11 15:26:00','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-345','ASI-18479',' PF2 Service Connection Exception',' PF2 PF2近5mins無登入/訂單數據','This is to monitor whether the DB has data written from the android 、ios or web page.
【 L1 Actions 】
1. This monitor will show all of device login record in past few minutes. In normal case, we should see 3 of devices (ANDROID,IOS,WEB)
2. Check if you can login to frontend for the missing  device . If normal, inform on Telegram.
3. If not normal, copy to AS Teams [ Hi L2, CMS <NU-CHK-MID-345>，PF2 (fill a missing device record)服務連接異常 ] with the screenshot of issue.','0','ub8-pf5-core-sec','5.0','0 0/5 * * * ?','---登入、訂單、使用者事件
SELECT LISTAGG(DEVICE,'','') WITHIN GROUP(ORDER BY DEVICE) AS DEVICE
FROM(
SELECT DEVICE
FROM(
SELECT UPPER(DEVICE_USER_AGENT) DEVICE,COUNT(*) COUNT
FROM CORE.US_CUSTOMER_LOGIN_LOG
WHERE LOGIN_TIME > SYSDATE-5/24/60
GROUP BY DEVICE_USER_AGENT

UNION
SELECT UPPER(DEVICE) DEVICE,COUNT(*) COUNT
FROM CORE.LGS_ORDER_MASTER
WHERE CREATE_TIME > SYSDATE-5/24/60
GROUP BY DEVICE

UNION
SELECT UPPER(DEVICE) DEVICE,COUNT(*) COUNT
FROM CORE.UE_USER_EVENT_MASTER
WHERE CREATE_TIME > SYSDATE-5/24/60 AND EVENT=''login''
GROUP BY DEVICE
) GROUP BY DEVICE HAVING DEVICE IN(''ANDROID'',''IOS'',''WEB'')
)','1','ANDROID,IOS,WEB','mickey','2021-07-30 12:38:37','jason','2021-08-10 12:32:12','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','2','AS','1','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('NU-CHK-MID-347','ASI-18436',' PF1 Service Connection Exception',' PF1 近5mins無登入/訂單數據','This is to monitor whether the DB has data written from the app or web page.
【 L1 Actions 】
1. This monitor will show all of device login record in past few minutes. In normal case, we should see 2 of devices (APP,WEB)
2. Check if you can login to frontend for the missing  device . If normal, inform on Telegram.
3. If not normal, copy to AS Teams [ Hi L2, CMS &lt;NU-CHK-MID-347&gt;，PF1 (fill a missing device record)服務連接異常 ] with the screenshot of issue.','0','ub8-pf1-sec','1.0','0 0/5 * * * ?','SELECT LISTAGG(DEVICE,'','') WITHIN GROUP(ORDER BY DEVICE) AS DEVICE
FROM(
SELECT DEVICE
FROM (
SELECT UPPER(LOGINWAY) DEVICE,COUNT(*) COUNT
FROM LOTT_NEW_A3D1.ACCOUNTS_LOGIN_LOGS
WHERE LOGIN_TYPE=0 AND LOGIN_TIME>SYSDATE-5/60/24
GROUP BY LOGINWAY

UNION
SELECT UPPER(LOGIN_WAY),COUNT(*)
FROM LOTT_NEW_A3D1.LOTT_LOGIN_LOGS_FAIL
WHERE MODIFY_TYPE NOT IN (1,6,7) AND LOGIN_TIME>SYSDATE-5/60/24
GROUP BY LOGIN_WAY

UNION
SELECT UPPER(DEVICE),COUNT(*)
FROM LOTT_FC3D_ORDER_MAIN
WHERE BET_TIME>SYSDATE-5/60/24
GROUP BY DEVICE
)
GROUP BY DEVICE
HAVING DEVICE IN(''APP'',''WEB'')
)','1','APP,WEB','mickey','2021-08-09 16:38:12','mickey','2021-08-10 15:28:13','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','1','CAL2',null);
INSERT INTO moni_job (ASID,TICKET_NUMBER,EN_NAME,CH_NAME,DESCR,STATUS,JDBC,PLATFORM,CRON_EXPRESSION,SCRIPT,AUTO_MATCH,EXPECTED_RESULT,CREATE_BY,CREATE_TIME,UPDATE_BY,UPDATE_TIME,REL_EXPORT,TELEGRAM_ALERT,TELEGRAM_INFO,TELEGRAM_CONFIG,REQUESTER,PRIORITY,ACTION_ITEM,LAST_ALERT) VALUES
('URG-CAL2-MID-348','ASI-18564',' PF1 Job member group scheduling task fail',' PF1會員組自動化排成失敗','【 L1 Actions 】
1. Copy to Telegram and AS Teams [ Hi L2, CMS &lt;URG-CAL2-MID-348&gt;，PF1，是緊急的，會員組自動化排成失敗 ]
2.Create an ASI for this urgent
【 L2 Actions 】
1.開LOTTERY單給開發
2.通知1.0生产群&gt;1.0 生產問題討論群','0','ub8-pf1-sec','1.0','0 5 2  * * ?','select * from LOTT_NEW_A3D1.LOTT_UB_JOB_LOG
where REASON not in ''成功''
order by GID desc','5','','mickey','2021-08-10 12:23:45','mickey','2021-08-10 12:24:36','','0','*DB Monitor ID({id})/{platform}/{env}*
*{asid}/{priority}*
*{en_name}/{zh_name}*','1','AS','0','CAL2',null);