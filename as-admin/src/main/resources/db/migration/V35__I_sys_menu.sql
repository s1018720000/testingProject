-- 平台亏损告警 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('平台亏损', '平臺虧損', 'Platform Loss', '119', '1', '/rc/loss/platform', 'C', '0', 'loss:platform:view', 'fa fa-area-chart', 'admin', sysdate(), '', null, '平台亏损');

-- 平台亏损告警 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('玩法告警', '玩法告警', 'Play warning', '119', '2', '/rc/loss/play', 'C', '0', 'loss:play:view', 'fa fa-futbol-o', 'admin', sysdate(), '', null, '玩法告警');

-- 平台亏损告警 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('游戏告警', '遊戲告警', 'Game warning', '119', '3', '/rc/loss/game', 'C', '0', 'loss:game:view', 'fa fa-gamepad', 'admin', sysdate(), '', null, '游戏告警');

-- 平台亏损告警 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('订单告警', '訂單告警', 'Order warning', '119', '4', '/rc/loss/order', 'C', '0', 'loss:order:view', 'fa fa-bar-chart', 'admin', sysdate(), '', null, '订单告警');

-- 平台亏损告警 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户告警', '用戶告警', 'User warning', '119', '5', '/rc/loss/user', 'C', '0', 'loss:user:view', 'fa fa-user', 'admin', sysdate(), '', null, '用户告警');

