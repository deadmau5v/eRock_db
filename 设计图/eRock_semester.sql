/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2024/3/14 14:26:49                           */
/*==============================================================*/


drop table if exists a1_answer;

drop table if exists a1_communication;

drop table if exists a1_question;

drop table if exists a1_result;

drop table if exists a1_teaching_source;

drop table if exists a1_viewed;

drop table if exists a2_a3_physica_score;

drop table if exists a2_a3_physical_test;

drop table if exists a2_attendance;

drop table if exists a2_ideological_performance;

drop table if exists a2_student_evaluate;

drop table if exists a2_teaching_assistant;

drop table if exists a2_teaching_assistant_evaluation;

drop table if exists a_ball_exam;

drop table if exists a_classroom_score;

drop table if exists a_exercise_resource;

drop table if exists a_exercise_task;

drop table if exists a_mark_sheet;

drop table if exists b1_franchise_club;

drop table if exists b1_mass_source;

drop table if exists b_training_score;

drop table if exists c1_bonus_point;

drop table if exists c1_total_points;

drop table if exists c2_competition_record;

drop table if exists c2_personnel_sheet;

drop table if exists c2_proof;

drop table if exists c_event_score;

drop table if exists class_register;

drop table if exists d1_conversion;

drop table if exists d2_certificate;

drop table if exists d2_resource;

drop table if exists d_add_value_score;

drop table if exists enumerate;

drop table if exists grade;

drop table if exists semester;

drop table if exists stu_group;

drop table if exists stu_to_tea;

drop table if exists student;

drop table if exists teacher;

drop table if exists teaching_table;

drop table if exists total_score;

/*==============================================================*/
/* Table: a1_answer                                             */
/*==============================================================*/
create table a1_answer
(
   ans_id               int not null comment '答题ID',
   stu_id               int comment '学生学号',
   ans_response         numeric(40,0) comment '回答次数',
   ans_apos             numeric(40,0) comment '正确次数',
   ans_time             datetime comment '时间',
   primary key (ans_id)
);

alter table a1_answer comment 'A1 知识测试 答题表';

/*==============================================================*/
/* Table: a1_communication                                      */
/*==============================================================*/
create table a1_communication
(
   comm_id              int not null comment '交流ID',
   teaching_id          int comment '教学资源ID',
   question             varchar(60) comment '交流内容',
   target_reply         varchar(60) comment '回复ID',
   comm_time            datetime comment '交流时间',
   comm_roleid          numeric(40,0) comment '角色ID',
   primary key (comm_id)
);

alter table a1_communication comment 'A1 线上学习 交流表

teaching_table
teaching_id
                                     -';

/*==============================================================*/
/* Table: a1_question                                           */
/*==============================================================*/
create table a1_question
(
   qq_id                int not null comment '题目编号',
   qq_content           varchar(60) comment '题目内容',
   primary key (qq_id)
);

alter table a1_question comment 'A1 知识测试 问表';

/*==============================================================*/
/* Table: a1_result                                             */
/*==============================================================*/
create table a1_result
(
   oo_id                int not null comment '答案ID',
   qq_id                int comment '题目编号',
   oo_content           varchar(60) comment '答案内容',
   result               numeric(1,0) comment '是否为答案',
   primary key (oo_id)
);

alter table a1_result comment 'A1 知识测试 答表

a1_question
aq_id';

/*==============================================================*/
/* Table: a1_teaching_source                                    */
/*==============================================================*/
create table a1_teaching_source
(
   teas_id              int not null comment '资源ID',
   teaching_id          int comment '教学资源ID',
   teas_url             varchar(255) comment '资源URL',
   primary key (teas_id)
);

alter table a1_teaching_source comment 'A1 教学资源表

teaching_table
teaching_id';

/*==============================================================*/
/* Table: a1_viewed                                             */
/*==============================================================*/
create table a1_viewed
(
   view_id              int not null comment '记录ID',
   stu_id               int comment '学生学号',
   teaching_id          int comment '教学资源ID',
   viewed_at            datetime comment '观看时间',
   view_duration        numeric(40,0) comment '观看时长',
   primary key (view_id)
);

alter table a1_viewed comment 'A1 线上学习 观看记录表

student
stu_id

                              -&#&';

/*==============================================================*/
/* Table: a2_a3_physica_score                                   */
/*==============================================================*/
create table a2_a3_physica_score
(
   phys_id              int not null comment '成绩ID',
   stu_id               int comment '学生学号',
   phy_id               int comment '任务ID',
   phys_stamina2        numeric(40,3) comment '耐力',
   phys_speed2          numeric(40,3) comment '速度',
   primary key (phys_id)
);

