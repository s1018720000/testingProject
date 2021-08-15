-- PF1资金来源菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户盈亏历史数据', '客戶盈虧歷史數據', 'Fund History', '2', '5', '/fund/history', 'C', '0', 'fund:history:view', '#', 'admin', sysdate(), '', null, '客户盈亏历史数据');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF1资金来源按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户盈亏历史数据查询', @parentId, '1',  '#',  'F', '0', 'fund:history:list',         '#', 'admin', sysdate(), '', null, '');

