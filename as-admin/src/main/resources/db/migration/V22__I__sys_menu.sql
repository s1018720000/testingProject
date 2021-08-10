-- 一级

insert into sys_menu values('8', '导航书签', '導航書簽', 'Bookmark', '0', '5', '/as/bookmarks',             'menuItem',          'C', '0', '1', 'bookmarks:as:view', 'fa fa-bookmark',           'admin', sysdate(), '', null, '导航书签菜单');

-- 二级

insert into sys_menu values('123',  '最常使用', '最常使用', 'Most Used', '8', '1', '#',          '', 'M', '1', '1', '',         'fa fa-star',          'admin', sysdate(), '', null, '最常使用目录');
insert into sys_menu values('124',  '优游彩票1.0', '優遊彩票1.0', 'Platform 1.0', '8', '2', '#',          '', 'M', '1', '1', '',         'fa fa-star',          'admin', sysdate(), '', null, '优游彩票1.0目录');
insert into sys_menu values('125',  '优游彩票5.0', '優遊彩票5.0', 'Platform 5.0', '8', '3', '#',          '', 'M', '1', '1', '',         'fa fa-star',          'admin', sysdate(), '', null, '优游彩票5.0目录');
insert into sys_menu values('126',  '监控系统', '監控系統', 'MONITORING', '8', '4', '#',          '', 'M', '1', '1', '',         'fa fa-star',          'admin', sysdate(), '', null, '监控系统目录');
insert into sys_menu values('127',  '日志记录', '日志记录', 'LOG', '8', '5', '#',          '', 'M', '1', '1', '',         'fa fa-star',          'admin', sysdate(), '', null, '日志记录目录');
insert into sys_menu values('128',  '第三方后台', '第三方後臺', '3RD BACKEND', '8', '6', '#',          '', 'M', '1', '1', '',         'fa fa-star',          'admin', sysdate(), '', null, '第三方后台目录');
insert into sys_menu values('129',  'WIKI', 'WIKI', 'WIKI', '8', '7', '#',          '', 'M', '1', '1', '',         'fa fa-star',          'admin', sysdate(), '', null, '最常使用目录');

-- 三级