alter table a2_a3_physica_score comment 'A2 A3 体能成绩表

a2_a3_physical_test
phy_id
                                        -';

/*==============================================================*/
/* Table: a2_a3_physical_test                                   */
/*==============================================================*/
create table a2_a3_physical_test
(
   phy_id               int not null comment '任务ID',
   tea_id               int comment '老师工号',
   enum_id              int comment '枚举ID',
   phy_name             varchar(40) comment '任务名称',
   phy_descript         varchar(40) comment '任务描述',
   phy_time             datetime comment '创建时间',
   primary key (phy_id)
);

alter table a2_a3_physical_test comment 'A2 A3体能测试

enumerate
enum_id

';

/*==============================================================*/
/* Table: a2_attendance                                         */
/*==============================================================*/
create table a2_attendance
(
   aa_id                int not null comment '考勤ID',
   stu_id               int comment '学生学号',
   cr_id                int comment '课堂ID',
   aa_type              varchar(60) comment '考勤类型',
   evaluation_type2     varchar(60) comment '评价类型',
   primary key (aa_id)
);

alter table a2_attendance comment 'A2 课堂表现 考勤表

class_register
cr_id

                                  ';

/*==============================================================*/
/* Table: a2_ideological_performance                            */
/*==============================================================*/
create table a2_ideological_performance
(
   ip_id                int not null comment '思政表现ID',
   stu_id               int comment '学生学号',
   cr_id                int comment '课堂ID',
   ip_type              varchar(60) comment '思政表现类型',
   primary key (ip_id)
);

alter table a2_ideological_performance comment 'A2  思政教育 思政表现表

class_register
cr_id
                                               -&#&';

/*==============================================================*/
/* Table: a2_student_evaluate                                   */
/*==============================================================*/
create table a2_student_evaluate
(
   se_id                int not null comment '学生互评ID',
   cr_id                int comment '课堂ID',
   stu_id               int comment '学生学号',
   es_id                varchar(40) comment '被评学生学号',
   ee_type              varchar(40) comment '评价类型',
   pe_id                varchar(40) comment '参评学生学号',
   primary key (se_id)
);

alter table a2_student_evaluate comment 'A2 合作学习 学生互评

class_register
cr_id

';

/*==============================================================*/
/* Table: a2_teaching_assistant                                 */
/*==============================================================*/
create table a2_teaching_assistant
(
   ta_id                int not null comment '助教评价ID',
   stu_id               int comment '学生学号',
   cr_id                int comment '课堂ID',
   ta_type              varchar(60) comment '评价类型',
   ta_stu               numeric(30,0) comment '评价者',
   primary key (ta_id)
);

alter table a2_teaching_assistant comment 'A2 合作学习 助教评价

class_register
cr_id

';

/*==============================================================*/
/* Table: a2_teaching_assistant_evaluation                      */
/*==============================================================*/
create table a2_teaching_assistant_evaluation
(
   tae_id               int not null comment '教师评价ID',
   tea_id               int comment '老师工号',
   gg_id                int comment '小组ID',
   cr_id                int comment '课堂ID',
   tae_type             varchar(60) comment '评价类型',
   primary key (tae_id)
);

alter table a2_teaching_assistant_evaluation comment 'A2 合作学习 教师评价表

stu_group
gg_id

                                                     -&#';

/*==============================================================*/
/* Table: a_ball_exam                                           */
/*==============================================================*/
create table a_ball_exam
(
   be_id                int not null comment '运球ID',
   ms_id                int comment '评分ID',
   dri_stability        numeric(40,3) comment '稳定性',
   dri_power            numeric(40,3) comment '力量',
   dri_speed            numeric(40,3) comment '速度',
   dri_analysis         varchar(255) comment '分析',
   sho_arc              numeric(40,3) comment '弧线',
   sho_spinner          numeric(40,3) comment '后旋',
   sho_angle            numeric(40,3) comment '偏角',
   sho_analysis         varchar(255) comment '评价',
   primary key (be_id)
);

alter table a_ball_exam comment 'A 运球表

a_mark_sheet
ms_id';

/*==============================================================*/
/* Table: a_classroom_score                                     */
/*==============================================================*/
create table a_classroom_score
(
   crs_id               int not null comment '课堂评价ID',
   ts_id                int comment '总分ID',
   crs_score            numeric(40,3) comment '成绩',
   primary key (crs_id)
);

