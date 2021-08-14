-- PF1资金来源菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('Platform 1.0', 'Platform 1.0', 'Platform 1.0', '118', '1', '/fundList/pf1', 'C', '0', 'fundList:pf1:view', '#', 'admin', sysdate(), '', null, 'PF1资金对账菜单');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF1资金来源按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF1资金对账查询', @parentId, '1',  '#',  'F', '0', 'fundList:pf1:list',         '#', 'admin', sysdate(), '', null, '');

-- PF2资金来源菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('Platform 5.0', 'Platform 5.0', 'Platform 5.0', '118', '2', '/fundList/pf2', 'C', '0', 'fundList:pf2:view', '#', 'admin', sysdate(), '', null, 'PF2资金对账菜单');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF1资金来源按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF2资金对账查询', @parentId, '1',  '#',  'F', '0', 'fundList:pf2:list',         '#', 'admin', sysdate(), '', null, '');
