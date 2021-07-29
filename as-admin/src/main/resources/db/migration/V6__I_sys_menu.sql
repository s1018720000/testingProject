-- 菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('监控表盘', '監控表盤', 'Dashboard', '4', '5', '/monitor/dashboard', 'C', '0', 'monitor:dashboard:view', '#', 'admin', sysdate(), '', null, '监控表盘菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('监控表盘告警开关', @parentId, '2',  '#',  'F', '0', 'monitor:dashboard:switch',         '#', 'admin', sysdate(), '', null, '');
