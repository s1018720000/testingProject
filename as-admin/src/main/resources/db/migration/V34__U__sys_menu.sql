update sys_menu set url = '/query/db/pf1' where menu_id = 120;
update sys_menu set url = '/query/db/pf2' where menu_id = 121;
update sys_menu set url = '/query/db/as' where menu_id = 122;
delete from sys_menu where menu_id in (1062,1064,1066)