insert into sys_menu values('3000',  'Shared Password', 'Shared Password', 'Shared Password', '123', '1', 'https://wiki.yxunistar.com/x/NYo4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Shared Password');
insert into sys_menu values('3001',  'PF1 Sanity Test', 'PF1 Sanity Test', 'PF1 Sanity Test', '123', '2', 'https://wiki.yxunistar.com/x/aYo4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF1 Sanity Test');
insert into sys_menu values('3002',  'PF2 Sanity Test', 'PF2 Sanity Test', 'PF2 Sanity Test', '123', '3', 'https://wiki.yxunistar.com/x/05E4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF2 Sanity Test');
insert into sys_menu values('3003',  'Delete Exception', 'Delete Exception', 'Delete Exception', '123', '4', 'https://wiki.yxunistar.com/x/EYo4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Delete Exception');
insert into sys_menu values('3004',  'Manual Deposit', 'Manual Deposit', 'Manual Deposit', '123', '5', 'https://wiki.yxunistar.com/x/kow4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Manual Deposit');
insert into sys_menu values('3005',  'KY Manual Rollback', 'KY Rollback', 'KY Rollback', '123', '6', 'https://wiki.yxunistar.com/x/Vl6JAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'KY Rollback');
insert into sys_menu values('3006',  'PT2 Manual Rollback', 'PT2 Rollback', 'PT2 Rollback', '123', '7', 'https://wiki.yxunistar.com/x/fo84', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PT2 Rollback');
insert into sys_menu values('3007',  'MGS2 Manual Rollback', 'MGS2 Rollback', 'MGS2 Rollback', '123', '8', 'https://wiki.yxunistar.com/x/Jgk-B', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'MGS2 Rollback');
insert into sys_menu values('3008',  'Modify Withdraw Status', 'Modify Withdraw Status', 'Modify Withdraw Status', '123', '9', 'https://wiki.yxunistar.com/x/0wiJAw', 'menuBlank', 'C', '0', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Modify Withdraw Status');
insert into sys_menu values('3009',  'AS Monitor', 'AS Monitor', 'AS Monitor', '123', '10', 'https://asmonitor.nuttli.com/asmonitor/index.do', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AS Monitor');
insert into sys_menu values('3010',  'ASI Ticket', 'ASI Ticket', 'ASI Ticket', '123', '11', 'https://jira.my-cpg.com/secure/Dashboard.jspa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'ASI Ticket');
insert into sys_menu values('3011',  'Jenkins', 'Jenkins', 'Jenkins', '123', '12', 'http://jenkins.nuttli.com/', 'menuBlank', 'C', '0', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Jenkins');
insert into sys_menu values('3012',  'PF1 Kibana', 'PF1 Kibana', 'PF1 Kibana', '123', '13', 'http://pf1kibana2.nuttli.com/app/discover#/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF1 Kibana');
insert into sys_menu values('3013',  'PF2 Kibana', 'PF2 Kibana', 'PF2 Kibana', '123', '14', 'http://pf2kibana.nuttli.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF2 Kibana');
insert into sys_menu values('3014',  'JKB', 'JKB', 'JKB', '123', '15', 'https://www.jiankongbao.com/users/login', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'JKB');
insert into sys_menu values('3015',  'Top 10 URL Log', 'Top 10 URL Log', 'Top 10 URL Log', '123', '16', 'https://drive.google.com/drive/folders/128e_ucU2-7PI63BNLo0YCLLrVBgOU9WJ', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Top 10 URL Log');
insert into sys_menu values('3016',  'GYM Record', 'GYM Record', 'GYM Record', '123', '17', 'https://docs.google.com/spreadsheets/d/1KsfGGf1unqAQCdTssnp_YKFCyEBh6bRfqhUc6gQGeyc/edit#gid=2096506886', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'GYM Record');
insert into sys_menu values('3017',  'Manual Rollback Record', 'Manual Rollback Record', 'Manual Rollback Record', '123', '18', 'https://docs.google.com/spreadsheets/d/1ZLkKKhE38m6Nn0Z9t7g2QlXLeRc0CWwwsAjc-ZVdcBs/edit#gid=0', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Manual Rollback Record');

-- PF1

insert into sys_menu values('3018',  '生产环境', '生產環境', 'Production', '124', '1', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '生产环境');
insert into sys_menu values('3019',  '内部', '內部', 'INTERNAL', '124', '2', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '內部');
insert into sys_menu values('3020',  'DEV', 'DEV', 'DEV', '124', '3', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'DEV');
insert into sys_menu values('3021',  'SIT', 'SIT', 'SIT', '124', '4', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'SIT');
insert into sys_menu values('3022',  'UAT', 'UAT', 'UAT', '124', '5', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'UAT');
insert into sys_menu values('3023',  'QA', 'QA', 'QA', '124', '6', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'QA');

-- PF2

insert into sys_menu values('3024',  '生产环境', '生產環境', 'Production', '125', '1', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '生产环境');
insert into sys_menu values('3025',  '内部', '內部', 'INTERNAL', '125', '2', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '內部');
insert into sys_menu values('3026',  'DEV', 'DEV', 'DEV', '125', '3', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'DEV');
insert into sys_menu values('3027',  'SIT', 'SIT', 'SIT', '125', '4', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'SIT');
insert into sys_menu values('3028',  'UAT', 'UAT', 'UAT', '125', '5', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'UAT');
insert into sys_menu values('3029',  'QA', 'QA', 'QA', '125', '6', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'QA');

-- MONITORING

insert into sys_menu values('3030',  'AS监控', 'AS監控', 'AS MONITOR', '126', '1', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'AS监控');
insert into sys_menu values('3031',  'JIRA', 'JIRA', 'JIRA', '126', '2', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'JIRA');
insert into sys_menu values('3032',  'ZABBIX', 'ZABBIX', 'ZABBIX', '126', '3', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'ZABBIX');
insert into sys_menu values('3033',  'WEBLOGIC', 'WEBLOGIC', 'WEBLOGIC', '126', '4', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'WEBLOGIC');
insert into sys_menu values('3034',  'JENKINS', 'JENKINS', 'JENKINS', '126', '5', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'JENKINS');
insert into sys_menu values('3035',  'GRAFANA', 'GRAFANA', 'GRAFANA', '126', '6', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'GRAFANA');
insert into sys_menu values('3036',  'KIBANA', 'KIBANA', 'KIBANA', '126', '7', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'KIBANA');
insert into sys_menu values('3037',  'JKB Checking', 'JKB Checking', 'JKB Checking', '126', '8', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'JKB Checking');

-- logs

insert into sys_menu values('3038',  'PF1 TASK LOG', 'PF1 TASK LOG', 'PF1 TASK LOG', '127', '1', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'PF1 TASK LOG');
insert into sys_menu values('3039',  'PF2 TASK LOG', 'PF2 TASK LOG', 'PF2 TASK LOG', '127', '2', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'PF2 TASK LOG');

-- 3RD PARTY BACKEND

insert into sys_menu values('3040',  'PT2', 'PT2', 'PT2', '128', '1', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'PT2');
insert into sys_menu values('3041',  'KY', 'KY', 'KY', '128', '2', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'KY');
insert into sys_menu values('3042',  'TTG', 'TTG', 'TTG', '128', '3', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'TTG');
insert into sys_menu values('3043',  'AG', 'AG', 'AG', '128', '4', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'AG');
insert into sys_menu values('3044',  'MGS2', 'MGS2', 'MGS2', '128', '5', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'MGS2');
insert into sys_menu values('3045',  'AS', 'AS', 'AS', '128', '6', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'AS');


-- WIKI

insert into sys_menu values('3046',  '上版/释出', '上版/釋出', 'RELEASE', '129', '1', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '上版/释出');
insert into sys_menu values('3047',  '监控告警', '監控告警', 'ALERT MONITOR', '129', '2', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '监控告警');
insert into sys_menu values('3048',  '资讯', '資訊', 'INFORMATION', '129', '3', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '资讯');
insert into sys_menu values('3049',  '重新启动', '重新啟動', 'RESTART', '129', '4', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '重新启动');
insert into sys_menu values('3050',  'ASI', 'ASI', 'ASI', '129', '5', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, 'ASI');
insert into sys_menu values('3051',  '其他', '其他', 'OTHER', '129', '6', '#',          '', 'M', '1', '1', '',         'fa fa-tags',          'admin', sysdate(), '', null, '其他');


-- 四级
-- PF1

insert into sys_menu values('4000',  '前台-WEB(ubet01)', '前臺-WEB(ubet01)', 'FE-WEB(ubet01)', '3018', '1', 'https://www.ubet01.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB(ubet01)');
insert into sys_menu values('4001',  '前台-WEB(ub8one)', '前臺-WEB(ub8one)', 'FE-WEB(ub8one)', '3018', '2', 'https://www.ub8one.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB(ub8one)');
insert into sys_menu values('4002',  '前台-WEB(gg3r)', '前臺-WEB(gg3r)', 'FE-WEB(gg3r)', '3018', '3', 'https://www.gg3r.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB(gg3r)');
insert into sys_menu values('4003',  '前台-MTH(ubet01)', '前臺-MTH(ubet01)', 'FE-MTH(ubet01)', '3018', '4', 'https://m.ubet01.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-MTH(ubet01)');
insert into sys_menu values('4004',  '前台-MTH(ub8one)', '前臺-MTH(ub8one)', 'FE-MTH(ub8one)', '3018', '5', 'https://m.ub8one.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-MTH(ub8one)');
insert into sys_menu values('4005',  '前台-MTH(gg3r)', '前臺-MTH(gg3r)', 'FE-MTH(gg3r)', '3018', '6', 'https://m.gg3r.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-MTH(gg3r)');
insert into sys_menu values('4006',  '后台(admin)', '後臺(admin)', 'BE(admin)', '3018', '7', 'http://admin.nuttli.com/admin_console/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(admin)');
insert into sys_menu values('4007',  '后台(admin1)', '後臺(admin1)', 'BE(admin1)', '3018', '8', 'http://admin1.nuttli.com/admin_console/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(admin1)');
insert into sys_menu values('4008',  '权限管理', '權限管理', 'AA', '3018', '9', 'http://pf1admin.nuttli.com/aa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '权限管理');
insert into sys_menu values('4009',  '直客注册(ubet01)', '直客註冊(ubet01)', 'Directreg(ubet01)', '3018', '10', 'https://www.ubet01.com/linklogin.html?ag=116501', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '直客注册(ubet01)');
insert into sys_menu values('4010',  '直客注册(jhl888)', '直客註冊(jhl888)', 'Directreg(jhl888)', '3018', '11', 'https://agent.jhl888.net/reglink.html?ag=114436', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '直客注册(jhl888)');


insert into sys_menu values('4011',  'FE1', 'FE1', 'FE1', '3019', '1', 'https://fe1.cpgprod.com/index.html', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'FE1');
insert into sys_menu values('4012',  'FE2', 'FE2', 'FE2', '3019', '2', 'https://fe2.cpgprod.com/index.html', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'FE2');
insert into sys_menu values('4013',  'FE3', 'FE3', 'FE3', '3019', '3', 'https://fe3.cpgprod.com/index.html', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'FE3');
insert into sys_menu values('4014',  'FE4', 'FE4', 'FE4', '3019', '4', 'https://fe4.cpgprod.com/index.html', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'FE4');


insert into sys_menu values('4015',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3020', '1', 'https://pf1web.uenvdev.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4016',  '前台-MTH', '前臺-MTH', 'FE-MTH', '3020', '2', 'https://m.uenvdev.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-MTH');
insert into sys_menu values('4017',  '后台', '後臺', 'BE', '3020', '3', 'https://pf1admin.uenvdev.com/admin_console', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台');
insert into sys_menu values('4018',  '权限管理', '權限管理', 'AA', '3020', '4', 'https://pf1admin.uenvdev.com/aa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '权限管理');


insert into sys_menu values('4019',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3021', '1', 'https://pf1web.uenvsit.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4020',  '前台-MTH', '前臺-MTH', 'FE-MTH', '3021', '2', 'https://m.uenvsit.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-MTH');
insert into sys_menu values('4021',  '后台(admin)', '後臺(admin)', 'BE(admin)', '3021', '3', 'https://pf1admin.uenvsit.com/admin_console', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(admin)');
insert into sys_menu values('4022',  '后台(be1)', '後臺(be1)', 'BE(be1)', '3021', '4', 'http://be1.pf1sit1-oob.com/admin_console/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(be1)');
insert into sys_menu values('4023',  '后台(be2)', '後臺(be2)', 'BE(be2)', '3021', '5', 'http://be2.pf1sit1-oob.com/admin_console/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(be2)');
insert into sys_menu values('4024',  '权限管理', '權限管理', 'AA', '3021', '6', 'https://pf1admin.uenvsit.com/aa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '权限管理');
insert into sys_menu values('4025',  '直客注册', '直客註冊', 'Directreg', '3021', '7', 'https://pf1web.uenvsit.com/reglink.html?ag=100639', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '直客注册');


insert into sys_menu values('4026',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3022', '1', 'https://pf1web.e3xm.com/weblogin.html?deviceType=Web', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4027',  '前台-MTH', '前臺-MTH', 'FE-MTH', '3022', '2', 'http://m.e3xm.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-MTH');
insert into sys_menu values('4028',  '后台', '後臺', 'BE', '3022', '3', 'http://pf1admin.e3xm.com/admin_console/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台');
insert into sys_menu values('4029',  '权限管理', '權限管理', 'AA', '3022', '4', 'http://pf1admin.e3xm.com/aa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '权限管理');

insert into sys_menu values('4030',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3023', '1', 'https://pf1web.uenvqa.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4031',  '前台-MTH', '前臺-MTH', 'FE-MTH', '3023', '2', 'https://m.uenvqa.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-MTH');
insert into sys_menu values('4032',  '后台', '後臺', 'BE', '3023', '3', 'http://pf1admin.uenvqa.com/admin_console', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台');
insert into sys_menu values('4033',  '权限管理', '權限管理', 'AA', '3023', '4', 'http://pf1admin.uenvqa.com/aa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '权限管理');


-- PF2

insert into sys_menu values('4034',  '前台-WEB(akwfoj.yjzxmr)', '前臺-WEB(akwfoj.yjzxmr)', 'FE-WEB(akwfoj.yjzxmr)', '3024', '1', 'https://akwfoj.yjzxmr.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB(akwfoj.yjzxmr)');
insert into sys_menu values('4035',  '前台-WEB(n56b)', '前臺-WEB(n56b)', 'FE-WEB(n56b)', '3024', '2', 'https://www.n56b.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB(n56b)');
insert into sys_menu values('4036',  '前台-WEB(ub8go)', '前臺-WEB(ub8go)', 'FE-WEB(ub8go)', '3024', '3', 'https://www.ub8go.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB(ub8go)');
insert into sys_menu values('4037',  '后台(admin)', '後臺(admin)', 'BE(admin)', '3024', '4', 'https://pf2admin.nuttli.com/#/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(admin)');
insert into sys_menu values('4038',  '后台(admin1)', '後臺(admin1)', 'BE(admin1)', '3024', '5', 'https://pf2admin1.nuttli.com/#/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(admin1)');
insert into sys_menu values('4039',  '腾讯分分彩', '騰訊分分彩', 'TXFFC', '3024', '6', 'http://txffc365.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '腾讯分分彩');
insert into sys_menu values('4040',  '直客注册1', '直客註冊1', 'Registration Link', '3024', '7', 'https://new.ub8go.com/home.html?r=ER5QH', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '直客注册1');
insert into sys_menu values('4041',  '直客注册2', '直客註冊2', 'Direct Customer Link', '3024', '8', 'https://new.ub8go.com/direct-customer-register.html?r=TYT138', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '直客注册2');


insert into sys_menu values('4042',  'customer-site1', 'customer-site1', 'customer-site1', '3025', '1', 'http://customer-site1.pf2prod-oob.com/home.html#/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'customer-site1');
insert into sys_menu values('4043',  'customer-site2', 'customer-site2', 'customer-site2', '3025', '2', 'http://customer-site2.pf2prod-oob.com/home.html#/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'customer-site2');


insert into sys_menu values('4044',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3026', '1', 'https://pf2web.uenvdev.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4045',  '后台', '後臺', 'BE', '3026', '2', 'http://pf2admin.uenvdev.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台');
insert into sys_menu values('4046',  '腾讯分分彩', '騰訊分分彩', 'TXFFC', '3026', '3', 'https://txffc365.uenvdev.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '腾讯分分彩');
insert into sys_menu values('4047',  '开奖中心', '開獎中心', 'DCS', '3026', '4', 'http://pf2dcs.uenvdev.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '开奖中心');


insert into sys_menu values('4048',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3027', '1', 'https://pf2web.uenvsit.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4049',  '后台', '後臺', 'BE', '3027', '2', 'http://pf2admin.uenvsit.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台');
insert into sys_menu values('4050',  '腾讯分分彩', '騰訊分分彩', 'TXFFC', '3027', '3', 'http://txffc365.uenvsit.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '腾讯分分彩');
insert into sys_menu values('4051',  '直客注册', '直客註冊', 'Directreg', '3027', '4', 'https://pf2web.uenvsit.com/direct-customer-register.html?r=UQH662', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '直客注册');
insert into sys_menu values('4052',  '开奖中心', '開獎中心', 'DCS', '3027', '5', 'http://pf2dcs.uenvsit.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '开奖中心');


insert into sys_menu values('4053',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3028', '1', 'https://pf2web.e3xm.com/home.html#/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4054',  '后台', '後臺', 'BE', '3028', '2', 'https://pf2admin.e3xm.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台');
insert into sys_menu values('4055',  '腾讯分分彩', '騰訊分分彩', 'TXFFC', '3028', '3', 'https://txffc365.e3xm.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '腾讯分分彩');
insert into sys_menu values('4056',  '开奖中心', '開獎中心', 'DCS', '3029', '4', 'https://pf2dcs.nuttli.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '开奖中心');

insert into sys_menu values('4057',  '前台-WEB', '前臺-WEB', 'FE-WEB', '3029', '1', 'https://pf2web.uenvqa.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '前台-WEB');
insert into sys_menu values('4058',  '后台(admin)', '後臺(admin)', 'BE(admin)', '3029', '2', 'http://pf2admin.uenvqa.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(admin)');
insert into sys_menu values('4059',  '后台(bws1)', '後臺(bws1)', 'BE(bws1)', '3029', '3', 'http://bws1.pf2qa1-oob.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '后台(bws1)');
insert into sys_menu values('4060',  '腾讯分分彩', '騰訊分分彩', 'TXFFC', '3029', '4', 'http://txffc365.uenvqa.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '腾讯分分彩');
insert into sys_menu values('4061',  '开奖中心', '開獎中心', 'DCS', '3029', '5', 'http://pf2dcs.uenvqa.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '开奖中心');

-- MONITORING

insert into sys_menu values('4062',  'AS MONITOR', 'AS MONITOR', 'AS MONITOR', '3030', '1', 'https://asmonitor.nuttli.com/asmonitor/index.do', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AS MONITOR');
insert into sys_menu values('4063',  'AS PORTAL', 'AS PORTAL', 'AS PORTAL', '3030', '2', 'https://react.nuttli.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AS PORTAL');

insert into sys_menu values('4064',  'ASI TICKET', 'ASI TICKET', 'ASI TICKET', '3031', '1', 'https://jira.my-cpg.com/secure/Dashboard.jspa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'ASI TICKET');
insert into sys_menu values('4065',  'CM TICKET', 'CM TICKET', 'CM TICKET', '3031', '2', 'hhttps://jira.yxunistar.com/secure/Dashboard.jspa', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'CM TICKET');

insert into sys_menu values('4066',  'ZABBIX', 'ZABBIX', 'ZABBIX', '3032', '1', 'http://monitor.nuttli.com/zabbix/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'ZABBIX');

insert into sys_menu values('4067',  'WEBLOGIC UAT', 'WEBLOGIC UAT', 'WEBLOGIC UAT', '3033', '1', 'http://pf2as.e3xm.com/console/login/LoginForm.jsp', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'WEBLOGIC UAT');
insert into sys_menu values('4068',  'WEBLOGIC PROD', 'WEBLOGIC PROD', 'WEBLOGIC PROD', '3033', '2', 'http://pf2as.nuttli.com/console/login/LoginForm.jsp', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'WEBLOGIC PROD');

insert into sys_menu values('4069',  'PROD JENKINS', 'PROD JENKINS', 'PROD JENKINS', '3034', '1', 'http://jenkins.nuttli.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PROD JENKINS');
insert into sys_menu values('4070',  'UAT JENKINS', 'UAT JENKINS', 'UAT JENKINS', '3034', '2', 'http://jenkins.e3xm.com/login?from=%2F', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'UAT JENKINS');

insert into sys_menu values('4071',  'PF1 GRAFANA', 'PF1 GRAFANA', 'PF1 GRAFANA', '3035', '1', 'http://monitor.nuttli.com/d/000000002/platform-1-0-monitor-system?refresh=1m&orgId=1', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF1 GRAFANA');
insert into sys_menu values('4072',  'PF2 GRAFANA', 'PF2 GRAFANA', 'PF2 GRAFANA', '3035', '2', 'http://monitor.nuttli.com/d/000000003/platform-2-0-monitor-system?refresh=1m&orgId=1', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF2 GRAFANA');

insert into sys_menu values('4073',  'PF1 KIBANA', 'PF1 KIBANA', 'PF1 KIBANA', '3036', '1', 'http://pf1kibana2.nuttli.com/app/discover#/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF1 KIBANA');
insert into sys_menu values('4074',  'PF2 KIBANA', 'PF2 KIBANA', 'PF2 KIBANA', '3036', '2', 'http://pf2kibana.nuttli.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF2 KIBANA');

insert into sys_menu values('4075',  'JKB', 'JKB', 'JKB', '3037', '1', 'https://www.jiankongbao.com/users/login', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'JKB');
insert into sys_menu values('4076',  '17CE', '17CE', '17CE', '3037', '2', 'https://www.17ce.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '17CE');
insert into sys_menu values('4077',  'GREATFIRE', 'GREATFIRE', 'GREATFIRE', '3037', '3', 'https://zh.greatfire.org/analyzer', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'GREATFIRE');
insert into sys_menu values('4078',  'DNS CHECKER', 'DNS CHECKER', 'DNS CHECKER', '3037', '4', 'https://dnschecker.org/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'DNS CHECKER');
insert into sys_menu values('4079',  'DOMAIN TOOL POLLUTION', 'DOMAIN TOOL POLLUTION', 'DOMAIN TOOL POLLUTION', '3037', '5', 'https://www.xz.com/domainTool/pollution', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'DOMAIN TOOL POLLUTION');

-- logs

insert into sys_menu values('4080',  '5xx Daily Analysis', '5xx Daily Analysis', '5xx Daily Analysis', '3038', '1', 'https://drive.google.com/drive/folders/1abXy4xqGHv0-HxkPMkzhcRrYH6kBq-ma', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '5xx Daily Analysis');
insert into sys_menu values('4081',  '4xx Daily Analysis', '4xx Daily Analysis', '4xx Daily Analysis', '3038', '2', 'https://drive.google.com/drive/folders/1x9yYXpyRdmkuVWrCDMLQjMi4UCse2-GE', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '4xx Daily Analysis');
insert into sys_menu values('4082',  '2xx Daily Analysis', '2xx Daily Analysis', '2xx Daily Analysis', '3038', '3', 'https://drive.google.com/drive/folders/10filpCoYGSc0hAofWo0_3VDTWAOWEJ77', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '2xx Daily Analysis');
insert into sys_menu values('4083',  'Allxx Daily Analysis', 'Allxx Daily Analysis', 'Allxx Daily Analysis', '3038', '4', 'https://drive.google.com/drive/folders/1ch_tH87BSVkJVq785WzUWblwqt3gWfyo', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Allxx Daily Analysis');
insert into sys_menu values('4084',  'Weekly Analysis', 'Weekly Analysis', 'Weekly Analysis', '3038', '5', 'https://docs.google.com/spreadsheets/d/1KGdfAD3uUrvjcT7G73QvolKMvkW6Qo_uD-X36_-rxS8/edit?usp=drive_web&ouid=102641691368780104418', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Weekly Analysis');
insert into sys_menu values('4085',  '2020 Weekly Draw Delay', '2020 Weekly Draw Delay', '2020 Weekly Draw Delay', '3038', '6', 'https://docs.google.com/spreadsheets/d/1FT1TlZMh8TgXWbxgGNkzmBduo9gUFo7mf8A1orC0rUk/edit#gid=0', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '2020 Weekly Draw Delay');
insert into sys_menu values('4086',  'Top 10 Most Access URL', 'Top 10 Most Access URL', 'Top 10 Most Access URL', '3038', '7', 'https://drive.google.com/drive/folders/1L0Xb3TdGTOk9E1TORPeGHwSEO8vom6AE', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Top 10 Most Access URL');
insert into sys_menu values('4087',  'GYM Record', 'GYM Record', 'GYM Record', '3038', '8', 'https://docs.google.com/spreadsheets/d/1KsfGGf1unqAQCdTssnp_YKFCyEBh6bRfqhUc6gQGeyc/edit#gid=0', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'GYM Record');

insert into sys_menu values('4088',  '5xx Daily Analysis', '5xx Daily Analysis', '5xx Daily Analysis', '3039', '1', 'https://drive.google.com/drive/folders/1s1p3RkkdkM0q9a9f7XGTOPkjYNXLdAdt', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '5xx Daily Analysis');
insert into sys_menu values('4089',  '4xx Daily Analysis', '4xx Daily Analysis', '4xx Daily Analysis', '3039', '2', 'https://drive.google.com/drive/folders/14SkOFcWwtYiLaTobaZLL7MxO4Ek9c760', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '4xx Daily Analysis');
insert into sys_menu values('4090',  '2xx Daily Analysis', '2xx Daily Analysis', '2xx Daily Analysis', '3039', '3', 'https://drive.google.com/drive/folders/1aQxNXIQ6sGYFO6IzYmmHYIzAEFvsEuQg', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '2xx Daily Analysis');
insert into sys_menu values('4091',  'Allxx Daily Analysis', 'Allxx Daily Analysis', 'Allxx Daily Analysis', '3039', '4', 'https://drive.google.com/drive/folders/1CwFvAMdrLZmOJm3oTKF4TbejAQ0pag-U', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Allxx Daily Analysis');
insert into sys_menu values('4092',  'Weekly Analysis', 'Weekly Analysis', 'Weekly Analysis', '3039', '5', 'https://docs.google.com/spreadsheets/d/1bU5dtFJ2PHmPqQHIdeMDoQWPJU3JeFxvcWyEgXbxYAQ/edit#gid=257138674', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Weekly Analysis');
insert into sys_menu values('4093',  '2020 Weekly Draw Delay', '2020 Weekly Draw Delay', '2020 Weekly Draw Delay', '3039', '6', 'https://docs.google.com/spreadsheets/d/1lAod560eFx1wKi3Pw6CY7yyvyBB64pS9o8MT4t6HiOA/edit#gid=0', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '2020 Weekly Draw Delay');
insert into sys_menu values('4094',  'Top 10 Most Access URL', 'Top 10 Most Access URL', 'Top 10 Most Access URL', '3039', '7', 'https://drive.google.com/drive/folders/128e_ucU2-7PI63BNLo0YCLLrVBgOU9WJ', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Top 10 Most Access URL');
insert into sys_menu values('4095',  'GYM Record', 'GYM Record', 'GYM Record', '3039', '8', 'https://docs.google.com/spreadsheets/d/1KsfGGf1unqAQCdTssnp_YKFCyEBh6bRfqhUc6gQGeyc/edit#gid=2096506886', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'GYM Record');
insert into sys_menu values('4096',  '手工回退确认', '手工回退確認', 'Manual Rollback Check Record', '3039', '9', 'https://docs.google.com/spreadsheets/d/1ZLkKKhE38m6Nn0Z9t7g2QlXLeRc0CWwwsAjc-ZVdcBs/edit#gid=0', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '手工回退确认');

-- 3RD PARTY BACKEND

insert into sys_menu values('4097',  'PT2 Backend', 'PT2 Backend', 'PT2 Backend', '3040', '1', 'https://kiosk-am.hotspin88.com/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PT2 Backend');

insert into sys_menu values('4098',  'PF1 KY Backend', 'PF1 KY Backend', 'PF1 KY Backend', '3041', '1', 'https://ht.ky1116.com/default', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF1 KY Backend');
insert into sys_menu values('4099',  'PF2 KY Backend', 'PF2 KY Backend', 'PF2 KY Backend', '3041', '2', 'https://ht.ky0059.com/default', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'PF2 KY Backend');

insert into sys_menu values('4100',  'TTG Backend', 'TTG Backend', 'TTG Backend', '3042', '1', 'https://ams2-bo.ttms.co:9443/cb5/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'TTG Backend');

insert into sys_menu values('4101',  'AG Backend', 'AG Backend', 'AG Backend', '3043', '1', 'https://data.agingames.com/login', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AG Backend');
insert into sys_menu values('4102',  'AG', 'AG', 'AG', '3043', '2', 'https://gdc.agingames.com/jsp/login.htm', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AG');

insert into sys_menu values('4103',  'MGS2 Backend', 'MGS2 Backend', 'MGS2 Backend', '3044', '1', 'https://ui.adminserv88.com/login', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'MGS2 Backend');

insert into sys_menu values('4104',  'AS Backend', 'AS Backend', 'AS Backend', '3045', '1', 'https://as-agent-web-w.asgame8.com/user/login', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AS Backend');


-- WIKI

insert into sys_menu values('4105',  '<PF1 SOP Release> Award Winning Formula', '<PF1 SOP Release> Award Winning Formula', '<PF1 SOP Release> Award Winning Formula', '3046', '1', 'https://wiki.yxunistar.com/x/j4o4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Release> Award Winning Formula');
insert into sys_menu values('4106',  '<PF1 SOP Release> Frontend Sanity Test', '<PF1 SOP Release> Frontend Sanity Test', '<PF1 SOP Release> Frontend Sanity Test', '3046', '2', 'https://wiki.yxunistar.com/x/aYo4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Release> Frontend Sanity Test');
insert into sys_menu values('4107',  '<PF1 SOP Release> Mobile Sanity Test', '<PF1 SOP Release> Mobile Sanity Test', '<PF1 SOP Release> Mobile Sanity Test', '3046', '3', 'https://wiki.yxunistar.com/x/LI84', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Release> Mobile Sanity Test');
insert into sys_menu values('4108',  '<PF1 SOP Release> New Air Sanity Test', '<PF1 SOP Release> New Air Sanity Test', '<PF1 SOP Release> New Air Sanity Test', '3046', '4', 'https://wiki.yxunistar.com/x/eAGe', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Release> New Air Sanity Test');
insert into sys_menu values('4109',  '<PF2 SOP Release> Award Winning Formula', '<PF2 SOP Release> Award Winning Formula', '<PF2 SOP Release> Award Winning Formula', '3046', '5', 'https://wiki.yxunistar.com/x/bYg4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Release> Award Winning Formula');
insert into sys_menu values('4110',  '<PF2 SOP Release> Frontend Sanity Test', '<PF2 SOP Release> Frontend Sanity Test', '<PF2 SOP Release> Frontend Sanity Test', '3046', '6', 'https://wiki.yxunistar.com/x/05E4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Release> Frontend Sanity Test');
insert into sys_menu values('4111',  '<PF2 SOP Release> Mobile Sanity Test', '<PF2 SOP Release> Mobile Sanity Test', '<PF2 SOP Release> Mobile Sanity Test', '3046', '7', 'https://wiki.yxunistar.com/x/Nok4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Release> Mobile Sanity Test');

insert into sys_menu values('4112',  '<PF1 SOP Monitoring> CHK-GYM-17: Send Deposit Fail', '<PF1 SOP Monitoring> CHK-GYM-17: Send Deposit Fail', '<PF1 SOP Monitoring> CHK-GYM-17: Send Deposit Fail', '3047', '1', 'https://wiki.yxunistar.com/x/KICgAg', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Monitoring> CHK-GYM-17: Send Deposit Fail');
insert into sys_menu values('4113',  '<PF1 SOP AS Monitor> NU-MID-18: Check Slot Game Data Sync Schedule_第三方同步異常', '<PF1 SOP AS Monitor> NU-MID-18: Check Slot Game Data Sync Schedule_第三方同步異常', '<PF1 SOP AS Monitor> NU-MID-18: Check Slot Game Data Sync Schedule_第三方同步異常', '3047', '2', 'https://wiki.yxunistar.com/x/QziJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP AS Monitor> NU-MID-18: Check Slot Game Data Sync Schedule_第三方同步異常');
insert into sys_menu values('4114',  '<PF1 SOP AS Monitor> URG-MID-22: Get Tomcat Thread Log (need to be executed before Tomcat Restart)', '<PF1 SOP AS Monitor> URG-MID-22: Get Tomcat Thread Log (need to be executed before Tomcat Restart)', '<PF1 SOP AS Monitor> URG-MID-22: Get Tomcat Thread Log (need to be executed before Tomcat Restart)', '3047', '3', 'https://wiki.yxunistar.com/x/UJA4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP AS Monitor> URG-MID-22: Get Tomcat Thread Log (need to be executed before Tomcat Restart)');
insert into sys_menu values('4115',  '<PF1 SOP AS Monitor> URG-MID-39/237: Draw Delay', '<PF1 SOP AS Monitor> URG-MID-39/237: Draw Delay', '<PF1 SOP AS Monitor> URG-MID-39/237: Draw Delay', '3047', '4', 'https://wiki.yxunistar.com/x/VYBiAg', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP AS Monitor> URG-MID-39/237: Draw Delay');
insert into sys_menu values('4116',  '<PF1 SOP AS Monitor> URG-MID-120/208: Check Daily Reward (檢查每日登錄送是否已派獎)', '<PF1 SOP AS Monitor> URG-MID-120/208: Check Daily Reward (檢查每日登錄送是否已派獎)', '<PF1 SOP AS Monitor> URG-MID-120/208: Check Daily Reward (檢查每日登錄送是否已派獎)', '3047', '5', 'https://wiki.yxunistar.com/x/BZA4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP AS Monitor> URG-MID-120/208: Check Daily Reward (檢查每日登錄送是否已派獎)');
insert into sys_menu values('4117',  '<PF1 SOP AS Monitor> URG-MID-164: Manual Startup of failed Database', '<PF1 SOP AS Monitor> URG-MID-164: Manual Startup of failed Database', '<PF1 SOP AS Monitor> URG-MID-164: Manual Startup of failed Database', '3047', '6', 'https://wiki.yxunistar.com/x/tIo4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP AS Monitor> URG-MID-164: Manual Startup of failed Database');
insert into sys_menu values('4118',  '<PF2 SOP Monitoring> System Maintenance Deposit Configuration Telegram Alert', '<PF2 SOP Monitoring> System Maintenance Deposit Configuration Telegram Alert', '<PF2 SOP Monitoring> System Maintenance Deposit Configuration Telegram Alert', '3047', '7', 'https://wiki.yxunistar.com/x/bmWJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Monitoring> System Maintenance Deposit Configuration Telegram Alert');
insert into sys_menu values('4119',  '<PF2 SOP Monitoring> CHK-KMID-17 PF2 Read timed out', '<PF2 SOP Monitoring> CHK-KMID-17 PF2 Read timed out', '<PF2 SOP Monitoring> CHK-KMID-17 PF2 Read timed out', '3047', '8', 'https://wiki.yxunistar.com/x/OIFMB', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Monitoring> CHK-KMID-17 PF2 Read timed out');
insert into sys_menu values('4120',  '<PF2 SOP AS Monitor> URG-MID-40: Draw Abnormally Stopped', '<PF2 SOP AS Monitor> URG-MID-40: Draw Abnormally Stopped', '<PF2 SOP AS Monitor> URG-MID-40: Draw Abnormally Stopped', '3047', '9', 'https://wiki.yxunistar.com/x/0404', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP AS Monitor> URG-MID-40: Draw Abnormally Stopped');
insert into sys_menu values('4121',  '<PF2 SOP AS Monitor> URG-MID-62/187: Check The Status Of The Lottery Order Update (目前有應開獎但訂單未更新狀況)', '<PF2 SOP AS Monitor> URG-MID-62/187: Check The Status Of The Lottery Order Update (目前有應開獎但訂單未更新狀況)', '<PF2 SOP AS Monitor> URG-MID-62/187: Check The Status Of The Lottery Order Update (目前有應開獎但訂單未更新狀況)', '3047', '10', 'https://wiki.yxunistar.com/x/opE4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP AS Monitor> URG-MID-62/187: Check The Status Of The Lottery Order Update (目前有應開獎但訂單未更新狀況)');
insert into sys_menu values('4122',  '<PF2 SOP AS Monitor> URG-CAL2-MID-298 : PF2 Third party data to transaction abnormal', '<PF2 SOP AS Monitor> URG-CAL2-MID-298 : PF2 Third party data to transaction abnormal', '<PF2 SOP AS Monitor> URG-CAL2-MID-298 : PF2 Third party data to transaction abnormal', '3047', '11', 'https://wiki.yxunistar.com/x/hkeJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP AS Monitor> URG-CAL2-MID-298 : PF2 Third party data to transaction abnormal');

insert into sys_menu values('4123',  'ASL1 Wiki Home', 'ASL1 Wiki Home', 'ASL1 Wiki Home', '3048', '1', 'https://wiki.yxunistar.com/x/aYAXAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'ASL1 Wiki Home');
insert into sys_menu values('4124',  'Shared Password ( 共用密碼 )', 'Shared Password ( 共用密碼 )', 'Shared Password ( 共用密碼 )', '3048', '2', 'https://wiki.yxunistar.com/x/NYo4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'Shared Password ( 共用密碼 )');
insert into sys_menu values('4125',  'ASL1 Daily Task', 'ASL1 Daily Task', 'ASL1 Daily Task', '3048', '3', 'https://wiki.yxunistar.com/x/QI84', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'ASL1 Daily Task');
insert into sys_menu values('4126',  'AS Table Schema', 'AS Table Schema', 'AS Table Schema', '3048', '4', 'https://wiki.yxunistar.com/x/NgCCAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AS Table Schema');
insert into sys_menu values('4127',  'AS Casual Game Notification', 'AS Casual Game Notification', 'AS Casual Game Notification', '3048', '5', 'https://wiki.yxunistar.com/x/pxKJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'AS Casual Game Notification');
insert into sys_menu values('4128',  'ASID Mapping', 'ASID Mapping', 'ASID Mapping', '3048', '6', 'https://wiki.yxunistar.com/x/-haJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'ASID Mapping');
insert into sys_menu values('4129',  'RSA Passcode Request Log Record', 'RSA Passcode Request Log Record', 'RSA Passcode Request Log Record', '3048', '7', 'https://wiki.yxunistar.com/x/A5E4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, 'RSA Passcode Request Log Record');

insert into sys_menu values('4130',  '<SOP Restart> AS Monitor and UB Monitor Restart', '<SOP Restart> AS Monitor and UB Monitor Restart', '<SOP Restart> AS Monitor and UB Monitor Restart', '3049', '1', 'https://wiki.yxunistar.com/x/y4o4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<SOP Restart> AS Monitor and UB Monitor Restart');
insert into sys_menu values('4131',  '<PF1 SOP Restart> Jenkins Prod All Server', '<PF1 SOP Restart> Jenkins Prod All Server', '<PF1 SOP Restart> Jenkins Prod All Server', '3049', '2', 'https://wiki.yxunistar.com/x/RIc_/', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Restart> Jenkins Prod All Server');
insert into sys_menu values('4132',  '<PF1 SOP Restart> Frontend and Prod-BE1', '<PF1 SOP Restart> Frontend and Prod-BE1', '<PF1 SOP Restart> Frontend and Prod-BE1', '3049', '3', 'https://wiki.yxunistar.com/x/9ow4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Restart> Frontend and Prod-BE1');
insert into sys_menu values('4133',  '<PF1 SOP Restart> Frontend and Prod-BE1', '<PF1 SOP Restart> Frontend and Prod-BE1', '<PF1 SOP Restart> Frontend and Prod-BE1', '3049', '4', 'https://wiki.yxunistar.com/x/9ow4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Restart> Frontend and Prod-BE1');
insert into sys_menu values('4134',  '<PF1 SOP Restart> GY Monitor', '<PF1 SOP Restart> GY Monitor', '<PF1 SOP Restart> GY Monitor', '3049', '5', 'https://wiki.yxunistar.com/x/TY84', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Restart> GY Monitor');
insert into sys_menu values('4135',  '<PF1 SOP Restart> Service Dump Thread', '<PF1 SOP Restart> Service Dump Thread', '<PF1 SOP Restart> Service Dump Thread', '3049', '6', 'https://wiki.yxunistar.com/x/kTmJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP Restart> Service Dump Thread');
insert into sys_menu values('4136',  '<PF2 SOP Restart> Jenkins Prod All Server', '<PF2 SOP Restart> Jenkins Prod All Server', '<PF2 SOP Restart> Jenkins Prod All Server', '3049', '7', 'https://wiki.yxunistar.com/x/eIg4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Restart> Jenkins Prod All Server');
insert into sys_menu values('4137',  '<PF2 SOP Restart> Cluster Quick Restart (ClusterA, Cluster B)', '<PF2 SOP Restart> Cluster Quick Restart (ClusterA, Cluster B)', '<PF2 SOP Restart> Cluster Quick Restart (ClusterA, Cluster B)', '3049', '8', 'https://wiki.yxunistar.com/x/tYCx', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Restart> Cluster Quick Restart (ClusterA, Cluster B)');
insert into sys_menu values('4138',  '<PF2 SOP Restart> UAT Cluster Quick Restart (ClusterA, Cluster B)', '<PF2 SOP Restart> UAT Cluster Quick Restart (ClusterA, Cluster B)', '<PF2 SOP Restart> UAT Cluster Quick Restart (ClusterA, Cluster B)', '3049', '9', 'https://wiki.yxunistar.com/x/nYs4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP Restart> UAT Cluster Quick Restart (ClusterA, Cluster B)');

insert into sys_menu values('4139',  '<PF1 & PF2 SOP ASI> Delete Exception Deposit Record (后台充值异常记录删除)', '<PF1 & PF2 SOP ASI> Delete Exception Deposit Record (后台充值异常记录删除)', '<PF1 & PF2 SOP ASI> Delete Exception Deposit Record (后台充值异常记录删除)', '3050', '1', 'https://wiki.yxunistar.com/x/EYo4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 & PF2 SOP ASI> Delete Exception Deposit Record (后台充值异常记录删除)');
insert into sys_menu values('4140',  '<PF1 & PF2 SOP ASI> Manual Deposit (手工充值)', '<PF1 & PF2 SOP ASI> Manual Deposit (手工充值)', '<PF1 & PF2 SOP ASI> Manual Deposit (手工充值)', '3050', '2', 'https://wiki.yxunistar.com/x/kow4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 & PF2 SOP ASI> Manual Deposit (手工充值)');
insert into sys_menu values('4141',  '<PF1 SOP ASI> URG: Member Withdrawal Error/Duplicate Task Flow/System Bug', '<PF1 SOP ASI> URG: Member Withdrawal Error/Duplicate Task Flow/System Bug', '<PF1 SOP ASI> URG: Member Withdrawal Error/Duplicate Task Flow/System Bug', '3050', '3', 'https://wiki.yxunistar.com/x/5Is4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP ASI> URG: Member Withdrawal Error/Duplicate Task Flow/System Bug');
insert into sys_menu values('4142',  '<PF1 SOP ASI> Promotion Link/Agent Reg Link (檢查代理推廣註冊鏈結)', '<PF1 SOP ASI> Promotion Link/Agent Reg Link (檢查代理推廣註冊鏈結)', '<PF1 SOP ASI> Promotion Link/Agent Reg Link (檢查代理推廣註冊鏈結)', '3050', '4', 'https://wiki.yxunistar.com/x/qYw4', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP ASI> Promotion Link/Agent Reg Link (檢查代理推廣註冊鏈結)');
insert into sys_menu values('4143',  '<PF1 SOP ASI> Kaiyuan Data Gap', '<PF1 SOP ASI> Kaiyuan Data Gap', '<PF1 SOP ASI> Kaiyuan Data Gap', '3050', '5', 'https://wiki.yxunistar.com/x/fCmJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF1 SOP ASI> Kaiyuan Data Gap');
insert into sys_menu values('4144',  '<PF2 SOP ASI> KY Manual Rollback ( 5.0开元棋牌转账超时 )', '<PF2 SOP ASI> KY Manual Rollback ( 5.0开元棋牌转账超时 )', '<PF2 SOP ASI> KY Manual Rollback ( 5.0开元棋牌转账超时 )', '3050', '6', 'https://wiki.yxunistar.com/x/Vl6JAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> KY Manual Rollback ( 5.0开元棋牌转账超时 )');
insert into sys_menu values('4145',  '<PF2 SOP ASI> PT2 Manual Rollback', '<PF2 SOP ASI> PT2 Manual Rollback', '<PF2 SOP ASI> PT2 Manual Rollback', '3050', '7', 'https://wiki.yxunistar.com/x/fo84', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> PT2 Manual Rollback');
insert into sys_menu values('4146',  '<PF2 SOP ASI> AS Manual Rollback ( 5.0 AS棋牌转账超时 )', '<PF2 SOP ASI> AS Manual Rollback ( 5.0 AS棋牌转账超时 )', '<PF2 SOP ASI> AS Manual Rollback ( 5.0 AS棋牌转账超时 )', '3050', '8', 'https://wiki.yxunistar.com/x/ygg-B', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> AS Manual Rollback ( 5.0 AS棋牌转账超时 )');
insert into sys_menu values('4147',  '<PF2 SOP ASI> AG Manual Rollback ( 5.0 AG真人转账超时 )', '<PF2 SOP ASI> AG Manual Rollback ( 5.0 AG真人转账超时 )', '<PF2 SOP ASI> AG Manual Rollback ( 5.0 AG真人转账超时 )', '3050', '9', 'https://wiki.yxunistar.com/x/4gg-B', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> AG Manual Rollback ( 5.0 AG真人转账超时 )');
insert into sys_menu values('4148',  '<PF2 SOP ASI> MGS2 Manual Rollback ( 5.0 MGS2真人转账超时 )', '<PF2 SOP ASI> MGS2 Manual Rollback ( 5.0 MGS2真人转账超时 )', '<PF2 SOP ASI> MGS2 Manual Rollback ( 5.0 MGS2真人转账超时 )', '3050', '10', 'https://wiki.yxunistar.com/x/Jgk-B', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> MGS2 Manual Rollback ( 5.0 MGS2真人转账超时 )');
insert into sys_menu values('4149',  '<PF2 SOP ASI> TTG Manual Rollback ( 5.0 TTG老虎機转账超时 )', '<PF2 SOP ASI> TTG Manual Rollback ( 5.0 TTG老虎機转账超时 )', '<PF2 SOP ASI> TTG Manual Rollback ( 5.0 TTG老虎機转账超时 )', '3050', '11', 'https://wiki.yxunistar.com/x/RAk-B', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> TTG Manual Rollback ( 5.0 TTG老虎機转账超时 )');
insert into sys_menu values('4150',  '<PF2 SOP ASI> Check Agent Reg Link / Check Promotion Link (檢查代理推廣註冊鏈結 )', '<PF2 SOP ASI> Check Agent Reg Link / Check Promotion Link (檢查代理推廣註冊鏈結 )', '<PF2 SOP ASI> Check Agent Reg Link / Check Promotion Link (檢查代理推廣註冊鏈結 )', '3050', '12', 'https://wiki.yxunistar.com/x/lI44', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> Check Agent Reg Link / Check Promotion Link (檢查代理推廣註冊鏈結 )');
insert into sys_menu values('4151',  '<PF2 SOP ASI> Withdrawal Status Modification (5.0 提现状态修改)', '<PF2 SOP ASI> Withdrawal Status Modification (5.0 提现状态修改)', '<PF2 SOP ASI> Withdrawal Status Modification (5.0 提现状态修改)', '3050', '13', 'https://wiki.yxunistar.com/x/0wiJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<PF2 SOP ASI> Withdrawal Status Modification (5.0 提现状态修改)');

insert into sys_menu values('4152',  '<SOP General> Casual Games Notification Process', '<SOP General> Casual Games Notification Process', '<SOP General> Casual Games Notification Process', '3051', '1', 'https://wiki.yxunistar.com/x/i404', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<SOP General> Casual Games Notification Process');
insert into sys_menu values('4153',  '<SOP General> Access asrsa@Prod-fortress1 (New Prod-Admin)', '<SOP General> Access asrsa@Prod-fortress1 (New Prod-Admin)', '<SOP General> Access asrsa@Prod-fortress1 (New Prod-Admin)', '3051', '2', 'https://wiki.yxunistar.com/x/PwOJAw', 'menuBlank', 'C', '1', '1', '',  'fa fa-tag',    'admin', sysdate(), '', null, '<SOP General> Access asrsa@Prod-fortress1 (New Prod-Admin)');


update sys_menu set order_num = 6 where menu_id = 3;
update sys_menu set order_num = 7 where menu_id = 4;
update sys_menu set order_num = 8 where menu_id = 5;