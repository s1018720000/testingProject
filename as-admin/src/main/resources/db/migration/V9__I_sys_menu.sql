-- 菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('Elastic任务', 'Elastic任務', 'Elastic Detect', '7', '1', '/monitor/elasticJob', 'C', '0', 'monitor:elasticJob:view', '#', 'admin', sysdate(), '', null, 'ElasticSearch任务菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务查询', @parentId, '1',  '#',  'F', '0', 'monitor:elasticJob:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务新增', @parentId, '2',  '#',  'F', '0', 'monitor:elasticJob:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务修改', @parentId, '3',  '#',  'F', '0', 'monitor:elasticJob:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务删除', @parentId, '4',  '#',  'F', '0', 'monitor:elasticJob:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务导出', @parentId, '5',  '#',  'F', '0', 'monitor:elasticJob:export',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务状态修改', @parentId, '6',  '#', 'F', '0',  'monitor:elasticJob:changeStatus',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务详细', @parentId, '7',  '#', 'F', '0', 'monitor:elasticJob:detail',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务执行一次', @parentId, '8',  '#', 'F', '0', 'monitor:elasticJob:runOnce',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务告警修改', @parentId, '10',  '#', 'F', '0', 'monitor:elasticJob:changeAlert',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务调度日志', @parentId, '11', '#', 'F', '0', 'monitor:elasticJobLog:view', '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务LOG查询', @parentId, '12',  '#',  'F', '0', 'monitor:elasticJobLog:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务LOG清空', @parentId, '13',  '#',  'F', '0', 'monitor:elasticJobLog:clear',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务LOG删除', @parentId, '14',  '#',  'F', '0', 'monitor:elasticJobLog:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('ElasticSearch任务LOG导出', @parentId, '15',  '#',  'F', '0', 'monitor:elasticJobLog:export',       '#', 'admin', sysdate(), '', null, '');