alter table a_classroom_score comment 'A_课堂评价分数表

total_score
ts_id';

/*==============================================================*/
/* Table: a_exercise_resource                                   */
/*==============================================================*/
create table a_exercise_resource
(
   er_id                int not null comment '资源ID',
   ms_id                int comment '评分ID',
   er_picture           varchar(60) comment '练习URL',
   er_time              datetime comment '提交时间',
   primary key (er_id)
);

alter table a_exercise_resource comment 'A1 A2 A3 技能练习、技能测试练习资源表

a_mark_sheet
ms_i';

/*==============================================================*/
/* Table: a_exercise_task                                       */
/*==============================================================*/
create table a_exercise_task
(
   et_id                int not null comment '任务ID',
   tea_id               int comment '老师工号',
   enum_id              int comment '枚举ID',
   cr_id                int comment '课堂ID',
   et_name              varchar(60) comment '任务名称',
   et_description       varchar(60) comment '任务描述',
   et_create_time       datetime comment '创建时间',
   primary key (et_id)
);

alter table a_exercise_task comment 'A1 A2 A3 技能练习、技能测试系列表

enumerate
enum_id
                                    ';

/*==============================================================*/
/* Table: a_mark_sheet                                          */
/*==============================================================*/
create table a_mark_sheet
(
   ms_id                int not null comment '评分ID',
   et_id                int comment '任务ID',
   stu_id               int comment '学生学号',
   tea_id               int comment '老师工号',
   ms_score             numeric(10,3) comment 'EROCK评分',
   ms_time              datetime comment '评分时间',
   ms_dribble           numeric(40,3) comment '运球分数',
   ms_shooting          numeric(40,3) comment '投篮分数',
   primary key (ms_id)
);

alter table a_mark_sheet comment ' A1 A2 A3 技能练习、技能测试评分表
D模块进步分从这个表中获取期初和期末的技能测试数据进行计算
                                 ';

/*==============================================================*/
/* Table: b1_franchise_club                                     */
/*==============================================================*/
create table b1_franchise_club
(
   tc_id                int not null comment '训练ID',
   enum_id              int comment '枚举ID',
   stu_id               int comment '学生学号',
   tc_url               varchar(60) comment '训练URL',
   tc_time              datetime comment '创建时间',
   primary key (tc_id)
);

alter table b1_franchise_club comment 'B1 球队|社团训练

student
stu_id

en';

/*==============================================================*/
/* Table: b1_mass_source                                        */
/*==============================================================*/
create table b1_mass_source
(
   mas_id               int not null comment '资源ID',
   tc_id                int comment '训练ID',
   teas_url             varchar(255) comment '资源URL',
   primary key (mas_id)
);

alter table b1_mass_source comment 'B1 资源表

B1_franchise_club
tc_id';

/*==============================================================*/
/* Table: b_training_score                                      */
/*==============================================================*/
create table b_training_score
(
   trs_id               int not null comment '训练评价ID',
   ts_id                int comment '总分ID',
   trs_score            numeric(40,3) comment '成绩',
   primary key (trs_id)
);

alter table b_training_score comment 'B_训练评价分数表

total_score
ts_id';

/*==============================================================*/
/* Table: c1_bonus_point                                        */
/*==============================================================*/
create table c1_bonus_point
(
   bp_id                int not null comment '加分ID',
   stu_id               int comment '学生学号',
   cr_id                int comment '课堂ID',
   bp_value             numeric(10,0) comment '分值',
   bp_name              varchar(20) comment '加分名称(备注',
   primary key (bp_id)
);

alter table c1_bonus_point comment 'C1 课内赛 加分表

class_register
cr_id

                                   -';

/*==============================================================*/
/* Table: c1_total_points                                       */
/*==============================================================*/
create table c1_total_points
(
   tp_id                int not null comment '成绩ID',
   stu_id               int comment '学生学号',
   tp_value             numeric(10,3) comment '总成绩',
   primary key (tp_id)
);

alter table c1_total_points comment 'C1 课内赛 总分表

student
stu_id';

/*==============================================================*/
/* Table: c2_competition_record                                 */
/*==============================================================*/
create table c2_competition_record
(
   cc_r_id              int not null comment '记录ID',
   cc_r_score           varchar(40) comment '记录比分',
   session_time         datetime comment '场次时间',
   specification        varchar(10) comment '比赛规格',
   cc_r_name            varchar(60) comment '比赛名称',
   primary key (cc_r_id)
);

