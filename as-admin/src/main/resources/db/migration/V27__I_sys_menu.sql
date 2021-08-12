-- PF1资金来源菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF1资金来源', 'PF1資金來源', 'PF1 Funds', '117', '1', '/funds/pf1', 'C', '0', 'funds:pf1:view', '#', 'admin', sysdate(), '', null, 'PF1资金来源菜单');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF1资金来源按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF1资金来源查询', @parentId, '1',  '#',  'F', '0', 'funds:pf1:list',         '#', 'admin', sysdate(), '', null, '');

-- PF2资金来源菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF2资金来源', 'PF2資金來源', 'PF2 Funds', '117', '2', '/funds/pf2', 'C', '0', 'funds:pf2:view', '#', 'admin', sysdate(), '', null, 'PF2资金来源菜单');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF1资金来源按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF2资金来源查询', @parentId, '1',  '#',  'F', '0', 'funds:pf2:list',         '#', 'admin', sysdate(), '', null, '');
