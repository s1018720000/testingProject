update sys_menu
set menu_name = 'DB Monitor',menu_name_tw='DB Monitor',menu_name_us='DB Monitor'
where menu_id = 1;

update sys_menu
set menu_name = 'LOG Monitor',menu_name_tw='LOG Monitor',menu_name_us='LOG Monitor',icon = 'fa fa-desktop'
where menu_id = 7;


insert into sys_menu values('9', 'API Monitor', 'API Monitor', 'API Monitor', '0', '4', '#',                '',          'M', '0', '1', '', 'fa fa-desktop',          'admin', sysdate(), '', null, 'API Monitor目录');

update sys_menu
set parent_id = 9
where menu_name = 'API检测任务';

update sys_menu
set order_num = 5
where menu_id = 2;

update sys_menu
set order_num = 6
where menu_id = 3;

update sys_menu
set order_num = 7
where menu_id = 4;

update sys_menu
set order_num = 8
where menu_id = 5;