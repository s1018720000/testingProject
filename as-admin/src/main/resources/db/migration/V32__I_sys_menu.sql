-- PF1资金来源菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('多平台订单比对', '多平臺訂單比對', 'Check Order', '2', '4', '/check/order', 'C', '0', 'check:order:view', '#', 'admin', sysdate(), '', null, '多平台订单比对');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF1资金来源按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('多平台订单比对查询', @parentId, '1',  '#',  'F', '0', 'check:order:list',         '#', 'admin', sysdate(), '', null, '');

