-- ----------------------------
-- 1、部门表
-- ----------------------------
drop table if exists sys_dept;
create table sys_dept (
  dept_id           bigint(20)      not null auto_increment    comment '部门id',
  parent_id         bigint(20)      default 0                  comment '父部门id',
  ancestors         varchar(50)     default ''                 comment '祖级列表',
  dept_name         varchar(30)     default ''                 comment '部门名称',
  order_num         int(4)          default 0                  comment '显示顺序',
  leader            varchar(20)     default null               comment '负责人',
  email             varchar(50)     default null               comment '邮箱',
  status            char(1)         default '0'                comment '部门状态（0正常 1停用）',
  del_flag          char(1)         default '0'                comment '删除标志（0代表存在 2代表删除）',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 	    datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  primary key (dept_id)
) engine=innodb charset=utf8 auto_increment=200 comment = '部门表';

-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          'CPG',   0, '',  '', '0', '0', 'admin', sysdate(), '', null);

insert into sys_dept values(101,  100, '0,100',  'UBG',   1, '',  '', '0', '0', 'admin', sysdate(), '', null);

insert into sys_dept values(102,  101, '0,100,101',  'UNS',   1, 'Frank.s',  'frank.s@yxunistar.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(103,  101, '0,100,101',  'OD',   2, 'Mario',  'mario@my-cpg.com', '0', '0', 'admin', sysdate(), '', null);

insert into sys_dept values(104,  102, '0,100,101,102',  'AS',   1, 'Jason.liang',  'jason.liang@yxunistar.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(105,  103, '0,100,101,103',  'DRC',   1, 'Jarry.z',  'jarry.z@my-cpg.com', '0', '0', 'admin', sysdate(), '', null);



-- ----------------------------
-- 2、用户信息表
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
  user_id           bigint(20)      not null auto_increment    comment '用户ID',
  dept_id           bigint(20)      default null               comment '部门ID',
  login_name        varchar(30)     not null                   comment '登录账号',
  user_name         varchar(30)     default ''                 comment '用户昵称',
  user_type         varchar(2)      default '00'               comment '用户类型（00系统用户 01注册用户）',
  email             varchar(50)     default ''                 comment '用户邮箱',
  sex               char(1)         default '0'                comment '用户性别（0男 1女 2未知）',
  avatar            varchar(100)    default ''                 comment '头像路径',
  password          varchar(50)     default ''                 comment '密码',
  salt              varchar(20)     default ''                 comment '盐加密',
  status            char(1)         default '0'                comment '帐号状态（0正常 1停用）',
  del_flag          char(1)         default '0'                comment '删除标志（0代表存在 2代表删除）',
  login_ip          varchar(128)    default ''                 comment '最后登录IP',
  login_date        datetime                                   comment '最后登录时间',
  pwd_update_date   datetime                                   comment '密码最后更新时间',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time       datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark            varchar(500)    default null               comment '备注',
  primary key (user_id)
) engine=innodb charset=utf8 auto_increment=100 comment = '用户信息表';

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1,  104, 'admin', '管理员', '00', '', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, '管理员');
insert into sys_user values(2,  104, 'testAs',    'testAs', '00', '', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, 'AS测试账号');


-- ----------------------------
-- 3、岗位信息表
-- ----------------------------
drop table if exists sys_post;
create table sys_post
(
  post_id       bigint(20)      not null auto_increment    comment '岗位ID',
  post_code     varchar(64)     not null                   comment '岗位编码',
  post_name     varchar(50)     not null                   comment '岗位名称',
  post_sort     int(4)          not null                   comment '显示顺序',
  status        char(1)         not null                   comment '状态（0正常 1停用）',
  create_by     varchar(64)     default ''                 comment '创建者',
  create_time   datetime                                   comment '创建时间',
  update_by     varchar(64)     default ''			       comment '更新者',
  update_time   datetime                                   comment '更新时间',
  remark        varchar(500)    default null               comment '备注',
  primary key (post_id)
) engine=innodb charset=utf8 comment = '岗位信息表';

