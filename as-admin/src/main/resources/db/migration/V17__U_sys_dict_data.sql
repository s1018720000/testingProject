update sys_dict_data
set is_default = 'N'
where dict_code = 31 and dict_type = 'pf1_data_base_source';

update sys_dict_data
set is_default = 'Y'
where dict_code = 32 and dict_type = 'pf1_data_base_source';

update sys_dict_data
set is_default = 'N'
where dict_code = 33 and dict_type = 'pf2_data_base_source';

update sys_dict_data
set is_default = 'Y'
where dict_code = 34 and dict_type = 'pf2_data_base_source';