alter table c2_competition_record comment 'C2 课外赛 比赛记录';

/*==============================================================*/
/* Table: c2_personnel_sheet                                    */
/*==============================================================*/
create table c2_personnel_sheet
(
   ps_id                int not null comment '人员ID',
   cc_r_id              int comment '记录ID',
   stu_id               int comment '学生学号',
   ps_name              varchar(60) comment '职位',
   primary key (ps_id)
);

alter table c2_personnel_sheet comment 'C2 课外赛 人员表

c2_competition_record
cc_r_id
';

/*==============================================================*/
/* Table: c2_proof                                              */
/*==============================================================*/
create table c2_proof
(
   proof_id             int not null comment '佐证ID',
   ps_id                int comment '人员ID',
   proof_url            varchar(60) comment '佐证URL',
   primary key (proof_id)
);

alter table c2_proof comment 'C2 课外赛 佐证表

c2_personnel_sheet
ps_id';

/*==============================================================*/
/* Table: c_event_score                                         */
/*==============================================================*/
create table c_event_score
(
   evs_id               int not null comment '赛事评价ID',
   ts_id                int comment '总分ID',
   evs_score            numeric(40,3) comment '成绩',
   primary key (evs_id)
);

alter table c_event_score comment 'C_赛事评价分数表

total_score
ts_id';

/*==============================================================*/
/* Table: class_register                                        */
/*==============================================================*/
create table class_register
(
   cr_id                int not null comment '课堂ID',
   semester_id          int comment '学期ID',
   cr_date              datetime comment '开课时间',
   cr_main              varchar(60) comment '课题内容',
   cr_duration          numeric(30,3) comment '开课时长',
   primary key (cr_id)
);

alter table class_register comment '课堂记录';

/*==============================================================*/
/* Table: d1_conversion                                         */
/*==============================================================*/
create table d1_conversion
(
   con_t_score          int not null comment 'T分',
   con_pro_score        numeric(40,3) comment '进步分',
   primary key (con_t_score)
);

alter table d1_conversion comment 'D1 进步分换算表
备注：评分表的数据在此表当中计算好，放入D模块 增值评价分数表中存储';

/*==============================================================*/
/* Table: d2_certificate                                        */
/*==============================================================*/
create table d2_certificate
(
   certificate_id       int not null comment '证书ID',
   stu_id               int comment '学生学号',
   tea_id               int comment '老师工号',
   certificate_name     varchar(60) comment '证书名称',
   audit                numeric(1,0) comment '证书审核',
   primary key (certificate_id)
);

alter table d2_certificate comment 'D2 证书表

student
stu_id

teache';

/*==============================================================*/
/* Table: d2_resource                                           */
/*==============================================================*/
create table d2_resource
(
   resource_id          int not null comment '资源ID',
   certificate_id       int comment '证书ID',
   resource_url         varchar(60) comment '资源url',
   primary key (resource_id)
);

alter table d2_resource comment 'D2 资源表

d2_certificate
certificate_id';

/*==============================================================*/
/* Table: d_add_value_score                                     */
/*==============================================================*/
create table d_add_value_score
(
   avs_id               int not null comment '增值评价ID',
   ts_id                int comment '总分ID',
   avs_score            numeric(40,3) comment '成绩',
   primary key (avs_id)
);

alter table d_add_value_score comment 'D_增值评价分数表

total_score
ts_id';

/*==============================================================*/
/* Table: enumerate                                             */
/*==============================================================*/
create table enumerate
(
   enum_id              int not null comment '枚举ID',
   enum_name            varchar(20) comment '枚举名称',
   enum_code            varchar(10) comment '枚举代码',
   primary key (enum_id)
);

alter table enumerate comment '模块枚举';

/*==============================================================*/
/* Table: grade                                                 */
/*==============================================================*/
create table grade
(
   class_id             int not null comment '班级编号',
   class_name           varchar(40) comment '专业班级名',
   primary key (class_id)
);

alter table grade comment '班级';

/*==============================================================*/
/* Table: semester                                              */
/*==============================================================*/
create table semester
(
   semester_id          int not null comment '学期ID',
   start_date           datetime comment '学期开始日期',
   finish_date          datetime comment '学期结束日期',
   primary key (semester_id)
);

alter table semester comment '学期表

class_register
cr_id';

