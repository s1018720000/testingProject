insert into sys_menu values('110',  '定时任务', '2', '2', '/monitor/job',          '', 'C', '0', '1', 'monitor:job:view',         'fa fa-tasks',           'admin', sysdate(), '', null, '定时任务菜单');


-- 定时任务菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('定时任务', '定時任務', 'System task', (select menu_id from sys_menu where menu_name = '系统监控'), '5', '/monitor/sysJob', 'C', '0', 'monitor:sysJob:view', 'fa fa-calendar', 'admin', sysdate(), '', null, '定时任务');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 定时任务按钮
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('任务查询', @parentId, '1',  '#',  'F', '0', 'monitor:sysJob:list',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('任务新增', @parentId, '2',  '#',  'F', '0', 'monitor:sysJob:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('任务修改', @parentId, '3',  '#',  'F', '0', 'monitor:sysJob:edit',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('任务删除', @parentId, '4',  '#',  'F', '0', 'monitor:sysJob:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('状态修改', @parentId, '5',  '#',  'F', '0', 'monitor:sysJob:changeStatus',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('任务详细', @parentId, '6',  '#',  'F', '0', 'monitor:sysJob:detail',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('任务导出', @parentId, '7',  '#',  'F', '0', 'monitor:sysJob:export',         '#', 'admin', sysdate(), '', null, '');