-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
insert into sys_post values(1, 'SUP',  '主管/SUP',    1, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(2, 'TL',   '组长/TL',  2, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(3, 'USER', '员工/USER',  3, '0', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 4、角色信息表
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
  role_id           bigint(20)      not null auto_increment    comment '角色ID',
  role_name         varchar(30)     not null                   comment '角色名称',
  role_key          varchar(100)    not null                   comment '角色权限字符串',
  role_sort         int(4)          not null                   comment '显示顺序',
  data_scope        char(1)         default '1'                comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  status            char(1)         not null                   comment '角色状态（0正常 1停用）',
  del_flag          char(1)         default '0'                comment '删除标志（0代表存在 2代表删除）',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time       datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark            varchar(500)    default null               comment '备注',
  primary key (role_id)
) engine=innodb charset=utf8 auto_increment=100 comment = '角色信息表';

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values('1', '超级管理员', 'admin',  1, 1, '0', '0', 'admin', sysdate(), '', null, '超级管理员');
insert into sys_role values('2', 'AS_L2',   'as_l2', 2, 2, '0', '0', 'admin', sysdate(), '', null, 'AS_L2');
insert into sys_role values('3', 'AS_L1',   'as_l1', 3, 2, '0', '0', 'admin', sysdate(), '', null, 'AS_L1');
insert into sys_role values('4', 'RC',   'rc', 4, 3, '0', '0', 'admin', sysdate(), '', null, 'RC');


-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
  menu_id           bigint(20)      not null auto_increment    comment '菜单ID',
  menu_name         varchar(50)     not null                   comment '菜单名称(简体)',
  menu_name_tw      varchar(50)     default ''                   comment '菜单名称(繁体)',
  menu_name_us      varchar(50)     default ''                   comment '菜单名称(英文)',
  parent_id         bigint(20)      default 0                  comment '父菜单ID',
  order_num         int(4)          default 0                  comment '显示顺序',
  url               varchar(200)    default '#'                comment '请求地址',
  target            varchar(20)     default ''                 comment '打开方式（menuItem页签 menuBlank新窗口）',
  menu_type         char(1)         default ''                 comment '菜单类型（M目录 C菜单 F按钮）',
  visible           char(1)         default 0                  comment '菜单状态（0显示 1隐藏）',
  is_refresh        char(1)         default 1                  comment '是否刷新（0刷新 1不刷新）',
  perms             varchar(100)    default null               comment '权限标识',
  icon              varchar(100)    default '#'                comment '菜单图标',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time       datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark            varchar(500)    default ''                 comment '备注',
  primary key (menu_id)
) engine=innodb charset=utf8 auto_increment=2000 comment = '菜单权限表';

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
insert into sys_menu values('1', 'AS Monitor', 'AS Monitor', 'AS Monitor', '0', '2', '#',             '',          'M', '0', '1', '', 'fa fa-desktop',           'admin', sysdate(), '', null, 'AS Monitor目录');
insert into sys_menu values('2', 'RC Tool', 'RC Tool', 'RC Tool','0', '4', '#',                '',          'M', '0', '1', '', 'fa fa-handshake-o',           'admin', sysdate(), '', null, 'RC Tool目录');
insert into sys_menu values('3', '系统管理', '系統管理', 'System Management', '0', '5', '#',                '',          'M', '0', '1', '', 'fa fa-gear',           'admin', sysdate(), '', null, '系统管理目录');
insert into sys_menu values('4', '系统监控', '系統監控', 'System Monitoring', '0', '6', '#',                '',          'M', '0', '1', '', 'fa fa-video-camera',   'admin', sysdate(), '', null, '系统监控目录');
insert into sys_menu values('5', '开发工具', '開發工具', 'Development Tools', '0', '7', '#',                '',          'M', '0', '1', '', 'fa fa-wrench',          'admin', sysdate(), '', null, '开发工具目录');
insert into sys_menu values('6', 'DB QUERY', 'DB QUERY', 'DB QUERY', '0', '1', '#',                '',          'M', '0', '1', '', 'fa fa-database',          'admin', sysdate(), '', null, 'DB QUERY目录');
insert into sys_menu values('7', 'GY Monitor', 'GY Monitor', 'GY Monitor', '0', '3', '#',                '',          'M', '0', '1', '', 'fa fa-tv',          'admin', sysdate(), '', null, 'GY Monitor目录');
-- 二级菜单
insert into sys_menu values('120',  'PF1 Sql Query', 'PF1 Sql Query', 'PF1 Sql Query', '6', '1', '/query/pf1',          '', 'C', '0', '1', 'query:pf1:view',         'fa fa-star-o',          'admin', sysdate(), '', null, 'PF1 Sql Query菜单');
insert into sys_menu values('121',  'PF2 Sql Query', 'PF2 Sql Query', 'PF2 Sql Query', '6', '1', '/query/pf2',          '', 'C', '0', '1', 'query:pf2:view',         'fa fa-star',          'admin', sysdate(), '', null, 'PF2 Sql Query菜单');
insert into sys_menu values('122',  'AS Sql Query', 'AS Sql Query', 'AS Sql Query', '6', '1', '/query/as',          '', 'C', '0', '1', 'query:as:view',         'fa fa-star-half-full',          'admin', sysdate(), '', null, 'AS Sql Query菜单');
insert into sys_menu values('116',  '订单查询', '訂單查詢', 'Order Query', '2', '1', '#',          '', 'M', '0', '1', '',         'fa fa-search',          'admin', sysdate(), '', null, '订单查询目录');
insert into sys_menu values('117',  '资金来源', '資金來源', 'Sources of Funds', '2', '2', '#',          '', 'M', '0', '1', '',         'fa fa-money',          'admin', sysdate(), '', null, '资金来源目录');
insert into sys_menu values('118',  '资金对账', '資金對賬', 'Fund List', '2', '3', '#',          '', 'M', '0', '1', '',         'fa fa-calculator',          'admin', sysdate(), '', null, '资金对账目录');
insert into sys_menu values('119',  '告警', '告警', 'Loss', '2', '4', '#',          '', 'M', '0', '1', '',         'fa fa-warning',          'admin', sysdate(), '', null, '告警目录');
insert into sys_menu values('100',  '用户管理', '用戶管理', 'User Management', '3', '1', '/system/user',          '', 'C', '0', '1', 'system:user:view',         'fa fa-user-o',          'admin', sysdate(), '', null, '用户管理菜单');
insert into sys_menu values('101',  '角色管理', '角色管理', 'Role Management', '3', '2', '/system/role',          '', 'C', '0', '1', 'system:role:view',         'fa fa-user-secret',     'admin', sysdate(), '', null, '角色管理菜单');
insert into sys_menu values('102',  '菜单管理', '菜單管理 ', 'Menu Management', '3', '3', '/system/menu',          '', 'C', '0', '1', 'system:menu:view',         'fa fa-th-list',         'admin', sysdate(), '', null, '菜单管理菜单');
insert into sys_menu values('103',  '部门管理', '部門管理', 'Dept Management', '3', '4', '/system/dept',          '', 'C', '0', '1', 'system:dept:view',         'fa fa-outdent',         'admin', sysdate(), '', null, '部门管理菜单');
insert into sys_menu values('104',  '岗位管理', '崗位管理', 'Post Management', '3', '5', '/system/post',          '', 'C', '0', '1', 'system:post:view',         'fa fa-address-card-o',  'admin', sysdate(), '', null, '岗位管理菜单');
insert into sys_menu values('105',  '字典管理', '字典管理', 'Dict Management', '3', '6', '/system/dict',          '', 'C', '0', '1', 'system:dict:view',         'fa fa-bookmark-o',      'admin', sysdate(), '', null, '字典管理菜单');
insert into sys_menu values('106',  '参数设置', '參數設置', 'Parameter Settings', '3', '7', '/system/config',        '', 'C', '0', '1', 'system:config:view',       'fa fa-sun-o',           'admin', sysdate(), '', null, '参数设置菜单');
insert into sys_menu values('107',  '通知公告', '通知公告', 'Broadcast', '3', '8', '/system/notice',        '', 'C', '0', '1', 'system:notice:view',       'fa fa-bullhorn',        'admin', sysdate(), '', null, '通知公告菜单');
insert into sys_menu values('108',  '日志管理', '日志管理', 'Log Management', '3', '9', '#',                     '', 'M', '0', '1', '',                         'fa fa-pencil-square-o', 'admin', sysdate(), '', null, '日志管理菜单');
insert into sys_menu values('109',  '在线用户', '在綫用戶', 'Online User', '4', '1', '/monitor/online',       '', 'C', '0', '1', 'monitor:online:view',      'fa fa-user-circle',     'admin', sysdate(), '', null, '在线用户菜单');
insert into sys_menu values('110',  '数据监控', '數據監控', 'Data Monitoring', '4', '2', '/monitor/data',         '', 'C', '0', '1', 'monitor:data:view',        'fa fa-bug',             'admin', sysdate(), '', null, '数据监控菜单');
insert into sys_menu values('111',  '服务监控', '服務監控', 'Service Monitoring', '4', '3', '/monitor/server',       '', 'C', '0', '1', 'monitor:server:view',      'fa fa-server',          'admin', sysdate(), '', null, '服务监控菜单');
insert into sys_menu values('112',  '缓存监控', '緩存監控', 'Cache Monitoring', '4', '4', '/monitor/cache',        '', 'C', '0', '1', 'monitor:cache:view',       'fa fa-cube',            'admin', sysdate(), '', null, '缓存监控菜单');
insert into sys_menu values('113',  '表单构建', '表單構建', 'Form Construction', '5', '1', '/tool/build',           '', 'C', '0', '1', 'tool:build:view',          'fa fa-wpforms',         'admin', sysdate(), '', null, '表单构建菜单');
insert into sys_menu values('114',  '代码生成', '代碼生成', 'Code Generation', '5', '2', '/tool/gen',             '', 'C', '0', '1', 'tool:gen:view',            'fa fa-code',            'admin', sysdate(), '', null, '代码生成菜单');
insert into sys_menu values('115',  '系统接口', '系統接口', 'System API', '5', '3', '/tool/swagger',         '', 'C', '0', '1', 'tool:swagger:view',        'fa fa-gg',              'admin', sysdate(), '', null, '系统接口菜单');
-- 三级菜单
insert into sys_menu values('500',  '操作日志', '操作日志', 'Operation Log', '108', '1', '/monitor/operlog',    '', 'C', '0', '1', 'monitor:operlog:view',     'fa fa-address-book',    'admin', sysdate(), '', null, '操作日志菜单');
insert into sys_menu values('501',  '登录日志', '登錄日志', 'Login Log', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view',  'fa fa-file-image-o',    'admin', sysdate(), '', null, '登录日志菜单');

-- PF1 Sql Query按钮
insert into sys_menu values('1062', 'PF1查询', '', '', '120', '1',  '#', '',  'F', '0', '1', 'query:as:query',        '#', 'admin', sysdate(), '', null, '');

-- PF2 Sql Query按钮
insert into sys_menu values('1064', 'PF2查询', '', '', '121', '1',  '#', '',  'F', '0', '1', 'query:pf1:query',        '#', 'admin', sysdate(), '', null, '');

-- AS Sql Query按钮
insert into sys_menu values('1066', 'AS查询', '', '', '122', '1',  '#', '',  'F', '0', '1', 'query:pf2:query',        '#', 'admin', sysdate(), '', null, '');

-- 用户管理按钮
insert into sys_menu values('1000', '用户查询', '', '', '100', '1',  '#', '',  'F', '0', '1', 'system:user:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1001', '用户新增', '', '', '100', '2',  '#', '',  'F', '0', '1', 'system:user:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1002', '用户修改', '', '', '100', '3',  '#', '',  'F', '0', '1', 'system:user:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1003', '用户删除', '', '', '100', '4',  '#', '',  'F', '0', '1', 'system:user:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1004', '用户导出', '', '', '100', '5',  '#', '',  'F', '0', '1', 'system:user:export',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1005', '用户导入', '', '', '100', '6',  '#', '',  'F', '0', '1', 'system:user:import',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1006', '重置密码', '', '', '100', '7',  '#', '',  'F', '0', '1', 'system:user:resetPwd',    '#', 'admin', sysdate(), '', null, '');
-- 角色管理按钮
insert into sys_menu values('1007', '角色查询', '', '', '101', '1',  '#', '',  'F', '0', '1', 'system:role:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1008', '角色新增', '', '', '101', '2',  '#', '',  'F', '0', '1', 'system:role:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1009', '角色修改', '', '', '101', '3',  '#', '',  'F', '0', '1', 'system:role:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1010', '角色删除', '', '', '101', '4',  '#', '',  'F', '0', '1', 'system:role:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1011', '角色导出', '', '', '101', '5',  '#', '',  'F', '0', '1', 'system:role:export',      '#', 'admin', sysdate(), '', null, '');
-- 菜单管理按钮
insert into sys_menu values('1012', '菜单查询', '', '', '102', '1',  '#', '',  'F', '0', '1', 'system:menu:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1013', '菜单新增', '', '', '102', '2',  '#', '',  'F', '0', '1', 'system:menu:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1014', '菜单修改', '', '', '102', '3',  '#', '',  'F', '0', '1', 'system:menu:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1015', '菜单删除', '', '', '102', '4',  '#', '',  'F', '0', '1', 'system:menu:remove',      '#', 'admin', sysdate(), '', null, '');
-- 部门管理按钮
insert into sys_menu values('1016', '部门查询', '', '', '103', '1',  '#', '',  'F', '0', '1', 'system:dept:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1017', '部门新增', '', '', '103', '2',  '#', '',  'F', '0', '1', 'system:dept:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1018', '部门修改', '', '', '103', '3',  '#', '',  'F', '0', '1', 'system:dept:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1019', '部门删除', '', '', '103', '4',  '#', '',  'F', '0', '1', 'system:dept:remove',      '#', 'admin', sysdate(), '', null, '');
-- 岗位管理按钮
insert into sys_menu values('1020', '岗位查询', '', '', '104', '1',  '#', '',  'F', '0', '1', 'system:post:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1021', '岗位新增', '', '', '104', '2',  '#', '',  'F', '0', '1', 'system:post:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1022', '岗位修改', '', '', '104', '3',  '#', '',  'F', '0', '1', 'system:post:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1023', '岗位删除', '', '', '104', '4',  '#', '',  'F', '0', '1', 'system:post:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1024', '岗位导出', '', '', '104', '5',  '#', '',  'F', '0', '1', 'system:post:export',      '#', 'admin', sysdate(), '', null, '');
-- 字典管理按钮
insert into sys_menu values('1025', '字典查询', '', '', '105', '1',  '#', '',  'F', '0', '1', 'system:dict:list',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1026', '字典新增', '', '', '105', '2',  '#', '',  'F', '0', '1', 'system:dict:add',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1027', '字典修改', '', '', '105', '3',  '#', '',  'F', '0', '1', 'system:dict:edit',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1028', '字典删除', '', '', '105', '4',  '#', '',  'F', '0', '1', 'system:dict:remove',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1029', '字典导出', '', '', '105', '5',  '#', '',  'F', '0', '1', 'system:dict:export',      '#', 'admin', sysdate(), '', null, '');
-- 参数设置按钮
insert into sys_menu values('1030', '参数查询', '', '', '106', '1',  '#', '',  'F', '0', '1', 'system:config:list',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1031', '参数新增', '', '', '106', '2',  '#', '',  'F', '0', '1', 'system:config:add',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1032', '参数修改', '', '', '106', '3',  '#', '',  'F', '0', '1', 'system:config:edit',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1033', '参数删除', '', '', '106', '4',  '#', '',  'F', '0', '1', 'system:config:remove',    '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1034', '参数导出', '', '', '106', '5',  '#', '',  'F', '0', '1', 'system:config:export',    '#', 'admin', sysdate(), '', null, '');
-- 通知公告按钮
insert into sys_menu values('1035', '公告查询', '', '', '107', '1',  '#', '',  'F', '0', '1', 'system:notice:list',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1036', '公告新增', '', '', '107', '2',  '#', '',  'F', '0', '1', 'system:notice:add',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1037', '公告修改', '', '', '107', '3',  '#', '',  'F', '0', '1', 'system:notice:edit',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1038', '公告删除', '', '', '107', '4',  '#', '',  'F', '0', '1', 'system:notice:remove',    '#', 'admin', sysdate(), '', null, '');
-- 操作日志按钮
insert into sys_menu values('1039', '操作查询', '', '', '500', '1',  '#', '',  'F', '0', '1', 'monitor:operlog:list',    '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1040', '操作删除', '', '', '500', '2',  '#', '',  'F', '0', '1', 'monitor:operlog:remove',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1041', '详细信息', '', '', '500', '3',  '#', '',  'F', '0', '1', 'monitor:operlog:detail',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1042', '日志导出', '', '', '500', '4',  '#', '',  'F', '0', '1', 'monitor:operlog:export',  '#', 'admin', sysdate(), '', null, '');
-- 登录日志按钮
insert into sys_menu values('1043', '登录查询', '', '', '501', '1',  '#', '',  'F', '0', '1', 'monitor:logininfor:list',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1044', '登录删除', '', '', '501', '2',  '#', '',  'F', '0', '1', 'monitor:logininfor:remove',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1045', '日志导出', '', '', '501', '3',  '#', '',  'F', '0', '1', 'monitor:logininfor:export',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1046', '账户解锁', '', '', '501', '4',  '#', '',  'F', '0', '1', 'monitor:logininfor:unlock',       '#', 'admin', sysdate(), '', null, '');
-- 在线用户按钮
insert into sys_menu values('1047', '在线查询', '', '', '109', '1',  '#', '',  'F', '0', '1', 'monitor:online:list',             '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1048', '批量强退', '', '', '109', '2',  '#', '',  'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1049', '单条强退', '', '', '109', '3',  '#', '',  'F', '0', '1', 'monitor:online:forceLogout',      '#', 'admin', sysdate(), '', null, '');
-- 代码生成按钮
insert into sys_menu values('1050', '生成查询', '', '', '114', '1',  '#', '',  'F', '0', '1', 'tool:gen:list',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1051', '生成修改', '', '', '114', '2',  '#', '',  'F', '0', '1', 'tool:gen:edit',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1052', '生成删除', '', '', '114', '3',  '#', '',  'F', '0', '1', 'tool:gen:remove',   '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1053', '预览代码', '', '', '114', '4',  '#', '',  'F', '0', '1', 'tool:gen:preview',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1054', '生成代码', '', '', '114', '5',  '#', '',  'F', '0', '1', 'tool:gen:code',     '#', 'admin', sysdate(), '', null, '');

-- PF1订单查询菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF1订单查询', 'PF1訂單查詢', 'PF1 Order', '116', '1', '/order/pf1', 'C', '0', 'order:pf1:view', '#', 'admin', sysdate(), '', null, 'PF1订单查询菜单');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF1订单查询按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF1订单查询', @parentId, '1',  '#',  'F', '0', 'order:pf1:list',         '#', 'admin', sysdate(), '', null, '');
-- PF2订单查询菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF2订单查询', 'PF2訂單查詢', 'PF2 Order', '116', '1', '/order/pf2', 'C', '0', 'order:pf2:view', '#', 'admin', sysdate(), '', null, 'PF2订单查询菜单');
-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();
-- PF2订单查询按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('PF2订单查询', @parentId, '1',  '#',  'F', '0', 'order:pf2:list',         '#', 'admin', sysdate(), '', null, '');

-- SQL JOB菜单 SQL
insert into sys_menu (menu_name, menu_name_tw, menu_name_us, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务', 'SQL檢測任務', 'SQL Detect', '1', '1', '/monitor/sqlJob', 'C', '0', 'monitor:sqlJob:view', '#', 'admin', sysdate(), '', null, 'SQL检测任务菜单');

-- SQL JOB按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- SQL JOB按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务查询', @parentId, '1',  '#',  'F', '0', 'monitor:sqlJob:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务新增', @parentId, '2',  '#',  'F', '0', 'monitor:sqlJob:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务修改', @parentId, '3',  '#',  'F', '0', 'monitor:sqlJob:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务删除', @parentId, '4',  '#',  'F', '0', 'monitor:sqlJob:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务导出', @parentId, '5',  '#',  'F', '0', 'monitor:sqlJob:export',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务状态修改', @parentId, '6',  '#', 'F', '0',  'monitor:sqlJob:changeStatus',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务详细', @parentId, '7',  '#', 'F', '0', 'monitor:sqlJob:detail',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务执行一次', @parentId, '8',  '#', 'F', '0', 'monitor:sqlJob:runOnce',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务告警修改', @parentId, '10',  '#', 'F', '0', 'monitor:sqlJob:changeAlert',              '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任务调度日志', @parentId, '11', '#', 'F', '0', 'monitor:sqlJobLog:view', '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任務LOG查询', @parentId, '12',  '#',  'F', '0', 'monitor:sqlJobLog:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任務LOG清空', @parentId, '13',  '#',  'F', '0', 'monitor:sqlJobLog:clear',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任務LOG删除', @parentId, '14',  '#',  'F', '0', 'monitor:sqlJobLog:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任務LOG导出', @parentId, '15',  '#',  'F', '0', 'monitor:sqlJobLog:export',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任務LOG详细', @parentId, '16',  '#',  'F', '0', 'monitor:sqlJobLog:detail',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('SQL检测任務LOG回调', @parentId, '17',  '#',  'F', '0', 'monitor:sqlJobLog:callback',       '#', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
  user_id   bigint(20) not null comment '用户ID',
  role_id   bigint(20) not null comment '角色ID',
  primary key(user_id, role_id)
) engine=innodb charset=utf8 comment = '用户和角色关联表';

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
  role_id   bigint(20) not null comment '角色ID',
  menu_id   bigint(20) not null comment '菜单ID',
  primary key(role_id, menu_id)
) engine=innodb charset=utf8 comment = '角色和菜单关联表';

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '5');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '116');
insert into sys_role_menu values ('2', '117');
insert into sys_role_menu values ('2', '118');
insert into sys_role_menu values ('2', '119');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');
insert into sys_role_menu values ('2', '1061');

-- ----------------------------
-- 8、角色和部门关联表  角色1-N部门
-- ----------------------------
drop table if exists sys_role_dept;
create table sys_role_dept (
  role_id   bigint(20) not null comment '角色ID',
  dept_id   bigint(20) not null comment '部门ID',
  primary key(role_id, dept_id)
) engine=innodb charset=utf8 comment = '角色和部门关联表';

-- ----------------------------
-- 初始化-角色和部门关联表数据
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '102');
insert into sys_role_dept values ('2', '104');
insert into sys_role_dept values ('3', '100');
insert into sys_role_dept values ('3', '101');
insert into sys_role_dept values ('3', '102');
insert into sys_role_dept values ('3', '104');
insert into sys_role_dept values ('4', '100');
insert into sys_role_dept values ('4', '101');
insert into sys_role_dept values ('4', '103');
insert into sys_role_dept values ('4', '105');

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post
(
  user_id   bigint(20) not null comment '用户ID',
  post_id   bigint(20) not null comment '岗位ID',
  primary key (user_id, post_id)
) engine=innodb charset=utf8 comment = '用户与岗位关联表';

-- ----------------------------
-- 初始化-用户与岗位关联表数据
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '3');


-- ----------------------------
-- 10、操作日志记录
-- ----------------------------
drop table if exists sys_oper_log;
create table sys_oper_log (
  oper_id           bigint(20)      not null auto_increment    comment '日志主键',
  title             varchar(50)     default ''                 comment '模块标题',
  business_type     int(2)          default 0                  comment '业务类型（0其它 1新增 2修改 3删除）',
  method            varchar(100)    default ''                 comment '方法名称',
  request_method    varchar(10)     default ''                 comment '请求方式',
  operator_type     int(1)          default 0                  comment '操作类别（0其它 1后台用户 2手机端用户）',
  oper_name         varchar(50)     default ''                 comment '操作人员',
  dept_name         varchar(50)     default ''                 comment '部门名称',
  oper_url          varchar(255)    default ''                 comment '请求URL',
  oper_ip           varchar(128)    default ''                 comment '主机地址',
  oper_location     varchar(255)    default ''                 comment '操作地点',
  oper_param        varchar(2000)   default ''                 comment '请求参数',
  json_result       varchar(2000)   default ''                 comment '返回参数',
  status            int(1)          default 0                  comment '操作状态（0正常 1异常）',
  error_msg         varchar(2000)   default ''                 comment '错误消息',
  oper_time         datetime                                   comment '操作时间',
  primary key (oper_id)
) engine=innodb charset=utf8 auto_increment=100 comment = '操作日志记录';


-- ----------------------------
-- 11、字典类型表
-- ----------------------------
drop table if exists sys_dict_type;
create table sys_dict_type
(
  dict_id          bigint(20)      not null auto_increment    comment '字典主键',
  dict_name        varchar(100)    default ''                 comment '字典名称',
  dict_type        varchar(100)    default ''                 comment '字典类型',
  status           char(1)         default '0'                comment '状态（0正常 1停用）',
  create_by        varchar(64)     default ''                 comment '创建者',
  create_time      datetime                                   comment '创建时间',
  update_by        varchar(64)     default ''                 comment '更新者',
  update_time      datetime                                   comment '更新时间',
  remark           varchar(500)    default null               comment '备注',
  primary key (dict_id),
  unique (dict_type)
) engine=innodb charset=utf8 auto_increment=100 comment = '字典类型表';

insert into sys_dict_type values(1,  '用户性别', 'sys_user_sex',        '0', 'admin', sysdate(), '', null, '用户性别列表');
insert into sys_dict_type values(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', sysdate(), '', null, '菜单状态列表');
insert into sys_dict_type values(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', sysdate(), '', null, '系统开关列表');
insert into sys_dict_type values(4,  '任务状态', 'sys_job_status',      '0', 'admin', sysdate(), '', null, '任务状态列表');
insert into sys_dict_type values(5,  '任务分组', 'sys_job_group',       '1', 'admin', sysdate(), '', null, '任务分组列表');
insert into sys_dict_type values(6,  '系统是否', 'sys_yes_no',          '0', 'admin', sysdate(), '', null, '系统是否列表');
insert into sys_dict_type values(7,  '通知类型', 'sys_notice_type',     '0', 'admin', sysdate(), '', null, '通知类型列表');
insert into sys_dict_type values(8,  '通知状态', 'sys_notice_status',   '0', 'admin', sysdate(), '', null, '通知状态列表');
insert into sys_dict_type values(9,  '操作类型', 'sys_oper_type',       '0', 'admin', sysdate(), '', null, '操作类型列表');
insert into sys_dict_type values(10, '系统状态', 'sys_common_status',   '0', 'admin', sysdate(), '', null, '登录状态列表');
insert into sys_dict_type values(11, 'AS数据源', 'as_data_base_source',    '0', 'admin', sysdate(), '', null, 'AS数据源信息');
insert into sys_dict_type values(12, 'PF1数据源', 'pf1_data_base_source',    '0', 'admin', sysdate(), '', null, 'PF1数据源信息');
insert into sys_dict_type values(13, 'PF2数据源', 'pf2_data_base_source',    '0', 'admin', sysdate(), '', null, 'PF2数据源信息');
INSERT INTO sys_dict_type values(14, '通知群组','telegram_notice_group','0','admin',sysdate(),'',NULL,'telegram通知群组');
INSERT INTO sys_dict_type values(15, '交易类型(PF2)','pf2_transaction_type','0','admin',sysdate(),'',NULL,'PF2交易类型字典');
INSERT INTO sys_dict_type values(16, '自动比对','job_auto_comparison','0','admin',sysdate(),'',NULL,'job执行结果自动比对');
INSERT INTO sys_dict_type values(17, '系统平台','ub8_platform_type','0','admin',sysdate(),'',NULL,'系统平台列表');
INSERT INTO sys_dict_type values(18, '实施项目','job_call_who','0','admin',sysdate(),'',NULL,'实施项目列表');
INSERT INTO sys_dict_type values(19, '请求人员','job_requester_list','0','admin',sysdate(),'',NULL,'请求者');
INSERT INTO sys_dict_type values(20, '优先等级','job_priority_list','0','admin',sysdate(),'',NULL,'优先等级');

-- ----------------------------
-- 12、字典数据表
-- ----------------------------
drop table if exists sys_dict_data;
create table sys_dict_data
(
  dict_code        bigint(20)      not null auto_increment    comment '字典编码',
  dict_sort        int(4)          default 0                  comment '字典排序',
  dict_label       varchar(100)    default ''                 comment '字典标签',
  dict_value       varchar(100)    default ''                 comment '字典键值',
  dict_type        varchar(100)    default ''                 comment '字典类型',
  css_class        varchar(100)    default null               comment '样式属性（其他样式扩展）',
  list_class       varchar(100)    default null               comment '表格回显样式',
  is_default       char(1)         default 'N'                comment '是否默认（Y是 N否）',
  status           char(1)         default '0'                comment '状态（0正常 1停用）',
  create_by        varchar(64)     default ''                 comment '创建者',
  create_time      datetime                                   comment '创建时间',
  update_by        varchar(64)     default ''                 comment '更新者',
  update_time      datetime                                   comment '更新时间',
  remark           varchar(500)    default null               comment '备注',
  primary key (dict_code)
) engine=innodb charset=utf8 auto_increment=100 comment = '字典数据表';

insert into sys_dict_data values(1,  1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', sysdate(), '', null, '性别男');
insert into sys_dict_data values(2,  2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, '性别女');
insert into sys_dict_data values(3,  3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, '性别未知');
insert into sys_dict_data values(4,  1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '显示菜单');
insert into sys_dict_data values(5,  2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '隐藏菜单');
insert into sys_dict_data values(6,  1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(7,  2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');
insert into sys_dict_data values(8,  1,  '正常',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(9,  2,  '暂停',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');
insert into sys_dict_data values(10, 1,  '默认',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '1', 'admin', sysdate(), '', null, '默认分组');
insert into sys_dict_data values(11, 2,  '系统',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '1', 'admin', sysdate(), '', null, '系统分组');
insert into sys_dict_data values(12, 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '系统默认是');
insert into sys_dict_data values(13, 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '系统默认否');
insert into sys_dict_data values(14, 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', sysdate(), '', null, '通知');
insert into sys_dict_data values(15, 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', sysdate(), '', null, '公告');
insert into sys_dict_data values(16, 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(17, 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '关闭状态');
insert into sys_dict_data values(18, 99, '其他',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '其他操作');
insert into sys_dict_data values(19, 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '新增操作');
insert into sys_dict_data values(20, 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, '修改操作');
insert into sys_dict_data values(21, 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '删除操作');
insert into sys_dict_data values(22, 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', sysdate(), '', null, '授权操作');
insert into sys_dict_data values(23, 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, '导出操作');
insert into sys_dict_data values(24, 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, '导入操作');
insert into sys_dict_data values(25, 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '强退操作');
insert into sys_dict_data values(26, 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, '生成操作');
insert into sys_dict_data values(27, 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '清空操作');
insert into sys_dict_data values(28, 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', sysdate(), '', null, '正常状态');
insert into sys_dict_data values(29, 2,  '失败',     '1',       'sys_common_status',   '',   'warning',  'N', '0', 'admin', sysdate(), '', null, '停用状态');
insert into sys_dict_data values(30, 1,'mysql-as-portal', 'mysql-as-portal', 'as_data_base_source', '', '', 'Y', '0','admin', sysdate(),'', NULL, 'AS Portal 数据源');
insert into sys_dict_data values(31, 1,'ub8-pf1', 'ub8-pf1', 'pf1_data_base_source', '', '', 'Y', '0','admin', sysdate(),'', NULL, 'PF1主库数据源');
insert into sys_dict_data values(32, 1,'ub8-pf1-sec', 'ub8-pf1-sec', 'pf1_data_base_source', '', '', 'N', '0','admin', sysdate(),'', NULL, 'PF1备库数据源');
insert into sys_dict_data values(33, 1,'ub8-pf5-core', 'ub8-pf5-core', 'pf2_data_base_source', '', '', 'Y', '0','admin', sysdate(),'', NULL, 'PF2主库数据源');
insert into sys_dict_data values(34, 1,'ub8-pf5-core-sec', 'ub8-pf5-core-sec', 'pf2_data_base_source', '', '', 'N', '0','admin', sysdate(),'', NULL, 'PF2备库数据源');
insert into sys_dict_data values(35, 1,'ub8-pf5-draw', 'ub8-pf5-draw', 'pf2_data_base_source', '', '', 'N', '0','admin', sysdate(),'', NULL, 'PF2 Draw数据源');
insert into sys_dict_data values(36, 1,'ub8-pf5-ods', 'ub8-pf5-ods', 'pf2_data_base_source', '', '', 'N', '0','admin', sysdate(),'', NULL, 'PF1 ODS数据源');
insert into sys_dict_data values(37, 1,'data-warehouse', 'data-warehouse', 'pf2_data_base_source', '', '', 'N', '0','admin', sysdate(),'', NULL, 'PF1 DW数据源');
INSERT INTO sys_dict_data VALUES('38','1','投註返點','1','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'投註返點'),('39','2','休閑遊戲投註返點','2','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'休閑遊戲投註返點'),('40','3','投註返積分','10','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'投註返積分'),('41','4','推薦人返點','100','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'推薦人返點'),('42','5','推薦人返積分','1000','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'推薦人返積分'),('43','6','代理返點','1100','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'代理返點'),('44','7','休閑遊戲 : 代理返點','1200','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'休閑遊戲 : 代理返點'),('45','8','積分兌換現金','2000','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'積分兌換現金'),('46','9','帳戶充值','2001','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'帳戶充值'),('47','10','帳戶提現','2002','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'帳戶提現'),('48','11','資金充正','2003','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'資金充正'),('49','12','資金凍結','2004','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'資金凍結'),('50','13','投註中獎','2005','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'投註中獎'),('51','14','投註扣費','2007','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'投註扣費'),('52','15','轉帳 : 轉入','2008','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉帳 : 轉入'),('53','16','清除註銷賬戶余額','2009','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'清除註銷賬戶余額'),('54','17','轉帳 : 轉出','2010','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉帳 : 轉出'),('55','18','資金解凍','2011','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'資金解凍'),('56','19','個人撤單','2012','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'個人撤單'),('57','20','追中撤單','2013','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'追中撤單'),('58','21','系統撤單','2014','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'系統撤單'),('59','22','錯開引起的追號扣費','2015','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'錯開引起的追號扣費'),('60','23','錯開引起的獎金回退','2016','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'錯開引起的獎金回退'),('61','24','空開撤單','2017','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'空開撤單'),('62','25','出號撤單','2018','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'出號撤單'),('63','26','超級撤單','2019','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超級撤單'),('64','27','資金充負','2020','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'資金充負'),('65','28','充值返點','2021','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'充值返點'),('66','29','充值贈送(加)','2023','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'充值贈送(加)'),('67','30','手工贈送','2024','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手工贈送'),('68','31','修正充值金額（加）','2025','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'修正充值金額（加）'),('69','32','修正充值金額（減）','2026','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'修正充值金額（減）'),('70','33','充值贈送(減)','2027','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'充值贈送(減)'),('71','34','贈送禮金','2028','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'贈送禮金'),('72','35','提現損失','2031','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'提現損失'),('73','36','資金轉促銷','2032','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'資金轉促銷'),('74','37','取消活動贈送','2033','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'取消活動贈送'),('75','38','超級大獎池收入','2037','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超級大獎池收入'),('76','39','幸運大獎池收入','2038','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'幸運大獎池收入'),('77','40','超級大獎池派獎','2039','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超級大獎池派獎'),('78','41','幸運大獎池派獎','2040','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'幸運大獎池派獎'),('79','42','回退超級大獎池獎金','2041','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回退超級大獎池獎金'),('80','43','回退幸運獎池派獎','2042','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回退幸運獎池派獎'),('81','44','中超級大獎','2043','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'中超級大獎'),('82','45','中幸運獎','2044','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'中幸運獎'),('83','46','刪號返金','2045','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'刪號返金'),('84','47','超額中獎(加)','2046','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超額中獎(加)'),('85','48','超額中獎(減)','2047','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超額中獎(減)'),('86','49','銷號支出','2048','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銷號支出'),('87','50','銷號收入','2049','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銷號收入'),('88','51','刪號','2050','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'刪號'),('89','52','撤單手續費','2051','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'撤單手續費'),('90','53','投註扣費','2054','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'投註扣費'),('91','54','MGS投註失敗Retry','2055','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'MGS投註失敗Retry'),('92','55','休閑帳戶轉3RD廠商帳戶','2056','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'休閑帳戶轉3RD廠商帳戶'),('93','56','3RD廠商帳戶轉休閑帳戶','2057','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'3RD廠商帳戶轉休閑帳戶'),('94','57','放棄紀錄','2058','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'放棄紀錄'),('95','58','投註扣費','2059','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'投註扣費'),('96','59','投註中獎','2060','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'投註中獎'),('97','60','第三方遊戲內余額','2061','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'第三方遊戲內余額'),('98','61','遊戲獎池派獎','2062','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'遊戲獎池派獎'),('99','62','休閑遊戲獎池支出','2063','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'休閑遊戲獎池支出'),('100','63','休閑遊戲獎池收入','2064','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'休閑遊戲獎池收入'),('101','64','刪號內轉休閑獎勵','2065','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'刪號內轉休閑獎勵'),('102','65','平臺資金轉入','2066','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'平臺資金轉入'),('103','66','平臺資金轉出','2067','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'平臺資金轉出'),('214','177','帳戶充值手續費','2068','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'帳戶充值手續費'),('215','178','提現返回','2069','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'提現返回'),('216','179','線上充值','2070','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'線上充值'),('220','183','Casual第三方獎池中獎','2071','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'Casual第三方獎池中獎'),('222','185','棋牌遊戲贏局額','2072','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'棋牌遊戲贏局額'),('223','186','棋牌遊戲輸局額','2073','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'棋牌遊戲輸局額'),('224','187','棋牌遊戲桌費貢獻','2074','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'棋牌遊戲桌費貢獻'),('225','188','棋牌遊戲投註返點','2075','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'棋牌遊戲投註返點'),('226','189','棋牌遊戲代理返點','2076','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'棋牌遊戲代理返點'),('232','195','代下級充值轉入','2080','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'代下級充值轉入'),('233','196','代下級充值轉出','2081','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'代下級充值轉出'),('104','67','積分兌換商品','3001','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'積分兌換商品'),('105','68','積分兌換現金','3002','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'積分兌換現金'),('106','69','積分轉入','3003','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'積分轉入'),('107','70','積分轉出','3004','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'積分轉出'),('108','71','積分充正','3005','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'積分充正'),('109','72','轉賬或兌換積分凍結','3006','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬或兌換積分凍結'),('110','73','轉賬或兌換積分解凍','3007','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬或兌換積分解凍'),('111','74','積分充負','3008','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'積分充負'),('112','75','開戶贈送','4001','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'開戶贈送'),('113','76','新開賬戶贈送積分','4002','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'新開賬戶贈送積分'),('114','77','促銷轉資金（轉出）','4003','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷轉資金（轉出）'),('115','78','促銷積分轉出','4004','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷積分轉出'),('116','79','促銷積分充正','4005','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷積分充正'),('117','80','活動返積分','4007','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'活動返積分'),('118','81','論壇發帖返積分','4008','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'論壇發帖返積分'),('119','82','一周活躍天數返積分','4009','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'一周活躍天數返積分'),('120','83','促銷資金轉賬凍結','4010','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷資金轉賬凍結'),('121','84','促銷資金轉賬解凍','4011','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷資金轉賬解凍'),('122','85','促銷積分轉賬凍結','4012','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷積分轉賬凍結'),('123','86','促銷積分轉賬解凍','4013','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷積分轉賬解凍'),('124','87','促銷積分充負','4014','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'促銷積分充負'),('125','88','手工贈送','4016','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手工贈送'),('126','89','開戶贈送','4017','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'開戶贈送'),('127','90','充值贈送','4018','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'充值贈送'),('128','91','扣除充值贈送','4019','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'扣除充值贈送'),('129','92','禮金轉資金或休閑(資金或休閑轉入)','4020','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'禮金轉資金或休閑(資金或休閑轉入)'),('130','93','取消活動贈送','4021','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'取消活動贈送'),('217','180','抽獎遊戲派獎','4022','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'抽獎遊戲派獎'),('218','181','抽獎遊戲點數收入','4023','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'抽獎遊戲點數收入'),('219','182','抽獎遊戲點數支出','4024','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'抽獎遊戲點數支出'),('221','184','回收開戶贈送','4025','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回收開戶贈送'),('229','192','紅包贈送','4026','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'紅包贈送'),('227','190','回收開戶贈送(大額)','4027','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回收開戶贈送(大額)'),('228','191','開戶贈送(大額)','4028','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'開戶贈送(大額)'),('234','197','每日登錄送','4029','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'每日登錄送'),('242','205','新手任務資金贈送','4031','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'新手任務資金贈送'),('235','198','充值贈送禮金','4032','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'充值贈送禮金'),('236','199','扣除充值贈送禮金','4033','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'扣除充值贈送禮金'),('238','201','新手任務禮金贈送','4034','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'新手任務禮金贈送'),('239','202','新手任務禮金回收','4035','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'新手任務禮金回收'),('240','203','新手任務禮金轉出','4036','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'新手任務禮金轉出'),('241','204','新手任務禮金轉資金','4037','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'新手任務禮金轉資金'),('131','94','凍結提現資金','5001','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'凍結提現資金'),('132','95','凍結轉賬資金','5002','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'凍結轉賬資金'),('133','96','凍結轉賬積分','5003','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'凍結轉賬積分'),('134','97','解凍提現資金','5004','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'解凍提現資金'),('135','98','解凍轉賬資金','5005','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'解凍轉賬資金'),('136','99','解凍轉賬積分','5006','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'解凍轉賬積分'),('137','100','凍結兌換積分','5007','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'凍結兌換積分'),('138','101','解凍兌換積分','5008','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'解凍兌換積分'),('139','102','凍結商戶提現資金','5009','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'凍結商戶提現資金'),('140','103','解凍商戶提現資金','5010','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'解凍商戶提現資金'),('141','104','手工充值凍結','5011','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手工充值凍結'),('142','105','手工充值解凍','5012','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手工充值解凍'),('143','106','回退投註返點資金','6001','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回退投註返點資金'),('144','107','回退投註返點積分','6002','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回退投註返點積分'),('145','108','回退代理資金返點','6003','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回退代理資金返點'),('146','109','回退推薦人返點積分','6004','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'回退推薦人返點積分'),('147','110','撤單扣除積分','6005','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'撤單扣除積分'),('148','111','商戶充值','7000','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶充值'),('149','112','商戶提現','7001','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶提現'),('150','113','商戶充正','7002','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶充正'),('151','114','商戶充負','7003','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶充負'),('152','115','商戶資金凍結','7004','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶資金凍結'),('153','116','商戶資金解凍','7005','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶資金解凍'),('154','117','轉賬(收)','7006','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬(收)'),('155','118','轉賬(支)','7007','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬(支)'),('156','119','修正充值金額（加）','7008','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'修正充值金額（加）'),('157','120','修正充值金額（減）','7009','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'修正充值金額（減）'),('158','121','商戶手工充值（加）','7010','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶手工充值（加）'),('159','122','商戶手工充值（減）','7011','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'商戶手工充值（減）'),('160','123','取消充值','7012','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'取消充值'),('161','124','超額退款','7013','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超額退款'),('162','125','超額充值','7014','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超額充值'),('163','126','利息調整(支)','7018','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'利息調整(支)'),('164','127','利息調整(收)','7019','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'利息調整(收)'),('165','128','銀行費用扣減(支)','7021','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銀行費用扣減(支)'),('166','129','銀行費用扣減(收)','7022','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銀行費用扣減(收)'),('167','130','充值損失','7027','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'充值損失'),('168','131','轉至結匯(收)','7030','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉至結匯(收)'),('169','132','手續費(支)','7032','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手續費(支)'),('170','133','手續費(收)','7033','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手續費(收)'),('171','134','註資(支)','7034','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'註資(支)'),('172','135','註資(收)','7035','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'註資(收)'),('173','136','公司卡沖正(支)','7036','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'公司卡沖正(支)'),('174','137','公司卡沖正(收)','7037','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'公司卡沖正(收)'),('175','138','轉至結匯(支)','7038','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉至結匯(支)'),('176','139','線上充值','7039','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'線上充值'),('177','140','線上充值','7040','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'線上充值'),('178','141','系統獎勵','8001','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'系統獎勵'),('179','142','遊戲贏分','8002','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'遊戲贏分'),('180','143','遊戲輸分','8003','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'遊戲輸分'),('181','144','遊戲抽水','8004','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'遊戲抽水'),('182','145','系統理賠','8005','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'系統理賠'),('183','146','轉賬-待付(收)','8006','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬-待付(收)'),('184','147','轉賬-待付(支)','8007','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬-待付(支)'),('185','148','閑家總押註','8008','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'閑家總押註'),('186','149','推廣獎勵','8009','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'推廣獎勵'),('187','150','提現手續費','8010','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'提現手續費'),('188','151','利息調整-待付(支)','8018','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'利息調整-待付(支)'),('189','152','利息調整-待付(收)','8019','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'利息調整-待付(收)'),('190','153','銀行費用扣減-待付(支)','8021','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銀行費用扣減-待付(支)'),('191','154','銀行費用扣減-待付(收)','8022','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銀行費用扣減-待付(收)'),('192','155','轉至結匯-待付(收)','8030','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉至結匯-待付(收)'),('193','156','手續費-待付(支)','8032','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手續費-待付(支)'),('194','157','手續費-待付(收)','8033','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手續費-待付(收)'),('195','158','註資-待付(支)','8034','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'註資-待付(支)'),('196','159','註資-待付(收)','8035','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'註資-待付(收)'),('197','160','沖正-待付(支)','8036','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'沖正-待付(支)'),('198','161','沖正-待付(收)','8037','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'沖正-待付(收)'),('199','162','轉至結匯-待付(支)','8038','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉至結匯-待付(支)'),('200','163','轉賬-待收(收)','9006','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬-待收(收)'),('201','164','轉賬-待收(支)','9007','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉賬-待收(支)'),('202','165','利息調整-待收(支)','9018','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'利息調整-待收(支)'),('203','166','利息調整-待收(收)','9019','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'利息調整-待收(收)'),('204','167','銀行費用扣減-待收(支)','9021','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銀行費用扣減-待收(支)'),('205','168','銀行費用扣減-待收(收)','9022','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'銀行費用扣減-待收(收)'),('206','169','轉至結匯-待收(收)','9030','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉至結匯-待收(收)'),('207','170','手續費-待收(支)','9032','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手續費-待收(支)'),('208','171','手續費-待收(收)','9033','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'手續費-待收(收)'),('209','172','註資-待收(支)','9034','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'註資-待收(支)'),('210','173','註資-待收(收)','9035','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'註資-待收(收)'),('211','174','沖正-待收(支)','9036','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'沖正-待收(支)'),('212','175','沖正-待收(收)','9037','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'沖正-待收(收)'),('213','176','轉至結匯-待收(支)','9038','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'轉至結匯-待收(支)'),('230','193','超級大獎池滾錢到上層','20371','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'超級大獎池滾錢到上層'),('231','194','幸運大獎池滾錢到上層','20381','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'幸運大獎池滾錢到上層'),('237','200','禮金轉資金或休閑(禮金轉出)','40201','pf2_transaction_type','','','N','0','admin',sysdate(),'',null,'禮金轉資金或休閑(禮金轉出)');
insert into sys_dict_data values(243, 1,'不比对', '0', 'job_auto_comparison', '', '', 'Y', '0','admin', sysdate(),'', NULL, '不比对');
insert into sys_dict_data values(244, 2,'等于', '1', 'job_auto_comparison', '', '', 'N', '0','admin', sysdate(),'', NULL, '等于');
insert into sys_dict_data values(245, 3,'不等于', '2', 'job_auto_comparison', '', '', 'N', '0','admin', sysdate(),'', NULL, '不等于');
insert into sys_dict_data values(246, 4,'大于', '3', 'job_auto_comparison', '', '', 'N', '0','admin', sysdate(),'', NULL, '大于');
insert into sys_dict_data values(247, 5,'小于', '4', 'job_auto_comparison', '', '', 'N', '0','admin', sysdate(),'', NULL, '小于');
insert into sys_dict_data values(248, 6,'无资料', '5', 'job_auto_comparison', '', '', 'N', '0','admin', sysdate(),'', NULL, '无资料');
insert into sys_dict_data values(249, 7,'有资料', '6', 'job_auto_comparison', '', '', 'N', '0','admin', sysdate(),'', NULL, '有资料');
insert into sys_dict_data values(250, 1,'Platform 1.0', 'PF1', 'ub8_platform_type', '', 'success', 'N', '0','admin', sysdate(),'', NULL, 'PF1');
insert into sys_dict_data values(251, 2,'Platform 5.0', 'PF2', 'ub8_platform_type', '', 'primary', 'N', '0','admin', sysdate(),'', NULL, 'PF1');
insert into sys_dict_data values(252, 2,'CAL2', 'CAL2', 'job_call_who', '', '', 'N', '0','admin', sysdate(),'', NULL, 'CAL2');
insert into sys_dict_data values(253, 2,'CALDBA', 'CALDBA', 'job_call_who', '', '', 'N', '0','admin', sysdate(),'', NULL, 'CALDBA');
insert into sys_dict_data values(254, 2,'CALWA', 'CALWA', 'job_call_who', '', '', 'N', '0','admin', sysdate(),'', NULL, 'CALWA');
insert into sys_dict_data values(255, 2,'CALOD', 'CALOD', 'job_call_who', '', '', 'N', '0','admin', sysdate(),'', NULL, 'CALOD');
insert into sys_dict_data values(256, 2,'CHK', 'CHK', 'job_call_who', '', '', 'N', '0','admin', sysdate(),'', NULL, 'CHK');
insert into sys_dict_data values(257, 2,'CB', 'CB', 'job_call_who', '', '', 'N', '0','admin', sysdate(),'', NULL, 'CB');
insert into sys_dict_data values(258, 1,'AS', 'AS', 'job_requester_list', '', '', 'Y', '0','admin', sysdate(),'', NULL, 'AS');
insert into sys_dict_data values(259, 2,'ARD', 'ARD', 'job_requester_list', '', '', 'N', '0','admin', sysdate(),'', NULL, 'ARD');
insert into sys_dict_data values(260, 3,'SRV', 'SRV', 'job_requester_list', '', '', 'N', '0','admin', sysdate(),'', NULL, 'SRV');
insert into sys_dict_data values(261, 4,'DAU', 'DAU', 'job_requester_list', '', '', 'N', '0','admin', sysdate(),'', NULL, 'DAU');
insert into sys_dict_data values(262, 5,'PD', 'PD', 'job_requester_list', '', '', 'N', '0','admin', sysdate(),'', NULL, 'PD');
insert into sys_dict_data values(263, 6,'OP', 'OP', 'job_requester_list', '', '', 'N', '0','admin', sysdate(),'', NULL, 'OP');
insert into sys_dict_data values(264, 7,'OTHERS', 'OTHERS', 'job_requester_list', '', '', 'N', '0','admin', sysdate(),'', NULL, 'OTHERS');
insert into sys_dict_data values(265, 1,'紧急', '0', 'job_priority_list', '', 'danger', 'N', '0','admin', sysdate(),'', NULL, 'Urgent');
insert into sys_dict_data values(266, 2,'不紧急', '1', 'job_priority_list', '', 'primary', 'Y', '0','admin', sysdate(),'', NULL, 'Not Urgent');
insert into sys_dict_data values(267, 3,  '错误',     '2',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, '错误状态');
insert into sys_dict_data values(268, 4,  'AS KOLIN',     '3',       'telegram_notice_group',   '',   '',  'N', '0', 'admin', sysdate(), '', null, '1249943110:AAGPtzsqJpmlvssPN2odE4LWboLBjrICFzM;736145377');
insert into sys_dict_data values(269, 1,  'PF1 KIBANA',     '0',       'telegram_notice_group',   '',   '',  'N', '0', 'admin', sysdate(), '', null, '1249943110:AAGPtzsqJpmlvssPN2odE4LWboLBjrICFzM;-407006276');
insert into sys_dict_data values(270, 2,  'PF2 KIBANA',     '1',       'telegram_notice_group',   '',   '',  'N', '0', 'admin', sysdate(), '', null, '1249943110:AAGPtzsqJpmlvssPN2odE4LWboLBjrICFzM;-448890314');
insert into sys_dict_data values(271, 3,  'GOLD PLEASE',     '2',       'telegram_notice_group',   '',   '',  'N', '0', 'admin', sysdate(), '', null, '1249943110:AAGPtzsqJpmlvssPN2odE4LWboLBjrICFzM;-187555239');
insert into sys_dict_data values(272, 3,  'Platform AS',     'AS',       'ub8_platform_type',   '',   'info',  'N', '0', 'admin', sysdate(), '', null, 'AS 监控平台');

-- ----------------------------
-- 13、参数配置表
-- ----------------------------
drop table if exists sys_config;
create table sys_config (
  config_id         int(5)          not null auto_increment    comment '参数主键',
  config_name       varchar(100)    default ''                 comment '参数名称',
  config_key        varchar(100)    default ''                 comment '参数键名',
  config_value      varchar(500)    default ''                 comment '参数键值',
  config_type       char(1)         default 'N'                comment '系统内置（Y是 N否）',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time       datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark            varchar(500)    default null               comment '备注',
  primary key (config_id)
) engine=innodb charset=utf8 auto_increment=100 comment = '参数配置表';

insert into sys_config values(1, '主框架页-默认皮肤样式名称',     'sys.index.skinName',               'skin-blue',     'Y', 'admin', sysdate(), '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
insert into sys_config values(2, '用户管理-账号初始密码',         'sys.user.initPassword',            '123456',        'Y', 'admin', sysdate(), '', null, '初始化密码 123456');
insert into sys_config values(3, '主框架页-侧边栏主题',           'sys.index.sideTheme',              'theme-dark',    'Y', 'admin', sysdate(), '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
insert into sys_config values(4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser',         'false',         'Y', 'admin', sysdate(), '', null, '是否开启注册用户功能（true开启，false关闭）');
insert into sys_config values(5, '用户管理-密码字符范围',         'sys.account.chrtype',              '0',             'Y', 'admin', sysdate(), '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
insert into sys_config values(6, '用户管理-初始密码修改策略',     'sys.account.initPasswordModify',   '0',             'Y', 'admin', sysdate(), '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
insert into sys_config values(7, '用户管理-账号密码更新周期',     'sys.account.passwordValidateDays', '0',             'Y', 'admin', sysdate(), '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
insert into sys_config values(8, '主框架页-菜单导航显示风格',     'sys.index.menuStyle',              'default',       'Y', 'admin', sysdate(), '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
insert into sys_config values(9, '主框架页-是否开启页脚',         'sys.index.ignoreFooter',           'true',          'Y', 'admin', sysdate(), '', null, '是否开启底部页脚显示（true显示，false隐藏）');


-- ----------------------------
-- 14、系统访问记录
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
  info_id        bigint(20)     not null auto_increment   comment '访问ID',
  login_name     varchar(50)    default ''                comment '登录账号',
  ipaddr         varchar(128)   default ''                comment '登录IP地址',
  login_location varchar(255)   default ''                comment '登录地点',
  browser        varchar(50)    default ''                comment '浏览器类型',
  os             varchar(50)    default ''                comment '操作系统',
  status         char(1)        default '0'               comment '登录状态（0成功 1失败）',
  msg            varchar(255)   default ''                comment '提示消息',
  login_time     datetime                                 comment '访问时间',
  primary key (info_id)
) engine=innodb charset=utf8 auto_increment=100 comment = '系统访问记录';


-- ----------------------------
-- 15、在线用户记录
-- ----------------------------
drop table if exists sys_user_online;
create table sys_user_online (
  sessionId         varchar(50)   default ''                comment '用户会话id',
  login_name        varchar(50)   default ''                comment '登录账号',
  dept_name         varchar(50)   default ''                comment '部门名称',
  ipaddr            varchar(128)  default ''                comment '登录IP地址',
  login_location    varchar(255)  default ''                comment '登录地点',
  browser           varchar(50)   default ''                comment '浏览器类型',
  os                varchar(50)   default ''                comment '操作系统',
  status            varchar(10)   default ''                comment '在线状态on_line在线off_line离线',
  start_timestamp   datetime                                comment 'session创建时间',
  last_access_time  datetime                                comment 'session最后访问时间',
  expire_time       int(5)        default 0                 comment '超时时间，单位为分钟',
  primary key (sessionId)
) engine=innodb charset=utf8 comment = '在线用户记录';


-- ----------------------------
-- 16、通知公告表
-- ----------------------------
drop table if exists sys_notice;
create table sys_notice (
  notice_id         int(4)          not null auto_increment    comment '公告ID',
  notice_title      varchar(50)     not null                   comment '公告标题',
  notice_type       char(1)         not null                   comment '公告类型（1通知 2公告）',
  notice_content    varchar(2000)   default null               comment '公告内容',
  status            char(1)         default '0'                comment '公告状态（0正常 1关闭）',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time       datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark            varchar(255)    default null               comment '备注',
  primary key (notice_id)
) engine=innodb charset=utf8 auto_increment=10 comment = '通知公告表';

-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
insert into sys_notice values('1', '温馨提醒：2021-06-25 AS Portal新版本发布啦', '2', '新版本内容', '0', 'admin', sysdate(), '', null, '管理员');
insert into sys_notice values('2', '维护通知：2021-06-25 AS Portal系统凌晨维护', '1', '维护内容',   '0', 'admin', sysdate(), '', null, '管理员');


-- ----------------------------
-- 17、代码生成业务表
-- ----------------------------
drop table if exists gen_table;
create table gen_table (
  table_id             bigint(20)      not null auto_increment    comment '编号',
  table_name           varchar(200)    default ''                 comment '表名称',
  table_comment        varchar(500)    default ''                 comment '表描述',
  sub_table_name       varchar(64)     default null               comment '关联子表的表名',
  sub_table_fk_name    varchar(64)     default null               comment '子表关联的外键名',
  class_name           varchar(100)    default ''                 comment '实体类名称',
  tpl_category         varchar(200)    default 'crud'             comment '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  package_name         varchar(100)                               comment '生成包路径',
  module_name          varchar(30)                                comment '生成模块名',
  business_name        varchar(30)                                comment '生成业务名',
  function_name        varchar(50)                                comment '生成功能名',
  function_author      varchar(50)                                comment '生成功能作者',
  gen_type             char(1)         default '0'                comment '生成代码方式（0zip压缩包 1自定义路径）',
  gen_path             varchar(200)    default '/'                comment '生成路径（不填默认项目路径）',
  options              varchar(1000)                              comment '其它生成选项',
  create_by            varchar(64)     default ''                 comment '创建者',
  create_time 	       datetime                                   comment '创建时间',
  update_by            varchar(64)     default ''                 comment '更新者',
  update_time          datetime                                   comment '更新时间',
  remark               varchar(500)    default null               comment '备注',
  primary key (table_id)
) engine=innodb charset=utf8 auto_increment=1 comment = '代码生成业务表';


-- ----------------------------
-- 18、代码生成业务表字段
-- ----------------------------
drop table if exists gen_table_column;
create table gen_table_column (
  column_id         bigint(20)      not null auto_increment    comment '编号',
  table_id          varchar(64)                                comment '归属表编号',
  column_name       varchar(200)                               comment '列名称',
  column_comment    varchar(500)                               comment '列描述',
  column_type       varchar(100)                               comment '列类型',
  java_type         varchar(500)                               comment 'JAVA类型',
  java_field        varchar(200)                               comment 'JAVA字段名',
  is_pk             char(1)                                    comment '是否主键（1是）',
  is_increment      char(1)                                    comment '是否自增（1是）',
  is_required       char(1)                                    comment '是否必填（1是）',
  is_insert         char(1)                                    comment '是否为插入字段（1是）',
  is_edit           char(1)                                    comment '是否编辑字段（1是）',
  is_list           char(1)                                    comment '是否列表字段（1是）',
  is_query          char(1)                                    comment '是否查询字段（1是）',
  query_type        varchar(200)    default 'EQ'               comment '查询方式（等于、不等于、大于、小于、范围）',
  html_type         varchar(200)                               comment '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  dict_type         varchar(200)    default ''                 comment '字典类型',
  sort              int                                        comment '排序',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 	    datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  primary key (column_id)
) engine=innodb charset=utf8 auto_increment=1 comment = '代码生成业务表字段';


-- ----------------------------
-- 19、SQL检测任务表
-- ----------------------------
DROP TABLE IF EXISTS MONI_JOB;
CREATE TABLE MONI_JOB (
  ID INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  ASID VARCHAR(30) DEFAULT NULL COMMENT 'ASID',
  TICKET_NUMBER VARCHAR(20) DEFAULT NULL COMMENT 'TICKET NUMBER',
  EN_NAME VARCHAR(200) NOT NULL COMMENT '任务名称-英文',
  CH_NAME VARCHAR(200) NOT NULL COMMENT '任务名称-中文',
  DESCR TEXT COMMENT '说明',
  STATUS CHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0正常、1停用',
  JDBC CHAR(100) DEFAULT NULL COMMENT 'JDBC',
  PLATFORM CHAR(10) DEFAULT NULL COMMENT '平台',
  CRON_EXPRESSION VARCHAR(100) DEFAULT NULL COMMENT '频率',
  SCRIPT TEXT COMMENT 'SCRIPT',
  AUTO_MATCH VARCHAR(1) NOT NULL COMMENT '自动比对：0不比对、1等于、2不等于、3大于、4小于、5无资料、6有资料',
  EXPECTED_RESULT VARCHAR(256) DEFAULT NULL COMMENT '预期结果',
  CREATE_BY VARCHAR(30) NOT NULL COMMENT '建立人员',
  CREATE_TIME DATETIME NOT NULL COMMENT '建立时间',
  UPDATE_BY VARCHAR(30) DEFAULT NULL COMMENT '修改人员',
  UPDATE_TIME DATETIME DEFAULT NULL COMMENT '修改时间',
  REL_EXPORT VARCHAR(30) DEFAULT NULL COMMENT '关联导出ID',
  TELEGRAM_ALERT VARCHAR(1) DEFAULT '0' COMMENT '是否TELEGRAM告警：0正常、1停用',
  TELEGRAM_INFO VARCHAR(500) DEFAULT NULL COMMENT '告警信息',
  TELEGRAM_CONFIG VARCHAR(256) DEFAULT NULL COMMENT 'telegram发送群组配置',
  REQUESTER VARCHAR(12) DEFAULT NULL COMMENT '请求者',
  PRIORITY VARCHAR(12) DEFAULT NULL COMMENT '优先级',
  ACTION_ITEM VARCHAR(30) DEFAULT NULL COMMENT '实施项目',
  LAST_ALERT DATETIME DEFAULT NULL COMMENT '最后告警时间',
  PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='SQL检测任务表';


-- ----------------------------
-- 20、SQL检测任务LOG表
-- ----------------------------
DROP TABLE IF EXISTS MONI_JOB_LOG;
CREATE TABLE MONI_JOB_LOG (
  ID bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  JOB_ID INT(11) NOT NULL COMMENT '任务ID',
  START_TIME DATETIME DEFAULT NULL COMMENT '开始时间',
  END_TIME DATETIME DEFAULT NULL COMMENT '结束时间',
  EXECUTE_RESULT TEXT COMMENT '执行结果',
  EXPECTED_RESULT VARCHAR(256) DEFAULT NULL COMMENT '预期结果',
  EXCEPTION_LOG TEXT COMMENT '异常信息',
  EXECUTE_TIME INT(11) DEFAULT 0 COMMENT '执行时长(秒)',
  STATUS VARCHAR(1) DEFAULT NULL COMMENT '执行状态（0成功 1失败 2错误）',
  ALERT_STATUS VARCHAR(1) DEFAULT NULL COMMENT '告警（0正常、1停用）',
  OPERATOR VARCHAR(30) DEFAULT NULL COMMENT '操作者,系统则为system',
  PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='SQL检测任務LOG表';