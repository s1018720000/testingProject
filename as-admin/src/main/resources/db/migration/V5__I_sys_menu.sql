-- 菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务', '自動報表任務', 'Auto Export', '1', '1', '/monitor/exportJob', 'C', '0', 'monitor:exportJob:view', '#', 'admin', sysdate(), '', null, '自动报表任务菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务查询', @parentId, '1',  '#',  'F', '0', 'monitor:exportJob:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务新增', @parentId, '2',  '#',  'F', '0', 'monitor:exportJob:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务修改', @parentId, '3',  '#',  'F', '0', 'monitor:exportJob:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务删除', @parentId, '4',  '#',  'F', '0', 'monitor:exportJob:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务导出', @parentId, '5',  '#',  'F', '0', 'monitor:exportJob:export',       '#', 'admin', sysdate(), '', null, '');


insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务状态修改', @parentId, '6',  '#', 'F', '0',  'monitor:exportJob:changeStatus',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务详细', @parentId, '7',  '#', 'F', '0', 'monitor:exportJob:detail',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务执行一次', @parentId, '8',  '#', 'F', '0', 'monitor:exportJob:runOnce',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务调度日志', @parentId, '9', '#', 'F', '0', 'monitor:exportJobLog:view', '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务LOG查询', @parentId, '10',  '#',  'F', '0', 'monitor:exportJobLog:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务LOG清空', @parentId, '11',  '#',  'F', '0', 'monitor:exportJobLog:clear',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务LOG删除', @parentId, '12',  '#',  'F', '0', 'monitor:exportJobLog:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('自动报表任务LOG导出', @parentId, '13',  '#',  'F', '0', 'monitor:exportJobLog:export',       '#', 'admin', sysdate(), '', null, '');