/*==============================================================*/
/* Table: stu_group                                             */
/*==============================================================*/
create table stu_group
(
   gg_id                int not null comment '小组ID',
   gg_name              varchar(60) comment '小组名',
   stu_group_leader     numeric(40,0) comment '小组组长',
   primary key (gg_id)
);

alter table stu_group comment '小组';

/*==============================================================*/
/* Table: stu_to_tea                                            */
/*==============================================================*/
create table stu_to_tea
(
   stu_id               int not null comment '学生学号',
   tea_id               int not null comment '老师工号',
   primary key (stu_id, tea_id)
);

alter table stu_to_tea comment '多个学生对多个老师';

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   stu_id               int not null comment '学生学号',
   gg_id                int comment '小组ID',
   class_id             int comment '班级编号',
   stu_name             varchar(60) comment '学生姓名',
   stu_password         varchar(60) comment '学生密码',
   primary key (stu_id)
);

alter table student comment '学生表';

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher
(
   tea_id               int not null comment '老师工号',
   tea_name             varchar(60) comment '老师姓名',
   tea_password         varchar(60) comment '学生密码',
   primary key (tea_id)
);

alter table teacher comment '老师';

/*==============================================================*/
/* Table: teaching_table                                        */
/*==============================================================*/
create table teaching_table
(
   teaching_id          int not null comment '教学资源ID',
   tea_id               int comment '老师工号',
   view_id              int comment '记录ID',
   resource_url         varchar(60) comment '资源url',
   created_at           datetime comment '创建时间',
   primary key (teaching_id)
);

alter table teaching_table comment 'A1 线上学习 教学表

