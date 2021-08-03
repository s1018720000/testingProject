update sys_dict_data
set dict_value = '1.0'
where dict_code = 250 and dict_type = 'ub8_platform_type';

update sys_dict_data
set dict_value = '5.0'
where dict_code = 251 and dict_type = 'ub8_platform_type';

update sys_dict_data
set dict_sort = 2
where dict_code = 32 and dict_type = 'pf1_data_base_source';

update sys_dict_data
set dict_sort = 2
where dict_code = 34 and dict_type = 'pf2_data_base_source';

update sys_dict_data
set dict_sort = 3
where dict_code = 35 and dict_type = 'pf2_data_base_source';

update sys_dict_data
set dict_sort = 4
where dict_code = 36 and dict_type = 'pf2_data_base_source';

update sys_dict_data
set dict_sort = 5
where dict_code = 37 and dict_type = 'pf2_data_base_source';