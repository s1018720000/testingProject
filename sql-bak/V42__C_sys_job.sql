-- ----------------------------
-- 定时任务调度表
-- ----------------------------
drop table if exists sys_job;
create table sys_job (
  id                 bigint(20)    not null auto_increment     comment '任务ID',
  ch_name            varchar(200)   default ''                 comment '任务名称(中文)',
  en_name            varchar(200)   default ''                 comment '任务名称(英文)',
  platform           varchar(10)   default NULL                comment '任务平台',
  invoke_target       varchar(200)  not null                   comment '调用目标字符串',
  cron_expression     varchar(255)  default ''                 comment 'cron执行表达式',
  status              char(1)       default '0'                comment '状态（0正常 1暂停）',
  create_by           varchar(64)   default ''                 comment '创建者',
  create_time         datetime                                 comment '创建时间',
  update_by           varchar(64)   default ''                 comment '更新者',
  update_time         datetime                                 comment '更新时间',
  remark              varchar(500)  default ''                 comment '备注信息',
  primary key (job_id, job_name, job_group)
) engine=innodb DEFAULT CHARSET=UTF8 comment = '定时任务调度表';

-- ----------------------------
-- 定时任务调度日志表
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
  id          bigint(20)     not null auto_increment    comment '任务日志ID',
  job_id            varchar(64)    not null                   comment '任务名称',
  invoke_target       varchar(500)   not null                   comment '调用目标字符串',
  job_message         varchar(500)                              comment '日志信息',
  status              char(1)        default '0'                comment '执行状态（0正常 1失败）',
  exception_info      varchar(2000)  default ''                 comment '异常信息',
  start_time         datetime                                   comment '开始时间',
  end_time           datetime                                   comment '结束时间',
  execute_time         int(11)  default 0                       comment '执行时长(秒)',
  operator           varchar(30)  default null                  comment '操作者,系统则为system',
  primary key (job_log_id)
) engine=innodb DEFAULT CHARSET=UTF8 comment = '定时任务调度日志表';