一对一{
a1_viewed
view_id
';

/*==============================================================*/
/* Table: total_score                                           */
/*==============================================================*/
create table total_score
(
   ts_id                int not null comment '总分ID',
   semester_id          int comment '学期ID',
   stu_id               int comment '学生学号',
   ep_score             numeric(40,3) comment '期末成绩',
   primary key (ts_id)
);

alter table total_score comment '总分表

semester
semester_id';

alter table a1_answer add constraint "FK_student to an" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a1_communication add constraint "FK_A1 teaching to comm" foreign key (teaching_id)
      references teaching_table (teaching_id) on delete restrict on update restrict;

alter table a1_result add constraint "FK_A1 q to o" foreign key (qq_id)
      references a1_question (qq_id) on delete restrict on update restrict;

alter table a1_teaching_source add constraint "FK_teaching_table to teas" foreign key (teaching_id)
      references teaching_table (teaching_id) on delete restrict on update restrict;

alter table a1_viewed add constraint "FK_A1 teaching to watch2" foreign key (teaching_id)
      references teaching_table (teaching_id) on delete restrict on update restrict;

alter table a1_viewed add constraint "FK_A1stu to watch" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a2_a3_physica_score add constraint "FK_physical_test to ps" foreign key (phy_id)
      references a2_a3_physical_test (phy_id) on delete restrict on update restrict;

alter table a2_a3_physica_score add constraint "FK_student to ps" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a2_a3_physical_test add constraint "FK_enumerate to pt" foreign key (enum_id)
      references enumerate (enum_id) on delete restrict on update restrict;

alter table a2_a3_physical_test add constraint "FK_teacher to phys" foreign key (tea_id)
      references teacher (tea_id) on delete restrict on update restrict;

alter table a2_attendance add constraint "FK_A2 stu to atten" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a2_attendance add constraint "FK_cr to class" foreign key (cr_id)
      references class_register (cr_id) on delete restrict on update restrict;

alter table a2_ideological_performance add constraint "FK_a2 stu to ip" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a2_ideological_performance add constraint "FK_class to ip" foreign key (cr_id)
      references class_register (cr_id) on delete restrict on update restrict;

alter table a2_student_evaluate add constraint "FK_A2 stu to se" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a2_student_evaluate add constraint "FK_class to se" foreign key (cr_id)
      references class_register (cr_id) on delete restrict on update restrict;

alter table a2_teaching_assistant add constraint "FK_A2 stu to ta" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a2_teaching_assistant add constraint "FK_class to ta" foreign key (cr_id)
      references class_register (cr_id) on delete restrict on update restrict;

alter table a2_teaching_assistant_evaluation add constraint "FK_A2 g to te" foreign key (gg_id)
      references stu_group (gg_id) on delete restrict on update restrict;

alter table a2_teaching_assistant_evaluation add constraint "FK_A2 tea to te" foreign key (tea_id)
      references teacher (tea_id) on delete restrict on update restrict;

alter table a2_teaching_assistant_evaluation add constraint "FK_class to te" foreign key (cr_id)
      references class_register (cr_id) on delete restrict on update restrict;

alter table a_ball_exam add constraint "FK_mark_sheet to dri" foreign key (ms_id)
      references a_mark_sheet (ms_id) on delete restrict on update restrict;

alter table a_classroom_score add constraint "FK_total_score to cs" foreign key (ts_id)
      references total_score (ts_id) on delete restrict on update restrict;

alter table a_exercise_resource add constraint "FK_A3 et to score" foreign key (ms_id)
      references a_mark_sheet (ms_id) on delete restrict on update restrict;

alter table a_exercise_task add constraint "FK_A3 tea to et" foreign key (tea_id)
      references teacher (tea_id) on delete restrict on update restrict;

alter table a_exercise_task add constraint "FK_class_register to et" foreign key (cr_id)
      references class_register (cr_id) on delete restrict on update restrict;

alter table a_exercise_task add constraint "FK_enum to et" foreign key (enum_id)
      references enumerate (enum_id) on delete restrict on update restrict;

alter table a_mark_sheet add constraint "FK_A3 stu to score" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table a_mark_sheet add constraint "FK_A3 tea to score" foreign key (tea_id)
      references teacher (tea_id) on delete restrict on update restrict;

alter table a_mark_sheet add constraint "FK_a_exercise_task to ms" foreign key (et_id)
      references a_exercise_task (et_id) on delete restrict on update restrict;

alter table b1_franchise_club add constraint "FK_B1 stu to ts" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table b1_franchise_club add constraint "FK_enum to ball" foreign key (enum_id)
      references enumerate (enum_id) on delete restrict on update restrict;

alter table b1_mass_source add constraint "FK_franchise_club to mas" foreign key (tc_id)
      references b1_franchise_club (tc_id) on delete restrict on update restrict;

alter table b_training_score add constraint "FK_total_score to ts" foreign key (ts_id)
      references total_score (ts_id) on delete restrict on update restrict;

alter table c1_bonus_point add constraint "FK_C1 cr to bp" foreign key (cr_id)
      references class_register (cr_id) on delete restrict on update restrict;

alter table c1_bonus_point add constraint "FK_C1 stu to bp" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table c1_total_points add constraint "FK_C1 stu to tp" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table c2_personnel_sheet add constraint "FK_C2 cr to ps" foreign key (cc_r_id)
      references c2_competition_record (cc_r_id) on delete restrict on update restrict;

alter table c2_personnel_sheet add constraint "FK_stu to ps" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table c2_proof add constraint "FK_C2 pr to p" foreign key (ps_id)
      references c2_personnel_sheet (ps_id) on delete restrict on update restrict;

alter table c_event_score add constraint "FK_total_score to es" foreign key (ts_id)
      references total_score (ts_id) on delete restrict on update restrict;

alter table class_register add constraint "FK_semester to ct" foreign key (semester_id)
      references semester (semester_id) on delete restrict on update restrict;

alter table d2_certificate add constraint "FK_D2 stu to certificate" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table d2_certificate add constraint "FK_D2 tea to certificate" foreign key (tea_id)
      references teacher (tea_id) on delete restrict on update restrict;

alter table d2_resource add constraint "FK_D2 certificate to resource" foreign key (certificate_id)
      references d2_certificate (certificate_id) on delete restrict on update restrict;

alter table d_add_value_score add constraint "FK_total_score to as" foreign key (ts_id)
      references total_score (ts_id) on delete restrict on update restrict;

alter table stu_to_tea add constraint FK_stu_to_tea foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table stu_to_tea add constraint FK_stu_to_tea2 foreign key (tea_id)
      references teacher (tea_id) on delete restrict on update restrict;

alter table student add constraint "FK_group to stu" foreign key (gg_id)
      references stu_group (gg_id) on delete restrict on update restrict;

alter table student add constraint "FK_stu to cls" foreign key (class_id)
      references grade (class_id) on delete restrict on update restrict;

alter table teaching_table add constraint "FK_A1 teaching to watch" foreign key (view_id)
      references a1_viewed (view_id) on delete restrict on update restrict;

alter table teaching_table add constraint "FK_a1 tea to teaching" foreign key (tea_id)
      references teacher (tea_id) on delete restrict on update restrict;

alter table total_score add constraint "FK_semester to ts" foreign key (semester_id)
      references semester (semester_id) on delete restrict on update restrict;

alter table total_score add constraint "FK_student to ts" foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

