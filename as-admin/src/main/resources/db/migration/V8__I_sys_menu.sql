-- 菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测任务', 'API檢測任務', 'API Detect', '1', '3', '/monitor/apiJob', 'C', '0', 'monitor:apiJob:view', '#', 'admin', sysdate(), '', null, 'API检测任务菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测任务查询', @parentId, '1',  '#',  'F', '0', 'monitor:apiJob:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测任务新增', @parentId, '2',  '#',  'F', '0', 'monitor:apiJob:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测任务修改', @parentId, '3',  '#',  'F', '0', 'monitor:apiJob:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测任务删除', @parentId, '4',  '#',  'F', '0', 'monitor:apiJob:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测任务导出', @parentId, '5',  '#',  'F', '0', 'monitor:apiJob:export',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测状态修改', @parentId, '6',  '#', 'F', '0',  'monitor:apiJob:changeStatus',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测详细', @parentId, '7',  '#', 'F', '0', 'monitor:apiJob:detail',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测执行一次', @parentId, '8',  '#', 'F', '0', 'monitor:apiJob:runOnce',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测告警修改', @parentId, '10',  '#', 'F', '0', 'monitor:apiJob:changeAlert',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测调度日志', @parentId, '11', '#', 'F', '0', 'monitor:apiJobLog:view', '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测LOG查询', @parentId, '12',  '#',  'F', '0', 'monitor:apiJobLog:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测LOG清空', @parentId, '13',  '#',  'F', '0', 'monitor:apiJobLog:clear',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测LOG删除', @parentId, '14',  '#',  'F', '0', 'monitor:apiJobLog:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测LOG导出', @parentId, '15',  '#',  'F', '0', 'monitor:apiJobLog:export',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('API检测LOG详细', @parentId, '16',  '#',  'F', '0', 'monitor:apiJobLog:detail',       '#', 'admin', sysdate(), '', null, '');