update sys_dict_data
set dict_label = '[ASP]PF1 DB Monitor',dict_value = '1',dict_sort = 1,remark = '1937111623:AAHDVpT1bezDDJ_Lf7HmyYCRd8mZeSlHCwM;-556556210'
where dict_code = 268 and dict_type = 'telegram_notice_group';

update sys_dict_data
set dict_label = '[ASP]PF2 DB Monitor',dict_value = '2',dict_sort = 2,remark = '1937111623:AAHDVpT1bezDDJ_Lf7HmyYCRd8mZeSlHCwM;-510877749'
where dict_code = 269 and dict_type = 'telegram_notice_group';

update sys_dict_data
set dict_label = '[ASP]PF1 LOG Monitor',dict_value = '3',dict_sort = 3,remark = '1937111623:AAHDVpT1bezDDJ_Lf7HmyYCRd8mZeSlHCwM;-519792370'
where dict_code = 270 and dict_type = 'telegram_notice_group';

update sys_dict_data
set dict_label = '[ASP]PF2 LOG Monitor',dict_value = '4',dict_sort = 4,remark = '1937111623:AAHDVpT1bezDDJ_Lf7HmyYCRd8mZeSlHCwM;-526906319'
where dict_code = 271 and dict_type = 'telegram_notice_group';

INSERT INTO sys_dict_data (dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) VALUES
	 (5,'[ASP]API Monitor','5','telegram_notice_group','','','N','0','admin',sysdate(),null,null,'1937111623:AAHDVpT1bezDDJ_Lf7HmyYCRd8mZeSlHCwM;-434015872');