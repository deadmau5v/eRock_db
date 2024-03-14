/*
 Navicat Premium Data Transfer

 Source Server         : eRock
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : 101.43.33.73:3305
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 12/03/2024 20:32:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for A3_mark_sheet
-- ----------------------------
DROP TABLE IF EXISTS `A3_mark_sheet`;
CREATE TABLE `A3_mark_sheet`  (
  `ms_id` decimal(40, 0) NOT NULL COMMENT '评分ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `ms_score` decimal(10, 3) NOT NULL COMMENT 'EROCK评分',
  `ms_stability` decimal(10, 3) NOT NULL COMMENT '运球稳定性',
  `ms_speed` decimal(10, 3) NOT NULL COMMENT '速度',
  `ms_power` decimal(10, 3) NOT NULL COMMENT '力量',
  `motion_analysis` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动作分析',
  `ms_time` date NOT NULL COMMENT '评分时间',
  PRIMARY KEY (`ms_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 A3 技能练习、技术|体能练习 评分表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of A3_mark_sheet
-- ----------------------------

-- ----------------------------
-- Table structure for B1_franchise_club
-- ----------------------------
DROP TABLE IF EXISTS `B1_franchise_club`;
CREATE TABLE `B1_franchise_club`  (
  `tc_id` decimal(40, 0) NOT NULL COMMENT '训练ID',
  `enum_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '枚举ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `tc_url` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '训练URL',
  `tc_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`tc_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'B1 球队|社团训练\r\n\r\nstudent\r\nstu_id\r\n\r\nen' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of B1_franchise_club
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for a1_communication
-- ----------------------------
DROP TABLE IF EXISTS `a1_communication`;
CREATE TABLE `a1_communication`  (
  `comm_id` decimal(40, 0) NOT NULL COMMENT '交流ID',
  `teaching_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '教学资源ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `question` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '交流内容',
  `target_reply` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '回复ID',
  `comm_time` date NOT NULL COMMENT '交流时间',
  PRIMARY KEY (`comm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 线上学习 交流表\r\n\r\nteaching_table\r\nteaching_id\r\n                                     -' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a1_communication
-- ----------------------------

-- ----------------------------
-- Table structure for a1_question
-- ----------------------------
DROP TABLE IF EXISTS `a1_question`;
CREATE TABLE `a1_question`  (
  `q_id` decimal(10, 0) NOT NULL COMMENT '题目编号',
  `q_content` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目内容',
  PRIMARY KEY (`q_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 知识测试 问表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a1_question
-- ----------------------------
INSERT INTO `a1_question` VALUES (1, '篮球是什么时候诞生的？');
INSERT INTO `a1_question` VALUES (2, '篮球运动员科比·布莱恩特在NBA赢得了多少次总冠军？');
INSERT INTO `a1_question` VALUES (3, '篮球比赛中的三分线在职业比赛中的标准距离是多少米？');
INSERT INTO `a1_question` VALUES (4, '在篮球比赛中，一名球员如果犯规达到几次会被罚下场？');
INSERT INTO `a1_question` VALUES (5, '篮球比赛中的‘进攻犯规’是指什么情况？');
INSERT INTO `a1_question` VALUES (6, '篮球运动员迈克尔·乔丹的最佳赛季平均得分是多少？');
INSERT INTO `a1_question` VALUES (7, '在篮球比赛中，一次进攻回合的时间限制是多少秒？');
INSERT INTO `a1_question` VALUES (8, '篮球运动员勒布朗·詹姆斯在2016年带领克利夫兰骑士队赢得了NBA总冠军，这是他职业生涯中的第几次夺冠？');
INSERT INTO `a1_question` VALUES (9, '篮球比赛中的罚球线距离篮筐的距离是多少？');
INSERT INTO `a1_question` VALUES (10, 'NBA全明星赛中的‘全明星周末’包括哪些活动？');

-- ----------------------------
-- Table structure for a1_result
-- ----------------------------
DROP TABLE IF EXISTS `a1_result`;
CREATE TABLE `a1_result`  (
  `o_id` decimal(10, 0) NOT NULL COMMENT '答案ID',
  `q_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '题目编号',
  `o_content` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '答案内容',
  `result` decimal(1, 0) NOT NULL COMMENT '是否为答案',
  PRIMARY KEY (`o_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 知识测试 答表\r\n\r\na1_question\r\nq_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a1_result
-- ----------------------------
INSERT INTO `a1_result` VALUES (1, 1, '1891年', 1);
INSERT INTO `a1_result` VALUES (2, 1, '1900年', 0);
INSERT INTO `a1_result` VALUES (3, 1, '1953年', 0);
INSERT INTO `a1_result` VALUES (4, 6, '33.6分', 0);
INSERT INTO `a1_result` VALUES (5, 6, '37.1分', 0);
INSERT INTO `a1_result` VALUES (6, 6, '30.1分', 1);
INSERT INTO `a1_result` VALUES (7, 7, '15秒', 0);
INSERT INTO `a1_result` VALUES (8, 7, '24秒', 1);
INSERT INTO `a1_result` VALUES (9, 7, '30秒', 0);
INSERT INTO `a1_result` VALUES (10, 8, '第一次', 0);
INSERT INTO `a1_result` VALUES (11, 8, '第二次', 0);
INSERT INTO `a1_result` VALUES (12, 8, '第三次', 1);
INSERT INTO `a1_result` VALUES (13, 9, '2.35米', 1);
INSERT INTO `a1_result` VALUES (14, 9, '2.75米', 0);
INSERT INTO `a1_result` VALUES (15, 9, '3.05米', 0);
INSERT INTO `a1_result` VALUES (16, 10, '技巧挑战赛、三分球大赛和扣篮大赛', 1);
INSERT INTO `a1_result` VALUES (17, 10, '技巧挑战赛、三分球大赛和全明星比赛', 0);
INSERT INTO `a1_result` VALUES (18, 10, '扣篮大赛、三分球大赛和全明星比赛', 0);
INSERT INTO `a1_result` VALUES (21, 2, '1次', 0);
INSERT INTO `a1_result` VALUES (22, 2, '2次', 0);
INSERT INTO `a1_result` VALUES (23, 2, '5次', 1);
INSERT INTO `a1_result` VALUES (24, 3, '225米', 0);
INSERT INTO `a1_result` VALUES (25, 3, '6.75米', 0);
INSERT INTO `a1_result` VALUES (26, 3, '7.24米', 1);
INSERT INTO `a1_result` VALUES (27, 4, '3次', 0);
INSERT INTO `a1_result` VALUES (28, 4, '4次', 0);
INSERT INTO `a1_result` VALUES (29, 4, '5次', 1);
INSERT INTO `a1_result` VALUES (30, 5, '球员在对方球员的防守下投篮得分', 0);
INSERT INTO `a1_result` VALUES (31, 5, '球员在对方球员的防守下失去控制球', 0);
INSERT INTO `a1_result` VALUES (32, 5, '球员在对方球员的防守下推开对方', 1);

-- ----------------------------
-- Table structure for a1_teaching_source
-- ----------------------------
DROP TABLE IF EXISTS `a1_teaching_source`;
CREATE TABLE `a1_teaching_source`  (
  `teas_id` decimal(40, 0) NOT NULL COMMENT '资源ID',
  `teaching_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '教学资源ID',
  `teas_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源URL',
  PRIMARY KEY (`teas_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 教学资源表\r\n\r\nteaching_table\r\nteaching_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a1_teaching_source
-- ----------------------------

-- ----------------------------
-- Table structure for a1_viewed
-- ----------------------------
DROP TABLE IF EXISTS `a1_viewed`;
CREATE TABLE `a1_viewed`  (
  `view_id` decimal(10, 0) NOT NULL COMMENT '记录ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `teaching_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '教学资源ID',
  `viewed_at` date NOT NULL COMMENT '观看时间',
  `view_duration` decimal(40, 0) NOT NULL COMMENT '观看时长',
  PRIMARY KEY (`view_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 线上学习 观看记录表\r\n\r\nstudent\r\nstu_id\r\n\r\n                              -&#&' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a1_viewed
-- ----------------------------

-- ----------------------------
-- Table structure for a2_a3_physica_score
-- ----------------------------
DROP TABLE IF EXISTS `a2_a3_physica_score`;
CREATE TABLE `a2_a3_physica_score`  (
  `phys_id` decimal(40, 0) NOT NULL COMMENT '成绩ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `phy_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '任务ID',
  `phys_stamina2` decimal(40, 3) NOT NULL COMMENT '耐力',
  `phys_speed2` decimal(40, 3) NOT NULL COMMENT '速度',
  PRIMARY KEY (`phys_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A2 A3 体能成绩表\r\n\r\na2_a3_physical_test\r\nphy_id\r\n                                        -' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a2_a3_physica_score
-- ----------------------------

-- ----------------------------
-- Table structure for a2_a3_physical_test
-- ----------------------------
DROP TABLE IF EXISTS `a2_a3_physical_test`;
CREATE TABLE `a2_a3_physical_test`  (
  `phy_id` decimal(40, 0) NOT NULL COMMENT '任务ID',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `enum_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '枚举ID',
  `phy_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `phy_descript` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务描述',
  `phy_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`phy_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A2 A3体能测试\r\n\r\nenumerate\r\nenum_id\r\n\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a2_a3_physical_test
-- ----------------------------

-- ----------------------------
-- Table structure for a2_attendance
-- ----------------------------
DROP TABLE IF EXISTS `a2_attendance`;
CREATE TABLE `a2_attendance`  (
  `a_id` decimal(40, 0) NOT NULL COMMENT '考勤ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `cr_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '课堂ID',
  `a_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考勤类型',
  `evaluation_type2` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评价类型',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A2 课堂表现 考勤表\r\n\r\nclass_register\r\ncr_id\r\n\r\n                                  ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a2_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for a2_ideological_performance
-- ----------------------------
DROP TABLE IF EXISTS `a2_ideological_performance`;
CREATE TABLE `a2_ideological_performance`  (
  `ip_id` decimal(40, 0) NOT NULL COMMENT '思政表现ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `cr_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '课堂ID',
  `ip_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '思政表现类型',
  PRIMARY KEY (`ip_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A2  思政教育 思政表现表\r\n\r\nclass_register\r\ncr_id\r\n                                               -&#&' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a2_ideological_performance
-- ----------------------------

-- ----------------------------
-- Table structure for a2_student_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `a2_student_evaluate`;
CREATE TABLE `a2_student_evaluate`  (
  `se_id` decimal(40, 0) NOT NULL COMMENT '学生互评ID',
  `cr_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '课堂ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `es_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '被评学生学号',
  `e_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评价类型',
  `pe_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '参评学生学号',
  PRIMARY KEY (`se_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A2 合作学习 学生互评\r\n\r\nclass_register\r\ncr_id\r\n\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a2_student_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for a2_teaching_assistant
-- ----------------------------
DROP TABLE IF EXISTS `a2_teaching_assistant`;
CREATE TABLE `a2_teaching_assistant`  (
  `ta_id` decimal(40, 0) NOT NULL COMMENT '助教评价ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `cr_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '课堂ID',
  `ta_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评价类型',
  `ta_stu` decimal(30, 0) NOT NULL COMMENT '评价者',
  PRIMARY KEY (`ta_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A2 合作学习 助教评价\r\n\r\nclass_register\r\ncr_id\r\n\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a2_teaching_assistant
-- ----------------------------

-- ----------------------------
-- Table structure for a2_teaching_assistant_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `a2_teaching_assistant_evaluation`;
CREATE TABLE `a2_teaching_assistant_evaluation`  (
  `tae_id` decimal(40, 0) NOT NULL COMMENT '教师评价ID',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `g_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '小组ID',
  `cr_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '课堂ID',
  `tae_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评价类型',
  PRIMARY KEY (`tae_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A2 合作学习 教师评价表\r\n\r\nstu_group\r\ng_id\r\n\r\n                                                     -&#&' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a2_teaching_assistant_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for a_classroom_score
-- ----------------------------
DROP TABLE IF EXISTS `a_classroom_score`;
CREATE TABLE `a_classroom_score`  (
  `crs_id` decimal(40, 0) NOT NULL COMMENT '课堂评价ID',
  `ts_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '总分ID',
  `crs_score` decimal(40, 3) NOT NULL COMMENT '成绩',
  PRIMARY KEY (`crs_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A_课堂评价分数表\r\n\r\ntotal_score\r\nts_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_classroom_score
-- ----------------------------

-- ----------------------------
-- Table structure for a_dribble
-- ----------------------------
DROP TABLE IF EXISTS `a_dribble`;
CREATE TABLE `a_dribble`  (
  `dri_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '运球ID',
  `ms_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '评分ID',
  `dri_stability` decimal(40, 3) NOT NULL COMMENT '稳定性',
  `dri_power` decimal(40, 3) NOT NULL COMMENT '力量',
  `dri_speed` decimal(40, 3) NOT NULL COMMENT '速度',
  `dri_analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分析',
  PRIMARY KEY (`dri_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A 运球表\r\n\r\na_mark_sheet\r\nms_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_dribble
-- ----------------------------
INSERT INTO `a_dribble` VALUES ('1', 715, 55.000, 87.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('10', 134, 95.000, 52.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('100', 235, 37.000, 92.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('101', 828, 29.000, 76.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('102', 804, 86.000, 34.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('103', 528, 23.000, 63.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('104', 272, 84.000, 78.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('105', 772, 27.000, 11.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('106', 447, 91.000, 57.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('107', 644, 37.000, 77.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('108', 70, 89.000, 41.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('109', 875, 93.000, 29.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('11', 280, 94.000, 22.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('110', 525, 51.000, 55.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('111', 271, 37.000, 38.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('112', 975, 36.000, 87.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('113', 568, 44.000, 19.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('114', 71, 67.000, 81.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('115', 937, 88.000, 46.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('116', 165, 51.000, 42.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('117', 136, 96.000, 17.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('118', 43, 55.000, 85.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('119', 926, 77.000, 43.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('12', 141, 51.000, 74.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('120', 240, 46.000, 50.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('121', 425, 18.000, 13.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('122', 653, 44.000, 34.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('123', 313, 39.000, 60.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('124', 731, 29.000, 100.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('125', 513, 39.000, 59.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('126', 553, 24.000, 77.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('127', 284, 96.000, 30.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('128', 328, 55.000, 21.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('129', 907, 29.000, 83.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('13', 427, 38.000, 22.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('130', 579, 13.000, 61.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('131', 620, 11.000, 42.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('132', 813, 66.000, 70.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('133', 385, 69.000, 36.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('134', 27, 59.000, 74.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('135', 707, 42.000, 94.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('136', 61, 36.000, 10.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('137', 700, 95.000, 52.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('138', 194, 56.000, 24.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('139', 534, 34.000, 98.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('14', 643, 69.000, 54.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('140', 515, 25.000, 85.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('141', 117, 39.000, 63.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('142', 790, 31.000, 53.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('143', 732, 53.000, 40.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('144', 201, 70.000, 70.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('145', 262, 43.000, 96.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('146', 377, 62.000, 74.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('147', 771, 21.000, 45.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('148', 912, 61.000, 52.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('149', 241, 81.000, 97.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('15', 866, 93.000, 25.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('150', 274, 11.000, 53.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('151', 962, 81.000, 72.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('152', 558, 26.000, 84.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('153', 617, 25.000, 80.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('154', 175, 53.000, 31.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('155', 678, 94.000, 50.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('156', 167, 91.000, 78.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('157', 627, 96.000, 21.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('158', 355, 28.000, 71.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('159', 247, 70.000, 12.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('16', 927, 100.000, 17.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('160', 470, 98.000, 50.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('161', 218, 14.000, 71.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('162', 638, 53.000, 50.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('163', 838, 92.000, 22.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('164', 801, 16.000, 63.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('165', 646, 52.000, 71.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('166', 539, 79.000, 75.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('167', 712, 52.000, 23.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('168', 541, 28.000, 79.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('169', 978, 48.000, 50.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('17', 474, 34.000, 44.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('170', 899, 33.000, 79.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('171', 62, 60.000, 22.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('172', 257, 81.000, 40.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('173', 103, 95.000, 37.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('174', 193, 88.000, 32.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('175', 862, 54.000, 33.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('176', 457, 94.000, 85.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('177', 151, 82.000, 23.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('178', 458, 76.000, 43.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('179', 255, 12.000, 57.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('18', 570, 13.000, 92.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('180', 228, 35.000, 100.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('181', 850, 34.000, 19.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('182', 557, 68.000, 57.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('183', 73, 50.000, 99.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('184', 788, 52.000, 44.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('185', 32, 82.000, 100.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('186', 3, 32.000, 12.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('187', 424, 37.000, 58.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('188', 605, 59.000, 50.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('189', 676, 90.000, 60.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('19', 863, 39.000, 91.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('190', 701, 15.000, 32.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('191', 416, 27.000, 28.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('192', 354, 93.000, 92.000, 93.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('193', 991, 97.000, 89.000, 99.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('194', 472, 82.000, 46.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('195', 471, 29.000, 71.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('196', 273, 66.000, 45.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('197', 10, 11.000, 34.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('198', 984, 42.000, 20.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('199', 860, 26.000, 39.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('2', 603, 31.000, 48.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('20', 412, 74.000, 10.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('200', 602, 83.000, 66.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('201', 883, 99.000, 43.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('202', 611, 23.000, 34.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('203', 718, 28.000, 95.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('204', 859, 15.000, 32.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('205', 671, 52.000, 43.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('206', 206, 89.000, 13.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('207', 592, 28.000, 26.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('208', 803, 66.000, 63.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('209', 383, 80.000, 33.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('21', 753, 46.000, 34.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('210', 778, 10.000, 53.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('211', 920, 62.000, 89.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('212', 481, 47.000, 36.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('213', 275, 86.000, 19.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('214', 196, 38.000, 24.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('215', 741, 65.000, 18.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('216', 886, 34.000, 81.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('217', 348, 58.000, 82.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('218', 253, 89.000, 75.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('219', 530, 25.000, 51.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('22', 942, 63.000, 41.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('220', 512, 71.000, 85.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('221', 423, 73.000, 65.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('222', 476, 69.000, 65.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('223', 522, 86.000, 65.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('224', 381, 12.000, 83.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('225', 914, 73.000, 32.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('226', 17, 25.000, 30.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('227', 320, 100.000, 91.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('228', 56, 82.000, 27.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('229', 306, 36.000, 51.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('23', 817, 75.000, 38.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('230', 787, 31.000, 77.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('231', 359, 53.000, 86.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('232', 454, 12.000, 56.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('233', 149, 24.000, 46.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('234', 473, 66.000, 61.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('235', 244, 59.000, 92.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('236', 460, 17.000, 84.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('237', 502, 46.000, 77.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('238', 775, 68.000, 57.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('239', 445, 91.000, 20.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('24', 853, 52.000, 67.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('240', 896, 31.000, 93.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('241', 187, 58.000, 82.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('242', 78, 23.000, 85.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('243', 234, 21.000, 32.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('244', 224, 21.000, 34.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('245', 448, 19.000, 66.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('246', 583, 97.000, 23.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('247', 124, 82.000, 91.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('248', 685, 36.000, 68.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('249', 629, 100.000, 24.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('25', 988, 16.000, 60.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('250', 305, 85.000, 33.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('251', 729, 86.000, 67.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('252', 727, 97.000, 59.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('253', 639, 73.000, 12.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('254', 559, 53.000, 94.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('255', 660, 88.000, 58.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('256', 209, 47.000, 25.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('257', 699, 94.000, 98.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('258', 384, 70.000, 66.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('259', 889, 77.000, 83.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('26', 319, 84.000, 28.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('260', 551, 28.000, 10.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('261', 618, 13.000, 10.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('262', 133, 84.000, 81.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('263', 604, 97.000, 27.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('264', 569, 55.000, 91.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('265', 747, 38.000, 72.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('266', 398, 82.000, 13.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('267', 880, 46.000, 85.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('268', 550, 62.000, 89.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('269', 735, 38.000, 10.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('27', 371, 46.000, 58.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('270', 90, 22.000, 58.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('271', 981, 35.000, 14.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('272', 739, 74.000, 16.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('273', 58, 12.000, 67.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('274', 564, 24.000, 61.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('275', 338, 32.000, 89.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('276', 190, 92.000, 92.000, 82.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('277', 8, 35.000, 32.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('278', 692, 99.000, 75.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('279', 698, 12.000, 80.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('28', 680, 59.000, 86.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('280', 677, 72.000, 48.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('281', 68, 40.000, 86.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('282', 88, 48.000, 86.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('283', 906, 50.000, 85.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('284', 483, 70.000, 73.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('285', 547, 88.000, 43.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('286', 120, 75.000, 70.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('287', 588, 19.000, 72.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('288', 565, 76.000, 80.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('289', 6, 86.000, 26.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('29', 318, 25.000, 88.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('290', 79, 33.000, 36.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('291', 667, 93.000, 24.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('292', 192, 34.000, 27.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('293', 524, 10.000, 98.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('294', 607, 13.000, 64.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('295', 873, 61.000, 21.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('296', 623, 55.000, 46.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('297', 403, 85.000, 14.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('298', 721, 57.000, 96.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('299', 948, 32.000, 74.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('3', 555, 38.000, 91.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('30', 154, 63.000, 75.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('300', 111, 51.000, 98.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('301', 301, 92.000, 68.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('302', 744, 58.000, 60.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('303', 762, 12.000, 17.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('304', 395, 29.000, 38.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('305', 293, 44.000, 55.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('306', 298, 13.000, 90.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('307', 504, 18.000, 59.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('308', 102, 60.000, 16.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('309', 690, 72.000, 58.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('31', 613, 94.000, 69.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('310', 156, 86.000, 19.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('311', 289, 86.000, 80.000, 100.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('312', 267, 51.000, 47.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('313', 197, 18.000, 28.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('314', 908, 41.000, 66.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('315', 546, 96.000, 45.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('316', 733, 77.000, 47.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('317', 658, 99.000, 93.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('318', 485, 13.000, 40.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('319', 858, 94.000, 45.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('32', 162, 95.000, 48.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('320', 998, 60.000, 20.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('321', 300, 26.000, 72.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('322', 928, 58.000, 66.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('323', 161, 22.000, 77.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('324', 346, 63.000, 49.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('325', 195, 84.000, 70.000, 100.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('326', 69, 90.000, 36.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('327', 475, 93.000, 47.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('328', 535, 67.000, 81.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('329', 12, 57.000, 100.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('33', 312, 33.000, 95.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('330', 650, 72.000, 81.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('331', 446, 90.000, 85.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('332', 455, 76.000, 52.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('333', 286, 78.000, 55.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('334', 784, 44.000, 43.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('335', 587, 14.000, 58.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('336', 714, 29.000, 51.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('337', 74, 73.000, 59.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('338', 837, 37.000, 31.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('339', 754, 34.000, 76.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('34', 549, 55.000, 12.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('340', 766, 86.000, 51.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('341', 465, 33.000, 39.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('342', 538, 57.000, 58.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('343', 261, 33.000, 77.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('344', 266, 98.000, 61.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('345', 89, 25.000, 91.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('346', 566, 28.000, 59.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('347', 974, 89.000, 39.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('348', 897, 52.000, 97.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('349', 283, 23.000, 74.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('35', 872, 13.000, 80.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('350', 996, 64.000, 27.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('351', 414, 65.000, 25.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('352', 507, 28.000, 75.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('353', 706, 75.000, 46.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('354', 119, 65.000, 79.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('355', 2, 19.000, 89.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('356', 349, 41.000, 47.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('357', 96, 25.000, 64.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('358', 108, 73.000, 78.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('359', 150, 44.000, 82.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('36', 619, 22.000, 65.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('360', 147, 13.000, 68.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('361', 847, 66.000, 81.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('362', 861, 37.000, 63.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('363', 947, 22.000, 23.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('364', 487, 11.000, 40.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('365', 340, 50.000, 42.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('366', 44, 37.000, 64.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('367', 84, 23.000, 79.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('368', 341, 54.000, 73.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('369', 409, 16.000, 32.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('37', 870, 34.000, 74.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('370', 180, 55.000, 94.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('371', 452, 84.000, 16.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('372', 950, 86.000, 98.000, 81.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('373', 742, 18.000, 27.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('374', 101, 80.000, 94.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('375', 439, 57.000, 24.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('376', 580, 52.000, 55.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('377', 249, 26.000, 27.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('378', 916, 46.000, 71.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('379', 331, 86.000, 68.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('38', 795, 61.000, 95.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('380', 288, 66.000, 19.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('381', 172, 10.000, 43.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('382', 9, 85.000, 92.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('383', 711, 31.000, 31.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('384', 296, 61.000, 31.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('385', 214, 56.000, 50.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('386', 277, 44.000, 58.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('387', 505, 37.000, 74.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('388', 724, 81.000, 23.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('389', 590, 27.000, 37.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('39', 596, 38.000, 81.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('390', 682, 76.000, 39.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('391', 510, 71.000, 59.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('392', 518, 73.000, 99.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('393', 898, 80.000, 13.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('394', 83, 62.000, 26.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('395', 254, 89.000, 54.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('396', 189, 83.000, 46.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('397', 436, 58.000, 58.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('398', 287, 25.000, 90.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('399', 834, 31.000, 93.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('4', 159, 100.000, 43.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('40', 997, 38.000, 36.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('400', 185, 30.000, 81.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('401', 229, 17.000, 38.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('402', 972, 47.000, 50.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('403', 814, 45.000, 60.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('404', 282, 100.000, 68.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('405', 867, 96.000, 21.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('406', 347, 96.000, 19.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('407', 895, 66.000, 14.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('408', 367, 90.000, 70.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('409', 936, 75.000, 18.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('41', 941, 100.000, 17.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('410', 265, 75.000, 98.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('411', 396, 91.000, 98.000, 92.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('412', 370, 59.000, 84.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('413', 75, 89.000, 58.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('414', 342, 73.000, 12.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('415', 50, 87.000, 38.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('416', 851, 36.000, 55.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('417', 722, 79.000, 57.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('418', 869, 49.000, 91.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('419', 637, 90.000, 24.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('42', 969, 58.000, 19.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('420', 719, 95.000, 52.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('421', 661, 95.000, 10.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('422', 597, 57.000, 24.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('423', 806, 79.000, 49.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('424', 612, 27.000, 82.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('425', 649, 24.000, 50.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('426', 36, 62.000, 63.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('427', 600, 18.000, 25.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('428', 226, 26.000, 34.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('429', 774, 31.000, 89.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('43', 127, 29.000, 40.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('430', 705, 80.000, 46.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('431', 921, 35.000, 67.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('432', 326, 44.000, 54.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('433', 213, 87.000, 10.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('434', 11, 93.000, 11.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('435', 878, 87.000, 73.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('436', 930, 87.000, 43.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('437', 488, 91.000, 53.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('438', 256, 34.000, 84.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('439', 651, 100.000, 20.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('44', 316, 82.000, 91.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('440', 47, 28.000, 23.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('441', 109, 62.000, 73.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('442', 960, 40.000, 15.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('443', 55, 76.000, 90.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('444', 844, 95.000, 46.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('445', 545, 76.000, 19.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('446', 400, 46.000, 78.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('447', 659, 23.000, 96.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('448', 360, 37.000, 37.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('449', 99, 52.000, 67.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('45', 480, 69.000, 57.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('450', 833, 60.000, 99.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('451', 865, 15.000, 92.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('452', 777, 63.000, 42.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('453', 63, 23.000, 48.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('454', 768, 98.000, 71.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('455', 397, 86.000, 20.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('456', 543, 91.000, 33.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('457', 33, 60.000, 11.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('458', 776, 12.000, 76.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('459', 82, 15.000, 90.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('46', 153, 34.000, 59.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('460', 963, 66.000, 76.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('461', 560, 31.000, 59.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('462', 302, 83.000, 32.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('463', 392, 47.000, 36.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('464', 332, 43.000, 72.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('465', 621, 85.000, 80.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('466', 106, 26.000, 70.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('467', 42, 56.000, 64.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('468', 166, 68.000, 62.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('469', 689, 26.000, 72.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('47', 178, 32.000, 20.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('470', 694, 64.000, 73.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('471', 379, 12.000, 83.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('472', 66, 30.000, 51.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('473', 321, 45.000, 44.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('474', 222, 92.000, 15.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('475', 376, 55.000, 83.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('476', 562, 17.000, 57.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('477', 595, 74.000, 68.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('478', 970, 24.000, 71.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('479', 826, 10.000, 25.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('48', 145, 94.000, 38.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('480', 964, 100.000, 13.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('481', 824, 21.000, 43.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('482', 666, 90.000, 54.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('483', 327, 32.000, 11.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('484', 686, 57.000, 62.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('485', 270, 63.000, 73.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('486', 959, 76.000, 23.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('487', 139, 91.000, 35.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('488', 760, 91.000, 57.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('489', 339, 52.000, 29.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('49', 238, 94.000, 65.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('490', 527, 21.000, 74.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('491', 401, 81.000, 45.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('492', 554, 61.000, 43.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('493', 703, 84.000, 73.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('494', 478, 79.000, 43.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('495', 268, 35.000, 59.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('496', 799, 34.000, 86.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('497', 728, 85.000, 66.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('498', 279, 83.000, 42.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('499', 636, 77.000, 71.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('5', 839, 49.000, 43.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('50', 461, 81.000, 73.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('500', 126, 19.000, 41.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('501', 622, 50.000, 57.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('502', 704, 32.000, 65.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('503', 352, 27.000, 89.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('504', 593, 96.000, 89.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('505', 501, 42.000, 57.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('506', 519, 92.000, 74.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('507', 307, 78.000, 38.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('508', 647, 32.000, 89.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('509', 429, 99.000, 40.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('51', 836, 32.000, 76.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('510', 51, 47.000, 18.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('511', 28, 71.000, 75.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('512', 433, 25.000, 62.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('513', 41, 95.000, 87.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('514', 402, 64.000, 97.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('515', 664, 36.000, 41.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('516', 373, 83.000, 36.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('517', 909, 98.000, 18.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('518', 399, 45.000, 30.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('519', 531, 92.000, 99.000, 70.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('52', 67, 45.000, 79.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('520', 18, 23.000, 33.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('521', 652, 82.000, 69.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('522', 492, 23.000, 25.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('523', 361, 46.000, 86.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('524', 945, 12.000, 95.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('525', 758, 13.000, 37.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('526', 333, 65.000, 43.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('527', 626, 52.000, 16.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('528', 114, 65.000, 57.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('529', 431, 44.000, 91.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('53', 64, 81.000, 16.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('530', 610, 31.000, 98.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('531', 764, 48.000, 98.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('532', 726, 24.000, 97.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('533', 911, 78.000, 46.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('534', 809, 58.000, 87.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('535', 350, 29.000, 75.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('536', 362, 24.000, 33.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('537', 982, 59.000, 64.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('538', 468, 45.000, 13.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('539', 971, 47.000, 20.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('54', 479, 45.000, 58.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('540', 955, 68.000, 69.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('541', 432, 84.000, 71.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('542', 390, 72.000, 18.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('543', 46, 50.000, 73.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('544', 606, 19.000, 73.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('545', 157, 98.000, 29.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('546', 199, 21.000, 83.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('547', 168, 64.000, 77.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('548', 943, 45.000, 22.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('549', 435, 47.000, 84.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('55', 730, 30.000, 20.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('550', 329, 72.000, 98.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('551', 394, 34.000, 70.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('552', 494, 93.000, 49.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('553', 53, 74.000, 49.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('554', 451, 50.000, 88.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('555', 822, 84.000, 40.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('556', 529, 13.000, 42.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('557', 628, 57.000, 48.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('558', 251, 96.000, 64.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('559', 495, 15.000, 51.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('56', 407, 17.000, 71.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('560', 915, 97.000, 38.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('561', 410, 17.000, 59.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('562', 291, 18.000, 67.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('563', 717, 29.000, 27.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('564', 533, 41.000, 76.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('565', 567, 95.000, 25.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('566', 299, 94.000, 98.000, 69.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('567', 877, 86.000, 36.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('568', 158, 66.000, 30.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('569', 503, 73.000, 30.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('57', 77, 50.000, 99.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('570', 748, 33.000, 52.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('571', 499, 21.000, 94.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('572', 428, 66.000, 36.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('573', 144, 65.000, 50.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('574', 986, 38.000, 42.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('575', 467, 91.000, 47.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('576', 695, 30.000, 13.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('577', 325, 30.000, 71.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('578', 807, 11.000, 58.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('579', 708, 16.000, 60.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('58', 812, 60.000, 23.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('580', 404, 100.000, 85.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('581', 215, 17.000, 29.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('582', 785, 22.000, 30.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('583', 311, 11.000, 99.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('584', 521, 51.000, 41.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('585', 956, 58.000, 47.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('586', 387, 16.000, 86.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('587', 763, 37.000, 27.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('588', 830, 78.000, 92.000, 99.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('589', 497, 80.000, 82.000, 92.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('59', 466, 20.000, 66.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('590', 953, 71.000, 90.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('591', 366, 75.000, 11.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('592', 980, 74.000, 33.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('593', 625, 18.000, 42.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('594', 798, 26.000, 10.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('595', 925, 55.000, 14.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('596', 761, 42.000, 58.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('597', 146, 69.000, 59.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('598', 278, 71.000, 95.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('599', 791, 42.000, 84.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('6', 208, 91.000, 42.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('60', 780, 38.000, 55.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('600', 430, 93.000, 15.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('601', 179, 13.000, 92.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('602', 781, 74.000, 60.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('603', 893, 88.000, 24.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('604', 72, 73.000, 52.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('605', 93, 95.000, 89.000, 71.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('606', 356, 98.000, 22.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('607', 233, 24.000, 37.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('608', 738, 68.000, 73.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('609', 793, 46.000, 25.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('61', 819, 15.000, 46.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('610', 408, 96.000, 60.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('611', 303, 79.000, 83.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('612', 29, 86.000, 72.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('613', 904, 99.000, 13.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('614', 976, 55.000, 77.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('615', 182, 53.000, 72.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('616', 577, 77.000, 54.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('617', 797, 28.000, 63.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('618', 832, 59.000, 38.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('619', 614, 29.000, 38.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('62', 98, 99.000, 11.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('620', 632, 93.000, 97.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('621', 444, 41.000, 66.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('622', 951, 38.000, 50.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('623', 805, 66.000, 24.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('624', 939, 24.000, 75.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('625', 438, 54.000, 73.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('626', 992, 19.000, 73.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('627', 552, 79.000, 69.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('628', 944, 94.000, 81.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('629', 351, 78.000, 71.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('63', 364, 29.000, 49.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('630', 890, 53.000, 10.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('631', 469, 89.000, 26.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('632', 571, 21.000, 34.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('633', 221, 63.000, 35.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('634', 453, 97.000, 26.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('635', 345, 35.000, 42.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('636', 749, 36.000, 36.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('637', 177, 17.000, 32.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('638', 966, 54.000, 98.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('639', 542, 31.000, 58.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('64', 789, 59.000, 42.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('640', 92, 95.000, 76.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('641', 609, 11.000, 88.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('642', 857, 82.000, 52.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('643', 322, 40.000, 23.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('644', 594, 15.000, 51.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('645', 517, 28.000, 62.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('646', 375, 52.000, 81.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('647', 490, 14.000, 71.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('648', 386, 48.000, 27.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('649', 107, 35.000, 25.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('65', 160, 73.000, 91.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('650', 516, 28.000, 86.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('651', 203, 88.000, 66.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('652', 821, 33.000, 17.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('653', 591, 29.000, 63.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('654', 118, 54.000, 100.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('655', 169, 71.000, 48.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('656', 523, 19.000, 33.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('657', 123, 100.000, 50.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('658', 363, 69.000, 95.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('659', 848, 56.000, 91.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('66', 737, 69.000, 85.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('660', 670, 16.000, 87.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('661', 736, 98.000, 86.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('662', 216, 65.000, 76.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('663', 263, 41.000, 34.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('664', 308, 91.000, 13.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('665', 437, 58.000, 22.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('666', 891, 79.000, 61.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('667', 380, 32.000, 12.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('668', 456, 10.000, 24.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('669', 934, 12.000, 82.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('67', 227, 72.000, 41.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('670', 846, 96.000, 78.000, 97.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('671', 868, 94.000, 76.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('672', 746, 12.000, 89.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('673', 506, 76.000, 31.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('674', 767, 58.000, 81.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('675', 486, 29.000, 22.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('676', 242, 41.000, 87.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('677', 751, 45.000, 16.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('678', 672, 82.000, 10.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('679', 933, 80.000, 63.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('68', 184, 84.000, 75.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('680', 212, 12.000, 92.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('681', 498, 86.000, 26.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('682', 537, 11.000, 85.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('683', 665, 98.000, 24.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('684', 211, 89.000, 50.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('685', 581, 37.000, 32.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('686', 378, 89.000, 58.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('687', 138, 88.000, 11.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('688', 344, 78.000, 13.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('689', 792, 18.000, 91.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('69', 563, 68.000, 68.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('690', 702, 20.000, 23.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('691', 656, 72.000, 64.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('692', 561, 44.000, 83.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('693', 843, 61.000, 15.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('694', 426, 91.000, 27.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('695', 740, 23.000, 78.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('696', 882, 72.000, 29.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('697', 5, 68.000, 52.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('698', 864, 99.000, 37.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('699', 7, 37.000, 94.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('7', 20, 49.000, 51.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('70', 140, 49.000, 15.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('700', 696, 72.000, 46.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('701', 276, 25.000, 42.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('702', 734, 24.000, 18.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('703', 365, 39.000, 76.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('704', 330, 87.000, 52.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('705', 709, 66.000, 58.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('706', 337, 21.000, 20.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('707', 132, 80.000, 72.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('708', 137, 34.000, 10.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('709', 919, 67.000, 32.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('71', 854, 52.000, 34.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('710', 669, 65.000, 77.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('711', 589, 43.000, 55.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('712', 849, 23.000, 19.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('713', 818, 40.000, 26.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('714', 829, 53.000, 85.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('715', 171, 25.000, 69.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('716', 634, 78.000, 81.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('717', 112, 12.000, 57.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('718', 655, 17.000, 32.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('719', 76, 62.000, 48.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('72', 462, 88.000, 81.000, 82.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('720', 449, 64.000, 71.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('721', 198, 61.000, 63.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('722', 929, 24.000, 85.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('723', 509, 47.000, 68.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('724', 419, 29.000, 68.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('725', 808, 86.000, 98.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('726', 87, 55.000, 11.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('727', 575, 57.000, 71.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('728', 500, 15.000, 82.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('729', 49, 91.000, 64.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('73', 389, 61.000, 50.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('730', 691, 73.000, 59.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('731', 654, 56.000, 60.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('732', 526, 25.000, 48.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('733', 697, 45.000, 13.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('734', 910, 29.000, 42.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('735', 391, 76.000, 45.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('736', 641, 54.000, 50.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('737', 820, 38.000, 70.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('738', 131, 65.000, 40.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('739', 442, 51.000, 41.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('74', 892, 74.000, 42.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('740', 148, 36.000, 72.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('741', 80, 15.000, 41.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('742', 786, 57.000, 40.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('743', 918, 98.000, 78.000, 92.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('744', 630, 49.000, 58.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('745', 888, 43.000, 16.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('746', 290, 29.000, 32.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('747', 884, 27.000, 90.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('748', 881, 88.000, 70.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('749', 37, 16.000, 23.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('75', 248, 59.000, 76.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('750', 19, 81.000, 22.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('751', 923, 16.000, 97.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('752', 544, 71.000, 16.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('753', 260, 31.000, 56.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('754', 314, 59.000, 92.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('755', 129, 78.000, 48.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('756', 183, 85.000, 87.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('757', 887, 52.000, 17.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('758', 65, 31.000, 51.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('759', 615, 10.000, 94.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('76', 484, 81.000, 30.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('760', 232, 16.000, 83.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('761', 842, 25.000, 40.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('762', 769, 68.000, 29.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('763', 81, 21.000, 30.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('764', 823, 69.000, 97.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('765', 968, 96.000, 71.000, 86.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('766', 220, 45.000, 59.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('767', 294, 37.000, 52.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('768', 496, 42.000, 93.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('769', 815, 58.000, 99.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('77', 246, 77.000, 63.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('770', 411, 76.000, 56.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('771', 252, 19.000, 84.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('772', 440, 88.000, 92.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('773', 576, 53.000, 87.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('774', 900, 67.000, 29.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('775', 309, 20.000, 62.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('776', 130, 76.000, 64.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('777', 835, 14.000, 61.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('778', 152, 79.000, 31.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('779', 903, 50.000, 85.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('78', 794, 67.000, 90.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('780', 657, 28.000, 25.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('781', 935, 55.000, 49.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('782', 800, 47.000, 15.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('783', 15, 42.000, 49.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('784', 281, 10.000, 90.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('785', 765, 27.000, 65.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('786', 382, 68.000, 83.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('787', 556, 93.000, 55.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('788', 258, 100.000, 86.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('789', 243, 49.000, 76.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('79', 779, 96.000, 54.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('790', 540, 85.000, 83.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('791', 989, 98.000, 45.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('792', 176, 11.000, 26.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('793', 14, 69.000, 79.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('794', 759, 74.000, 78.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('795', 245, 99.000, 97.000, 89.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('796', 210, 61.000, 97.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('797', 200, 68.000, 89.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('798', 315, 38.000, 80.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('799', 113, 49.000, 52.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('8', 684, 68.000, 56.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('80', 94, 74.000, 39.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('800', 202, 57.000, 75.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('801', 645, 34.000, 17.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('802', 994, 27.000, 80.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('803', 548, 100.000, 40.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('804', 324, 63.000, 26.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('805', 856, 40.000, 43.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('806', 317, 35.000, 58.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('807', 482, 27.000, 96.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('808', 21, 15.000, 52.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('809', 599, 43.000, 12.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('81', 374, 24.000, 20.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('810', 415, 71.000, 76.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('811', 264, 47.000, 98.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('812', 574, 92.000, 87.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('813', 310, 82.000, 68.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('814', 343, 99.000, 60.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('815', 443, 59.000, 47.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('816', 23, 100.000, 57.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('817', 155, 46.000, 62.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('818', 104, 90.000, 48.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('819', 954, 15.000, 63.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('82', 231, 36.000, 70.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('820', 683, 44.000, 45.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('821', 673, 34.000, 91.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('822', 39, 63.000, 92.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('823', 770, 77.000, 60.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('824', 297, 45.000, 47.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('825', 459, 61.000, 30.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('826', 608, 21.000, 30.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('827', 405, 62.000, 56.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('828', 142, 98.000, 18.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('829', 219, 71.000, 64.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('83', 977, 40.000, 67.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('830', 335, 63.000, 98.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('831', 181, 69.000, 46.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('832', 827, 99.000, 67.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('833', 491, 63.000, 46.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('834', 368, 12.000, 11.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('835', 292, 46.000, 45.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('836', 756, 52.000, 69.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('837', 204, 55.000, 29.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('838', 675, 60.000, 53.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('839', 993, 53.000, 79.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('84', 464, 30.000, 98.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('840', 223, 93.000, 99.000, 80.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('841', 95, 18.000, 21.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('842', 668, 45.000, 27.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('843', 493, 93.000, 18.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('844', 110, 40.000, 100.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('845', 4, 61.000, 99.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('846', 86, 61.000, 51.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('847', 586, 96.000, 73.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('848', 188, 22.000, 48.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('849', 22, 89.000, 21.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('85', 239, 94.000, 65.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('850', 688, 68.000, 22.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('851', 26, 40.000, 19.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('852', 122, 68.000, 17.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('853', 532, 22.000, 84.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('854', 871, 71.000, 38.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('855', 508, 86.000, 66.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('856', 413, 32.000, 18.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('857', 85, 60.000, 16.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('858', 825, 37.000, 28.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('859', 121, 18.000, 16.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('86', 269, 68.000, 63.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('860', 983, 67.000, 40.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('861', 536, 85.000, 14.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('862', 236, 10.000, 97.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('863', 693, 71.000, 73.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('864', 164, 84.000, 50.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('865', 418, 67.000, 31.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('866', 802, 92.000, 54.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('867', 30, 65.000, 98.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('868', 230, 85.000, 36.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('869', 40, 93.000, 90.000, 86.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('87', 143, 17.000, 13.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('870', 572, 25.000, 42.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('871', 816, 18.000, 67.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('872', 995, 84.000, 47.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('873', 125, 71.000, 41.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('874', 905, 24.000, 72.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('875', 987, 79.000, 76.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('876', 894, 50.000, 28.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('877', 584, 23.000, 73.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('878', 876, 16.000, 98.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('879', 186, 25.000, 98.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('88', 757, 81.000, 79.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('880', 24, 93.000, 75.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('881', 207, 98.000, 13.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('882', 979, 74.000, 78.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('883', 100, 57.000, 30.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('884', 710, 15.000, 14.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('885', 573, 62.000, 23.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('886', 938, 45.000, 63.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('887', 52, 93.000, 51.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('888', 105, 12.000, 92.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('889', 372, 59.000, 38.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('89', 441, 61.000, 42.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('890', 173, 36.000, 38.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('891', 334, 95.000, 57.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('892', 681, 35.000, 93.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('893', 985, 77.000, 78.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('894', 773, 90.000, 11.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('895', 902, 43.000, 55.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('896', 946, 82.000, 31.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('897', 635, 89.000, 10.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('898', 336, 11.000, 73.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('899', 831, 97.000, 80.000, 94.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('9', 885, 54.000, 69.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('90', 662, 79.000, 46.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('900', 57, 37.000, 48.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('901', 128, 70.000, 73.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('902', 932, 43.000, 84.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('903', 957, 44.000, 28.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('904', 713, 42.000, 74.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('905', 514, 25.000, 64.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('906', 357, 20.000, 39.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('907', 170, 16.000, 32.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('908', 295, 40.000, 58.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('909', 796, 29.000, 45.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('91', 961, 51.000, 44.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('910', 679, 58.000, 14.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('911', 624, 83.000, 78.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('912', 840, 13.000, 66.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('913', 913, 54.000, 41.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('914', 59, 60.000, 61.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('915', 116, 68.000, 44.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('916', 716, 13.000, 15.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('917', 520, 99.000, 87.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('918', 810, 95.000, 28.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('919', 38, 25.000, 51.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('92', 477, 35.000, 75.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('920', 450, 22.000, 22.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('921', 640, 58.000, 22.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('922', 958, 45.000, 11.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('923', 585, 68.000, 78.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('924', 841, 64.000, 37.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('925', 388, 88.000, 92.000, 75.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('926', 782, 64.000, 17.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('927', 745, 62.000, 41.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('928', 259, 16.000, 21.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('929', 34, 10.000, 82.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('93', 967, 92.000, 45.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('930', 723, 86.000, 35.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('931', 1, 64.000, 22.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('932', 601, 32.000, 53.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('933', 755, 15.000, 68.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('934', 582, 60.000, 59.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('935', 940, 64.000, 52.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('936', 358, 63.000, 35.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('937', 917, 49.000, 62.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('938', 990, 16.000, 47.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('939', 163, 58.000, 77.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('94', 417, 93.000, 57.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('940', 931, 80.000, 62.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('941', 973, 75.000, 24.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('942', 250, 39.000, 50.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('943', 633, 45.000, 89.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('944', 393, 63.000, 26.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('945', 674, 18.000, 43.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('946', 720, 48.000, 47.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('947', 743, 69.000, 48.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('948', 489, 91.000, 47.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('949', 115, 61.000, 18.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('95', 999, 75.000, 34.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('950', 855, 93.000, 47.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('951', 35, 97.000, 52.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('952', 191, 54.000, 36.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('953', 952, 72.000, 89.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('954', 511, 73.000, 63.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('955', 687, 12.000, 94.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('956', 304, 47.000, 62.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('957', 91, 96.000, 64.000, 99.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('958', 48, 32.000, 19.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('959', 965, 57.000, 54.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('96', 60, 42.000, 43.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('960', 642, 19.000, 17.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('961', 783, 37.000, 93.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('962', 353, 49.000, 70.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('963', 285, 98.000, 95.000, 87.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('964', 45, 86.000, 72.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('965', 13, 91.000, 79.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('966', 406, 55.000, 93.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('967', 811, 36.000, 48.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('968', 922, 35.000, 30.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('969', 420, 31.000, 20.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('97', 852, 72.000, 54.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('970', 434, 22.000, 68.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('971', 174, 26.000, 54.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('972', 750, 64.000, 52.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('973', 463, 23.000, 34.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('974', 879, 67.000, 70.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('975', 901, 79.000, 33.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('976', 54, 92.000, 96.000, 96.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('977', 598, 99.000, 10.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('978', 135, 16.000, 81.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('979', 845, 50.000, 65.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('98', 225, 38.000, 67.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('980', 97, 19.000, 95.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('981', 578, 54.000, 10.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('982', 752, 80.000, 91.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('983', 725, 54.000, 45.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('984', 237, 51.000, 87.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('985', 949, 17.000, 35.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('986', 16, 42.000, 37.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('987', 616, 50.000, 83.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('988', 369, 72.000, 80.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('989', 31, 47.000, 84.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('99', 205, 62.000, 72.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('990', 323, 40.000, 42.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('991', 421, 96.000, 71.000, 90.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('992', 631, 54.000, 20.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('993', 217, 15.000, 24.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('994', 663, 48.000, 25.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('995', 648, 20.000, 88.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('996', 874, 76.000, 76.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('997', 422, 97.000, 100.000, 73.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `a_dribble` VALUES ('998', 924, 34.000, 98.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `a_dribble` VALUES ('999', 25, 45.000, 96.000, 36.000, '一眼顶针 鉴定为垃圾');

-- ----------------------------
-- Table structure for a_exercise_resource
-- ----------------------------
DROP TABLE IF EXISTS `a_exercise_resource`;
CREATE TABLE `a_exercise_resource`  (
  `er_id` decimal(40, 0) NOT NULL COMMENT '资源ID',
  `ms_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '评分ID',
  `er_picture` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '练习URL',
  `er_time` date NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`er_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 A2 A3 技能练习、技能测试练习资源表\r\n\r\na_mark_sheet\r\nms_i' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_exercise_resource
-- ----------------------------

-- ----------------------------
-- Table structure for a_exercise_task
-- ----------------------------
DROP TABLE IF EXISTS `a_exercise_task`;
CREATE TABLE `a_exercise_task`  (
  `et_id` decimal(40, 0) NOT NULL COMMENT '任务ID',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `ms_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '评分ID',
  `enum_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '枚举ID',
  `et_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `et_description` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务描述',
  `et_create_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`et_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 A2 A3 技能练习、技能测试系列表\r\n\r\nenumerate\r\nenum_id\r\n                                    ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_exercise_task
-- ----------------------------

-- ----------------------------
-- Table structure for a_mark_sheet
-- ----------------------------
DROP TABLE IF EXISTS `a_mark_sheet`;
CREATE TABLE `a_mark_sheet`  (
  `ms_id` decimal(40, 0) NOT NULL COMMENT '评分ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `ms_score` decimal(10, 3) NOT NULL COMMENT 'EROCK评分',
  `ms_time` date NOT NULL COMMENT '评分时间',
  `ms_dribble` decimal(40, 3) NOT NULL COMMENT '运球分数',
  `ms_shooting` decimal(40, 3) NOT NULL COMMENT '投篮分数',
  PRIMARY KEY (`ms_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = ' A1 A2 A3 技能练习、技能测试评分表\r\nD模块进步分从这个表中获取期初和期末的技能测试数据进行计算\r\n                                 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_mark_sheet
-- ----------------------------
INSERT INTO `a_mark_sheet` VALUES (1, '202252000066', '19760532970', 47.000, '2018-07-25', 28.000, 84.000);
INSERT INTO `a_mark_sheet` VALUES (2, '202252000219', '19760532085', 85.000, '2019-05-31', 66.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (3, '202252000008', '19760532266', 68.000, '2012-04-30', 30.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (4, '202252000565', '19760532564', 51.000, '2016-04-19', 42.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (5, '202252000761', '19760532306', 57.000, '2020-03-11', 47.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (6, '202252000055', '19760532669', 47.000, '2003-09-13', 68.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (7, '202252000525', '19760532527', 78.000, '2014-05-10', 95.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (8, '202252000712', '19760532727', 39.000, '2022-04-02', 40.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (9, '202252000636', '19760532554', 72.000, '2012-01-05', 95.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (10, '202252000852', '19760532150', 67.000, '2019-07-31', 16.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (11, '202252000701', '19760532784', 79.000, '2022-06-24', 75.000, 72.000);
INSERT INTO `a_mark_sheet` VALUES (12, '202252000119', '19760532385', 32.000, '2013-12-18', 97.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (13, '202252000901', '19760533009', 99.000, '2020-07-08', 72.000, 72.000);
INSERT INTO `a_mark_sheet` VALUES (14, '202252000730', '19760532974', 67.000, '2024-12-26', 32.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (15, '202252000658', '19760532656', 58.000, '2008-01-03', 31.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (16, '202252000091', '19760532096', 89.000, '2008-03-11', 71.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (17, '202252000987', '19760532469', 55.000, '2024-10-01', 14.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (18, '202252000170', '19760532519', 10.000, '2000-03-10', 80.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (19, '202252000220', '19760532064', 36.000, '2011-02-08', 23.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (20, '202252000603', '19760532434', 42.000, '2008-07-06', 81.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (21, '202252000756', '19760532546', 27.000, '2017-04-09', 81.000, 24.000);
INSERT INTO `a_mark_sheet` VALUES (22, '202252000710', '19760532200', 72.000, '2012-05-08', 21.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (23, '202252000113', '19760532571', 14.000, '2013-12-07', 65.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (24, '202252000709', '19760532774', 30.000, '2010-12-03', 53.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (25, '202252000849', '19760532376', 91.000, '2015-11-04', 98.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (26, '202252000418', '19760532103', 39.000, '2009-07-17', 66.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (27, '202252000743', '19760532893', 30.000, '2021-02-27', 38.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (28, '202252000608', '19760532821', 38.000, '2021-01-16', 43.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (29, '202252000785', '19760532330', 27.000, '2017-09-22', 80.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (30, '202252000125', '19760532825', 90.000, '2021-11-06', 33.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (31, '202252000834', '19760532963', 53.000, '2014-08-11', 24.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (32, '202252000281', '19760532536', 57.000, '2018-05-21', 94.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (33, '202252000103', '19760532526', 71.000, '2018-09-12', 42.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (34, '202252000261', '19760533044', 78.000, '2003-04-28', 71.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (35, '202252000835', '19760532495', 88.000, '2016-03-21', 47.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (36, '202252000406', '19760532082', 27.000, '2022-04-03', 33.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (37, '202252000847', '19760532816', 57.000, '2019-10-26', 76.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (38, '202252000534', '19760532717', 79.000, '2006-01-06', 78.000, 84.000);
INSERT INTO `a_mark_sheet` VALUES (39, '202252000413', '19760532687', 17.000, '2017-05-04', 50.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (40, '202252000898', '19760532346', 76.000, '2001-10-06', 91.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (41, '202252000297', '19760532724', 66.000, '2007-01-21', 24.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (42, '202252000907', '19760532719', 20.000, '2011-03-23', 39.000, 36.000);
INSERT INTO `a_mark_sheet` VALUES (43, '202252000427', '19760532067', 52.000, '2001-07-16', 25.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (44, '202252000453', '19760532669', 46.000, '2001-07-12', 67.000, 42.000);
INSERT INTO `a_mark_sheet` VALUES (45, '202252000683', '19760532601', 29.000, '2021-12-11', 79.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (46, '202252000127', '19760532564', 85.000, '2011-05-13', 41.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (47, '202252000523', '19760532970', 43.000, '2009-02-22', 27.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (48, '202252000722', '19760532892', 46.000, '2007-01-01', 35.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (49, '202252000720', '19760532804', 75.000, '2006-08-29', 34.000, 97.000);
INSERT INTO `a_mark_sheet` VALUES (50, '202252000213', '19760532982', 16.000, '2015-05-07', 96.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (51, '202252000390', '19760532998', 47.000, '2002-03-20', 14.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (52, '202252000005', '19760532451', 22.000, '2017-08-08', 53.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (53, '202252000753', '19760532784', 97.000, '2021-08-03', 49.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (54, '202252000720', '19760532679', 93.000, '2022-11-12', 13.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (55, '202252000071', '19760532900', 35.000, '2016-02-27', 74.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (56, '202252000106', '19760532180', 93.000, '2006-10-20', 41.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (57, '202252000539', '19760532855', 96.000, '2002-01-21', 42.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (58, '202252000424', '19760533053', 59.000, '2020-08-01', 57.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (59, '202252000056', '19760532700', 10.000, '2000-05-25', 69.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (60, '202252000714', '19760532135', 23.000, '2009-07-03', 89.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (61, '202252000167', '19760532452', 70.000, '2002-09-17', 80.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (62, '202252000856', '19760532198', 50.000, '2012-02-10', 16.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (63, '202252000416', '19760532097', 41.000, '2008-04-02', 15.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (64, '202252000391', '19760532616', 84.000, '2010-11-30', 44.000, 24.000);
INSERT INTO `a_mark_sheet` VALUES (65, '202252000629', '19760532202', 16.000, '2007-04-13', 53.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (66, '202252000477', '19760532349', 63.000, '2019-09-16', 90.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (67, '202252000183', '19760533003', 64.000, '2002-02-13', 93.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (68, '202252000600', '19760532796', 15.000, '2023-09-14', 22.000, 97.000);
INSERT INTO `a_mark_sheet` VALUES (69, '202252000133', '19760532123', 89.000, '2017-04-14', 21.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (70, '202252000694', '19760532148', 99.000, '2005-01-17', 70.000, 72.000);
INSERT INTO `a_mark_sheet` VALUES (71, '202252000122', '19760532972', 52.000, '2011-06-17', 50.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (72, '202252000011', '19760533031', 45.000, '2008-08-07', 79.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (73, '202252000639', '19760532231', 63.000, '2015-10-05', 19.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (74, '202252000429', '19760532473', 34.000, '2013-05-08', 33.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (75, '202252000590', '19760532417', 59.000, '2022-05-20', 43.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (76, '202252000298', '19760532346', 96.000, '2022-10-05', 81.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (77, '202252000944', '19760532159', 16.000, '2021-11-28', 43.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (78, '202252000458', '19760533022', 55.000, '2007-04-05', 67.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (79, '202252000298', '19760532892', 76.000, '2020-07-14', 19.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (80, '202252000541', '19760532834', 42.000, '2002-06-09', 78.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (81, '202252000223', '19760532594', 20.000, '2013-10-12', 90.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (82, '202252000546', '19760532182', 12.000, '2015-04-20', 34.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (83, '202252000849', '19760532727', 44.000, '2007-12-15', 51.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (84, '202252000258', '19760532928', 50.000, '2022-01-15', 71.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (85, '202252000428', '19760532423', 58.000, '2024-03-16', 53.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (86, '202252000143', '19760532714', 12.000, '2002-08-13', 59.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (87, '202252000014', '19760532693', 31.000, '2019-05-19', 20.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (88, '202252000595', '19760532713', 100.000, '2005-10-10', 14.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (89, '202252000784', '19760532413', 33.000, '2004-02-25', 25.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (90, '202252000225', '19760532293', 16.000, '2020-10-12', 31.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (91, '202252000265', '19760532558', 78.000, '2023-04-06', 38.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (92, '202252000353', '19760532188', 93.000, '2005-11-04', 72.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (93, '202252000141', '19760532223', 90.000, '2015-02-07', 57.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (94, '202252000005', '19760532471', 85.000, '2023-05-08', 23.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (95, '202252000280', '19760532160', 62.000, '2007-09-07', 96.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (96, '202252000544', '19760532241', 80.000, '2021-10-23', 95.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (97, '202252000158', '19760532664', 36.000, '2011-10-11', 35.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (98, '202252000253', '19760532846', 58.000, '2017-10-24', 95.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (99, '202252000533', '19760532272', 33.000, '2014-09-15', 97.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (100, '202252000879', '19760532328', 95.000, '2005-01-13', 89.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (101, '202252000866', '19760532798', 84.000, '2012-09-21', 44.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (102, '202252000666', '19760532517', 29.000, '2003-11-08', 30.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (103, '202252000597', '19760532983', 90.000, '2007-12-30', 79.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (104, '202252000883', '19760532647', 18.000, '2006-04-24', 52.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (105, '202252000592', '19760532330', 39.000, '2007-07-09', 76.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (106, '202252000971', '19760532760', 73.000, '2011-07-19', 75.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (107, '202252000726', '19760532362', 49.000, '2023-03-05', 92.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (108, '202252000807', '19760532901', 94.000, '2011-11-13', 30.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (109, '202252000297', '19760532951', 35.000, '2014-07-28', 13.000, 86.000);
INSERT INTO `a_mark_sheet` VALUES (110, '202252000522', '19760532547', 10.000, '2022-07-26', 13.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (111, '202252000657', '19760532078', 66.000, '2014-09-12', 96.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (112, '202252000620', '19760532903', 23.000, '2019-11-27', 69.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (113, '202252000713', '19760532985', 48.000, '2007-09-07', 75.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (114, '202252000328', '19760532805', 10.000, '2020-02-27', 56.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (115, '202252000775', '19760532191', 53.000, '2001-11-18', 55.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (116, '202252000153', '19760532878', 11.000, '2010-07-12', 71.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (117, '202252000606', '19760532299', 83.000, '2004-10-30', 95.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (118, '202252000504', '19760532418', 25.000, '2017-02-01', 57.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (119, '202252000238', '19760532622', 61.000, '2024-03-03', 46.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (120, '202252000865', '19760532701', 60.000, '2016-09-05', 35.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (121, '202252000147', '19760532240', 73.000, '2009-05-20', 76.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (122, '202252000801', '19760532900', 17.000, '2018-10-01', 10.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (123, '202252000148', '19760532887', 69.000, '2007-12-18', 92.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (124, '202252000523', '19760532161', 29.000, '2014-04-20', 83.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (125, '202252000340', '19760532094', 88.000, '2020-03-24', 92.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (126, '202252000431', '19760532326', 81.000, '2016-10-14', 75.000, 86.000);
INSERT INTO `a_mark_sheet` VALUES (127, '202252000947', '19760532436', 37.000, '2021-01-25', 91.000, 84.000);
INSERT INTO `a_mark_sheet` VALUES (128, '202252000512', '19760532554', 65.000, '2024-10-06', 38.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (129, '202252000824', '19760532441', 40.000, '2004-09-28', 91.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (130, '202252000739', '19760532884', 10.000, '2011-03-17', 22.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (131, '202252000146', '19760532409', 57.000, '2007-03-13', 23.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (132, '202252000911', '19760532878', 73.000, '2005-01-13', 96.000, 64.000);
INSERT INTO `a_mark_sheet` VALUES (133, '202252000383', '19760532195', 37.000, '2024-11-06', 61.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (134, '202252000379', '19760532434', 10.000, '2009-02-07', 51.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (135, '202252000741', '19760532182', 91.000, '2019-10-30', 18.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (136, '202252000837', '19760532171', 69.000, '2003-07-11', 39.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (137, '202252000595', '19760532585', 72.000, '2018-09-07', 45.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (138, '202252000765', '19760532490', 60.000, '2009-03-29', 63.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (139, '202252000405', '19760532228', 61.000, '2020-04-09', 23.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (140, '202252000219', '19760532392', 85.000, '2019-11-09', 83.000, 24.000);
INSERT INTO `a_mark_sheet` VALUES (141, '202252000655', '19760532809', 72.000, '2004-06-26', 76.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (142, '202252000510', '19760532704', 33.000, '2001-02-21', 51.000, 12.000);
INSERT INTO `a_mark_sheet` VALUES (143, '202252000298', '19760532364', 100.000, '2013-01-06', 33.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (144, '202252000411', '19760532255', 84.000, '2007-04-10', 87.000, 17.000);
INSERT INTO `a_mark_sheet` VALUES (145, '202252000518', '19760532058', 92.000, '2014-10-04', 63.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (146, '202252000546', '19760532089', 52.000, '2018-09-23', 19.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (147, '202252000319', '19760532726', 96.000, '2019-05-09', 77.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (148, '202252000871', '19760532108', 87.000, '2016-04-14', 98.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (149, '202252000256', '19760532803', 42.000, '2003-03-27', 67.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (150, '202252000843', '19760532520', 44.000, '2014-11-22', 34.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (151, '202252000345', '19760532125', 84.000, '2015-01-16', 99.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (152, '202252000457', '19760532268', 48.000, '2004-06-08', 84.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (153, '202252000072', '19760532057', 75.000, '2015-06-13', 94.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (154, '202252000929', '19760532731', 45.000, '2021-01-31', 95.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (155, '202252000936', '19760532256', 46.000, '2013-09-14', 51.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (156, '202252000621', '19760532120', 83.000, '2005-11-08', 75.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (157, '202252000736', '19760532485', 96.000, '2024-01-19', 14.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (158, '202252000692', '19760532164', 58.000, '2004-07-05', 84.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (159, '202252000591', '19760532259', 94.000, '2016-02-22', 87.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (160, '202252000861', '19760532519', 56.000, '2022-08-01', 56.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (161, '202252000739', '19760532072', 89.000, '2000-10-18', 27.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (162, '202252000260', '19760532358', 76.000, '2019-07-04', 78.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (163, '202252000338', '19760532231', 28.000, '2007-06-26', 28.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (164, '202252000316', '19760532665', 86.000, '2010-08-18', 84.000, 42.000);
INSERT INTO `a_mark_sheet` VALUES (165, '202252000578', '19760532896', 10.000, '2008-12-06', 48.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (166, '202252000409', '19760532438', 13.000, '2000-05-19', 93.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (167, '202252000295', '19760532359', 24.000, '2015-03-15', 80.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (168, '202252000270', '19760532153', 77.000, '2018-05-18', 51.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (169, '202252000431', '19760532291', 99.000, '2006-01-13', 76.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (170, '202252000155', '19760532850', 30.000, '2005-05-17', 68.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (171, '202252000446', '19760532399', 33.000, '2006-02-02', 80.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (172, '202252000258', '19760532726', 48.000, '2002-12-15', 93.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (173, '202252000059', '19760532517', 56.000, '2008-02-21', 94.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (174, '202252000835', '19760532737', 78.000, '2013-09-06', 49.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (175, '202252000437', '19760533006', 74.000, '2002-10-22', 95.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (176, '202252000516', '19760532932', 82.000, '2016-02-04', 40.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (177, '202252000230', '19760532796', 79.000, '2014-08-04', 31.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (178, '202252000812', '19760532344', 21.000, '2004-03-24', 16.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (179, '202252000558', '19760532760', 95.000, '2007-05-31', 54.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (180, '202252000091', '19760532650', 47.000, '2005-10-27', 50.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (181, '202252000097', '19760532233', 14.000, '2013-11-07', 15.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (182, '202252000148', '19760532824', 30.000, '2002-12-10', 86.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (183, '202252000626', '19760532972', 37.000, '2022-08-04', 75.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (184, '202252000668', '19760532365', 83.000, '2001-06-09', 30.000, 72.000);
INSERT INTO `a_mark_sheet` VALUES (185, '202252000745', '19760532854', 48.000, '2024-10-09', 59.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (186, '202252000604', '19760532202', 43.000, '2022-12-04', 98.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (187, '202252000978', '19760532268', 34.000, '2010-05-10', 82.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (188, '202252000977', '19760532361', 28.000, '2011-08-05', 89.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (189, '202252000350', '19760532696', 81.000, '2015-09-16', 75.000, 24.000);
INSERT INTO `a_mark_sheet` VALUES (190, '202252000599', '19760533010', 21.000, '2019-07-19', 19.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (191, '202252000499', '19760532644', 92.000, '2009-09-19', 67.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (192, '202252000460', '19760532130', 53.000, '2000-08-25', 20.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (193, '202252000857', '19760532999', 45.000, '2019-11-15', 16.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (194, '202252000975', '19760532197', 90.000, '2002-08-12', 34.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (195, '202252000006', '19760532889', 75.000, '2006-02-15', 93.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (196, '202252000396', '19760532563', 52.000, '2010-03-26', 39.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (197, '202252000651', '19760532717', 97.000, '2018-07-14', 27.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (198, '202252000169', '19760532278', 59.000, '2011-09-25', 46.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (199, '202252000976', '19760533021', 76.000, '2022-05-07', 27.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (200, '202252000382', '19760532512', 92.000, '2020-08-02', 80.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (201, '202252000747', '19760532896', 43.000, '2016-10-02', 22.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (202, '202252000196', '19760533017', 60.000, '2002-06-27', 15.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (203, '202252000288', '19760532606', 74.000, '2019-11-19', 54.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (204, '202252000828', '19760532988', 91.000, '2001-07-27', 98.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (205, '202252000493', '19760532793', 97.000, '2015-01-03', 94.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (206, '202252000489', '19760532319', 45.000, '2009-10-27', 63.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (207, '202252000692', '19760532472', 67.000, '2001-06-18', 10.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (208, '202252000875', '19760532064', 72.000, '2007-02-09', 64.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (209, '202252000281', '19760532958', 87.000, '2023-06-21', 45.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (210, '202252000586', '19760532938', 67.000, '2006-11-19', 25.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (211, '202252000652', '19760532771', 83.000, '2023-05-07', 66.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (212, '202252000276', '19760532938', 20.000, '2011-10-04', 27.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (213, '202252000005', '19760532126', 93.000, '2009-12-20', 16.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (214, '202252000733', '19760532932', 19.000, '2001-02-14', 79.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (215, '202252000463', '19760532934', 13.000, '2008-12-15', 43.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (216, '202252000267', '19760532255', 76.000, '2003-09-30', 34.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (217, '202252000014', '19760532251', 75.000, '2015-07-31', 53.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (218, '202252000992', '19760532450', 97.000, '2010-04-10', 61.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (219, '202252000334', '19760532167', 64.000, '2013-04-10', 63.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (220, '202252000479', '19760532861', 96.000, '2024-03-05', 34.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (221, '202252000302', '19760532687', 35.000, '2022-03-26', 96.000, 84.000);
INSERT INTO `a_mark_sheet` VALUES (222, '202252000462', '19760532618', 25.000, '2023-03-18', 62.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (223, '202252000649', '19760532776', 96.000, '2007-10-24', 98.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (224, '202252000735', '19760532429', 54.000, '2004-11-07', 21.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (225, '202252000406', '19760532987', 99.000, '2019-10-12', 97.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (226, '202252000764', '19760532174', 18.000, '2015-07-10', 29.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (227, '202252000502', '19760532525', 17.000, '2023-03-05', 43.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (228, '202252000713', '19760532131', 14.000, '2015-11-27', 40.000, 97.000);
INSERT INTO `a_mark_sheet` VALUES (229, '202252000004', '19760532745', 30.000, '2017-10-05', 94.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (230, '202252000392', '19760532952', 26.000, '2009-04-08', 54.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (231, '202252000451', '19760532815', 31.000, '2009-08-01', 19.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (232, '202252000396', '19760532363', 16.000, '2008-11-25', 11.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (233, '202252000025', '19760532186', 34.000, '2014-12-09', 35.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (234, '202252000699', '19760532839', 57.000, '2005-09-11', 86.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (235, '202252000637', '19760532833', 56.000, '2021-12-30', 43.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (236, '202252000564', '19760532598', 99.000, '2017-01-20', 97.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (237, '202252000080', '19760532912', 84.000, '2001-12-29', 45.000, 42.000);
INSERT INTO `a_mark_sheet` VALUES (238, '202252000833', '19760532387', 15.000, '2021-07-26', 68.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (239, '202252000333', '19760532435', 76.000, '2015-05-09', 60.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (240, '202252000670', '19760532274', 27.000, '2020-09-25', 99.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (241, '202252000546', '19760532314', 38.000, '2011-05-12', 70.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (242, '202252000799', '19760532394', 80.000, '2023-06-17', 44.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (243, '202252000743', '19760532601', 93.000, '2019-07-14', 87.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (244, '202252000947', '19760532823', 73.000, '2021-02-08', 71.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (245, '202252000153', '19760532157', 27.000, '2013-05-25', 93.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (246, '202252000402', '19760532884', 38.000, '2017-12-08', 16.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (247, '202252000231', '19760532485', 41.000, '2024-11-23', 24.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (248, '202252000522', '19760532831', 40.000, '2010-01-23', 37.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (249, '202252000563', '19760532527', 44.000, '2003-03-11', 43.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (250, '202252000010', '19760532742', 59.000, '2023-09-09', 84.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (251, '202252000314', '19760532155', 35.000, '2003-12-27', 43.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (252, '202252000867', '19760532819', 45.000, '2013-01-10', 50.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (253, '202252000606', '19760532821', 26.000, '2010-06-23', 37.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (254, '202252000357', '19760532461', 100.000, '2022-06-21', 71.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (255, '202252000254', '19760532578', 95.000, '2016-02-17', 48.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (256, '202252000909', '19760532460', 52.000, '2019-10-09', 63.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (257, '202252000040', '19760532612', 52.000, '2020-07-05', 13.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (258, '202252000815', '19760532801', 65.000, '2012-10-02', 85.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (259, '202252000646', '19760532143', 82.000, '2011-03-02', 17.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (260, '202252000893', '19760532752', 39.000, '2013-04-21', 40.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (261, '202252000923', '19760532458', 46.000, '2000-06-05', 72.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (262, '202252000358', '19760532654', 63.000, '2018-03-09', 83.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (263, '202252000106', '19760532275', 47.000, '2011-04-23', 66.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (264, '202252000816', '19760532528', 11.000, '2022-06-07', 26.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (265, '202252000085', '19760532725', 67.000, '2002-02-04', 72.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (266, '202252000235', '19760532609', 57.000, '2013-06-13', 85.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (267, '202252000978', '19760532100', 99.000, '2015-11-17', 26.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (268, '202252000535', '19760532598', 19.000, '2001-03-10', 65.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (269, '202252000935', '19760532286', 28.000, '2008-02-19', 75.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (270, '202252000841', '19760532760', 69.000, '2016-02-09', 34.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (271, '202252000107', '19760532468', 77.000, '2018-04-12', 37.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (272, '202252000392', '19760532427', 14.000, '2022-07-09', 55.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (273, '202252000535', '19760532910', 34.000, '2011-03-05', 100.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (274, '202252000378', '19760532140', 21.000, '2007-01-12', 39.000, 64.000);
INSERT INTO `a_mark_sheet` VALUES (275, '202252000898', '19760532479', 14.000, '2007-09-12', 100.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (276, '202252000536', '19760532325', 25.000, '2001-12-20', 31.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (277, '202252000115', '19760532603', 52.000, '2008-12-18', 12.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (278, '202252000262', '19760533030', 82.000, '2002-01-02', 85.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (279, '202252000041', '19760532653', 36.000, '2023-10-18', 39.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (280, '202252000891', '19760532907', 66.000, '2012-06-23', 58.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (281, '202252000043', '19760532174', 54.000, '2018-12-01', 18.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (282, '202252000721', '19760532508', 30.000, '2014-10-26', 65.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (283, '202252000210', '19760532699', 74.000, '2000-09-30', 12.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (284, '202252000834', '19760532628', 57.000, '2001-07-17', 12.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (285, '202252000231', '19760532364', 91.000, '2008-02-19', 29.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (286, '202252000270', '19760532342', 24.000, '2005-09-10', 82.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (287, '202252000532', '19760532793', 69.000, '2001-03-24', 79.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (288, '202252000102', '19760532279', 44.000, '2011-02-21', 66.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (289, '202252000349', '19760533041', 34.000, '2002-02-18', 32.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (290, '202252000136', '19760532652', 39.000, '2002-10-14', 79.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (291, '202252000734', '19760533047', 76.000, '2010-09-09', 17.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (292, '202252000095', '19760533034', 88.000, '2016-01-31', 91.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (293, '202252000624', '19760532283', 64.000, '2021-04-20', 40.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (294, '202252000404', '19760532910', 69.000, '2001-03-06', 84.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (295, '202252000329', '19760532614', 46.000, '2022-10-26', 92.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (296, '202252000424', '19760532560', 53.000, '2009-01-22', 89.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (297, '202252000807', '19760532546', 38.000, '2014-07-06', 53.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (298, '202252000856', '19760532762', 44.000, '2006-03-01', 14.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (299, '202252000276', '19760532891', 41.000, '2009-04-17', 60.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (300, '202252000443', '19760532949', 77.000, '2022-01-28', 25.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (301, '202252000665', '19760532421', 86.000, '2024-11-28', 57.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (302, '202252000188', '19760532983', 56.000, '2007-02-14', 75.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (303, '202252000454', '19760532284', 43.000, '2007-01-12', 78.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (304, '202252000592', '19760532647', 31.000, '2005-06-11', 17.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (305, '202252000301', '19760532832', 62.000, '2005-08-12', 27.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (306, '202252000880', '19760532151', 22.000, '2006-06-30', 19.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (307, '202252000673', '19760532156', 68.000, '2022-02-15', 40.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (308, '202252000071', '19760532856', 18.000, '2001-04-23', 81.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (309, '202252000169', '19760532192', 69.000, '2013-11-02', 45.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (310, '202252000250', '19760532390', 79.000, '2011-12-27', 70.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (311, '202252000760', '19760532609', 59.000, '2017-01-19', 27.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (312, '202252000125', '19760532907', 13.000, '2015-06-02', 39.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (313, '202252000616', '19760532924', 100.000, '2013-03-15', 61.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (314, '202252000207', '19760532829', 58.000, '2001-07-11', 45.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (315, '202252000207', '19760532431', 21.000, '2000-05-18', 27.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (316, '202252000558', '19760532548', 10.000, '2005-07-23', 67.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (317, '202252000066', '19760532474', 78.000, '2021-06-25', 65.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (318, '202252000992', '19760532414', 94.000, '2020-05-19', 56.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (319, '202252000318', '19760533002', 27.000, '2024-08-27', 16.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (320, '202252000770', '19760532996', 27.000, '2023-06-22', 51.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (321, '202252000738', '19760532255', 32.000, '2007-05-31', 98.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (322, '202252000270', '19760532536', 87.000, '2006-09-15', 70.000, 92.000);
INSERT INTO `a_mark_sheet` VALUES (323, '202252000586', '19760532443', 22.000, '2012-01-06', 51.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (324, '202252000652', '19760532595', 29.000, '2020-11-19', 29.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (325, '202252000871', '19760532609', 29.000, '2016-07-08', 93.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (326, '202252000315', '19760532056', 87.000, '2015-01-09', 77.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (327, '202252000456', '19760532562', 81.000, '2004-08-07', 94.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (328, '202252000352', '19760532307', 61.000, '2020-04-12', 83.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (329, '202252000727', '19760532179', 46.000, '2013-02-15', 18.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (330, '202252000362', '19760532267', 70.000, '2016-08-28', 96.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (331, '202252000875', '19760533011', 42.000, '2015-07-06', 98.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (332, '202252000341', '19760532366', 44.000, '2005-07-07', 10.000, 94.000);
INSERT INTO `a_mark_sheet` VALUES (333, '202252000603', '19760532060', 41.000, '2019-03-20', 18.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (334, '202252000364', '19760532231', 26.000, '2015-10-21', 42.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (335, '202252000903', '19760532422', 69.000, '2002-11-03', 37.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (336, '202252000840', '19760532090', 50.000, '2013-02-15', 79.000, 36.000);
INSERT INTO `a_mark_sheet` VALUES (337, '202252000907', '19760532646', 99.000, '2016-11-25', 64.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (338, '202252000957', '19760532361', 53.000, '2007-07-31', 96.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (339, '202252000134', '19760532153', 14.000, '2014-06-13', 72.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (340, '202252000277', '19760532453', 66.000, '2021-09-14', 81.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (341, '202252000239', '19760532396', 86.000, '2003-10-16', 66.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (342, '202252000878', '19760532728', 52.000, '2015-04-22', 19.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (343, '202252000100', '19760532852', 51.000, '2015-05-22', 27.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (344, '202252000525', '19760532095', 74.000, '2004-06-07', 84.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (345, '202252000890', '19760532896', 60.000, '2000-07-29', 81.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (346, '202252000878', '19760532100', 78.000, '2015-09-26', 25.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (347, '202252000474', '19760532080', 40.000, '2016-01-05', 39.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (348, '202252000619', '19760532356', 58.000, '2019-08-26', 66.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (349, '202252000527', '19760532903', 53.000, '2014-03-05', 21.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (350, '202252000793', '19760532172', 65.000, '2015-01-13', 60.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (351, '202252000969', '19760532245', 48.000, '2004-01-14', 31.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (352, '202252000658', '19760532497', 44.000, '2009-06-14', 44.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (353, '202252000890', '19760532085', 16.000, '2013-09-07', 53.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (354, '202252000246', '19760532654', 13.000, '2019-07-29', 40.000, 24.000);
INSERT INTO `a_mark_sheet` VALUES (355, '202252000248', '19760532746', 81.000, '2017-08-27', 44.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (356, '202252000382', '19760532643', 40.000, '2021-10-26', 97.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (357, '202252000453', '19760532354', 34.000, '2021-07-30', 42.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (358, '202252000927', '19760532619', 72.000, '2015-01-19', 12.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (359, '202252000464', '19760532512', 95.000, '2004-12-18', 51.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (360, '202252000730', '19760532527', 91.000, '2002-06-09', 76.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (361, '202252000720', '19760532622', 39.000, '2003-12-01', 95.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (362, '202252000225', '19760532281', 62.000, '2006-07-08', 88.000, 17.000);
INSERT INTO `a_mark_sheet` VALUES (363, '202252000085', '19760532349', 22.000, '2018-12-15', 70.000, 17.000);
INSERT INTO `a_mark_sheet` VALUES (364, '202252000382', '19760532750', 88.000, '2021-07-12', 39.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (365, '202252000575', '19760532924', 87.000, '2003-08-16', 100.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (366, '202252000760', '19760532292', 40.000, '2017-12-06', 48.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (367, '202252000919', '19760532332', 44.000, '2012-08-20', 31.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (368, '202252000554', '19760532580', 75.000, '2012-12-17', 75.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (369, '202252000251', '19760532421', 78.000, '2018-12-20', 55.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (370, '202252000169', '19760532263', 31.000, '2022-11-30', 57.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (371, '202252000338', '19760532313', 84.000, '2005-09-25', 43.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (372, '202252000909', '19760532789', 32.000, '2022-12-04', 56.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (373, '202252000728', '19760532351', 81.000, '2005-06-19', 14.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (374, '202252000122', '19760532075', 82.000, '2024-10-04', 25.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (375, '202252000659', '19760532392', 37.000, '2024-12-05', 93.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (376, '202252000083', '19760532252', 85.000, '2006-12-28', 41.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (377, '202252000395', '19760532238', 92.000, '2013-04-07', 11.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (378, '202252000883', '19760532279', 85.000, '2011-10-29', 31.000, 12.000);
INSERT INTO `a_mark_sheet` VALUES (379, '202252000825', '19760532844', 66.000, '2007-05-23', 87.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (380, '202252000078', '19760532808', 82.000, '2023-09-22', 21.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (381, '202252000619', '19760532811', 59.000, '2022-12-05', 40.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (382, '202252000027', '19760532718', 65.000, '2003-03-01', 98.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (383, '202252000960', '19760532153', 77.000, '2010-07-19', 85.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (384, '202252000335', '19760532774', 28.000, '2020-01-26', 81.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (385, '202252000452', '19760532357', 68.000, '2010-01-23', 27.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (386, '202252000076', '19760532548', 22.000, '2018-02-16', 44.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (387, '202252000478', '19760532441', 24.000, '2013-08-31', 94.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (388, '202252000768', '19760532492', 10.000, '2018-08-05', 41.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (389, '202252000358', '19760532762', 57.000, '2014-06-15', 85.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (390, '202252000660', '19760532792', 97.000, '2009-11-10', 93.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (391, '202252000307', '19760532249', 36.000, '2010-03-21', 17.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (392, '202252000504', '19760532675', 32.000, '2010-04-28', 24.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (393, '202252000273', '19760532742', 67.000, '2003-02-04', 16.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (394, '202252000328', '19760532175', 91.000, '2014-03-02', 94.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (395, '202252000725', '19760532783', 85.000, '2000-04-20', 93.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (396, '202252000567', '19760532852', 59.000, '2006-09-01', 37.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (397, '202252000788', '19760532482', 45.000, '2016-11-28', 24.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (398, '202252000678', '19760532129', 51.000, '2016-09-22', 61.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (399, '202252000377', '19760532356', 76.000, '2024-08-17', 15.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (400, '202252000206', '19760532600', 37.000, '2019-05-22', 72.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (401, '202252000450', '19760532129', 43.000, '2005-06-04', 44.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (402, '202252000193', '19760532598', 26.000, '2023-01-08', 85.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (403, '202252000061', '19760532338', 73.000, '2003-11-03', 68.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (404, '202252000080', '19760532564', 17.000, '2018-06-17', 31.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (405, '202252000341', '19760532780', 32.000, '2020-08-25', 42.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (406, '202252000970', '19760532356', 48.000, '2005-01-30', 70.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (407, '202252000952', '19760532703', 28.000, '2014-03-20', 77.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (408, '202252000359', '19760532271', 23.000, '2013-07-16', 48.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (409, '202252000703', '19760532445', 51.000, '2006-08-10', 90.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (410, '202252000538', '19760532983', 73.000, '2011-03-27', 14.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (411, '202252000074', '19760532921', 33.000, '2015-05-29', 100.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (412, '202252000994', '19760532229', 17.000, '2013-02-07', 77.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (413, '202252000777', '19760532409', 90.000, '2021-08-10', 82.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (414, '202252000521', '19760532681', 95.000, '2005-11-09', 90.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (415, '202252000822', '19760532865', 97.000, '2010-06-11', 12.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (416, '202252000203', '19760532463', 81.000, '2005-11-09', 64.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (417, '202252000174', '19760532321', 63.000, '2011-03-01', 43.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (418, '202252000327', '19760532861', 58.000, '2012-05-09', 36.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (419, '202252000602', '19760532273', 72.000, '2013-03-11', 53.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (420, '202252000209', '19760532631', 75.000, '2015-04-09', 75.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (421, '202252000783', '19760532960', 53.000, '2018-08-24', 82.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (422, '202252000540', '19760532220', 23.000, '2006-12-28', 27.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (423, '202252000238', '19760532259', 85.000, '2009-09-13', 68.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (424, '202252000423', '19760532382', 39.000, '2018-12-27', 18.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (425, '202252000199', '19760533008', 32.000, '2000-01-19', 47.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (426, '202252000433', '19760532131', 71.000, '2008-07-27', 88.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (427, '202252000213', '19760532389', 16.000, '2011-08-29', 44.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (428, '202252000976', '19760532831', 45.000, '2008-04-27', 74.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (429, '202252000281', '19760532616', 40.000, '2003-05-09', 14.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (430, '202252000368', '19760532315', 88.000, '2006-04-25', 71.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (431, '202252000802', '19760532106', 70.000, '2019-11-05', 71.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (432, '202252000325', '19760532899', 61.000, '2021-11-09', 61.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (433, '202252000644', '19760532954', 17.000, '2010-05-11', 99.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (434, '202252000657', '19760532493', 90.000, '2012-11-29', 88.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (435, '202252000829', '19760532891', 30.000, '2013-08-07', 11.000, 12.000);
INSERT INTO `a_mark_sheet` VALUES (436, '202252000638', '19760532085', 45.000, '2020-06-01', 73.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (437, '202252000311', '19760532871', 51.000, '2006-03-20', 98.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (438, '202252000666', '19760532517', 29.000, '2013-06-24', 26.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (439, '202252000189', '19760533027', 16.000, '2021-06-30', 19.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (440, '202252000944', '19760532589', 72.000, '2017-08-23', 73.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (441, '202252000555', '19760532228', 68.000, '2013-01-22', 78.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (442, '202252000641', '19760532786', 54.000, '2024-02-13', 66.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (443, '202252000167', '19760532421', 10.000, '2004-12-28', 45.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (444, '202252000927', '19760532827', 54.000, '2021-08-30', 15.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (445, '202252000454', '19760532449', 81.000, '2004-09-03', 63.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (446, '202252000368', '19760532793', 13.000, '2013-03-12', 71.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (447, '202252000952', '19760532547', 50.000, '2010-06-08', 32.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (448, '202252000301', '19760532547', 19.000, '2003-02-06', 16.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (449, '202252000226', '19760532985', 80.000, '2020-06-12', 34.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (450, '202252000215', '19760532963', 61.000, '2003-04-22', 40.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (451, '202252000645', '19760532806', 40.000, '2004-05-18', 93.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (452, '202252000216', '19760532825', 47.000, '2020-05-20', 13.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (453, '202252000047', '19760532739', 27.000, '2024-02-08', 37.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (454, '202252000991', '19760533024', 61.000, '2004-06-27', 39.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (455, '202252000386', '19760532767', 53.000, '2020-12-18', 71.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (456, '202252000285', '19760532454', 20.000, '2021-10-19', 64.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (457, '202252000832', '19760532915', 41.000, '2011-07-23', 45.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (458, '202252000421', '19760532515', 85.000, '2018-09-23', 45.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (459, '202252000191', '19760532087', 82.000, '2015-03-28', 43.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (460, '202252000223', '19760532969', 100.000, '2021-06-04', 65.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (461, '202252000462', '19760532653', 59.000, '2005-11-06', 55.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (462, '202252000553', '19760532523', 19.000, '2010-03-29', 38.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (463, '202252000407', '19760532305', 39.000, '2000-03-22', 91.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (464, '202252000524', '19760532333', 52.000, '2013-06-21', 89.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (465, '202252000047', '19760533027', 89.000, '2019-06-22', 71.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (466, '202252000649', '19760532167', 87.000, '2018-05-14', 67.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (467, '202252000084', '19760533003', 28.000, '2013-06-24', 35.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (468, '202252000990', '19760532593', 30.000, '2014-03-13', 53.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (469, '202252000181', '19760532839', 78.000, '2011-01-07', 22.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (470, '202252000604', '19760532389', 68.000, '2021-07-16', 19.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (471, '202252000706', '19760532265', 75.000, '2001-05-28', 80.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (472, '202252000596', '19760532073', 30.000, '2022-03-15', 26.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (473, '202252000550', '19760532923', 60.000, '2004-11-17', 84.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (474, '202252000820', '19760532943', 24.000, '2024-07-18', 67.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (475, '202252000613', '19760532391', 37.000, '2008-06-27', 14.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (476, '202252000007', '19760533044', 97.000, '2009-05-05', 82.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (477, '202252000538', '19760532121', 98.000, '2019-10-21', 40.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (478, '202252000052', '19760532969', 19.000, '2001-05-24', 73.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (479, '202252000701', '19760532084', 78.000, '2008-11-09', 91.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (480, '202252000886', '19760532382', 90.000, '2000-06-24', 80.000, 94.000);
INSERT INTO `a_mark_sheet` VALUES (481, '202252000610', '19760532976', 29.000, '2018-08-30', 82.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (482, '202252000952', '19760532675', 48.000, '2004-10-06', 58.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (483, '202252000212', '19760532507', 97.000, '2021-11-25', 48.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (484, '202252000943', '19760533020', 54.000, '2018-05-14', 55.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (485, '202252000381', '19760533028', 95.000, '2011-06-18', 76.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (486, '202252000524', '19760532988', 28.000, '2015-10-15', 77.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (487, '202252000710', '19760532660', 60.000, '2003-06-04', 91.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (488, '202252000382', '19760532637', 74.000, '2017-06-03', 34.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (489, '202252000529', '19760532881', 95.000, '2013-10-24', 84.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (490, '202252000441', '19760532087', 79.000, '2012-09-23', 93.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (491, '202252000928', '19760532437', 48.000, '2015-03-31', 38.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (492, '202252000696', '19760532661', 18.000, '2001-02-28', 31.000, 92.000);
INSERT INTO `a_mark_sheet` VALUES (493, '202252000515', '19760533033', 62.000, '2017-04-04', 25.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (494, '202252000453', '19760532859', 51.000, '2020-05-19', 98.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (495, '202252000147', '19760532400', 55.000, '2018-02-25', 63.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (496, '202252000522', '19760532334', 99.000, '2018-03-28', 73.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (497, '202252000036', '19760532140', 78.000, '2006-09-12', 18.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (498, '202252000427', '19760532367', 48.000, '2011-11-16', 16.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (499, '202252000829', '19760532073', 39.000, '2021-05-13', 11.000, 64.000);
INSERT INTO `a_mark_sheet` VALUES (500, '202252000830', '19760532468', 60.000, '2015-04-15', 15.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (501, '202252000097', '19760532502', 68.000, '2018-09-13', 77.000, 50.000);
INSERT INTO `a_mark_sheet` VALUES (502, '202252000233', '19760532688', 53.000, '2022-01-17', 75.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (503, '202252000891', '19760532680', 98.000, '2006-11-02', 56.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (504, '202252000964', '19760532882', 30.000, '2017-07-05', 40.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (505, '202252000932', '19760532971', 47.000, '2014-09-25', 71.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (506, '202252000028', '19760532976', 83.000, '2017-10-21', 80.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (507, '202252000135', '19760532329', 72.000, '2021-10-11', 24.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (508, '202252000217', '19760532807', 48.000, '2000-11-09', 81.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (509, '202252000229', '19760532150', 94.000, '2021-08-21', 91.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (510, '202252000134', '19760532903', 100.000, '2009-03-01', 39.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (511, '202252000858', '19760533013', 34.000, '2019-06-01', 63.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (512, '202252000727', '19760532874', 79.000, '2015-10-15', 84.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (513, '202252000164', '19760532957', 63.000, '2022-08-08', 93.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (514, '202252000973', '19760532498', 23.000, '2012-08-03', 65.000, 36.000);
INSERT INTO `a_mark_sheet` VALUES (515, '202252000244', '19760532204', 21.000, '2013-07-29', 97.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (516, '202252000627', '19760532838', 35.000, '2002-05-17', 27.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (517, '202252000351', '19760532426', 99.000, '2003-10-31', 12.000, 17.000);
INSERT INTO `a_mark_sheet` VALUES (518, '202252000987', '19760532115', 79.000, '2021-03-27', 56.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (519, '202252000171', '19760532632', 15.000, '2009-06-06', 15.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (520, '202252000086', '19760532088', 44.000, '2000-12-19', 42.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (521, '202252000233', '19760532913', 16.000, '2023-03-31', 46.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (522, '202252000536', '19760533035', 24.000, '2018-12-18', 81.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (523, '202252000041', '19760532060', 53.000, '2009-02-20', 72.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (524, '202252000861', '19760533042', 41.000, '2018-04-29', 78.000, 50.000);
INSERT INTO `a_mark_sheet` VALUES (525, '202252000289', '19760532891', 94.000, '2002-08-30', 32.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (526, '202252000986', '19760532600', 26.000, '2004-05-17', 94.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (527, '202252000334', '19760532495', 17.000, '2017-02-06', 68.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (528, '202252000831', '19760532588', 47.000, '2013-08-28', 86.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (529, '202252000655', '19760532659', 13.000, '2007-01-09', 79.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (530, '202252000405', '19760532357', 91.000, '2006-08-05', 70.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (531, '202252000048', '19760532284', 71.000, '2006-12-09', 69.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (532, '202252000696', '19760532608', 55.000, '2000-02-23', 31.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (533, '202252000049', '19760532918', 62.000, '2017-04-25', 44.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (534, '202252000699', '19760532624', 94.000, '2015-10-30', 99.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (535, '202252000979', '19760532861', 38.000, '2021-06-27', 86.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (536, '202252000015', '19760532147', 77.000, '2008-07-21', 30.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (537, '202252000422', '19760532491', 38.000, '2015-05-02', 75.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (538, '202252000019', '19760532974', 12.000, '2007-04-18', 14.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (539, '202252000895', '19760532909', 67.000, '2022-05-06', 88.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (540, '202252000843', '19760532656', 29.000, '2007-11-03', 66.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (541, '202252000561', '19760532676', 31.000, '2005-08-30', 100.000, 86.000);
INSERT INTO `a_mark_sheet` VALUES (542, '202252000299', '19760532445', 32.000, '2008-01-14', 64.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (543, '202252000020', '19760532264', 17.000, '2012-11-25', 51.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (544, '202252000910', '19760532253', 87.000, '2008-12-17', 10.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (545, '202252000726', '19760532473', 99.000, '2012-06-29', 40.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (546, '202252000217', '19760532751', 28.000, '2003-10-14', 32.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (547, '202252000885', '19760532496', 39.000, '2012-01-25', 91.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (548, '202252000647', '19760533009', 98.000, '2008-12-12', 60.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (549, '202252000570', '19760533013', 78.000, '2024-02-01', 62.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (550, '202252000857', '19760532831', 93.000, '2007-02-09', 82.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (551, '202252000897', '19760532115', 99.000, '2001-05-01', 93.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (552, '202252000803', '19760532914', 22.000, '2009-01-10', 10.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (553, '202252000634', '19760532461', 54.000, '2003-10-28', 27.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (554, '202252000233', '19760532862', 71.000, '2015-06-30', 37.000, 94.000);
INSERT INTO `a_mark_sheet` VALUES (555, '202252000949', '19760532352', 60.000, '2020-12-31', 26.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (556, '202252000776', '19760532774', 44.000, '2012-09-07', 95.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (557, '202252000847', '19760532585', 13.000, '2013-09-13', 43.000, 84.000);
INSERT INTO `a_mark_sheet` VALUES (558, '202252000262', '19760532569', 50.000, '2009-07-10', 59.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (559, '202252000214', '19760532547', 49.000, '2004-10-01', 52.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (560, '202252000547', '19760532841', 58.000, '2017-01-18', 77.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (561, '202252000287', '19760532810', 58.000, '2004-01-16', 12.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (562, '202252000907', '19760532321', 51.000, '2012-10-26', 91.000, 86.000);
INSERT INTO `a_mark_sheet` VALUES (563, '202252000468', '19760532216', 92.000, '2001-07-30', 62.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (564, '202252000367', '19760532758', 43.000, '2000-12-17', 15.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (565, '202252000566', '19760532570', 37.000, '2023-05-07', 71.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (566, '202252000148', '19760532488', 53.000, '2018-12-17', 42.000, 50.000);
INSERT INTO `a_mark_sheet` VALUES (567, '202252000550', '19760533037', 31.000, '2009-12-14', 31.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (568, '202252000401', '19760532924', 51.000, '2018-10-13', 80.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (569, '202252000595', '19760532364', 78.000, '2012-03-14', 31.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (570, '202252000258', '19760532995', 50.000, '2000-08-15', 15.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (571, '202252000626', '19760532825', 63.000, '2022-05-27', 78.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (572, '202252000397', '19760532274', 27.000, '2017-02-27', 31.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (573, '202252000066', '19760533037', 96.000, '2022-05-23', 80.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (574, '202252000850', '19760532742', 40.000, '2008-02-18', 58.000, 97.000);
INSERT INTO `a_mark_sheet` VALUES (575, '202252000484', '19760532189', 88.000, '2016-09-20', 45.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (576, '202252000992', '19760532412', 71.000, '2009-07-23', 82.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (577, '202252000791', '19760532068', 24.000, '2017-07-24', 74.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (578, '202252000080', '19760532965', 72.000, '2023-10-29', 39.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (579, '202252000631', '19760532845', 12.000, '2000-07-06', 55.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (580, '202252000643', '19760532520', 96.000, '2011-04-09', 58.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (581, '202252000737', '19760532830', 13.000, '2005-02-22', 21.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (582, '202252000600', '19760532359', 92.000, '2012-08-17', 76.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (583, '202252000498', '19760532256', 45.000, '2014-01-18', 18.000, 92.000);
INSERT INTO `a_mark_sheet` VALUES (584, '202252000323', '19760532527', 86.000, '2017-05-12', 38.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (585, '202252000804', '19760532269', 51.000, '2000-09-30', 65.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (586, '202252000181', '19760532753', 88.000, '2018-08-02', 46.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (587, '202252000741', '19760532726', 41.000, '2006-04-10', 67.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (588, '202252000700', '19760532781', 33.000, '2017-04-15', 54.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (589, '202252000554', '19760532495', 97.000, '2008-05-16', 93.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (590, '202252000058', '19760532107', 79.000, '2022-05-16', 80.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (591, '202252000161', '19760532716', 62.000, '2011-03-03', 71.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (592, '202252000148', '19760532621', 61.000, '2018-04-11', 60.000, 50.000);
INSERT INTO `a_mark_sheet` VALUES (593, '202252000975', '19760532110', 84.000, '2018-01-29', 16.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (594, '202252000650', '19760532901', 100.000, '2024-01-15', 92.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (595, '202252000168', '19760532823', 80.000, '2018-10-28', 56.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (596, '202252000094', '19760532850', 83.000, '2022-07-10', 78.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (597, '202252000968', '19760532662', 71.000, '2024-08-23', 96.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (598, '202252000756', '19760532576', 62.000, '2010-04-27', 89.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (599, '202252000923', '19760532680', 14.000, '2006-01-23', 70.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (600, '202252000286', '19760532266', 38.000, '2008-09-05', 82.000, 12.000);
INSERT INTO `a_mark_sheet` VALUES (601, '202252000538', '19760532505', 62.000, '2004-10-16', 57.000, 73.000);
INSERT INTO `a_mark_sheet` VALUES (602, '202252000501', '19760532448', 10.000, '2007-05-27', 16.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (603, '202252000611', '19760532167', 20.000, '2021-01-14', 29.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (604, '202252000150', '19760532466', 54.000, '2006-01-24', 13.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (605, '202252000959', '19760532110', 65.000, '2003-11-02', 90.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (606, '202252000513', '19760532947', 68.000, '2010-11-07', 60.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (607, '202252000601', '19760532637', 80.000, '2009-11-06', 36.000, 64.000);
INSERT INTO `a_mark_sheet` VALUES (608, '202252000823', '19760532576', 40.000, '2014-05-05', 14.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (609, '202252000120', '19760532101', 31.000, '2011-07-15', 36.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (610, '202252000383', '19760532421', 80.000, '2023-10-05', 92.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (611, '202252000284', '19760532276', 67.000, '2004-03-25', 28.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (612, '202252000575', '19760532972', 20.000, '2003-07-18', 57.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (613, '202252000439', '19760532798', 35.000, '2024-11-18', 70.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (614, '202252000389', '19760532995', 24.000, '2018-05-22', 21.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (615, '202252000146', '19760532535', 85.000, '2011-03-26', 89.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (616, '202252000291', '19760532092', 89.000, '2003-11-10', 95.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (617, '202252000269', '19760532498', 33.000, '2016-08-26', 58.000, 24.000);
INSERT INTO `a_mark_sheet` VALUES (618, '202252000886', '19760532459', 23.000, '2008-01-16', 27.000, 42.000);
INSERT INTO `a_mark_sheet` VALUES (619, '202252000756', '19760532911', 33.000, '2022-12-02', 37.000, 84.000);
INSERT INTO `a_mark_sheet` VALUES (620, '202252000243', '19760532931', 55.000, '2004-10-23', 35.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (621, '202252000271', '19760532786', 40.000, '2001-08-14', 26.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (622, '202252000147', '19760532941', 94.000, '2005-02-17', 45.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (623, '202252000033', '19760532691', 31.000, '2018-05-24', 74.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (624, '202252000643', '19760532818', 16.000, '2008-05-07', 95.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (625, '202252000553', '19760532265', 18.000, '2009-12-23', 29.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (626, '202252000853', '19760532768', 79.000, '2009-03-17', 49.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (627, '202252000398', '19760532636', 59.000, '2023-08-07', 35.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (628, '202252000348', '19760532615', 24.000, '2003-11-07', 51.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (629, '202252000882', '19760532210', 29.000, '2021-09-01', 96.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (630, '202252000286', '19760533050', 21.000, '2022-06-14', 55.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (631, '202252000211', '19760532689', 56.000, '2006-04-27', 60.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (632, '202252000561', '19760532867', 89.000, '2008-06-06', 35.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (633, '202252000957', '19760532570', 92.000, '2001-01-26', 41.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (634, '202252000291', '19760532451', 38.000, '2020-12-22', 90.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (635, '202252000290', '19760532630', 15.000, '2006-04-20', 43.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (636, '202252000674', '19760533005', 28.000, '2019-03-10', 81.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (637, '202252000226', '19760532815', 28.000, '2005-12-30', 100.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (638, '202252000081', '19760532315', 85.000, '2016-08-08', 65.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (639, '202252000932', '19760532383', 78.000, '2012-04-30', 78.000, 92.000);
INSERT INTO `a_mark_sheet` VALUES (640, '202252000859', '19760532351', 27.000, '2002-05-20', 65.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (641, '202252000818', '19760533005', 87.000, '2021-02-20', 27.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (642, '202252000991', '19760532948', 92.000, '2024-12-01', 57.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (643, '202252000215', '19760532757', 39.000, '2019-12-28', 22.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (644, '202252000193', '19760532735', 56.000, '2019-03-14', 57.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (645, '202252000994', '19760532583', 30.000, '2009-07-31', 85.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (646, '202252000293', '19760532672', 41.000, '2017-09-25', 12.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (647, '202252000033', '19760532152', 78.000, '2002-05-13', 92.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (648, '202252000868', '19760533033', 29.000, '2005-01-25', 50.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (649, '202252000998', '19760532164', 64.000, '2007-03-24', 11.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (650, '202252000666', '19760532889', 16.000, '2005-01-25', 79.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (651, '202252000986', '19760532330', 99.000, '2013-08-25', 87.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (652, '202252000824', '19760532371', 62.000, '2009-10-15', 40.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (653, '202252000201', '19760532930', 18.000, '2016-09-03', 59.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (654, '202252000469', '19760532283', 29.000, '2016-04-01', 77.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (655, '202252000512', '19760532753', 81.000, '2001-03-16', 94.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (656, '202252000842', '19760532663', 33.000, '2011-09-13', 59.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (657, '202252000138', '19760532152', 50.000, '2005-06-16', 53.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (658, '202252000894', '19760532677', 23.000, '2011-10-31', 28.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (659, '202252000878', '19760532711', 93.000, '2022-10-13', 13.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (660, '202252000666', '19760532896', 16.000, '2003-10-28', 44.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (661, '202252000579', '19760532103', 70.000, '2018-10-22', 10.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (662, '202252000379', '19760532606', 40.000, '2017-04-02', 17.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (663, '202252000029', '19760532182', 34.000, '2019-05-15', 77.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (664, '202252000677', '19760532804', 39.000, '2008-12-31', 62.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (665, '202252000127', '19760532128', 96.000, '2009-06-17', 21.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (666, '202252000870', '19760532137', 99.000, '2010-08-22', 16.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (667, '202252000042', '19760532517', 28.000, '2002-09-09', 76.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (668, '202252000667', '19760532715', 90.000, '2004-05-17', 36.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (669, '202252000998', '19760532057', 14.000, '2008-04-01', 69.000, 84.000);
INSERT INTO `a_mark_sheet` VALUES (670, '202252000168', '19760533049', 26.000, '2023-04-26', 47.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (671, '202252000666', '19760532869', 50.000, '2009-01-19', 92.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (672, '202252000143', '19760532322', 82.000, '2002-12-15', 93.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (673, '202252000185', '19760532842', 92.000, '2005-09-17', 11.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (674, '202252000734', '19760532981', 33.000, '2020-09-09', 97.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (675, '202252000545', '19760532252', 20.000, '2011-02-28', 52.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (676, '202252000223', '19760533027', 93.000, '2005-05-22', 57.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (677, '202252000897', '19760532434', 87.000, '2016-07-04', 33.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (678, '202252000940', '19760532516', 27.000, '2011-02-06', 54.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (679, '202252000462', '19760532558', 97.000, '2022-05-14', 29.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (680, '202252000525', '19760532719', 49.000, '2006-03-08', 71.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (681, '202252000065', '19760533052', 41.000, '2010-12-08', 61.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (682, '202252000466', '19760532069', 41.000, '2000-06-17', 75.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (683, '202252000741', '19760532182', 35.000, '2000-07-10', 34.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (684, '202252000726', '19760532505', 39.000, '2022-11-09', 82.000, 42.000);
INSERT INTO `a_mark_sheet` VALUES (685, '202252000547', '19760532906', 30.000, '2000-06-10', 54.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (686, '202252000922', '19760532621', 45.000, '2010-10-05', 76.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (687, '202252000247', '19760532506', 23.000, '2004-10-22', 74.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (688, '202252000488', '19760532168', 38.000, '2004-07-01', 24.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (689, '202252000286', '19760532161', 66.000, '2001-05-13', 95.000, 86.000);
INSERT INTO `a_mark_sheet` VALUES (690, '202252000488', '19760532076', 74.000, '2014-12-17', 90.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (691, '202252000538', '19760532119', 36.000, '2011-12-10', 63.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (692, '202252000188', '19760532450', 64.000, '2014-12-02', 29.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (693, '202252000897', '19760532986', 75.000, '2021-12-27', 52.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (694, '202252000988', '19760532090', 97.000, '2024-01-20', 12.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (695, '202252000154', '19760532867', 67.000, '2019-09-10', 52.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (696, '202252000930', '19760532568', 63.000, '2010-02-11', 44.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (697, '202252000104', '19760532187', 81.000, '2004-03-31', 72.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (698, '202252000908', '19760532973', 33.000, '2019-09-28', 42.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (699, '202252000924', '19760532545', 37.000, '2010-11-23', 70.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (700, '202252000658', '19760532633', 54.000, '2001-04-08', 79.000, 64.000);
INSERT INTO `a_mark_sheet` VALUES (701, '202252000992', '19760532746', 66.000, '2015-03-08', 98.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (702, '202252000483', '19760532935', 49.000, '2020-06-13', 76.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (703, '202252000558', '19760532752', 65.000, '2000-05-17', 66.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (704, '202252000017', '19760532951', 91.000, '2004-06-11', 81.000, 86.000);
INSERT INTO `a_mark_sheet` VALUES (705, '202252000317', '19760532314', 40.000, '2019-11-02', 96.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (706, '202252000088', '19760532545', 63.000, '2024-01-08', 67.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (707, '202252000211', '19760532615', 35.000, '2017-04-16', 26.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (708, '202252000848', '19760532958', 59.000, '2021-04-23', 43.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (709, '202252000421', '19760532543', 52.000, '2000-07-29', 99.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (710, '202252000039', '19760532757', 88.000, '2008-01-20', 13.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (711, '202252000804', '19760532187', 50.000, '2002-01-20', 34.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (712, '202252000004', '19760532527', 94.000, '2023-11-29', 99.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (713, '202252000801', '19760532996', 90.000, '2007-02-26', 100.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (714, '202252000442', '19760532420', 14.000, '2010-07-11', 12.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (715, '202252000607', '19760532595', 21.000, '2005-04-13', 75.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (716, '202252000150', '19760533011', 10.000, '2011-04-13', 32.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (717, '202252000236', '19760532683', 13.000, '2004-11-05', 44.000, 36.000);
INSERT INTO `a_mark_sheet` VALUES (718, '202252000197', '19760532175', 72.000, '2009-06-20', 88.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (719, '202252000371', '19760532126', 19.000, '2001-08-13', 39.000, 94.000);
INSERT INTO `a_mark_sheet` VALUES (720, '202252000935', '19760532982', 59.000, '2005-02-07', 54.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (721, '202252000824', '19760532666', 25.000, '2004-03-29', 38.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (722, '202252000724', '19760532794', 99.000, '2011-12-12', 92.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (723, '202252000203', '19760532251', 11.000, '2000-03-31', 24.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (724, '202252000433', '19760532802', 60.000, '2002-05-02', 63.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (725, '202252000741', '19760532738', 86.000, '2003-02-09', 39.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (726, '202252000066', '19760532666', 96.000, '2001-09-04', 32.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (727, '202252000913', '19760532890', 50.000, '2000-12-27', 95.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (728, '202252000293', '19760533027', 81.000, '2020-02-02', 19.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (729, '202252000828', '19760532938', 72.000, '2012-01-31', 38.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (730, '202252000812', '19760532498', 88.000, '2004-10-30', 81.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (731, '202252000636', '19760532220', 69.000, '2000-10-29', 90.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (732, '202252000681', '19760533008', 99.000, '2011-01-20', 84.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (733, '202252000808', '19760532483', 62.000, '2008-07-23', 46.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (734, '202252000046', '19760532973', 51.000, '2003-02-25', 49.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (735, '202252000835', '19760532830', 87.000, '2009-09-22', 45.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (736, '202252000563', '19760532637', 88.000, '2005-12-27', 10.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (737, '202252000819', '19760532721', 37.000, '2016-10-11', 87.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (738, '202252000970', '19760532844', 95.000, '2018-01-19', 68.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (739, '202252000493', '19760532711', 38.000, '2017-07-28', 39.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (740, '202252000526', '19760532237', 68.000, '2004-12-26', 35.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (741, '202252000652', '19760532987', 25.000, '2013-07-15', 80.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (742, '202252000009', '19760533032', 33.000, '2013-03-02', 74.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (743, '202252000268', '19760532510', 39.000, '2004-04-17', 13.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (744, '202252000506', '19760532393', 12.000, '2002-05-08', 54.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (745, '202252000097', '19760532271', 88.000, '2009-04-04', 29.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (746, '202252000806', '19760532124', 58.000, '2014-04-08', 35.000, 94.000);
INSERT INTO `a_mark_sheet` VALUES (747, '202252000861', '19760532580', 24.000, '2020-11-24', 91.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (748, '202252000440', '19760532084', 54.000, '2024-11-10', 61.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (749, '202252000258', '19760532058', 30.000, '2012-02-15', 30.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (750, '202252000168', '19760532359', 87.000, '2003-12-29', 97.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (751, '202252000533', '19760532867', 51.000, '2013-07-13', 85.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (752, '202252000781', '19760532683', 97.000, '2022-08-04', 69.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (753, '202252000278', '19760532862', 35.000, '2011-12-22', 13.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (754, '202252000678', '19760532582', 58.000, '2024-10-01', 50.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (755, '202252000403', '19760532277', 76.000, '2008-09-04', 48.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (756, '202252000518', '19760532493', 78.000, '2005-11-28', 71.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (757, '202252000209', '19760532426', 42.000, '2008-04-12', 97.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (758, '202252000742', '19760532333', 57.000, '2010-11-30', 19.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (759, '202252000046', '19760532609', 22.000, '2024-04-14', 72.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (760, '202252000579', '19760532276', 49.000, '2008-01-07', 14.000, 16.000);
INSERT INTO `a_mark_sheet` VALUES (761, '202252000844', '19760532076', 23.000, '2008-04-18', 49.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (762, '202252000630', '19760532461', 67.000, '2004-03-27', 81.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (763, '202252000459', '19760532279', 61.000, '2010-10-01', 31.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (764, '202252000390', '19760532877', 96.000, '2023-05-26', 96.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (765, '202252000806', '19760532581', 25.000, '2000-01-12', 80.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (766, '202252000502', '19760532523', 34.000, '2001-11-12', 21.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (767, '202252000210', '19760532144', 27.000, '2009-05-04', 88.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (768, '202252000968', '19760532314', 13.000, '2007-12-10', 53.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (769, '202252000442', '19760532655', 50.000, '2000-02-07', 99.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (770, '202252000516', '19760532300', 60.000, '2002-11-05', 17.000, 59.000);
INSERT INTO `a_mark_sheet` VALUES (771, '202252000983', '19760532276', 48.000, '2017-11-25', 21.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (772, '202252000150', '19760532355', 63.000, '2015-07-22', 64.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (773, '202252000903', '19760532909', 19.000, '2017-08-12', 19.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (774, '202252000568', '19760532708', 36.000, '2016-06-26', 92.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (775, '202252000665', '19760532528', 43.000, '2015-05-16', 92.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (776, '202252000392', '19760532464', 97.000, '2008-05-01', 43.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (777, '202252000096', '19760532307', 76.000, '2024-07-23', 44.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (778, '202252000392', '19760532171', 59.000, '2008-10-04', 72.000, 50.000);
INSERT INTO `a_mark_sheet` VALUES (779, '202252000335', '19760532351', 75.000, '2013-05-08', 40.000, 12.000);
INSERT INTO `a_mark_sheet` VALUES (780, '202252000475', '19760532426', 34.000, '2013-07-11', 96.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (781, '202252000825', '19760532594', 57.000, '2024-03-01', 25.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (782, '202252000432', '19760532890', 41.000, '2010-08-16', 51.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (783, '202252000101', '19760532202', 99.000, '2019-02-27', 24.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (784, '202252000352', '19760532143', 27.000, '2010-10-27', 48.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (785, '202252000904', '19760532896', 89.000, '2001-09-19', 33.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (786, '202252000074', '19760532080', 31.000, '2004-05-24', 12.000, 92.000);
INSERT INTO `a_mark_sheet` VALUES (787, '202252000916', '19760532859', 21.000, '2008-10-24', 99.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (788, '202252000963', '19760532527', 89.000, '2004-09-13', 30.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (789, '202252000475', '19760532100', 57.000, '2022-01-25', 34.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (790, '202252000051', '19760532256', 26.000, '2006-05-16', 16.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (791, '202252000018', '19760533029', 20.000, '2003-07-28', 90.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (792, '202252000370', '19760532174', 27.000, '2019-08-03', 18.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (793, '202252000215', '19760532968', 39.000, '2006-10-10', 49.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (794, '202252000029', '19760532069', 45.000, '2019-04-12', 70.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (795, '202252000506', '19760532096', 48.000, '2023-03-16', 57.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (796, '202252000045', '19760533014', 17.000, '2011-10-30', 67.000, 68.000);
INSERT INTO `a_mark_sheet` VALUES (797, '202252000798', '19760532119', 59.000, '2012-05-20', 34.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (798, '202252000800', '19760532121', 87.000, '2006-01-12', 69.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (799, '202252000642', '19760532150', 48.000, '2012-05-26', 69.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (800, '202252000903', '19760532117', 16.000, '2018-09-12', 18.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (801, '202252000631', '19760532508', 62.000, '2007-08-11', 30.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (802, '202252000414', '19760532651', 78.000, '2017-02-06', 53.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (803, '202252000585', '19760532925', 98.000, '2020-09-09', 74.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (804, '202252000247', '19760532580', 87.000, '2004-02-24', 86.000, 19.000);
INSERT INTO `a_mark_sheet` VALUES (805, '202252000712', '19760532675', 50.000, '2000-12-10', 86.000, 37.000);
INSERT INTO `a_mark_sheet` VALUES (806, '202252000574', '19760532632', 14.000, '2014-05-30', 74.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (807, '202252000914', '19760532081', 71.000, '2012-04-22', 72.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (808, '202252000917', '19760532761', 54.000, '2014-06-19', 54.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (809, '202252000629', '19760532886', 60.000, '2002-09-05', 28.000, 17.000);
INSERT INTO `a_mark_sheet` VALUES (810, '202252000683', '19760532557', 47.000, '2008-08-24', 48.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (811, '202252000519', '19760532334', 48.000, '2010-11-07', 54.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (812, '202252000540', '19760532823', 70.000, '2006-05-06', 90.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (813, '202252000943', '19760532120', 19.000, '2010-02-17', 30.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (814, '202252000713', '19760532519', 92.000, '2014-12-11', 96.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (815, '202252000567', '19760532066', 74.000, '2009-06-21', 65.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (816, '202252000390', '19760532783', 93.000, '2004-12-19', 51.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (817, '202252000266', '19760532766', 98.000, '2024-10-17', 60.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (818, '202252000430', '19760532738', 22.000, '2014-04-13', 68.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (819, '202252000906', '19760532891', 25.000, '2016-11-26', 29.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (820, '202252000609', '19760532319', 85.000, '2024-11-10', 87.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (821, '202252000916', '19760532858', 100.000, '2008-07-03', 82.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (822, '202252000025', '19760532149', 41.000, '2004-01-31', 84.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (823, '202252000388', '19760532058', 55.000, '2007-05-19', 15.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (824, '202252000122', '19760532415', 75.000, '2018-04-14', 58.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (825, '202252000461', '19760532480', 41.000, '2024-07-04', 41.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (826, '202252000910', '19760532899', 33.000, '2001-07-07', 86.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (827, '202252000915', '19760532982', 31.000, '2017-04-27', 40.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (828, '202252000375', '19760532210', 64.000, '2005-11-01', 68.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (829, '202252000626', '19760532927', 34.000, '2012-09-05', 65.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (830, '202252000892', '19760532129', 22.000, '2009-03-24', 92.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (831, '202252000753', '19760533017', 61.000, '2004-03-16', 61.000, 74.000);
INSERT INTO `a_mark_sheet` VALUES (832, '202252000239', '19760533015', 24.000, '2022-04-08', 57.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (833, '202252000986', '19760532224', 45.000, '2009-12-07', 69.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (834, '202252000425', '19760532414', 68.000, '2008-08-13', 63.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (835, '202252000215', '19760532279', 62.000, '2005-06-12', 63.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (836, '202252000202', '19760532737', 90.000, '2003-07-25', 53.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (837, '202252000055', '19760532104', 45.000, '2004-12-12', 63.000, 72.000);
INSERT INTO `a_mark_sheet` VALUES (838, '202252000369', '19760532787', 29.000, '2012-02-13', 14.000, 87.000);
INSERT INTO `a_mark_sheet` VALUES (839, '202252000929', '19760532488', 21.000, '2018-03-23', 91.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (840, '202252000168', '19760532458', 87.000, '2002-01-03', 20.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (841, '202252000820', '19760532866', 52.000, '2019-09-24', 84.000, 97.000);
INSERT INTO `a_mark_sheet` VALUES (842, '202252000928', '19760532452', 61.000, '2003-11-25', 29.000, 30.000);
INSERT INTO `a_mark_sheet` VALUES (843, '202252000669', '19760532961', 32.000, '2010-03-03', 53.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (844, '202252000371', '19760532679', 66.000, '2017-11-19', 10.000, 80.000);
INSERT INTO `a_mark_sheet` VALUES (845, '202252000950', '19760532717', 19.000, '2012-04-22', 77.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (846, '202252000868', '19760532451', 38.000, '2006-09-13', 29.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (847, '202252000196', '19760532433', 100.000, '2018-01-09', 64.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (848, '202252000159', '19760532980', 36.000, '2006-08-03', 77.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (849, '202252000301', '19760532308', 49.000, '2000-04-21', 67.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (850, '202252000738', '19760532431', 55.000, '2012-06-02', 13.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (851, '202252000418', '19760532533', 74.000, '2017-05-12', 72.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (852, '202252000401', '19760532433', 35.000, '2022-07-14', 99.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (853, '202252000235', '19760532502', 85.000, '2020-07-20', 56.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (854, '202252000133', '19760532911', 16.000, '2006-09-14', 76.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (855, '202252000528', '19760532980', 36.000, '2011-09-16', 61.000, 50.000);
INSERT INTO `a_mark_sheet` VALUES (856, '202252000841', '19760532787', 65.000, '2014-08-12', 42.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (857, '202252000738', '19760532533', 95.000, '2015-10-28', 11.000, 41.000);
INSERT INTO `a_mark_sheet` VALUES (858, '202252000872', '19760532238', 18.000, '2006-08-22', 77.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (859, '202252000276', '19760532799', 88.000, '2015-02-21', 72.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (860, '202252000542', '19760532313', 88.000, '2024-07-13', 59.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (861, '202252000177', '19760532253', 19.000, '2012-05-04', 47.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (862, '202252000635', '19760532805', 82.000, '2005-06-23', 26.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (863, '202252000939', '19760532929', 31.000, '2020-10-30', 18.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (864, '202252000350', '19760532484', 40.000, '2015-10-23', 85.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (865, '202252000599', '19760532472', 61.000, '2014-11-08', 66.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (866, '202252000974', '19760532902', 57.000, '2004-09-07', 34.000, 88.000);
INSERT INTO `a_mark_sheet` VALUES (867, '202252000907', '19760532810', 25.000, '2018-10-09', 57.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (868, '202252000413', '19760532795', 41.000, '2016-11-15', 19.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (869, '202252000790', '19760532172', 13.000, '2016-08-30', 45.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (870, '202252000664', '19760532583', 57.000, '2018-10-28', 97.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (871, '202252000676', '19760532881', 61.000, '2007-09-03', 54.000, 60.000);
INSERT INTO `a_mark_sheet` VALUES (872, '202252000433', '19760532406', 78.000, '2018-11-16', 100.000, 58.000);
INSERT INTO `a_mark_sheet` VALUES (873, '202252000423', '19760532543', 52.000, '2004-08-23', 59.000, 34.000);
INSERT INTO `a_mark_sheet` VALUES (874, '202252000466', '19760532459', 17.000, '2010-01-22', 71.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (875, '202252000521', '19760532394', 68.000, '2023-12-26', 10.000, 35.000);
INSERT INTO `a_mark_sheet` VALUES (876, '202252000802', '19760532206', 12.000, '2005-06-22', 66.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (877, '202252000211', '19760532315', 10.000, '2017-01-23', 88.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (878, '202252000154', '19760533019', 57.000, '2023-08-30', 37.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (879, '202252000225', '19760532713', 94.000, '2003-10-13', 14.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (880, '202252000292', '19760532098', 68.000, '2000-03-25', 61.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (881, '202252000513', '19760532115', 23.000, '2006-01-17', 95.000, 12.000);
INSERT INTO `a_mark_sheet` VALUES (882, '202252000651', '19760532520', 23.000, '2019-12-25', 41.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (883, '202252000089', '19760532096', 81.000, '2022-12-20', 77.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (884, '202252000146', '19760532521', 60.000, '2004-07-05', 27.000, 12.000);
INSERT INTO `a_mark_sheet` VALUES (885, '202252000465', '19760533049', 61.000, '2013-07-28', 70.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (886, '202252000532', '19760532778', 20.000, '2000-09-02', 89.000, 78.000);
INSERT INTO `a_mark_sheet` VALUES (887, '202252000082', '19760533010', 41.000, '2003-07-16', 72.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (888, '202252000865', '19760532483', 13.000, '2010-12-01', 68.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (889, '202252000848', '19760532295', 68.000, '2010-05-12', 40.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (890, '202252000641', '19760532870', 31.000, '2004-04-06', 64.000, 46.000);
INSERT INTO `a_mark_sheet` VALUES (891, '202252000738', '19760532118', 57.000, '2007-05-08', 73.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (892, '202252000112', '19760532945', 61.000, '2024-01-19', 72.000, 32.000);
INSERT INTO `a_mark_sheet` VALUES (893, '202252000222', '19760532749', 84.000, '2022-04-09', 46.000, 82.000);
INSERT INTO `a_mark_sheet` VALUES (894, '202252000139', '19760533019', 55.000, '2024-02-24', 83.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (895, '202252000514', '19760532684', 79.000, '2020-05-19', 37.000, 72.000);
INSERT INTO `a_mark_sheet` VALUES (896, '202252000616', '19760533017', 31.000, '2023-04-26', 54.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (897, '202252000737', '19760532498', 48.000, '2004-07-13', 47.000, 40.000);
INSERT INTO `a_mark_sheet` VALUES (898, '202252000917', '19760532869', 36.000, '2023-02-03', 21.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (899, '202252000897', '19760532731', 40.000, '2005-07-07', 15.000, 53.000);
INSERT INTO `a_mark_sheet` VALUES (900, '202252000406', '19760532373', 11.000, '2011-11-02', 10.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (901, '202252000706', '19760532699', 40.000, '2002-12-11', 25.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (902, '202252000053', '19760532747', 62.000, '2009-05-16', 74.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (903, '202252000470', '19760532649', 76.000, '2006-12-02', 98.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (904, '202252000820', '19760532908', 51.000, '2016-12-16', 84.000, 72.000);
INSERT INTO `a_mark_sheet` VALUES (905, '202252000215', '19760532186', 72.000, '2006-04-25', 55.000, 93.000);
INSERT INTO `a_mark_sheet` VALUES (906, '202252000809', '19760532795', 71.000, '2015-06-06', 52.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (907, '202252000969', '19760532273', 29.000, '2013-05-28', 95.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (908, '202252000273', '19760532969', 97.000, '2000-06-06', 22.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (909, '202252000910', '19760532427', 17.000, '2008-04-26', 28.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (910, '202252000909', '19760532411', 66.000, '2016-04-16', 70.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (911, '202252000439', '19760532994', 60.000, '2018-02-22', 18.000, 92.000);
INSERT INTO `a_mark_sheet` VALUES (912, '202252000135', '19760532712', 29.000, '2017-02-26', 49.000, 48.000);
INSERT INTO `a_mark_sheet` VALUES (913, '202252000266', '19760532457', 69.000, '2024-11-04', 53.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (914, '202252000285', '19760533016', 49.000, '2024-08-20', 62.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (915, '202252000085', '19760532660', 95.000, '2008-01-17', 36.000, 43.000);
INSERT INTO `a_mark_sheet` VALUES (916, '202252000240', '19760532887', 43.000, '2012-08-06', 13.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (917, '202252000387', '19760533047', 94.000, '2007-07-31', 34.000, 71.000);
INSERT INTO `a_mark_sheet` VALUES (918, '202252000172', '19760532827', 64.000, '2023-10-03', 52.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (919, '202252000978', '19760532346', 82.000, '2019-09-12', 69.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (920, '202252000694', '19760532813', 90.000, '2000-06-20', 60.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (921, '202252000156', '19760533031', 36.000, '2020-06-26', 90.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (922, '202252000195', '19760532218', 61.000, '2011-06-19', 21.000, 45.000);
INSERT INTO `a_mark_sheet` VALUES (923, '202252000033', '19760532553', 79.000, '2022-08-16', 90.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (924, '202252000022', '19760532658', 46.000, '2004-05-31', 69.000, 38.000);
INSERT INTO `a_mark_sheet` VALUES (925, '202252000621', '19760533050', 94.000, '2003-12-02', 32.000, 79.000);
INSERT INTO `a_mark_sheet` VALUES (926, '202252000337', '19760532799', 86.000, '2020-08-08', 56.000, 89.000);
INSERT INTO `a_mark_sheet` VALUES (927, '202252000727', '19760532132', 70.000, '2003-07-10', 44.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (928, '202252000522', '19760532873', 47.000, '2015-08-19', 100.000, 86.000);
INSERT INTO `a_mark_sheet` VALUES (929, '202252000833', '19760532575', 77.000, '2021-01-17', 60.000, 44.000);
INSERT INTO `a_mark_sheet` VALUES (930, '202252000869', '19760532211', 10.000, '2014-09-02', 69.000, 63.000);
INSERT INTO `a_mark_sheet` VALUES (931, '202252000042', '19760532762', 71.000, '2014-11-01', 79.000, 28.000);
INSERT INTO `a_mark_sheet` VALUES (932, '202252000099', '19760532547', 91.000, '2018-02-21', 79.000, 66.000);
INSERT INTO `a_mark_sheet` VALUES (933, '202252000608', '19760532346', 16.000, '2010-04-21', 80.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (934, '202252000250', '19760532706', 10.000, '2007-06-01', 37.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (935, '202252000566', '19760532255', 17.000, '2008-10-31', 84.000, 47.000);
INSERT INTO `a_mark_sheet` VALUES (936, '202252000573', '19760532478', 79.000, '2011-08-27', 19.000, 97.000);
INSERT INTO `a_mark_sheet` VALUES (937, '202252000748', '19760532146', 46.000, '2006-08-04', 100.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (938, '202252000664', '19760532341', 26.000, '2014-08-29', 23.000, 94.000);
INSERT INTO `a_mark_sheet` VALUES (939, '202252000437', '19760532507', 58.000, '2006-11-15', 94.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (940, '202252000986', '19760532349', 66.000, '2009-12-10', 44.000, 77.000);
INSERT INTO `a_mark_sheet` VALUES (941, '202252000639', '19760532514', 18.000, '2024-03-15', 79.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (942, '202252000619', '19760532513', 97.000, '2007-05-30', 27.000, 33.000);
INSERT INTO `a_mark_sheet` VALUES (943, '202252000819', '19760532185', 94.000, '2015-01-29', 65.000, 76.000);
INSERT INTO `a_mark_sheet` VALUES (944, '202252000723', '19760532279', 64.000, '2011-04-29', 88.000, 85.000);
INSERT INTO `a_mark_sheet` VALUES (945, '202252000381', '19760532286', 61.000, '2006-06-27', 58.000, 65.000);
INSERT INTO `a_mark_sheet` VALUES (946, '202252000805', '19760532590', 58.000, '2022-05-28', 30.000, 22.000);
INSERT INTO `a_mark_sheet` VALUES (947, '202252000294', '19760532193', 87.000, '2024-10-01', 55.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (948, '202252000720', '19760532429', 96.000, '2014-10-05', 37.000, 51.000);
INSERT INTO `a_mark_sheet` VALUES (949, '202252000487', '19760532291', 44.000, '2000-12-17', 69.000, 96.000);
INSERT INTO `a_mark_sheet` VALUES (950, '202252000965', '19760532569', 63.000, '2019-10-21', 65.000, 91.000);
INSERT INTO `a_mark_sheet` VALUES (951, '202252000542', '19760532421', 25.000, '2023-12-16', 71.000, 14.000);
INSERT INTO `a_mark_sheet` VALUES (952, '202252000778', '19760533027', 85.000, '2005-10-23', 67.000, 17.000);
INSERT INTO `a_mark_sheet` VALUES (953, '202252000638', '19760532335', 88.000, '2012-07-19', 19.000, 52.000);
INSERT INTO `a_mark_sheet` VALUES (954, '202252000438', '19760532980', 19.000, '2003-05-25', 59.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (955, '202252000587', '19760532583', 44.000, '2022-01-27', 59.000, 75.000);
INSERT INTO `a_mark_sheet` VALUES (956, '202252000981', '19760532169', 69.000, '2024-09-15', 79.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (957, '202252000975', '19760532076', 54.000, '2008-05-26', 44.000, 18.000);
INSERT INTO `a_mark_sheet` VALUES (958, '202252000557', '19760532834', 20.000, '2002-12-14', 24.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (959, '202252000362', '19760532233', 20.000, '2020-02-22', 53.000, 11.000);
INSERT INTO `a_mark_sheet` VALUES (960, '202252000344', '19760532100', 92.000, '2008-03-29', 83.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (961, '202252000607', '19760532754', 28.000, '2006-09-22', 48.000, 81.000);
INSERT INTO `a_mark_sheet` VALUES (962, '202252000910', '19760532733', 86.000, '2014-02-02', 30.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (963, '202252000723', '19760532547', 58.000, '2009-01-25', 38.000, 15.000);
INSERT INTO `a_mark_sheet` VALUES (964, '202252000893', '19760532868', 42.000, '2004-10-10', 70.000, 99.000);
INSERT INTO `a_mark_sheet` VALUES (965, '202252000654', '19760532697', 76.000, '2021-10-13', 17.000, 94.000);
INSERT INTO `a_mark_sheet` VALUES (966, '202252000572', '19760532274', 86.000, '2004-08-16', 63.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (967, '202252000924', '19760532440', 78.000, '2005-06-12', 47.000, 83.000);
INSERT INTO `a_mark_sheet` VALUES (968, '202252000919', '19760532281', 47.000, '2004-02-07', 64.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (969, '202252000476', '19760532822', 45.000, '2021-01-22', 61.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (970, '202252000684', '19760533044', 99.000, '2002-09-16', 60.000, 98.000);
INSERT INTO `a_mark_sheet` VALUES (971, '202252000590', '19760532747', 100.000, '2005-12-24', 46.000, 36.000);
INSERT INTO `a_mark_sheet` VALUES (972, '202252000524', '19760532882', 51.000, '2019-04-01', 24.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (973, '202252000868', '19760532885', 84.000, '2000-08-29', 32.000, 20.000);
INSERT INTO `a_mark_sheet` VALUES (974, '202252000099', '19760532633', 100.000, '2000-01-17', 26.000, 69.000);
INSERT INTO `a_mark_sheet` VALUES (975, '202252000795', '19760532798', 53.000, '2013-06-21', 24.000, 70.000);
INSERT INTO `a_mark_sheet` VALUES (976, '202252000666', '19760532269', 88.000, '2017-01-26', 81.000, 90.000);
INSERT INTO `a_mark_sheet` VALUES (977, '202252000587', '19760532139', 89.000, '2010-07-14', 88.000, 55.000);
INSERT INTO `a_mark_sheet` VALUES (978, '202252000946', '19760532922', 47.000, '2008-06-14', 15.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (979, '202252000825', '19760532273', 25.000, '2008-04-22', 83.000, 39.000);
INSERT INTO `a_mark_sheet` VALUES (980, '202252000998', '19760532132', 40.000, '2011-08-22', 14.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (981, '202252000023', '19760532272', 31.000, '2012-07-22', 60.000, 29.000);
INSERT INTO `a_mark_sheet` VALUES (982, '202252000224', '19760532748', 70.000, '2020-06-07', 100.000, 21.000);
INSERT INTO `a_mark_sheet` VALUES (983, '202252000835', '19760532993', 78.000, '2002-01-05', 12.000, 57.000);
INSERT INTO `a_mark_sheet` VALUES (984, '202252000287', '19760532728', 66.000, '2005-11-26', 90.000, 26.000);
INSERT INTO `a_mark_sheet` VALUES (985, '202252000674', '19760532792', 19.000, '2013-03-03', 74.000, 100.000);
INSERT INTO `a_mark_sheet` VALUES (986, '202252000173', '19760532867', 81.000, '2001-08-23', 56.000, 10.000);
INSERT INTO `a_mark_sheet` VALUES (987, '202252000597', '19760532291', 10.000, '2022-11-18', 95.000, 25.000);
INSERT INTO `a_mark_sheet` VALUES (988, '202252000005', '19760532175', 96.000, '2007-04-19', 63.000, 27.000);
INSERT INTO `a_mark_sheet` VALUES (989, '202252000761', '19760532152', 14.000, '2014-06-29', 50.000, 13.000);
INSERT INTO `a_mark_sheet` VALUES (990, '202252000857', '19760532892', 41.000, '2024-09-06', 37.000, 54.000);
INSERT INTO `a_mark_sheet` VALUES (991, '202252000783', '19760532747', 86.000, '2016-04-13', 91.000, 56.000);
INSERT INTO `a_mark_sheet` VALUES (992, '202252000001', '19760532877', 28.000, '2008-08-21', 98.000, 95.000);
INSERT INTO `a_mark_sheet` VALUES (993, '202252000507', '19760532832', 99.000, '2012-12-15', 47.000, 49.000);
INSERT INTO `a_mark_sheet` VALUES (994, '202252000148', '19760532346', 43.000, '2005-11-13', 12.000, 31.000);
INSERT INTO `a_mark_sheet` VALUES (995, '202252000473', '19760532316', 36.000, '2014-02-12', 51.000, 23.000);
INSERT INTO `a_mark_sheet` VALUES (996, '202252000918', '19760532575', 10.000, '2009-09-02', 36.000, 62.000);
INSERT INTO `a_mark_sheet` VALUES (997, '202252000479', '19760532675', 30.000, '2002-04-09', 79.000, 61.000);
INSERT INTO `a_mark_sheet` VALUES (998, '202252000441', '19760532250', 19.000, '2020-01-10', 26.000, 67.000);
INSERT INTO `a_mark_sheet` VALUES (999, '202252000257', '19760532272', 18.000, '2019-09-05', 55.000, 47.000);

-- ----------------------------
-- Table structure for b1_mass_source
-- ----------------------------
DROP TABLE IF EXISTS `b1_mass_source`;
CREATE TABLE `b1_mass_source`  (
  `mas_id` decimal(40, 0) NOT NULL COMMENT '资源ID',
  `tc_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '训练ID',
  `teas_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源URL',
  PRIMARY KEY (`mas_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'B1 社团资源表\r\n\r\nB1_franchise_club\r\ntc_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b1_mass_source
-- ----------------------------

-- ----------------------------
-- Table structure for b_training_score
-- ----------------------------
DROP TABLE IF EXISTS `b_training_score`;
CREATE TABLE `b_training_score`  (
  `trs_id` decimal(40, 0) NOT NULL COMMENT '训练评价ID',
  `ts_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '总分ID',
  `trs_score` decimal(40, 3) NOT NULL COMMENT '成绩',
  PRIMARY KEY (`trs_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'B_训练评价分数表\r\n\r\ntotal_score\r\nts_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_training_score
-- ----------------------------

-- ----------------------------
-- Table structure for c1_bonus_point
-- ----------------------------
DROP TABLE IF EXISTS `c1_bonus_point`;
CREATE TABLE `c1_bonus_point`  (
  `bp_id` decimal(40, 0) NOT NULL COMMENT '加分ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `cr_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '课堂ID',
  `bp_value` decimal(10, 0) NOT NULL COMMENT '分值',
  `bp_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '加分名称(备注',
  PRIMARY KEY (`bp_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C1 课内赛 加分表\r\n\r\nclass_register\r\ncr_id\r\n\r\n                                   -' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c1_bonus_point
-- ----------------------------

-- ----------------------------
-- Table structure for c1_total_points
-- ----------------------------
DROP TABLE IF EXISTS `c1_total_points`;
CREATE TABLE `c1_total_points`  (
  `tp_id` decimal(40, 0) NOT NULL COMMENT '成绩ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `tp_value` decimal(10, 3) NOT NULL COMMENT '总成绩',
  PRIMARY KEY (`tp_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C1 课内赛 总分表\r\n\r\nstudent\r\nstu_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c1_total_points
-- ----------------------------

-- ----------------------------
-- Table structure for c2_competition_record
-- ----------------------------
DROP TABLE IF EXISTS `c2_competition_record`;
CREATE TABLE `c2_competition_record`  (
  `c_r_id` decimal(40, 0) NOT NULL COMMENT '记录ID',
  `c_r_score` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录比分',
  `session_time` date NOT NULL COMMENT '场次时间',
  `specification` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '比赛规格',
  `c_r_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '比赛名称',
  PRIMARY KEY (`c_r_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C2 课外赛 比赛记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c2_competition_record
-- ----------------------------

-- ----------------------------
-- Table structure for c2_personnel_sheet
-- ----------------------------
DROP TABLE IF EXISTS `c2_personnel_sheet`;
CREATE TABLE `c2_personnel_sheet`  (
  `ps_id` decimal(40, 0) NOT NULL COMMENT '人员ID',
  `c_r_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '记录ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `ps_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职位',
  PRIMARY KEY (`ps_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C2 课外赛 人员表\r\n\r\nc2_competition_record\r\nc_r_id\r\n                                       ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c2_personnel_sheet
-- ----------------------------

-- ----------------------------
-- Table structure for c2_proof
-- ----------------------------
DROP TABLE IF EXISTS `c2_proof`;
CREATE TABLE `c2_proof`  (
  `proof_id` decimal(40, 0) NOT NULL COMMENT '佐证ID',
  `ps_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '人员ID',
  `proof_url` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '佐证URL',
  PRIMARY KEY (`proof_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C2 课外赛 佐证表\r\n\r\nc2_personnel_sheet\r\nps_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c2_proof
-- ----------------------------

-- ----------------------------
-- Table structure for c_event_score
-- ----------------------------
DROP TABLE IF EXISTS `c_event_score`;
CREATE TABLE `c_event_score`  (
  `evs_id` decimal(40, 0) NOT NULL COMMENT '赛事评价ID',
  `ts_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '总分ID',
  `evs_score` decimal(40, 3) NOT NULL COMMENT '成绩',
  PRIMARY KEY (`evs_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'C_赛事评价分数表\r\n\r\ntotal_score\r\nts_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_event_score
-- ----------------------------

-- ----------------------------
-- Table structure for class_register
-- ----------------------------
DROP TABLE IF EXISTS `class_register`;
CREATE TABLE `class_register`  (
  `cr_id` decimal(40, 0) NOT NULL COMMENT '课堂ID',
  `semester_id` decimal(60, 0) NULL DEFAULT NULL COMMENT '学期ID',
  `cr_date` date NOT NULL COMMENT '开课时间',
  `cr_main` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课题内容',
  `cr_duration` decimal(30, 3) NOT NULL COMMENT '开课时长',
  PRIMARY KEY (`cr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课堂记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_register
-- ----------------------------
INSERT INTO `class_register` VALUES (1, 2, '2016-04-21', '篮球教学2.5年速成', 84.000);
INSERT INTO `class_register` VALUES (2, 2, '2011-01-05', '篮球教学2.5年速成', 43.000);
INSERT INTO `class_register` VALUES (3, 1, '2015-06-19', '2.5年打篮球入门到Rap精通', 18.000);
INSERT INTO `class_register` VALUES (4, 1, '2006-06-11', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (5, 3, '2000-04-15', '篮球教学2.5年速成', 27.000);
INSERT INTO `class_register` VALUES (6, 1, '2022-07-17', '篮球教学2.5年速成', 98.000);
INSERT INTO `class_register` VALUES (7, 2, '2022-10-19', '篮球教学2.5年速成', 75.000);
INSERT INTO `class_register` VALUES (8, 3, '2021-06-20', '2.5年打篮球入门到Rap精通', 74.000);
INSERT INTO `class_register` VALUES (9, 2, '2006-04-18', '篮球教学2.5年速成', 26.000);
INSERT INTO `class_register` VALUES (10, 2, '2012-06-23', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (11, 2, '2019-08-26', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (12, 2, '2023-08-16', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (13, 2, '2003-04-04', '篮球教学2.5年速成', 55.000);
INSERT INTO `class_register` VALUES (14, 1, '2001-03-06', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (15, 2, '2012-02-15', '2.5年打篮球入门到Rap精通', 64.000);
INSERT INTO `class_register` VALUES (16, 3, '2008-06-29', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (17, 2, '2017-03-26', '篮球教学2.5年速成', 93.000);
INSERT INTO `class_register` VALUES (18, 2, '2003-12-30', '2.5年打篮球入门到Rap精通', 69.000);
INSERT INTO `class_register` VALUES (19, 1, '2010-03-18', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (20, 2, '2000-02-05', '篮球教学2.5年速成', 82.000);
INSERT INTO `class_register` VALUES (21, 3, '2020-10-23', '2.5年打篮球入门到Rap精通', 58.000);
INSERT INTO `class_register` VALUES (22, 1, '2019-06-22', '2.5年打篮球入门到Rap精通', 77.000);
INSERT INTO `class_register` VALUES (23, 2, '2005-10-09', '篮球教学2.5年速成', 60.000);
INSERT INTO `class_register` VALUES (24, 1, '2011-06-21', '2.5年打篮球入门到Rap精通', 67.000);
INSERT INTO `class_register` VALUES (25, 1, '2021-06-11', '2.5年打篮球入门到Rap精通', 28.000);
INSERT INTO `class_register` VALUES (26, 2, '2013-08-07', '篮球教学2.5年速成', 75.000);
INSERT INTO `class_register` VALUES (27, 2, '2019-04-09', '2.5年打篮球入门到Rap精通', 32.000);
INSERT INTO `class_register` VALUES (28, 3, '2018-10-25', '篮球教学2.5年速成', 94.000);
INSERT INTO `class_register` VALUES (29, 3, '2021-04-12', '篮球教学2.5年速成', 45.000);
INSERT INTO `class_register` VALUES (30, 1, '2001-04-08', '2.5年打篮球入门到Rap精通', 56.000);
INSERT INTO `class_register` VALUES (31, 3, '2000-06-03', '篮球教学2.5年速成', 98.000);
INSERT INTO `class_register` VALUES (32, 1, '2006-03-16', '篮球教学2.5年速成', 24.000);
INSERT INTO `class_register` VALUES (33, 3, '2023-07-10', '2.5年打篮球入门到Rap精通', 70.000);
INSERT INTO `class_register` VALUES (34, 2, '2024-10-13', '2.5年打篮球入门到Rap精通', 32.000);
INSERT INTO `class_register` VALUES (35, 3, '2004-01-02', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (36, 1, '2011-09-11', '2.5年打篮球入门到Rap精通', 77.000);
INSERT INTO `class_register` VALUES (37, 2, '2017-07-18', '2.5年打篮球入门到Rap精通', 80.000);
INSERT INTO `class_register` VALUES (38, 1, '2022-11-20', '2.5年打篮球入门到Rap精通', 31.000);
INSERT INTO `class_register` VALUES (39, 2, '2022-01-11', '篮球教学2.5年速成', 77.000);
INSERT INTO `class_register` VALUES (40, 3, '2006-03-30', '篮球教学2.5年速成', 13.000);
INSERT INTO `class_register` VALUES (41, 2, '2004-06-11', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (42, 2, '2010-05-19', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (43, 1, '2002-01-11', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (44, 3, '2015-03-27', '2.5年打篮球入门到Rap精通', 73.000);
INSERT INTO `class_register` VALUES (45, 1, '2017-07-03', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (46, 3, '2021-08-11', '2.5年打篮球入门到Rap精通', 70.000);
INSERT INTO `class_register` VALUES (47, 2, '2007-12-23', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (48, 3, '2012-09-01', '2.5年打篮球入门到Rap精通', 77.000);
INSERT INTO `class_register` VALUES (49, 2, '2013-09-12', '2.5年打篮球入门到Rap精通', 32.000);
INSERT INTO `class_register` VALUES (50, 3, '2004-02-17', '篮球教学2.5年速成', 23.000);
INSERT INTO `class_register` VALUES (51, 1, '2000-11-26', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (52, 2, '2015-03-31', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (53, 2, '2007-08-29', '2.5年打篮球入门到Rap精通', 24.000);
INSERT INTO `class_register` VALUES (54, 3, '2021-03-11', '2.5年打篮球入门到Rap精通', 89.000);
INSERT INTO `class_register` VALUES (55, 2, '2003-07-17', '篮球教学2.5年速成', 22.000);
INSERT INTO `class_register` VALUES (56, 2, '2017-05-25', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (57, 2, '2003-01-22', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (58, 3, '2008-10-25', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (59, 3, '2005-07-28', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (60, 2, '2004-08-20', '篮球教学2.5年速成', 78.000);
INSERT INTO `class_register` VALUES (61, 1, '2016-04-29', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (62, 1, '2009-11-11', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (63, 3, '2016-08-07', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (64, 2, '2023-12-27', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (65, 3, '2017-08-24', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (66, 1, '2011-01-06', '2.5年打篮球入门到Rap精通', 21.000);
INSERT INTO `class_register` VALUES (67, 1, '2008-05-21', '篮球教学2.5年速成', 98.000);
INSERT INTO `class_register` VALUES (68, 2, '2024-07-12', '2.5年打篮球入门到Rap精通', 63.000);
INSERT INTO `class_register` VALUES (69, 2, '2007-01-21', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (70, 3, '2020-07-22', '2.5年打篮球入门到Rap精通', 54.000);
INSERT INTO `class_register` VALUES (71, 2, '2001-05-22', '篮球教学2.5年速成', 90.000);
INSERT INTO `class_register` VALUES (72, 1, '2014-02-12', '2.5年打篮球入门到Rap精通', 29.000);
INSERT INTO `class_register` VALUES (73, 3, '2017-01-06', '篮球教学2.5年速成', 25.000);
INSERT INTO `class_register` VALUES (74, 3, '2024-11-23', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (75, 1, '2009-11-24', '2.5年打篮球入门到Rap精通', 17.000);
INSERT INTO `class_register` VALUES (76, 2, '2018-07-19', '篮球教学2.5年速成', 88.000);
INSERT INTO `class_register` VALUES (77, 1, '2018-04-17', '篮球教学2.5年速成', 58.000);
INSERT INTO `class_register` VALUES (78, 1, '2020-06-07', '2.5年打篮球入门到Rap精通', 84.000);
INSERT INTO `class_register` VALUES (79, 2, '2010-01-10', '篮球教学2.5年速成', 92.000);
INSERT INTO `class_register` VALUES (80, 1, '2013-10-11', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (81, 1, '2009-01-19', '2.5年打篮球入门到Rap精通', 73.000);
INSERT INTO `class_register` VALUES (82, 3, '2022-04-19', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (83, 3, '2022-08-25', '篮球教学2.5年速成', 14.000);
INSERT INTO `class_register` VALUES (84, 1, '2021-01-31', '篮球教学2.5年速成', 41.000);
INSERT INTO `class_register` VALUES (85, 2, '2005-08-25', '篮球教学2.5年速成', 85.000);
INSERT INTO `class_register` VALUES (86, 3, '2014-08-15', '篮球教学2.5年速成', 33.000);
INSERT INTO `class_register` VALUES (87, 3, '2018-12-23', '2.5年打篮球入门到Rap精通', 53.000);
INSERT INTO `class_register` VALUES (88, 3, '2008-07-13', '2.5年打篮球入门到Rap精通', 87.000);
INSERT INTO `class_register` VALUES (89, 1, '2006-01-23', '2.5年打篮球入门到Rap精通', 49.000);
INSERT INTO `class_register` VALUES (90, 1, '2000-12-13', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (91, 2, '2016-11-19', '篮球教学2.5年速成', 28.000);
INSERT INTO `class_register` VALUES (92, 2, '2022-11-28', '2.5年打篮球入门到Rap精通', 63.000);
INSERT INTO `class_register` VALUES (93, 2, '2007-01-16', '篮球教学2.5年速成', 90.000);
INSERT INTO `class_register` VALUES (94, 3, '2015-06-07', '篮球教学2.5年速成', 11.000);
INSERT INTO `class_register` VALUES (95, 1, '2012-01-21', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (96, 3, '2017-02-25', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (97, 3, '2011-02-03', '2.5年打篮球入门到Rap精通', 58.000);
INSERT INTO `class_register` VALUES (98, 1, '2008-11-10', '2.5年打篮球入门到Rap精通', 99.000);
INSERT INTO `class_register` VALUES (99, 2, '2005-10-09', '篮球教学2.5年速成', 50.000);
INSERT INTO `class_register` VALUES (100, 1, '2012-05-04', '篮球教学2.5年速成', 42.000);
INSERT INTO `class_register` VALUES (101, 2, '2015-12-28', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (102, 3, '2009-07-23', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (103, 1, '2001-07-20', '2.5年打篮球入门到Rap精通', 69.000);
INSERT INTO `class_register` VALUES (104, 3, '2016-05-16', '2.5年打篮球入门到Rap精通', 66.000);
INSERT INTO `class_register` VALUES (105, 2, '2000-01-29', '2.5年打篮球入门到Rap精通', 88.000);
INSERT INTO `class_register` VALUES (106, 1, '2007-01-05', '篮球教学2.5年速成', 64.000);
INSERT INTO `class_register` VALUES (107, 1, '2002-10-20', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (108, 3, '2002-06-21', '2.5年打篮球入门到Rap精通', 19.000);
INSERT INTO `class_register` VALUES (109, 3, '2011-05-07', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (110, 1, '2006-05-19', '篮球教学2.5年速成', 62.000);
INSERT INTO `class_register` VALUES (111, 1, '2016-04-02', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (112, 2, '2003-07-10', '篮球教学2.5年速成', 15.000);
INSERT INTO `class_register` VALUES (113, 2, '2017-12-27', '篮球教学2.5年速成', 28.000);
INSERT INTO `class_register` VALUES (114, 3, '2011-10-14', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (115, 2, '2000-07-29', '篮球教学2.5年速成', 26.000);
INSERT INTO `class_register` VALUES (116, 2, '2008-11-21', '篮球教学2.5年速成', 43.000);
INSERT INTO `class_register` VALUES (117, 1, '2002-03-22', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (118, 2, '2013-10-12', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (119, 2, '2005-11-05', '篮球教学2.5年速成', 84.000);
INSERT INTO `class_register` VALUES (120, 3, '2004-08-03', '2.5年打篮球入门到Rap精通', 99.000);
INSERT INTO `class_register` VALUES (121, 3, '2020-01-18', '2.5年打篮球入门到Rap精通', 91.000);
INSERT INTO `class_register` VALUES (122, 2, '2014-12-29', '篮球教学2.5年速成', 53.000);
INSERT INTO `class_register` VALUES (123, 1, '2022-05-05', '2.5年打篮球入门到Rap精通', 17.000);
INSERT INTO `class_register` VALUES (124, 2, '2015-08-06', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (125, 3, '2016-12-25', '篮球教学2.5年速成', 59.000);
INSERT INTO `class_register` VALUES (126, 1, '2014-11-18', '2.5年打篮球入门到Rap精通', 46.000);
INSERT INTO `class_register` VALUES (127, 2, '2008-12-17', '篮球教学2.5年速成', 46.000);
INSERT INTO `class_register` VALUES (128, 1, '2005-05-21', '篮球教学2.5年速成', 77.000);
INSERT INTO `class_register` VALUES (129, 1, '2006-10-08', '篮球教学2.5年速成', 58.000);
INSERT INTO `class_register` VALUES (130, 1, '2016-04-14', '2.5年打篮球入门到Rap精通', 77.000);
INSERT INTO `class_register` VALUES (131, 1, '2022-12-25', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (132, 1, '2001-06-12', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (133, 3, '2002-08-31', '2.5年打篮球入门到Rap精通', 30.000);
INSERT INTO `class_register` VALUES (134, 3, '2002-03-08', '篮球教学2.5年速成', 48.000);
INSERT INTO `class_register` VALUES (135, 2, '2019-06-13', '篮球教学2.5年速成', 88.000);
INSERT INTO `class_register` VALUES (136, 1, '2012-02-01', '2.5年打篮球入门到Rap精通', 98.000);
INSERT INTO `class_register` VALUES (137, 1, '2012-10-25', '2.5年打篮球入门到Rap精通', 25.000);
INSERT INTO `class_register` VALUES (138, 2, '2008-01-11', '篮球教学2.5年速成', 13.000);
INSERT INTO `class_register` VALUES (139, 2, '2000-03-18', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (140, 1, '2023-09-13', '2.5年打篮球入门到Rap精通', 96.000);
INSERT INTO `class_register` VALUES (141, 3, '2003-02-04', '篮球教学2.5年速成', 93.000);
INSERT INTO `class_register` VALUES (142, 3, '2004-09-27', '篮球教学2.5年速成', 26.000);
INSERT INTO `class_register` VALUES (143, 2, '2015-03-06', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (144, 1, '2011-09-08', '篮球教学2.5年速成', 40.000);
INSERT INTO `class_register` VALUES (145, 1, '2016-04-04', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (146, 3, '2006-07-12', '2.5年打篮球入门到Rap精通', 22.000);
INSERT INTO `class_register` VALUES (147, 2, '2012-10-17', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (148, 2, '2019-01-26', '篮球教学2.5年速成', 82.000);
INSERT INTO `class_register` VALUES (149, 2, '2019-05-20', '篮球教学2.5年速成', 97.000);
INSERT INTO `class_register` VALUES (150, 2, '2008-12-01', '2.5年打篮球入门到Rap精通', 68.000);
INSERT INTO `class_register` VALUES (151, 1, '2008-12-18', '2.5年打篮球入门到Rap精通', 31.000);
INSERT INTO `class_register` VALUES (152, 1, '2014-08-25', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (153, 1, '2021-11-25', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (154, 1, '2021-08-13', '2.5年打篮球入门到Rap精通', 52.000);
INSERT INTO `class_register` VALUES (155, 1, '2015-02-13', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (156, 1, '2011-04-29', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (157, 1, '2009-02-18', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (158, 2, '2009-02-01', '篮球教学2.5年速成', 36.000);
INSERT INTO `class_register` VALUES (159, 1, '2009-04-20', '2.5年打篮球入门到Rap精通', 66.000);
INSERT INTO `class_register` VALUES (160, 3, '2015-07-13', '篮球教学2.5年速成', 61.000);
INSERT INTO `class_register` VALUES (161, 2, '2015-11-12', '2.5年打篮球入门到Rap精通', 98.000);
INSERT INTO `class_register` VALUES (162, 3, '2000-07-30', '篮球教学2.5年速成', 13.000);
INSERT INTO `class_register` VALUES (163, 2, '2010-12-15', '篮球教学2.5年速成', 42.000);
INSERT INTO `class_register` VALUES (164, 2, '2021-02-09', '篮球教学2.5年速成', 98.000);
INSERT INTO `class_register` VALUES (165, 2, '2022-09-05', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (166, 1, '2010-02-28', '篮球教学2.5年速成', 13.000);
INSERT INTO `class_register` VALUES (167, 3, '2001-06-07', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (168, 3, '2016-08-30', '2.5年打篮球入门到Rap精通', 97.000);
INSERT INTO `class_register` VALUES (169, 3, '2011-01-31', '篮球教学2.5年速成', 32.000);
INSERT INTO `class_register` VALUES (170, 3, '2001-05-08', '篮球教学2.5年速成', 87.000);
INSERT INTO `class_register` VALUES (171, 2, '2022-11-15', '2.5年打篮球入门到Rap精通', 77.000);
INSERT INTO `class_register` VALUES (172, 3, '2024-08-31', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (173, 2, '2019-10-06', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (174, 2, '2017-06-14', '篮球教学2.5年速成', 37.000);
INSERT INTO `class_register` VALUES (175, 2, '2000-10-31', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (176, 2, '2016-01-04', '篮球教学2.5年速成', 67.000);
INSERT INTO `class_register` VALUES (177, 1, '2024-12-05', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (178, 1, '2003-11-24', '2.5年打篮球入门到Rap精通', 54.000);
INSERT INTO `class_register` VALUES (179, 2, '2009-04-19', '2.5年打篮球入门到Rap精通', 68.000);
INSERT INTO `class_register` VALUES (180, 2, '2021-05-19', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (181, 1, '2024-03-01', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (182, 2, '2011-10-11', '篮球教学2.5年速成', 37.000);
INSERT INTO `class_register` VALUES (183, 2, '2007-05-18', '2.5年打篮球入门到Rap精通', 59.000);
INSERT INTO `class_register` VALUES (184, 3, '2000-01-20', '2.5年打篮球入门到Rap精通', 74.000);
INSERT INTO `class_register` VALUES (185, 2, '2019-04-10', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (186, 1, '2001-07-07', '2.5年打篮球入门到Rap精通', 11.000);
INSERT INTO `class_register` VALUES (187, 1, '2020-11-29', '2.5年打篮球入门到Rap精通', 31.000);
INSERT INTO `class_register` VALUES (188, 2, '2010-09-09', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (189, 1, '2017-12-14', '篮球教学2.5年速成', 48.000);
INSERT INTO `class_register` VALUES (190, 1, '2013-07-15', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (191, 2, '2023-06-20', '篮球教学2.5年速成', 16.000);
INSERT INTO `class_register` VALUES (192, 2, '2007-04-11', '2.5年打篮球入门到Rap精通', 61.000);
INSERT INTO `class_register` VALUES (193, 1, '2001-03-03', '2.5年打篮球入门到Rap精通', 61.000);
INSERT INTO `class_register` VALUES (194, 1, '2021-02-24', '篮球教学2.5年速成', 55.000);
INSERT INTO `class_register` VALUES (195, 2, '2008-06-21', '2.5年打篮球入门到Rap精通', 49.000);
INSERT INTO `class_register` VALUES (196, 2, '2012-07-13', '2.5年打篮球入门到Rap精通', 24.000);
INSERT INTO `class_register` VALUES (197, 1, '2003-09-25', '2.5年打篮球入门到Rap精通', 99.000);
INSERT INTO `class_register` VALUES (198, 1, '2018-11-26', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (199, 3, '2024-03-26', '篮球教学2.5年速成', 78.000);
INSERT INTO `class_register` VALUES (200, 1, '2019-11-13', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (201, 1, '2003-06-11', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (202, 2, '2003-09-17', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (203, 2, '2018-09-18', '篮球教学2.5年速成', 67.000);
INSERT INTO `class_register` VALUES (204, 1, '2006-08-05', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (205, 2, '2017-09-05', '2.5年打篮球入门到Rap精通', 47.000);
INSERT INTO `class_register` VALUES (206, 3, '2000-05-16', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (207, 1, '2022-05-11', '篮球教学2.5年速成', 64.000);
INSERT INTO `class_register` VALUES (208, 1, '2020-08-15', '2.5年打篮球入门到Rap精通', 56.000);
INSERT INTO `class_register` VALUES (209, 1, '2008-02-06', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (210, 1, '2017-03-18', '篮球教学2.5年速成', 94.000);
INSERT INTO `class_register` VALUES (211, 1, '2003-06-28', '篮球教学2.5年速成', 52.000);
INSERT INTO `class_register` VALUES (212, 3, '2002-01-17', '2.5年打篮球入门到Rap精通', 91.000);
INSERT INTO `class_register` VALUES (213, 3, '2010-01-17', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (214, 3, '2011-12-29', '2.5年打篮球入门到Rap精通', 50.000);
INSERT INTO `class_register` VALUES (215, 3, '2022-08-05', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (216, 1, '2005-07-05', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (217, 2, '2021-12-16', '2.5年打篮球入门到Rap精通', 99.000);
INSERT INTO `class_register` VALUES (218, 2, '2009-06-23', '篮球教学2.5年速成', 84.000);
INSERT INTO `class_register` VALUES (219, 3, '2020-10-29', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (220, 3, '2009-03-25', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (221, 2, '2019-03-15', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (222, 2, '2016-12-23', '2.5年打篮球入门到Rap精通', 99.000);
INSERT INTO `class_register` VALUES (223, 2, '2008-06-17', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (224, 3, '2017-09-12', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (225, 2, '2004-03-14', '2.5年打篮球入门到Rap精通', 84.000);
INSERT INTO `class_register` VALUES (226, 3, '2007-06-15', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (227, 2, '2023-03-04', '篮球教学2.5年速成', 58.000);
INSERT INTO `class_register` VALUES (228, 3, '2003-11-02', '2.5年打篮球入门到Rap精通', 80.000);
INSERT INTO `class_register` VALUES (229, 1, '2006-09-11', '篮球教学2.5年速成', 59.000);
INSERT INTO `class_register` VALUES (230, 1, '2024-11-15', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (231, 3, '2024-09-05', '篮球教学2.5年速成', 61.000);
INSERT INTO `class_register` VALUES (232, 3, '2017-05-20', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (233, 3, '2016-11-08', '篮球教学2.5年速成', 39.000);
INSERT INTO `class_register` VALUES (234, 3, '2010-11-04', '篮球教学2.5年速成', 57.000);
INSERT INTO `class_register` VALUES (235, 3, '2024-05-17', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (236, 3, '2016-09-20', '篮球教学2.5年速成', 41.000);
INSERT INTO `class_register` VALUES (237, 2, '2018-05-25', '2.5年打篮球入门到Rap精通', 83.000);
INSERT INTO `class_register` VALUES (238, 2, '2021-11-27', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (239, 1, '2016-03-26', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (240, 2, '2000-12-07', '篮球教学2.5年速成', 16.000);
INSERT INTO `class_register` VALUES (241, 1, '2019-05-11', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (242, 3, '2017-10-29', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (243, 2, '2024-02-15', '2.5年打篮球入门到Rap精通', 31.000);
INSERT INTO `class_register` VALUES (244, 2, '2022-04-11', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (245, 3, '2008-04-19', '2.5年打篮球入门到Rap精通', 50.000);
INSERT INTO `class_register` VALUES (246, 1, '2014-10-26', '2.5年打篮球入门到Rap精通', 84.000);
INSERT INTO `class_register` VALUES (247, 2, '2007-10-30', '篮球教学2.5年速成', 81.000);
INSERT INTO `class_register` VALUES (248, 2, '2002-10-08', '2.5年打篮球入门到Rap精通', 33.000);
INSERT INTO `class_register` VALUES (249, 2, '2023-03-06', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (250, 2, '2024-07-05', '2.5年打篮球入门到Rap精通', 38.000);
INSERT INTO `class_register` VALUES (251, 2, '2004-07-19', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (252, 2, '2003-09-06', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (253, 3, '2023-08-20', '2.5年打篮球入门到Rap精通', 25.000);
INSERT INTO `class_register` VALUES (254, 2, '2001-12-26', '2.5年打篮球入门到Rap精通', 83.000);
INSERT INTO `class_register` VALUES (255, 1, '2019-12-21', '2.5年打篮球入门到Rap精通', 48.000);
INSERT INTO `class_register` VALUES (256, 2, '2018-03-03', '2.5年打篮球入门到Rap精通', 47.000);
INSERT INTO `class_register` VALUES (257, 1, '2010-06-10', '2.5年打篮球入门到Rap精通', 11.000);
INSERT INTO `class_register` VALUES (258, 3, '2024-11-19', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (259, 3, '2005-04-30', '2.5年打篮球入门到Rap精通', 68.000);
INSERT INTO `class_register` VALUES (260, 1, '2022-06-28', '2.5年打篮球入门到Rap精通', 51.000);
INSERT INTO `class_register` VALUES (261, 1, '2000-03-16', '篮球教学2.5年速成', 93.000);
INSERT INTO `class_register` VALUES (262, 3, '2001-02-26', '2.5年打篮球入门到Rap精通', 56.000);
INSERT INTO `class_register` VALUES (263, 1, '2007-10-31', '篮球教学2.5年速成', 24.000);
INSERT INTO `class_register` VALUES (264, 2, '2002-06-16', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (265, 1, '2002-08-05', '篮球教学2.5年速成', 19.000);
INSERT INTO `class_register` VALUES (266, 3, '2005-04-01', '篮球教学2.5年速成', 18.000);
INSERT INTO `class_register` VALUES (267, 2, '2018-11-02', '2.5年打篮球入门到Rap精通', 17.000);
INSERT INTO `class_register` VALUES (268, 3, '2021-05-31', '篮球教学2.5年速成', 18.000);
INSERT INTO `class_register` VALUES (269, 1, '2016-01-22', '2.5年打篮球入门到Rap精通', 94.000);
INSERT INTO `class_register` VALUES (270, 2, '2015-12-25', '2.5年打篮球入门到Rap精通', 49.000);
INSERT INTO `class_register` VALUES (271, 2, '2009-07-31', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (272, 1, '2004-12-19', '篮球教学2.5年速成', 89.000);
INSERT INTO `class_register` VALUES (273, 2, '2016-01-16', '2.5年打篮球入门到Rap精通', 67.000);
INSERT INTO `class_register` VALUES (274, 2, '2011-06-27', '篮球教学2.5年速成', 61.000);
INSERT INTO `class_register` VALUES (275, 1, '2003-10-24', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (276, 3, '2021-07-09', '2.5年打篮球入门到Rap精通', 96.000);
INSERT INTO `class_register` VALUES (277, 3, '2005-01-06', '2.5年打篮球入门到Rap精通', 59.000);
INSERT INTO `class_register` VALUES (278, 3, '2019-11-13', '2.5年打篮球入门到Rap精通', 98.000);
INSERT INTO `class_register` VALUES (279, 3, '2005-03-08', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (280, 3, '2006-11-02', '篮球教学2.5年速成', 23.000);
INSERT INTO `class_register` VALUES (281, 3, '2023-01-03', '2.5年打篮球入门到Rap精通', 61.000);
INSERT INTO `class_register` VALUES (282, 2, '2002-07-05', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (283, 3, '2001-07-20', '2.5年打篮球入门到Rap精通', 80.000);
INSERT INTO `class_register` VALUES (284, 2, '2021-08-30', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (285, 1, '2023-05-06', '篮球教学2.5年速成', 60.000);
INSERT INTO `class_register` VALUES (286, 2, '2004-02-28', '篮球教学2.5年速成', 99.000);
INSERT INTO `class_register` VALUES (287, 1, '2003-02-04', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (288, 2, '2024-04-25', '篮球教学2.5年速成', 25.000);
INSERT INTO `class_register` VALUES (289, 3, '2019-12-21', '2.5年打篮球入门到Rap精通', 12.000);
INSERT INTO `class_register` VALUES (290, 2, '2008-05-08', '篮球教学2.5年速成', 46.000);
INSERT INTO `class_register` VALUES (291, 2, '2014-05-14', '2.5年打篮球入门到Rap精通', 32.000);
INSERT INTO `class_register` VALUES (292, 2, '2012-03-04', '2.5年打篮球入门到Rap精通', 100.000);
INSERT INTO `class_register` VALUES (293, 1, '2000-12-05', '篮球教学2.5年速成', 62.000);
INSERT INTO `class_register` VALUES (294, 2, '2014-01-20', '篮球教学2.5年速成', 85.000);
INSERT INTO `class_register` VALUES (295, 2, '2014-05-08', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (296, 2, '2005-07-03', '2.5年打篮球入门到Rap精通', 66.000);
INSERT INTO `class_register` VALUES (297, 3, '2017-08-05', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (298, 3, '2021-05-11', '2.5年打篮球入门到Rap精通', 89.000);
INSERT INTO `class_register` VALUES (299, 1, '2014-05-16', '2.5年打篮球入门到Rap精通', 41.000);
INSERT INTO `class_register` VALUES (300, 2, '2010-04-06', '篮球教学2.5年速成', 74.000);
INSERT INTO `class_register` VALUES (301, 2, '2023-12-05', '2.5年打篮球入门到Rap精通', 46.000);
INSERT INTO `class_register` VALUES (302, 2, '2017-03-11', '2.5年打篮球入门到Rap精通', 40.000);
INSERT INTO `class_register` VALUES (303, 1, '2008-11-02', '2.5年打篮球入门到Rap精通', 70.000);
INSERT INTO `class_register` VALUES (304, 3, '2019-03-23', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (305, 3, '2006-01-09', '篮球教学2.5年速成', 42.000);
INSERT INTO `class_register` VALUES (306, 3, '2017-04-06', '2.5年打篮球入门到Rap精通', 61.000);
INSERT INTO `class_register` VALUES (307, 1, '2003-02-01', '篮球教学2.5年速成', 32.000);
INSERT INTO `class_register` VALUES (308, 2, '2021-10-14', '2.5年打篮球入门到Rap精通', 19.000);
INSERT INTO `class_register` VALUES (309, 1, '2022-11-06', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (310, 3, '2024-04-11', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (311, 1, '2006-01-31', '2.5年打篮球入门到Rap精通', 48.000);
INSERT INTO `class_register` VALUES (312, 3, '2014-10-27', '篮球教学2.5年速成', 100.000);
INSERT INTO `class_register` VALUES (313, 2, '2011-08-18', '2.5年打篮球入门到Rap精通', 50.000);
INSERT INTO `class_register` VALUES (314, 1, '2009-06-21', '篮球教学2.5年速成', 26.000);
INSERT INTO `class_register` VALUES (315, 1, '2000-05-09', '2.5年打篮球入门到Rap精通', 41.000);
INSERT INTO `class_register` VALUES (316, 1, '2011-02-01', '篮球教学2.5年速成', 77.000);
INSERT INTO `class_register` VALUES (317, 1, '2021-07-05', '2.5年打篮球入门到Rap精通', 96.000);
INSERT INTO `class_register` VALUES (318, 3, '2010-08-25', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (319, 3, '2010-09-22', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (320, 1, '2006-03-23', '2.5年打篮球入门到Rap精通', 41.000);
INSERT INTO `class_register` VALUES (321, 1, '2007-01-30', '2.5年打篮球入门到Rap精通', 24.000);
INSERT INTO `class_register` VALUES (322, 1, '2015-04-29', '篮球教学2.5年速成', 32.000);
INSERT INTO `class_register` VALUES (323, 2, '2010-04-20', '篮球教学2.5年速成', 64.000);
INSERT INTO `class_register` VALUES (324, 2, '2008-08-03', '2.5年打篮球入门到Rap精通', 55.000);
INSERT INTO `class_register` VALUES (325, 2, '2020-09-07', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (326, 3, '2000-01-20', '2.5年打篮球入门到Rap精通', 94.000);
INSERT INTO `class_register` VALUES (327, 2, '2011-10-25', '篮球教学2.5年速成', 75.000);
INSERT INTO `class_register` VALUES (328, 3, '2004-04-18', '2.5年打篮球入门到Rap精通', 55.000);
INSERT INTO `class_register` VALUES (329, 3, '2024-06-30', '篮球教学2.5年速成', 50.000);
INSERT INTO `class_register` VALUES (330, 1, '2016-03-29', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (331, 2, '2012-10-04', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (332, 1, '2003-10-28', '2.5年打篮球入门到Rap精通', 14.000);
INSERT INTO `class_register` VALUES (333, 1, '2017-12-21', '篮球教学2.5年速成', 16.000);
INSERT INTO `class_register` VALUES (334, 1, '2010-02-15', '2.5年打篮球入门到Rap精通', 69.000);
INSERT INTO `class_register` VALUES (335, 2, '2010-04-29', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (336, 3, '2014-04-17', '2.5年打篮球入门到Rap精通', 33.000);
INSERT INTO `class_register` VALUES (337, 1, '2016-10-08', '篮球教学2.5年速成', 37.000);
INSERT INTO `class_register` VALUES (338, 3, '2021-05-23', '篮球教学2.5年速成', 42.000);
INSERT INTO `class_register` VALUES (339, 3, '2015-07-01', '2.5年打篮球入门到Rap精通', 48.000);
INSERT INTO `class_register` VALUES (340, 3, '2020-04-05', '2.5年打篮球入门到Rap精通', 92.000);
INSERT INTO `class_register` VALUES (341, 2, '2019-04-23', '2.5年打篮球入门到Rap精通', 47.000);
INSERT INTO `class_register` VALUES (342, 2, '2011-01-16', '2.5年打篮球入门到Rap精通', 83.000);
INSERT INTO `class_register` VALUES (343, 1, '2008-08-28', '篮球教学2.5年速成', 45.000);
INSERT INTO `class_register` VALUES (344, 3, '2022-01-27', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (345, 1, '2015-05-26', '篮球教学2.5年速成', 68.000);
INSERT INTO `class_register` VALUES (346, 3, '2000-08-04', '2.5年打篮球入门到Rap精通', 27.000);
INSERT INTO `class_register` VALUES (347, 3, '2024-10-15', '2.5年打篮球入门到Rap精通', 87.000);
INSERT INTO `class_register` VALUES (348, 3, '2021-12-18', '2.5年打篮球入门到Rap精通', 91.000);
INSERT INTO `class_register` VALUES (349, 1, '2011-02-07', '篮球教学2.5年速成', 21.000);
INSERT INTO `class_register` VALUES (350, 3, '2023-03-23', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (351, 2, '2015-12-27', '篮球教学2.5年速成', 28.000);
INSERT INTO `class_register` VALUES (352, 2, '2024-02-04', '篮球教学2.5年速成', 64.000);
INSERT INTO `class_register` VALUES (353, 2, '2005-08-24', '篮球教学2.5年速成', 59.000);
INSERT INTO `class_register` VALUES (354, 1, '2021-05-30', '2.5年打篮球入门到Rap精通', 63.000);
INSERT INTO `class_register` VALUES (355, 3, '2010-01-08', '2.5年打篮球入门到Rap精通', 44.000);
INSERT INTO `class_register` VALUES (356, 2, '2005-02-16', '篮球教学2.5年速成', 36.000);
INSERT INTO `class_register` VALUES (357, 3, '2019-03-06', '篮球教学2.5年速成', 37.000);
INSERT INTO `class_register` VALUES (358, 3, '2019-02-27', '篮球教学2.5年速成', 89.000);
INSERT INTO `class_register` VALUES (359, 1, '2011-10-18', '篮球教学2.5年速成', 26.000);
INSERT INTO `class_register` VALUES (360, 1, '2019-09-27', '篮球教学2.5年速成', 74.000);
INSERT INTO `class_register` VALUES (361, 1, '2006-02-16', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (362, 1, '2009-10-08', '篮球教学2.5年速成', 98.000);
INSERT INTO `class_register` VALUES (363, 2, '2020-02-10', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (364, 2, '2009-01-05', '2.5年打篮球入门到Rap精通', 63.000);
INSERT INTO `class_register` VALUES (365, 3, '2017-01-23', '篮球教学2.5年速成', 51.000);
INSERT INTO `class_register` VALUES (366, 2, '2017-06-04', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (367, 1, '2021-10-14', '2.5年打篮球入门到Rap精通', 49.000);
INSERT INTO `class_register` VALUES (368, 3, '2020-06-20', '2.5年打篮球入门到Rap精通', 52.000);
INSERT INTO `class_register` VALUES (369, 3, '2023-07-14', '2.5年打篮球入门到Rap精通', 18.000);
INSERT INTO `class_register` VALUES (370, 2, '2007-09-16', '篮球教学2.5年速成', 100.000);
INSERT INTO `class_register` VALUES (371, 3, '2016-07-25', '篮球教学2.5年速成', 12.000);
INSERT INTO `class_register` VALUES (372, 1, '2021-02-22', '2.5年打篮球入门到Rap精通', 12.000);
INSERT INTO `class_register` VALUES (373, 2, '2007-04-03', '2.5年打篮球入门到Rap精通', 40.000);
INSERT INTO `class_register` VALUES (374, 3, '2001-12-14', '2.5年打篮球入门到Rap精通', 74.000);
INSERT INTO `class_register` VALUES (375, 1, '2007-03-08', '篮球教学2.5年速成', 57.000);
INSERT INTO `class_register` VALUES (376, 1, '2024-05-15', '篮球教学2.5年速成', 84.000);
INSERT INTO `class_register` VALUES (377, 3, '2011-07-09', '2.5年打篮球入门到Rap精通', 24.000);
INSERT INTO `class_register` VALUES (378, 3, '2003-10-16', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (379, 1, '2003-08-20', '2.5年打篮球入门到Rap精通', 29.000);
INSERT INTO `class_register` VALUES (380, 3, '2005-07-12', '篮球教学2.5年速成', 94.000);
INSERT INTO `class_register` VALUES (381, 3, '2019-07-21', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (382, 3, '2006-01-17', '篮球教学2.5年速成', 80.000);
INSERT INTO `class_register` VALUES (383, 3, '2001-11-30', '篮球教学2.5年速成', 58.000);
INSERT INTO `class_register` VALUES (384, 1, '2001-07-18', '2.5年打篮球入门到Rap精通', 33.000);
INSERT INTO `class_register` VALUES (385, 1, '2009-09-30', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (386, 2, '2005-02-20', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (387, 2, '2021-10-01', '篮球教学2.5年速成', 64.000);
INSERT INTO `class_register` VALUES (388, 3, '2003-10-16', '篮球教学2.5年速成', 58.000);
INSERT INTO `class_register` VALUES (389, 3, '2014-01-07', '2.5年打篮球入门到Rap精通', 92.000);
INSERT INTO `class_register` VALUES (390, 2, '2001-11-16', '2.5年打篮球入门到Rap精通', 46.000);
INSERT INTO `class_register` VALUES (391, 1, '2017-12-05', '2.5年打篮球入门到Rap精通', 18.000);
INSERT INTO `class_register` VALUES (392, 1, '2004-08-22', '篮球教学2.5年速成', 42.000);
INSERT INTO `class_register` VALUES (393, 2, '2010-08-01', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (394, 2, '2013-02-27', '篮球教学2.5年速成', 15.000);
INSERT INTO `class_register` VALUES (395, 2, '2021-04-04', '2.5年打篮球入门到Rap精通', 71.000);
INSERT INTO `class_register` VALUES (396, 1, '2024-06-08', '篮球教学2.5年速成', 78.000);
INSERT INTO `class_register` VALUES (397, 3, '2004-02-03', '2.5年打篮球入门到Rap精通', 44.000);
INSERT INTO `class_register` VALUES (398, 3, '2013-11-20', '2.5年打篮球入门到Rap精通', 89.000);
INSERT INTO `class_register` VALUES (399, 2, '2008-08-24', '篮球教学2.5年速成', 25.000);
INSERT INTO `class_register` VALUES (400, 2, '2005-07-09', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (401, 3, '2004-05-13', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (402, 3, '2020-06-10', '篮球教学2.5年速成', 27.000);
INSERT INTO `class_register` VALUES (403, 1, '2014-02-19', '篮球教学2.5年速成', 41.000);
INSERT INTO `class_register` VALUES (404, 2, '2017-02-10', '篮球教学2.5年速成', 61.000);
INSERT INTO `class_register` VALUES (405, 1, '2017-11-23', '2.5年打篮球入门到Rap精通', 62.000);
INSERT INTO `class_register` VALUES (406, 2, '2004-08-01', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (407, 1, '2000-02-13', '篮球教学2.5年速成', 50.000);
INSERT INTO `class_register` VALUES (408, 2, '2007-08-10', '篮球教学2.5年速成', 53.000);
INSERT INTO `class_register` VALUES (409, 3, '2014-08-21', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (410, 1, '2006-11-16', '篮球教学2.5年速成', 78.000);
INSERT INTO `class_register` VALUES (411, 2, '2011-04-08', '2.5年打篮球入门到Rap精通', 62.000);
INSERT INTO `class_register` VALUES (412, 1, '2013-10-20', '篮球教学2.5年速成', 26.000);
INSERT INTO `class_register` VALUES (413, 2, '2016-04-17', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (414, 1, '2018-07-11', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (415, 1, '2010-01-17', '2.5年打篮球入门到Rap精通', 76.000);
INSERT INTO `class_register` VALUES (416, 2, '2020-07-16', '篮球教学2.5年速成', 40.000);
INSERT INTO `class_register` VALUES (417, 1, '2019-07-08', '篮球教学2.5年速成', 36.000);
INSERT INTO `class_register` VALUES (418, 3, '2007-06-08', '2.5年打篮球入门到Rap精通', 89.000);
INSERT INTO `class_register` VALUES (419, 2, '2023-08-06', '2.5年打篮球入门到Rap精通', 100.000);
INSERT INTO `class_register` VALUES (420, 3, '2004-02-27', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (421, 2, '2004-10-18', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (422, 3, '2021-03-27', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (423, 2, '2011-03-29', '篮球教学2.5年速成', 92.000);
INSERT INTO `class_register` VALUES (424, 3, '2010-11-08', '2.5年打篮球入门到Rap精通', 19.000);
INSERT INTO `class_register` VALUES (425, 2, '2017-08-11', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (426, 2, '2017-03-08', '篮球教学2.5年速成', 73.000);
INSERT INTO `class_register` VALUES (427, 3, '2005-02-26', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (428, 1, '2004-03-27', '2.5年打篮球入门到Rap精通', 70.000);
INSERT INTO `class_register` VALUES (429, 1, '2010-03-22', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (430, 1, '2011-01-16', '篮球教学2.5年速成', 29.000);
INSERT INTO `class_register` VALUES (431, 1, '2014-05-24', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (432, 2, '2012-01-22', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (433, 3, '2014-02-05', '篮球教学2.5年速成', 77.000);
INSERT INTO `class_register` VALUES (434, 3, '2007-07-23', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (435, 2, '2000-03-09', '2.5年打篮球入门到Rap精通', 99.000);
INSERT INTO `class_register` VALUES (436, 1, '2008-10-25', '篮球教学2.5年速成', 82.000);
INSERT INTO `class_register` VALUES (437, 3, '2010-10-26', '2.5年打篮球入门到Rap精通', 60.000);
INSERT INTO `class_register` VALUES (438, 3, '2010-02-05', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (439, 3, '2004-09-23', '2.5年打篮球入门到Rap精通', 88.000);
INSERT INTO `class_register` VALUES (440, 1, '2021-04-01', '2.5年打篮球入门到Rap精通', 76.000);
INSERT INTO `class_register` VALUES (441, 2, '2023-11-17', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (442, 1, '2005-11-20', '篮球教学2.5年速成', 45.000);
INSERT INTO `class_register` VALUES (443, 3, '2008-08-04', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (444, 2, '2011-02-19', '篮球教学2.5年速成', 40.000);
INSERT INTO `class_register` VALUES (445, 2, '2011-12-17', '篮球教学2.5年速成', 93.000);
INSERT INTO `class_register` VALUES (446, 1, '2004-06-11', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (447, 2, '2005-02-27', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (448, 1, '2019-09-11', '篮球教学2.5年速成', 84.000);
INSERT INTO `class_register` VALUES (449, 3, '2018-06-30', '篮球教学2.5年速成', 80.000);
INSERT INTO `class_register` VALUES (450, 3, '2013-04-20', '篮球教学2.5年速成', 67.000);
INSERT INTO `class_register` VALUES (451, 2, '2023-03-05', '篮球教学2.5年速成', 29.000);
INSERT INTO `class_register` VALUES (452, 1, '2017-01-09', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (453, 3, '2018-03-13', '2.5年打篮球入门到Rap精通', 18.000);
INSERT INTO `class_register` VALUES (454, 3, '2015-12-20', '2.5年打篮球入门到Rap精通', 96.000);
INSERT INTO `class_register` VALUES (455, 3, '2002-05-19', '2.5年打篮球入门到Rap精通', 22.000);
INSERT INTO `class_register` VALUES (456, 2, '2004-03-10', '篮球教学2.5年速成', 39.000);
INSERT INTO `class_register` VALUES (457, 3, '2006-02-04', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (458, 1, '2004-07-30', '2.5年打篮球入门到Rap精通', 17.000);
INSERT INTO `class_register` VALUES (459, 3, '2014-08-27', '篮球教学2.5年速成', 57.000);
INSERT INTO `class_register` VALUES (460, 2, '2013-01-23', '2.5年打篮球入门到Rap精通', 100.000);
INSERT INTO `class_register` VALUES (461, 1, '2009-01-13', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (462, 3, '2024-06-22', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (463, 1, '2012-12-13', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (464, 2, '2011-10-29', '2.5年打篮球入门到Rap精通', 67.000);
INSERT INTO `class_register` VALUES (465, 1, '2008-05-15', '篮球教学2.5年速成', 46.000);
INSERT INTO `class_register` VALUES (466, 3, '2010-01-21', '篮球教学2.5年速成', 66.000);
INSERT INTO `class_register` VALUES (467, 3, '2012-12-02', '篮球教学2.5年速成', 84.000);
INSERT INTO `class_register` VALUES (468, 2, '2020-11-14', '篮球教学2.5年速成', 87.000);
INSERT INTO `class_register` VALUES (469, 2, '2008-06-23', '2.5年打篮球入门到Rap精通', 89.000);
INSERT INTO `class_register` VALUES (470, 2, '2001-02-09', '2.5年打篮球入门到Rap精通', 40.000);
INSERT INTO `class_register` VALUES (471, 3, '2011-09-05', '2.5年打篮球入门到Rap精通', 22.000);
INSERT INTO `class_register` VALUES (472, 3, '2000-12-18', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (473, 1, '2003-10-19', '篮球教学2.5年速成', 15.000);
INSERT INTO `class_register` VALUES (474, 2, '2014-12-09', '2.5年打篮球入门到Rap精通', 82.000);
INSERT INTO `class_register` VALUES (475, 1, '2020-06-28', '2.5年打篮球入门到Rap精通', 34.000);
INSERT INTO `class_register` VALUES (476, 2, '2006-12-20', '2.5年打篮球入门到Rap精通', 78.000);
INSERT INTO `class_register` VALUES (477, 2, '2014-12-21', '篮球教学2.5年速成', 92.000);
INSERT INTO `class_register` VALUES (478, 2, '2021-08-01', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (479, 1, '2020-08-28', '篮球教学2.5年速成', 53.000);
INSERT INTO `class_register` VALUES (480, 3, '2022-12-31', '2.5年打篮球入门到Rap精通', 11.000);
INSERT INTO `class_register` VALUES (481, 2, '2015-07-17', '篮球教学2.5年速成', 95.000);
INSERT INTO `class_register` VALUES (482, 2, '2002-04-26', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (483, 1, '2013-05-21', '篮球教学2.5年速成', 99.000);
INSERT INTO `class_register` VALUES (484, 3, '2012-05-20', '篮球教学2.5年速成', 68.000);
INSERT INTO `class_register` VALUES (485, 1, '2017-10-09', '篮球教学2.5年速成', 24.000);
INSERT INTO `class_register` VALUES (486, 1, '2008-11-30', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (487, 2, '2008-02-22', '篮球教学2.5年速成', 62.000);
INSERT INTO `class_register` VALUES (488, 2, '2021-01-18', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (489, 2, '2021-12-16', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (490, 3, '2007-11-03', '2.5年打篮球入门到Rap精通', 62.000);
INSERT INTO `class_register` VALUES (491, 3, '2004-11-17', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (492, 2, '2009-09-19', '2.5年打篮球入门到Rap精通', 68.000);
INSERT INTO `class_register` VALUES (493, 1, '2009-05-15', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (494, 1, '2005-09-08', '2.5年打篮球入门到Rap精通', 69.000);
INSERT INTO `class_register` VALUES (495, 1, '2011-01-28', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (496, 1, '2008-09-13', '2.5年打篮球入门到Rap精通', 14.000);
INSERT INTO `class_register` VALUES (497, 3, '2009-04-27', '2.5年打篮球入门到Rap精通', 87.000);
INSERT INTO `class_register` VALUES (498, 1, '2017-01-15', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (499, 1, '2017-04-12', '篮球教学2.5年速成', 51.000);
INSERT INTO `class_register` VALUES (500, 3, '2011-06-09', '2.5年打篮球入门到Rap精通', 27.000);
INSERT INTO `class_register` VALUES (501, 2, '2001-10-08', '2.5年打篮球入门到Rap精通', 68.000);
INSERT INTO `class_register` VALUES (502, 1, '2007-11-17', '2.5年打篮球入门到Rap精通', 96.000);
INSERT INTO `class_register` VALUES (503, 3, '2020-08-03', '2.5年打篮球入门到Rap精通', 73.000);
INSERT INTO `class_register` VALUES (504, 2, '2009-07-23', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (505, 3, '2009-03-25', '篮球教学2.5年速成', 78.000);
INSERT INTO `class_register` VALUES (506, 2, '2020-08-07', '2.5年打篮球入门到Rap精通', 55.000);
INSERT INTO `class_register` VALUES (507, 3, '2022-09-23', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (508, 1, '2021-08-29', '2.5年打篮球入门到Rap精通', 38.000);
INSERT INTO `class_register` VALUES (509, 1, '2021-07-06', '篮球教学2.5年速成', 56.000);
INSERT INTO `class_register` VALUES (510, 1, '2017-07-10', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (511, 1, '2007-08-15', '2.5年打篮球入门到Rap精通', 59.000);
INSERT INTO `class_register` VALUES (512, 1, '2023-06-10', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (513, 3, '2002-06-29', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (514, 3, '2024-10-06', '篮球教学2.5年速成', 79.000);
INSERT INTO `class_register` VALUES (515, 2, '2002-12-24', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (516, 2, '2014-03-12', '2.5年打篮球入门到Rap精通', 44.000);
INSERT INTO `class_register` VALUES (517, 1, '2012-03-11', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (518, 1, '2021-08-10', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (519, 1, '2003-06-05', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (520, 3, '2024-10-31', '篮球教学2.5年速成', 82.000);
INSERT INTO `class_register` VALUES (521, 2, '2002-02-11', '篮球教学2.5年速成', 36.000);
INSERT INTO `class_register` VALUES (522, 3, '2009-04-07', '2.5年打篮球入门到Rap精通', 61.000);
INSERT INTO `class_register` VALUES (523, 2, '2011-09-22', '篮球教学2.5年速成', 65.000);
INSERT INTO `class_register` VALUES (524, 1, '2020-09-26', '2.5年打篮球入门到Rap精通', 52.000);
INSERT INTO `class_register` VALUES (525, 2, '2000-04-21', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (526, 1, '2024-10-17', '2.5年打篮球入门到Rap精通', 22.000);
INSERT INTO `class_register` VALUES (527, 1, '2017-11-03', '篮球教学2.5年速成', 40.000);
INSERT INTO `class_register` VALUES (528, 3, '2012-11-13', '篮球教学2.5年速成', 67.000);
INSERT INTO `class_register` VALUES (529, 1, '2002-04-27', '2.5年打篮球入门到Rap精通', 42.000);
INSERT INTO `class_register` VALUES (530, 1, '2019-09-27', '2.5年打篮球入门到Rap精通', 71.000);
INSERT INTO `class_register` VALUES (531, 3, '2017-03-23', '篮球教学2.5年速成', 25.000);
INSERT INTO `class_register` VALUES (532, 3, '2002-09-15', '2.5年打篮球入门到Rap精通', 54.000);
INSERT INTO `class_register` VALUES (533, 3, '2023-07-07', '2.5年打篮球入门到Rap精通', 71.000);
INSERT INTO `class_register` VALUES (534, 1, '2006-04-08', '2.5年打篮球入门到Rap精通', 35.000);
INSERT INTO `class_register` VALUES (535, 2, '2004-11-30', '篮球教学2.5年速成', 89.000);
INSERT INTO `class_register` VALUES (536, 2, '2022-02-01', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (537, 1, '2016-02-23', '篮球教学2.5年速成', 49.000);
INSERT INTO `class_register` VALUES (538, 2, '2023-01-06', '2.5年打篮球入门到Rap精通', 71.000);
INSERT INTO `class_register` VALUES (539, 3, '2021-08-18', '2.5年打篮球入门到Rap精通', 99.000);
INSERT INTO `class_register` VALUES (540, 3, '2022-03-04', '篮球教学2.5年速成', 86.000);
INSERT INTO `class_register` VALUES (541, 2, '2013-12-24', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (542, 3, '2004-09-05', '篮球教学2.5年速成', 85.000);
INSERT INTO `class_register` VALUES (543, 3, '2005-03-25', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (544, 1, '2006-02-10', '2.5年打篮球入门到Rap精通', 28.000);
INSERT INTO `class_register` VALUES (545, 1, '2000-04-28', '2.5年打篮球入门到Rap精通', 31.000);
INSERT INTO `class_register` VALUES (546, 3, '2013-11-19', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (547, 1, '2010-06-09', '2.5年打篮球入门到Rap精通', 32.000);
INSERT INTO `class_register` VALUES (548, 1, '2015-04-28', '2.5年打篮球入门到Rap精通', 49.000);
INSERT INTO `class_register` VALUES (549, 1, '2020-08-08', '2.5年打篮球入门到Rap精通', 41.000);
INSERT INTO `class_register` VALUES (550, 2, '2006-10-24', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (551, 2, '2019-03-09', '篮球教学2.5年速成', 36.000);
INSERT INTO `class_register` VALUES (552, 3, '2020-07-05', '篮球教学2.5年速成', 74.000);
INSERT INTO `class_register` VALUES (553, 3, '2014-07-14', '2.5年打篮球入门到Rap精通', 54.000);
INSERT INTO `class_register` VALUES (554, 1, '2011-12-29', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (555, 2, '2007-07-06', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (556, 3, '2002-07-07', '篮球教学2.5年速成', 12.000);
INSERT INTO `class_register` VALUES (557, 2, '2000-03-20', '2.5年打篮球入门到Rap精通', 47.000);
INSERT INTO `class_register` VALUES (558, 2, '2013-09-22', '2.5年打篮球入门到Rap精通', 28.000);
INSERT INTO `class_register` VALUES (559, 1, '2012-08-16', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (560, 3, '2001-01-26', '2.5年打篮球入门到Rap精通', 38.000);
INSERT INTO `class_register` VALUES (561, 2, '2006-03-01', '篮球教学2.5年速成', 37.000);
INSERT INTO `class_register` VALUES (562, 2, '2023-08-11', '篮球教学2.5年速成', 60.000);
INSERT INTO `class_register` VALUES (563, 1, '2015-01-25', '篮球教学2.5年速成', 68.000);
INSERT INTO `class_register` VALUES (564, 2, '2019-03-10', '2.5年打篮球入门到Rap精通', 100.000);
INSERT INTO `class_register` VALUES (565, 2, '2013-02-02', '2.5年打篮球入门到Rap精通', 52.000);
INSERT INTO `class_register` VALUES (566, 1, '2014-12-19', '篮球教学2.5年速成', 14.000);
INSERT INTO `class_register` VALUES (567, 3, '2010-01-15', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (568, 2, '2008-08-29', '2.5年打篮球入门到Rap精通', 22.000);
INSERT INTO `class_register` VALUES (569, 3, '2003-10-06', '篮球教学2.5年速成', 100.000);
INSERT INTO `class_register` VALUES (570, 2, '2012-01-22', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (571, 3, '2016-02-04', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (572, 1, '2022-06-26', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (573, 1, '2018-03-31', '篮球教学2.5年速成', 50.000);
INSERT INTO `class_register` VALUES (574, 3, '2004-07-29', '2.5年打篮球入门到Rap精通', 17.000);
INSERT INTO `class_register` VALUES (575, 2, '2005-02-22', '篮球教学2.5年速成', 73.000);
INSERT INTO `class_register` VALUES (576, 2, '2014-04-11', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (577, 3, '2013-05-26', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (578, 2, '2007-01-08', '2.5年打篮球入门到Rap精通', 12.000);
INSERT INTO `class_register` VALUES (579, 1, '2012-02-28', '2.5年打篮球入门到Rap精通', 87.000);
INSERT INTO `class_register` VALUES (580, 2, '2011-01-22', '2.5年打篮球入门到Rap精通', 92.000);
INSERT INTO `class_register` VALUES (581, 1, '2009-05-24', '篮球教学2.5年速成', 65.000);
INSERT INTO `class_register` VALUES (582, 2, '2013-09-10', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (583, 1, '2002-12-06', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (584, 1, '2022-01-22', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (585, 3, '2023-09-27', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (586, 1, '2022-10-18', '篮球教学2.5年速成', 34.000);
INSERT INTO `class_register` VALUES (587, 2, '2008-03-11', '篮球教学2.5年速成', 74.000);
INSERT INTO `class_register` VALUES (588, 2, '2017-01-22', '篮球教学2.5年速成', 79.000);
INSERT INTO `class_register` VALUES (589, 3, '2024-05-06', '篮球教学2.5年速成', 45.000);
INSERT INTO `class_register` VALUES (590, 2, '2000-06-04', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (591, 1, '2002-06-16', '篮球教学2.5年速成', 78.000);
INSERT INTO `class_register` VALUES (592, 2, '2009-12-19', '篮球教学2.5年速成', 46.000);
INSERT INTO `class_register` VALUES (593, 1, '2009-05-30', '2.5年打篮球入门到Rap精通', 18.000);
INSERT INTO `class_register` VALUES (594, 3, '2019-11-17', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (595, 3, '2007-06-12', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (596, 2, '2023-12-28', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (597, 1, '2014-04-12', '篮球教学2.5年速成', 56.000);
INSERT INTO `class_register` VALUES (598, 3, '2002-01-04', '篮球教学2.5年速成', 38.000);
INSERT INTO `class_register` VALUES (599, 2, '2018-10-06', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (600, 1, '2002-12-06', '2.5年打篮球入门到Rap精通', 47.000);
INSERT INTO `class_register` VALUES (601, 3, '2003-05-25', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (602, 2, '2005-07-08', '篮球教学2.5年速成', 61.000);
INSERT INTO `class_register` VALUES (603, 2, '2023-10-28', '篮球教学2.5年速成', 74.000);
INSERT INTO `class_register` VALUES (604, 1, '2007-11-19', '篮球教学2.5年速成', 16.000);
INSERT INTO `class_register` VALUES (605, 3, '2010-12-22', '2.5年打篮球入门到Rap精通', 28.000);
INSERT INTO `class_register` VALUES (606, 2, '2010-11-15', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (607, 1, '2002-10-08', '篮球教学2.5年速成', 11.000);
INSERT INTO `class_register` VALUES (608, 3, '2000-05-07', '2.5年打篮球入门到Rap精通', 36.000);
INSERT INTO `class_register` VALUES (609, 3, '2001-08-12', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (610, 3, '2020-08-05', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (611, 1, '2001-10-19', '2.5年打篮球入门到Rap精通', 87.000);
INSERT INTO `class_register` VALUES (612, 3, '2018-07-12', '2.5年打篮球入门到Rap精通', 96.000);
INSERT INTO `class_register` VALUES (613, 2, '2012-03-16', '2.5年打篮球入门到Rap精通', 58.000);
INSERT INTO `class_register` VALUES (614, 2, '2011-09-22', '2.5年打篮球入门到Rap精通', 78.000);
INSERT INTO `class_register` VALUES (615, 1, '2017-04-22', '篮球教学2.5年速成', 25.000);
INSERT INTO `class_register` VALUES (616, 1, '2013-09-29', '2.5年打篮球入门到Rap精通', 63.000);
INSERT INTO `class_register` VALUES (617, 3, '2019-05-31', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (618, 1, '2005-11-21', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (619, 1, '2015-01-02', '2.5年打篮球入门到Rap精通', 70.000);
INSERT INTO `class_register` VALUES (620, 2, '2011-02-04', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (621, 3, '2014-08-14', '篮球教学2.5年速成', 25.000);
INSERT INTO `class_register` VALUES (622, 2, '2005-01-08', '2.5年打篮球入门到Rap精通', 34.000);
INSERT INTO `class_register` VALUES (623, 2, '2007-02-19', '篮球教学2.5年速成', 90.000);
INSERT INTO `class_register` VALUES (624, 1, '2007-07-26', '2.5年打篮球入门到Rap精通', 89.000);
INSERT INTO `class_register` VALUES (625, 1, '2015-02-04', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (626, 1, '2012-10-14', '2.5年打篮球入门到Rap精通', 48.000);
INSERT INTO `class_register` VALUES (627, 2, '2005-12-10', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (628, 3, '2006-08-09', '篮球教学2.5年速成', 90.000);
INSERT INTO `class_register` VALUES (629, 2, '2015-06-23', '2.5年打篮球入门到Rap精通', 74.000);
INSERT INTO `class_register` VALUES (630, 1, '2021-09-25', '篮球教学2.5年速成', 15.000);
INSERT INTO `class_register` VALUES (631, 1, '2002-02-16', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (632, 2, '2009-01-27', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (633, 3, '2010-06-24', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (634, 2, '2013-06-02', '篮球教学2.5年速成', 19.000);
INSERT INTO `class_register` VALUES (635, 1, '2010-05-13', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (636, 2, '2024-09-25', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (637, 3, '2011-10-16', '篮球教学2.5年速成', 88.000);
INSERT INTO `class_register` VALUES (638, 3, '2021-11-30', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (639, 3, '2016-10-25', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (640, 1, '2023-06-01', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (641, 3, '2012-04-04', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (642, 2, '2008-09-24', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (643, 2, '2017-04-08', '篮球教学2.5年速成', 45.000);
INSERT INTO `class_register` VALUES (644, 2, '2003-09-20', '篮球教学2.5年速成', 89.000);
INSERT INTO `class_register` VALUES (645, 1, '2010-07-07', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (646, 2, '2000-03-23', '2.5年打篮球入门到Rap精通', 25.000);
INSERT INTO `class_register` VALUES (647, 3, '2013-08-04', '篮球教学2.5年速成', 75.000);
INSERT INTO `class_register` VALUES (648, 3, '2007-11-05', '2.5年打篮球入门到Rap精通', 70.000);
INSERT INTO `class_register` VALUES (649, 2, '2020-01-01', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (650, 1, '2004-01-03', '篮球教学2.5年速成', 90.000);
INSERT INTO `class_register` VALUES (651, 2, '2022-08-25', '篮球教学2.5年速成', 67.000);
INSERT INTO `class_register` VALUES (652, 3, '2015-01-16', '篮球教学2.5年速成', 46.000);
INSERT INTO `class_register` VALUES (653, 3, '2007-02-07', '篮球教学2.5年速成', 75.000);
INSERT INTO `class_register` VALUES (654, 2, '2010-10-23', '篮球教学2.5年速成', 56.000);
INSERT INTO `class_register` VALUES (655, 1, '2021-10-12', '2.5年打篮球入门到Rap精通', 24.000);
INSERT INTO `class_register` VALUES (656, 1, '2014-10-02', '篮球教学2.5年速成', 74.000);
INSERT INTO `class_register` VALUES (657, 2, '2002-05-15', '2.5年打篮球入门到Rap精通', 96.000);
INSERT INTO `class_register` VALUES (658, 1, '2009-01-25', '2.5年打篮球入门到Rap精通', 98.000);
INSERT INTO `class_register` VALUES (659, 1, '2004-02-04', '篮球教学2.5年速成', 84.000);
INSERT INTO `class_register` VALUES (660, 2, '2005-10-03', '篮球教学2.5年速成', 33.000);
INSERT INTO `class_register` VALUES (661, 3, '2003-09-09', '2.5年打篮球入门到Rap精通', 41.000);
INSERT INTO `class_register` VALUES (662, 1, '2021-06-23', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (663, 2, '2001-07-26', '2.5年打篮球入门到Rap精通', 18.000);
INSERT INTO `class_register` VALUES (664, 2, '2004-01-25', '2.5年打篮球入门到Rap精通', 11.000);
INSERT INTO `class_register` VALUES (665, 3, '2005-09-15', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (666, 1, '2024-01-24', '篮球教学2.5年速成', 18.000);
INSERT INTO `class_register` VALUES (667, 3, '2003-12-31', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (668, 2, '2008-06-19', '2.5年打篮球入门到Rap精通', 67.000);
INSERT INTO `class_register` VALUES (669, 1, '2014-02-27', '2.5年打篮球入门到Rap精通', 27.000);
INSERT INTO `class_register` VALUES (670, 1, '2016-01-17', '2.5年打篮球入门到Rap精通', 17.000);
INSERT INTO `class_register` VALUES (671, 1, '2018-05-12', '篮球教学2.5年速成', 80.000);
INSERT INTO `class_register` VALUES (672, 2, '2020-05-13', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (673, 1, '2022-01-13', '2.5年打篮球入门到Rap精通', 17.000);
INSERT INTO `class_register` VALUES (674, 3, '2024-02-21', '篮球教学2.5年速成', 93.000);
INSERT INTO `class_register` VALUES (675, 1, '2018-04-09', '2.5年打篮球入门到Rap精通', 62.000);
INSERT INTO `class_register` VALUES (676, 1, '2003-04-18', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (677, 3, '2009-12-12', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (678, 3, '2021-03-06', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (679, 1, '2013-08-15', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (680, 2, '2006-11-11', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (681, 1, '2001-01-03', '篮球教学2.5年速成', 57.000);
INSERT INTO `class_register` VALUES (682, 1, '2009-07-31', '2.5年打篮球入门到Rap精通', 51.000);
INSERT INTO `class_register` VALUES (683, 1, '2005-11-15', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (684, 1, '2011-08-02', '篮球教学2.5年速成', 100.000);
INSERT INTO `class_register` VALUES (685, 3, '2006-05-20', '篮球教学2.5年速成', 34.000);
INSERT INTO `class_register` VALUES (686, 3, '2020-10-08', '篮球教学2.5年速成', 74.000);
INSERT INTO `class_register` VALUES (687, 3, '2024-09-09', '2.5年打篮球入门到Rap精通', 54.000);
INSERT INTO `class_register` VALUES (688, 1, '2000-10-03', '2.5年打篮球入门到Rap精通', 71.000);
INSERT INTO `class_register` VALUES (689, 1, '2011-12-27', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (690, 3, '2005-05-25', '篮球教学2.5年速成', 46.000);
INSERT INTO `class_register` VALUES (691, 3, '2004-08-25', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (692, 3, '2000-04-02', '篮球教学2.5年速成', 11.000);
INSERT INTO `class_register` VALUES (693, 2, '2004-07-27', '篮球教学2.5年速成', 40.000);
INSERT INTO `class_register` VALUES (694, 3, '2000-07-22', '2.5年打篮球入门到Rap精通', 92.000);
INSERT INTO `class_register` VALUES (695, 3, '2018-01-27', '2.5年打篮球入门到Rap精通', 73.000);
INSERT INTO `class_register` VALUES (696, 2, '2023-08-21', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (697, 3, '2021-03-05', '篮球教学2.5年速成', 28.000);
INSERT INTO `class_register` VALUES (698, 3, '2007-02-15', '篮球教学2.5年速成', 68.000);
INSERT INTO `class_register` VALUES (699, 1, '2007-01-19', '篮球教学2.5年速成', 60.000);
INSERT INTO `class_register` VALUES (700, 1, '2013-08-07', '2.5年打篮球入门到Rap精通', 84.000);
INSERT INTO `class_register` VALUES (701, 3, '2018-05-18', '2.5年打篮球入门到Rap精通', 54.000);
INSERT INTO `class_register` VALUES (702, 3, '2017-03-20', '篮球教学2.5年速成', 65.000);
INSERT INTO `class_register` VALUES (703, 1, '2008-11-30', '2.5年打篮球入门到Rap精通', 74.000);
INSERT INTO `class_register` VALUES (704, 2, '2003-11-13', '2.5年打篮球入门到Rap精通', 34.000);
INSERT INTO `class_register` VALUES (705, 1, '2007-02-16', '篮球教学2.5年速成', 52.000);
INSERT INTO `class_register` VALUES (706, 2, '2008-05-16', '篮球教学2.5年速成', 77.000);
INSERT INTO `class_register` VALUES (707, 3, '2018-01-09', '篮球教学2.5年速成', 12.000);
INSERT INTO `class_register` VALUES (708, 2, '2005-04-21', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (709, 3, '2002-03-01', '篮球教学2.5年速成', 35.000);
INSERT INTO `class_register` VALUES (710, 1, '2009-10-04', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (711, 1, '2004-04-02', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (712, 2, '2023-04-10', '2.5年打篮球入门到Rap精通', 31.000);
INSERT INTO `class_register` VALUES (713, 2, '2007-04-17', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (714, 3, '2004-12-24', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (715, 2, '2022-03-18', '2.5年打篮球入门到Rap精通', 44.000);
INSERT INTO `class_register` VALUES (716, 1, '2000-11-08', '2.5年打篮球入门到Rap精通', 63.000);
INSERT INTO `class_register` VALUES (717, 1, '2024-05-10', '篮球教学2.5年速成', 29.000);
INSERT INTO `class_register` VALUES (718, 3, '2006-04-15', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (719, 2, '2014-09-17', '2.5年打篮球入门到Rap精通', 35.000);
INSERT INTO `class_register` VALUES (720, 3, '2010-08-14', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (721, 3, '2001-09-02', '2.5年打篮球入门到Rap精通', 78.000);
INSERT INTO `class_register` VALUES (722, 1, '2018-11-18', '2.5年打篮球入门到Rap精通', 91.000);
INSERT INTO `class_register` VALUES (723, 3, '2015-01-06', '2.5年打篮球入门到Rap精通', 91.000);
INSERT INTO `class_register` VALUES (724, 2, '2024-11-30', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (725, 2, '2017-02-27', '篮球教学2.5年速成', 14.000);
INSERT INTO `class_register` VALUES (726, 3, '2004-01-15', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (727, 1, '2021-01-27', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (728, 3, '2024-06-19', '2.5年打篮球入门到Rap精通', 40.000);
INSERT INTO `class_register` VALUES (729, 2, '2019-09-11', '篮球教学2.5年速成', 49.000);
INSERT INTO `class_register` VALUES (730, 1, '2002-01-02', '2.5年打篮球入门到Rap精通', 15.000);
INSERT INTO `class_register` VALUES (731, 2, '2009-09-23', '2.5年打篮球入门到Rap精通', 84.000);
INSERT INTO `class_register` VALUES (732, 2, '2021-04-02', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (733, 2, '2017-01-06', '2.5年打篮球入门到Rap精通', 53.000);
INSERT INTO `class_register` VALUES (734, 1, '2012-03-18', '篮球教学2.5年速成', 58.000);
INSERT INTO `class_register` VALUES (735, 2, '2019-07-08', '篮球教学2.5年速成', 80.000);
INSERT INTO `class_register` VALUES (736, 2, '2021-09-08', '篮球教学2.5年速成', 16.000);
INSERT INTO `class_register` VALUES (737, 1, '2010-07-31', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (738, 3, '2011-11-19', '篮球教学2.5年速成', 60.000);
INSERT INTO `class_register` VALUES (739, 2, '2024-08-29', '篮球教学2.5年速成', 32.000);
INSERT INTO `class_register` VALUES (740, 3, '2007-04-07', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (741, 3, '2010-04-21', '2.5年打篮球入门到Rap精通', 40.000);
INSERT INTO `class_register` VALUES (742, 1, '2005-04-19', '篮球教学2.5年速成', 81.000);
INSERT INTO `class_register` VALUES (743, 1, '2008-01-10', '篮球教学2.5年速成', 16.000);
INSERT INTO `class_register` VALUES (744, 2, '2015-02-18', '篮球教学2.5年速成', 82.000);
INSERT INTO `class_register` VALUES (745, 2, '2000-02-23', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (746, 1, '2007-01-20', '篮球教学2.5年速成', 64.000);
INSERT INTO `class_register` VALUES (747, 1, '2013-12-08', '2.5年打篮球入门到Rap精通', 60.000);
INSERT INTO `class_register` VALUES (748, 3, '2015-12-28', '2.5年打篮球入门到Rap精通', 14.000);
INSERT INTO `class_register` VALUES (749, 3, '2021-01-01', '2.5年打篮球入门到Rap精通', 59.000);
INSERT INTO `class_register` VALUES (750, 1, '2016-09-27', '篮球教学2.5年速成', 56.000);
INSERT INTO `class_register` VALUES (751, 1, '2004-12-30', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (752, 3, '2012-07-10', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (753, 1, '2020-12-29', '2.5年打篮球入门到Rap精通', 21.000);
INSERT INTO `class_register` VALUES (754, 2, '2016-08-13', '篮球教学2.5年速成', 28.000);
INSERT INTO `class_register` VALUES (755, 3, '2019-02-06', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (756, 3, '2007-09-14', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (757, 3, '2003-03-12', '篮球教学2.5年速成', 85.000);
INSERT INTO `class_register` VALUES (758, 3, '2007-12-20', '2.5年打篮球入门到Rap精通', 62.000);
INSERT INTO `class_register` VALUES (759, 3, '2017-09-09', '2.5年打篮球入门到Rap精通', 49.000);
INSERT INTO `class_register` VALUES (760, 2, '2021-07-30', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (761, 3, '2017-01-17', '2.5年打篮球入门到Rap精通', 56.000);
INSERT INTO `class_register` VALUES (762, 1, '2012-10-31', '2.5年打篮球入门到Rap精通', 25.000);
INSERT INTO `class_register` VALUES (763, 2, '2003-10-14', '篮球教学2.5年速成', 86.000);
INSERT INTO `class_register` VALUES (764, 1, '2000-09-16', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (765, 2, '2020-08-08', '2.5年打篮球入门到Rap精通', 69.000);
INSERT INTO `class_register` VALUES (766, 2, '2000-07-09', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (767, 1, '2012-01-01', '2.5年打篮球入门到Rap精通', 64.000);
INSERT INTO `class_register` VALUES (768, 3, '2023-09-28', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (769, 1, '2011-12-18', '2.5年打篮球入门到Rap精通', 39.000);
INSERT INTO `class_register` VALUES (770, 1, '2004-06-28', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (771, 1, '2012-08-18', '篮球教学2.5年速成', 99.000);
INSERT INTO `class_register` VALUES (772, 2, '2011-06-08', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (773, 1, '2005-11-22', '篮球教学2.5年速成', 86.000);
INSERT INTO `class_register` VALUES (774, 2, '2008-02-28', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (775, 2, '2011-06-17', '篮球教学2.5年速成', 92.000);
INSERT INTO `class_register` VALUES (776, 1, '2022-07-29', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (777, 2, '2006-03-25', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (778, 1, '2014-03-23', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (779, 2, '2003-08-01', '2.5年打篮球入门到Rap精通', 94.000);
INSERT INTO `class_register` VALUES (780, 2, '2009-10-18', '篮球教学2.5年速成', 45.000);
INSERT INTO `class_register` VALUES (781, 2, '2019-12-26', '2.5年打篮球入门到Rap精通', 28.000);
INSERT INTO `class_register` VALUES (782, 1, '2020-10-07', '篮球教学2.5年速成', 40.000);
INSERT INTO `class_register` VALUES (783, 1, '2009-01-30', '篮球教学2.5年速成', 89.000);
INSERT INTO `class_register` VALUES (784, 2, '2015-01-02', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (785, 3, '2008-02-29', '2.5年打篮球入门到Rap精通', 21.000);
INSERT INTO `class_register` VALUES (786, 3, '2019-11-08', '2.5年打篮球入门到Rap精通', 87.000);
INSERT INTO `class_register` VALUES (787, 3, '2016-01-16', '2.5年打篮球入门到Rap精通', 88.000);
INSERT INTO `class_register` VALUES (788, 3, '2003-06-02', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (789, 1, '2004-01-19', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (790, 1, '2003-03-08', '篮球教学2.5年速成', 51.000);
INSERT INTO `class_register` VALUES (791, 3, '2019-02-12', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (792, 2, '2018-08-12', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (793, 3, '2017-11-05', '2.5年打篮球入门到Rap精通', 29.000);
INSERT INTO `class_register` VALUES (794, 3, '2003-04-01', '篮球教学2.5年速成', 52.000);
INSERT INTO `class_register` VALUES (795, 1, '2007-03-27', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (796, 3, '2005-05-14', '2.5年打篮球入门到Rap精通', 51.000);
INSERT INTO `class_register` VALUES (797, 1, '2000-09-22', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (798, 3, '2024-01-08', '2.5年打篮球入门到Rap精通', 46.000);
INSERT INTO `class_register` VALUES (799, 2, '2024-08-06', '篮球教学2.5年速成', 38.000);
INSERT INTO `class_register` VALUES (800, 3, '2023-09-26', '2.5年打篮球入门到Rap精通', 25.000);
INSERT INTO `class_register` VALUES (801, 1, '2020-05-05', '篮球教学2.5年速成', 30.000);
INSERT INTO `class_register` VALUES (802, 1, '2024-07-18', '篮球教学2.5年速成', 27.000);
INSERT INTO `class_register` VALUES (803, 2, '2015-02-25', '篮球教学2.5年速成', 21.000);
INSERT INTO `class_register` VALUES (804, 2, '2016-12-14', '2.5年打篮球入门到Rap精通', 52.000);
INSERT INTO `class_register` VALUES (805, 3, '2002-11-10', '2.5年打篮球入门到Rap精通', 55.000);
INSERT INTO `class_register` VALUES (806, 2, '2011-09-26', '2.5年打篮球入门到Rap精通', 20.000);
INSERT INTO `class_register` VALUES (807, 3, '2022-02-09', '2.5年打篮球入门到Rap精通', 22.000);
INSERT INTO `class_register` VALUES (808, 3, '2011-04-05', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (809, 3, '2005-01-04', '篮球教学2.5年速成', 59.000);
INSERT INTO `class_register` VALUES (810, 1, '2002-07-28', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (811, 1, '2016-05-12', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (812, 2, '2011-08-14', '2.5年打篮球入门到Rap精通', 85.000);
INSERT INTO `class_register` VALUES (813, 1, '2004-04-07', '2.5年打篮球入门到Rap精通', 40.000);
INSERT INTO `class_register` VALUES (814, 3, '2015-05-15', '篮球教学2.5年速成', 14.000);
INSERT INTO `class_register` VALUES (815, 1, '2023-02-11', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (816, 1, '2005-12-15', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (817, 3, '2023-06-23', '篮球教学2.5年速成', 51.000);
INSERT INTO `class_register` VALUES (818, 2, '2022-12-02', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (819, 3, '2017-05-08', '2.5年打篮球入门到Rap精通', 38.000);
INSERT INTO `class_register` VALUES (820, 1, '2017-09-13', '篮球教学2.5年速成', 39.000);
INSERT INTO `class_register` VALUES (821, 2, '2009-10-31', '2.5年打篮球入门到Rap精通', 33.000);
INSERT INTO `class_register` VALUES (822, 2, '2020-10-15', '2.5年打篮球入门到Rap精通', 74.000);
INSERT INTO `class_register` VALUES (823, 2, '2007-07-03', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (824, 2, '2005-11-23', '2.5年打篮球入门到Rap精通', 27.000);
INSERT INTO `class_register` VALUES (825, 2, '2013-12-26', '2.5年打篮球入门到Rap精通', 38.000);
INSERT INTO `class_register` VALUES (826, 1, '2006-02-06', '篮球教学2.5年速成', 15.000);
INSERT INTO `class_register` VALUES (827, 2, '2004-05-21', '篮球教学2.5年速成', 29.000);
INSERT INTO `class_register` VALUES (828, 1, '2008-09-28', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (829, 2, '2009-08-02', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (830, 1, '2002-02-10', '篮球教学2.5年速成', 83.000);
INSERT INTO `class_register` VALUES (831, 3, '2003-10-03', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (832, 2, '2020-02-03', '篮球教学2.5年速成', 21.000);
INSERT INTO `class_register` VALUES (833, 1, '2010-05-11', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (834, 1, '2006-11-27', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (835, 1, '2011-09-13', '篮球教学2.5年速成', 66.000);
INSERT INTO `class_register` VALUES (836, 2, '2023-08-27', '篮球教学2.5年速成', 61.000);
INSERT INTO `class_register` VALUES (837, 1, '2003-11-08', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (838, 2, '2001-12-25', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (839, 1, '2015-06-13', '2.5年打篮球入门到Rap精通', 11.000);
INSERT INTO `class_register` VALUES (840, 1, '2021-09-03', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (841, 1, '2009-04-25', '2.5年打篮球入门到Rap精通', 22.000);
INSERT INTO `class_register` VALUES (842, 3, '2002-01-21', '篮球教学2.5年速成', 99.000);
INSERT INTO `class_register` VALUES (843, 1, '2023-08-23', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (844, 3, '2021-07-27', '2.5年打篮球入门到Rap精通', 44.000);
INSERT INTO `class_register` VALUES (845, 2, '2017-05-31', '篮球教学2.5年速成', 81.000);
INSERT INTO `class_register` VALUES (846, 3, '2004-02-14', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (847, 3, '2004-10-21', '2.5年打篮球入门到Rap精通', 48.000);
INSERT INTO `class_register` VALUES (848, 3, '2018-05-26', '篮球教学2.5年速成', 99.000);
INSERT INTO `class_register` VALUES (849, 1, '2015-09-04', '篮球教学2.5年速成', 56.000);
INSERT INTO `class_register` VALUES (850, 1, '2004-05-25', '篮球教学2.5年速成', 57.000);
INSERT INTO `class_register` VALUES (851, 2, '2006-05-21', '篮球教学2.5年速成', 11.000);
INSERT INTO `class_register` VALUES (852, 3, '2009-07-19', '篮球教学2.5年速成', 10.000);
INSERT INTO `class_register` VALUES (853, 1, '2006-06-04', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (854, 3, '2011-06-05', '篮球教学2.5年速成', 66.000);
INSERT INTO `class_register` VALUES (855, 1, '2014-10-08', '篮球教学2.5年速成', 22.000);
INSERT INTO `class_register` VALUES (856, 1, '2024-10-07', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (857, 2, '2020-10-21', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (858, 1, '2000-02-18', '篮球教学2.5年速成', 48.000);
INSERT INTO `class_register` VALUES (859, 3, '2000-08-29', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (860, 3, '2003-12-04', '篮球教学2.5年速成', 28.000);
INSERT INTO `class_register` VALUES (861, 2, '2001-07-22', '2.5年打篮球入门到Rap精通', 35.000);
INSERT INTO `class_register` VALUES (862, 3, '2004-04-22', '2.5年打篮球入门到Rap精通', 85.000);
INSERT INTO `class_register` VALUES (863, 2, '2013-02-01', '篮球教学2.5年速成', 88.000);
INSERT INTO `class_register` VALUES (864, 1, '2008-10-16', '2.5年打篮球入门到Rap精通', 11.000);
INSERT INTO `class_register` VALUES (865, 3, '2020-07-29', '篮球教学2.5年速成', 50.000);
INSERT INTO `class_register` VALUES (866, 3, '2008-08-09', '篮球教学2.5年速成', 99.000);
INSERT INTO `class_register` VALUES (867, 1, '2014-08-01', '2.5年打篮球入门到Rap精通', 76.000);
INSERT INTO `class_register` VALUES (868, 1, '2022-03-20', '2.5年打篮球入门到Rap精通', 70.000);
INSERT INTO `class_register` VALUES (869, 3, '2020-03-08', '2.5年打篮球入门到Rap精通', 52.000);
INSERT INTO `class_register` VALUES (870, 3, '2005-10-14', '篮球教学2.5年速成', 72.000);
INSERT INTO `class_register` VALUES (871, 2, '2020-10-16', '篮球教学2.5年速成', 47.000);
INSERT INTO `class_register` VALUES (872, 3, '2012-05-06', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (873, 3, '2023-07-11', '篮球教学2.5年速成', 50.000);
INSERT INTO `class_register` VALUES (874, 2, '2017-09-04', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (875, 2, '2016-10-21', '篮球教学2.5年速成', 30.000);
INSERT INTO `class_register` VALUES (876, 2, '2021-08-26', '2.5年打篮球入门到Rap精通', 14.000);
INSERT INTO `class_register` VALUES (877, 3, '2012-04-06', '篮球教学2.5年速成', 21.000);
INSERT INTO `class_register` VALUES (878, 3, '2001-01-20', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (879, 2, '2002-11-24', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (880, 3, '2023-06-18', '2.5年打篮球入门到Rap精通', 33.000);
INSERT INTO `class_register` VALUES (881, 3, '2004-05-05', '2.5年打篮球入门到Rap精通', 100.000);
INSERT INTO `class_register` VALUES (882, 2, '2021-03-09', '篮球教学2.5年速成', 68.000);
INSERT INTO `class_register` VALUES (883, 2, '2001-01-08', '2.5年打篮球入门到Rap精通', 86.000);
INSERT INTO `class_register` VALUES (884, 1, '2022-04-03', '篮球教学2.5年速成', 76.000);
INSERT INTO `class_register` VALUES (885, 2, '2000-12-30', '篮球教学2.5年速成', 96.000);
INSERT INTO `class_register` VALUES (886, 1, '2012-07-11', '2.5年打篮球入门到Rap精通', 25.000);
INSERT INTO `class_register` VALUES (887, 2, '2004-06-04', '篮球教学2.5年速成', 81.000);
INSERT INTO `class_register` VALUES (888, 1, '2001-02-19', '2.5年打篮球入门到Rap精通', 23.000);
INSERT INTO `class_register` VALUES (889, 3, '2019-12-24', '2.5年打篮球入门到Rap精通', 54.000);
INSERT INTO `class_register` VALUES (890, 2, '2022-06-27', '2.5年打篮球入门到Rap精通', 82.000);
INSERT INTO `class_register` VALUES (891, 1, '2023-01-06', '2.5年打篮球入门到Rap精通', 51.000);
INSERT INTO `class_register` VALUES (892, 3, '2003-10-03', '2.5年打篮球入门到Rap精通', 79.000);
INSERT INTO `class_register` VALUES (893, 3, '2005-05-07', '篮球教学2.5年速成', 75.000);
INSERT INTO `class_register` VALUES (894, 2, '2022-04-06', '篮球教学2.5年速成', 14.000);
INSERT INTO `class_register` VALUES (895, 1, '2024-01-17', '2.5年打篮球入门到Rap精通', 66.000);
INSERT INTO `class_register` VALUES (896, 3, '2004-09-22', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (897, 1, '2007-07-10', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (898, 1, '2013-01-20', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (899, 3, '2011-09-04', '2.5年打篮球入门到Rap精通', 24.000);
INSERT INTO `class_register` VALUES (900, 1, '2006-09-15', '2.5年打篮球入门到Rap精通', 83.000);
INSERT INTO `class_register` VALUES (901, 3, '2005-01-21', '2.5年打篮球入门到Rap精通', 55.000);
INSERT INTO `class_register` VALUES (902, 2, '2010-06-12', '2.5年打篮球入门到Rap精通', 40.000);
INSERT INTO `class_register` VALUES (903, 1, '2020-04-21', '2.5年打篮球入门到Rap精通', 80.000);
INSERT INTO `class_register` VALUES (904, 1, '2009-09-01', '篮球教学2.5年速成', 29.000);
INSERT INTO `class_register` VALUES (905, 1, '2004-10-21', '篮球教学2.5年速成', 71.000);
INSERT INTO `class_register` VALUES (906, 3, '2001-01-26', '篮球教学2.5年速成', 33.000);
INSERT INTO `class_register` VALUES (907, 1, '2021-07-26', '2.5年打篮球入门到Rap精通', 12.000);
INSERT INTO `class_register` VALUES (908, 2, '2002-11-18', '篮球教学2.5年速成', 20.000);
INSERT INTO `class_register` VALUES (909, 1, '2024-04-29', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (910, 2, '2016-05-21', '2.5年打篮球入门到Rap精通', 92.000);
INSERT INTO `class_register` VALUES (911, 1, '2013-09-16', '篮球教学2.5年速成', 61.000);
INSERT INTO `class_register` VALUES (912, 2, '2021-05-20', '篮球教学2.5年速成', 16.000);
INSERT INTO `class_register` VALUES (913, 1, '2022-12-27', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (914, 1, '2016-07-19', '2.5年打篮球入门到Rap精通', 32.000);
INSERT INTO `class_register` VALUES (915, 3, '2001-07-13', '篮球教学2.5年速成', 49.000);
INSERT INTO `class_register` VALUES (916, 2, '2011-04-19', '2.5年打篮球入门到Rap精通', 46.000);
INSERT INTO `class_register` VALUES (917, 1, '2011-09-17', '2.5年打篮球入门到Rap精通', 26.000);
INSERT INTO `class_register` VALUES (918, 1, '2024-09-22', '2.5年打篮球入门到Rap精通', 94.000);
INSERT INTO `class_register` VALUES (919, 3, '2024-08-13', '2.5年打篮球入门到Rap精通', 37.000);
INSERT INTO `class_register` VALUES (920, 2, '2002-04-23', '篮球教学2.5年速成', 46.000);
INSERT INTO `class_register` VALUES (921, 3, '2018-11-07', '2.5年打篮球入门到Rap精通', 47.000);
INSERT INTO `class_register` VALUES (922, 2, '2008-05-15', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (923, 2, '2023-07-24', '2.5年打篮球入门到Rap精通', 65.000);
INSERT INTO `class_register` VALUES (924, 2, '2020-12-21', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (925, 1, '2009-09-19', '2.5年打篮球入门到Rap精通', 91.000);
INSERT INTO `class_register` VALUES (926, 2, '2012-02-11', '2.5年打篮球入门到Rap精通', 76.000);
INSERT INTO `class_register` VALUES (927, 3, '2010-04-05', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (928, 3, '2008-10-03', '篮球教学2.5年速成', 49.000);
INSERT INTO `class_register` VALUES (929, 3, '2010-08-14', '2.5年打篮球入门到Rap精通', 18.000);
INSERT INTO `class_register` VALUES (930, 3, '2012-09-02', '2.5年打篮球入门到Rap精通', 19.000);
INSERT INTO `class_register` VALUES (931, 1, '2004-03-04', '2.5年打篮球入门到Rap精通', 90.000);
INSERT INTO `class_register` VALUES (932, 3, '2009-09-14', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (933, 3, '2018-07-28', '2.5年打篮球入门到Rap精通', 72.000);
INSERT INTO `class_register` VALUES (934, 3, '2006-04-04', '2.5年打篮球入门到Rap精通', 100.000);
INSERT INTO `class_register` VALUES (935, 2, '2005-04-06', '篮球教学2.5年速成', 56.000);
INSERT INTO `class_register` VALUES (936, 2, '2019-08-27', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (937, 3, '2004-01-04', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (938, 1, '2008-05-27', '篮球教学2.5年速成', 19.000);
INSERT INTO `class_register` VALUES (939, 3, '2006-10-15', '2.5年打篮球入门到Rap精通', 44.000);
INSERT INTO `class_register` VALUES (940, 3, '2001-01-11', '篮球教学2.5年速成', 54.000);
INSERT INTO `class_register` VALUES (941, 1, '2006-06-26', '2.5年打篮球入门到Rap精通', 80.000);
INSERT INTO `class_register` VALUES (942, 3, '2021-01-01', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (943, 1, '2007-03-20', '篮球教学2.5年速成', 32.000);
INSERT INTO `class_register` VALUES (944, 3, '2024-04-16', '2.5年打篮球入门到Rap精通', 93.000);
INSERT INTO `class_register` VALUES (945, 1, '2003-10-25', '2.5年打篮球入门到Rap精通', 10.000);
INSERT INTO `class_register` VALUES (946, 3, '2004-11-14', '篮球教学2.5年速成', 53.000);
INSERT INTO `class_register` VALUES (947, 2, '2020-01-31', '篮球教学2.5年速成', 31.000);
INSERT INTO `class_register` VALUES (948, 1, '2024-11-02', '2.5年打篮球入门到Rap精通', 34.000);
INSERT INTO `class_register` VALUES (949, 2, '2012-02-13', '篮球教学2.5年速成', 13.000);
INSERT INTO `class_register` VALUES (950, 3, '2015-09-03', '2.5年打篮球入门到Rap精通', 13.000);
INSERT INTO `class_register` VALUES (951, 1, '2000-02-04', '2.5年打篮球入门到Rap精通', 52.000);
INSERT INTO `class_register` VALUES (952, 1, '2013-02-22', '2.5年打篮球入门到Rap精通', 45.000);
INSERT INTO `class_register` VALUES (953, 3, '2004-04-13', '2.5年打篮球入门到Rap精通', 57.000);
INSERT INTO `class_register` VALUES (954, 3, '2012-04-04', '篮球教学2.5年速成', 32.000);
INSERT INTO `class_register` VALUES (955, 1, '2012-08-08', '篮球教学2.5年速成', 44.000);
INSERT INTO `class_register` VALUES (956, 2, '2008-10-30', '篮球教学2.5年速成', 70.000);
INSERT INTO `class_register` VALUES (957, 1, '2002-02-19', '2.5年打篮球入门到Rap精通', 51.000);
INSERT INTO `class_register` VALUES (958, 2, '2007-02-05', '篮球教学2.5年速成', 69.000);
INSERT INTO `class_register` VALUES (959, 1, '2006-11-29', '2.5年打篮球入门到Rap精通', 16.000);
INSERT INTO `class_register` VALUES (960, 3, '2003-10-29', '篮球教学2.5年速成', 28.000);
INSERT INTO `class_register` VALUES (961, 1, '2014-11-02', '篮球教学2.5年速成', 25.000);
INSERT INTO `class_register` VALUES (962, 3, '2024-10-13', '篮球教学2.5年速成', 34.000);
INSERT INTO `class_register` VALUES (963, 2, '2018-04-28', '2.5年打篮球入门到Rap精通', 95.000);
INSERT INTO `class_register` VALUES (964, 1, '2003-06-21', '2.5年打篮球入门到Rap精通', 28.000);
INSERT INTO `class_register` VALUES (965, 3, '2004-12-25', '2.5年打篮球入门到Rap精通', 12.000);
INSERT INTO `class_register` VALUES (966, 2, '2020-01-21', '篮球教学2.5年速成', 79.000);
INSERT INTO `class_register` VALUES (967, 1, '2000-11-04', '2.5年打篮球入门到Rap精通', 62.000);
INSERT INTO `class_register` VALUES (968, 3, '2000-12-21', '2.5年打篮球入门到Rap精通', 97.000);
INSERT INTO `class_register` VALUES (969, 1, '2020-10-03', '2.5年打篮球入门到Rap精通', 63.000);
INSERT INTO `class_register` VALUES (970, 1, '2004-12-22', '2.5年打篮球入门到Rap精通', 36.000);
INSERT INTO `class_register` VALUES (971, 3, '2021-12-22', '篮球教学2.5年速成', 85.000);
INSERT INTO `class_register` VALUES (972, 3, '2002-01-25', '篮球教学2.5年速成', 63.000);
INSERT INTO `class_register` VALUES (973, 1, '2018-10-07', '2.5年打篮球入门到Rap精通', 29.000);
INSERT INTO `class_register` VALUES (974, 2, '2016-02-13', '篮球教学2.5年速成', 17.000);
INSERT INTO `class_register` VALUES (975, 1, '2008-11-07', '篮球教学2.5年速成', 91.000);
INSERT INTO `class_register` VALUES (976, 3, '2018-01-18', '篮球教学2.5年速成', 27.000);
INSERT INTO `class_register` VALUES (977, 1, '2021-01-28', '篮球教学2.5年速成', 30.000);
INSERT INTO `class_register` VALUES (978, 3, '2012-05-04', '篮球教学2.5年速成', 12.000);
INSERT INTO `class_register` VALUES (979, 2, '2009-10-12', '2.5年打篮球入门到Rap精通', 75.000);
INSERT INTO `class_register` VALUES (980, 2, '2009-08-07', '篮球教学2.5年速成', 99.000);
INSERT INTO `class_register` VALUES (981, 1, '2002-11-27', '篮球教学2.5年速成', 60.000);
INSERT INTO `class_register` VALUES (982, 2, '2010-10-18', '2.5年打篮球入门到Rap精通', 43.000);
INSERT INTO `class_register` VALUES (983, 1, '2002-08-25', '篮球教学2.5年速成', 97.000);
INSERT INTO `class_register` VALUES (984, 1, '2012-12-01', '篮球教学2.5年速成', 58.000);
INSERT INTO `class_register` VALUES (985, 1, '2014-07-30', '2.5年打篮球入门到Rap精通', 80.000);
INSERT INTO `class_register` VALUES (986, 3, '2013-02-22', '2.5年打篮球入门到Rap精通', 24.000);
INSERT INTO `class_register` VALUES (987, 1, '2022-06-22', '篮球教学2.5年速成', 26.000);
INSERT INTO `class_register` VALUES (988, 2, '2013-07-10', '篮球教学2.5年速成', 95.000);
INSERT INTO `class_register` VALUES (989, 2, '2015-01-01', '篮球教学2.5年速成', 52.000);
INSERT INTO `class_register` VALUES (990, 2, '2010-07-09', '2.5年打篮球入门到Rap精通', 81.000);
INSERT INTO `class_register` VALUES (991, 1, '2018-09-15', '2.5年打篮球入门到Rap精通', 98.000);
INSERT INTO `class_register` VALUES (992, 1, '2012-08-01', '篮球教学2.5年速成', 60.000);
INSERT INTO `class_register` VALUES (993, 2, '2012-12-16', '2.5年打篮球入门到Rap精通', 44.000);
INSERT INTO `class_register` VALUES (994, 2, '2008-03-19', '2.5年打篮球入门到Rap精通', 41.000);
INSERT INTO `class_register` VALUES (995, 2, '2018-02-12', '2.5年打篮球入门到Rap精通', 97.000);
INSERT INTO `class_register` VALUES (996, 2, '2008-04-28', '篮球教学2.5年速成', 11.000);
INSERT INTO `class_register` VALUES (997, 2, '2022-12-16', '2.5年打篮球入门到Rap精通', 85.000);
INSERT INTO `class_register` VALUES (998, 2, '2015-09-13', '篮球教学2.5年速成', 62.000);
INSERT INTO `class_register` VALUES (999, 1, '2006-10-28', '2.5年打篮球入门到Rap精通', 74.000);

-- ----------------------------
-- Table structure for conversion
-- ----------------------------
DROP TABLE IF EXISTS `conversion`;
CREATE TABLE `conversion`  (
  `con_t_score` decimal(40, 3) NOT NULL COMMENT 'T分',
  `con_pro_score` decimal(40, 3) NOT NULL COMMENT '进步分',
  PRIMARY KEY (`con_t_score`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '进步分换算表\r\n备注：评分表的数据在此表当中计算好，放入D模块 增值评价分数表中存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conversion
-- ----------------------------

-- ----------------------------
-- Table structure for d2_certificate
-- ----------------------------
DROP TABLE IF EXISTS `d2_certificate`;
CREATE TABLE `d2_certificate`  (
  `certificate_id` decimal(40, 0) NOT NULL COMMENT '证书ID',
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生学号',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `certificate_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证书名称',
  `audit` decimal(1, 0) NOT NULL COMMENT '证书审核',
  PRIMARY KEY (`certificate_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'D2 证书表\r\n\r\nstudent\r\nstu_id\r\n\r\nteache' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d2_certificate
-- ----------------------------

-- ----------------------------
-- Table structure for d2_resource
-- ----------------------------
DROP TABLE IF EXISTS `d2_resource`;
CREATE TABLE `d2_resource`  (
  `resource_id` decimal(40, 0) NOT NULL COMMENT '资源ID',
  `certificate_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '证书ID',
  `resource_url` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源url',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'D2 资源表\r\n\r\nd2_certificate\r\ncertificate_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d2_resource
-- ----------------------------

-- ----------------------------
-- Table structure for d_add_value_score
-- ----------------------------
DROP TABLE IF EXISTS `d_add_value_score`;
CREATE TABLE `d_add_value_score`  (
  `avs_id` decimal(40, 0) NOT NULL COMMENT '增值评价ID',
  `ts_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '总分ID',
  `avs_score` decimal(40, 3) NOT NULL COMMENT '成绩',
  PRIMARY KEY (`avs_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'D_增值评价分数表\r\n\r\ntotal_score\r\nts_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_add_value_score
-- ----------------------------

-- ----------------------------
-- Table structure for enumerate
-- ----------------------------
DROP TABLE IF EXISTS `enumerate`;
CREATE TABLE `enumerate`  (
  `enum_id` decimal(10, 0) NOT NULL COMMENT '枚举ID',
  `enum_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '枚举名称',
  `enum_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '枚举代码',
  PRIMARY KEY (`enum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '模块枚举' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enumerate
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'teacher', '老师', NULL, NULL, 'Teacher', 'crud', 'element-ui', 'com.ruoyi.userslist', 'userslist', 'teacher', '老师', 'ruoyi', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-03-12 11:42:52', '', '2024-03-12 11:45:48', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'tea_id', '老师工号', 'varchar(30)', 'String', 'teaId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-12 11:42:52', '', '2024-03-12 11:45:49');
INSERT INTO `gen_table_column` VALUES (2, 1, 'tea_name', '老师姓名', 'varchar(60)', 'String', 'teaName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-12 11:42:52', '', '2024-03-12 11:45:49');
INSERT INTO `gen_table_column` VALUES (3, 1, 'password', '密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-12 11:42:53', '', '2024-03-12 11:45:49');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `class_id` decimal(10, 0) NOT NULL COMMENT '班级编号',
  `class_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业班级名',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '班级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (5201, '北汽2301班');
INSERT INTO `grade` VALUES (5202, '北汽2302班');
INSERT INTO `grade` VALUES (5203, '北汽2303班');
INSERT INTO `grade` VALUES (5204, '福特2301班');
INSERT INTO `grade` VALUES (5205, '福特2302班');
INSERT INTO `grade` VALUES (5206, '宝马2301班');
INSERT INTO `grade` VALUES (5207, '宝马2302班');
INSERT INTO `grade` VALUES (5208, '保时捷2301班');

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `semester_id` decimal(60, 0) NOT NULL COMMENT '学期ID',
  `start_date` date NOT NULL COMMENT '学期开始日期',
  `finish_date` date NOT NULL COMMENT '学期结束日期',
  PRIMARY KEY (`semester_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学期表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES (1, '2021-09-01', '2022-06-30');
INSERT INTO `semester` VALUES (2, '2022-09-01', '2023-06-30');
INSERT INTO `semester` VALUES (3, '2023-09-01', '2024-06-30');

-- ----------------------------
-- Table structure for shoot
-- ----------------------------
DROP TABLE IF EXISTS `shoot`;
CREATE TABLE `shoot`  (
  `sho_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投篮ID',
  `ms_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '评分ID',
  `sho_arc` decimal(40, 3) NOT NULL COMMENT '弧线',
  `sho_spinner` decimal(40, 3) NOT NULL COMMENT '后旋',
  `sho_angle` decimal(40, 3) NOT NULL COMMENT '偏角',
  `sho_analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评价',
  PRIMARY KEY (`sho_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投篮表\r\n\r\na_mark_sheet\r\nms_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoot
-- ----------------------------
INSERT INTO `shoot` VALUES ('1', 761, 64.000, 17.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('10', 176, 14.000, 87.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('100', 133, 69.000, 64.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('101', 958, 89.000, 26.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('102', 646, 50.000, 39.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('103', 902, 28.000, 62.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('104', 628, 29.000, 27.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('105', 93, 47.000, 15.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('106', 174, 43.000, 76.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('107', 380, 15.000, 89.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('108', 453, 66.000, 53.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('109', 318, 89.000, 56.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('11', 934, 83.000, 70.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('110', 234, 72.000, 94.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('111', 367, 64.000, 72.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('112', 715, 19.000, 75.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('113', 45, 91.000, 30.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('114', 325, 91.000, 75.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('115', 812, 57.000, 37.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('116', 819, 82.000, 67.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('117', 690, 76.000, 76.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('118', 644, 70.000, 94.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('119', 424, 25.000, 58.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('12', 502, 83.000, 27.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('120', 787, 20.000, 12.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('121', 85, 45.000, 85.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('122', 212, 13.000, 99.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('123', 232, 60.000, 73.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('124', 79, 42.000, 75.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('125', 81, 84.000, 89.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('126', 849, 87.000, 25.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('127', 248, 26.000, 41.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('128', 856, 57.000, 31.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('129', 262, 32.000, 95.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('13', 46, 83.000, 90.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('130', 469, 40.000, 72.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('131', 215, 45.000, 75.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('132', 107, 19.000, 50.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('133', 584, 72.000, 74.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('134', 768, 95.000, 11.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('135', 101, 41.000, 32.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('136', 464, 74.000, 26.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('137', 636, 40.000, 99.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('138', 700, 47.000, 20.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('139', 573, 60.000, 60.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('14', 661, 41.000, 43.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('140', 507, 94.000, 22.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('141', 342, 89.000, 89.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('142', 2, 29.000, 20.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('143', 792, 13.000, 18.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('144', 154, 98.000, 46.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('145', 442, 98.000, 36.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('146', 121, 100.000, 10.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('147', 662, 80.000, 50.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('148', 543, 28.000, 31.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('149', 853, 63.000, 43.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('15', 332, 97.000, 68.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('150', 118, 51.000, 90.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('151', 838, 67.000, 23.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('152', 34, 11.000, 55.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('153', 888, 46.000, 88.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('154', 766, 37.000, 29.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('155', 696, 55.000, 29.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('156', 503, 31.000, 74.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('157', 689, 98.000, 24.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('158', 376, 43.000, 77.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('159', 459, 80.000, 93.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('16', 105, 35.000, 38.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('160', 374, 35.000, 99.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('161', 124, 59.000, 55.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('162', 835, 44.000, 20.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('163', 449, 80.000, 16.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('164', 640, 50.000, 22.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('165', 125, 87.000, 68.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('166', 654, 57.000, 30.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('167', 59, 36.000, 48.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('168', 311, 64.000, 59.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('169', 686, 36.000, 43.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('17', 431, 66.000, 62.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('170', 321, 14.000, 90.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('171', 131, 58.000, 62.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('172', 959, 15.000, 93.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('173', 194, 30.000, 27.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('174', 300, 86.000, 31.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('175', 460, 20.000, 36.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('176', 351, 54.000, 83.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('177', 520, 59.000, 93.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('178', 953, 15.000, 34.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('179', 872, 71.000, 80.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('18', 172, 74.000, 99.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('180', 259, 26.000, 79.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('181', 926, 83.000, 15.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('182', 884, 27.000, 64.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('183', 613, 24.000, 28.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('184', 668, 12.000, 44.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('185', 922, 69.000, 31.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('186', 475, 78.000, 54.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('187', 991, 31.000, 17.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('188', 799, 12.000, 36.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('189', 117, 51.000, 26.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('19', 612, 95.000, 91.000, 93.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('190', 205, 27.000, 59.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('191', 366, 63.000, 91.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('192', 273, 48.000, 35.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('193', 577, 68.000, 100.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('194', 975, 88.000, 67.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('195', 717, 38.000, 22.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('196', 558, 52.000, 75.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('197', 291, 84.000, 37.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('198', 966, 13.000, 73.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('199', 874, 45.000, 12.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('2', 249, 66.000, 20.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('20', 456, 56.000, 27.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('200', 930, 40.000, 79.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('201', 12, 92.000, 90.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('202', 797, 40.000, 22.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('203', 622, 41.000, 83.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('204', 999, 30.000, 86.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('205', 714, 78.000, 96.000, 92.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('206', 506, 50.000, 34.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('207', 473, 100.000, 95.000, 89.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('208', 226, 12.000, 48.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('209', 51, 61.000, 48.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('21', 20, 29.000, 97.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('210', 235, 92.000, 68.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('211', 981, 85.000, 51.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('212', 322, 84.000, 83.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('213', 906, 91.000, 67.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('214', 850, 83.000, 100.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('215', 177, 37.000, 51.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('216', 417, 24.000, 95.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('217', 106, 56.000, 24.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('218', 647, 35.000, 84.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('219', 333, 74.000, 33.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('22', 847, 40.000, 17.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('220', 821, 15.000, 98.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('221', 523, 23.000, 85.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('222', 721, 37.000, 54.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('223', 965, 48.000, 55.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('224', 516, 23.000, 24.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('225', 554, 57.000, 23.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('226', 89, 61.000, 10.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('227', 110, 68.000, 100.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('228', 455, 20.000, 79.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('229', 313, 66.000, 69.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('23', 555, 77.000, 14.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('230', 19, 20.000, 93.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('231', 132, 80.000, 69.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('232', 149, 33.000, 87.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('233', 150, 44.000, 52.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('234', 268, 33.000, 71.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('235', 497, 39.000, 54.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('236', 908, 18.000, 58.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('237', 182, 25.000, 29.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('238', 334, 79.000, 36.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('239', 583, 86.000, 96.000, 98.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('24', 783, 62.000, 58.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('240', 978, 63.000, 78.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('241', 157, 12.000, 38.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('242', 542, 83.000, 58.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('243', 40, 39.000, 66.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('244', 343, 69.000, 11.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('245', 501, 43.000, 30.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('246', 921, 60.000, 69.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('247', 666, 71.000, 60.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('248', 77, 79.000, 93.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('249', 592, 11.000, 86.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('25', 483, 67.000, 95.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('250', 286, 79.000, 47.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('251', 302, 59.000, 47.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('252', 997, 52.000, 78.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('253', 385, 62.000, 93.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('254', 909, 10.000, 15.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('255', 169, 77.000, 31.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('256', 400, 86.000, 35.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('257', 728, 65.000, 25.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('258', 759, 43.000, 39.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('259', 539, 53.000, 84.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('26', 272, 42.000, 85.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('260', 993, 48.000, 91.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('261', 627, 36.000, 74.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('262', 458, 77.000, 45.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('263', 7, 31.000, 30.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('264', 858, 95.000, 33.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('265', 219, 34.000, 11.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('266', 569, 78.000, 42.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('267', 120, 61.000, 89.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('268', 289, 37.000, 86.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('269', 425, 21.000, 13.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('27', 594, 67.000, 84.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('270', 225, 89.000, 56.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('271', 822, 90.000, 33.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('272', 567, 12.000, 43.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('273', 128, 18.000, 95.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('274', 832, 66.000, 98.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('275', 96, 86.000, 74.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('276', 964, 13.000, 25.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('277', 880, 67.000, 81.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('278', 896, 42.000, 31.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('279', 796, 76.000, 77.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('28', 704, 50.000, 14.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('280', 406, 63.000, 97.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('281', 694, 52.000, 64.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('282', 413, 56.000, 48.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('283', 855, 22.000, 12.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('284', 805, 84.000, 92.000, 78.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('285', 478, 80.000, 62.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('286', 968, 43.000, 33.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('287', 743, 38.000, 63.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('288', 185, 98.000, 65.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('289', 55, 21.000, 79.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('29', 970, 66.000, 27.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('290', 740, 100.000, 14.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('291', 687, 66.000, 18.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('292', 54, 72.000, 84.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('293', 463, 78.000, 15.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('294', 825, 59.000, 54.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('295', 575, 89.000, 21.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('296', 875, 98.000, 71.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('297', 813, 72.000, 90.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('298', 84, 41.000, 69.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('299', 602, 41.000, 87.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('3', 678, 60.000, 27.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('30', 69, 61.000, 53.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('300', 928, 48.000, 89.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('301', 789, 79.000, 32.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('302', 476, 85.000, 77.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('303', 711, 62.000, 33.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('304', 92, 66.000, 98.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('305', 243, 55.000, 100.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('306', 631, 34.000, 24.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('307', 914, 16.000, 91.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('308', 840, 45.000, 15.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('309', 111, 41.000, 13.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('31', 753, 28.000, 10.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('310', 878, 29.000, 26.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('311', 629, 34.000, 69.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('312', 223, 93.000, 30.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('313', 208, 29.000, 10.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('314', 304, 72.000, 38.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('315', 252, 94.000, 28.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('316', 403, 93.000, 96.000, 69.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('317', 11, 80.000, 95.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('318', 645, 61.000, 83.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('319', 299, 55.000, 77.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('32', 454, 90.000, 55.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('320', 758, 69.000, 39.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('321', 731, 80.000, 78.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('322', 414, 27.000, 88.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('323', 634, 21.000, 19.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('324', 782, 94.000, 88.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('325', 434, 95.000, 34.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('326', 37, 30.000, 90.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('327', 80, 36.000, 62.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('328', 980, 79.000, 17.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('329', 170, 28.000, 100.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('33', 474, 92.000, 69.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('330', 672, 78.000, 54.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('331', 206, 87.000, 62.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('332', 233, 61.000, 55.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('333', 786, 45.000, 80.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('334', 389, 93.000, 97.000, 63.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('335', 165, 31.000, 17.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('336', 218, 38.000, 26.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('337', 616, 64.000, 11.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('338', 751, 97.000, 15.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('339', 873, 55.000, 19.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('34', 127, 31.000, 92.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('340', 598, 39.000, 58.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('341', 265, 92.000, 16.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('342', 614, 67.000, 20.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('343', 886, 45.000, 59.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('344', 258, 32.000, 11.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('345', 942, 49.000, 18.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('346', 851, 86.000, 59.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('347', 603, 67.000, 36.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('348', 963, 94.000, 87.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('349', 807, 14.000, 64.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('35', 422, 13.000, 23.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('350', 388, 81.000, 32.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('351', 708, 48.000, 29.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('352', 364, 77.000, 33.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('353', 529, 81.000, 60.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('354', 260, 25.000, 54.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('355', 528, 86.000, 25.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('356', 28, 62.000, 19.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('357', 296, 47.000, 33.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('358', 70, 88.000, 46.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('359', 712, 87.000, 57.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('36', 635, 35.000, 10.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('360', 202, 76.000, 49.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('361', 175, 11.000, 38.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('362', 213, 30.000, 59.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('363', 368, 49.000, 40.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('364', 32, 28.000, 54.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('365', 984, 45.000, 24.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('366', 297, 69.000, 42.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('367', 420, 29.000, 29.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('368', 480, 22.000, 44.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('369', 355, 30.000, 50.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('37', 326, 36.000, 10.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('370', 198, 35.000, 49.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('371', 158, 37.000, 54.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('372', 155, 68.000, 19.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('373', 10, 72.000, 99.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('374', 139, 79.000, 21.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('375', 669, 56.000, 32.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('376', 788, 33.000, 39.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('377', 895, 38.000, 56.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('378', 288, 89.000, 60.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('379', 950, 52.000, 11.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('38', 816, 62.000, 53.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('380', 883, 28.000, 24.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('381', 607, 91.000, 26.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('382', 675, 63.000, 85.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('383', 277, 29.000, 68.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('384', 800, 71.000, 65.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('385', 423, 17.000, 63.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('386', 659, 62.000, 88.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('387', 329, 72.000, 25.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('388', 294, 58.000, 36.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('389', 315, 18.000, 21.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('39', 960, 66.000, 71.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('390', 894, 31.000, 54.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('391', 899, 39.000, 30.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('392', 163, 76.000, 88.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('393', 345, 97.000, 29.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('394', 90, 80.000, 47.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('395', 22, 47.000, 93.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('396', 285, 36.000, 83.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('397', 898, 81.000, 64.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('398', 893, 68.000, 57.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('399', 24, 24.000, 47.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('4', 239, 26.000, 85.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('40', 196, 46.000, 23.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('400', 748, 23.000, 81.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('401', 637, 76.000, 41.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('402', 361, 88.000, 98.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('403', 217, 40.000, 41.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('404', 817, 61.000, 82.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('405', 267, 49.000, 23.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('406', 61, 65.000, 90.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('407', 116, 84.000, 99.000, 76.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('408', 491, 52.000, 73.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('409', 192, 45.000, 96.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('41', 6, 29.000, 49.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('410', 100, 68.000, 35.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('411', 793, 31.000, 91.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('412', 15, 10.000, 42.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('413', 191, 58.000, 46.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('414', 586, 93.000, 85.000, 80.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('415', 377, 53.000, 46.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('416', 482, 90.000, 27.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('417', 900, 58.000, 86.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('418', 394, 80.000, 67.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('419', 199, 12.000, 47.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('42', 279, 93.000, 19.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('420', 214, 69.000, 36.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('421', 104, 46.000, 95.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('422', 381, 96.000, 32.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('423', 370, 28.000, 76.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('424', 180, 11.000, 72.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('425', 757, 54.000, 73.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('426', 436, 63.000, 62.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('427', 470, 34.000, 44.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('428', 927, 42.000, 28.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('429', 99, 82.000, 21.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('43', 270, 67.000, 51.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('430', 561, 41.000, 20.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('431', 779, 49.000, 68.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('432', 468, 97.000, 27.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('433', 432, 70.000, 40.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('434', 295, 42.000, 42.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('435', 923, 86.000, 75.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('436', 795, 15.000, 34.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('437', 187, 89.000, 49.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('438', 30, 17.000, 86.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('439', 657, 74.000, 88.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('44', 697, 18.000, 15.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('440', 518, 28.000, 70.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('441', 985, 15.000, 64.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('442', 671, 16.000, 84.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('443', 498, 82.000, 58.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('444', 437, 26.000, 82.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('445', 336, 15.000, 54.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('446', 952, 38.000, 56.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('447', 287, 59.000, 83.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('448', 595, 85.000, 34.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('449', 969, 69.000, 12.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('45', 241, 94.000, 61.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('450', 774, 24.000, 61.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('451', 356, 34.000, 81.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('452', 777, 33.000, 39.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('453', 995, 99.000, 17.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('454', 164, 76.000, 57.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('455', 305, 59.000, 100.000, 96.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('456', 42, 84.000, 29.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('457', 522, 52.000, 98.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('458', 538, 49.000, 26.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('459', 301, 91.000, 31.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('46', 9, 70.000, 11.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('460', 148, 18.000, 59.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('461', 623, 13.000, 52.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('462', 918, 10.000, 73.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('463', 828, 30.000, 79.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('464', 947, 24.000, 59.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('465', 405, 37.000, 24.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('466', 221, 85.000, 12.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('467', 309, 28.000, 97.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('468', 882, 19.000, 48.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('469', 836, 24.000, 22.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('47', 713, 21.000, 31.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('470', 857, 51.000, 63.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('471', 373, 19.000, 68.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('472', 255, 88.000, 52.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('473', 393, 98.000, 22.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('474', 489, 26.000, 40.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('475', 605, 73.000, 98.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('476', 41, 45.000, 42.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('477', 549, 39.000, 56.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('478', 481, 71.000, 70.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('479', 141, 75.000, 37.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('48', 98, 21.000, 91.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('480', 833, 19.000, 84.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('481', 560, 37.000, 16.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('482', 358, 22.000, 73.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('483', 638, 41.000, 94.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('484', 618, 89.000, 83.000, 79.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('485', 864, 21.000, 51.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('486', 86, 36.000, 16.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('487', 563, 68.000, 79.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('488', 496, 19.000, 33.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('489', 625, 58.000, 40.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('49', 962, 26.000, 74.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('490', 257, 77.000, 63.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('491', 340, 73.000, 60.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('492', 369, 45.000, 34.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('493', 447, 97.000, 76.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('494', 524, 61.000, 87.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('495', 769, 59.000, 100.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('496', 227, 19.000, 11.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('497', 660, 67.000, 41.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('498', 615, 66.000, 95.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('499', 848, 80.000, 45.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('5', 398, 78.000, 79.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('50', 621, 31.000, 59.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('500', 320, 33.000, 47.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('501', 362, 15.000, 83.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('502', 794, 19.000, 72.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('503', 242, 35.000, 91.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('504', 144, 54.000, 34.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('505', 941, 66.000, 83.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('506', 378, 20.000, 37.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('507', 173, 49.000, 62.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('508', 707, 74.000, 17.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('509', 440, 12.000, 61.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('51', 870, 70.000, 86.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('510', 404, 73.000, 31.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('511', 76, 63.000, 24.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('512', 508, 53.000, 78.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('513', 871, 57.000, 51.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('514', 275, 63.000, 22.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('515', 897, 68.000, 39.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('516', 181, 87.000, 13.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('517', 145, 46.000, 65.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('518', 412, 74.000, 18.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('519', 60, 61.000, 51.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('52', 395, 16.000, 13.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('520', 722, 66.000, 25.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('521', 390, 57.000, 87.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('522', 691, 54.000, 18.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('523', 830, 25.000, 45.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('524', 544, 88.000, 75.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('525', 87, 26.000, 79.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('526', 426, 16.000, 56.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('527', 971, 78.000, 95.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('528', 129, 62.000, 91.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('529', 178, 36.000, 61.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('53', 756, 93.000, 87.000, 91.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('530', 823, 63.000, 49.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('531', 749, 14.000, 37.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('532', 505, 39.000, 19.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('533', 643, 80.000, 47.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('534', 430, 92.000, 36.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('535', 27, 12.000, 37.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('536', 62, 29.000, 74.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('537', 210, 59.000, 84.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('538', 720, 95.000, 38.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('539', 730, 52.000, 10.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('54', 831, 59.000, 35.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('540', 844, 20.000, 96.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('541', 240, 62.000, 41.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('542', 307, 84.000, 62.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('543', 735, 100.000, 79.000, 84.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('544', 439, 43.000, 67.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('545', 837, 20.000, 80.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('546', 58, 35.000, 93.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('547', 910, 54.000, 83.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('548', 806, 25.000, 68.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('549', 718, 82.000, 89.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('55', 350, 19.000, 83.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('550', 617, 41.000, 47.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('551', 384, 69.000, 54.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('552', 68, 50.000, 82.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('553', 266, 49.000, 57.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('554', 596, 84.000, 18.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('555', 562, 59.000, 94.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('556', 247, 39.000, 25.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('557', 956, 65.000, 100.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('558', 852, 40.000, 65.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('559', 450, 59.000, 28.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('56', 582, 80.000, 43.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('560', 967, 26.000, 10.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('561', 815, 84.000, 79.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('562', 444, 76.000, 20.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('563', 725, 34.000, 76.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('564', 151, 27.000, 45.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('565', 14, 80.000, 43.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('566', 514, 64.000, 45.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('567', 593, 42.000, 33.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('568', 632, 17.000, 52.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('569', 17, 90.000, 32.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('57', 641, 88.000, 90.000, 73.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('570', 986, 45.000, 31.000, 49.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('571', 487, 21.000, 26.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('572', 411, 92.000, 77.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('573', 236, 85.000, 40.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('574', 729, 73.000, 42.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('575', 253, 26.000, 67.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('576', 682, 82.000, 74.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('577', 667, 10.000, 22.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('578', 168, 61.000, 68.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('579', 677, 89.000, 61.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('58', 937, 82.000, 28.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('580', 887, 84.000, 89.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('581', 559, 34.000, 21.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('582', 112, 38.000, 68.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('583', 53, 68.000, 52.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('584', 546, 82.000, 87.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('585', 136, 75.000, 52.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('586', 276, 89.000, 77.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('587', 765, 95.000, 79.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('588', 527, 44.000, 90.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('589', 153, 92.000, 89.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('59', 317, 97.000, 100.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('590', 200, 53.000, 56.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('591', 745, 28.000, 63.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('592', 979, 28.000, 69.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('593', 379, 55.000, 10.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('594', 732, 39.000, 63.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('595', 526, 26.000, 52.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('596', 699, 80.000, 15.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('597', 310, 86.000, 16.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('598', 989, 28.000, 53.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('599', 776, 60.000, 98.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('6', 244, 89.000, 13.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('60', 877, 89.000, 87.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('600', 639, 80.000, 82.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('601', 881, 45.000, 66.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('602', 102, 75.000, 58.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('603', 587, 88.000, 75.000, 91.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('604', 890, 46.000, 21.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('605', 207, 63.000, 64.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('606', 630, 61.000, 41.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('607', 113, 70.000, 53.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('608', 688, 45.000, 29.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('609', 983, 10.000, 38.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('61', 798, 99.000, 49.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('610', 533, 52.000, 86.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('611', 486, 69.000, 90.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('612', 186, 55.000, 86.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('613', 67, 13.000, 19.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('614', 706, 97.000, 100.000, 93.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('615', 190, 41.000, 66.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('616', 256, 23.000, 70.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('617', 513, 88.000, 25.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('618', 517, 41.000, 82.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('619', 557, 61.000, 41.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('62', 78, 52.000, 78.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('620', 939, 21.000, 61.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('621', 160, 74.000, 66.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('622', 988, 70.000, 73.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('623', 859, 98.000, 76.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('624', 920, 23.000, 35.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('625', 216, 13.000, 76.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('626', 47, 25.000, 94.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('627', 746, 87.000, 30.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('628', 372, 67.000, 35.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('629', 585, 46.000, 23.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('63', 581, 75.000, 74.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('630', 946, 65.000, 86.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('631', 802, 36.000, 47.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('632', 375, 34.000, 37.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('633', 919, 82.000, 95.000, 53.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('634', 609, 89.000, 37.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('635', 862, 22.000, 90.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('636', 591, 25.000, 24.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('637', 490, 65.000, 73.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('638', 940, 51.000, 26.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('639', 553, 50.000, 38.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('64', 126, 60.000, 44.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('640', 663, 44.000, 93.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('641', 702, 27.000, 99.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('642', 891, 17.000, 54.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('643', 955, 67.000, 65.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('644', 842, 64.000, 88.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('645', 736, 89.000, 25.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('646', 642, 36.000, 94.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('647', 600, 12.000, 99.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('648', 925, 80.000, 79.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('649', 879, 91.000, 95.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('65', 992, 89.000, 37.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('650', 650, 39.000, 70.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('651', 550, 99.000, 29.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('652', 228, 77.000, 64.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('653', 738, 89.000, 17.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('654', 282, 100.000, 85.000, 70.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('655', 3, 76.000, 38.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('656', 651, 27.000, 66.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('657', 123, 95.000, 50.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('658', 435, 28.000, 59.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('659', 525, 79.000, 65.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('66', 35, 78.000, 26.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('660', 293, 98.000, 62.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('661', 580, 94.000, 46.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('662', 448, 10.000, 36.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('663', 421, 81.000, 90.000, 89.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('664', 619, 86.000, 68.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('665', 314, 52.000, 22.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('666', 949, 87.000, 90.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('667', 648, 44.000, 53.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('668', 924, 90.000, 78.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('669', 604, 82.000, 64.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('67', 917, 83.000, 63.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('670', 977, 33.000, 84.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('671', 137, 83.000, 16.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('672', 741, 54.000, 72.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('673', 530, 21.000, 70.000, 71.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('674', 56, 14.000, 50.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('675', 156, 56.000, 95.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('676', 565, 56.000, 45.000, 29.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('677', 494, 52.000, 11.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('678', 540, 84.000, 84.000, 100.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('679', 681, 73.000, 60.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('68', 752, 36.000, 78.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('680', 72, 73.000, 79.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('681', 446, 42.000, 82.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('682', 457, 35.000, 34.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('683', 184, 31.000, 43.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('684', 754, 23.000, 76.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('685', 492, 11.000, 17.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('686', 36, 70.000, 90.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('687', 734, 87.000, 66.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('688', 365, 69.000, 62.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('689', 633, 32.000, 12.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('69', 515, 10.000, 52.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('690', 531, 85.000, 66.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('691', 324, 19.000, 87.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('692', 982, 34.000, 52.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('693', 499, 87.000, 22.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('694', 269, 17.000, 26.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('695', 16, 41.000, 40.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('696', 624, 16.000, 86.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('697', 479, 24.000, 20.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('698', 726, 29.000, 89.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('699', 278, 31.000, 24.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('7', 576, 96.000, 58.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('70', 916, 68.000, 10.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('700', 808, 61.000, 29.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('701', 146, 62.000, 43.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('702', 811, 33.000, 59.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('703', 929, 89.000, 43.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('704', 441, 61.000, 24.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('705', 462, 19.000, 58.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('706', 134, 53.000, 73.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('707', 33, 24.000, 49.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('708', 785, 76.000, 54.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('709', 254, 86.000, 59.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('71', 957, 71.000, 11.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('710', 419, 30.000, 76.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('711', 290, 89.000, 71.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('712', 770, 71.000, 33.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('713', 698, 14.000, 98.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('714', 108, 48.000, 71.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('715', 408, 41.000, 24.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('716', 292, 80.000, 20.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('717', 466, 63.000, 49.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('718', 349, 55.000, 43.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('719', 338, 74.000, 99.000, 81.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('72', 824, 92.000, 33.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('720', 44, 46.000, 28.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('721', 843, 83.000, 76.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('722', 328, 44.000, 78.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('723', 220, 16.000, 18.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('724', 912, 92.000, 24.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('725', 23, 64.000, 12.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('726', 932, 29.000, 94.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('727', 43, 11.000, 40.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('728', 477, 65.000, 36.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('729', 203, 34.000, 43.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('73', 245, 66.000, 28.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('730', 834, 27.000, 11.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('731', 915, 44.000, 14.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('732', 5, 44.000, 69.000, 58.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('733', 537, 84.000, 24.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('734', 95, 69.000, 33.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('735', 103, 24.000, 38.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('736', 936, 72.000, 45.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('737', 571, 68.000, 36.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('738', 907, 92.000, 95.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('739', 382, 98.000, 43.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('74', 737, 43.000, 26.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('740', 204, 16.000, 71.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('741', 130, 72.000, 52.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('742', 867, 71.000, 91.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('743', 551, 18.000, 37.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('744', 572, 78.000, 100.000, 79.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('745', 63, 45.000, 56.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('746', 653, 95.000, 50.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('747', 611, 24.000, 72.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('748', 665, 15.000, 93.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('749', 913, 41.000, 55.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('75', 237, 64.000, 66.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('750', 484, 51.000, 31.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('751', 676, 96.000, 28.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('752', 703, 51.000, 51.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('753', 876, 70.000, 10.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('754', 541, 40.000, 47.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('755', 801, 10.000, 71.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('756', 167, 82.000, 65.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('757', 570, 67.000, 97.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('758', 599, 61.000, 60.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('759', 392, 12.000, 44.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('76', 933, 64.000, 88.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('760', 75, 47.000, 24.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('761', 658, 50.000, 69.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('762', 996, 71.000, 11.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('763', 944, 48.000, 15.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('764', 465, 30.000, 40.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('765', 938, 82.000, 48.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('766', 763, 78.000, 65.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('767', 193, 16.000, 12.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('768', 931, 83.000, 51.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('769', 778, 40.000, 58.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('77', 115, 15.000, 79.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('770', 784, 95.000, 55.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('771', 829, 54.000, 40.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('772', 25, 89.000, 81.000, 94.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('773', 280, 19.000, 22.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('774', 50, 93.000, 81.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('775', 750, 54.000, 40.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('776', 39, 42.000, 37.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('777', 427, 20.000, 35.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('778', 664, 78.000, 51.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('779', 500, 87.000, 33.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('78', 64, 88.000, 27.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('780', 452, 69.000, 40.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('781', 961, 82.000, 73.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('782', 461, 53.000, 80.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('783', 211, 31.000, 35.000, 61.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('784', 114, 32.000, 59.000, 43.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('785', 826, 92.000, 91.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('786', 360, 75.000, 98.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('787', 397, 53.000, 16.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('788', 841, 28.000, 37.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('789', 48, 19.000, 91.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('79', 590, 96.000, 55.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('790', 264, 98.000, 34.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('791', 138, 15.000, 97.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('792', 532, 100.000, 36.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('793', 566, 83.000, 41.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('794', 224, 65.000, 92.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('795', 547, 64.000, 63.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('796', 733, 24.000, 42.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('797', 656, 44.000, 27.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('798', 433, 30.000, 23.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('799', 347, 88.000, 35.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('8', 521, 61.000, 65.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('80', 973, 34.000, 19.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('800', 911, 100.000, 52.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('801', 673, 66.000, 66.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('802', 416, 48.000, 15.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('803', 1, 62.000, 24.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('804', 510, 79.000, 92.000, 83.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('805', 904, 62.000, 88.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('806', 142, 72.000, 85.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('807', 972, 15.000, 73.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('808', 578, 74.000, 94.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('809', 306, 50.000, 63.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('81', 511, 47.000, 90.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('810', 250, 27.000, 26.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('811', 556, 48.000, 87.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('812', 21, 81.000, 77.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('813', 147, 57.000, 94.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('814', 316, 14.000, 34.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('815', 303, 10.000, 61.000, 19.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('816', 201, 96.000, 12.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('817', 716, 88.000, 14.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('818', 451, 26.000, 58.000, 45.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('819', 4, 72.000, 68.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('82', 346, 53.000, 19.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('820', 308, 23.000, 52.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('821', 261, 31.000, 22.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('822', 974, 41.000, 72.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('823', 827, 31.000, 29.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('824', 140, 85.000, 69.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('825', 512, 25.000, 98.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('826', 18, 34.000, 64.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('827', 94, 72.000, 54.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('828', 251, 25.000, 74.000, 38.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('829', 418, 35.000, 59.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('83', 119, 13.000, 48.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('830', 415, 73.000, 89.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('831', 197, 22.000, 37.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('832', 66, 18.000, 65.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('833', 363, 93.000, 30.000, 18.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('834', 775, 38.000, 16.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('835', 901, 69.000, 62.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('836', 773, 35.000, 78.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('837', 885, 35.000, 78.000, 37.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('838', 597, 43.000, 21.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('839', 409, 29.000, 30.000, 15.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('84', 943, 73.000, 64.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('840', 162, 55.000, 19.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('841', 655, 84.000, 23.000, 33.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('842', 352, 66.000, 74.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('843', 29, 50.000, 45.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('844', 401, 68.000, 22.000, 28.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('845', 357, 61.000, 27.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('846', 608, 56.000, 31.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('847', 428, 49.000, 67.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('848', 152, 45.000, 49.000, 63.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('849', 183, 58.000, 60.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('85', 386, 35.000, 39.000, 12.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('850', 588, 79.000, 15.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('851', 772, 34.000, 36.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('852', 810, 50.000, 82.000, 57.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('853', 71, 94.000, 80.000, 81.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('854', 57, 21.000, 44.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('855', 189, 61.000, 89.000, 94.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('856', 626, 58.000, 56.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('857', 701, 83.000, 81.000, 16.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('858', 764, 99.000, 76.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('859', 188, 43.000, 92.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('86', 762, 23.000, 39.000, 34.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('860', 809, 30.000, 43.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('861', 284, 48.000, 10.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('862', 771, 43.000, 23.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('863', 945, 38.000, 83.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('864', 976, 53.000, 49.000, 70.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('865', 263, 92.000, 48.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('866', 739, 16.000, 61.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('867', 760, 80.000, 75.000, 72.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('868', 892, 39.000, 60.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('869', 330, 56.000, 71.000, 32.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('87', 818, 85.000, 16.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('870', 568, 16.000, 86.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('871', 620, 10.000, 29.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('872', 727, 18.000, 71.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('873', 298, 13.000, 28.000, 21.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('874', 684, 22.000, 96.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('875', 327, 60.000, 36.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('876', 209, 23.000, 19.000, 99.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('877', 13, 62.000, 88.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('878', 868, 49.000, 81.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('879', 26, 61.000, 21.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('88', 781, 87.000, 75.000, 84.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('880', 536, 99.000, 54.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('881', 791, 19.000, 61.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('882', 519, 93.000, 29.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('883', 74, 48.000, 64.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('884', 552, 10.000, 49.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('885', 866, 47.000, 76.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('886', 65, 84.000, 12.000, 100.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('887', 564, 68.000, 100.000, 94.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('888', 344, 69.000, 34.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('889', 166, 52.000, 81.000, 89.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('89', 719, 49.000, 52.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('890', 790, 74.000, 99.000, 94.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('891', 38, 75.000, 17.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('892', 803, 52.000, 33.000, 20.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('893', 485, 28.000, 43.000, 47.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('894', 814, 49.000, 71.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('895', 606, 39.000, 79.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('896', 161, 90.000, 28.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('897', 709, 73.000, 16.000, 80.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('898', 693, 38.000, 48.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('899', 331, 100.000, 43.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('9', 652, 92.000, 78.000, 27.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('90', 443, 88.000, 32.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('900', 271, 77.000, 68.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('901', 692, 78.000, 35.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('902', 495, 11.000, 39.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('903', 281, 87.000, 51.000, 35.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('904', 195, 100.000, 65.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('905', 695, 83.000, 40.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('906', 82, 69.000, 81.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('907', 407, 77.000, 78.000, 51.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('908', 73, 50.000, 17.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('909', 143, 17.000, 72.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('91', 179, 16.000, 83.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('910', 804, 10.000, 37.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('911', 723, 75.000, 22.000, 64.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('912', 283, 39.000, 65.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('913', 574, 91.000, 44.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('914', 854, 82.000, 74.000, 76.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('915', 601, 94.000, 34.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('916', 83, 13.000, 46.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('917', 319, 73.000, 65.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('918', 990, 79.000, 48.000, 96.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('919', 710, 56.000, 97.000, 60.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('92', 845, 76.000, 100.000, 88.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('920', 222, 78.000, 66.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('921', 488, 56.000, 85.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('922', 545, 81.000, 51.000, 74.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('923', 860, 18.000, 52.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('924', 410, 65.000, 54.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('925', 471, 51.000, 58.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('926', 246, 88.000, 73.000, 99.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('927', 951, 25.000, 23.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('928', 337, 70.000, 44.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('929', 994, 63.000, 21.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('93', 535, 18.000, 77.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('930', 534, 17.000, 14.000, 31.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('931', 889, 34.000, 24.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('932', 589, 58.000, 70.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('933', 438, 52.000, 58.000, 66.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('934', 846, 37.000, 90.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('935', 335, 41.000, 30.000, 62.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('936', 680, 39.000, 39.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('937', 429, 38.000, 71.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('938', 869, 30.000, 97.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('939', 998, 48.000, 38.000, 91.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('94', 954, 31.000, 28.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('940', 649, 78.000, 97.000, 97.000, '一眼顶针 鉴定为牛逼');
INSERT INTO `shoot` VALUES ('941', 724, 48.000, 40.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('942', 548, 60.000, 40.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('943', 354, 18.000, 56.000, 59.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('944', 88, 96.000, 42.000, 95.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('945', 230, 32.000, 12.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('946', 861, 40.000, 70.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('947', 348, 74.000, 29.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('948', 755, 68.000, 11.000, 48.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('949', 91, 79.000, 43.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('95', 341, 49.000, 50.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('950', 509, 58.000, 12.000, 17.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('951', 52, 31.000, 52.000, 40.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('952', 159, 82.000, 37.000, 75.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('953', 97, 87.000, 18.000, 14.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('954', 780, 86.000, 77.000, 11.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('955', 744, 32.000, 80.000, 25.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('956', 387, 96.000, 35.000, 50.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('957', 49, 59.000, 37.000, 23.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('958', 705, 97.000, 86.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('959', 467, 51.000, 36.000, 98.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('96', 903, 34.000, 30.000, 44.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('960', 399, 18.000, 30.000, 52.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('961', 383, 80.000, 39.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('962', 31, 23.000, 95.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('963', 359, 48.000, 51.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('964', 122, 15.000, 54.000, 46.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('965', 353, 65.000, 84.000, 55.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('966', 274, 39.000, 81.000, 77.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('967', 323, 84.000, 65.000, 88.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('968', 391, 55.000, 54.000, 54.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('969', 171, 51.000, 31.000, 83.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('97', 905, 59.000, 15.000, 92.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('970', 679, 77.000, 44.000, 65.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('971', 445, 85.000, 52.000, 56.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('972', 839, 99.000, 33.000, 86.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('973', 579, 23.000, 17.000, 81.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('974', 674, 83.000, 26.000, 39.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('975', 767, 46.000, 80.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('976', 610, 44.000, 57.000, 78.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('977', 238, 83.000, 20.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('978', 987, 23.000, 92.000, 67.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('979', 683, 24.000, 38.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('98', 935, 52.000, 23.000, 93.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('980', 312, 91.000, 48.000, 13.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('981', 109, 60.000, 81.000, 82.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('982', 670, 67.000, 83.000, 24.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('983', 402, 94.000, 36.000, 26.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('984', 493, 23.000, 75.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('985', 820, 55.000, 43.000, 87.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('986', 742, 33.000, 34.000, 22.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('987', 339, 18.000, 42.000, 69.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('988', 135, 36.000, 84.000, 36.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('989', 229, 46.000, 50.000, 68.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('99', 747, 49.000, 34.000, 85.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('990', 472, 94.000, 28.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('991', 231, 99.000, 76.000, 73.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('992', 396, 89.000, 22.000, 41.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('993', 504, 44.000, 96.000, 30.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('994', 865, 40.000, 34.000, 90.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('995', 685, 25.000, 35.000, 97.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('996', 8, 63.000, 34.000, 42.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('997', 371, 81.000, 38.000, 79.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('998', 948, 13.000, 66.000, 10.000, '一眼顶针 鉴定为垃圾');
INSERT INTO `shoot` VALUES ('999', 863, 40.000, 82.000, 79.000, '一眼顶针 鉴定为垃圾');

-- ----------------------------
-- Table structure for stu_group
-- ----------------------------
DROP TABLE IF EXISTS `stu_group`;
CREATE TABLE `stu_group`  (
  `g_id` decimal(10, 0) NOT NULL COMMENT '小组ID',
  `g_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小组名',
  `stu_group_leader` decimal(40, 0) NOT NULL COMMENT '小组组长',
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '小组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_group
-- ----------------------------
INSERT INTO `stu_group` VALUES (1, '长春组', 202252053642);
INSERT INTO `stu_group` VALUES (2, '伊斯兰堡组', 202252092373);
INSERT INTO `stu_group` VALUES (3, '河南组', 202252070444);
INSERT INTO `stu_group` VALUES (4, '朱厚照组', 202252021464);
INSERT INTO `stu_group` VALUES (5, '立特组', 202252069203);
INSERT INTO `stu_group` VALUES (6, '朱见深组', 202252084817);
INSERT INTO `stu_group` VALUES (7, '李想组', 202252083204);
INSERT INTO `stu_group` VALUES (8, '贫组', 202252097073);
INSERT INTO `stu_group` VALUES (9, '好组', 202252067273);
INSERT INTO `stu_group` VALUES (10, '退组', 202252021545);
INSERT INTO `stu_group` VALUES (11, '静夜思组', 202252006903);
INSERT INTO `stu_group` VALUES (12, '红与黑组', 202252018059);
INSERT INTO `stu_group` VALUES (13, '岳阳楼记组', 202252082248);
INSERT INTO `stu_group` VALUES (14, '北京组', 202252094208);
INSERT INTO `stu_group` VALUES (15, '罗马尼亚组', 202252095529);
INSERT INTO `stu_group` VALUES (16, '阿里巴巴组', 202252037781);
INSERT INTO `stu_group` VALUES (17, '坚强组', 202252007306);
INSERT INTO `stu_group` VALUES (18, '曹雪芹组', 202252050108);
INSERT INTO `stu_group` VALUES (19, '莫斯科组', 202252006502);
INSERT INTO `stu_group` VALUES (20, '兰州组', 202252051646);
INSERT INTO `stu_group` VALUES (21, '高老头组', 202252061124);
INSERT INTO `stu_group` VALUES (22, '陶渊明组', 202252017106);
INSERT INTO `stu_group` VALUES (23, '利比亚组', 202252041228);
INSERT INTO `stu_group` VALUES (24, '前组', 202252033833);
INSERT INTO `stu_group` VALUES (25, '宋卫王组', 202252079833);
INSERT INTO `stu_group` VALUES (26, '海南组', 202252015100);
INSERT INTO `stu_group` VALUES (27, '海燕组', 202252058322);
INSERT INTO `stu_group` VALUES (28, '清仁宗组', 202252030375);
INSERT INTO `stu_group` VALUES (29, '朱由校组', 202252033087);
INSERT INTO `stu_group` VALUES (30, '新疆大学组', 202252034961);
INSERT INTO `stu_group` VALUES (31, '喀布尔组', 202252033030);
INSERT INTO `stu_group` VALUES (32, '明惠宗组', 202252050175);
INSERT INTO `stu_group` VALUES (33, '台湾组', 202252063845);
INSERT INTO `stu_group` VALUES (34, '河南组', 202252066878);
INSERT INTO `stu_group` VALUES (35, '银川组', 202252085636);
INSERT INTO `stu_group` VALUES (36, '甘肃组', 202252006235);
INSERT INTO `stu_group` VALUES (37, '青海卫视组', 202252022989);
INSERT INTO `stu_group` VALUES (38, '浙江大学组', 202252096045);
INSERT INTO `stu_group` VALUES (39, '乔伊斯组', 202252026303);
INSERT INTO `stu_group` VALUES (40, '乔布斯组', 202252062371);
INSERT INTO `stu_group` VALUES (41, '明毅宗组', 202252003222);
INSERT INTO `stu_group` VALUES (42, '湖北组', 202252035871);
INSERT INTO `stu_group` VALUES (43, '反对组', 202252087897);
INSERT INTO `stu_group` VALUES (44, '河南卫视组', 202252062016);
INSERT INTO `stu_group` VALUES (45, '尼日利亚组', 202252011444);
INSERT INTO `stu_group` VALUES (46, '清组', 202252085130);
INSERT INTO `stu_group` VALUES (47, '清圣祖组', 202252013610);
INSERT INTO `stu_group` VALUES (48, '山西组', 202252053165);
INSERT INTO `stu_group` VALUES (49, '小组', 202252007990);
INSERT INTO `stu_group` VALUES (50, '造纸术组', 202252036445);
INSERT INTO `stu_group` VALUES (51, '太原组', 202252015858);
INSERT INTO `stu_group` VALUES (52, '云南组', 202252027031);
INSERT INTO `stu_group` VALUES (53, '歌德组', 202252061294);
INSERT INTO `stu_group` VALUES (54, '唐中宗组', 202252077392);
INSERT INTO `stu_group` VALUES (55, '雷雨组', 202252053586);
INSERT INTO `stu_group` VALUES (56, '百度组', 202252034347);
INSERT INTO `stu_group` VALUES (57, '河内组', 202252089686);
INSERT INTO `stu_group` VALUES (58, '离骚组', 202252032196);
INSERT INTO `stu_group` VALUES (59, '爱奇艺组', 202252083293);
INSERT INTO `stu_group` VALUES (60, '宋孝宗组', 202252098333);
INSERT INTO `stu_group` VALUES (61, '人民币组', 202252039921);
INSERT INTO `stu_group` VALUES (62, '安曼组', 202252084849);
INSERT INTO `stu_group` VALUES (63, '广东组', 202252042575);
INSERT INTO `stu_group` VALUES (64, '汉武帝组', 202252082085);
INSERT INTO `stu_group` VALUES (65, '湖北卫视组', 202252089027);
INSERT INTO `stu_group` VALUES (66, '河内组', 202252027817);
INSERT INTO `stu_group` VALUES (67, '这件组', 202252015779);
INSERT INTO `stu_group` VALUES (68, '山西大学组', 202252066919);
INSERT INTO `stu_group` VALUES (69, '台北组', 202252067043);
INSERT INTO `stu_group` VALUES (70, '秋天组', 202252022339);
INSERT INTO `stu_group` VALUES (71, '这些组', 202252029401);
INSERT INTO `stu_group` VALUES (72, '旻宁组', 202252054425);
INSERT INTO `stu_group` VALUES (73, '上组', 202252033946);
INSERT INTO `stu_group` VALUES (74, '长沙组', 202252074467);
INSERT INTO `stu_group` VALUES (75, '湘组', 202252011568);
INSERT INTO `stu_group` VALUES (76, '山西组', 202252068788);
INSERT INTO `stu_group` VALUES (77, '皇太极组', 202252046021);
INSERT INTO `stu_group` VALUES (78, '贵阳组', 202252022890);
INSERT INTO `stu_group` VALUES (79, '索非亚组', 202252041504);
INSERT INTO `stu_group` VALUES (80, '清圣祖组', 202252081976);
INSERT INTO `stu_group` VALUES (81, '福建组', 202252099575);
INSERT INTO `stu_group` VALUES (82, '福建组', 202252026903);
INSERT INTO `stu_group` VALUES (83, '忏悔录组', 202252090595);
INSERT INTO `stu_group` VALUES (84, '河南组', 202252094563);
INSERT INTO `stu_group` VALUES (85, '广西大学组', 202252065861);
INSERT INTO `stu_group` VALUES (86, '宋孝宗组', 202252080884);
INSERT INTO `stu_group` VALUES (87, '明惠宗组', 202252040443);
INSERT INTO `stu_group` VALUES (88, '杏树组', 202252006616);
INSERT INTO `stu_group` VALUES (89, '明太祖组', 202252098206);
INSERT INTO `stu_group` VALUES (90, '低组', 202252006455);
INSERT INTO `stu_group` VALUES (91, '福临组', 202252014131);
INSERT INTO `stu_group` VALUES (92, '广东组', 202252011008);
INSERT INTO `stu_group` VALUES (93, '牡丹亭组', 202252003296);
INSERT INTO `stu_group` VALUES (94, '津组', 202252046542);
INSERT INTO `stu_group` VALUES (95, '雅典组', 202252023977);
INSERT INTO `stu_group` VALUES (96, '新疆组', 202252027141);
INSERT INTO `stu_group` VALUES (97, '正常组', 202252032051);
INSERT INTO `stu_group` VALUES (98, '青海组', 202252064112);
INSERT INTO `stu_group` VALUES (99, '开罗组', 202252039359);
INSERT INTO `stu_group` VALUES (100, '乔布斯组', 202252078404);
INSERT INTO `stu_group` VALUES (101, '克罗地亚组', 202252011052);
INSERT INTO `stu_group` VALUES (102, '索马里组', 202252027575);
INSERT INTO `stu_group` VALUES (103, '南京组', 202252023210);
INSERT INTO `stu_group` VALUES (104, '吉林大学组', 202252041463);
INSERT INTO `stu_group` VALUES (105, '巴黎组', 202252045683);
INSERT INTO `stu_group` VALUES (106, '周鸿祎组', 202252005423);
INSERT INTO `stu_group` VALUES (107, '内蒙古组', 202252098357);
INSERT INTO `stu_group` VALUES (108, '黑组', 202252008397);
INSERT INTO `stu_group` VALUES (109, '南宁组', 202252046309);
INSERT INTO `stu_group` VALUES (110, '奕詝组', 202252001964);
INSERT INTO `stu_group` VALUES (111, '西藏组', 202252076575);
INSERT INTO `stu_group` VALUES (112, '莫斯科组', 202252016908);
INSERT INTO `stu_group` VALUES (113, '王小波组', 202252015390);
INSERT INTO `stu_group` VALUES (114, '孔子组', 202252070895);
INSERT INTO `stu_group` VALUES (115, '北京卫视组', 202252054443);
INSERT INTO `stu_group` VALUES (116, '龚宇盛组', 202252039290);
INSERT INTO `stu_group` VALUES (117, '丈人组', 202252004707);
INSERT INTO `stu_group` VALUES (118, '明武宗组', 202252015274);
INSERT INTO `stu_group` VALUES (119, '江苏组', 202252037287);
INSERT INTO `stu_group` VALUES (120, '红楼梦组', 202252073434);
INSERT INTO `stu_group` VALUES (121, '渝组', 202252070801);
INSERT INTO `stu_group` VALUES (122, '瑞典组', 202252082198);
INSERT INTO `stu_group` VALUES (123, '智利组', 202252098367);
INSERT INTO `stu_group` VALUES (124, '渺小组', 202252027639);
INSERT INTO `stu_group` VALUES (125, '那么组', 202252096509);
INSERT INTO `stu_group` VALUES (126, '明光宗组', 202252037996);
INSERT INTO `stu_group` VALUES (127, '萧军组', 202252007136);
INSERT INTO `stu_group` VALUES (128, '阿根廷组', 202252071304);
INSERT INTO `stu_group` VALUES (129, '朱翊钧组', 202252018497);
INSERT INTO `stu_group` VALUES (130, '汉宣帝组', 202252039223);
INSERT INTO `stu_group` VALUES (131, '德国组', 202252022813);
INSERT INTO `stu_group` VALUES (132, '甘组', 202252075553);
INSERT INTO `stu_group` VALUES (133, '赵伯宗组', 202252007858);
INSERT INTO `stu_group` VALUES (134, '浙江组', 202252003013);
INSERT INTO `stu_group` VALUES (135, '越南组', 202252039425);
INSERT INTO `stu_group` VALUES (136, '变形记组', 202252053289);
INSERT INTO `stu_group` VALUES (137, '黑组', 202252017583);
INSERT INTO `stu_group` VALUES (138, '老挝组', 202252069612);
INSERT INTO `stu_group` VALUES (139, '出组', 202252063742);
INSERT INTO `stu_group` VALUES (140, '拉特组', 202252069831);
INSERT INTO `stu_group` VALUES (141, '越南组', 202252021879);
INSERT INTO `stu_group` VALUES (142, '唐越组', 202252012993);
INSERT INTO `stu_group` VALUES (143, '那件组', 202252012714);
INSERT INTO `stu_group` VALUES (144, '赵祺组', 202252096473);
INSERT INTO `stu_group` VALUES (145, '匈牙利组', 202252035379);
INSERT INTO `stu_group` VALUES (146, '清楚组', 202252055362);
INSERT INTO `stu_group` VALUES (147, '朱瞻基组', 202252088457);
INSERT INTO `stu_group` VALUES (148, '曹雪芹组', 202252067465);
INSERT INTO `stu_group` VALUES (149, '继母组', 202252026832);
INSERT INTO `stu_group` VALUES (150, '芒果树组', 202252037168);
INSERT INTO `stu_group` VALUES (151, '荷塘月色组', 202252029570);
INSERT INTO `stu_group` VALUES (152, '旻宁组', 202252021327);
INSERT INTO `stu_group` VALUES (153, '母羊组', 202252010683);
INSERT INTO `stu_group` VALUES (154, '台湾组', 202252065283);
INSERT INTO `stu_group` VALUES (155, '明太祖组', 202252029705);
INSERT INTO `stu_group` VALUES (156, '柏林组', 202252029840);
INSERT INTO `stu_group` VALUES (157, '安哥拉组', 202252094735);
INSERT INTO `stu_group` VALUES (158, '北宋组', 202252009704);
INSERT INTO `stu_group` VALUES (159, '雨果组', 202252054783);
INSERT INTO `stu_group` VALUES (160, '明穆宗组', 202252018355);
INSERT INTO `stu_group` VALUES (161, '英格兰组', 202252076599);
INSERT INTO `stu_group` VALUES (162, '张爱玲组', 202252020483);
INSERT INTO `stu_group` VALUES (163, '契科夫组', 202252024322);
INSERT INTO `stu_group` VALUES (164, '北京组', 202252086824);
INSERT INTO `stu_group` VALUES (165, '粤组', 202252072982);
INSERT INTO `stu_group` VALUES (166, '陈一舟组', 202252001769);
INSERT INTO `stu_group` VALUES (167, '沪组', 202252033359);
INSERT INTO `stu_group` VALUES (168, '甘组', 202252016116);
INSERT INTO `stu_group` VALUES (169, '人民币组', 202252083174);
INSERT INTO `stu_group` VALUES (170, '葡萄牙组', 202252078724);
INSERT INTO `stu_group` VALUES (171, '渺小组', 202252068914);
INSERT INTO `stu_group` VALUES (172, '清宣宗组', 202252096660);
INSERT INTO `stu_group` VALUES (173, '曹雪芹组', 202252056754);
INSERT INTO `stu_group` VALUES (174, '懒惰组', 202252018488);
INSERT INTO `stu_group` VALUES (175, '河南组', 202252098961);
INSERT INTO `stu_group` VALUES (176, '赵昰组', 202252069681);
INSERT INTO `stu_group` VALUES (177, '唐睿宗组', 202252029907);
INSERT INTO `stu_group` VALUES (178, '正月组', 202252036540);
INSERT INTO `stu_group` VALUES (179, '明神宗组', 202252072071);
INSERT INTO `stu_group` VALUES (180, '明光宗组', 202252040497);
INSERT INTO `stu_group` VALUES (181, '人民币组', 202252003587);
INSERT INTO `stu_group` VALUES (182, '明成祖组', 202252015029);
INSERT INTO `stu_group` VALUES (183, '贵州组', 202252028339);
INSERT INTO `stu_group` VALUES (184, '拉特组', 202252063468);
INSERT INTO `stu_group` VALUES (185, '李旦组', 202252013959);
INSERT INTO `stu_group` VALUES (186, '温暖组', 202252047927);
INSERT INTO `stu_group` VALUES (187, '唐中宗组', 202252030733);
INSERT INTO `stu_group` VALUES (188, '埃及组', 202252027683);
INSERT INTO `stu_group` VALUES (189, '芬兰组', 202252024833);
INSERT INTO `stu_group` VALUES (190, '汉宣帝组', 202252011801);
INSERT INTO `stu_group` VALUES (191, '赵恒组', 202252075698);
INSERT INTO `stu_group` VALUES (192, '巴金组', 202252026731);
INSERT INTO `stu_group` VALUES (193, '奕詝组', 202252020984);
INSERT INTO `stu_group` VALUES (194, '任正非组', 202252079398);
INSERT INTO `stu_group` VALUES (195, '科纳克里组', 202252043027);
INSERT INTO `stu_group` VALUES (196, '杨浩涌组', 202252019760);
INSERT INTO `stu_group` VALUES (197, '博士组', 202252051093);
INSERT INTO `stu_group` VALUES (198, '异常组', 202252088591);
INSERT INTO `stu_group` VALUES (199, '锋利组', 202252035835);
INSERT INTO `stu_group` VALUES (200, '弟弟组', 202252036284);
INSERT INTO `stu_group` VALUES (201, '李治组', 202252050437);
INSERT INTO `stu_group` VALUES (202, '失败组', 202252067769);
INSERT INTO `stu_group` VALUES (203, '江西组', 202252082664);
INSERT INTO `stu_group` VALUES (204, '杨浩涌组', 202252022574);
INSERT INTO `stu_group` VALUES (205, '寒冷组', 202252053790);
INSERT INTO `stu_group` VALUES (206, '唐高宗组', 202252007609);
INSERT INTO `stu_group` VALUES (207, '雅典组', 202252003755);
INSERT INTO `stu_group` VALUES (208, '曹丕组', 202252088646);
INSERT INTO `stu_group` VALUES (209, '薄伽丘组', 202252004179);
INSERT INTO `stu_group` VALUES (210, '鄂组', 202252058859);
INSERT INTO `stu_group` VALUES (211, '鸟蛋组', 202252093381);
INSERT INTO `stu_group` VALUES (212, '打开组', 202252012639);
INSERT INTO `stu_group` VALUES (213, '地组', 202252085299);
INSERT INTO `stu_group` VALUES (214, '内蒙古组', 202252017242);
INSERT INTO `stu_group` VALUES (215, '此组', 202252021452);
INSERT INTO `stu_group` VALUES (216, '百度组', 202252004347);
INSERT INTO `stu_group` VALUES (217, '尤利西斯组', 202252007872);
INSERT INTO `stu_group` VALUES (218, '宋度宗组', 202252073059);
INSERT INTO `stu_group` VALUES (219, '旻宁组', 202252096891);
INSERT INTO `stu_group` VALUES (220, '大组', 202252094735);
INSERT INTO `stu_group` VALUES (221, '京剧组', 202252064953);
INSERT INTO `stu_group` VALUES (222, '围城组', 202252032256);
INSERT INTO `stu_group` VALUES (223, '孔明灯组', 202252013874);
INSERT INTO `stu_group` VALUES (224, '西藏组', 202252035010);
INSERT INTO `stu_group` VALUES (225, '智利组', 202252020175);
INSERT INTO `stu_group` VALUES (226, '味精组', 202252053568);
INSERT INTO `stu_group` VALUES (227, '王石组', 202252079005);
INSERT INTO `stu_group` VALUES (228, '朱翊钧组', 202252096661);
INSERT INTO `stu_group` VALUES (229, '弯曲组', 202252005329);
INSERT INTO `stu_group` VALUES (230, '固体组', 202252069675);
INSERT INTO `stu_group` VALUES (231, '史记组', 202252039596);
INSERT INTO `stu_group` VALUES (232, '罗马尼亚组', 202252081182);
INSERT INTO `stu_group` VALUES (233, '赫尔辛基组', 202252093593);
INSERT INTO `stu_group` VALUES (234, '新疆组', 202252007028);
INSERT INTO `stu_group` VALUES (235, '伯伯组', 202252086862);
INSERT INTO `stu_group` VALUES (236, '狭隘组', 202252092588);
INSERT INTO `stu_group` VALUES (237, '上海组', 202252073046);
INSERT INTO `stu_group` VALUES (238, '广西组', 202252005889);
INSERT INTO `stu_group` VALUES (239, '福临组', 202252062889);
INSERT INTO `stu_group` VALUES (240, '旻宁组', 202252098669);
INSERT INTO `stu_group` VALUES (241, '美组', 202252077437);
INSERT INTO `stu_group` VALUES (242, '复杂组', 202252006604);
INSERT INTO `stu_group` VALUES (243, '乌克兰组', 202252005687);
INSERT INTO `stu_group` VALUES (244, '浙组', 202252033386);
INSERT INTO `stu_group` VALUES (245, '青海组', 202252073075);
INSERT INTO `stu_group` VALUES (246, '广西组', 202252099794);
INSERT INTO `stu_group` VALUES (247, '宋神宗组', 202252002561);
INSERT INTO `stu_group` VALUES (248, '史记组', 202252044631);
INSERT INTO `stu_group` VALUES (249, '湖南组', 202252000426);
INSERT INTO `stu_group` VALUES (250, '清文宗组', 202252016533);
INSERT INTO `stu_group` VALUES (251, '美丽组', 202252061050);
INSERT INTO `stu_group` VALUES (252, '变色龙组', 202252029216);
INSERT INTO `stu_group` VALUES (253, '上海组', 202252061225);
INSERT INTO `stu_group` VALUES (254, '北京组', 202252006817);
INSERT INTO `stu_group` VALUES (255, '北京组', 202252007606);
INSERT INTO `stu_group` VALUES (256, '琼组', 202252045229);
INSERT INTO `stu_group` VALUES (257, '雅加达组', 202252032449);
INSERT INTO `stu_group` VALUES (258, '德拉姆组', 202252090167);
INSERT INTO `stu_group` VALUES (259, '红与黑组', 202252007570);
INSERT INTO `stu_group` VALUES (260, '第纳尔组', 202252069273);
INSERT INTO `stu_group` VALUES (261, '母鸭组', 202252025930);
INSERT INTO `stu_group` VALUES (262, '芬兰组', 202252065303);
INSERT INTO `stu_group` VALUES (263, '摩加迪沙组', 202252087589);
INSERT INTO `stu_group` VALUES (264, '豫组', 202252063419);
INSERT INTO `stu_group` VALUES (265, '湖南组', 202252003332);
INSERT INTO `stu_group` VALUES (266, '强组', 202252052134);
INSERT INTO `stu_group` VALUES (267, '冰心组', 202252054392);
INSERT INTO `stu_group` VALUES (268, '海口组', 202252091330);
INSERT INTO `stu_group` VALUES (269, '云组', 202252048051);
INSERT INTO `stu_group` VALUES (270, '宋孝宗组', 202252003504);
INSERT INTO `stu_group` VALUES (271, '圣地亚哥组', 202252048788);
INSERT INTO `stu_group` VALUES (272, '山东大学组', 202252064128);
INSERT INTO `stu_group` VALUES (273, '朝花夕拾组', 202252098280);
INSERT INTO `stu_group` VALUES (274, '洛阳组', 202252090566);
INSERT INTO `stu_group` VALUES (275, '钡餐组', 202252053398);
INSERT INTO `stu_group` VALUES (276, '曹禺组', 202252020508);
INSERT INTO `stu_group` VALUES (277, '降落组', 202252055009);
INSERT INTO `stu_group` VALUES (278, '云组', 202252009401);
INSERT INTO `stu_group` VALUES (279, '隋文帝组', 202252064641);
INSERT INTO `stu_group` VALUES (280, '宋英宗组', 202252005617);
INSERT INTO `stu_group` VALUES (281, '里亚尔组', 202252039774);
INSERT INTO `stu_group` VALUES (282, '水稻组', 202252086033);
INSERT INTO `stu_group` VALUES (283, '长沙组', 202252025375);
INSERT INTO `stu_group` VALUES (284, '粤组', 202252044966);
INSERT INTO `stu_group` VALUES (285, '雷亚尔组', 202252002954);
INSERT INTO `stu_group` VALUES (286, '李显组', 202252081846);
INSERT INTO `stu_group` VALUES (287, '明熹宗组', 202252086019);
INSERT INTO `stu_group` VALUES (288, '日本组', 202252035529);
INSERT INTO `stu_group` VALUES (289, '暗组', 202252092369);
INSERT INTO `stu_group` VALUES (290, '叙利亚组', 202252013497);
INSERT INTO `stu_group` VALUES (291, '重庆组', 202252049734);
INSERT INTO `stu_group` VALUES (292, '施耐庵组', 202252077070);
INSERT INTO `stu_group` VALUES (293, '朱祁镇组', 202252072107);
INSERT INTO `stu_group` VALUES (294, '广西组', 202252096579);
INSERT INTO `stu_group` VALUES (295, '安全组', 202252022663);
INSERT INTO `stu_group` VALUES (296, '巴基斯坦组', 202252067746);
INSERT INTO `stu_group` VALUES (297, '宁夏大学组', 202252058287);
INSERT INTO `stu_group` VALUES (298, '呼和浩特组', 202252024788);
INSERT INTO `stu_group` VALUES (299, '钱钟书组', 202252001964);
INSERT INTO `stu_group` VALUES (300, '清德宗组', 202252048586);
INSERT INTO `stu_group` VALUES (301, '来组', 202252048470);
INSERT INTO `stu_group` VALUES (302, '安卡拉组', 202252094701);
INSERT INTO `stu_group` VALUES (303, '广西大学组', 202252024553);
INSERT INTO `stu_group` VALUES (304, '山西组', 202252048317);
INSERT INTO `stu_group` VALUES (305, '完颜旻组', 202252026640);
INSERT INTO `stu_group` VALUES (306, '巴西组', 202252079137);
INSERT INTO `stu_group` VALUES (307, '胖组', 202252075299);
INSERT INTO `stu_group` VALUES (308, '堪培拉组', 202252093744);
INSERT INTO `stu_group` VALUES (309, '哥本哈根组', 202252021074);
INSERT INTO `stu_group` VALUES (310, '论语组', 202252060801);
INSERT INTO `stu_group` VALUES (311, '芬兰组', 202252094220);
INSERT INTO `stu_group` VALUES (312, '宋神宗组', 202252029549);
INSERT INTO `stu_group` VALUES (313, '老挝组', 202252039958);
INSERT INTO `stu_group` VALUES (314, '蘑菇街组', 202252009890);
INSERT INTO `stu_group` VALUES (315, '明熹宗组', 202252089859);
INSERT INTO `stu_group` VALUES (316, '索马里组', 202252004065);
INSERT INTO `stu_group` VALUES (317, '姥姥组', 202252011677);
INSERT INTO `stu_group` VALUES (318, '湖南组', 202252069210);
INSERT INTO `stu_group` VALUES (319, '真组', 202252001807);
INSERT INTO `stu_group` VALUES (320, '张爱玲组', 202252006167);
INSERT INTO `stu_group` VALUES (321, '甘肃组', 202252023834);
INSERT INTO `stu_group` VALUES (322, '反对组', 202252041624);
INSERT INTO `stu_group` VALUES (323, '增大组', 202252070541);
INSERT INTO `stu_group` VALUES (324, '国王组', 202252070586);
INSERT INTO `stu_group` VALUES (325, '汤显祖组', 202252098371);
INSERT INTO `stu_group` VALUES (326, '长春组', 202252024518);
INSERT INTO `stu_group` VALUES (327, '高中组', 202252040725);
INSERT INTO `stu_group` VALUES (328, '粤剧组', 202252036388);
INSERT INTO `stu_group` VALUES (329, '土耳其组', 202252019483);
INSERT INTO `stu_group` VALUES (330, '保加利亚组', 202252076128);
INSERT INTO `stu_group` VALUES (331, '下班组', 202252001954);
INSERT INTO `stu_group` VALUES (332, '湖北组', 202252077071);
INSERT INTO `stu_group` VALUES (333, '福建组', 202252032915);
INSERT INTO `stu_group` VALUES (334, '静组', 202252077436);
INSERT INTO `stu_group` VALUES (335, '四川卫视组', 202252014390);
INSERT INTO `stu_group` VALUES (336, '贵州组', 202252026528);
INSERT INTO `stu_group` VALUES (337, '莎士比亚组', 202252024747);
INSERT INTO `stu_group` VALUES (338, '细心组', 202252008604);
INSERT INTO `stu_group` VALUES (339, '李显组', 202252004155);
INSERT INTO `stu_group` VALUES (340, '台北组', 202252063987);
INSERT INTO `stu_group` VALUES (341, '代纳尔组', 202252026935);
INSERT INTO `stu_group` VALUES (342, '弟妹组', 202252004498);
INSERT INTO `stu_group` VALUES (343, '云南卫视组', 202252094339);
INSERT INTO `stu_group` VALUES (344, '基辅组', 202252025500);
INSERT INTO `stu_group` VALUES (345, '瑞典组', 202252068842);
INSERT INTO `stu_group` VALUES (346, '赵伯宗组', 202252077282);
INSERT INTO `stu_group` VALUES (347, '复杂组', 202252097134);
INSERT INTO `stu_group` VALUES (348, '朱由检组', 202252077151);
INSERT INTO `stu_group` VALUES (349, '上海组', 202252011043);
INSERT INTO `stu_group` VALUES (350, '假组', 202252074191);
INSERT INTO `stu_group` VALUES (351, '变色龙组', 202252095090);
INSERT INTO `stu_group` VALUES (352, '腾讯组', 202252040577);
INSERT INTO `stu_group` VALUES (353, '右组', 202252094663);
INSERT INTO `stu_group` VALUES (354, '颙琰组', 202252067603);
INSERT INTO `stu_group` VALUES (355, '基辅组', 202252048212);
INSERT INTO `stu_group` VALUES (356, '刘恒组', 202252075475);
INSERT INTO `stu_group` VALUES (357, '河北组', 202252011219);
INSERT INTO `stu_group` VALUES (358, '上海组', 202252062632);
INSERT INTO `stu_group` VALUES (359, '鸡组', 202252087263);
INSERT INTO `stu_group` VALUES (360, '阿尔巴尼亚组', 202252044482);
INSERT INTO `stu_group` VALUES (361, '汤显祖组', 202252057325);
INSERT INTO `stu_group` VALUES (362, '沪剧组', 202252087570);
INSERT INTO `stu_group` VALUES (363, '司马睿组', 202252080604);
INSERT INTO `stu_group` VALUES (364, '降低组', 202252047018);
INSERT INTO `stu_group` VALUES (365, '雪国组', 202252027355);
INSERT INTO `stu_group` VALUES (366, '圣地亚哥组', 202252045905);
INSERT INTO `stu_group` VALUES (367, '万象组', 202252065167);
INSERT INTO `stu_group` VALUES (368, '匈牙利组', 202252098495);
INSERT INTO `stu_group` VALUES (369, '贵州大学组', 202252016564);
INSERT INTO `stu_group` VALUES (370, '辽组', 202252021821);
INSERT INTO `stu_group` VALUES (371, '艾略特组', 202252021039);
INSERT INTO `stu_group` VALUES (372, '晚上组', 202252000321);
INSERT INTO `stu_group` VALUES (373, '朝花夕拾组', 202252084516);
INSERT INTO `stu_group` VALUES (374, '索非亚组', 202252064484);
INSERT INTO `stu_group` VALUES (375, '贝鲁特组', 202252080307);
INSERT INTO `stu_group` VALUES (376, '乌鲁木齐组', 202252033792);
INSERT INTO `stu_group` VALUES (377, '克朗组', 202252005619);
INSERT INTO `stu_group` VALUES (378, '寒冷组', 202252007982);
INSERT INTO `stu_group` VALUES (379, '出师表组', 202252063051);
INSERT INTO `stu_group` VALUES (380, '汉文帝组', 202252051898);
INSERT INTO `stu_group` VALUES (381, '诸葛亮组', 202252056415);
INSERT INTO `stu_group` VALUES (382, '吉林组', 202252081965);
INSERT INTO `stu_group` VALUES (383, '正常组', 202252036430);
INSERT INTO `stu_group` VALUES (384, '古巴组', 202252077898);
INSERT INTO `stu_group` VALUES (385, '弟弟组', 202252098409);
INSERT INTO `stu_group` VALUES (386, '浙江卫视组', 202252006497);
INSERT INTO `stu_group` VALUES (387, '川端康成组', 202252045852);
INSERT INTO `stu_group` VALUES (388, '明惠宗组', 202252020350);
INSERT INTO `stu_group` VALUES (389, '懒惰组', 202252004319);
INSERT INTO `stu_group` VALUES (390, '外婆组', 202252014898);
INSERT INTO `stu_group` VALUES (391, '宽扎组', 202252084970);
INSERT INTO `stu_group` VALUES (392, '史记组', 202252012260);
INSERT INTO `stu_group` VALUES (393, '卢布组', 202252077552);
INSERT INTO `stu_group` VALUES (394, '明光宗组', 202252066107);
INSERT INTO `stu_group` VALUES (395, '布达佩斯组', 202252067101);
INSERT INTO `stu_group` VALUES (396, '上组', 202252072154);
INSERT INTO `stu_group` VALUES (397, '李显组', 202252097578);
INSERT INTO `stu_group` VALUES (398, '比利时组', 202252037536);
INSERT INTO `stu_group` VALUES (399, '司马炎组', 202252037651);
INSERT INTO `stu_group` VALUES (400, '人民币组', 202252054206);
INSERT INTO `stu_group` VALUES (401, '万象组', 202252096560);
INSERT INTO `stu_group` VALUES (402, '赣组', 202252080107);
INSERT INTO `stu_group` VALUES (403, '朱由检组', 202252006765);
INSERT INTO `stu_group` VALUES (404, '赶集网组', 202252086340);
INSERT INTO `stu_group` VALUES (405, '钱钟书组', 202252046554);
INSERT INTO `stu_group` VALUES (406, '任正非组', 202252067994);
INSERT INTO `stu_group` VALUES (407, '赣组', 202252016751);
INSERT INTO `stu_group` VALUES (408, '黑龙江卫视组', 202252086506);
INSERT INTO `stu_group` VALUES (409, '失望组', 202252040438);
INSERT INTO `stu_group` VALUES (410, '邹胜龙组', 202252073882);
INSERT INTO `stu_group` VALUES (411, '细心组', 202252057924);
INSERT INTO `stu_group` VALUES (412, '山西组', 202252019383);
INSERT INTO `stu_group` VALUES (413, '神曲组', 202252021449);
INSERT INTO `stu_group` VALUES (414, '海南卫视组', 202252058881);
INSERT INTO `stu_group` VALUES (415, '公猴组', 202252064774);
INSERT INTO `stu_group` VALUES (416, '东组', 202252088391);
INSERT INTO `stu_group` VALUES (417, '辽宁组', 202252046510);
INSERT INTO `stu_group` VALUES (418, '西安组', 202252056153);
INSERT INTO `stu_group` VALUES (419, '围城组', 202252031685);
INSERT INTO `stu_group` VALUES (420, '李显组', 202252008079);
INSERT INTO `stu_group` VALUES (421, '赵匡胤组', 202252050691);
INSERT INTO `stu_group` VALUES (422, '斯德哥尔摩组', 202252043211);
INSERT INTO `stu_group` VALUES (423, '汐组', 202252047227);
INSERT INTO `stu_group` VALUES (424, '皇太极组', 202252021966);
INSERT INTO `stu_group` VALUES (425, '施耐庵组', 202252007653);
INSERT INTO `stu_group` VALUES (426, '哈尔滨组', 202252025663);
INSERT INTO `stu_group` VALUES (427, '雌兔组', 202252039295);
INSERT INTO `stu_group` VALUES (428, '丁磊组', 202252065694);
INSERT INTO `stu_group` VALUES (429, '山西组', 202252020330);
INSERT INTO `stu_group` VALUES (430, '奶奶组', 202252046006);
INSERT INTO `stu_group` VALUES (431, '黑龙江卫视组', 202252076046);
INSERT INTO `stu_group` VALUES (432, '明惠宗组', 202252047921);
INSERT INTO `stu_group` VALUES (433, '宋光宗组', 202252067924);
INSERT INTO `stu_group` VALUES (434, '宋端宗组', 202252001450);
INSERT INTO `stu_group` VALUES (435, '华沙组', 202252088387);
INSERT INTO `stu_group` VALUES (436, '广东组', 202252077845);
INSERT INTO `stu_group` VALUES (437, '桃花源记组', 202252062226);
INSERT INTO `stu_group` VALUES (438, '积极组', 202252096917);
INSERT INTO `stu_group` VALUES (439, '贾平凹组', 202252069437);
INSERT INTO `stu_group` VALUES (440, '双城记组', 202252097006);
INSERT INTO `stu_group` VALUES (441, '岳母组', 202252065857);
INSERT INTO `stu_group` VALUES (442, '拜伦组', 202252047863);
INSERT INTO `stu_group` VALUES (443, '明宪宗组', 202252030076);
INSERT INTO `stu_group` VALUES (444, '苏组', 202252002394);
INSERT INTO `stu_group` VALUES (445, '近组', 202252084732);
INSERT INTO `stu_group` VALUES (446, '陕西组', 202252050962);
INSERT INTO `stu_group` VALUES (447, '皇太极组', 202252000673);
INSERT INTO `stu_group` VALUES (448, '东京组', 202252049767);
INSERT INTO `stu_group` VALUES (449, '福临组', 202252059438);
INSERT INTO `stu_group` VALUES (450, '蜀组', 202252077125);
INSERT INTO `stu_group` VALUES (451, '吉林组', 202252093929);
INSERT INTO `stu_group` VALUES (452, '明仁宗组', 202252046278);
INSERT INTO `stu_group` VALUES (453, '忏悔录组', 202252023347);
INSERT INTO `stu_group` VALUES (454, '马尼拉组', 202252091048);
INSERT INTO `stu_group` VALUES (455, '反对组', 202252000711);
INSERT INTO `stu_group` VALUES (456, '薄伽丘组', 202252010207);
INSERT INTO `stu_group` VALUES (457, '基辅组', 202252065333);
INSERT INTO `stu_group` VALUES (458, '狭窄组', 202252029590);
INSERT INTO `stu_group` VALUES (459, '河北卫视组', 202252049156);
INSERT INTO `stu_group` VALUES (460, '法国组', 202252082759);
INSERT INTO `stu_group` VALUES (461, '懒惰组', 202252031590);
INSERT INTO `stu_group` VALUES (462, '山西组', 202252010191);
INSERT INTO `stu_group` VALUES (463, '孙权组', 202252089243);
INSERT INTO `stu_group` VALUES (464, '唐组', 202252048522);
INSERT INTO `stu_group` VALUES (465, '氧化氢组', 202252011235);
INSERT INTO `stu_group` VALUES (466, '论语组', 202252047244);
INSERT INTO `stu_group` VALUES (467, '苏丹组', 202252007769);
INSERT INTO `stu_group` VALUES (468, '宋度宗组', 202252083999);
INSERT INTO `stu_group` VALUES (469, '贝鲁特组', 202252003594);
INSERT INTO `stu_group` VALUES (470, '湖北组', 202252028168);
INSERT INTO `stu_group` VALUES (471, '长春组', 202252058056);
INSERT INTO `stu_group` VALUES (472, '坏事组', 202252072137);
INSERT INTO `stu_group` VALUES (473, '昆明组', 202252037905);
INSERT INTO `stu_group` VALUES (474, '江苏组', 202252066201);
INSERT INTO `stu_group` VALUES (475, '四川大学组', 202252044639);
INSERT INTO `stu_group` VALUES (476, '狄更斯组', 202252006226);
INSERT INTO `stu_group` VALUES (477, '哈瓦那组', 202252017001);
INSERT INTO `stu_group` VALUES (478, '喀土穆组', 202252028977);
INSERT INTO `stu_group` VALUES (479, '日本组', 202252067663);
INSERT INTO `stu_group` VALUES (480, '贵州组', 202252009976);
INSERT INTO `stu_group` VALUES (481, '浙江卫视组', 202252004675);
INSERT INTO `stu_group` VALUES (482, '陕组', 202252070165);
INSERT INTO `stu_group` VALUES (483, '明穆宗组', 202252050927);
INSERT INTO `stu_group` VALUES (484, '宽敞组', 202252096788);
INSERT INTO `stu_group` VALUES (485, '张一鸣组', 202252063482);
INSERT INTO `stu_group` VALUES (486, '出师表组', 202252013670);
INSERT INTO `stu_group` VALUES (487, '云南组', 202252097798);
INSERT INTO `stu_group` VALUES (488, '芬兰组', 202252013745);
INSERT INTO `stu_group` VALUES (489, '罗安达组', 202252088915);
INSERT INTO `stu_group` VALUES (490, '朱由检组', 202252090818);
INSERT INTO `stu_group` VALUES (491, '加德满都组', 202252086806);
INSERT INTO `stu_group` VALUES (492, '秘鲁组', 202252056824);
INSERT INTO `stu_group` VALUES (493, '正常组', 202252083785);
INSERT INTO `stu_group` VALUES (494, '子夜组', 202252086987);
INSERT INTO `stu_group` VALUES (495, '内蒙古卫视组', 202252010954);
INSERT INTO `stu_group` VALUES (496, '羊肉组', 202252089755);
INSERT INTO `stu_group` VALUES (497, '琼组', 202252010622);
INSERT INTO `stu_group` VALUES (498, '朱由校组', 202252065011);
INSERT INTO `stu_group` VALUES (499, '强组', 202252060669);
INSERT INTO `stu_group` VALUES (500, '福临组', 202252056128);
INSERT INTO `stu_group` VALUES (501, '唐睿宗组', 202252069194);
INSERT INTO `stu_group` VALUES (502, '兰陵笑笑生组', 202252092149);
INSERT INTO `stu_group` VALUES (503, '宋太祖组', 202252099466);
INSERT INTO `stu_group` VALUES (504, '朱翊钧组', 202252098808);
INSERT INTO `stu_group` VALUES (505, '明宣宗组', 202252031637);
INSERT INTO `stu_group` VALUES (506, '宋钦宗组', 202252056208);
INSERT INTO `stu_group` VALUES (507, '英格兰组', 202252086343);
INSERT INTO `stu_group` VALUES (508, '云组', 202252012736);
INSERT INTO `stu_group` VALUES (509, '贵州卫视组', 202252075039);
INSERT INTO `stu_group` VALUES (510, '伊拉克组', 202252046874);
INSERT INTO `stu_group` VALUES (511, '安哥拉组', 202252021708);
INSERT INTO `stu_group` VALUES (512, '卡夫卡组', 202252047316);
INSERT INTO `stu_group` VALUES (513, '消极组', 202252007639);
INSERT INTO `stu_group` VALUES (514, '失败组', 202252005276);
INSERT INTO `stu_group` VALUES (515, '这么组', 202252029580);
INSERT INTO `stu_group` VALUES (516, '脆弱组', 202252020616);
INSERT INTO `stu_group` VALUES (517, '宋恭帝组', 202252098394);
INSERT INTO `stu_group` VALUES (518, '正常组', 202252003596);
INSERT INTO `stu_group` VALUES (519, '沈阳组', 202252097814);
INSERT INTO `stu_group` VALUES (520, '洪晓波组', 202252040515);
INSERT INTO `stu_group` VALUES (521, '丈母组', 202252027374);
INSERT INTO `stu_group` VALUES (522, '丈夫组', 202252016776);
INSERT INTO `stu_group` VALUES (523, '努尔哈赤组', 202252011961);
INSERT INTO `stu_group` VALUES (524, '赶集网组', 202252067460);
INSERT INTO `stu_group` VALUES (525, '狗组', 202252033459);
INSERT INTO `stu_group` VALUES (526, '清宣宗组', 202252027159);
INSERT INTO `stu_group` VALUES (527, '司马炎组', 202252082358);
INSERT INTO `stu_group` VALUES (528, '宽广组', 202252068001);
INSERT INTO `stu_group` VALUES (529, '青海大学组', 202252047678);
INSERT INTO `stu_group` VALUES (530, '金瓶梅组', 202252050086);
INSERT INTO `stu_group` VALUES (531, '重庆组', 202252081182);
INSERT INTO `stu_group` VALUES (532, '越南组', 202252027217);
INSERT INTO `stu_group` VALUES (533, '罗安达组', 202252023336);
INSERT INTO `stu_group` VALUES (534, '沈括组', 202252043682);
INSERT INTO `stu_group` VALUES (535, '苏组', 202252067755);
INSERT INTO `stu_group` VALUES (536, '林吉特组', 202252061329);
INSERT INTO `stu_group` VALUES (537, '刘彻组', 202252031486);
INSERT INTO `stu_group` VALUES (538, '粗组', 202252050293);
INSERT INTO `stu_group` VALUES (539, '浙江组', 202252049177);
INSERT INTO `stu_group` VALUES (540, '山东组', 202252007317);
INSERT INTO `stu_group` VALUES (541, '明光宗组', 202252029620);
INSERT INTO `stu_group` VALUES (542, '匈牙利组', 202252053846);
INSERT INTO `stu_group` VALUES (543, '河北组', 202252020036);
INSERT INTO `stu_group` VALUES (544, '丑组', 202252095058);
INSERT INTO `stu_group` VALUES (545, '李旦组', 202252006241);
INSERT INTO `stu_group` VALUES (546, '复杂组', 202252078781);
INSERT INTO `stu_group` VALUES (547, '氧化氢组', 202252047850);
INSERT INTO `stu_group` VALUES (548, '静夜思组', 202252030346);
INSERT INTO `stu_group` VALUES (549, '但丁组', 202252060049);
INSERT INTO `stu_group` VALUES (550, '湘组', 202252095103);
INSERT INTO `stu_group` VALUES (551, '弘历组', 202252061418);
INSERT INTO `stu_group` VALUES (552, '山东组', 202252027086);
INSERT INTO `stu_group` VALUES (553, '俄罗斯组', 202252013696);
INSERT INTO `stu_group` VALUES (554, '乌克兰组', 202252016384);
INSERT INTO `stu_group` VALUES (555, '北京组', 202252076431);
INSERT INTO `stu_group` VALUES (556, '四川组', 202252049705);
INSERT INTO `stu_group` VALUES (557, '薄伽丘组', 202252057845);
INSERT INTO `stu_group` VALUES (558, '沈阳组', 202252038440);
INSERT INTO `stu_group` VALUES (559, '司汤达组', 202252033676);
INSERT INTO `stu_group` VALUES (560, '广州组', 202252032658);
INSERT INTO `stu_group` VALUES (561, '辽宁组', 202252040812);
INSERT INTO `stu_group` VALUES (562, '老挝组', 202252020437);
INSERT INTO `stu_group` VALUES (563, '广东组', 202252072872);
INSERT INTO `stu_group` VALUES (564, '卢梭组', 202252092545);
INSERT INTO `stu_group` VALUES (565, '九月组', 202252034080);
INSERT INTO `stu_group` VALUES (566, '贵州大学组', 202252085127);
INSERT INTO `stu_group` VALUES (567, '苏丹组', 202252031529);
INSERT INTO `stu_group` VALUES (568, '古巴组', 202252075304);
INSERT INTO `stu_group` VALUES (569, '宋哲宗组', 202252039444);
INSERT INTO `stu_group` VALUES (570, '桂圆组', 202252068681);
INSERT INTO `stu_group` VALUES (571, '狄更斯组', 202252076259);
INSERT INTO `stu_group` VALUES (572, '坚强组', 202252057875);
INSERT INTO `stu_group` VALUES (573, '赶集网组', 202252071269);
INSERT INTO `stu_group` VALUES (574, '墨西哥组', 202252038133);
INSERT INTO `stu_group` VALUES (575, '宋钦宗组', 202252031106);
INSERT INTO `stu_group` VALUES (576, '川端康成组', 202252082382);
INSERT INTO `stu_group` VALUES (577, '朱瞻基组', 202252081619);
INSERT INTO `stu_group` VALUES (578, '伯母组', 202252084696);
INSERT INTO `stu_group` VALUES (579, '新疆卫视组', 202252027680);
INSERT INTO `stu_group` VALUES (580, '上海组', 202252084412);
INSERT INTO `stu_group` VALUES (581, '皇太极组', 202252011157);
INSERT INTO `stu_group` VALUES (582, '李白组', 202252022717);
INSERT INTO `stu_group` VALUES (583, '勾践组', 202252030226);
INSERT INTO `stu_group` VALUES (584, '丁磊组', 202252092892);
INSERT INTO `stu_group` VALUES (585, '苹果组', 202252039929);
INSERT INTO `stu_group` VALUES (586, '唐中宗组', 202252091133);
INSERT INTO `stu_group` VALUES (587, '粤组', 202252075028);
INSERT INTO `stu_group` VALUES (588, '万象组', 202252098744);
INSERT INTO `stu_group` VALUES (589, '重组', 202252042192);
INSERT INTO `stu_group` VALUES (590, '陶渊明组', 202252028073);
INSERT INTO `stu_group` VALUES (591, '唐璜组', 202252052017);
INSERT INTO `stu_group` VALUES (592, '清圣祖组', 202252088360);
INSERT INTO `stu_group` VALUES (593, '姥姥组', 202252013200);
INSERT INTO `stu_group` VALUES (594, '智利组', 202252005843);
INSERT INTO `stu_group` VALUES (595, '美组', 202252067345);
INSERT INTO `stu_group` VALUES (596, '固体组', 202252097271);
INSERT INTO `stu_group` VALUES (597, '渺小组', 202252069684);
INSERT INTO `stu_group` VALUES (598, '尼日利亚组', 202252044834);
INSERT INTO `stu_group` VALUES (599, '广西组', 202252081906);
INSERT INTO `stu_group` VALUES (600, '安徽组', 202252000756);
INSERT INTO `stu_group` VALUES (601, '赵匡胤组', 202252012824);
INSERT INTO `stu_group` VALUES (602, '姥爷组', 202252098983);
INSERT INTO `stu_group` VALUES (603, '第纳尔组', 202252041295);
INSERT INTO `stu_group` VALUES (604, '汤显祖组', 202252058057);
INSERT INTO `stu_group` VALUES (605, '孔子组', 202252012111);
INSERT INTO `stu_group` VALUES (606, '京组', 202252095976);
INSERT INTO `stu_group` VALUES (607, '清穆宗组', 202252064708);
INSERT INTO `stu_group` VALUES (608, '旻宁组', 202252074414);
INSERT INTO `stu_group` VALUES (609, '危险组', 202252091675);
INSERT INTO `stu_group` VALUES (610, '瑞典组', 202252055310);
INSERT INTO `stu_group` VALUES (611, '晋武帝组', 202252089344);
INSERT INTO `stu_group` VALUES (612, '朱佑樘组', 202252007601);
INSERT INTO `stu_group` VALUES (613, '赵昰组', 202252014476);
INSERT INTO `stu_group` VALUES (614, '吴承恩组', 202252073774);
INSERT INTO `stu_group` VALUES (615, '朱自清组', 202252089693);
INSERT INTO `stu_group` VALUES (616, '云南大学组', 202252049232);
INSERT INTO `stu_group` VALUES (617, '兹罗提组', 202252081523);
INSERT INTO `stu_group` VALUES (618, '毕升组', 202252080784);
INSERT INTO `stu_group` VALUES (619, '美团组', 202252017989);
INSERT INTO `stu_group` VALUES (620, '旻宁组', 202252094604);
INSERT INTO `stu_group` VALUES (621, '公鸡组', 202252049379);
INSERT INTO `stu_group` VALUES (622, '朱元璋组', 202252039755);
INSERT INTO `stu_group` VALUES (623, '河南组', 202252060194);
INSERT INTO `stu_group` VALUES (624, '核桃树组', 202252060054);
INSERT INTO `stu_group` VALUES (625, '西组', 202252072192);
INSERT INTO `stu_group` VALUES (626, '江苏卫视组', 202252073026);
INSERT INTO `stu_group` VALUES (627, '赵曙组', 202252061758);
INSERT INTO `stu_group` VALUES (628, '孙权组', 202252013589);
INSERT INTO `stu_group` VALUES (629, '许广平组', 202252032268);
INSERT INTO `stu_group` VALUES (630, '赵扩组', 202252064251);
INSERT INTO `stu_group` VALUES (631, '但丁组', 202252009174);
INSERT INTO `stu_group` VALUES (632, '柬埔寨组', 202252058214);
INSERT INTO `stu_group` VALUES (633, '元组', 202252026196);
INSERT INTO `stu_group` VALUES (634, '造纸术组', 202252075383);
INSERT INTO `stu_group` VALUES (635, '明英宗组', 202252017153);
INSERT INTO `stu_group` VALUES (636, '开罗组', 202252059333);
INSERT INTO `stu_group` VALUES (637, '渥太华组', 202252076082);
INSERT INTO `stu_group` VALUES (638, '母鸡组', 202252093839);
INSERT INTO `stu_group` VALUES (639, '尤利西斯组', 202252090599);
INSERT INTO `stu_group` VALUES (640, '利马组', 202252004317);
INSERT INTO `stu_group` VALUES (641, '清宣宗组', 202252083026);
INSERT INTO `stu_group` VALUES (642, '浙组', 202252079663);
INSERT INTO `stu_group` VALUES (643, '京组', 202252062283);
INSERT INTO `stu_group` VALUES (644, '高组', 202252026410);
INSERT INTO `stu_group` VALUES (645, '荷塘月色组', 202252078229);
INSERT INTO `stu_group` VALUES (646, '土耳其组', 202252056256);
INSERT INTO `stu_group` VALUES (647, '青海大学组', 202252056278);
INSERT INTO `stu_group` VALUES (648, '载湉组', 202252020142);
INSERT INTO `stu_group` VALUES (649, '辽组', 202252006925);
INSERT INTO `stu_group` VALUES (650, '开罗组', 202252059434);
INSERT INTO `stu_group` VALUES (651, '黑龙江大学组', 202252047936);
INSERT INTO `stu_group` VALUES (652, '石榴树组', 202252005209);
INSERT INTO `stu_group` VALUES (653, '济南组', 202252013745);
INSERT INTO `stu_group` VALUES (654, '窄组', 202252034203);
INSERT INTO `stu_group` VALUES (655, '天堂组', 202252085077);
INSERT INTO `stu_group` VALUES (656, '打开组', 202252029667);
INSERT INTO `stu_group` VALUES (657, '雷雨组', 202252088763);
INSERT INTO `stu_group` VALUES (658, '岳父组', 202252042648);
INSERT INTO `stu_group` VALUES (659, '圣地亚哥组', 202252058883);
INSERT INTO `stu_group` VALUES (660, '冷组', 202252096923);
INSERT INTO `stu_group` VALUES (661, '广西组', 202252033197);
INSERT INTO `stu_group` VALUES (662, '李渊组', 202252080569);
INSERT INTO `stu_group` VALUES (663, '宋恭帝组', 202252073149);
INSERT INTO `stu_group` VALUES (664, '贵州组', 202252069938);
INSERT INTO `stu_group` VALUES (665, '吉林组', 202252015157);
INSERT INTO `stu_group` VALUES (666, '电灯组', 202252038781);
INSERT INTO `stu_group` VALUES (667, '张朝阳组', 202252078958);
INSERT INTO `stu_group` VALUES (668, '公狮组', 202252067756);
INSERT INTO `stu_group` VALUES (669, '浙江组', 202252019287);
INSERT INTO `stu_group` VALUES (670, '意大利组', 202252067755);
INSERT INTO `stu_group` VALUES (671, '西安组', 202252028824);
INSERT INTO `stu_group` VALUES (672, '马其顿组', 202252047382);
INSERT INTO `stu_group` VALUES (673, '李渊组', 202252073258);
INSERT INTO `stu_group` VALUES (674, '赵桓组', 202252057665);
INSERT INTO `stu_group` VALUES (675, '静夜思组', 202252072296);
INSERT INTO `stu_group` VALUES (676, '妹妹组', 202252045487);
INSERT INTO `stu_group` VALUES (677, '丹麦组', 202252035285);
INSERT INTO `stu_group` VALUES (678, '德国组', 202252029164);
INSERT INTO `stu_group` VALUES (679, '首组', 202252070117);
INSERT INTO `stu_group` VALUES (680, '赵曙组', 202252085092);
INSERT INTO `stu_group` VALUES (681, '赵昰组', 202252096396);
INSERT INTO `stu_group` VALUES (682, '库纳组', 202252010672);
INSERT INTO `stu_group` VALUES (683, '低组', 202252005368);
INSERT INTO `stu_group` VALUES (684, '河北组', 202252096398);
INSERT INTO `stu_group` VALUES (685, '山西卫视组', 202252029231);
INSERT INTO `stu_group` VALUES (686, '里斯本组', 202252064390);
INSERT INTO `stu_group` VALUES (687, '母熊组', 202252077356);
INSERT INTO `stu_group` VALUES (688, '蘑菇街组', 202252021740);
INSERT INTO `stu_group` VALUES (689, '阿尔巴尼亚组', 202252072771);
INSERT INTO `stu_group` VALUES (690, '继母组', 202252063402);
INSERT INTO `stu_group` VALUES (691, '静夜思组', 202252008251);
INSERT INTO `stu_group` VALUES (692, '西班牙组', 202252028344);
INSERT INTO `stu_group` VALUES (693, '雅典组', 202252055451);
INSERT INTO `stu_group` VALUES (694, '广西卫视组', 202252058840);
INSERT INTO `stu_group` VALUES (695, '朱佑樘组', 202252029846);
INSERT INTO `stu_group` VALUES (696, '上海组', 202252085033);
INSERT INTO `stu_group` VALUES (697, '桃树组', 202252017286);
INSERT INTO `stu_group` VALUES (698, '拜伦组', 202252039030);
INSERT INTO `stu_group` VALUES (699, '伪君子组', 202252070107);
INSERT INTO `stu_group` VALUES (700, '粤组', 202252001435);
INSERT INTO `stu_group` VALUES (701, '湖南卫视组', 202252026925);
INSERT INTO `stu_group` VALUES (702, '荔枝组', 202252024254);
INSERT INTO `stu_group` VALUES (703, '陈国组', 202252081890);
INSERT INTO `stu_group` VALUES (704, '济南组', 202252002231);
INSERT INTO `stu_group` VALUES (705, '山东组', 202252032118);
INSERT INTO `stu_group` VALUES (706, '明神宗组', 202252086094);
INSERT INTO `stu_group` VALUES (707, '宋端宗组', 202252007914);
INSERT INTO `stu_group` VALUES (708, '广东组', 202252022925);
INSERT INTO `stu_group` VALUES (709, '朱由检组', 202252061868);
INSERT INTO `stu_group` VALUES (710, '河南组', 202252001989);
INSERT INTO `stu_group` VALUES (711, '母羊组', 202252056842);
INSERT INTO `stu_group` VALUES (712, '水浒传组', 202252017259);
INSERT INTO `stu_group` VALUES (713, '鄂组', 202252031381);
INSERT INTO `stu_group` VALUES (714, '喀布尔组', 202252073185);
INSERT INTO `stu_group` VALUES (715, '澳大利亚组', 202252060414);
INSERT INTO `stu_group` VALUES (716, '板栗组', 202252040861);
INSERT INTO `stu_group` VALUES (717, '宋度宗组', 202252031412);
INSERT INTO `stu_group` VALUES (718, '宋端宗组', 202252018821);
INSERT INTO `stu_group` VALUES (719, '青海组', 202252095413);
INSERT INTO `stu_group` VALUES (720, '福州组', 202252003015);
INSERT INTO `stu_group` VALUES (721, '兰陵笑笑生组', 202252093766);
INSERT INTO `stu_group` VALUES (722, '忏悔录组', 202252064880);
INSERT INTO `stu_group` VALUES (723, '越南组', 202252021019);
INSERT INTO `stu_group` VALUES (724, '赵顼组', 202252034919);
INSERT INTO `stu_group` VALUES (725, '海南组', 202252079638);
INSERT INTO `stu_group` VALUES (726, '美组', 202252001705);
INSERT INTO `stu_group` VALUES (727, '胤禛组', 202252059425);
INSERT INTO `stu_group` VALUES (728, '那么组', 202252090742);
INSERT INTO `stu_group` VALUES (729, '匈牙利组', 202252010945);
INSERT INTO `stu_group` VALUES (730, '伪君子组', 202252025755);
INSERT INTO `stu_group` VALUES (731, '皇太极组', 202252013549);
INSERT INTO `stu_group` VALUES (732, '那些组', 202252078027);
INSERT INTO `stu_group` VALUES (733, '低组', 202252046843);
INSERT INTO `stu_group` VALUES (734, '广西组', 202252090227);
INSERT INTO `stu_group` VALUES (735, '四川组', 202252014130);
INSERT INTO `stu_group` VALUES (736, '三国演义组', 202252011717);
INSERT INTO `stu_group` VALUES (737, '保加利亚组', 202252075722);
INSERT INTO `stu_group` VALUES (738, '项链组', 202252002819);
INSERT INTO `stu_group` VALUES (739, '乙酸组', 202252074617);
INSERT INTO `stu_group` VALUES (740, '上海卫视组', 202252066919);
INSERT INTO `stu_group` VALUES (741, '鄂组', 202252005119);
INSERT INTO `stu_group` VALUES (742, '万象组', 202252058297);
INSERT INTO `stu_group` VALUES (743, '爹组', 202252004137);
INSERT INTO `stu_group` VALUES (744, '湖南组', 202252012816);
INSERT INTO `stu_group` VALUES (745, '异常组', 202252010755);
INSERT INTO `stu_group` VALUES (746, '堪培拉组', 202252048396);
INSERT INTO `stu_group` VALUES (747, '重组', 202252034487);
INSERT INTO `stu_group` VALUES (748, '龚宇盛组', 202252018868);
INSERT INTO `stu_group` VALUES (749, '古巴组', 202252053621);
INSERT INTO `stu_group` VALUES (750, '李治组', 202252013703);
INSERT INTO `stu_group` VALUES (751, '公鸭组', 202252058854);
INSERT INTO `stu_group` VALUES (752, '金锁记组', 202252061754);
INSERT INTO `stu_group` VALUES (753, '乌鲁木齐组', 202252058623);
INSERT INTO `stu_group` VALUES (754, '罗马尼亚组', 202252084404);
INSERT INTO `stu_group` VALUES (755, '明世宗组', 202252045852);
INSERT INTO `stu_group` VALUES (756, '洛阳组', 202252024923);
INSERT INTO `stu_group` VALUES (757, '青海卫视组', 202252027430);
INSERT INTO `stu_group` VALUES (758, '俄罗斯组', 202252090942);
INSERT INTO `stu_group` VALUES (759, '南宋组', 202252004076);
INSERT INTO `stu_group` VALUES (760, '颙琰组', 202252091444);
INSERT INTO `stu_group` VALUES (761, '阿尔及利亚组', 202252028234);
INSERT INTO `stu_group` VALUES (762, '红楼梦组', 202252083800);
INSERT INTO `stu_group` VALUES (763, '施耐庵组', 202252009889);
INSERT INTO `stu_group` VALUES (764, '小米组', 202252040287);
INSERT INTO `stu_group` VALUES (765, '委内瑞拉组', 202252071644);
INSERT INTO `stu_group` VALUES (766, '鄂组', 202252042032);
INSERT INTO `stu_group` VALUES (767, '努尔哈赤组', 202252043717);
INSERT INTO `stu_group` VALUES (768, '酷暑组', 202252049564);
INSERT INTO `stu_group` VALUES (769, '安徽组', 202252010250);
INSERT INTO `stu_group` VALUES (770, '香蕉树组', 202252081735);
INSERT INTO `stu_group` VALUES (771, '母狗组', 202252069178);
INSERT INTO `stu_group` VALUES (772, '南京组', 202252062845);
INSERT INTO `stu_group` VALUES (773, '宋哲宗组', 202252077138);
INSERT INTO `stu_group` VALUES (774, '岳父组', 202252031233);
INSERT INTO `stu_group` VALUES (775, '琼组', 202252008841);
INSERT INTO `stu_group` VALUES (776, '宋太宗组', 202252006876);
INSERT INTO `stu_group` VALUES (777, '朱棣组', 202252078557);
INSERT INTO `stu_group` VALUES (778, '哈尔滨组', 202252007562);
INSERT INTO `stu_group` VALUES (779, '美组', 202252008373);
INSERT INTO `stu_group` VALUES (780, '女人组', 202252028607);
INSERT INTO `stu_group` VALUES (781, '山东组', 202252021722);
INSERT INTO `stu_group` VALUES (782, '浅组', 202252013189);
INSERT INTO `stu_group` VALUES (783, '尾组', 202252014108);
INSERT INTO `stu_group` VALUES (784, '四川卫视组', 202252091973);
INSERT INTO `stu_group` VALUES (785, '天组', 202252065902);
INSERT INTO `stu_group` VALUES (786, '温暖组', 202252049818);
INSERT INTO `stu_group` VALUES (787, '哈姆雷特组', 202252086297);
INSERT INTO `stu_group` VALUES (788, '尼日利亚组', 202252041704);
INSERT INTO `stu_group` VALUES (789, '巴格达组', 202252051240);
INSERT INTO `stu_group` VALUES (790, '苏丹组', 202252097368);
INSERT INTO `stu_group` VALUES (791, '尤利西斯组', 202252029166);
INSERT INTO `stu_group` VALUES (792, '四川组', 202252001301);
INSERT INTO `stu_group` VALUES (793, '堪培拉组', 202252034681);
INSERT INTO `stu_group` VALUES (794, '芬兰组', 202252085404);
INSERT INTO `stu_group` VALUES (795, '玄烨组', 202252075789);
INSERT INTO `stu_group` VALUES (796, '马云组', 202252020217);
INSERT INTO `stu_group` VALUES (797, '载湉组', 202252034676);
INSERT INTO `stu_group` VALUES (798, '母猴组', 202252024727);
INSERT INTO `stu_group` VALUES (799, '莎士比亚组', 202252022098);
INSERT INTO `stu_group` VALUES (800, '分裂组', 202252078184);
INSERT INTO `stu_group` VALUES (801, '狗肉组', 202252072729);
INSERT INTO `stu_group` VALUES (802, '辽宁组', 202252050214);
INSERT INTO `stu_group` VALUES (803, '桃组', 202252026556);
INSERT INTO `stu_group` VALUES (804, '奥地利组', 202252069410);
INSERT INTO `stu_group` VALUES (805, '邹胜龙组', 202252014758);
INSERT INTO `stu_group` VALUES (806, '罗马尼亚组', 202252000388);
INSERT INTO `stu_group` VALUES (807, '天津组', 202252047239);
INSERT INTO `stu_group` VALUES (808, '重庆卫视组', 202252044923);
INSERT INTO `stu_group` VALUES (809, '利马组', 202252061071);
INSERT INTO `stu_group` VALUES (810, '驸马组', 202252058317);
INSERT INTO `stu_group` VALUES (811, '湖南组', 202252087012);
INSERT INTO `stu_group` VALUES (812, '公牛组', 202252080809);
INSERT INTO `stu_group` VALUES (813, '失望组', 202252001627);
INSERT INTO `stu_group` VALUES (814, '丁磊组', 202252020141);
INSERT INTO `stu_group` VALUES (815, '西厢记组', 202252036527);
INSERT INTO `stu_group` VALUES (816, '碳酸钠组', 202252072290);
INSERT INTO `stu_group` VALUES (817, '罗安达组', 202252082100);
INSERT INTO `stu_group` VALUES (818, '青海组', 202252058570);
INSERT INTO `stu_group` VALUES (819, '离骚组', 202252052409);
INSERT INTO `stu_group` VALUES (820, '熟悉组', 202252021222);
INSERT INTO `stu_group` VALUES (821, '山西组', 202252043792);
INSERT INTO `stu_group` VALUES (822, '广西组', 202252031524);
INSERT INTO `stu_group` VALUES (823, '金锁记组', 202252024268);
INSERT INTO `stu_group` VALUES (824, '河内组', 202252020914);
INSERT INTO `stu_group` VALUES (825, '伯母组', 202252099157);
INSERT INTO `stu_group` VALUES (826, '明孝宗组', 202252015290);
INSERT INTO `stu_group` VALUES (827, '上组', 202252081733);
INSERT INTO `stu_group` VALUES (828, '这家组', 202252012008);
INSERT INTO `stu_group` VALUES (829, '皇帝组', 202252041364);
INSERT INTO `stu_group` VALUES (830, '葡萄组', 202252020825);
INSERT INTO `stu_group` VALUES (831, '失败组', 202252074807);
INSERT INTO `stu_group` VALUES (832, '山东卫视组', 202252020109);
INSERT INTO `stu_group` VALUES (833, '人民币组', 202252003845);
INSERT INTO `stu_group` VALUES (834, '华沙组', 202252091331);
INSERT INTO `stu_group` VALUES (835, '恐龙蛋组', 202252068568);
INSERT INTO `stu_group` VALUES (836, '几内亚组', 202252070496);
INSERT INTO `stu_group` VALUES (837, '清圣祖组', 202252018196);
INSERT INTO `stu_group` VALUES (838, '加拿大组', 202252091836);
INSERT INTO `stu_group` VALUES (839, '拜伦组', 202252067513);
INSERT INTO `stu_group` VALUES (840, '宁夏组', 202252085066);
INSERT INTO `stu_group` VALUES (841, '黄金时代组', 202252037759);
INSERT INTO `stu_group` VALUES (842, '哥本哈根组', 202252017401);
INSERT INTO `stu_group` VALUES (843, '清世祖组', 202252029691);
INSERT INTO `stu_group` VALUES (844, '青海组', 202252065278);
INSERT INTO `stu_group` VALUES (845, '黄金时代组', 202252010337);
INSERT INTO `stu_group` VALUES (846, '明世宗组', 202252069294);
INSERT INTO `stu_group` VALUES (847, '公鸡组', 202252022584);
INSERT INTO `stu_group` VALUES (848, '越南组', 202252000493);
INSERT INTO `stu_group` VALUES (849, '亚马逊组', 202252000317);
INSERT INTO `stu_group` VALUES (850, '清太宗组', 202252029918);
INSERT INTO `stu_group` VALUES (851, '铢组', 202252000355);
INSERT INTO `stu_group` VALUES (852, '瑞典组', 202252097797);
INSERT INTO `stu_group` VALUES (853, '迅雷组', 202252084782);
INSERT INTO `stu_group` VALUES (854, '新浪组', 202252087827);
INSERT INTO `stu_group` VALUES (855, '陌生组', 202252027651);
INSERT INTO `stu_group` VALUES (856, '红与黑组', 202252073039);
INSERT INTO `stu_group` VALUES (857, '出师表组', 202252005834);
INSERT INTO `stu_group` VALUES (858, '寒冷组', 202252073390);
INSERT INTO `stu_group` VALUES (859, '柬埔寨组', 202252005284);
INSERT INTO `stu_group` VALUES (860, '朱棣组', 202252071049);
INSERT INTO `stu_group` VALUES (861, '唐太宗组', 202252033853);
INSERT INTO `stu_group` VALUES (862, '乔布斯组', 202252015351);
INSERT INTO `stu_group` VALUES (863, '哥本哈根组', 202252068078);
INSERT INTO `stu_group` VALUES (864, '河南卫视组', 202252060402);
INSERT INTO `stu_group` VALUES (865, '唐越组', 202252038917);
INSERT INTO `stu_group` VALUES (866, '澳大利亚组', 202252038419);
INSERT INTO `stu_group` VALUES (867, '浅组', 202252057507);
INSERT INTO `stu_group` VALUES (868, '羊组', 202252053174);
INSERT INTO `stu_group` VALUES (869, '阿富汗组', 202252099625);
INSERT INTO `stu_group` VALUES (870, '百度组', 202252024291);
INSERT INTO `stu_group` VALUES (871, '钡餐组', 202252089768);
INSERT INTO `stu_group` VALUES (872, '美团组', 202252041331);
INSERT INTO `stu_group` VALUES (873, '张朝阳组', 202252081065);
INSERT INTO `stu_group` VALUES (874, '万象组', 202252039170);
INSERT INTO `stu_group` VALUES (875, '豫组', 202252032060);
INSERT INTO `stu_group` VALUES (876, '晋组', 202252005315);
INSERT INTO `stu_group` VALUES (877, '宋钦宗组', 202252065709);
INSERT INTO `stu_group` VALUES (878, '云南组', 202252060250);
INSERT INTO `stu_group` VALUES (879, '母猫组', 202252063141);
INSERT INTO `stu_group` VALUES (880, '安徽组', 202252079906);
INSERT INTO `stu_group` VALUES (881, '明神宗组', 202252011548);
INSERT INTO `stu_group` VALUES (882, '呼和浩特组', 202252097470);
INSERT INTO `stu_group` VALUES (883, '欧元组', 202252052782);
INSERT INTO `stu_group` VALUES (884, '海燕组', 202252054373);
INSERT INTO `stu_group` VALUES (885, '丈母组', 202252001476);
INSERT INTO `stu_group` VALUES (886, '进组', 202252060065);
INSERT INTO `stu_group` VALUES (887, '老挝组', 202252087773);
INSERT INTO `stu_group` VALUES (888, '伦敦组', 202252020953);
INSERT INTO `stu_group` VALUES (889, '开罗组', 202252066867);
INSERT INTO `stu_group` VALUES (890, '明宪宗组', 202252022451);
INSERT INTO `stu_group` VALUES (891, '范仲淹组', 202252016893);
INSERT INTO `stu_group` VALUES (892, '陌生组', 202252093146);
INSERT INTO `stu_group` VALUES (893, '内蒙古卫视组', 202252007868);
INSERT INTO `stu_group` VALUES (894, '节约组', 202252040280);
INSERT INTO `stu_group` VALUES (895, '江苏组', 202252052559);
INSERT INTO `stu_group` VALUES (896, '明代宗组', 202252097254);
INSERT INTO `stu_group` VALUES (897, '俄罗斯组', 202252081519);
INSERT INTO `stu_group` VALUES (898, '陶渊明组', 202252053410);
INSERT INTO `stu_group` VALUES (899, '桂圆树组', 202252054123);
INSERT INTO `stu_group` VALUES (900, '清世祖组', 202252060569);
INSERT INTO `stu_group` VALUES (901, '冷组', 202252092880);
INSERT INTO `stu_group` VALUES (902, '关汉卿组', 202252009415);
INSERT INTO `stu_group` VALUES (903, '明成祖组', 202252049345);
INSERT INTO `stu_group` VALUES (904, '契科夫组', 202252095329);
INSERT INTO `stu_group` VALUES (905, '窦娥冤组', 202252016652);
INSERT INTO `stu_group` VALUES (906, '安全组', 202252055923);
INSERT INTO `stu_group` VALUES (907, '丹麦组', 202252024189);
INSERT INTO `stu_group` VALUES (908, '委内瑞拉组', 202252083814);
INSERT INTO `stu_group` VALUES (909, '利比亚组', 202252073775);
INSERT INTO `stu_group` VALUES (910, '危险组', 202252057660);
INSERT INTO `stu_group` VALUES (911, '新组', 202252050962);
INSERT INTO `stu_group` VALUES (912, '马尼拉组', 202252095447);
INSERT INTO `stu_group` VALUES (913, '石榴树组', 202252065478);
INSERT INTO `stu_group` VALUES (914, '天堂组', 202252001933);
INSERT INTO `stu_group` VALUES (915, '贵州组', 202252023145);
INSERT INTO `stu_group` VALUES (916, '约旦组', 202252054594);
INSERT INTO `stu_group` VALUES (917, '东京组', 202252059667);
INSERT INTO `stu_group` VALUES (918, '吉林组', 202252065366);
INSERT INTO `stu_group` VALUES (919, '贾跃亭组', 202252093830);
INSERT INTO `stu_group` VALUES (920, '台北组', 202252024235);
INSERT INTO `stu_group` VALUES (921, '安哥拉组', 202252010973);
INSERT INTO `stu_group` VALUES (922, '四川组', 202252005209);
INSERT INTO `stu_group` VALUES (923, '里斯本组', 202252047158);
INSERT INTO `stu_group` VALUES (924, '拉特组', 202252058482);
INSERT INTO `stu_group` VALUES (925, '印度尼西亚组', 202252054951);
INSERT INTO `stu_group` VALUES (926, '宽广组', 202252034510);
INSERT INTO `stu_group` VALUES (927, '卢布组', 202252043104);
INSERT INTO `stu_group` VALUES (928, '里亚尔组', 202252032348);
INSERT INTO `stu_group` VALUES (929, '关汉卿组', 202252085874);
INSERT INTO `stu_group` VALUES (930, '希望组', 202252062720);
INSERT INTO `stu_group` VALUES (931, '神曲组', 202252037512);
INSERT INTO `stu_group` VALUES (932, '山西组', 202252041285);
INSERT INTO `stu_group` VALUES (933, '加拉加斯组', 202252038450);
INSERT INTO `stu_group` VALUES (934, '天堂组', 202252008312);
INSERT INTO `stu_group` VALUES (935, '青海大学组', 202252082679);
INSERT INTO `stu_group` VALUES (936, '陕西组', 202252086392);
INSERT INTO `stu_group` VALUES (937, '宋端宗组', 202252035276);
INSERT INTO `stu_group` VALUES (938, '清高宗组', 202252088655);
INSERT INTO `stu_group` VALUES (939, '宋宁宗组', 202252008717);
INSERT INTO `stu_group` VALUES (940, '盖茨组', 202252076778);
INSERT INTO `stu_group` VALUES (941, '狗组', 202252091726);
INSERT INTO `stu_group` VALUES (942, '瑞尔组', 202252013546);
INSERT INTO `stu_group` VALUES (943, '安哥拉组', 202252004120);
INSERT INTO `stu_group` VALUES (944, '云南组', 202252060431);
INSERT INTO `stu_group` VALUES (945, '埃及组', 202252000775);
INSERT INTO `stu_group` VALUES (946, '辽宁组', 202252059219);
INSERT INTO `stu_group` VALUES (947, '陈年组', 202252047878);
INSERT INTO `stu_group` VALUES (948, '火碱组', 202252074369);
INSERT INTO `stu_group` VALUES (949, '小组', 202252085289);
INSERT INTO `stu_group` VALUES (950, '论语组', 202252037486);
INSERT INTO `stu_group` VALUES (951, '司马迁组', 202252095911);
INSERT INTO `stu_group` VALUES (952, '变色龙组', 202252038120);
INSERT INTO `stu_group` VALUES (953, '青海卫视组', 202252050500);
INSERT INTO `stu_group` VALUES (954, '长安组', 202252059117);
INSERT INTO `stu_group` VALUES (955, '碳酸氢钠组', 202252070620);
INSERT INTO `stu_group` VALUES (956, '氯化钠组', 202252066766);
INSERT INTO `stu_group` VALUES (957, '赵昺组', 202252055557);
INSERT INTO `stu_group` VALUES (958, '长春组', 202252056000);
INSERT INTO `stu_group` VALUES (959, '网易组', 202252052530);
INSERT INTO `stu_group` VALUES (960, '日本组', 202252086217);
INSERT INTO `stu_group` VALUES (961, '近组', 202252036905);
INSERT INTO `stu_group` VALUES (962, '松组', 202252055325);
INSERT INTO `stu_group` VALUES (963, '骆驼祥子组', 202252009370);
INSERT INTO `stu_group` VALUES (964, '安曼组', 202252033968);
INSERT INTO `stu_group` VALUES (965, '海南大学组', 202252066125);
INSERT INTO `stu_group` VALUES (966, '伟大组', 202252002096);
INSERT INTO `stu_group` VALUES (967, '苏丹组', 202252031385);
INSERT INTO `stu_group` VALUES (968, '立特组', 202252018501);
INSERT INTO `stu_group` VALUES (969, '黑龙江组', 202252002989);
INSERT INTO `stu_group` VALUES (970, '卢梭组', 202252032277);
INSERT INTO `stu_group` VALUES (971, '今日头条组', 202252037981);
INSERT INTO `stu_group` VALUES (972, '阿富汗组', 202252009496);
INSERT INTO `stu_group` VALUES (973, '银川组', 202252004585);
INSERT INTO `stu_group` VALUES (974, '瑞典组', 202252091234);
INSERT INTO `stu_group` VALUES (975, '下班组', 202252069581);
INSERT INTO `stu_group` VALUES (976, '辽宁组', 202252024740);
INSERT INTO `stu_group` VALUES (977, '青海大学组', 202252085734);
INSERT INTO `stu_group` VALUES (978, '清太祖组', 202252027435);
INSERT INTO `stu_group` VALUES (979, '台湾组', 202252041461);
INSERT INTO `stu_group` VALUES (980, '司马炎组', 202252055546);
INSERT INTO `stu_group` VALUES (981, '保加利亚组', 202252040331);
INSERT INTO `stu_group` VALUES (982, '刘秀组', 202252026072);
INSERT INTO `stu_group` VALUES (983, '高中生组', 202252028377);
INSERT INTO `stu_group` VALUES (984, '诸葛亮组', 202252081682);
INSERT INTO `stu_group` VALUES (985, '曹禺组', 202252024760);
INSERT INTO `stu_group` VALUES (986, '曹雪芹组', 202252004383);
INSERT INTO `stu_group` VALUES (987, '复杂组', 202252090241);
INSERT INTO `stu_group` VALUES (988, '羊肉组', 202252050123);
INSERT INTO `stu_group` VALUES (989, '伦敦组', 202252082098);
INSERT INTO `stu_group` VALUES (990, '福林组', 202252080393);
INSERT INTO `stu_group` VALUES (991, '明宣宗组', 202252004920);
INSERT INTO `stu_group` VALUES (992, '山西组', 202252052933);
INSERT INTO `stu_group` VALUES (993, '尤利西斯组', 202252081292);
INSERT INTO `stu_group` VALUES (994, '上海卫视组', 202252050275);
INSERT INTO `stu_group` VALUES (995, '黎巴嫩组', 202252041315);
INSERT INTO `stu_group` VALUES (996, '狭窄组', 202252098346);
INSERT INTO `stu_group` VALUES (997, '阿尔及尔组', 202252095065);
INSERT INTO `stu_group` VALUES (998, '云南组', 202252065169);
INSERT INTO `stu_group` VALUES (999, '江苏组', 202252026734);
INSERT INTO `stu_group` VALUES (1000, '母狼组', 202252047760);

-- ----------------------------
-- Table structure for stu_to_tea
-- ----------------------------
DROP TABLE IF EXISTS `stu_to_tea`;
CREATE TABLE `stu_to_tea`  (
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生学号',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '老师工号',
  PRIMARY KEY (`stu_id`, `tea_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '多个学生对多个老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_to_tea
-- ----------------------------
INSERT INTO `stu_to_tea` VALUES ('202252000001', '19760532626');
INSERT INTO `stu_to_tea` VALUES ('202252000001', '19760532933');
INSERT INTO `stu_to_tea` VALUES ('202252000002', '19760532312');
INSERT INTO `stu_to_tea` VALUES ('202252000002', '19760532692');
INSERT INTO `stu_to_tea` VALUES ('202252000003', '19760532324');
INSERT INTO `stu_to_tea` VALUES ('202252000003', '19760532855');
INSERT INTO `stu_to_tea` VALUES ('202252000004', '19760532159');
INSERT INTO `stu_to_tea` VALUES ('202252000004', '19760532422');
INSERT INTO `stu_to_tea` VALUES ('202252000005', '19760532170');
INSERT INTO `stu_to_tea` VALUES ('202252000005', '19760532940');
INSERT INTO `stu_to_tea` VALUES ('202252000006', '19760532634');
INSERT INTO `stu_to_tea` VALUES ('202252000006', '19760532739');
INSERT INTO `stu_to_tea` VALUES ('202252000007', '19760532219');
INSERT INTO `stu_to_tea` VALUES ('202252000007', '19760532939');
INSERT INTO `stu_to_tea` VALUES ('202252000008', '19760532221');
INSERT INTO `stu_to_tea` VALUES ('202252000008', '19760532889');
INSERT INTO `stu_to_tea` VALUES ('202252000009', '19760532807');
INSERT INTO `stu_to_tea` VALUES ('202252000009', '19760532985');
INSERT INTO `stu_to_tea` VALUES ('202252000010', '19760532718');
INSERT INTO `stu_to_tea` VALUES ('202252000010', '19760532976');
INSERT INTO `stu_to_tea` VALUES ('202252000011', '19760532212');
INSERT INTO `stu_to_tea` VALUES ('202252000011', '19760532989');
INSERT INTO `stu_to_tea` VALUES ('202252000012', '19760532637');
INSERT INTO `stu_to_tea` VALUES ('202252000012', '19760532774');
INSERT INTO `stu_to_tea` VALUES ('202252000013', '19760532408');
INSERT INTO `stu_to_tea` VALUES ('202252000013', '19760532625');
INSERT INTO `stu_to_tea` VALUES ('202252000014', '19760532669');
INSERT INTO `stu_to_tea` VALUES ('202252000014', '19760532809');
INSERT INTO `stu_to_tea` VALUES ('202252000015', '19760532260');
INSERT INTO `stu_to_tea` VALUES ('202252000015', '19760533013');
INSERT INTO `stu_to_tea` VALUES ('202252000016', '19760532087');
INSERT INTO `stu_to_tea` VALUES ('202252000016', '19760532568');
INSERT INTO `stu_to_tea` VALUES ('202252000017', '19760532061');
INSERT INTO `stu_to_tea` VALUES ('202252000017', '19760532558');
INSERT INTO `stu_to_tea` VALUES ('202252000018', '19760532270');
INSERT INTO `stu_to_tea` VALUES ('202252000018', '19760532958');
INSERT INTO `stu_to_tea` VALUES ('202252000019', '19760532473');
INSERT INTO `stu_to_tea` VALUES ('202252000019', '19760532655');
INSERT INTO `stu_to_tea` VALUES ('202252000020', '19760532217');
INSERT INTO `stu_to_tea` VALUES ('202252000020', '19760532699');
INSERT INTO `stu_to_tea` VALUES ('202252000021', '19760532777');
INSERT INTO `stu_to_tea` VALUES ('202252000021', '19760532999');
INSERT INTO `stu_to_tea` VALUES ('202252000022', '19760532706');
INSERT INTO `stu_to_tea` VALUES ('202252000022', '19760532844');
INSERT INTO `stu_to_tea` VALUES ('202252000023', '19760532752');
INSERT INTO `stu_to_tea` VALUES ('202252000023', '19760532837');
INSERT INTO `stu_to_tea` VALUES ('202252000024', '19760532161');
INSERT INTO `stu_to_tea` VALUES ('202252000024', '19760532208');
INSERT INTO `stu_to_tea` VALUES ('202252000025', '19760532341');
INSERT INTO `stu_to_tea` VALUES ('202252000025', '19760532772');
INSERT INTO `stu_to_tea` VALUES ('202252000026', '19760532602');
INSERT INTO `stu_to_tea` VALUES ('202252000026', '19760533043');
INSERT INTO `stu_to_tea` VALUES ('202252000027', '19760532471');
INSERT INTO `stu_to_tea` VALUES ('202252000027', '19760532794');
INSERT INTO `stu_to_tea` VALUES ('202252000028', '19760532522');
INSERT INTO `stu_to_tea` VALUES ('202252000028', '19760532776');
INSERT INTO `stu_to_tea` VALUES ('202252000029', '19760532486');
INSERT INTO `stu_to_tea` VALUES ('202252000029', '19760532668');
INSERT INTO `stu_to_tea` VALUES ('202252000030', '19760532332');
INSERT INTO `stu_to_tea` VALUES ('202252000030', '19760532939');
INSERT INTO `stu_to_tea` VALUES ('202252000031', '19760532467');
INSERT INTO `stu_to_tea` VALUES ('202252000031', '19760532662');
INSERT INTO `stu_to_tea` VALUES ('202252000032', '19760532181');
INSERT INTO `stu_to_tea` VALUES ('202252000032', '19760532547');
INSERT INTO `stu_to_tea` VALUES ('202252000033', '19760532149');
INSERT INTO `stu_to_tea` VALUES ('202252000033', '19760532221');
INSERT INTO `stu_to_tea` VALUES ('202252000034', '19760532088');
INSERT INTO `stu_to_tea` VALUES ('202252000034', '19760532760');
INSERT INTO `stu_to_tea` VALUES ('202252000035', '19760532104');
INSERT INTO `stu_to_tea` VALUES ('202252000035', '19760533042');
INSERT INTO `stu_to_tea` VALUES ('202252000036', '19760532257');
INSERT INTO `stu_to_tea` VALUES ('202252000036', '19760532651');
INSERT INTO `stu_to_tea` VALUES ('202252000037', '19760532668');
INSERT INTO `stu_to_tea` VALUES ('202252000037', '19760532930');
INSERT INTO `stu_to_tea` VALUES ('202252000038', '19760532801');
INSERT INTO `stu_to_tea` VALUES ('202252000038', '19760532971');
INSERT INTO `stu_to_tea` VALUES ('202252000039', '19760532412');
INSERT INTO `stu_to_tea` VALUES ('202252000039', '19760532465');
INSERT INTO `stu_to_tea` VALUES ('202252000040', '19760532106');
INSERT INTO `stu_to_tea` VALUES ('202252000040', '19760532209');
INSERT INTO `stu_to_tea` VALUES ('202252000041', '19760532624');
INSERT INTO `stu_to_tea` VALUES ('202252000041', '19760532727');
INSERT INTO `stu_to_tea` VALUES ('202252000042', '19760532496');
INSERT INTO `stu_to_tea` VALUES ('202252000042', '19760532768');
INSERT INTO `stu_to_tea` VALUES ('202252000043', '19760532426');
INSERT INTO `stu_to_tea` VALUES ('202252000043', '19760532626');
INSERT INTO `stu_to_tea` VALUES ('202252000044', '19760532181');
INSERT INTO `stu_to_tea` VALUES ('202252000044', '19760532671');
INSERT INTO `stu_to_tea` VALUES ('202252000045', '19760532643');
INSERT INTO `stu_to_tea` VALUES ('202252000045', '19760532919');
INSERT INTO `stu_to_tea` VALUES ('202252000046', '19760532165');
INSERT INTO `stu_to_tea` VALUES ('202252000046', '19760532187');
INSERT INTO `stu_to_tea` VALUES ('202252000047', '19760532061');
INSERT INTO `stu_to_tea` VALUES ('202252000047', '19760532773');
INSERT INTO `stu_to_tea` VALUES ('202252000048', '19760532489');
INSERT INTO `stu_to_tea` VALUES ('202252000048', '19760532819');
INSERT INTO `stu_to_tea` VALUES ('202252000049', '19760532464');
INSERT INTO `stu_to_tea` VALUES ('202252000049', '19760532634');
INSERT INTO `stu_to_tea` VALUES ('202252000050', '19760532573');
INSERT INTO `stu_to_tea` VALUES ('202252000050', '19760533041');
INSERT INTO `stu_to_tea` VALUES ('202252000051', '19760532435');
INSERT INTO `stu_to_tea` VALUES ('202252000051', '19760532892');
INSERT INTO `stu_to_tea` VALUES ('202252000052', '19760532894');
INSERT INTO `stu_to_tea` VALUES ('202252000052', '19760533017');
INSERT INTO `stu_to_tea` VALUES ('202252000053', '19760532270');
INSERT INTO `stu_to_tea` VALUES ('202252000053', '19760532897');
INSERT INTO `stu_to_tea` VALUES ('202252000054', '19760532103');
INSERT INTO `stu_to_tea` VALUES ('202252000054', '19760532759');
INSERT INTO `stu_to_tea` VALUES ('202252000055', '19760532121');
INSERT INTO `stu_to_tea` VALUES ('202252000055', '19760532142');
INSERT INTO `stu_to_tea` VALUES ('202252000056', '19760532253');
INSERT INTO `stu_to_tea` VALUES ('202252000056', '19760532806');
INSERT INTO `stu_to_tea` VALUES ('202252000057', '19760532459');
INSERT INTO `stu_to_tea` VALUES ('202252000057', '19760533022');
INSERT INTO `stu_to_tea` VALUES ('202252000058', '19760532777');
INSERT INTO `stu_to_tea` VALUES ('202252000058', '19760532930');
INSERT INTO `stu_to_tea` VALUES ('202252000059', '19760532505');
INSERT INTO `stu_to_tea` VALUES ('202252000059', '19760532548');
INSERT INTO `stu_to_tea` VALUES ('202252000060', '19760532750');
INSERT INTO `stu_to_tea` VALUES ('202252000060', '19760532858');
INSERT INTO `stu_to_tea` VALUES ('202252000061', '19760532521');
INSERT INTO `stu_to_tea` VALUES ('202252000061', '19760532641');
INSERT INTO `stu_to_tea` VALUES ('202252000062', '19760532409');
INSERT INTO `stu_to_tea` VALUES ('202252000062', '19760532776');
INSERT INTO `stu_to_tea` VALUES ('202252000063', '19760532170');
INSERT INTO `stu_to_tea` VALUES ('202252000063', '19760532626');
INSERT INTO `stu_to_tea` VALUES ('202252000064', '19760532401');
INSERT INTO `stu_to_tea` VALUES ('202252000064', '19760532854');
INSERT INTO `stu_to_tea` VALUES ('202252000065', '19760532279');
INSERT INTO `stu_to_tea` VALUES ('202252000065', '19760532735');
INSERT INTO `stu_to_tea` VALUES ('202252000066', '19760532395');
INSERT INTO `stu_to_tea` VALUES ('202252000066', '19760532859');
INSERT INTO `stu_to_tea` VALUES ('202252000067', '19760532355');
INSERT INTO `stu_to_tea` VALUES ('202252000067', '19760532598');
INSERT INTO `stu_to_tea` VALUES ('202252000068', '19760532428');
INSERT INTO `stu_to_tea` VALUES ('202252000068', '19760532637');
INSERT INTO `stu_to_tea` VALUES ('202252000069', '19760532079');
INSERT INTO `stu_to_tea` VALUES ('202252000069', '19760533006');
INSERT INTO `stu_to_tea` VALUES ('202252000070', '19760532206');
INSERT INTO `stu_to_tea` VALUES ('202252000070', '19760532356');
INSERT INTO `stu_to_tea` VALUES ('202252000071', '19760532359');
INSERT INTO `stu_to_tea` VALUES ('202252000071', '19760532948');
INSERT INTO `stu_to_tea` VALUES ('202252000072', '19760532122');
INSERT INTO `stu_to_tea` VALUES ('202252000072', '19760532745');
INSERT INTO `stu_to_tea` VALUES ('202252000073', '19760532436');
INSERT INTO `stu_to_tea` VALUES ('202252000073', '19760532772');
INSERT INTO `stu_to_tea` VALUES ('202252000074', '19760532476');
INSERT INTO `stu_to_tea` VALUES ('202252000074', '19760533055');
INSERT INTO `stu_to_tea` VALUES ('202252000075', '19760532271');
INSERT INTO `stu_to_tea` VALUES ('202252000075', '19760532447');
INSERT INTO `stu_to_tea` VALUES ('202252000076', '19760532388');
INSERT INTO `stu_to_tea` VALUES ('202252000076', '19760532926');
INSERT INTO `stu_to_tea` VALUES ('202252000077', '19760532140');
INSERT INTO `stu_to_tea` VALUES ('202252000077', '19760532482');
INSERT INTO `stu_to_tea` VALUES ('202252000078', '19760532076');
INSERT INTO `stu_to_tea` VALUES ('202252000078', '19760532131');
INSERT INTO `stu_to_tea` VALUES ('202252000079', '19760532515');
INSERT INTO `stu_to_tea` VALUES ('202252000079', '19760532832');
INSERT INTO `stu_to_tea` VALUES ('202252000080', '19760532602');
INSERT INTO `stu_to_tea` VALUES ('202252000080', '19760532695');
INSERT INTO `stu_to_tea` VALUES ('202252000081', '19760532399');
INSERT INTO `stu_to_tea` VALUES ('202252000081', '19760532820');
INSERT INTO `stu_to_tea` VALUES ('202252000082', '19760532472');
INSERT INTO `stu_to_tea` VALUES ('202252000082', '19760532517');
INSERT INTO `stu_to_tea` VALUES ('202252000083', '19760532611');
INSERT INTO `stu_to_tea` VALUES ('202252000083', '19760532964');
INSERT INTO `stu_to_tea` VALUES ('202252000084', '19760532583');
INSERT INTO `stu_to_tea` VALUES ('202252000084', '19760532768');
INSERT INTO `stu_to_tea` VALUES ('202252000085', '19760532113');
INSERT INTO `stu_to_tea` VALUES ('202252000085', '19760532664');
INSERT INTO `stu_to_tea` VALUES ('202252000086', '19760532404');
INSERT INTO `stu_to_tea` VALUES ('202252000086', '19760532886');
INSERT INTO `stu_to_tea` VALUES ('202252000087', '19760532289');
INSERT INTO `stu_to_tea` VALUES ('202252000087', '19760532376');
INSERT INTO `stu_to_tea` VALUES ('202252000088', '19760532440');
INSERT INTO `stu_to_tea` VALUES ('202252000088', '19760532644');
INSERT INTO `stu_to_tea` VALUES ('202252000089', '19760532090');
INSERT INTO `stu_to_tea` VALUES ('202252000089', '19760532399');
INSERT INTO `stu_to_tea` VALUES ('202252000090', '19760532521');
INSERT INTO `stu_to_tea` VALUES ('202252000090', '19760532938');
INSERT INTO `stu_to_tea` VALUES ('202252000091', '19760532617');
INSERT INTO `stu_to_tea` VALUES ('202252000091', '19760532942');
INSERT INTO `stu_to_tea` VALUES ('202252000092', '19760532897');
INSERT INTO `stu_to_tea` VALUES ('202252000092', '19760533040');
INSERT INTO `stu_to_tea` VALUES ('202252000093', '19760532109');
INSERT INTO `stu_to_tea` VALUES ('202252000093', '19760532706');
INSERT INTO `stu_to_tea` VALUES ('202252000094', '19760532522');
INSERT INTO `stu_to_tea` VALUES ('202252000094', '19760532983');
INSERT INTO `stu_to_tea` VALUES ('202252000095', '19760532640');
INSERT INTO `stu_to_tea` VALUES ('202252000095', '19760533032');
INSERT INTO `stu_to_tea` VALUES ('202252000096', '19760532528');
INSERT INTO `stu_to_tea` VALUES ('202252000096', '19760532624');
INSERT INTO `stu_to_tea` VALUES ('202252000097', '19760532306');
INSERT INTO `stu_to_tea` VALUES ('202252000097', '19760532642');
INSERT INTO `stu_to_tea` VALUES ('202252000098', '19760532297');
INSERT INTO `stu_to_tea` VALUES ('202252000098', '19760532741');
INSERT INTO `stu_to_tea` VALUES ('202252000099', '19760532363');
INSERT INTO `stu_to_tea` VALUES ('202252000099', '19760532505');
INSERT INTO `stu_to_tea` VALUES ('202252000100', '19760532691');
INSERT INTO `stu_to_tea` VALUES ('202252000100', '19760533022');
INSERT INTO `stu_to_tea` VALUES ('202252000101', '19760532466');
INSERT INTO `stu_to_tea` VALUES ('202252000101', '19760532992');
INSERT INTO `stu_to_tea` VALUES ('202252000102', '19760532629');
INSERT INTO `stu_to_tea` VALUES ('202252000102', '19760532994');
INSERT INTO `stu_to_tea` VALUES ('202252000103', '19760532559');
INSERT INTO `stu_to_tea` VALUES ('202252000103', '19760532776');
INSERT INTO `stu_to_tea` VALUES ('202252000104', '19760532932');
INSERT INTO `stu_to_tea` VALUES ('202252000104', '19760532984');
INSERT INTO `stu_to_tea` VALUES ('202252000105', '19760532711');
INSERT INTO `stu_to_tea` VALUES ('202252000105', '19760532851');
INSERT INTO `stu_to_tea` VALUES ('202252000106', '19760532167');
INSERT INTO `stu_to_tea` VALUES ('202252000106', '19760532962');
INSERT INTO `stu_to_tea` VALUES ('202252000107', '19760532679');
INSERT INTO `stu_to_tea` VALUES ('202252000107', '19760532819');
INSERT INTO `stu_to_tea` VALUES ('202252000108', '19760532625');
INSERT INTO `stu_to_tea` VALUES ('202252000108', '19760533004');
INSERT INTO `stu_to_tea` VALUES ('202252000109', '19760532224');
INSERT INTO `stu_to_tea` VALUES ('202252000109', '19760532578');
INSERT INTO `stu_to_tea` VALUES ('202252000110', '19760532452');
INSERT INTO `stu_to_tea` VALUES ('202252000110', '19760533027');
INSERT INTO `stu_to_tea` VALUES ('202252000111', '19760532136');
INSERT INTO `stu_to_tea` VALUES ('202252000111', '19760532552');
INSERT INTO `stu_to_tea` VALUES ('202252000112', '19760532836');
INSERT INTO `stu_to_tea` VALUES ('202252000112', '19760532953');
INSERT INTO `stu_to_tea` VALUES ('202252000113', '19760532070');
INSERT INTO `stu_to_tea` VALUES ('202252000113', '19760532447');
INSERT INTO `stu_to_tea` VALUES ('202252000114', '19760532161');
INSERT INTO `stu_to_tea` VALUES ('202252000114', '19760532479');
INSERT INTO `stu_to_tea` VALUES ('202252000115', '19760532834');
INSERT INTO `stu_to_tea` VALUES ('202252000115', '19760533012');
INSERT INTO `stu_to_tea` VALUES ('202252000116', '19760532322');
INSERT INTO `stu_to_tea` VALUES ('202252000116', '19760532516');
INSERT INTO `stu_to_tea` VALUES ('202252000117', '19760532687');
INSERT INTO `stu_to_tea` VALUES ('202252000117', '19760532762');
INSERT INTO `stu_to_tea` VALUES ('202252000118', '19760532177');
INSERT INTO `stu_to_tea` VALUES ('202252000118', '19760532921');
INSERT INTO `stu_to_tea` VALUES ('202252000119', '19760532387');
INSERT INTO `stu_to_tea` VALUES ('202252000119', '19760532984');
INSERT INTO `stu_to_tea` VALUES ('202252000120', '19760532131');
INSERT INTO `stu_to_tea` VALUES ('202252000120', '19760532629');
INSERT INTO `stu_to_tea` VALUES ('202252000121', '19760532161');
INSERT INTO `stu_to_tea` VALUES ('202252000121', '19760532178');
INSERT INTO `stu_to_tea` VALUES ('202252000122', '19760532295');
INSERT INTO `stu_to_tea` VALUES ('202252000122', '19760532572');
INSERT INTO `stu_to_tea` VALUES ('202252000123', '19760532127');
INSERT INTO `stu_to_tea` VALUES ('202252000123', '19760532740');
INSERT INTO `stu_to_tea` VALUES ('202252000124', '19760532488');
INSERT INTO `stu_to_tea` VALUES ('202252000124', '19760532635');
INSERT INTO `stu_to_tea` VALUES ('202252000125', '19760532110');
INSERT INTO `stu_to_tea` VALUES ('202252000125', '19760532953');
INSERT INTO `stu_to_tea` VALUES ('202252000126', '19760532608');
INSERT INTO `stu_to_tea` VALUES ('202252000126', '19760532954');
INSERT INTO `stu_to_tea` VALUES ('202252000127', '19760532293');
INSERT INTO `stu_to_tea` VALUES ('202252000127', '19760532335');
INSERT INTO `stu_to_tea` VALUES ('202252000128', '19760532649');
INSERT INTO `stu_to_tea` VALUES ('202252000128', '19760532821');
INSERT INTO `stu_to_tea` VALUES ('202252000129', '19760532245');
INSERT INTO `stu_to_tea` VALUES ('202252000129', '19760532353');
INSERT INTO `stu_to_tea` VALUES ('202252000130', '19760532843');
INSERT INTO `stu_to_tea` VALUES ('202252000130', '19760533045');
INSERT INTO `stu_to_tea` VALUES ('202252000131', '19760532416');
INSERT INTO `stu_to_tea` VALUES ('202252000131', '19760532882');
INSERT INTO `stu_to_tea` VALUES ('202252000132', '19760532936');
INSERT INTO `stu_to_tea` VALUES ('202252000132', '19760533002');
INSERT INTO `stu_to_tea` VALUES ('202252000133', '19760532264');
INSERT INTO `stu_to_tea` VALUES ('202252000133', '19760532274');
INSERT INTO `stu_to_tea` VALUES ('202252000134', '19760532363');
INSERT INTO `stu_to_tea` VALUES ('202252000134', '19760532991');
INSERT INTO `stu_to_tea` VALUES ('202252000135', '19760532155');
INSERT INTO `stu_to_tea` VALUES ('202252000135', '19760532564');
INSERT INTO `stu_to_tea` VALUES ('202252000136', '19760532597');
INSERT INTO `stu_to_tea` VALUES ('202252000136', '19760533007');
INSERT INTO `stu_to_tea` VALUES ('202252000137', '19760532213');
INSERT INTO `stu_to_tea` VALUES ('202252000137', '19760533050');
INSERT INTO `stu_to_tea` VALUES ('202252000138', '19760532245');
INSERT INTO `stu_to_tea` VALUES ('202252000138', '19760533030');
INSERT INTO `stu_to_tea` VALUES ('202252000139', '19760532444');
INSERT INTO `stu_to_tea` VALUES ('202252000139', '19760532790');
INSERT INTO `stu_to_tea` VALUES ('202252000140', '19760532619');
INSERT INTO `stu_to_tea` VALUES ('202252000140', '19760532921');
INSERT INTO `stu_to_tea` VALUES ('202252000141', '19760532320');
INSERT INTO `stu_to_tea` VALUES ('202252000141', '19760532690');
INSERT INTO `stu_to_tea` VALUES ('202252000142', '19760532210');
INSERT INTO `stu_to_tea` VALUES ('202252000142', '19760532791');
INSERT INTO `stu_to_tea` VALUES ('202252000143', '19760532494');
INSERT INTO `stu_to_tea` VALUES ('202252000143', '19760532777');
INSERT INTO `stu_to_tea` VALUES ('202252000144', '19760532710');
INSERT INTO `stu_to_tea` VALUES ('202252000144', '19760532974');
INSERT INTO `stu_to_tea` VALUES ('202252000145', '19760532799');
INSERT INTO `stu_to_tea` VALUES ('202252000145', '19760532934');
INSERT INTO `stu_to_tea` VALUES ('202252000146', '19760532845');
INSERT INTO `stu_to_tea` VALUES ('202252000146', '19760532921');
INSERT INTO `stu_to_tea` VALUES ('202252000147', '19760532498');
INSERT INTO `stu_to_tea` VALUES ('202252000147', '19760532678');
INSERT INTO `stu_to_tea` VALUES ('202252000148', '19760532068');
INSERT INTO `stu_to_tea` VALUES ('202252000148', '19760532914');
INSERT INTO `stu_to_tea` VALUES ('202252000149', '19760532748');
INSERT INTO `stu_to_tea` VALUES ('202252000149', '19760532970');
INSERT INTO `stu_to_tea` VALUES ('202252000150', '19760532425');
INSERT INTO `stu_to_tea` VALUES ('202252000150', '19760532462');
INSERT INTO `stu_to_tea` VALUES ('202252000151', '19760532075');
INSERT INTO `stu_to_tea` VALUES ('202252000151', '19760532586');
INSERT INTO `stu_to_tea` VALUES ('202252000152', '19760532180');
INSERT INTO `stu_to_tea` VALUES ('202252000152', '19760532543');
INSERT INTO `stu_to_tea` VALUES ('202252000153', '19760532462');
INSERT INTO `stu_to_tea` VALUES ('202252000153', '19760532584');
INSERT INTO `stu_to_tea` VALUES ('202252000154', '19760532616');
INSERT INTO `stu_to_tea` VALUES ('202252000154', '19760532676');
INSERT INTO `stu_to_tea` VALUES ('202252000155', '19760532461');
INSERT INTO `stu_to_tea` VALUES ('202252000155', '19760532741');
INSERT INTO `stu_to_tea` VALUES ('202252000156', '19760532634');
INSERT INTO `stu_to_tea` VALUES ('202252000156', '19760532871');
INSERT INTO `stu_to_tea` VALUES ('202252000157', '19760532299');
INSERT INTO `stu_to_tea` VALUES ('202252000157', '19760532455');
INSERT INTO `stu_to_tea` VALUES ('202252000158', '19760532136');
INSERT INTO `stu_to_tea` VALUES ('202252000158', '19760532504');
INSERT INTO `stu_to_tea` VALUES ('202252000159', '19760532240');
INSERT INTO `stu_to_tea` VALUES ('202252000159', '19760533049');
INSERT INTO `stu_to_tea` VALUES ('202252000160', '19760532451');
INSERT INTO `stu_to_tea` VALUES ('202252000160', '19760532571');
INSERT INTO `stu_to_tea` VALUES ('202252000161', '19760532436');
INSERT INTO `stu_to_tea` VALUES ('202252000161', '19760532764');
INSERT INTO `stu_to_tea` VALUES ('202252000162', '19760532345');
INSERT INTO `stu_to_tea` VALUES ('202252000162', '19760532411');
INSERT INTO `stu_to_tea` VALUES ('202252000163', '19760532346');
INSERT INTO `stu_to_tea` VALUES ('202252000163', '19760532447');
INSERT INTO `stu_to_tea` VALUES ('202252000164', '19760532165');
INSERT INTO `stu_to_tea` VALUES ('202252000164', '19760532902');
INSERT INTO `stu_to_tea` VALUES ('202252000165', '19760532499');
INSERT INTO `stu_to_tea` VALUES ('202252000165', '19760532974');
INSERT INTO `stu_to_tea` VALUES ('202252000166', '19760532566');
INSERT INTO `stu_to_tea` VALUES ('202252000166', '19760532839');
INSERT INTO `stu_to_tea` VALUES ('202252000167', '19760532130');
INSERT INTO `stu_to_tea` VALUES ('202252000167', '19760532926');
INSERT INTO `stu_to_tea` VALUES ('202252000168', '19760532278');
INSERT INTO `stu_to_tea` VALUES ('202252000168', '19760532551');
INSERT INTO `stu_to_tea` VALUES ('202252000169', '19760532165');
INSERT INTO `stu_to_tea` VALUES ('202252000169', '19760532364');
INSERT INTO `stu_to_tea` VALUES ('202252000170', '19760532871');
INSERT INTO `stu_to_tea` VALUES ('202252000170', '19760532996');
INSERT INTO `stu_to_tea` VALUES ('202252000171', '19760532313');
INSERT INTO `stu_to_tea` VALUES ('202252000171', '19760532941');
INSERT INTO `stu_to_tea` VALUES ('202252000172', '19760532650');
INSERT INTO `stu_to_tea` VALUES ('202252000172', '19760532933');
INSERT INTO `stu_to_tea` VALUES ('202252000173', '19760532122');
INSERT INTO `stu_to_tea` VALUES ('202252000173', '19760532128');
INSERT INTO `stu_to_tea` VALUES ('202252000174', '19760532166');
INSERT INTO `stu_to_tea` VALUES ('202252000174', '19760532667');
INSERT INTO `stu_to_tea` VALUES ('202252000175', '19760532104');
INSERT INTO `stu_to_tea` VALUES ('202252000175', '19760532966');
INSERT INTO `stu_to_tea` VALUES ('202252000176', '19760532230');
INSERT INTO `stu_to_tea` VALUES ('202252000176', '19760532736');
INSERT INTO `stu_to_tea` VALUES ('202252000177', '19760532084');
INSERT INTO `stu_to_tea` VALUES ('202252000177', '19760532662');
INSERT INTO `stu_to_tea` VALUES ('202252000178', '19760532417');
INSERT INTO `stu_to_tea` VALUES ('202252000178', '19760532883');
INSERT INTO `stu_to_tea` VALUES ('202252000179', '19760532233');
INSERT INTO `stu_to_tea` VALUES ('202252000179', '19760532959');
INSERT INTO `stu_to_tea` VALUES ('202252000180', '19760532217');
INSERT INTO `stu_to_tea` VALUES ('202252000180', '19760532491');
INSERT INTO `stu_to_tea` VALUES ('202252000181', '19760532165');
INSERT INTO `stu_to_tea` VALUES ('202252000181', '19760532713');
INSERT INTO `stu_to_tea` VALUES ('202252000182', '19760532433');
INSERT INTO `stu_to_tea` VALUES ('202252000182', '19760532612');
INSERT INTO `stu_to_tea` VALUES ('202252000183', '19760532254');
INSERT INTO `stu_to_tea` VALUES ('202252000183', '19760532555');
INSERT INTO `stu_to_tea` VALUES ('202252000184', '19760532179');
INSERT INTO `stu_to_tea` VALUES ('202252000184', '19760532983');
INSERT INTO `stu_to_tea` VALUES ('202252000185', '19760532350');
INSERT INTO `stu_to_tea` VALUES ('202252000185', '19760532538');
INSERT INTO `stu_to_tea` VALUES ('202252000186', '19760532563');
INSERT INTO `stu_to_tea` VALUES ('202252000186', '19760532708');
INSERT INTO `stu_to_tea` VALUES ('202252000187', '19760532570');
INSERT INTO `stu_to_tea` VALUES ('202252000187', '19760532968');
INSERT INTO `stu_to_tea` VALUES ('202252000188', '19760532913');
INSERT INTO `stu_to_tea` VALUES ('202252000188', '19760532973');
INSERT INTO `stu_to_tea` VALUES ('202252000189', '19760532105');
INSERT INTO `stu_to_tea` VALUES ('202252000189', '19760532296');
INSERT INTO `stu_to_tea` VALUES ('202252000190', '19760532505');
INSERT INTO `stu_to_tea` VALUES ('202252000190', '19760532999');
INSERT INTO `stu_to_tea` VALUES ('202252000191', '19760532196');
INSERT INTO `stu_to_tea` VALUES ('202252000191', '19760532243');
INSERT INTO `stu_to_tea` VALUES ('202252000192', '19760532064');
INSERT INTO `stu_to_tea` VALUES ('202252000192', '19760532979');
INSERT INTO `stu_to_tea` VALUES ('202252000193', '19760532623');
INSERT INTO `stu_to_tea` VALUES ('202252000193', '19760532639');
INSERT INTO `stu_to_tea` VALUES ('202252000194', '19760532830');
INSERT INTO `stu_to_tea` VALUES ('202252000194', '19760533003');
INSERT INTO `stu_to_tea` VALUES ('202252000195', '19760532078');
INSERT INTO `stu_to_tea` VALUES ('202252000195', '19760532291');
INSERT INTO `stu_to_tea` VALUES ('202252000196', '19760532523');
INSERT INTO `stu_to_tea` VALUES ('202252000196', '19760532613');
INSERT INTO `stu_to_tea` VALUES ('202252000197', '19760532163');
INSERT INTO `stu_to_tea` VALUES ('202252000197', '19760532604');
INSERT INTO `stu_to_tea` VALUES ('202252000198', '19760532419');
INSERT INTO `stu_to_tea` VALUES ('202252000198', '19760532827');
INSERT INTO `stu_to_tea` VALUES ('202252000199', '19760532088');
INSERT INTO `stu_to_tea` VALUES ('202252000199', '19760533015');
INSERT INTO `stu_to_tea` VALUES ('202252000200', '19760532473');
INSERT INTO `stu_to_tea` VALUES ('202252000200', '19760532787');
INSERT INTO `stu_to_tea` VALUES ('202252000201', '19760532881');
INSERT INTO `stu_to_tea` VALUES ('202252000201', '19760532973');
INSERT INTO `stu_to_tea` VALUES ('202252000202', '19760532397');
INSERT INTO `stu_to_tea` VALUES ('202252000202', '19760532758');
INSERT INTO `stu_to_tea` VALUES ('202252000203', '19760532136');
INSERT INTO `stu_to_tea` VALUES ('202252000203', '19760532531');
INSERT INTO `stu_to_tea` VALUES ('202252000204', '19760532159');
INSERT INTO `stu_to_tea` VALUES ('202252000204', '19760532466');
INSERT INTO `stu_to_tea` VALUES ('202252000205', '19760532169');
INSERT INTO `stu_to_tea` VALUES ('202252000205', '19760532582');
INSERT INTO `stu_to_tea` VALUES ('202252000206', '19760532119');
INSERT INTO `stu_to_tea` VALUES ('202252000206', '19760532763');
INSERT INTO `stu_to_tea` VALUES ('202252000207', '19760532167');
INSERT INTO `stu_to_tea` VALUES ('202252000207', '19760532446');
INSERT INTO `stu_to_tea` VALUES ('202252000208', '19760532852');
INSERT INTO `stu_to_tea` VALUES ('202252000208', '19760532938');
INSERT INTO `stu_to_tea` VALUES ('202252000209', '19760532776');
INSERT INTO `stu_to_tea` VALUES ('202252000209', '19760532984');
INSERT INTO `stu_to_tea` VALUES ('202252000210', '19760532527');
INSERT INTO `stu_to_tea` VALUES ('202252000210', '19760532559');
INSERT INTO `stu_to_tea` VALUES ('202252000211', '19760532544');
INSERT INTO `stu_to_tea` VALUES ('202252000211', '19760532989');
INSERT INTO `stu_to_tea` VALUES ('202252000212', '19760532434');
INSERT INTO `stu_to_tea` VALUES ('202252000212', '19760532927');
INSERT INTO `stu_to_tea` VALUES ('202252000213', '19760532542');
INSERT INTO `stu_to_tea` VALUES ('202252000213', '19760532721');
INSERT INTO `stu_to_tea` VALUES ('202252000214', '19760532529');
INSERT INTO `stu_to_tea` VALUES ('202252000214', '19760532941');
INSERT INTO `stu_to_tea` VALUES ('202252000215', '19760532240');
INSERT INTO `stu_to_tea` VALUES ('202252000215', '19760532877');
INSERT INTO `stu_to_tea` VALUES ('202252000216', '19760532071');
INSERT INTO `stu_to_tea` VALUES ('202252000216', '19760532104');
INSERT INTO `stu_to_tea` VALUES ('202252000217', '19760532779');
INSERT INTO `stu_to_tea` VALUES ('202252000217', '19760532908');
INSERT INTO `stu_to_tea` VALUES ('202252000218', '19760532215');
INSERT INTO `stu_to_tea` VALUES ('202252000218', '19760532952');
INSERT INTO `stu_to_tea` VALUES ('202252000219', '19760532443');
INSERT INTO `stu_to_tea` VALUES ('202252000219', '19760532444');
INSERT INTO `stu_to_tea` VALUES ('202252000220', '19760532255');
INSERT INTO `stu_to_tea` VALUES ('202252000220', '19760532558');
INSERT INTO `stu_to_tea` VALUES ('202252000221', '19760532091');
INSERT INTO `stu_to_tea` VALUES ('202252000221', '19760532506');
INSERT INTO `stu_to_tea` VALUES ('202252000222', '19760532056');
INSERT INTO `stu_to_tea` VALUES ('202252000222', '19760533051');
INSERT INTO `stu_to_tea` VALUES ('202252000223', '19760532763');
INSERT INTO `stu_to_tea` VALUES ('202252000223', '19760532890');
INSERT INTO `stu_to_tea` VALUES ('202252000224', '19760532918');
INSERT INTO `stu_to_tea` VALUES ('202252000224', '19760532983');
INSERT INTO `stu_to_tea` VALUES ('202252000225', '19760532422');
INSERT INTO `stu_to_tea` VALUES ('202252000225', '19760532884');
INSERT INTO `stu_to_tea` VALUES ('202252000226', '19760532465');
INSERT INTO `stu_to_tea` VALUES ('202252000226', '19760532556');
INSERT INTO `stu_to_tea` VALUES ('202252000227', '19760532620');
INSERT INTO `stu_to_tea` VALUES ('202252000227', '19760532630');
INSERT INTO `stu_to_tea` VALUES ('202252000228', '19760532127');
INSERT INTO `stu_to_tea` VALUES ('202252000228', '19760532563');
INSERT INTO `stu_to_tea` VALUES ('202252000229', '19760532513');
INSERT INTO `stu_to_tea` VALUES ('202252000229', '19760532701');
INSERT INTO `stu_to_tea` VALUES ('202252000230', '19760532220');
INSERT INTO `stu_to_tea` VALUES ('202252000230', '19760532894');
INSERT INTO `stu_to_tea` VALUES ('202252000231', '19760532853');
INSERT INTO `stu_to_tea` VALUES ('202252000231', '19760532940');
INSERT INTO `stu_to_tea` VALUES ('202252000232', '19760532279');
INSERT INTO `stu_to_tea` VALUES ('202252000232', '19760532578');
INSERT INTO `stu_to_tea` VALUES ('202252000233', '19760532294');
INSERT INTO `stu_to_tea` VALUES ('202252000233', '19760532350');
INSERT INTO `stu_to_tea` VALUES ('202252000234', '19760532134');
INSERT INTO `stu_to_tea` VALUES ('202252000234', '19760532783');
INSERT INTO `stu_to_tea` VALUES ('202252000235', '19760532356');
INSERT INTO `stu_to_tea` VALUES ('202252000235', '19760532551');
INSERT INTO `stu_to_tea` VALUES ('202252000236', '19760532150');
INSERT INTO `stu_to_tea` VALUES ('202252000236', '19760532406');
INSERT INTO `stu_to_tea` VALUES ('202252000237', '19760532119');
INSERT INTO `stu_to_tea` VALUES ('202252000237', '19760532728');
INSERT INTO `stu_to_tea` VALUES ('202252000238', '19760532289');
INSERT INTO `stu_to_tea` VALUES ('202252000238', '19760532678');
INSERT INTO `stu_to_tea` VALUES ('202252000239', '19760532401');
INSERT INTO `stu_to_tea` VALUES ('202252000239', '19760532805');
INSERT INTO `stu_to_tea` VALUES ('202252000240', '19760532378');
INSERT INTO `stu_to_tea` VALUES ('202252000240', '19760532608');
INSERT INTO `stu_to_tea` VALUES ('202252000241', '19760532931');
INSERT INTO `stu_to_tea` VALUES ('202252000241', '19760533023');
INSERT INTO `stu_to_tea` VALUES ('202252000242', '19760532244');
INSERT INTO `stu_to_tea` VALUES ('202252000242', '19760533054');
INSERT INTO `stu_to_tea` VALUES ('202252000243', '19760532764');
INSERT INTO `stu_to_tea` VALUES ('202252000243', '19760532872');
INSERT INTO `stu_to_tea` VALUES ('202252000244', '19760532319');
INSERT INTO `stu_to_tea` VALUES ('202252000244', '19760532382');
INSERT INTO `stu_to_tea` VALUES ('202252000245', '19760532139');
INSERT INTO `stu_to_tea` VALUES ('202252000245', '19760532361');
INSERT INTO `stu_to_tea` VALUES ('202252000246', '19760532187');
INSERT INTO `stu_to_tea` VALUES ('202252000246', '19760532468');
INSERT INTO `stu_to_tea` VALUES ('202252000247', '19760532593');
INSERT INTO `stu_to_tea` VALUES ('202252000247', '19760532852');
INSERT INTO `stu_to_tea` VALUES ('202252000248', '19760532289');
INSERT INTO `stu_to_tea` VALUES ('202252000248', '19760532576');
INSERT INTO `stu_to_tea` VALUES ('202252000249', '19760532618');
INSERT INTO `stu_to_tea` VALUES ('202252000249', '19760533021');
INSERT INTO `stu_to_tea` VALUES ('202252000250', '19760532502');
INSERT INTO `stu_to_tea` VALUES ('202252000250', '19760532637');
INSERT INTO `stu_to_tea` VALUES ('202252000251', '19760532262');
INSERT INTO `stu_to_tea` VALUES ('202252000251', '19760532956');
INSERT INTO `stu_to_tea` VALUES ('202252000252', '19760532232');
INSERT INTO `stu_to_tea` VALUES ('202252000252', '19760532301');
INSERT INTO `stu_to_tea` VALUES ('202252000253', '19760532326');
INSERT INTO `stu_to_tea` VALUES ('202252000253', '19760532407');
INSERT INTO `stu_to_tea` VALUES ('202252000254', '19760532399');
INSERT INTO `stu_to_tea` VALUES ('202252000254', '19760532639');
INSERT INTO `stu_to_tea` VALUES ('202252000255', '19760532133');
INSERT INTO `stu_to_tea` VALUES ('202252000255', '19760532431');
INSERT INTO `stu_to_tea` VALUES ('202252000256', '19760532126');
INSERT INTO `stu_to_tea` VALUES ('202252000256', '19760532593');
INSERT INTO `stu_to_tea` VALUES ('202252000257', '19760532584');
INSERT INTO `stu_to_tea` VALUES ('202252000257', '19760532804');
INSERT INTO `stu_to_tea` VALUES ('202252000258', '19760532188');
INSERT INTO `stu_to_tea` VALUES ('202252000258', '19760532939');
INSERT INTO `stu_to_tea` VALUES ('202252000259', '19760532546');
INSERT INTO `stu_to_tea` VALUES ('202252000259', '19760532879');
INSERT INTO `stu_to_tea` VALUES ('202252000260', '19760532339');
INSERT INTO `stu_to_tea` VALUES ('202252000260', '19760532503');
INSERT INTO `stu_to_tea` VALUES ('202252000261', '19760532173');
INSERT INTO `stu_to_tea` VALUES ('202252000261', '19760532182');
INSERT INTO `stu_to_tea` VALUES ('202252000262', '19760532462');
INSERT INTO `stu_to_tea` VALUES ('202252000262', '19760533036');
INSERT INTO `stu_to_tea` VALUES ('202252000263', '19760532140');
INSERT INTO `stu_to_tea` VALUES ('202252000263', '19760532377');
INSERT INTO `stu_to_tea` VALUES ('202252000264', '19760532374');
INSERT INTO `stu_to_tea` VALUES ('202252000264', '19760533032');
INSERT INTO `stu_to_tea` VALUES ('202252000265', '19760532119');
INSERT INTO `stu_to_tea` VALUES ('202252000265', '19760532591');
INSERT INTO `stu_to_tea` VALUES ('202252000266', '19760532719');
INSERT INTO `stu_to_tea` VALUES ('202252000266', '19760533006');
INSERT INTO `stu_to_tea` VALUES ('202252000267', '19760532076');
INSERT INTO `stu_to_tea` VALUES ('202252000267', '19760532416');
INSERT INTO `stu_to_tea` VALUES ('202252000268', '19760532268');
INSERT INTO `stu_to_tea` VALUES ('202252000268', '19760532739');
INSERT INTO `stu_to_tea` VALUES ('202252000269', '19760532861');
INSERT INTO `stu_to_tea` VALUES ('202252000269', '19760532907');
INSERT INTO `stu_to_tea` VALUES ('202252000270', '19760532288');
INSERT INTO `stu_to_tea` VALUES ('202252000270', '19760532491');
INSERT INTO `stu_to_tea` VALUES ('202252000271', '19760532552');
INSERT INTO `stu_to_tea` VALUES ('202252000271', '19760532957');
INSERT INTO `stu_to_tea` VALUES ('202252000272', '19760532582');
INSERT INTO `stu_to_tea` VALUES ('202252000272', '19760533032');
INSERT INTO `stu_to_tea` VALUES ('202252000273', '19760532409');
INSERT INTO `stu_to_tea` VALUES ('202252000273', '19760532538');
INSERT INTO `stu_to_tea` VALUES ('202252000274', '19760532273');
INSERT INTO `stu_to_tea` VALUES ('202252000274', '19760532897');
INSERT INTO `stu_to_tea` VALUES ('202252000275', '19760532479');
INSERT INTO `stu_to_tea` VALUES ('202252000275', '19760532956');
INSERT INTO `stu_to_tea` VALUES ('202252000276', '19760532188');
INSERT INTO `stu_to_tea` VALUES ('202252000276', '19760532760');
INSERT INTO `stu_to_tea` VALUES ('202252000277', '19760532780');
INSERT INTO `stu_to_tea` VALUES ('202252000277', '19760532873');
INSERT INTO `stu_to_tea` VALUES ('202252000278', '19760532459');
INSERT INTO `stu_to_tea` VALUES ('202252000278', '19760532670');
INSERT INTO `stu_to_tea` VALUES ('202252000279', '19760532205');
INSERT INTO `stu_to_tea` VALUES ('202252000279', '19760532431');
INSERT INTO `stu_to_tea` VALUES ('202252000280', '19760532432');
INSERT INTO `stu_to_tea` VALUES ('202252000280', '19760532791');
INSERT INTO `stu_to_tea` VALUES ('202252000281', '19760532944');
INSERT INTO `stu_to_tea` VALUES ('202252000281', '19760532966');
INSERT INTO `stu_to_tea` VALUES ('202252000282', '19760532466');
INSERT INTO `stu_to_tea` VALUES ('202252000282', '19760532944');
INSERT INTO `stu_to_tea` VALUES ('202252000283', '19760532353');
INSERT INTO `stu_to_tea` VALUES ('202252000283', '19760532889');
INSERT INTO `stu_to_tea` VALUES ('202252000284', '19760532136');
INSERT INTO `stu_to_tea` VALUES ('202252000284', '19760532545');
INSERT INTO `stu_to_tea` VALUES ('202252000285', '19760532659');
INSERT INTO `stu_to_tea` VALUES ('202252000285', '19760532851');
INSERT INTO `stu_to_tea` VALUES ('202252000286', '19760532274');
INSERT INTO `stu_to_tea` VALUES ('202252000286', '19760532513');
INSERT INTO `stu_to_tea` VALUES ('202252000287', '19760532398');
INSERT INTO `stu_to_tea` VALUES ('202252000287', '19760532465');
INSERT INTO `stu_to_tea` VALUES ('202252000288', '19760532890');
INSERT INTO `stu_to_tea` VALUES ('202252000288', '19760532894');
INSERT INTO `stu_to_tea` VALUES ('202252000289', '19760532219');
INSERT INTO `stu_to_tea` VALUES ('202252000289', '19760532278');
INSERT INTO `stu_to_tea` VALUES ('202252000290', '19760532088');
INSERT INTO `stu_to_tea` VALUES ('202252000290', '19760532587');
INSERT INTO `stu_to_tea` VALUES ('202252000291', '19760532103');
INSERT INTO `stu_to_tea` VALUES ('202252000291', '19760532971');
INSERT INTO `stu_to_tea` VALUES ('202252000292', '19760532188');
INSERT INTO `stu_to_tea` VALUES ('202252000292', '19760532297');
INSERT INTO `stu_to_tea` VALUES ('202252000293', '19760532079');
INSERT INTO `stu_to_tea` VALUES ('202252000293', '19760532527');
INSERT INTO `stu_to_tea` VALUES ('202252000294', '19760532394');
INSERT INTO `stu_to_tea` VALUES ('202252000294', '19760532955');
INSERT INTO `stu_to_tea` VALUES ('202252000295', '19760532061');
INSERT INTO `stu_to_tea` VALUES ('202252000295', '19760532489');
INSERT INTO `stu_to_tea` VALUES ('202252000296', '19760532263');
INSERT INTO `stu_to_tea` VALUES ('202252000296', '19760532761');
INSERT INTO `stu_to_tea` VALUES ('202252000297', '19760532130');
INSERT INTO `stu_to_tea` VALUES ('202252000297', '19760532521');
INSERT INTO `stu_to_tea` VALUES ('202252000298', '19760532382');
INSERT INTO `stu_to_tea` VALUES ('202252000298', '19760532826');
INSERT INTO `stu_to_tea` VALUES ('202252000299', '19760532655');
INSERT INTO `stu_to_tea` VALUES ('202252000299', '19760532989');
INSERT INTO `stu_to_tea` VALUES ('202252000300', '19760532154');
INSERT INTO `stu_to_tea` VALUES ('202252000300', '19760532950');
INSERT INTO `stu_to_tea` VALUES ('202252000301', '19760532592');
INSERT INTO `stu_to_tea` VALUES ('202252000301', '19760532699');
INSERT INTO `stu_to_tea` VALUES ('202252000302', '19760532209');
INSERT INTO `stu_to_tea` VALUES ('202252000302', '19760532238');
INSERT INTO `stu_to_tea` VALUES ('202252000303', '19760532257');
INSERT INTO `stu_to_tea` VALUES ('202252000303', '19760532329');
INSERT INTO `stu_to_tea` VALUES ('202252000304', '19760532502');
INSERT INTO `stu_to_tea` VALUES ('202252000304', '19760532767');
INSERT INTO `stu_to_tea` VALUES ('202252000305', '19760532247');
INSERT INTO `stu_to_tea` VALUES ('202252000305', '19760532289');
INSERT INTO `stu_to_tea` VALUES ('202252000306', '19760532154');
INSERT INTO `stu_to_tea` VALUES ('202252000306', '19760532987');
INSERT INTO `stu_to_tea` VALUES ('202252000307', '19760532475');
INSERT INTO `stu_to_tea` VALUES ('202252000307', '19760532893');
INSERT INTO `stu_to_tea` VALUES ('202252000308', '19760532364');
INSERT INTO `stu_to_tea` VALUES ('202252000308', '19760532870');
INSERT INTO `stu_to_tea` VALUES ('202252000309', '19760532109');
INSERT INTO `stu_to_tea` VALUES ('202252000309', '19760532703');
INSERT INTO `stu_to_tea` VALUES ('202252000310', '19760532773');
INSERT INTO `stu_to_tea` VALUES ('202252000310', '19760532890');
INSERT INTO `stu_to_tea` VALUES ('202252000311', '19760532588');
INSERT INTO `stu_to_tea` VALUES ('202252000311', '19760532880');
INSERT INTO `stu_to_tea` VALUES ('202252000312', '19760532302');
INSERT INTO `stu_to_tea` VALUES ('202252000312', '19760532532');
INSERT INTO `stu_to_tea` VALUES ('202252000313', '19760532220');
INSERT INTO `stu_to_tea` VALUES ('202252000313', '19760532958');
INSERT INTO `stu_to_tea` VALUES ('202252000314', '19760532295');
INSERT INTO `stu_to_tea` VALUES ('202252000314', '19760532949');
INSERT INTO `stu_to_tea` VALUES ('202252000315', '19760532652');
INSERT INTO `stu_to_tea` VALUES ('202252000315', '19760532770');
INSERT INTO `stu_to_tea` VALUES ('202252000316', '19760532398');
INSERT INTO `stu_to_tea` VALUES ('202252000316', '19760532493');
INSERT INTO `stu_to_tea` VALUES ('202252000317', '19760532293');
INSERT INTO `stu_to_tea` VALUES ('202252000317', '19760532537');
INSERT INTO `stu_to_tea` VALUES ('202252000318', '19760532715');
INSERT INTO `stu_to_tea` VALUES ('202252000318', '19760532792');
INSERT INTO `stu_to_tea` VALUES ('202252000319', '19760532175');
INSERT INTO `stu_to_tea` VALUES ('202252000319', '19760532770');
INSERT INTO `stu_to_tea` VALUES ('202252000320', '19760532606');
INSERT INTO `stu_to_tea` VALUES ('202252000320', '19760532726');
INSERT INTO `stu_to_tea` VALUES ('202252000321', '19760532119');
INSERT INTO `stu_to_tea` VALUES ('202252000321', '19760532296');
INSERT INTO `stu_to_tea` VALUES ('202252000322', '19760532119');
INSERT INTO `stu_to_tea` VALUES ('202252000322', '19760532668');
INSERT INTO `stu_to_tea` VALUES ('202252000323', '19760532727');
INSERT INTO `stu_to_tea` VALUES ('202252000323', '19760532919');
INSERT INTO `stu_to_tea` VALUES ('202252000324', '19760532058');
INSERT INTO `stu_to_tea` VALUES ('202252000324', '19760532354');
INSERT INTO `stu_to_tea` VALUES ('202252000325', '19760532482');
INSERT INTO `stu_to_tea` VALUES ('202252000325', '19760532522');
INSERT INTO `stu_to_tea` VALUES ('202252000326', '19760532712');
INSERT INTO `stu_to_tea` VALUES ('202252000326', '19760532737');
INSERT INTO `stu_to_tea` VALUES ('202252000327', '19760532388');
INSERT INTO `stu_to_tea` VALUES ('202252000327', '19760532396');
INSERT INTO `stu_to_tea` VALUES ('202252000328', '19760532802');
INSERT INTO `stu_to_tea` VALUES ('202252000328', '19760532877');
INSERT INTO `stu_to_tea` VALUES ('202252000329', '19760532380');
INSERT INTO `stu_to_tea` VALUES ('202252000329', '19760532920');
INSERT INTO `stu_to_tea` VALUES ('202252000330', '19760532816');
INSERT INTO `stu_to_tea` VALUES ('202252000330', '19760532836');
INSERT INTO `stu_to_tea` VALUES ('202252000331', '19760532912');
INSERT INTO `stu_to_tea` VALUES ('202252000331', '19760533014');
INSERT INTO `stu_to_tea` VALUES ('202252000332', '19760532860');
INSERT INTO `stu_to_tea` VALUES ('202252000332', '19760532913');
INSERT INTO `stu_to_tea` VALUES ('202252000333', '19760532290');
INSERT INTO `stu_to_tea` VALUES ('202252000333', '19760532742');
INSERT INTO `stu_to_tea` VALUES ('202252000334', '19760532405');
INSERT INTO `stu_to_tea` VALUES ('202252000334', '19760533034');
INSERT INTO `stu_to_tea` VALUES ('202252000335', '19760532566');
INSERT INTO `stu_to_tea` VALUES ('202252000335', '19760532836');
INSERT INTO `stu_to_tea` VALUES ('202252000336', '19760532319');
INSERT INTO `stu_to_tea` VALUES ('202252000336', '19760532995');
INSERT INTO `stu_to_tea` VALUES ('202252000337', '19760532443');
INSERT INTO `stu_to_tea` VALUES ('202252000337', '19760532671');
INSERT INTO `stu_to_tea` VALUES ('202252000338', '19760532906');
INSERT INTO `stu_to_tea` VALUES ('202252000338', '19760533016');
INSERT INTO `stu_to_tea` VALUES ('202252000339', '19760532186');
INSERT INTO `stu_to_tea` VALUES ('202252000339', '19760532349');
INSERT INTO `stu_to_tea` VALUES ('202252000340', '19760532408');
INSERT INTO `stu_to_tea` VALUES ('202252000340', '19760532914');
INSERT INTO `stu_to_tea` VALUES ('202252000341', '19760532808');
INSERT INTO `stu_to_tea` VALUES ('202252000341', '19760533038');
INSERT INTO `stu_to_tea` VALUES ('202252000342', '19760532466');
INSERT INTO `stu_to_tea` VALUES ('202252000342', '19760532674');
INSERT INTO `stu_to_tea` VALUES ('202252000343', '19760532485');
INSERT INTO `stu_to_tea` VALUES ('202252000343', '19760532900');
INSERT INTO `stu_to_tea` VALUES ('202252000344', '19760532673');
INSERT INTO `stu_to_tea` VALUES ('202252000344', '19760532698');
INSERT INTO `stu_to_tea` VALUES ('202252000345', '19760532145');
INSERT INTO `stu_to_tea` VALUES ('202252000345', '19760532684');
INSERT INTO `stu_to_tea` VALUES ('202252000346', '19760532253');
INSERT INTO `stu_to_tea` VALUES ('202252000346', '19760532663');
INSERT INTO `stu_to_tea` VALUES ('202252000347', '19760532152');
INSERT INTO `stu_to_tea` VALUES ('202252000347', '19760532434');
INSERT INTO `stu_to_tea` VALUES ('202252000348', '19760532105');
INSERT INTO `stu_to_tea` VALUES ('202252000348', '19760532759');
INSERT INTO `stu_to_tea` VALUES ('202252000349', '19760532062');
INSERT INTO `stu_to_tea` VALUES ('202252000349', '19760532300');
INSERT INTO `stu_to_tea` VALUES ('202252000350', '19760532527');
INSERT INTO `stu_to_tea` VALUES ('202252000350', '19760532964');
INSERT INTO `stu_to_tea` VALUES ('202252000351', '19760532472');
INSERT INTO `stu_to_tea` VALUES ('202252000351', '19760532772');
INSERT INTO `stu_to_tea` VALUES ('202252000352', '19760532962');
INSERT INTO `stu_to_tea` VALUES ('202252000352', '19760532969');
INSERT INTO `stu_to_tea` VALUES ('202252000353', '19760532111');
INSERT INTO `stu_to_tea` VALUES ('202252000353', '19760533007');
INSERT INTO `stu_to_tea` VALUES ('202252000354', '19760532539');
INSERT INTO `stu_to_tea` VALUES ('202252000354', '19760532812');
INSERT INTO `stu_to_tea` VALUES ('202252000355', '19760532317');
INSERT INTO `stu_to_tea` VALUES ('202252000355', '19760532460');
INSERT INTO `stu_to_tea` VALUES ('202252000356', '19760532517');
INSERT INTO `stu_to_tea` VALUES ('202252000356', '19760532600');
INSERT INTO `stu_to_tea` VALUES ('202252000357', '19760532264');
INSERT INTO `stu_to_tea` VALUES ('202252000357', '19760532416');
INSERT INTO `stu_to_tea` VALUES ('202252000358', '19760532056');
INSERT INTO `stu_to_tea` VALUES ('202252000358', '19760532078');
INSERT INTO `stu_to_tea` VALUES ('202252000359', '19760532542');
INSERT INTO `stu_to_tea` VALUES ('202252000359', '19760532871');
INSERT INTO `stu_to_tea` VALUES ('202252000360', '19760532495');
INSERT INTO `stu_to_tea` VALUES ('202252000360', '19760532911');
INSERT INTO `stu_to_tea` VALUES ('202252000361', '19760532360');
INSERT INTO `stu_to_tea` VALUES ('202252000361', '19760532508');
INSERT INTO `stu_to_tea` VALUES ('202252000362', '19760532068');
INSERT INTO `stu_to_tea` VALUES ('202252000362', '19760532856');
INSERT INTO `stu_to_tea` VALUES ('202252000363', '19760532126');
INSERT INTO `stu_to_tea` VALUES ('202252000363', '19760532167');
INSERT INTO `stu_to_tea` VALUES ('202252000364', '19760532388');
INSERT INTO `stu_to_tea` VALUES ('202252000364', '19760532400');
INSERT INTO `stu_to_tea` VALUES ('202252000365', '19760532469');
INSERT INTO `stu_to_tea` VALUES ('202252000365', '19760532659');
INSERT INTO `stu_to_tea` VALUES ('202252000366', '19760532094');
INSERT INTO `stu_to_tea` VALUES ('202252000366', '19760533038');
INSERT INTO `stu_to_tea` VALUES ('202252000367', '19760532556');
INSERT INTO `stu_to_tea` VALUES ('202252000367', '19760533000');
INSERT INTO `stu_to_tea` VALUES ('202252000368', '19760532202');
INSERT INTO `stu_to_tea` VALUES ('202252000368', '19760532729');
INSERT INTO `stu_to_tea` VALUES ('202252000369', '19760532173');
INSERT INTO `stu_to_tea` VALUES ('202252000369', '19760532720');
INSERT INTO `stu_to_tea` VALUES ('202252000370', '19760532409');
INSERT INTO `stu_to_tea` VALUES ('202252000370', '19760532707');
INSERT INTO `stu_to_tea` VALUES ('202252000371', '19760532460');
INSERT INTO `stu_to_tea` VALUES ('202252000371', '19760532704');
INSERT INTO `stu_to_tea` VALUES ('202252000372', '19760532352');
INSERT INTO `stu_to_tea` VALUES ('202252000372', '19760533041');
INSERT INTO `stu_to_tea` VALUES ('202252000373', '19760532341');
INSERT INTO `stu_to_tea` VALUES ('202252000373', '19760532426');
INSERT INTO `stu_to_tea` VALUES ('202252000374', '19760532593');
INSERT INTO `stu_to_tea` VALUES ('202252000374', '19760532681');
INSERT INTO `stu_to_tea` VALUES ('202252000375', '19760532094');
INSERT INTO `stu_to_tea` VALUES ('202252000375', '19760532777');
INSERT INTO `stu_to_tea` VALUES ('202252000376', '19760532100');
INSERT INTO `stu_to_tea` VALUES ('202252000376', '19760532870');
INSERT INTO `stu_to_tea` VALUES ('202252000377', '19760532068');
INSERT INTO `stu_to_tea` VALUES ('202252000377', '19760532542');
INSERT INTO `stu_to_tea` VALUES ('202252000378', '19760532346');
INSERT INTO `stu_to_tea` VALUES ('202252000378', '19760532969');
INSERT INTO `stu_to_tea` VALUES ('202252000379', '19760532684');
INSERT INTO `stu_to_tea` VALUES ('202252000379', '19760532759');
INSERT INTO `stu_to_tea` VALUES ('202252000380', '19760532187');
INSERT INTO `stu_to_tea` VALUES ('202252000380', '19760532554');
INSERT INTO `stu_to_tea` VALUES ('202252000381', '19760532138');
INSERT INTO `stu_to_tea` VALUES ('202252000381', '19760532854');
INSERT INTO `stu_to_tea` VALUES ('202252000382', '19760532726');
INSERT INTO `stu_to_tea` VALUES ('202252000382', '19760532884');
INSERT INTO `stu_to_tea` VALUES ('202252000383', '19760532182');
INSERT INTO `stu_to_tea` VALUES ('202252000383', '19760532456');
INSERT INTO `stu_to_tea` VALUES ('202252000384', '19760532207');
INSERT INTO `stu_to_tea` VALUES ('202252000384', '19760532845');
INSERT INTO `stu_to_tea` VALUES ('202252000385', '19760532580');
INSERT INTO `stu_to_tea` VALUES ('202252000385', '19760532916');
INSERT INTO `stu_to_tea` VALUES ('202252000386', '19760532064');
INSERT INTO `stu_to_tea` VALUES ('202252000386', '19760533026');
INSERT INTO `stu_to_tea` VALUES ('202252000387', '19760532371');
INSERT INTO `stu_to_tea` VALUES ('202252000387', '19760532608');
INSERT INTO `stu_to_tea` VALUES ('202252000388', '19760532318');
INSERT INTO `stu_to_tea` VALUES ('202252000388', '19760532497');
INSERT INTO `stu_to_tea` VALUES ('202252000389', '19760532139');
INSERT INTO `stu_to_tea` VALUES ('202252000389', '19760532557');
INSERT INTO `stu_to_tea` VALUES ('202252000390', '19760532679');
INSERT INTO `stu_to_tea` VALUES ('202252000390', '19760533034');
INSERT INTO `stu_to_tea` VALUES ('202252000391', '19760532767');
INSERT INTO `stu_to_tea` VALUES ('202252000391', '19760532940');
INSERT INTO `stu_to_tea` VALUES ('202252000392', '19760532648');
INSERT INTO `stu_to_tea` VALUES ('202252000392', '19760532877');
INSERT INTO `stu_to_tea` VALUES ('202252000393', '19760532455');
INSERT INTO `stu_to_tea` VALUES ('202252000393', '19760532908');
INSERT INTO `stu_to_tea` VALUES ('202252000394', '19760532944');
INSERT INTO `stu_to_tea` VALUES ('202252000394', '19760533046');
INSERT INTO `stu_to_tea` VALUES ('202252000395', '19760532073');
INSERT INTO `stu_to_tea` VALUES ('202252000395', '19760532562');
INSERT INTO `stu_to_tea` VALUES ('202252000396', '19760532110');
INSERT INTO `stu_to_tea` VALUES ('202252000396', '19760532273');
INSERT INTO `stu_to_tea` VALUES ('202252000397', '19760532346');
INSERT INTO `stu_to_tea` VALUES ('202252000397', '19760533049');
INSERT INTO `stu_to_tea` VALUES ('202252000398', '19760532520');
INSERT INTO `stu_to_tea` VALUES ('202252000398', '19760532734');
INSERT INTO `stu_to_tea` VALUES ('202252000399', '19760532496');
INSERT INTO `stu_to_tea` VALUES ('202252000399', '19760532815');
INSERT INTO `stu_to_tea` VALUES ('202252000400', '19760532482');
INSERT INTO `stu_to_tea` VALUES ('202252000400', '19760533048');
INSERT INTO `stu_to_tea` VALUES ('202252000401', '19760532575');
INSERT INTO `stu_to_tea` VALUES ('202252000401', '19760532733');
INSERT INTO `stu_to_tea` VALUES ('202252000402', '19760532322');
INSERT INTO `stu_to_tea` VALUES ('202252000402', '19760532410');
INSERT INTO `stu_to_tea` VALUES ('202252000403', '19760532530');
INSERT INTO `stu_to_tea` VALUES ('202252000403', '19760532666');
INSERT INTO `stu_to_tea` VALUES ('202252000404', '19760532915');
INSERT INTO `stu_to_tea` VALUES ('202252000404', '19760532967');
INSERT INTO `stu_to_tea` VALUES ('202252000405', '19760532221');
INSERT INTO `stu_to_tea` VALUES ('202252000405', '19760532493');
INSERT INTO `stu_to_tea` VALUES ('202252000406', '19760532126');
INSERT INTO `stu_to_tea` VALUES ('202252000406', '19760533017');
INSERT INTO `stu_to_tea` VALUES ('202252000407', '19760532634');
INSERT INTO `stu_to_tea` VALUES ('202252000407', '19760533052');
INSERT INTO `stu_to_tea` VALUES ('202252000408', '19760532327');
INSERT INTO `stu_to_tea` VALUES ('202252000408', '19760532446');
INSERT INTO `stu_to_tea` VALUES ('202252000409', '19760532153');
INSERT INTO `stu_to_tea` VALUES ('202252000409', '19760532400');
INSERT INTO `stu_to_tea` VALUES ('202252000410', '19760532097');
INSERT INTO `stu_to_tea` VALUES ('202252000410', '19760532641');
INSERT INTO `stu_to_tea` VALUES ('202252000411', '19760532225');
INSERT INTO `stu_to_tea` VALUES ('202252000411', '19760532630');
INSERT INTO `stu_to_tea` VALUES ('202252000412', '19760532094');
INSERT INTO `stu_to_tea` VALUES ('202252000412', '19760532611');
INSERT INTO `stu_to_tea` VALUES ('202252000413', '19760532308');
INSERT INTO `stu_to_tea` VALUES ('202252000413', '19760532327');
INSERT INTO `stu_to_tea` VALUES ('202252000414', '19760532244');
INSERT INTO `stu_to_tea` VALUES ('202252000414', '19760532507');
INSERT INTO `stu_to_tea` VALUES ('202252000415', '19760532182');
INSERT INTO `stu_to_tea` VALUES ('202252000415', '19760532899');
INSERT INTO `stu_to_tea` VALUES ('202252000416', '19760532642');
INSERT INTO `stu_to_tea` VALUES ('202252000416', '19760532813');
INSERT INTO `stu_to_tea` VALUES ('202252000417', '19760532540');
INSERT INTO `stu_to_tea` VALUES ('202252000417', '19760533027');
INSERT INTO `stu_to_tea` VALUES ('202252000418', '19760532316');
INSERT INTO `stu_to_tea` VALUES ('202252000418', '19760532922');
INSERT INTO `stu_to_tea` VALUES ('202252000419', '19760532163');
INSERT INTO `stu_to_tea` VALUES ('202252000419', '19760533016');
INSERT INTO `stu_to_tea` VALUES ('202252000420', '19760532526');
INSERT INTO `stu_to_tea` VALUES ('202252000420', '19760532957');
INSERT INTO `stu_to_tea` VALUES ('202252000421', '19760532316');
INSERT INTO `stu_to_tea` VALUES ('202252000421', '19760532983');
INSERT INTO `stu_to_tea` VALUES ('202252000422', '19760532060');
INSERT INTO `stu_to_tea` VALUES ('202252000422', '19760532817');
INSERT INTO `stu_to_tea` VALUES ('202252000423', '19760532352');
INSERT INTO `stu_to_tea` VALUES ('202252000423', '19760532573');
INSERT INTO `stu_to_tea` VALUES ('202252000424', '19760532431');
INSERT INTO `stu_to_tea` VALUES ('202252000424', '19760532460');
INSERT INTO `stu_to_tea` VALUES ('202252000425', '19760532220');
INSERT INTO `stu_to_tea` VALUES ('202252000425', '19760532808');
INSERT INTO `stu_to_tea` VALUES ('202252000426', '19760532533');
INSERT INTO `stu_to_tea` VALUES ('202252000426', '19760532980');
INSERT INTO `stu_to_tea` VALUES ('202252000427', '19760532209');
INSERT INTO `stu_to_tea` VALUES ('202252000427', '19760532382');
INSERT INTO `stu_to_tea` VALUES ('202252000428', '19760532201');
INSERT INTO `stu_to_tea` VALUES ('202252000428', '19760532675');
INSERT INTO `stu_to_tea` VALUES ('202252000429', '19760532460');
INSERT INTO `stu_to_tea` VALUES ('202252000429', '19760532497');
INSERT INTO `stu_to_tea` VALUES ('202252000430', '19760532434');
INSERT INTO `stu_to_tea` VALUES ('202252000430', '19760532757');
INSERT INTO `stu_to_tea` VALUES ('202252000431', '19760532248');
INSERT INTO `stu_to_tea` VALUES ('202252000431', '19760532774');
INSERT INTO `stu_to_tea` VALUES ('202252000432', '19760532138');
INSERT INTO `stu_to_tea` VALUES ('202252000432', '19760532713');
INSERT INTO `stu_to_tea` VALUES ('202252000433', '19760532691');
INSERT INTO `stu_to_tea` VALUES ('202252000433', '19760532808');
INSERT INTO `stu_to_tea` VALUES ('202252000434', '19760532161');
INSERT INTO `stu_to_tea` VALUES ('202252000434', '19760532320');
INSERT INTO `stu_to_tea` VALUES ('202252000435', '19760532387');
INSERT INTO `stu_to_tea` VALUES ('202252000435', '19760532804');
INSERT INTO `stu_to_tea` VALUES ('202252000436', '19760532576');
INSERT INTO `stu_to_tea` VALUES ('202252000436', '19760533044');
INSERT INTO `stu_to_tea` VALUES ('202252000437', '19760532344');
INSERT INTO `stu_to_tea` VALUES ('202252000437', '19760532979');
INSERT INTO `stu_to_tea` VALUES ('202252000438', '19760532344');
INSERT INTO `stu_to_tea` VALUES ('202252000438', '19760532710');
INSERT INTO `stu_to_tea` VALUES ('202252000439', '19760532440');
INSERT INTO `stu_to_tea` VALUES ('202252000439', '19760532741');
INSERT INTO `stu_to_tea` VALUES ('202252000440', '19760532849');
INSERT INTO `stu_to_tea` VALUES ('202252000440', '19760532938');
INSERT INTO `stu_to_tea` VALUES ('202252000441', '19760532063');
INSERT INTO `stu_to_tea` VALUES ('202252000441', '19760532344');
INSERT INTO `stu_to_tea` VALUES ('202252000442', '19760532144');
INSERT INTO `stu_to_tea` VALUES ('202252000442', '19760532150');
INSERT INTO `stu_to_tea` VALUES ('202252000443', '19760532972');
INSERT INTO `stu_to_tea` VALUES ('202252000443', '19760532985');
INSERT INTO `stu_to_tea` VALUES ('202252000444', '19760532901');
INSERT INTO `stu_to_tea` VALUES ('202252000444', '19760532940');
INSERT INTO `stu_to_tea` VALUES ('202252000445', '19760532803');
INSERT INTO `stu_to_tea` VALUES ('202252000445', '19760532973');
INSERT INTO `stu_to_tea` VALUES ('202252000446', '19760532275');
INSERT INTO `stu_to_tea` VALUES ('202252000446', '19760532488');
INSERT INTO `stu_to_tea` VALUES ('202252000447', '19760532135');
INSERT INTO `stu_to_tea` VALUES ('202252000447', '19760532290');
INSERT INTO `stu_to_tea` VALUES ('202252000448', '19760532612');
INSERT INTO `stu_to_tea` VALUES ('202252000448', '19760533042');
INSERT INTO `stu_to_tea` VALUES ('202252000449', '19760532237');
INSERT INTO `stu_to_tea` VALUES ('202252000449', '19760532550');
INSERT INTO `stu_to_tea` VALUES ('202252000450', '19760532519');
INSERT INTO `stu_to_tea` VALUES ('202252000450', '19760532613');
INSERT INTO `stu_to_tea` VALUES ('202252000451', '19760532518');
INSERT INTO `stu_to_tea` VALUES ('202252000451', '19760532638');
INSERT INTO `stu_to_tea` VALUES ('202252000452', '19760532558');
INSERT INTO `stu_to_tea` VALUES ('202252000452', '19760532633');
INSERT INTO `stu_to_tea` VALUES ('202252000453', '19760532074');
INSERT INTO `stu_to_tea` VALUES ('202252000453', '19760532195');
INSERT INTO `stu_to_tea` VALUES ('202252000454', '19760532477');
INSERT INTO `stu_to_tea` VALUES ('202252000454', '19760533055');
INSERT INTO `stu_to_tea` VALUES ('202252000455', '19760532237');
INSERT INTO `stu_to_tea` VALUES ('202252000455', '19760532329');
INSERT INTO `stu_to_tea` VALUES ('202252000456', '19760532127');
INSERT INTO `stu_to_tea` VALUES ('202252000456', '19760532363');
INSERT INTO `stu_to_tea` VALUES ('202252000457', '19760532386');
INSERT INTO `stu_to_tea` VALUES ('202252000457', '19760532428');
INSERT INTO `stu_to_tea` VALUES ('202252000458', '19760532979');
INSERT INTO `stu_to_tea` VALUES ('202252000458', '19760532981');
INSERT INTO `stu_to_tea` VALUES ('202252000459', '19760532448');
INSERT INTO `stu_to_tea` VALUES ('202252000459', '19760532786');
INSERT INTO `stu_to_tea` VALUES ('202252000460', '19760532345');
INSERT INTO `stu_to_tea` VALUES ('202252000460', '19760532802');
INSERT INTO `stu_to_tea` VALUES ('202252000461', '19760532655');
INSERT INTO `stu_to_tea` VALUES ('202252000461', '19760532810');
INSERT INTO `stu_to_tea` VALUES ('202252000462', '19760532458');
INSERT INTO `stu_to_tea` VALUES ('202252000462', '19760532845');
INSERT INTO `stu_to_tea` VALUES ('202252000463', '19760532475');
INSERT INTO `stu_to_tea` VALUES ('202252000463', '19760532860');
INSERT INTO `stu_to_tea` VALUES ('202252000464', '19760532544');
INSERT INTO `stu_to_tea` VALUES ('202252000464', '19760532846');
INSERT INTO `stu_to_tea` VALUES ('202252000465', '19760532172');
INSERT INTO `stu_to_tea` VALUES ('202252000465', '19760532998');
INSERT INTO `stu_to_tea` VALUES ('202252000466', '19760532487');
INSERT INTO `stu_to_tea` VALUES ('202252000466', '19760533022');
INSERT INTO `stu_to_tea` VALUES ('202252000467', '19760532132');
INSERT INTO `stu_to_tea` VALUES ('202252000467', '19760532354');
INSERT INTO `stu_to_tea` VALUES ('202252000468', '19760532524');
INSERT INTO `stu_to_tea` VALUES ('202252000468', '19760532579');
INSERT INTO `stu_to_tea` VALUES ('202252000469', '19760532362');
INSERT INTO `stu_to_tea` VALUES ('202252000469', '19760532667');
INSERT INTO `stu_to_tea` VALUES ('202252000470', '19760532183');
INSERT INTO `stu_to_tea` VALUES ('202252000470', '19760532960');
INSERT INTO `stu_to_tea` VALUES ('202252000471', '19760532625');
INSERT INTO `stu_to_tea` VALUES ('202252000471', '19760533033');
INSERT INTO `stu_to_tea` VALUES ('202252000472', '19760532769');
INSERT INTO `stu_to_tea` VALUES ('202252000472', '19760532993');
INSERT INTO `stu_to_tea` VALUES ('202252000473', '19760532092');
INSERT INTO `stu_to_tea` VALUES ('202252000473', '19760532927');
INSERT INTO `stu_to_tea` VALUES ('202252000474', '19760532082');
INSERT INTO `stu_to_tea` VALUES ('202252000474', '19760532323');
INSERT INTO `stu_to_tea` VALUES ('202252000475', '19760532239');
INSERT INTO `stu_to_tea` VALUES ('202252000475', '19760532693');
INSERT INTO `stu_to_tea` VALUES ('202252000476', '19760532268');
INSERT INTO `stu_to_tea` VALUES ('202252000476', '19760532977');
INSERT INTO `stu_to_tea` VALUES ('202252000477', '19760532284');
INSERT INTO `stu_to_tea` VALUES ('202252000477', '19760532657');
INSERT INTO `stu_to_tea` VALUES ('202252000478', '19760532475');
INSERT INTO `stu_to_tea` VALUES ('202252000478', '19760532502');
INSERT INTO `stu_to_tea` VALUES ('202252000479', '19760532298');
INSERT INTO `stu_to_tea` VALUES ('202252000479', '19760532704');
INSERT INTO `stu_to_tea` VALUES ('202252000480', '19760532541');
INSERT INTO `stu_to_tea` VALUES ('202252000480', '19760532704');
INSERT INTO `stu_to_tea` VALUES ('202252000481', '19760532849');
INSERT INTO `stu_to_tea` VALUES ('202252000481', '19760532928');
INSERT INTO `stu_to_tea` VALUES ('202252000482', '19760532107');
INSERT INTO `stu_to_tea` VALUES ('202252000482', '19760532241');
INSERT INTO `stu_to_tea` VALUES ('202252000483', '19760532657');
INSERT INTO `stu_to_tea` VALUES ('202252000483', '19760532954');
INSERT INTO `stu_to_tea` VALUES ('202252000484', '19760532680');
INSERT INTO `stu_to_tea` VALUES ('202252000484', '19760532807');
INSERT INTO `stu_to_tea` VALUES ('202252000485', '19760532124');
INSERT INTO `stu_to_tea` VALUES ('202252000485', '19760532577');
INSERT INTO `stu_to_tea` VALUES ('202252000486', '19760532520');
INSERT INTO `stu_to_tea` VALUES ('202252000486', '19760532740');
INSERT INTO `stu_to_tea` VALUES ('202252000487', '19760532539');
INSERT INTO `stu_to_tea` VALUES ('202252000487', '19760532713');
INSERT INTO `stu_to_tea` VALUES ('202252000488', '19760532605');
INSERT INTO `stu_to_tea` VALUES ('202252000488', '19760532962');
INSERT INTO `stu_to_tea` VALUES ('202252000489', '19760532915');
INSERT INTO `stu_to_tea` VALUES ('202252000489', '19760532919');
INSERT INTO `stu_to_tea` VALUES ('202252000490', '19760532406');
INSERT INTO `stu_to_tea` VALUES ('202252000490', '19760532432');
INSERT INTO `stu_to_tea` VALUES ('202252000491', '19760532081');
INSERT INTO `stu_to_tea` VALUES ('202252000491', '19760533025');
INSERT INTO `stu_to_tea` VALUES ('202252000492', '19760532820');
INSERT INTO `stu_to_tea` VALUES ('202252000492', '19760532904');
INSERT INTO `stu_to_tea` VALUES ('202252000493', '19760532326');
INSERT INTO `stu_to_tea` VALUES ('202252000493', '19760532870');
INSERT INTO `stu_to_tea` VALUES ('202252000494', '19760532266');
INSERT INTO `stu_to_tea` VALUES ('202252000494', '19760532292');
INSERT INTO `stu_to_tea` VALUES ('202252000495', '19760532355');
INSERT INTO `stu_to_tea` VALUES ('202252000495', '19760532959');
INSERT INTO `stu_to_tea` VALUES ('202252000496', '19760532069');
INSERT INTO `stu_to_tea` VALUES ('202252000496', '19760532551');
INSERT INTO `stu_to_tea` VALUES ('202252000497', '19760532093');
INSERT INTO `stu_to_tea` VALUES ('202252000497', '19760532341');
INSERT INTO `stu_to_tea` VALUES ('202252000498', '19760532499');
INSERT INTO `stu_to_tea` VALUES ('202252000498', '19760532550');
INSERT INTO `stu_to_tea` VALUES ('202252000499', '19760532639');
INSERT INTO `stu_to_tea` VALUES ('202252000499', '19760532888');
INSERT INTO `stu_to_tea` VALUES ('202252000500', '19760532615');
INSERT INTO `stu_to_tea` VALUES ('202252000500', '19760532655');
INSERT INTO `stu_to_tea` VALUES ('202252000501', '19760532457');
INSERT INTO `stu_to_tea` VALUES ('202252000501', '19760532727');
INSERT INTO `stu_to_tea` VALUES ('202252000502', '19760533021');
INSERT INTO `stu_to_tea` VALUES ('202252000502', '19760533039');
INSERT INTO `stu_to_tea` VALUES ('202252000503', '19760532193');
INSERT INTO `stu_to_tea` VALUES ('202252000503', '19760533044');
INSERT INTO `stu_to_tea` VALUES ('202252000504', '19760532122');
INSERT INTO `stu_to_tea` VALUES ('202252000504', '19760532311');
INSERT INTO `stu_to_tea` VALUES ('202252000505', '19760532207');
INSERT INTO `stu_to_tea` VALUES ('202252000505', '19760532475');
INSERT INTO `stu_to_tea` VALUES ('202252000506', '19760532091');
INSERT INTO `stu_to_tea` VALUES ('202252000506', '19760532302');
INSERT INTO `stu_to_tea` VALUES ('202252000507', '19760532317');
INSERT INTO `stu_to_tea` VALUES ('202252000507', '19760532841');
INSERT INTO `stu_to_tea` VALUES ('202252000508', '19760532429');
INSERT INTO `stu_to_tea` VALUES ('202252000508', '19760532716');
INSERT INTO `stu_to_tea` VALUES ('202252000509', '19760532256');
INSERT INTO `stu_to_tea` VALUES ('202252000509', '19760532874');
INSERT INTO `stu_to_tea` VALUES ('202252000510', '19760532409');
INSERT INTO `stu_to_tea` VALUES ('202252000510', '19760532900');
INSERT INTO `stu_to_tea` VALUES ('202252000511', '19760532212');
INSERT INTO `stu_to_tea` VALUES ('202252000511', '19760532415');
INSERT INTO `stu_to_tea` VALUES ('202252000512', '19760532430');
INSERT INTO `stu_to_tea` VALUES ('202252000512', '19760532473');
INSERT INTO `stu_to_tea` VALUES ('202252000513', '19760532186');
INSERT INTO `stu_to_tea` VALUES ('202252000513', '19760532276');
INSERT INTO `stu_to_tea` VALUES ('202252000514', '19760532464');
INSERT INTO `stu_to_tea` VALUES ('202252000514', '19760532683');
INSERT INTO `stu_to_tea` VALUES ('202252000515', '19760532811');
INSERT INTO `stu_to_tea` VALUES ('202252000515', '19760532897');
INSERT INTO `stu_to_tea` VALUES ('202252000516', '19760532064');
INSERT INTO `stu_to_tea` VALUES ('202252000516', '19760532244');
INSERT INTO `stu_to_tea` VALUES ('202252000517', '19760532385');
INSERT INTO `stu_to_tea` VALUES ('202252000517', '19760533009');
INSERT INTO `stu_to_tea` VALUES ('202252000518', '19760532731');
INSERT INTO `stu_to_tea` VALUES ('202252000518', '19760532902');
INSERT INTO `stu_to_tea` VALUES ('202252000519', '19760532392');
INSERT INTO `stu_to_tea` VALUES ('202252000519', '19760533020');
INSERT INTO `stu_to_tea` VALUES ('202252000520', '19760532842');
INSERT INTO `stu_to_tea` VALUES ('202252000520', '19760533045');
INSERT INTO `stu_to_tea` VALUES ('202252000521', '19760532424');
INSERT INTO `stu_to_tea` VALUES ('202252000521', '19760532982');
INSERT INTO `stu_to_tea` VALUES ('202252000522', '19760532341');
INSERT INTO `stu_to_tea` VALUES ('202252000522', '19760532598');
INSERT INTO `stu_to_tea` VALUES ('202252000523', '19760532595');
INSERT INTO `stu_to_tea` VALUES ('202252000523', '19760532624');
INSERT INTO `stu_to_tea` VALUES ('202252000524', '19760532756');
INSERT INTO `stu_to_tea` VALUES ('202252000524', '19760532975');
INSERT INTO `stu_to_tea` VALUES ('202252000525', '19760532173');
INSERT INTO `stu_to_tea` VALUES ('202252000525', '19760532867');
INSERT INTO `stu_to_tea` VALUES ('202252000526', '19760532470');
INSERT INTO `stu_to_tea` VALUES ('202252000526', '19760532832');
INSERT INTO `stu_to_tea` VALUES ('202252000527', '19760532061');
INSERT INTO `stu_to_tea` VALUES ('202252000527', '19760532907');
INSERT INTO `stu_to_tea` VALUES ('202252000528', '19760532221');
INSERT INTO `stu_to_tea` VALUES ('202252000528', '19760532364');
INSERT INTO `stu_to_tea` VALUES ('202252000529', '19760532521');
INSERT INTO `stu_to_tea` VALUES ('202252000529', '19760532961');
INSERT INTO `stu_to_tea` VALUES ('202252000530', '19760532663');
INSERT INTO `stu_to_tea` VALUES ('202252000530', '19760532794');
INSERT INTO `stu_to_tea` VALUES ('202252000531', '19760532216');
INSERT INTO `stu_to_tea` VALUES ('202252000531', '19760532859');
INSERT INTO `stu_to_tea` VALUES ('202252000532', '19760532649');
INSERT INTO `stu_to_tea` VALUES ('202252000532', '19760532982');
INSERT INTO `stu_to_tea` VALUES ('202252000533', '19760532197');
INSERT INTO `stu_to_tea` VALUES ('202252000533', '19760532634');
INSERT INTO `stu_to_tea` VALUES ('202252000534', '19760532206');
INSERT INTO `stu_to_tea` VALUES ('202252000534', '19760532945');
INSERT INTO `stu_to_tea` VALUES ('202252000535', '19760532729');
INSERT INTO `stu_to_tea` VALUES ('202252000535', '19760532911');
INSERT INTO `stu_to_tea` VALUES ('202252000536', '19760532394');
INSERT INTO `stu_to_tea` VALUES ('202252000536', '19760532600');
INSERT INTO `stu_to_tea` VALUES ('202252000537', '19760532185');
INSERT INTO `stu_to_tea` VALUES ('202252000537', '19760533053');
INSERT INTO `stu_to_tea` VALUES ('202252000538', '19760532256');
INSERT INTO `stu_to_tea` VALUES ('202252000538', '19760532829');
INSERT INTO `stu_to_tea` VALUES ('202252000539', '19760532288');
INSERT INTO `stu_to_tea` VALUES ('202252000539', '19760532525');
INSERT INTO `stu_to_tea` VALUES ('202252000540', '19760532587');
INSERT INTO `stu_to_tea` VALUES ('202252000540', '19760533040');
INSERT INTO `stu_to_tea` VALUES ('202252000541', '19760532494');
INSERT INTO `stu_to_tea` VALUES ('202252000541', '19760532960');
INSERT INTO `stu_to_tea` VALUES ('202252000542', '19760532457');
INSERT INTO `stu_to_tea` VALUES ('202252000542', '19760532531');
INSERT INTO `stu_to_tea` VALUES ('202252000543', '19760532896');
INSERT INTO `stu_to_tea` VALUES ('202252000543', '19760532907');
INSERT INTO `stu_to_tea` VALUES ('202252000544', '19760532334');
INSERT INTO `stu_to_tea` VALUES ('202252000544', '19760532797');
INSERT INTO `stu_to_tea` VALUES ('202252000545', '19760532648');
INSERT INTO `stu_to_tea` VALUES ('202252000545', '19760532931');
INSERT INTO `stu_to_tea` VALUES ('202252000546', '19760532378');
INSERT INTO `stu_to_tea` VALUES ('202252000546', '19760532545');
INSERT INTO `stu_to_tea` VALUES ('202252000547', '19760532336');
INSERT INTO `stu_to_tea` VALUES ('202252000547', '19760532890');
INSERT INTO `stu_to_tea` VALUES ('202252000548', '19760532107');
INSERT INTO `stu_to_tea` VALUES ('202252000548', '19760532590');
INSERT INTO `stu_to_tea` VALUES ('202252000549', '19760532573');
INSERT INTO `stu_to_tea` VALUES ('202252000549', '19760532708');
INSERT INTO `stu_to_tea` VALUES ('202252000550', '19760532120');
INSERT INTO `stu_to_tea` VALUES ('202252000550', '19760532461');
INSERT INTO `stu_to_tea` VALUES ('202252000551', '19760532415');
INSERT INTO `stu_to_tea` VALUES ('202252000551', '19760532768');
INSERT INTO `stu_to_tea` VALUES ('202252000552', '19760532654');
INSERT INTO `stu_to_tea` VALUES ('202252000552', '19760532837');
INSERT INTO `stu_to_tea` VALUES ('202252000553', '19760532091');
INSERT INTO `stu_to_tea` VALUES ('202252000553', '19760532587');
INSERT INTO `stu_to_tea` VALUES ('202252000554', '19760532438');
INSERT INTO `stu_to_tea` VALUES ('202252000554', '19760532863');
INSERT INTO `stu_to_tea` VALUES ('202252000555', '19760532248');
INSERT INTO `stu_to_tea` VALUES ('202252000555', '19760532825');
INSERT INTO `stu_to_tea` VALUES ('202252000556', '19760532436');
INSERT INTO `stu_to_tea` VALUES ('202252000556', '19760532463');
INSERT INTO `stu_to_tea` VALUES ('202252000557', '19760532899');
INSERT INTO `stu_to_tea` VALUES ('202252000557', '19760532992');
INSERT INTO `stu_to_tea` VALUES ('202252000558', '19760532679');
INSERT INTO `stu_to_tea` VALUES ('202252000558', '19760532737');
INSERT INTO `stu_to_tea` VALUES ('202252000559', '19760532215');
INSERT INTO `stu_to_tea` VALUES ('202252000559', '19760532862');
INSERT INTO `stu_to_tea` VALUES ('202252000560', '19760532322');
INSERT INTO `stu_to_tea` VALUES ('202252000560', '19760532534');
INSERT INTO `stu_to_tea` VALUES ('202252000561', '19760532130');
INSERT INTO `stu_to_tea` VALUES ('202252000561', '19760532786');
INSERT INTO `stu_to_tea` VALUES ('202252000562', '19760532363');
INSERT INTO `stu_to_tea` VALUES ('202252000562', '19760532649');
INSERT INTO `stu_to_tea` VALUES ('202252000563', '19760532465');
INSERT INTO `stu_to_tea` VALUES ('202252000563', '19760532687');
INSERT INTO `stu_to_tea` VALUES ('202252000564', '19760532166');
INSERT INTO `stu_to_tea` VALUES ('202252000564', '19760532829');
INSERT INTO `stu_to_tea` VALUES ('202252000565', '19760532164');
INSERT INTO `stu_to_tea` VALUES ('202252000565', '19760532756');
INSERT INTO `stu_to_tea` VALUES ('202252000566', '19760532277');
INSERT INTO `stu_to_tea` VALUES ('202252000566', '19760533052');
INSERT INTO `stu_to_tea` VALUES ('202252000567', '19760532621');
INSERT INTO `stu_to_tea` VALUES ('202252000567', '19760532996');
INSERT INTO `stu_to_tea` VALUES ('202252000568', '19760532238');
INSERT INTO `stu_to_tea` VALUES ('202252000568', '19760532291');
INSERT INTO `stu_to_tea` VALUES ('202252000569', '19760532303');
INSERT INTO `stu_to_tea` VALUES ('202252000569', '19760532641');
INSERT INTO `stu_to_tea` VALUES ('202252000570', '19760532076');
INSERT INTO `stu_to_tea` VALUES ('202252000570', '19760532950');
INSERT INTO `stu_to_tea` VALUES ('202252000571', '19760532410');
INSERT INTO `stu_to_tea` VALUES ('202252000571', '19760532842');
INSERT INTO `stu_to_tea` VALUES ('202252000572', '19760532720');
INSERT INTO `stu_to_tea` VALUES ('202252000572', '19760532959');
INSERT INTO `stu_to_tea` VALUES ('202252000573', '19760532600');
INSERT INTO `stu_to_tea` VALUES ('202252000573', '19760532809');
INSERT INTO `stu_to_tea` VALUES ('202252000574', '19760532354');
INSERT INTO `stu_to_tea` VALUES ('202252000574', '19760532701');
INSERT INTO `stu_to_tea` VALUES ('202252000575', '19760532278');
INSERT INTO `stu_to_tea` VALUES ('202252000575', '19760532781');
INSERT INTO `stu_to_tea` VALUES ('202252000576', '19760532110');
INSERT INTO `stu_to_tea` VALUES ('202252000576', '19760532811');
INSERT INTO `stu_to_tea` VALUES ('202252000577', '19760532100');
INSERT INTO `stu_to_tea` VALUES ('202252000577', '19760533045');
INSERT INTO `stu_to_tea` VALUES ('202252000578', '19760532617');
INSERT INTO `stu_to_tea` VALUES ('202252000578', '19760532958');
INSERT INTO `stu_to_tea` VALUES ('202252000579', '19760532091');
INSERT INTO `stu_to_tea` VALUES ('202252000579', '19760532941');
INSERT INTO `stu_to_tea` VALUES ('202252000580', '19760532173');
INSERT INTO `stu_to_tea` VALUES ('202252000580', '19760532181');
INSERT INTO `stu_to_tea` VALUES ('202252000581', '19760532347');
INSERT INTO `stu_to_tea` VALUES ('202252000581', '19760532362');
INSERT INTO `stu_to_tea` VALUES ('202252000582', '19760532178');
INSERT INTO `stu_to_tea` VALUES ('202252000582', '19760532969');
INSERT INTO `stu_to_tea` VALUES ('202252000583', '19760532740');
INSERT INTO `stu_to_tea` VALUES ('202252000583', '19760532895');
INSERT INTO `stu_to_tea` VALUES ('202252000584', '19760532157');
INSERT INTO `stu_to_tea` VALUES ('202252000584', '19760532398');
INSERT INTO `stu_to_tea` VALUES ('202252000585', '19760532141');
INSERT INTO `stu_to_tea` VALUES ('202252000585', '19760532434');
INSERT INTO `stu_to_tea` VALUES ('202252000586', '19760532217');
INSERT INTO `stu_to_tea` VALUES ('202252000586', '19760532798');
INSERT INTO `stu_to_tea` VALUES ('202252000587', '19760532118');
INSERT INTO `stu_to_tea` VALUES ('202252000587', '19760532583');
INSERT INTO `stu_to_tea` VALUES ('202252000588', '19760532609');
INSERT INTO `stu_to_tea` VALUES ('202252000588', '19760532829');
INSERT INTO `stu_to_tea` VALUES ('202252000589', '19760532097');
INSERT INTO `stu_to_tea` VALUES ('202252000589', '19760532906');
INSERT INTO `stu_to_tea` VALUES ('202252000590', '19760532213');
INSERT INTO `stu_to_tea` VALUES ('202252000590', '19760532320');
INSERT INTO `stu_to_tea` VALUES ('202252000591', '19760532104');
INSERT INTO `stu_to_tea` VALUES ('202252000591', '19760532178');
INSERT INTO `stu_to_tea` VALUES ('202252000592', '19760532143');
INSERT INTO `stu_to_tea` VALUES ('202252000592', '19760532999');
INSERT INTO `stu_to_tea` VALUES ('202252000593', '19760532666');
INSERT INTO `stu_to_tea` VALUES ('202252000593', '19760532798');
INSERT INTO `stu_to_tea` VALUES ('202252000594', '19760532676');
INSERT INTO `stu_to_tea` VALUES ('202252000594', '19760532849');
INSERT INTO `stu_to_tea` VALUES ('202252000595', '19760532700');
INSERT INTO `stu_to_tea` VALUES ('202252000595', '19760532927');
INSERT INTO `stu_to_tea` VALUES ('202252000596', '19760532385');
INSERT INTO `stu_to_tea` VALUES ('202252000596', '19760532508');
INSERT INTO `stu_to_tea` VALUES ('202252000597', '19760532585');
INSERT INTO `stu_to_tea` VALUES ('202252000597', '19760532601');
INSERT INTO `stu_to_tea` VALUES ('202252000598', '19760532273');
INSERT INTO `stu_to_tea` VALUES ('202252000598', '19760532518');
INSERT INTO `stu_to_tea` VALUES ('202252000599', '19760532352');
INSERT INTO `stu_to_tea` VALUES ('202252000599', '19760532974');
INSERT INTO `stu_to_tea` VALUES ('202252000600', '19760532350');
INSERT INTO `stu_to_tea` VALUES ('202252000600', '19760532806');
INSERT INTO `stu_to_tea` VALUES ('202252000601', '19760532400');
INSERT INTO `stu_to_tea` VALUES ('202252000601', '19760532913');
INSERT INTO `stu_to_tea` VALUES ('202252000602', '19760532524');
INSERT INTO `stu_to_tea` VALUES ('202252000602', '19760533025');
INSERT INTO `stu_to_tea` VALUES ('202252000603', '19760532220');
INSERT INTO `stu_to_tea` VALUES ('202252000603', '19760532249');
INSERT INTO `stu_to_tea` VALUES ('202252000604', '19760532783');
INSERT INTO `stu_to_tea` VALUES ('202252000604', '19760532909');
INSERT INTO `stu_to_tea` VALUES ('202252000605', '19760532296');
INSERT INTO `stu_to_tea` VALUES ('202252000605', '19760532373');
INSERT INTO `stu_to_tea` VALUES ('202252000606', '19760532493');
INSERT INTO `stu_to_tea` VALUES ('202252000606', '19760532556');
INSERT INTO `stu_to_tea` VALUES ('202252000607', '19760532310');
INSERT INTO `stu_to_tea` VALUES ('202252000607', '19760532774');
INSERT INTO `stu_to_tea` VALUES ('202252000608', '19760532175');
INSERT INTO `stu_to_tea` VALUES ('202252000608', '19760532814');
INSERT INTO `stu_to_tea` VALUES ('202252000609', '19760532506');
INSERT INTO `stu_to_tea` VALUES ('202252000609', '19760532590');
INSERT INTO `stu_to_tea` VALUES ('202252000610', '19760532288');
INSERT INTO `stu_to_tea` VALUES ('202252000610', '19760532877');
INSERT INTO `stu_to_tea` VALUES ('202252000611', '19760532402');
INSERT INTO `stu_to_tea` VALUES ('202252000611', '19760532548');
INSERT INTO `stu_to_tea` VALUES ('202252000612', '19760532272');
INSERT INTO `stu_to_tea` VALUES ('202252000612', '19760532889');
INSERT INTO `stu_to_tea` VALUES ('202252000613', '19760532444');
INSERT INTO `stu_to_tea` VALUES ('202252000613', '19760532452');
INSERT INTO `stu_to_tea` VALUES ('202252000614', '19760532128');
INSERT INTO `stu_to_tea` VALUES ('202252000614', '19760532947');
INSERT INTO `stu_to_tea` VALUES ('202252000615', '19760532242');
INSERT INTO `stu_to_tea` VALUES ('202252000615', '19760532570');
INSERT INTO `stu_to_tea` VALUES ('202252000616', '19760532408');
INSERT INTO `stu_to_tea` VALUES ('202252000616', '19760532490');
INSERT INTO `stu_to_tea` VALUES ('202252000617', '19760532131');
INSERT INTO `stu_to_tea` VALUES ('202252000617', '19760532145');
INSERT INTO `stu_to_tea` VALUES ('202252000618', '19760532743');
INSERT INTO `stu_to_tea` VALUES ('202252000618', '19760532908');
INSERT INTO `stu_to_tea` VALUES ('202252000619', '19760532859');
INSERT INTO `stu_to_tea` VALUES ('202252000619', '19760532995');
INSERT INTO `stu_to_tea` VALUES ('202252000620', '19760532247');
INSERT INTO `stu_to_tea` VALUES ('202252000620', '19760532979');
INSERT INTO `stu_to_tea` VALUES ('202252000621', '19760532660');
INSERT INTO `stu_to_tea` VALUES ('202252000621', '19760532976');
INSERT INTO `stu_to_tea` VALUES ('202252000622', '19760532529');
INSERT INTO `stu_to_tea` VALUES ('202252000622', '19760532552');
INSERT INTO `stu_to_tea` VALUES ('202252000623', '19760532409');
INSERT INTO `stu_to_tea` VALUES ('202252000623', '19760532744');
INSERT INTO `stu_to_tea` VALUES ('202252000624', '19760532239');
INSERT INTO `stu_to_tea` VALUES ('202252000624', '19760532635');
INSERT INTO `stu_to_tea` VALUES ('202252000625', '19760532472');
INSERT INTO `stu_to_tea` VALUES ('202252000625', '19760533007');
INSERT INTO `stu_to_tea` VALUES ('202252000626', '19760532142');
INSERT INTO `stu_to_tea` VALUES ('202252000626', '19760533031');
INSERT INTO `stu_to_tea` VALUES ('202252000627', '19760532310');
INSERT INTO `stu_to_tea` VALUES ('202252000627', '19760532556');
INSERT INTO `stu_to_tea` VALUES ('202252000628', '19760532136');
INSERT INTO `stu_to_tea` VALUES ('202252000628', '19760532444');
INSERT INTO `stu_to_tea` VALUES ('202252000629', '19760532737');
INSERT INTO `stu_to_tea` VALUES ('202252000629', '19760533021');
INSERT INTO `stu_to_tea` VALUES ('202252000630', '19760532606');
INSERT INTO `stu_to_tea` VALUES ('202252000630', '19760532959');
INSERT INTO `stu_to_tea` VALUES ('202252000631', '19760532181');
INSERT INTO `stu_to_tea` VALUES ('202252000631', '19760532755');
INSERT INTO `stu_to_tea` VALUES ('202252000632', '19760532509');
INSERT INTO `stu_to_tea` VALUES ('202252000632', '19760532609');
INSERT INTO `stu_to_tea` VALUES ('202252000633', '19760532178');
INSERT INTO `stu_to_tea` VALUES ('202252000633', '19760532407');
INSERT INTO `stu_to_tea` VALUES ('202252000634', '19760532229');
INSERT INTO `stu_to_tea` VALUES ('202252000634', '19760532948');
INSERT INTO `stu_to_tea` VALUES ('202252000635', '19760532705');
INSERT INTO `stu_to_tea` VALUES ('202252000635', '19760532798');
INSERT INTO `stu_to_tea` VALUES ('202252000636', '19760532332');
INSERT INTO `stu_to_tea` VALUES ('202252000636', '19760532675');
INSERT INTO `stu_to_tea` VALUES ('202252000637', '19760532288');
INSERT INTO `stu_to_tea` VALUES ('202252000637', '19760532496');
INSERT INTO `stu_to_tea` VALUES ('202252000638', '19760532191');
INSERT INTO `stu_to_tea` VALUES ('202252000638', '19760532246');
INSERT INTO `stu_to_tea` VALUES ('202252000639', '19760532195');
INSERT INTO `stu_to_tea` VALUES ('202252000639', '19760532340');
INSERT INTO `stu_to_tea` VALUES ('202252000640', '19760532144');
INSERT INTO `stu_to_tea` VALUES ('202252000640', '19760532682');
INSERT INTO `stu_to_tea` VALUES ('202252000641', '19760532239');
INSERT INTO `stu_to_tea` VALUES ('202252000641', '19760532979');
INSERT INTO `stu_to_tea` VALUES ('202252000642', '19760532170');
INSERT INTO `stu_to_tea` VALUES ('202252000642', '19760532490');
INSERT INTO `stu_to_tea` VALUES ('202252000643', '19760532150');
INSERT INTO `stu_to_tea` VALUES ('202252000643', '19760532597');
INSERT INTO `stu_to_tea` VALUES ('202252000644', '19760532500');
INSERT INTO `stu_to_tea` VALUES ('202252000644', '19760532532');
INSERT INTO `stu_to_tea` VALUES ('202252000645', '19760532212');
INSERT INTO `stu_to_tea` VALUES ('202252000645', '19760532405');
INSERT INTO `stu_to_tea` VALUES ('202252000646', '19760532467');
INSERT INTO `stu_to_tea` VALUES ('202252000646', '19760532958');
INSERT INTO `stu_to_tea` VALUES ('202252000647', '19760532414');
INSERT INTO `stu_to_tea` VALUES ('202252000647', '19760532881');
INSERT INTO `stu_to_tea` VALUES ('202252000648', '19760532414');
INSERT INTO `stu_to_tea` VALUES ('202252000648', '19760532429');
INSERT INTO `stu_to_tea` VALUES ('202252000649', '19760532796');
INSERT INTO `stu_to_tea` VALUES ('202252000649', '19760532869');
INSERT INTO `stu_to_tea` VALUES ('202252000650', '19760532083');
INSERT INTO `stu_to_tea` VALUES ('202252000650', '19760532640');
INSERT INTO `stu_to_tea` VALUES ('202252000651', '19760532563');
INSERT INTO `stu_to_tea` VALUES ('202252000651', '19760532971');
INSERT INTO `stu_to_tea` VALUES ('202252000652', '19760532447');
INSERT INTO `stu_to_tea` VALUES ('202252000652', '19760532890');
INSERT INTO `stu_to_tea` VALUES ('202252000653', '19760532593');
INSERT INTO `stu_to_tea` VALUES ('202252000653', '19760532878');
INSERT INTO `stu_to_tea` VALUES ('202252000654', '19760532204');
INSERT INTO `stu_to_tea` VALUES ('202252000654', '19760532678');
INSERT INTO `stu_to_tea` VALUES ('202252000655', '19760532828');
INSERT INTO `stu_to_tea` VALUES ('202252000655', '19760532955');
INSERT INTO `stu_to_tea` VALUES ('202252000656', '19760532150');
INSERT INTO `stu_to_tea` VALUES ('202252000656', '19760532699');
INSERT INTO `stu_to_tea` VALUES ('202252000657', '19760532284');
INSERT INTO `stu_to_tea` VALUES ('202252000657', '19760532551');
INSERT INTO `stu_to_tea` VALUES ('202252000658', '19760532412');
INSERT INTO `stu_to_tea` VALUES ('202252000658', '19760532859');
INSERT INTO `stu_to_tea` VALUES ('202252000659', '19760532290');
INSERT INTO `stu_to_tea` VALUES ('202252000659', '19760532639');
INSERT INTO `stu_to_tea` VALUES ('202252000660', '19760532503');
INSERT INTO `stu_to_tea` VALUES ('202252000660', '19760532829');
INSERT INTO `stu_to_tea` VALUES ('202252000661', '19760532198');
INSERT INTO `stu_to_tea` VALUES ('202252000661', '19760532611');
INSERT INTO `stu_to_tea` VALUES ('202252000662', '19760532156');
INSERT INTO `stu_to_tea` VALUES ('202252000662', '19760532913');
INSERT INTO `stu_to_tea` VALUES ('202252000663', '19760532554');
INSERT INTO `stu_to_tea` VALUES ('202252000663', '19760532700');
INSERT INTO `stu_to_tea` VALUES ('202252000664', '19760532133');
INSERT INTO `stu_to_tea` VALUES ('202252000664', '19760532444');
INSERT INTO `stu_to_tea` VALUES ('202252000665', '19760532354');
INSERT INTO `stu_to_tea` VALUES ('202252000665', '19760532591');
INSERT INTO `stu_to_tea` VALUES ('202252000666', '19760532738');
INSERT INTO `stu_to_tea` VALUES ('202252000666', '19760532923');
INSERT INTO `stu_to_tea` VALUES ('202252000667', '19760532322');
INSERT INTO `stu_to_tea` VALUES ('202252000667', '19760532866');
INSERT INTO `stu_to_tea` VALUES ('202252000668', '19760532419');
INSERT INTO `stu_to_tea` VALUES ('202252000668', '19760532639');
INSERT INTO `stu_to_tea` VALUES ('202252000669', '19760532108');
INSERT INTO `stu_to_tea` VALUES ('202252000669', '19760532877');
INSERT INTO `stu_to_tea` VALUES ('202252000670', '19760532804');
INSERT INTO `stu_to_tea` VALUES ('202252000670', '19760533025');
INSERT INTO `stu_to_tea` VALUES ('202252000671', '19760532321');
INSERT INTO `stu_to_tea` VALUES ('202252000671', '19760532661');
INSERT INTO `stu_to_tea` VALUES ('202252000672', '19760532502');
INSERT INTO `stu_to_tea` VALUES ('202252000672', '19760532622');
INSERT INTO `stu_to_tea` VALUES ('202252000673', '19760532416');
INSERT INTO `stu_to_tea` VALUES ('202252000673', '19760532660');
INSERT INTO `stu_to_tea` VALUES ('202252000674', '19760532292');
INSERT INTO `stu_to_tea` VALUES ('202252000674', '19760532874');
INSERT INTO `stu_to_tea` VALUES ('202252000675', '19760532228');
INSERT INTO `stu_to_tea` VALUES ('202252000675', '19760532696');
INSERT INTO `stu_to_tea` VALUES ('202252000676', '19760532308');
INSERT INTO `stu_to_tea` VALUES ('202252000676', '19760532511');
INSERT INTO `stu_to_tea` VALUES ('202252000677', '19760532085');
INSERT INTO `stu_to_tea` VALUES ('202252000677', '19760532326');
INSERT INTO `stu_to_tea` VALUES ('202252000678', '19760532494');
INSERT INTO `stu_to_tea` VALUES ('202252000678', '19760532912');
INSERT INTO `stu_to_tea` VALUES ('202252000679', '19760532870');
INSERT INTO `stu_to_tea` VALUES ('202252000679', '19760532909');
INSERT INTO `stu_to_tea` VALUES ('202252000680', '19760532215');
INSERT INTO `stu_to_tea` VALUES ('202252000680', '19760532318');
INSERT INTO `stu_to_tea` VALUES ('202252000681', '19760532527');
INSERT INTO `stu_to_tea` VALUES ('202252000681', '19760532837');
INSERT INTO `stu_to_tea` VALUES ('202252000682', '19760532431');
INSERT INTO `stu_to_tea` VALUES ('202252000682', '19760532747');
INSERT INTO `stu_to_tea` VALUES ('202252000683', '19760532110');
INSERT INTO `stu_to_tea` VALUES ('202252000683', '19760532422');
INSERT INTO `stu_to_tea` VALUES ('202252000684', '19760532400');
INSERT INTO `stu_to_tea` VALUES ('202252000684', '19760532537');
INSERT INTO `stu_to_tea` VALUES ('202252000685', '19760532086');
INSERT INTO `stu_to_tea` VALUES ('202252000685', '19760532633');
INSERT INTO `stu_to_tea` VALUES ('202252000686', '19760532379');
INSERT INTO `stu_to_tea` VALUES ('202252000686', '19760532647');
INSERT INTO `stu_to_tea` VALUES ('202252000687', '19760532937');
INSERT INTO `stu_to_tea` VALUES ('202252000687', '19760532994');
INSERT INTO `stu_to_tea` VALUES ('202252000688', '19760532478');
INSERT INTO `stu_to_tea` VALUES ('202252000688', '19760532664');
INSERT INTO `stu_to_tea` VALUES ('202252000689', '19760532288');
INSERT INTO `stu_to_tea` VALUES ('202252000689', '19760532681');
INSERT INTO `stu_to_tea` VALUES ('202252000690', '19760532122');
INSERT INTO `stu_to_tea` VALUES ('202252000690', '19760532736');
INSERT INTO `stu_to_tea` VALUES ('202252000691', '19760532344');
INSERT INTO `stu_to_tea` VALUES ('202252000691', '19760532629');
INSERT INTO `stu_to_tea` VALUES ('202252000692', '19760532650');
INSERT INTO `stu_to_tea` VALUES ('202252000692', '19760532911');
INSERT INTO `stu_to_tea` VALUES ('202252000693', '19760532188');
INSERT INTO `stu_to_tea` VALUES ('202252000693', '19760532203');
INSERT INTO `stu_to_tea` VALUES ('202252000694', '19760532204');
INSERT INTO `stu_to_tea` VALUES ('202252000694', '19760532368');
INSERT INTO `stu_to_tea` VALUES ('202252000695', '19760532093');
INSERT INTO `stu_to_tea` VALUES ('202252000695', '19760532401');
INSERT INTO `stu_to_tea` VALUES ('202252000696', '19760532729');
INSERT INTO `stu_to_tea` VALUES ('202252000696', '19760533014');
INSERT INTO `stu_to_tea` VALUES ('202252000697', '19760532375');
INSERT INTO `stu_to_tea` VALUES ('202252000697', '19760532810');
INSERT INTO `stu_to_tea` VALUES ('202252000698', '19760532276');
INSERT INTO `stu_to_tea` VALUES ('202252000698', '19760532815');
INSERT INTO `stu_to_tea` VALUES ('202252000699', '19760532139');
INSERT INTO `stu_to_tea` VALUES ('202252000699', '19760532725');
INSERT INTO `stu_to_tea` VALUES ('202252000700', '19760532158');
INSERT INTO `stu_to_tea` VALUES ('202252000700', '19760532588');
INSERT INTO `stu_to_tea` VALUES ('202252000701', '19760532573');
INSERT INTO `stu_to_tea` VALUES ('202252000701', '19760533034');
INSERT INTO `stu_to_tea` VALUES ('202252000702', '19760532260');
INSERT INTO `stu_to_tea` VALUES ('202252000702', '19760532951');
INSERT INTO `stu_to_tea` VALUES ('202252000703', '19760532631');
INSERT INTO `stu_to_tea` VALUES ('202252000703', '19760532739');
INSERT INTO `stu_to_tea` VALUES ('202252000704', '19760532220');
INSERT INTO `stu_to_tea` VALUES ('202252000704', '19760532402');
INSERT INTO `stu_to_tea` VALUES ('202252000705', '19760532655');
INSERT INTO `stu_to_tea` VALUES ('202252000705', '19760532980');
INSERT INTO `stu_to_tea` VALUES ('202252000706', '19760532304');
INSERT INTO `stu_to_tea` VALUES ('202252000706', '19760532361');
INSERT INTO `stu_to_tea` VALUES ('202252000707', '19760532290');
INSERT INTO `stu_to_tea` VALUES ('202252000707', '19760532624');
INSERT INTO `stu_to_tea` VALUES ('202252000708', '19760532465');
INSERT INTO `stu_to_tea` VALUES ('202252000708', '19760532901');
INSERT INTO `stu_to_tea` VALUES ('202252000709', '19760532102');
INSERT INTO `stu_to_tea` VALUES ('202252000709', '19760532582');
INSERT INTO `stu_to_tea` VALUES ('202252000710', '19760532620');
INSERT INTO `stu_to_tea` VALUES ('202252000710', '19760533048');
INSERT INTO `stu_to_tea` VALUES ('202252000711', '19760532534');
INSERT INTO `stu_to_tea` VALUES ('202252000711', '19760533036');
INSERT INTO `stu_to_tea` VALUES ('202252000712', '19760532621');
INSERT INTO `stu_to_tea` VALUES ('202252000712', '19760532731');
INSERT INTO `stu_to_tea` VALUES ('202252000713', '19760532437');
INSERT INTO `stu_to_tea` VALUES ('202252000713', '19760532627');
INSERT INTO `stu_to_tea` VALUES ('202252000714', '19760532369');
INSERT INTO `stu_to_tea` VALUES ('202252000714', '19760533052');
INSERT INTO `stu_to_tea` VALUES ('202252000715', '19760532329');
INSERT INTO `stu_to_tea` VALUES ('202252000715', '19760533048');
INSERT INTO `stu_to_tea` VALUES ('202252000716', '19760532161');
INSERT INTO `stu_to_tea` VALUES ('202252000716', '19760532781');
INSERT INTO `stu_to_tea` VALUES ('202252000717', '19760532507');
INSERT INTO `stu_to_tea` VALUES ('202252000717', '19760532831');
INSERT INTO `stu_to_tea` VALUES ('202252000718', '19760532433');
INSERT INTO `stu_to_tea` VALUES ('202252000718', '19760532910');
INSERT INTO `stu_to_tea` VALUES ('202252000719', '19760532072');
INSERT INTO `stu_to_tea` VALUES ('202252000719', '19760532530');
INSERT INTO `stu_to_tea` VALUES ('202252000720', '19760532358');
INSERT INTO `stu_to_tea` VALUES ('202252000720', '19760532428');
INSERT INTO `stu_to_tea` VALUES ('202252000721', '19760532430');
INSERT INTO `stu_to_tea` VALUES ('202252000721', '19760532771');
INSERT INTO `stu_to_tea` VALUES ('202252000722', '19760532625');
INSERT INTO `stu_to_tea` VALUES ('202252000722', '19760532953');
INSERT INTO `stu_to_tea` VALUES ('202252000723', '19760532191');
INSERT INTO `stu_to_tea` VALUES ('202252000723', '19760532210');
INSERT INTO `stu_to_tea` VALUES ('202252000724', '19760532170');
INSERT INTO `stu_to_tea` VALUES ('202252000724', '19760533022');
INSERT INTO `stu_to_tea` VALUES ('202252000725', '19760532092');
INSERT INTO `stu_to_tea` VALUES ('202252000725', '19760532626');
INSERT INTO `stu_to_tea` VALUES ('202252000726', '19760532404');
INSERT INTO `stu_to_tea` VALUES ('202252000726', '19760532998');
INSERT INTO `stu_to_tea` VALUES ('202252000727', '19760532390');
INSERT INTO `stu_to_tea` VALUES ('202252000727', '19760532906');
INSERT INTO `stu_to_tea` VALUES ('202252000728', '19760532192');
INSERT INTO `stu_to_tea` VALUES ('202252000728', '19760532959');
INSERT INTO `stu_to_tea` VALUES ('202252000729', '19760532215');
INSERT INTO `stu_to_tea` VALUES ('202252000729', '19760532716');
INSERT INTO `stu_to_tea` VALUES ('202252000730', '19760532161');
INSERT INTO `stu_to_tea` VALUES ('202252000730', '19760532833');
INSERT INTO `stu_to_tea` VALUES ('202252000731', '19760532348');
INSERT INTO `stu_to_tea` VALUES ('202252000731', '19760532427');
INSERT INTO `stu_to_tea` VALUES ('202252000732', '19760532515');
INSERT INTO `stu_to_tea` VALUES ('202252000732', '19760532794');
INSERT INTO `stu_to_tea` VALUES ('202252000733', '19760532296');
INSERT INTO `stu_to_tea` VALUES ('202252000733', '19760532931');
INSERT INTO `stu_to_tea` VALUES ('202252000734', '19760532756');
INSERT INTO `stu_to_tea` VALUES ('202252000734', '19760532767');
INSERT INTO `stu_to_tea` VALUES ('202252000735', '19760532701');
INSERT INTO `stu_to_tea` VALUES ('202252000735', '19760533023');
INSERT INTO `stu_to_tea` VALUES ('202252000736', '19760532795');
INSERT INTO `stu_to_tea` VALUES ('202252000736', '19760532880');
INSERT INTO `stu_to_tea` VALUES ('202252000737', '19760532497');
INSERT INTO `stu_to_tea` VALUES ('202252000737', '19760532704');
INSERT INTO `stu_to_tea` VALUES ('202252000738', '19760532352');
INSERT INTO `stu_to_tea` VALUES ('202252000738', '19760532941');
INSERT INTO `stu_to_tea` VALUES ('202252000739', '19760532412');
INSERT INTO `stu_to_tea` VALUES ('202252000739', '19760532546');
INSERT INTO `stu_to_tea` VALUES ('202252000740', '19760532765');
INSERT INTO `stu_to_tea` VALUES ('202252000740', '19760533037');
INSERT INTO `stu_to_tea` VALUES ('202252000741', '19760532622');
INSERT INTO `stu_to_tea` VALUES ('202252000741', '19760532651');
INSERT INTO `stu_to_tea` VALUES ('202252000742', '19760532766');
INSERT INTO `stu_to_tea` VALUES ('202252000742', '19760532782');
INSERT INTO `stu_to_tea` VALUES ('202252000743', '19760532548');
INSERT INTO `stu_to_tea` VALUES ('202252000743', '19760532978');
INSERT INTO `stu_to_tea` VALUES ('202252000744', '19760532176');
INSERT INTO `stu_to_tea` VALUES ('202252000744', '19760532560');
INSERT INTO `stu_to_tea` VALUES ('202252000745', '19760532088');
INSERT INTO `stu_to_tea` VALUES ('202252000745', '19760532234');
INSERT INTO `stu_to_tea` VALUES ('202252000746', '19760532178');
INSERT INTO `stu_to_tea` VALUES ('202252000746', '19760532817');
INSERT INTO `stu_to_tea` VALUES ('202252000747', '19760532439');
INSERT INTO `stu_to_tea` VALUES ('202252000747', '19760532866');
INSERT INTO `stu_to_tea` VALUES ('202252000748', '19760532592');
INSERT INTO `stu_to_tea` VALUES ('202252000748', '19760532713');
INSERT INTO `stu_to_tea` VALUES ('202252000749', '19760532451');
INSERT INTO `stu_to_tea` VALUES ('202252000749', '19760532975');
INSERT INTO `stu_to_tea` VALUES ('202252000750', '19760532587');
INSERT INTO `stu_to_tea` VALUES ('202252000750', '19760532594');
INSERT INTO `stu_to_tea` VALUES ('202252000751', '19760532231');
INSERT INTO `stu_to_tea` VALUES ('202252000751', '19760532624');
INSERT INTO `stu_to_tea` VALUES ('202252000752', '19760532553');
INSERT INTO `stu_to_tea` VALUES ('202252000752', '19760532646');
INSERT INTO `stu_to_tea` VALUES ('202252000753', '19760532260');
INSERT INTO `stu_to_tea` VALUES ('202252000753', '19760532514');
INSERT INTO `stu_to_tea` VALUES ('202252000754', '19760532156');
INSERT INTO `stu_to_tea` VALUES ('202252000754', '19760532904');
INSERT INTO `stu_to_tea` VALUES ('202252000755', '19760532145');
INSERT INTO `stu_to_tea` VALUES ('202252000755', '19760532149');
INSERT INTO `stu_to_tea` VALUES ('202252000756', '19760532084');
INSERT INTO `stu_to_tea` VALUES ('202252000756', '19760532779');
INSERT INTO `stu_to_tea` VALUES ('202252000757', '19760532454');
INSERT INTO `stu_to_tea` VALUES ('202252000757', '19760532543');
INSERT INTO `stu_to_tea` VALUES ('202252000758', '19760532307');
INSERT INTO `stu_to_tea` VALUES ('202252000758', '19760532547');
INSERT INTO `stu_to_tea` VALUES ('202252000759', '19760532626');
INSERT INTO `stu_to_tea` VALUES ('202252000759', '19760532730');
INSERT INTO `stu_to_tea` VALUES ('202252000760', '19760532695');
INSERT INTO `stu_to_tea` VALUES ('202252000760', '19760532717');
INSERT INTO `stu_to_tea` VALUES ('202252000761', '19760532368');
INSERT INTO `stu_to_tea` VALUES ('202252000761', '19760532555');
INSERT INTO `stu_to_tea` VALUES ('202252000762', '19760532087');
INSERT INTO `stu_to_tea` VALUES ('202252000762', '19760532681');
INSERT INTO `stu_to_tea` VALUES ('202252000763', '19760532710');
INSERT INTO `stu_to_tea` VALUES ('202252000763', '19760532998');
INSERT INTO `stu_to_tea` VALUES ('202252000764', '19760532530');
INSERT INTO `stu_to_tea` VALUES ('202252000764', '19760532734');
INSERT INTO `stu_to_tea` VALUES ('202252000765', '19760532278');
INSERT INTO `stu_to_tea` VALUES ('202252000765', '19760532782');
INSERT INTO `stu_to_tea` VALUES ('202252000766', '19760532171');
INSERT INTO `stu_to_tea` VALUES ('202252000766', '19760532220');
INSERT INTO `stu_to_tea` VALUES ('202252000767', '19760532127');
INSERT INTO `stu_to_tea` VALUES ('202252000767', '19760532320');
INSERT INTO `stu_to_tea` VALUES ('202252000768', '19760532084');
INSERT INTO `stu_to_tea` VALUES ('202252000768', '19760532754');
INSERT INTO `stu_to_tea` VALUES ('202252000769', '19760532127');
INSERT INTO `stu_to_tea` VALUES ('202252000769', '19760532545');
INSERT INTO `stu_to_tea` VALUES ('202252000770', '19760532587');
INSERT INTO `stu_to_tea` VALUES ('202252000770', '19760532998');
INSERT INTO `stu_to_tea` VALUES ('202252000771', '19760532061');
INSERT INTO `stu_to_tea` VALUES ('202252000771', '19760532298');
INSERT INTO `stu_to_tea` VALUES ('202252000772', '19760532778');
INSERT INTO `stu_to_tea` VALUES ('202252000772', '19760532986');
INSERT INTO `stu_to_tea` VALUES ('202252000773', '19760532168');
INSERT INTO `stu_to_tea` VALUES ('202252000773', '19760532990');
INSERT INTO `stu_to_tea` VALUES ('202252000774', '19760532554');
INSERT INTO `stu_to_tea` VALUES ('202252000774', '19760532870');
INSERT INTO `stu_to_tea` VALUES ('202252000775', '19760532190');
INSERT INTO `stu_to_tea` VALUES ('202252000775', '19760532902');
INSERT INTO `stu_to_tea` VALUES ('202252000776', '19760532259');
INSERT INTO `stu_to_tea` VALUES ('202252000776', '19760532286');
INSERT INTO `stu_to_tea` VALUES ('202252000777', '19760532347');
INSERT INTO `stu_to_tea` VALUES ('202252000777', '19760532931');
INSERT INTO `stu_to_tea` VALUES ('202252000778', '19760532479');
INSERT INTO `stu_to_tea` VALUES ('202252000778', '19760532707');
INSERT INTO `stu_to_tea` VALUES ('202252000779', '19760532459');
INSERT INTO `stu_to_tea` VALUES ('202252000779', '19760532521');
INSERT INTO `stu_to_tea` VALUES ('202252000780', '19760532708');
INSERT INTO `stu_to_tea` VALUES ('202252000780', '19760533031');
INSERT INTO `stu_to_tea` VALUES ('202252000781', '19760532783');
INSERT INTO `stu_to_tea` VALUES ('202252000781', '19760532916');
INSERT INTO `stu_to_tea` VALUES ('202252000782', '19760532649');
INSERT INTO `stu_to_tea` VALUES ('202252000782', '19760532928');
INSERT INTO `stu_to_tea` VALUES ('202252000783', '19760532178');
INSERT INTO `stu_to_tea` VALUES ('202252000783', '19760532806');
INSERT INTO `stu_to_tea` VALUES ('202252000784', '19760532578');
INSERT INTO `stu_to_tea` VALUES ('202252000784', '19760532696');
INSERT INTO `stu_to_tea` VALUES ('202252000785', '19760532752');
INSERT INTO `stu_to_tea` VALUES ('202252000785', '19760533012');
INSERT INTO `stu_to_tea` VALUES ('202252000786', '19760532072');
INSERT INTO `stu_to_tea` VALUES ('202252000786', '19760532923');
INSERT INTO `stu_to_tea` VALUES ('202252000787', '19760532736');
INSERT INTO `stu_to_tea` VALUES ('202252000787', '19760532840');
INSERT INTO `stu_to_tea` VALUES ('202252000788', '19760532373');
INSERT INTO `stu_to_tea` VALUES ('202252000788', '19760532968');
INSERT INTO `stu_to_tea` VALUES ('202252000789', '19760532515');
INSERT INTO `stu_to_tea` VALUES ('202252000789', '19760533044');
INSERT INTO `stu_to_tea` VALUES ('202252000790', '19760532663');
INSERT INTO `stu_to_tea` VALUES ('202252000790', '19760532672');
INSERT INTO `stu_to_tea` VALUES ('202252000791', '19760532110');
INSERT INTO `stu_to_tea` VALUES ('202252000791', '19760533042');
INSERT INTO `stu_to_tea` VALUES ('202252000792', '19760532844');
INSERT INTO `stu_to_tea` VALUES ('202252000792', '19760532938');
INSERT INTO `stu_to_tea` VALUES ('202252000793', '19760532625');
INSERT INTO `stu_to_tea` VALUES ('202252000793', '19760532742');
INSERT INTO `stu_to_tea` VALUES ('202252000794', '19760532336');
INSERT INTO `stu_to_tea` VALUES ('202252000794', '19760532969');
INSERT INTO `stu_to_tea` VALUES ('202252000795', '19760532081');
INSERT INTO `stu_to_tea` VALUES ('202252000795', '19760532301');
INSERT INTO `stu_to_tea` VALUES ('202252000796', '19760532276');
INSERT INTO `stu_to_tea` VALUES ('202252000796', '19760532400');
INSERT INTO `stu_to_tea` VALUES ('202252000797', '19760532189');
INSERT INTO `stu_to_tea` VALUES ('202252000797', '19760532321');
INSERT INTO `stu_to_tea` VALUES ('202252000798', '19760532147');
INSERT INTO `stu_to_tea` VALUES ('202252000798', '19760532863');
INSERT INTO `stu_to_tea` VALUES ('202252000799', '19760532570');
INSERT INTO `stu_to_tea` VALUES ('202252000799', '19760532829');
INSERT INTO `stu_to_tea` VALUES ('202252000800', '19760532432');
INSERT INTO `stu_to_tea` VALUES ('202252000800', '19760532933');
INSERT INTO `stu_to_tea` VALUES ('202252000801', '19760532712');
INSERT INTO `stu_to_tea` VALUES ('202252000801', '19760533027');
INSERT INTO `stu_to_tea` VALUES ('202252000802', '19760532568');
INSERT INTO `stu_to_tea` VALUES ('202252000802', '19760532993');
INSERT INTO `stu_to_tea` VALUES ('202252000803', '19760532218');
INSERT INTO `stu_to_tea` VALUES ('202252000803', '19760532529');
INSERT INTO `stu_to_tea` VALUES ('202252000804', '19760532417');
INSERT INTO `stu_to_tea` VALUES ('202252000804', '19760532511');
INSERT INTO `stu_to_tea` VALUES ('202252000805', '19760532090');
INSERT INTO `stu_to_tea` VALUES ('202252000805', '19760532418');
INSERT INTO `stu_to_tea` VALUES ('202252000806', '19760532127');
INSERT INTO `stu_to_tea` VALUES ('202252000806', '19760532937');
INSERT INTO `stu_to_tea` VALUES ('202252000807', '19760532442');
INSERT INTO `stu_to_tea` VALUES ('202252000807', '19760532800');
INSERT INTO `stu_to_tea` VALUES ('202252000808', '19760532584');
INSERT INTO `stu_to_tea` VALUES ('202252000808', '19760533030');
INSERT INTO `stu_to_tea` VALUES ('202252000809', '19760532457');
INSERT INTO `stu_to_tea` VALUES ('202252000809', '19760532837');
INSERT INTO `stu_to_tea` VALUES ('202252000810', '19760532429');
INSERT INTO `stu_to_tea` VALUES ('202252000810', '19760532599');
INSERT INTO `stu_to_tea` VALUES ('202252000811', '19760532082');
INSERT INTO `stu_to_tea` VALUES ('202252000811', '19760532934');
INSERT INTO `stu_to_tea` VALUES ('202252000812', '19760532141');
INSERT INTO `stu_to_tea` VALUES ('202252000812', '19760532442');
INSERT INTO `stu_to_tea` VALUES ('202252000813', '19760532459');
INSERT INTO `stu_to_tea` VALUES ('202252000813', '19760532738');
INSERT INTO `stu_to_tea` VALUES ('202252000814', '19760532210');
INSERT INTO `stu_to_tea` VALUES ('202252000814', '19760532613');
INSERT INTO `stu_to_tea` VALUES ('202252000815', '19760532397');
INSERT INTO `stu_to_tea` VALUES ('202252000815', '19760532905');
INSERT INTO `stu_to_tea` VALUES ('202252000816', '19760532718');
INSERT INTO `stu_to_tea` VALUES ('202252000816', '19760532736');
INSERT INTO `stu_to_tea` VALUES ('202252000817', '19760532437');
INSERT INTO `stu_to_tea` VALUES ('202252000817', '19760532524');
INSERT INTO `stu_to_tea` VALUES ('202252000818', '19760532106');
INSERT INTO `stu_to_tea` VALUES ('202252000818', '19760532965');
INSERT INTO `stu_to_tea` VALUES ('202252000819', '19760532436');
INSERT INTO `stu_to_tea` VALUES ('202252000819', '19760532964');
INSERT INTO `stu_to_tea` VALUES ('202252000820', '19760532679');
INSERT INTO `stu_to_tea` VALUES ('202252000820', '19760532902');
INSERT INTO `stu_to_tea` VALUES ('202252000821', '19760532252');
INSERT INTO `stu_to_tea` VALUES ('202252000821', '19760532920');
INSERT INTO `stu_to_tea` VALUES ('202252000822', '19760532062');
INSERT INTO `stu_to_tea` VALUES ('202252000822', '19760532774');
INSERT INTO `stu_to_tea` VALUES ('202252000823', '19760532351');
INSERT INTO `stu_to_tea` VALUES ('202252000823', '19760532398');
INSERT INTO `stu_to_tea` VALUES ('202252000824', '19760532248');
INSERT INTO `stu_to_tea` VALUES ('202252000824', '19760532300');
INSERT INTO `stu_to_tea` VALUES ('202252000825', '19760532381');
INSERT INTO `stu_to_tea` VALUES ('202252000825', '19760532973');
INSERT INTO `stu_to_tea` VALUES ('202252000826', '19760532173');
INSERT INTO `stu_to_tea` VALUES ('202252000826', '19760532755');
INSERT INTO `stu_to_tea` VALUES ('202252000827', '19760532284');
INSERT INTO `stu_to_tea` VALUES ('202252000827', '19760532966');
INSERT INTO `stu_to_tea` VALUES ('202252000828', '19760532528');
INSERT INTO `stu_to_tea` VALUES ('202252000828', '19760532957');
INSERT INTO `stu_to_tea` VALUES ('202252000829', '19760532526');
INSERT INTO `stu_to_tea` VALUES ('202252000829', '19760532777');
INSERT INTO `stu_to_tea` VALUES ('202252000830', '19760532535');
INSERT INTO `stu_to_tea` VALUES ('202252000830', '19760532794');
INSERT INTO `stu_to_tea` VALUES ('202252000831', '19760532549');
INSERT INTO `stu_to_tea` VALUES ('202252000831', '19760533055');
INSERT INTO `stu_to_tea` VALUES ('202252000832', '19760532748');
INSERT INTO `stu_to_tea` VALUES ('202252000832', '19760533023');
INSERT INTO `stu_to_tea` VALUES ('202252000833', '19760532274');
INSERT INTO `stu_to_tea` VALUES ('202252000833', '19760532679');
INSERT INTO `stu_to_tea` VALUES ('202252000834', '19760532510');
INSERT INTO `stu_to_tea` VALUES ('202252000834', '19760532586');
INSERT INTO `stu_to_tea` VALUES ('202252000835', '19760532156');
INSERT INTO `stu_to_tea` VALUES ('202252000835', '19760532684');
INSERT INTO `stu_to_tea` VALUES ('202252000836', '19760532122');
INSERT INTO `stu_to_tea` VALUES ('202252000836', '19760532451');
INSERT INTO `stu_to_tea` VALUES ('202252000837', '19760532590');
INSERT INTO `stu_to_tea` VALUES ('202252000837', '19760533045');
INSERT INTO `stu_to_tea` VALUES ('202252000838', '19760532103');
INSERT INTO `stu_to_tea` VALUES ('202252000838', '19760532396');
INSERT INTO `stu_to_tea` VALUES ('202252000839', '19760532242');
INSERT INTO `stu_to_tea` VALUES ('202252000839', '19760532567');
INSERT INTO `stu_to_tea` VALUES ('202252000840', '19760532515');
INSERT INTO `stu_to_tea` VALUES ('202252000840', '19760533033');
INSERT INTO `stu_to_tea` VALUES ('202252000841', '19760532995');
INSERT INTO `stu_to_tea` VALUES ('202252000841', '19760533018');
INSERT INTO `stu_to_tea` VALUES ('202252000842', '19760532326');
INSERT INTO `stu_to_tea` VALUES ('202252000842', '19760532876');
INSERT INTO `stu_to_tea` VALUES ('202252000843', '19760532173');
INSERT INTO `stu_to_tea` VALUES ('202252000843', '19760532856');
INSERT INTO `stu_to_tea` VALUES ('202252000844', '19760532374');
INSERT INTO `stu_to_tea` VALUES ('202252000844', '19760532764');
INSERT INTO `stu_to_tea` VALUES ('202252000845', '19760532508');
INSERT INTO `stu_to_tea` VALUES ('202252000845', '19760532831');
INSERT INTO `stu_to_tea` VALUES ('202252000846', '19760532905');
INSERT INTO `stu_to_tea` VALUES ('202252000846', '19760533040');
INSERT INTO `stu_to_tea` VALUES ('202252000847', '19760532366');
INSERT INTO `stu_to_tea` VALUES ('202252000847', '19760533004');
INSERT INTO `stu_to_tea` VALUES ('202252000848', '19760532478');
INSERT INTO `stu_to_tea` VALUES ('202252000848', '19760532480');
INSERT INTO `stu_to_tea` VALUES ('202252000849', '19760532210');
INSERT INTO `stu_to_tea` VALUES ('202252000849', '19760532786');
INSERT INTO `stu_to_tea` VALUES ('202252000850', '19760532831');
INSERT INTO `stu_to_tea` VALUES ('202252000850', '19760532915');
INSERT INTO `stu_to_tea` VALUES ('202252000851', '19760532380');
INSERT INTO `stu_to_tea` VALUES ('202252000851', '19760533005');
INSERT INTO `stu_to_tea` VALUES ('202252000852', '19760532077');
INSERT INTO `stu_to_tea` VALUES ('202252000852', '19760532948');
INSERT INTO `stu_to_tea` VALUES ('202252000853', '19760532744');
INSERT INTO `stu_to_tea` VALUES ('202252000853', '19760532988');
INSERT INTO `stu_to_tea` VALUES ('202252000854', '19760532643');
INSERT INTO `stu_to_tea` VALUES ('202252000854', '19760532884');
INSERT INTO `stu_to_tea` VALUES ('202252000855', '19760532067');
INSERT INTO `stu_to_tea` VALUES ('202252000855', '19760532376');
INSERT INTO `stu_to_tea` VALUES ('202252000856', '19760532382');
INSERT INTO `stu_to_tea` VALUES ('202252000856', '19760532549');
INSERT INTO `stu_to_tea` VALUES ('202252000857', '19760532260');
INSERT INTO `stu_to_tea` VALUES ('202252000857', '19760532870');
INSERT INTO `stu_to_tea` VALUES ('202252000858', '19760532070');
INSERT INTO `stu_to_tea` VALUES ('202252000858', '19760532097');
INSERT INTO `stu_to_tea` VALUES ('202252000859', '19760532321');
INSERT INTO `stu_to_tea` VALUES ('202252000859', '19760532949');
INSERT INTO `stu_to_tea` VALUES ('202252000860', '19760532189');
INSERT INTO `stu_to_tea` VALUES ('202252000860', '19760532946');
INSERT INTO `stu_to_tea` VALUES ('202252000861', '19760532625');
INSERT INTO `stu_to_tea` VALUES ('202252000861', '19760532696');
INSERT INTO `stu_to_tea` VALUES ('202252000862', '19760532475');
INSERT INTO `stu_to_tea` VALUES ('202252000862', '19760532692');
INSERT INTO `stu_to_tea` VALUES ('202252000863', '19760532334');
INSERT INTO `stu_to_tea` VALUES ('202252000863', '19760532898');
INSERT INTO `stu_to_tea` VALUES ('202252000864', '19760532440');
INSERT INTO `stu_to_tea` VALUES ('202252000864', '19760532965');
INSERT INTO `stu_to_tea` VALUES ('202252000865', '19760532083');
INSERT INTO `stu_to_tea` VALUES ('202252000865', '19760532411');
INSERT INTO `stu_to_tea` VALUES ('202252000866', '19760532512');
INSERT INTO `stu_to_tea` VALUES ('202252000866', '19760532524');
INSERT INTO `stu_to_tea` VALUES ('202252000867', '19760532179');
INSERT INTO `stu_to_tea` VALUES ('202252000867', '19760532364');
INSERT INTO `stu_to_tea` VALUES ('202252000868', '19760532789');
INSERT INTO `stu_to_tea` VALUES ('202252000868', '19760532959');
INSERT INTO `stu_to_tea` VALUES ('202252000869', '19760532207');
INSERT INTO `stu_to_tea` VALUES ('202252000869', '19760532858');
INSERT INTO `stu_to_tea` VALUES ('202252000870', '19760532121');
INSERT INTO `stu_to_tea` VALUES ('202252000870', '19760532169');
INSERT INTO `stu_to_tea` VALUES ('202252000871', '19760532223');
INSERT INTO `stu_to_tea` VALUES ('202252000871', '19760532553');
INSERT INTO `stu_to_tea` VALUES ('202252000872', '19760532222');
INSERT INTO `stu_to_tea` VALUES ('202252000872', '19760532309');
INSERT INTO `stu_to_tea` VALUES ('202252000873', '19760532128');
INSERT INTO `stu_to_tea` VALUES ('202252000873', '19760532164');
INSERT INTO `stu_to_tea` VALUES ('202252000874', '19760532105');
INSERT INTO `stu_to_tea` VALUES ('202252000874', '19760532402');
INSERT INTO `stu_to_tea` VALUES ('202252000875', '19760532287');
INSERT INTO `stu_to_tea` VALUES ('202252000875', '19760532890');
INSERT INTO `stu_to_tea` VALUES ('202252000876', '19760532281');
INSERT INTO `stu_to_tea` VALUES ('202252000876', '19760532323');
INSERT INTO `stu_to_tea` VALUES ('202252000877', '19760532591');
INSERT INTO `stu_to_tea` VALUES ('202252000877', '19760532732');
INSERT INTO `stu_to_tea` VALUES ('202252000878', '19760532309');
INSERT INTO `stu_to_tea` VALUES ('202252000878', '19760532735');
INSERT INTO `stu_to_tea` VALUES ('202252000879', '19760532298');
INSERT INTO `stu_to_tea` VALUES ('202252000879', '19760532617');
INSERT INTO `stu_to_tea` VALUES ('202252000880', '19760532360');
INSERT INTO `stu_to_tea` VALUES ('202252000880', '19760533038');
INSERT INTO `stu_to_tea` VALUES ('202252000881', '19760532757');
INSERT INTO `stu_to_tea` VALUES ('202252000881', '19760532867');
INSERT INTO `stu_to_tea` VALUES ('202252000882', '19760532156');
INSERT INTO `stu_to_tea` VALUES ('202252000882', '19760532475');
INSERT INTO `stu_to_tea` VALUES ('202252000883', '19760532347');
INSERT INTO `stu_to_tea` VALUES ('202252000883', '19760532828');
INSERT INTO `stu_to_tea` VALUES ('202252000884', '19760532080');
INSERT INTO `stu_to_tea` VALUES ('202252000884', '19760532295');
INSERT INTO `stu_to_tea` VALUES ('202252000885', '19760532366');
INSERT INTO `stu_to_tea` VALUES ('202252000885', '19760532729');
INSERT INTO `stu_to_tea` VALUES ('202252000886', '19760532166');
INSERT INTO `stu_to_tea` VALUES ('202252000886', '19760532369');
INSERT INTO `stu_to_tea` VALUES ('202252000887', '19760532255');
INSERT INTO `stu_to_tea` VALUES ('202252000887', '19760532732');
INSERT INTO `stu_to_tea` VALUES ('202252000888', '19760532075');
INSERT INTO `stu_to_tea` VALUES ('202252000888', '19760532487');
INSERT INTO `stu_to_tea` VALUES ('202252000889', '19760532423');
INSERT INTO `stu_to_tea` VALUES ('202252000889', '19760532970');
INSERT INTO `stu_to_tea` VALUES ('202252000890', '19760532286');
INSERT INTO `stu_to_tea` VALUES ('202252000890', '19760532359');
INSERT INTO `stu_to_tea` VALUES ('202252000891', '19760532646');
INSERT INTO `stu_to_tea` VALUES ('202252000891', '19760532778');
INSERT INTO `stu_to_tea` VALUES ('202252000892', '19760532946');
INSERT INTO `stu_to_tea` VALUES ('202252000892', '19760532991');
INSERT INTO `stu_to_tea` VALUES ('202252000893', '19760532056');
INSERT INTO `stu_to_tea` VALUES ('202252000893', '19760532220');
INSERT INTO `stu_to_tea` VALUES ('202252000894', '19760532658');
INSERT INTO `stu_to_tea` VALUES ('202252000894', '19760532952');
INSERT INTO `stu_to_tea` VALUES ('202252000895', '19760532120');
INSERT INTO `stu_to_tea` VALUES ('202252000895', '19760532557');
INSERT INTO `stu_to_tea` VALUES ('202252000896', '19760532114');
INSERT INTO `stu_to_tea` VALUES ('202252000896', '19760533002');
INSERT INTO `stu_to_tea` VALUES ('202252000897', '19760532456');
INSERT INTO `stu_to_tea` VALUES ('202252000897', '19760532667');
INSERT INTO `stu_to_tea` VALUES ('202252000898', '19760532188');
INSERT INTO `stu_to_tea` VALUES ('202252000898', '19760532394');
INSERT INTO `stu_to_tea` VALUES ('202252000899', '19760532578');
INSERT INTO `stu_to_tea` VALUES ('202252000899', '19760532947');
INSERT INTO `stu_to_tea` VALUES ('202252000900', '19760532170');
INSERT INTO `stu_to_tea` VALUES ('202252000900', '19760532563');
INSERT INTO `stu_to_tea` VALUES ('202252000901', '19760532546');
INSERT INTO `stu_to_tea` VALUES ('202252000901', '19760532873');
INSERT INTO `stu_to_tea` VALUES ('202252000902', '19760532138');
INSERT INTO `stu_to_tea` VALUES ('202252000902', '19760532299');
INSERT INTO `stu_to_tea` VALUES ('202252000903', '19760532194');
INSERT INTO `stu_to_tea` VALUES ('202252000903', '19760532604');
INSERT INTO `stu_to_tea` VALUES ('202252000904', '19760532260');
INSERT INTO `stu_to_tea` VALUES ('202252000904', '19760532419');
INSERT INTO `stu_to_tea` VALUES ('202252000905', '19760532905');
INSERT INTO `stu_to_tea` VALUES ('202252000905', '19760532960');
INSERT INTO `stu_to_tea` VALUES ('202252000906', '19760532090');
INSERT INTO `stu_to_tea` VALUES ('202252000906', '19760532604');
INSERT INTO `stu_to_tea` VALUES ('202252000907', '19760532149');
INSERT INTO `stu_to_tea` VALUES ('202252000907', '19760532735');
INSERT INTO `stu_to_tea` VALUES ('202252000908', '19760532763');
INSERT INTO `stu_to_tea` VALUES ('202252000908', '19760532922');
INSERT INTO `stu_to_tea` VALUES ('202252000909', '19760532600');
INSERT INTO `stu_to_tea` VALUES ('202252000909', '19760532622');
INSERT INTO `stu_to_tea` VALUES ('202252000910', '19760532060');
INSERT INTO `stu_to_tea` VALUES ('202252000910', '19760532882');
INSERT INTO `stu_to_tea` VALUES ('202252000911', '19760532400');
INSERT INTO `stu_to_tea` VALUES ('202252000911', '19760532800');
INSERT INTO `stu_to_tea` VALUES ('202252000912', '19760532092');
INSERT INTO `stu_to_tea` VALUES ('202252000912', '19760532225');
INSERT INTO `stu_to_tea` VALUES ('202252000913', '19760532219');
INSERT INTO `stu_to_tea` VALUES ('202252000913', '19760532288');
INSERT INTO `stu_to_tea` VALUES ('202252000914', '19760532141');
INSERT INTO `stu_to_tea` VALUES ('202252000914', '19760532286');
INSERT INTO `stu_to_tea` VALUES ('202252000915', '19760532754');
INSERT INTO `stu_to_tea` VALUES ('202252000915', '19760532849');
INSERT INTO `stu_to_tea` VALUES ('202252000916', '19760532529');
INSERT INTO `stu_to_tea` VALUES ('202252000916', '19760532766');
INSERT INTO `stu_to_tea` VALUES ('202252000917', '19760532116');
INSERT INTO `stu_to_tea` VALUES ('202252000917', '19760532286');
INSERT INTO `stu_to_tea` VALUES ('202252000918', '19760532393');
INSERT INTO `stu_to_tea` VALUES ('202252000918', '19760532656');
INSERT INTO `stu_to_tea` VALUES ('202252000919', '19760532306');
INSERT INTO `stu_to_tea` VALUES ('202252000919', '19760532928');
INSERT INTO `stu_to_tea` VALUES ('202252000920', '19760532248');
INSERT INTO `stu_to_tea` VALUES ('202252000920', '19760532470');
INSERT INTO `stu_to_tea` VALUES ('202252000921', '19760532402');
INSERT INTO `stu_to_tea` VALUES ('202252000921', '19760532839');
INSERT INTO `stu_to_tea` VALUES ('202252000922', '19760532142');
INSERT INTO `stu_to_tea` VALUES ('202252000922', '19760532575');
INSERT INTO `stu_to_tea` VALUES ('202252000923', '19760532203');
INSERT INTO `stu_to_tea` VALUES ('202252000923', '19760532837');
INSERT INTO `stu_to_tea` VALUES ('202252000924', '19760532864');
INSERT INTO `stu_to_tea` VALUES ('202252000924', '19760533040');
INSERT INTO `stu_to_tea` VALUES ('202252000925', '19760532510');
INSERT INTO `stu_to_tea` VALUES ('202252000925', '19760532764');
INSERT INTO `stu_to_tea` VALUES ('202252000926', '19760532623');
INSERT INTO `stu_to_tea` VALUES ('202252000926', '19760532931');
INSERT INTO `stu_to_tea` VALUES ('202252000927', '19760532115');
INSERT INTO `stu_to_tea` VALUES ('202252000927', '19760532256');
INSERT INTO `stu_to_tea` VALUES ('202252000928', '19760532775');
INSERT INTO `stu_to_tea` VALUES ('202252000928', '19760532823');
INSERT INTO `stu_to_tea` VALUES ('202252000929', '19760532599');
INSERT INTO `stu_to_tea` VALUES ('202252000929', '19760533004');
INSERT INTO `stu_to_tea` VALUES ('202252000930', '19760532082');
INSERT INTO `stu_to_tea` VALUES ('202252000930', '19760532524');
INSERT INTO `stu_to_tea` VALUES ('202252000931', '19760532697');
INSERT INTO `stu_to_tea` VALUES ('202252000931', '19760532845');
INSERT INTO `stu_to_tea` VALUES ('202252000932', '19760532066');
INSERT INTO `stu_to_tea` VALUES ('202252000932', '19760532185');
INSERT INTO `stu_to_tea` VALUES ('202252000933', '19760532456');
INSERT INTO `stu_to_tea` VALUES ('202252000933', '19760533035');
INSERT INTO `stu_to_tea` VALUES ('202252000934', '19760532904');
INSERT INTO `stu_to_tea` VALUES ('202252000934', '19760533053');
INSERT INTO `stu_to_tea` VALUES ('202252000935', '19760532509');
INSERT INTO `stu_to_tea` VALUES ('202252000935', '19760532637');
INSERT INTO `stu_to_tea` VALUES ('202252000936', '19760532504');
INSERT INTO `stu_to_tea` VALUES ('202252000936', '19760532538');
INSERT INTO `stu_to_tea` VALUES ('202252000937', '19760532549');
INSERT INTO `stu_to_tea` VALUES ('202252000937', '19760532862');
INSERT INTO `stu_to_tea` VALUES ('202252000938', '19760532090');
INSERT INTO `stu_to_tea` VALUES ('202252000938', '19760532161');
INSERT INTO `stu_to_tea` VALUES ('202252000939', '19760532578');
INSERT INTO `stu_to_tea` VALUES ('202252000939', '19760532955');
INSERT INTO `stu_to_tea` VALUES ('202252000940', '19760532964');
INSERT INTO `stu_to_tea` VALUES ('202252000940', '19760533027');
INSERT INTO `stu_to_tea` VALUES ('202252000941', '19760532201');
INSERT INTO `stu_to_tea` VALUES ('202252000941', '19760532906');
INSERT INTO `stu_to_tea` VALUES ('202252000942', '19760532104');
INSERT INTO `stu_to_tea` VALUES ('202252000942', '19760532113');
INSERT INTO `stu_to_tea` VALUES ('202252000943', '19760532326');
INSERT INTO `stu_to_tea` VALUES ('202252000943', '19760532472');
INSERT INTO `stu_to_tea` VALUES ('202252000944', '19760532352');
INSERT INTO `stu_to_tea` VALUES ('202252000944', '19760532995');
INSERT INTO `stu_to_tea` VALUES ('202252000945', '19760532843');
INSERT INTO `stu_to_tea` VALUES ('202252000945', '19760532908');
INSERT INTO `stu_to_tea` VALUES ('202252000946', '19760532639');
INSERT INTO `stu_to_tea` VALUES ('202252000946', '19760533016');
INSERT INTO `stu_to_tea` VALUES ('202252000947', '19760532369');
INSERT INTO `stu_to_tea` VALUES ('202252000947', '19760532696');
INSERT INTO `stu_to_tea` VALUES ('202252000948', '19760532873');
INSERT INTO `stu_to_tea` VALUES ('202252000948', '19760532907');
INSERT INTO `stu_to_tea` VALUES ('202252000949', '19760532057');
INSERT INTO `stu_to_tea` VALUES ('202252000949', '19760532235');
INSERT INTO `stu_to_tea` VALUES ('202252000950', '19760532357');
INSERT INTO `stu_to_tea` VALUES ('202252000950', '19760532954');
INSERT INTO `stu_to_tea` VALUES ('202252000951', '19760532336');
INSERT INTO `stu_to_tea` VALUES ('202252000951', '19760532697');
INSERT INTO `stu_to_tea` VALUES ('202252000952', '19760532206');
INSERT INTO `stu_to_tea` VALUES ('202252000952', '19760533036');
INSERT INTO `stu_to_tea` VALUES ('202252000953', '19760532525');
INSERT INTO `stu_to_tea` VALUES ('202252000953', '19760532916');
INSERT INTO `stu_to_tea` VALUES ('202252000954', '19760532075');
INSERT INTO `stu_to_tea` VALUES ('202252000954', '19760532131');
INSERT INTO `stu_to_tea` VALUES ('202252000955', '19760532608');
INSERT INTO `stu_to_tea` VALUES ('202252000955', '19760532695');
INSERT INTO `stu_to_tea` VALUES ('202252000956', '19760532608');
INSERT INTO `stu_to_tea` VALUES ('202252000956', '19760532851');
INSERT INTO `stu_to_tea` VALUES ('202252000957', '19760532782');
INSERT INTO `stu_to_tea` VALUES ('202252000957', '19760532812');
INSERT INTO `stu_to_tea` VALUES ('202252000958', '19760532164');
INSERT INTO `stu_to_tea` VALUES ('202252000958', '19760533030');
INSERT INTO `stu_to_tea` VALUES ('202252000959', '19760532586');
INSERT INTO `stu_to_tea` VALUES ('202252000959', '19760532993');
INSERT INTO `stu_to_tea` VALUES ('202252000960', '19760532602');
INSERT INTO `stu_to_tea` VALUES ('202252000960', '19760532791');
INSERT INTO `stu_to_tea` VALUES ('202252000961', '19760532735');
INSERT INTO `stu_to_tea` VALUES ('202252000961', '19760532843');
INSERT INTO `stu_to_tea` VALUES ('202252000962', '19760532729');
INSERT INTO `stu_to_tea` VALUES ('202252000962', '19760532789');
INSERT INTO `stu_to_tea` VALUES ('202252000963', '19760532222');
INSERT INTO `stu_to_tea` VALUES ('202252000963', '19760532846');
INSERT INTO `stu_to_tea` VALUES ('202252000964', '19760532365');
INSERT INTO `stu_to_tea` VALUES ('202252000964', '19760532383');
INSERT INTO `stu_to_tea` VALUES ('202252000965', '19760532421');
INSERT INTO `stu_to_tea` VALUES ('202252000965', '19760532850');
INSERT INTO `stu_to_tea` VALUES ('202252000966', '19760532684');
INSERT INTO `stu_to_tea` VALUES ('202252000966', '19760532742');
INSERT INTO `stu_to_tea` VALUES ('202252000967', '19760532341');
INSERT INTO `stu_to_tea` VALUES ('202252000967', '19760532775');
INSERT INTO `stu_to_tea` VALUES ('202252000968', '19760532806');
INSERT INTO `stu_to_tea` VALUES ('202252000968', '19760532954');
INSERT INTO `stu_to_tea` VALUES ('202252000969', '19760532213');
INSERT INTO `stu_to_tea` VALUES ('202252000969', '19760532534');
INSERT INTO `stu_to_tea` VALUES ('202252000970', '19760532420');
INSERT INTO `stu_to_tea` VALUES ('202252000970', '19760532584');
INSERT INTO `stu_to_tea` VALUES ('202252000971', '19760532212');
INSERT INTO `stu_to_tea` VALUES ('202252000971', '19760532771');
INSERT INTO `stu_to_tea` VALUES ('202252000972', '19760532728');
INSERT INTO `stu_to_tea` VALUES ('202252000972', '19760532958');
INSERT INTO `stu_to_tea` VALUES ('202252000973', '19760532096');
INSERT INTO `stu_to_tea` VALUES ('202252000973', '19760532735');
INSERT INTO `stu_to_tea` VALUES ('202252000974', '19760532060');
INSERT INTO `stu_to_tea` VALUES ('202252000974', '19760532553');
INSERT INTO `stu_to_tea` VALUES ('202252000975', '19760532369');
INSERT INTO `stu_to_tea` VALUES ('202252000975', '19760532733');
INSERT INTO `stu_to_tea` VALUES ('202252000976', '19760532259');
INSERT INTO `stu_to_tea` VALUES ('202252000976', '19760532478');
INSERT INTO `stu_to_tea` VALUES ('202252000977', '19760532449');
INSERT INTO `stu_to_tea` VALUES ('202252000977', '19760532802');
INSERT INTO `stu_to_tea` VALUES ('202252000978', '19760532723');
INSERT INTO `stu_to_tea` VALUES ('202252000978', '19760532941');
INSERT INTO `stu_to_tea` VALUES ('202252000979', '19760532311');
INSERT INTO `stu_to_tea` VALUES ('202252000979', '19760532886');
INSERT INTO `stu_to_tea` VALUES ('202252000980', '19760532249');
INSERT INTO `stu_to_tea` VALUES ('202252000980', '19760533053');
INSERT INTO `stu_to_tea` VALUES ('202252000981', '19760532635');
INSERT INTO `stu_to_tea` VALUES ('202252000981', '19760532880');
INSERT INTO `stu_to_tea` VALUES ('202252000982', '19760532538');
INSERT INTO `stu_to_tea` VALUES ('202252000982', '19760532582');
INSERT INTO `stu_to_tea` VALUES ('202252000983', '19760532241');
INSERT INTO `stu_to_tea` VALUES ('202252000983', '19760532313');
INSERT INTO `stu_to_tea` VALUES ('202252000984', '19760532260');
INSERT INTO `stu_to_tea` VALUES ('202252000984', '19760532924');
INSERT INTO `stu_to_tea` VALUES ('202252000985', '19760532153');
INSERT INTO `stu_to_tea` VALUES ('202252000985', '19760532687');
INSERT INTO `stu_to_tea` VALUES ('202252000986', '19760532359');
INSERT INTO `stu_to_tea` VALUES ('202252000986', '19760532806');
INSERT INTO `stu_to_tea` VALUES ('202252000987', '19760532182');
INSERT INTO `stu_to_tea` VALUES ('202252000987', '19760532988');
INSERT INTO `stu_to_tea` VALUES ('202252000988', '19760532211');
INSERT INTO `stu_to_tea` VALUES ('202252000988', '19760532786');
INSERT INTO `stu_to_tea` VALUES ('202252000989', '19760532141');
INSERT INTO `stu_to_tea` VALUES ('202252000989', '19760532733');
INSERT INTO `stu_to_tea` VALUES ('202252000990', '19760532147');
INSERT INTO `stu_to_tea` VALUES ('202252000990', '19760532561');
INSERT INTO `stu_to_tea` VALUES ('202252000991', '19760532887');
INSERT INTO `stu_to_tea` VALUES ('202252000991', '19760533006');
INSERT INTO `stu_to_tea` VALUES ('202252000992', '19760532166');
INSERT INTO `stu_to_tea` VALUES ('202252000992', '19760532429');
INSERT INTO `stu_to_tea` VALUES ('202252000993', '19760532131');
INSERT INTO `stu_to_tea` VALUES ('202252000993', '19760532627');
INSERT INTO `stu_to_tea` VALUES ('202252000994', '19760532252');
INSERT INTO `stu_to_tea` VALUES ('202252000994', '19760532458');
INSERT INTO `stu_to_tea` VALUES ('202252000995', '19760532176');
INSERT INTO `stu_to_tea` VALUES ('202252000995', '19760532396');
INSERT INTO `stu_to_tea` VALUES ('202252000996', '19760532085');
INSERT INTO `stu_to_tea` VALUES ('202252000996', '19760532427');
INSERT INTO `stu_to_tea` VALUES ('202252000997', '19760532477');
INSERT INTO `stu_to_tea` VALUES ('202252000997', '19760532737');
INSERT INTO `stu_to_tea` VALUES ('202252000998', '19760532285');
INSERT INTO `stu_to_tea` VALUES ('202252000998', '19760532521');
INSERT INTO `stu_to_tea` VALUES ('202252000999', '19760533014');
INSERT INTO `stu_to_tea` VALUES ('202252000999', '19760533018');
INSERT INTO `stu_to_tea` VALUES ('202252001000', '19760532481');
INSERT INTO `stu_to_tea` VALUES ('202252001000', '19760532540');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生学号',
  `se_id` decimal(40, 0) NULL DEFAULT NULL COMMENT '学生互评ID',
  `g_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '小组ID',
  `class_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '班级编号',
  `stu_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('202252000001', 100551, 38, 88, '戚雪', '123456');
INSERT INTO `student` VALUES ('202252000002', 100188, 41, 99, '方玲雅', '123456');
INSERT INTO `student` VALUES ('202252000003', 100032, 22, 33, '平莉', '123456');
INSERT INTO `student` VALUES ('202252000004', 100397, 34, 80, '韦小新', '123456');
INSERT INTO `student` VALUES ('202252000005', 100901, 99, 40, '沈雅刚', '123456');
INSERT INTO `student` VALUES ('202252000006', 100324, 11, 60, '傅明红', '123456');
INSERT INTO `student` VALUES ('202252000007', 100912, 59, 10, '郝小峰', '123456');
INSERT INTO `student` VALUES ('202252000008', 100750, 73, 89, '水涛丽', '123456');
INSERT INTO `student` VALUES ('202252000009', 100834, 24, 13, '唐娜', '123456');
INSERT INTO `student` VALUES ('202252000010', 100432, 67, 54, '鲍静', '123456');
INSERT INTO `student` VALUES ('202252000011', 100308, 16, 25, '萧新雅', '123456');
INSERT INTO `student` VALUES ('202252000012', 100350, 43, 48, '苏刚', '123456');
INSERT INTO `student` VALUES ('202252000013', 100719, 50, 71, '凤红丽', '123456');
INSERT INTO `student` VALUES ('202252000014', 100896, 83, 28, '柏雅芳', '123456');
INSERT INTO `student` VALUES ('202252000015', 100254, 98, 53, '范芳', '123456');
INSERT INTO `student` VALUES ('202252000016', 100601, 86, 24, '曹丽', '123456');
INSERT INTO `student` VALUES ('202252000017', 100490, 42, 75, '时洁', '123456');
INSERT INTO `student` VALUES ('202252000018', 100731, 71, 92, '谢新', '123456');
INSERT INTO `student` VALUES ('202252000019', 100858, 46, 90, '葛玲', '123456');
INSERT INTO `student` VALUES ('202252000020', 100370, 64, 27, '郑小雪', '123456');
INSERT INTO `student` VALUES ('202252000021', 100478, 53, 98, '乐艳涛', '123456');
INSERT INTO `student` VALUES ('202252000022', 100584, 64, 54, '韦琳露', '123456');
INSERT INTO `student` VALUES ('202252000023', 100335, 64, 76, '范娜', '123456');
INSERT INTO `student` VALUES ('202252000024', 100975, 86, 11, '卜雷', '123456');
INSERT INTO `student` VALUES ('202252000025', 100831, 83, 33, '任雷', '123456');
INSERT INTO `student` VALUES ('202252000026', 100807, 61, 89, '孙亮', '123456');
INSERT INTO `student` VALUES ('202252000027', 100097, 15, 58, '秦军', '123456');
INSERT INTO `student` VALUES ('202252000028', 100720, 20, 26, '罗军美', '123456');
INSERT INTO `student` VALUES ('202252000029', 100955, 17, 16, '马红', '123456');
INSERT INTO `student` VALUES ('202252000030', 100806, 74, 14, '卞峰', '123456');
INSERT INTO `student` VALUES ('202252000031', 100168, 30, 24, '戚小', '123456');
INSERT INTO `student` VALUES ('202252000032', 100621, 82, 95, '姜玲静', '123456');
INSERT INTO `student` VALUES ('202252000033', 100531, 92, 97, '孔红', '123456');
INSERT INTO `student` VALUES ('202252000034', 100933, 79, 18, '余洁', '123456');
INSERT INTO `student` VALUES ('202252000035', 100028, 79, 22, '顾玲', '123456');
INSERT INTO `student` VALUES ('202252000036', 100945, 53, 37, '章雷新', '123456');
INSERT INTO `student` VALUES ('202252000037', 100786, 35, 74, '蒋峰', '123456');
INSERT INTO `student` VALUES ('202252000038', 100462, 72, 51, '陈美磊', '123456');
INSERT INTO `student` VALUES ('202252000039', 100763, 76, 68, '任燕芳', '123456');
INSERT INTO `student` VALUES ('202252000040', 100142, 36, 93, '吴小燕', '123456');
INSERT INTO `student` VALUES ('202252000041', 100823, 28, 92, '鲍婷', '123456');
INSERT INTO `student` VALUES ('202252000042', 100585, 74, 80, '康芳娜', '123456');
INSERT INTO `student` VALUES ('202252000043', 100108, 67, 36, '廉莉静', '123456');
INSERT INTO `student` VALUES ('202252000044', 100014, 80, 34, '水艳', '123456');
INSERT INTO `student` VALUES ('202252000045', 100228, 74, 75, '昌强洁', '123456');
INSERT INTO `student` VALUES ('202252000046', 100627, 64, 97, '郑娜军', '123456');
INSERT INTO `student` VALUES ('202252000047', 100382, 30, 88, '贺亮洁', '123456');
INSERT INTO `student` VALUES ('202252000048', 100971, 48, 78, '柳小', '123456');
INSERT INTO `student` VALUES ('202252000049', 100988, 97, 98, '皮静', '123456');
INSERT INTO `student` VALUES ('202252000050', 100239, 42, 94, '伍敏', '123456');
INSERT INTO `student` VALUES ('202252000051', 100009, 53, 31, '凤小美', '123456');
INSERT INTO `student` VALUES ('202252000052', 100865, 100, 80, '任婷国', '123456');
INSERT INTO `student` VALUES ('202252000053', 100754, 21, 33, '陈琳', '123456');
INSERT INTO `student` VALUES ('202252000054', 100927, 34, 65, '穆刚琳', '123456');
INSERT INTO `student` VALUES ('202252000055', 100114, 33, 65, '钱敏', '123456');
INSERT INTO `student` VALUES ('202252000056', 100181, 71, 49, '廉美雅', '123456');
INSERT INTO `student` VALUES ('202252000057', 100461, 81, 70, '任丽', '123456');
INSERT INTO `student` VALUES ('202252000058', 100678, 95, 12, '元婷', '123456');
INSERT INTO `student` VALUES ('202252000059', 100628, 43, 64, '谢强', '123456');
INSERT INTO `student` VALUES ('202252000060', 100442, 23, 85, '郎建', '123456');
INSERT INTO `student` VALUES ('202252000061', 100747, 44, 45, '任国', '123456');
INSERT INTO `student` VALUES ('202252000062', 100809, 48, 12, '罗建', '123456');
INSERT INTO `student` VALUES ('202252000063', 100871, 76, 38, '萧刚强', '123456');
INSERT INTO `student` VALUES ('202252000064', 100207, 19, 77, '苏建', '123456');
INSERT INTO `student` VALUES ('202252000065', 100634, 76, 40, '唐玲燕', '123456');
INSERT INTO `student` VALUES ('202252000066', 100647, 78, 84, '曹敏', '123456');
INSERT INTO `student` VALUES ('202252000067', 100384, 69, 72, '郝丽', '123456');
INSERT INTO `student` VALUES ('202252000068', 100714, 91, 74, '李敏琳', '123456');
INSERT INTO `student` VALUES ('202252000069', 100332, 68, 12, '王建磊', '123456');
INSERT INTO `student` VALUES ('202252000070', 100229, 27, 48, '花露丽', '123456');
INSERT INTO `student` VALUES ('202252000071', 100546, 43, 24, '郝雅强', '123456');
INSERT INTO `student` VALUES ('202252000072', 100718, 70, 39, '凤美建', '123456');
INSERT INTO `student` VALUES ('202252000073', 100533, 24, 67, '时娜露', '123456');
INSERT INTO `student` VALUES ('202252000074', 100825, 21, 89, '方雅洁', '123456');
INSERT INTO `student` VALUES ('202252000075', 100744, 86, 71, '方娜', '123456');
INSERT INTO `student` VALUES ('202252000076', 100065, 28, 49, '葛艳兰', '123456');
INSERT INTO `student` VALUES ('202252000077', 100574, 32, 46, '喻艳', '123456');
INSERT INTO `student` VALUES ('202252000078', 100902, 70, 53, '齐美', '123456');
INSERT INTO `student` VALUES ('202252000079', 100098, 90, 96, '吴静露', '123456');
INSERT INTO `student` VALUES ('202252000080', 100115, 76, 29, '齐玲', '123456');
INSERT INTO `student` VALUES ('202252000081', 100213, 16, 50, '何美芳', '123456');
INSERT INTO `student` VALUES ('202252000082', 100039, 80, 71, '吴婷军', '123456');
INSERT INTO `student` VALUES ('202252000083', 100041, 27, 22, '水新雅', '123456');
INSERT INTO `student` VALUES ('202252000084', 100293, 38, 100, '齐新', '123456');
INSERT INTO `student` VALUES ('202252000085', 100913, 100, 97, '任涛静', '123456');
INSERT INTO `student` VALUES ('202252000086', 100779, 58, 62, '李军兰', '123456');
INSERT INTO `student` VALUES ('202252000087', 100894, 35, 58, '康涛', '123456');
INSERT INTO `student` VALUES ('202252000088', 100764, 70, 41, '孟燕', '123456');
INSERT INTO `student` VALUES ('202252000089', 100803, 45, 39, '韩晓', '123456');
INSERT INTO `student` VALUES ('202252000090', 100406, 100, 87, '张军', '123456');
INSERT INTO `student` VALUES ('202252000091', 100315, 24, 20, '谢军', '123456');
INSERT INTO `student` VALUES ('202252000092', 100768, 82, 94, '贺芳敏', '123456');
INSERT INTO `student` VALUES ('202252000093', 100599, 49, 62, '平琳亮', '123456');
INSERT INTO `student` VALUES ('202252000094', 100310, 67, 72, '鲁雷新', '123456');
INSERT INTO `student` VALUES ('202252000095', 100620, 37, 36, '齐雅洁', '123456');
INSERT INTO `student` VALUES ('202252000096', 100953, 34, 95, '柏明', '123456');
INSERT INTO `student` VALUES ('202252000097', 100192, 90, 79, '吕国明', '123456');
INSERT INTO `student` VALUES ('202252000098', 100586, 11, 15, '方新晓', '123456');
INSERT INTO `student` VALUES ('202252000099', 100275, 36, 23, '康婷', '123456');
INSERT INTO `student` VALUES ('202252000100', 100583, 59, 71, '齐兰静', '123456');
INSERT INTO `student` VALUES ('202252000101', 100587, 88, 25, '曹琳', '123456');
INSERT INTO `student` VALUES ('202252000102', 100416, 50, 75, '云婷敏', '123456');
INSERT INTO `student` VALUES ('202252000103', 100512, 84, 79, '尤国', '123456');
INSERT INTO `student` VALUES ('202252000104', 100388, 39, 41, '于艳新', '123456');
INSERT INTO `student` VALUES ('202252000105', 100465, 20, 27, '褚涛', '123456');
INSERT INTO `student` VALUES ('202252000106', 100073, 59, 87, '尹娜', '123456');
INSERT INTO `student` VALUES ('202252000107', 100412, 53, 61, '吕建', '123456');
INSERT INTO `student` VALUES ('202252000108', 100567, 95, 85, '邬丽', '123456');
INSERT INTO `student` VALUES ('202252000109', 100309, 67, 57, '马雅兰', '123456');
INSERT INTO `student` VALUES ('202252000110', 100892, 44, 81, '章红', '123456');
INSERT INTO `student` VALUES ('202252000111', 100165, 71, 68, '和新雷', '123456');
INSERT INTO `student` VALUES ('202252000112', 100943, 87, 40, '倪建', '123456');
INSERT INTO `student` VALUES ('202252000113', 100380, 26, 85, '贺美', '123456');
INSERT INTO `student` VALUES ('202252000114', 100417, 52, 80, '李雅', '123456');
INSERT INTO `student` VALUES ('202252000115', 100329, 71, 99, '雷莉', '123456');
INSERT INTO `student` VALUES ('202252000116', 100184, 34, 39, '郝芳峰', '123456');
INSERT INTO `student` VALUES ('202252000117', 100998, 27, 68, '戚芳', '123456');
INSERT INTO `student` VALUES ('202252000118', 100235, 81, 75, '贺芳', '123456');
INSERT INTO `student` VALUES ('202252000119', 100334, 73, 47, '钱雪', '123456');
INSERT INTO `student` VALUES ('202252000120', 100059, 14, 56, '尹国', '123456');
INSERT INTO `student` VALUES ('202252000121', 100182, 95, 41, '孟峰静', '123456');
INSERT INTO `student` VALUES ('202252000122', 100637, 26, 98, '雷国军', '123456');
INSERT INTO `student` VALUES ('202252000123', 100633, 81, 84, '章莉磊', '123456');
INSERT INTO `student` VALUES ('202252000124', 100166, 45, 17, '谢明', '123456');
INSERT INTO `student` VALUES ('202252000125', 100635, 24, 77, '吴国静', '123456');
INSERT INTO `student` VALUES ('202252000126', 100317, 98, 85, '皮莉亮', '123456');
INSERT INTO `student` VALUES ('202252000127', 100970, 73, 19, '昌亮军', '123456');
INSERT INTO `student` VALUES ('202252000128', 100247, 73, 94, '尤露', '123456');
INSERT INTO `student` VALUES ('202252000129', 100172, 55, 96, '卜晓', '123456');
INSERT INTO `student` VALUES ('202252000130', 100102, 77, 62, '金莉磊', '123456');
INSERT INTO `student` VALUES ('202252000131', 100850, 73, 21, '罗涛', '123456');
INSERT INTO `student` VALUES ('202252000132', 100352, 35, 99, '薛雷', '123456');
INSERT INTO `student` VALUES ('202252000133', 100829, 99, 76, '孙芳', '123456');
INSERT INTO `student` VALUES ('202252000134', 100061, 58, 40, '薛婷', '123456');
INSERT INTO `student` VALUES ('202252000135', 100144, 79, 41, '毕强芳', '123456');
INSERT INTO `student` VALUES ('202252000136', 100423, 46, 16, '雷芳', '123456');
INSERT INTO `student` VALUES ('202252000137', 100321, 66, 73, '韦燕', '123456');
INSERT INTO `student` VALUES ('202252000138', 100960, 90, 28, '王美晓', '123456');
INSERT INTO `student` VALUES ('202252000139', 100468, 42, 32, '张芳', '123456');
INSERT INTO `student` VALUES ('202252000140', 100260, 89, 80, '皮美', '123456');
INSERT INTO `student` VALUES ('202252000141', 100046, 27, 51, '倪露琳', '123456');
INSERT INTO `student` VALUES ('202252000142', 100503, 27, 32, '鲁新', '123456');
INSERT INTO `student` VALUES ('202252000143', 100648, 93, 24, '皮琳', '123456');
INSERT INTO `student` VALUES ('202252000144', 100930, 93, 14, '冯兰', '123456');
INSERT INTO `student` VALUES ('202252000145', 100660, 78, 70, '吕晓燕', '123456');
INSERT INTO `student` VALUES ('202252000146', 100173, 84, 10, '卞雅娜', '123456');
INSERT INTO `student` VALUES ('202252000147', 100821, 59, 99, '吕玲', '123456');
INSERT INTO `student` VALUES ('202252000148', 100289, 56, 70, '余涛', '123456');
INSERT INTO `student` VALUES ('202252000149', 100612, 37, 100, '钱强亮', '123456');
INSERT INTO `student` VALUES ('202252000150', 100174, 74, 14, '韩莉', '123456');
INSERT INTO `student` VALUES ('202252000151', 100385, 82, 32, '赵建', '123456');
INSERT INTO `student` VALUES ('202252000152', 100846, 100, 81, '朱娜', '123456');
INSERT INTO `student` VALUES ('202252000153', 100276, 16, 18, '邬军兰', '123456');
INSERT INTO `student` VALUES ('202252000154', 100677, 91, 82, '元芳', '123456');
INSERT INTO `student` VALUES ('202252000155', 100486, 78, 73, '赵美', '123456');
INSERT INTO `student` VALUES ('202252000156', 100707, 70, 29, '邹静刚', '123456');
INSERT INTO `student` VALUES ('202252000157', 100593, 82, 19, '元亮', '123456');
INSERT INTO `student` VALUES ('202252000158', 100611, 63, 90, '史磊', '123456');
INSERT INTO `student` VALUES ('202252000159', 100987, 63, 55, '严雅', '123456');
INSERT INTO `student` VALUES ('202252000160', 100134, 56, 70, '岑军', '123456');
INSERT INTO `student` VALUES ('202252000161', 100923, 50, 53, '周建', '123456');
INSERT INTO `student` VALUES ('202252000162', 100600, 55, 82, '唐芳军', '123456');
INSERT INTO `student` VALUES ('202252000163', 100796, 47, 34, '康峰强', '123456');
INSERT INTO `student` VALUES ('202252000164', 100016, 76, 44, '皮芳', '123456');
INSERT INTO `student` VALUES ('202252000165', 100466, 95, 63, '花峰', '123456');
INSERT INTO `student` VALUES ('202252000166', 100337, 62, 91, '孟婷红', '123456');
INSERT INTO `student` VALUES ('202252000167', 100175, 82, 37, '冯涛娜', '123456');
INSERT INTO `student` VALUES ('202252000168', 100777, 70, 18, '水雪', '123456');
INSERT INTO `student` VALUES ('202252000169', 100985, 49, 67, '昌美', '123456');
INSERT INTO `student` VALUES ('202252000170', 100243, 66, 23, '伍雪', '123456');
INSERT INTO `student` VALUES ('202252000171', 100888, 93, 83, '贺丽', '123456');
INSERT INTO `student` VALUES ('202252000172', 100457, 66, 14, '俞静', '123456');
INSERT INTO `student` VALUES ('202252000173', 100685, 85, 23, '萧明', '123456');
INSERT INTO `student` VALUES ('202252000174', 100598, 76, 57, '葛明新', '123456');
INSERT INTO `student` VALUES ('202252000175', 100570, 13, 59, '沈娜刚', '123456');
INSERT INTO `student` VALUES ('202252000176', 100429, 38, 51, '张新', '123456');
INSERT INTO `student` VALUES ('202252000177', 100562, 61, 83, '于娜美', '123456');
INSERT INTO `student` VALUES ('202252000178', 100999, 33, 89, '雷玲露', '123456');
INSERT INTO `student` VALUES ('202252000179', 100257, 88, 50, '褚新艳', '123456');
INSERT INTO `student` VALUES ('202252000180', 100227, 89, 59, '魏峰莉', '123456');
INSERT INTO `student` VALUES ('202252000181', 100729, 70, 100, '韩亮', '123456');
INSERT INTO `student` VALUES ('202252000182', 100333, 78, 50, '袁峰', '123456');
INSERT INTO `student` VALUES ('202252000183', 100171, 72, 85, '郝丽', '123456');
INSERT INTO `student` VALUES ('202252000184', 100248, 11, 45, '朱燕', '123456');
INSERT INTO `student` VALUES ('202252000185', 100409, 56, 61, '褚丽', '123456');
INSERT INTO `student` VALUES ('202252000186', 100325, 25, 27, '穆美静', '123456');
INSERT INTO `student` VALUES ('202252000187', 100263, 25, 73, '安雅红', '123456');
INSERT INTO `student` VALUES ('202252000188', 100123, 60, 89, '吴峰强', '123456');
INSERT INTO `student` VALUES ('202252000189', 100670, 73, 55, '俞涛', '123456');
INSERT INTO `student` VALUES ('202252000190', 100301, 51, 54, '俞洁建', '123456');
INSERT INTO `student` VALUES ('202252000191', 100507, 72, 22, '俞燕', '123456');
INSERT INTO `student` VALUES ('202252000192', 100079, 30, 71, '戚雷', '123456');
INSERT INTO `student` VALUES ('202252000193', 100692, 48, 65, '凤琳兰', '123456');
INSERT INTO `student` VALUES ('202252000194', 100782, 68, 86, '魏亮军', '123456');
INSERT INTO `student` VALUES ('202252000195', 100994, 38, 21, '黄琳雪', '123456');
INSERT INTO `student` VALUES ('202252000196', 100770, 13, 53, '倪雪兰', '123456');
INSERT INTO `student` VALUES ('202252000197', 100400, 11, 43, '尤强', '123456');
INSERT INTO `student` VALUES ('202252000198', 100827, 33, 32, '何雷', '123456');
INSERT INTO `student` VALUES ('202252000199', 100178, 89, 75, '韩静雷', '123456');
INSERT INTO `student` VALUES ('202252000200', 100946, 12, 30, '马强婷', '123456');
INSERT INTO `student` VALUES ('202252000201', 100113, 79, 14, '余美', '123456');
INSERT INTO `student` VALUES ('202252000202', 100848, 49, 28, '卞玲艳', '123456');
INSERT INTO `student` VALUES ('202252000203', 100005, 80, 86, '昌琳芳', '123456');
INSERT INTO `student` VALUES ('202252000204', 100783, 82, 40, '奚军新', '123456');
INSERT INTO `student` VALUES ('202252000205', 100755, 64, 21, '严洁', '123456');
INSERT INTO `student` VALUES ('202252000206', 100640, 97, 75, '常美', '123456');
INSERT INTO `student` VALUES ('202252000207', 100426, 51, 45, '卜雅', '123456');
INSERT INTO `student` VALUES ('202252000208', 100193, 43, 98, '张晓', '123456');
INSERT INTO `student` VALUES ('202252000209', 100405, 53, 67, '曹娜国', '123456');
INSERT INTO `student` VALUES ('202252000210', 100269, 87, 51, '秦雪洁', '123456');
INSERT INTO `student` VALUES ('202252000211', 100772, 51, 93, '郝亮', '123456');
INSERT INTO `student` VALUES ('202252000212', 100002, 87, 36, '卫琳', '123456');
INSERT INTO `student` VALUES ('202252000213', 100820, 80, 50, '金涛', '123456');
INSERT INTO `student` VALUES ('202252000214', 100581, 95, 54, '何晓', '123456');
INSERT INTO `student` VALUES ('202252000215', 100666, 97, 71, '冯静', '123456');
INSERT INTO `student` VALUES ('202252000216', 100995, 88, 29, '费强建', '123456');
INSERT INTO `student` VALUES ('202252000217', 100094, 10, 41, '伍红', '123456');
INSERT INTO `student` VALUES ('202252000218', 100697, 55, 12, '李美', '123456');
INSERT INTO `student` VALUES ('202252000219', 100710, 53, 57, '常雅露', '123456');
INSERT INTO `student` VALUES ('202252000220', 100428, 52, 24, '苏雪静', '123456');
INSERT INTO `student` VALUES ('202252000221', 100979, 84, 85, '钱娜峰', '123456');
INSERT INTO `student` VALUES ('202252000222', 100018, 30, 62, '汤洁新', '123456');
INSERT INTO `student` VALUES ('202252000223', 100521, 49, 51, '韩雪', '123456');
INSERT INTO `student` VALUES ('202252000224', 100063, 77, 98, '汤军', '123456');
INSERT INTO `student` VALUES ('202252000225', 100105, 59, 78, '云芳涛', '123456');
INSERT INTO `student` VALUES ('202252000226', 100438, 54, 68, '皮艳', '123456');
INSERT INTO `student` VALUES ('202252000227', 100160, 20, 81, '周静', '123456');
INSERT INTO `student` VALUES ('202252000228', 100452, 56, 31, '郝雪', '123456');
INSERT INTO `student` VALUES ('202252000229', 100454, 74, 33, '时艳国', '123456');
INSERT INTO `student` VALUES ('202252000230', 100244, 54, 12, '周小', '123456');
INSERT INTO `student` VALUES ('202252000231', 100055, 96, 63, '马芳静', '123456');
INSERT INTO `student` VALUES ('202252000232', 100653, 73, 64, '秦雷亮', '123456');
INSERT INTO `student` VALUES ('202252000233', 100588, 47, 78, '时新', '123456');
INSERT INTO `student` VALUES ('202252000234', 100043, 95, 17, '蒋美丽', '123456');
INSERT INTO `student` VALUES ('202252000235', 100157, 13, 83, '杨明', '123456');
INSERT INTO `student` VALUES ('202252000236', 100619, 55, 79, '倪亮', '123456');
INSERT INTO `student` VALUES ('202252000237', 100081, 85, 28, '郎雷', '123456');
INSERT INTO `student` VALUES ('202252000238', 100650, 32, 39, '廉小峰', '123456');
INSERT INTO `student` VALUES ('202252000239', 100120, 36, 44, '钱建红', '123456');
INSERT INTO `student` VALUES ('202252000240', 100665, 39, 25, '卫强', '123456');
INSERT INTO `student` VALUES ('202252000241', 100684, 90, 43, '潘玲', '123456');
INSERT INTO `student` VALUES ('202252000242', 100314, 91, 19, '邹燕', '123456');
INSERT INTO `student` VALUES ('202252000243', 100928, 78, 62, '时静明', '123456');
INSERT INTO `student` VALUES ('202252000244', 100035, 88, 18, '邹涛', '123456');
INSERT INTO `student` VALUES ('202252000245', 100608, 18, 75, '廉明', '123456');
INSERT INTO `student` VALUES ('202252000246', 100615, 10, 24, '吴国', '123456');
INSERT INTO `student` VALUES ('202252000247', 100911, 30, 36, '乐洁', '123456');
INSERT INTO `student` VALUES ('202252000248', 100616, 35, 90, '于建', '123456');
INSERT INTO `student` VALUES ('202252000249', 100264, 79, 19, '傅琳', '123456');
INSERT INTO `student` VALUES ('202252000250', 100794, 16, 100, '方新刚', '123456');
INSERT INTO `student` VALUES ('202252000251', 100374, 14, 46, '元新', '123456');
INSERT INTO `student` VALUES ('202252000252', 100187, 56, 53, '曹小', '123456');
INSERT INTO `student` VALUES ('202252000253', 100837, 53, 38, '袁亮', '123456');
INSERT INTO `student` VALUES ('202252000254', 100145, 29, 86, '皮敏艳', '123456');
INSERT INTO `student` VALUES ('202252000255', 100605, 79, 44, '周红', '123456');
INSERT INTO `student` VALUES ('202252000256', 100743, 14, 33, '殷强峰', '123456');
INSERT INTO `student` VALUES ('202252000257', 100013, 60, 73, '薛芳', '123456');
INSERT INTO `student` VALUES ('202252000258', 100151, 80, 21, '潘强峰', '123456');
INSERT INTO `student` VALUES ('202252000259', 100015, 50, 90, '傅晓小', '123456');
INSERT INTO `student` VALUES ('202252000260', 100563, 100, 14, '赵雪军', '123456');
INSERT INTO `student` VALUES ('202252000261', 100895, 21, 27, '姜峰', '123456');
INSERT INTO `student` VALUES ('202252000262', 100798, 36, 55, '岑静婷', '123456');
INSERT INTO `student` VALUES ('202252000263', 100727, 42, 22, '余雅国', '123456');
INSERT INTO `student` VALUES ('202252000264', 100057, 85, 35, '韩军', '123456');
INSERT INTO `student` VALUES ('202252000265', 100639, 80, 19, '齐静', '123456');
INSERT INTO `student` VALUES ('202252000266', 100439, 84, 72, '何晓丽', '123456');
INSERT INTO `student` VALUES ('202252000267', 100286, 12, 24, '喻红', '123456');
INSERT INTO `student` VALUES ('202252000268', 100080, 70, 75, '许强', '123456');
INSERT INTO `student` VALUES ('202252000269', 100683, 67, 63, '倪玲丽', '123456');
INSERT INTO `student` VALUES ('202252000270', 100282, 21, 54, '常美', '123456');
INSERT INTO `student` VALUES ('202252000271', 100925, 86, 56, '罗晓玲', '123456');
INSERT INTO `student` VALUES ('202252000272', 100699, 82, 89, '曹琳', '123456');
INSERT INTO `student` VALUES ('202252000273', 100805, 59, 58, '孙静', '123456');
INSERT INTO `student` VALUES ('202252000274', 100924, 57, 81, '唐琳峰', '123456');
INSERT INTO `student` VALUES ('202252000275', 100202, 99, 21, '吴丽', '123456');
INSERT INTO `student` VALUES ('202252000276', 100690, 47, 94, '唐建晓', '123456');
INSERT INTO `student` VALUES ('202252000277', 100091, 48, 73, '章军', '123456');
INSERT INTO `student` VALUES ('202252000278', 100688, 26, 20, '周峰雅', '123456');
INSERT INTO `student` VALUES ('202252000279', 100631, 53, 64, '陈磊', '123456');
INSERT INTO `student` VALUES ('202252000280', 100297, 34, 36, '吴磊', '123456');
INSERT INTO `student` VALUES ('202252000281', 100893, 93, 19, '俞露', '123456');
INSERT INTO `student` VALUES ('202252000282', 100712, 33, 84, '安红', '123456');
INSERT INTO `student` VALUES ('202252000283', 100897, 28, 27, '元莉', '123456');
INSERT INTO `student` VALUES ('202252000284', 100101, 81, 25, '周红', '123456');
INSERT INTO `student` VALUES ('202252000285', 100636, 35, 26, '严芳静', '123456');
INSERT INTO `student` VALUES ('202252000286', 100351, 96, 79, '卜静', '123456');
INSERT INTO `student` VALUES ('202252000287', 100221, 84, 23, '喻艳', '123456');
INSERT INTO `student` VALUES ('202252000288', 100900, 50, 31, '卫琳', '123456');
INSERT INTO `student` VALUES ('202252000289', 100630, 92, 71, '郑小晓', '123456');
INSERT INTO `student` VALUES ('202252000290', 100479, 78, 43, '曹雪', '123456');
INSERT INTO `student` VALUES ('202252000291', 100327, 63, 94, '许芳亮', '123456');
INSERT INTO `student` VALUES ('202252000292', 100071, 28, 95, '尤峰', '123456');
INSERT INTO `student` VALUES ('202252000293', 100280, 71, 78, '柏小', '123456');
INSERT INTO `student` VALUES ('202252000294', 100842, 57, 32, '朱峰', '123456');
INSERT INTO `student` VALUES ('202252000295', 100395, 28, 85, '吕磊小', '123456');
INSERT INTO `student` VALUES ('202252000296', 100520, 73, 85, '费静婷', '123456');
INSERT INTO `student` VALUES ('202252000297', 100508, 31, 56, '费强', '123456');
INSERT INTO `student` VALUES ('202252000298', 100982, 91, 18, '尹婷', '123456');
INSERT INTO `student` VALUES ('202252000299', 100541, 49, 12, '邹晓丽', '123456');
INSERT INTO `student` VALUES ('202252000300', 100068, 38, 47, '范婷', '123456');
INSERT INTO `student` VALUES ('202252000301', 100878, 97, 97, '和娜', '123456');
INSERT INTO `student` VALUES ('202252000302', 100694, 94, 66, '尹美', '123456');
INSERT INTO `student` VALUES ('202252000303', 100344, 90, 86, '薛丽', '123456');
INSERT INTO `student` VALUES ('202252000304', 100128, 77, 80, '秦静强', '123456');
INSERT INTO `student` VALUES ('202252000305', 100076, 48, 84, '常小新', '123456');
INSERT INTO `student` VALUES ('202252000306', 100864, 36, 42, '鲍国', '123456');
INSERT INTO `student` VALUES ('202252000307', 100760, 30, 37, '于静', '123456');
INSERT INTO `student` VALUES ('202252000308', 100361, 78, 59, '安洁娜', '123456');
INSERT INTO `student` VALUES ('202252000309', 100558, 58, 67, '黄芳', '123456');
INSERT INTO `student` VALUES ('202252000310', 100303, 92, 42, '卜晓', '123456');
INSERT INTO `student` VALUES ('202252000311', 100176, 91, 82, '朱涛', '123456');
INSERT INTO `student` VALUES ('202252000312', 100138, 81, 31, '薛洁', '123456');
INSERT INTO `student` VALUES ('202252000313', 100155, 79, 43, '魏亮艳', '123456');
INSERT INTO `student` VALUES ('202252000314', 100261, 98, 63, '萧建兰', '123456');
INSERT INTO `student` VALUES ('202252000315', 100877, 64, 34, '秦国', '123456');
INSERT INTO `student` VALUES ('202252000316', 100664, 66, 10, '岑美', '123456');
INSERT INTO `student` VALUES ('202252000317', 100686, 70, 38, '殷刚', '123456');
INSERT INTO `student` VALUES ('202252000318', 100271, 45, 84, '魏小丽', '123456');
INSERT INTO `student` VALUES ('202252000319', 100880, 77, 85, '吕静', '123456');
INSERT INTO `student` VALUES ('202252000320', 100652, 56, 46, '姜新', '123456');
INSERT INTO `student` VALUES ('202252000321', 100236, 80, 20, '喻雪', '123456');
INSERT INTO `student` VALUES ('202252000322', 100861, 44, 90, '平涛亮', '123456');
INSERT INTO `student` VALUES ('202252000323', 100497, 89, 40, '沈亮建', '123456');
INSERT INTO `student` VALUES ('202252000324', 100761, 85, 97, '严晓国', '123456');
INSERT INTO `student` VALUES ('202252000325', 100815, 43, 13, '滕洁涛', '123456');
INSERT INTO `student` VALUES ('202252000326', 100947, 80, 37, '罗涛', '123456');
INSERT INTO `student` VALUES ('202252000327', 100962, 50, 18, '邹玲强', '123456');
INSERT INTO `student` VALUES ('202252000328', 100119, 34, 98, '苗磊静', '123456');
INSERT INTO `student` VALUES ('202252000329', 100214, 84, 19, '王红静', '123456');
INSERT INTO `student` VALUES ('202252000330', 100459, 54, 63, '罗燕峰', '123456');
INSERT INTO `student` VALUES ('202252000331', 100813, 27, 76, '元建', '123456');
INSERT INTO `student` VALUES ('202252000332', 100915, 74, 17, '傅国', '123456');
INSERT INTO `student` VALUES ('202252000333', 100780, 88, 60, '岑玲', '123456');
INSERT INTO `student` VALUES ('202252000334', 100936, 44, 22, '孙明琳', '123456');
INSERT INTO `student` VALUES ('202252000335', 100125, 97, 97, '韦亮艳', '123456');
INSERT INTO `student` VALUES ('202252000336', 100422, 37, 97, '孙燕', '123456');
INSERT INTO `student` VALUES ('202252000337', 100732, 31, 42, '云娜', '123456');
INSERT INTO `student` VALUES ('202252000338', 100802, 52, 83, '卫雅明', '123456');
INSERT INTO `student` VALUES ('202252000339', 100689, 25, 37, '方艳建', '123456');
INSERT INTO `student` VALUES ('202252000340', 100838, 49, 23, '酆琳刚', '123456');
INSERT INTO `student` VALUES ('202252000341', 100362, 43, 77, '孟刚', '123456');
INSERT INTO `student` VALUES ('202252000342', 100502, 67, 24, '乐峰', '123456');
INSERT INTO `student` VALUES ('202252000343', 100064, 45, 23, '傅建国', '123456');
INSERT INTO `student` VALUES ('202252000344', 100445, 70, 64, '韩燕', '123456');
INSERT INTO `student` VALUES ('202252000345', 100135, 90, 74, '萧强', '123456');
INSERT INTO `student` VALUES ('202252000346', 100662, 18, 44, '康涛峰', '123456');
INSERT INTO `student` VALUES ('202252000347', 100149, 68, 71, '和磊婷', '123456');
INSERT INTO `student` VALUES ('202252000348', 100067, 33, 73, '顾莉', '123456');
INSERT INTO `student` VALUES ('202252000349', 100201, 88, 44, '卞明', '123456');
INSERT INTO `student` VALUES ('202252000350', 100569, 55, 36, '冯峰', '123456');
INSERT INTO `student` VALUES ('202252000351', 100078, 88, 71, '赵峰雷', '123456');
INSERT INTO `student` VALUES ('202252000352', 100391, 87, 23, '滕小雅', '123456');
INSERT INTO `student` VALUES ('202252000353', 100056, 18, 21, '郝红', '123456');
INSERT INTO `student` VALUES ('202252000354', 100704, 64, 73, '康刚小', '123456');
INSERT INTO `student` VALUES ('202252000355', 100527, 93, 11, '陶雅亮', '123456');
INSERT INTO `student` VALUES ('202252000356', 100835, 45, 69, '廉艳兰', '123456');
INSERT INTO `student` VALUES ('202252000357', 100499, 94, 54, '元刚军', '123456');
INSERT INTO `student` VALUES ('202252000358', 100224, 19, 81, '滕亮峰', '123456');
INSERT INTO `student` VALUES ('202252000359', 100687, 61, 99, '韩兰晓', '123456');
INSERT INTO `student` VALUES ('202252000360', 100954, 46, 25, '钱峰', '123456');
INSERT INTO `student` VALUES ('202252000361', 100349, 84, 53, '卫娜', '123456');
INSERT INTO `student` VALUES ('202252000362', 100938, 69, 76, '苗露峰', '123456');
INSERT INTO `student` VALUES ('202252000363', 100863, 35, 97, '倪新雷', '123456');
INSERT INTO `student` VALUES ('202252000364', 100129, 73, 83, '金雷国', '123456');
INSERT INTO `student` VALUES ('202252000365', 100011, 85, 22, '卞玲晓', '123456');
INSERT INTO `student` VALUES ('202252000366', 100852, 40, 48, '殷琳', '123456');
INSERT INTO `student` VALUES ('202252000367', 100674, 93, 65, '雷兰艳', '123456');
INSERT INTO `student` VALUES ('202252000368', 100147, 59, 80, '史琳红', '123456');
INSERT INTO `student` VALUES ('202252000369', 100208, 42, 41, '余艳峰', '123456');
INSERT INTO `student` VALUES ('202252000370', 100295, 41, 37, '吕雅', '123456');
INSERT INTO `student` VALUES ('202252000371', 100137, 34, 19, '岑丽红', '123456');
INSERT INTO `student` VALUES ('202252000372', 100154, 82, 93, '郝敏', '123456');
INSERT INTO `student` VALUES ('202252000373', 100557, 52, 24, '许亮', '123456');
INSERT INTO `student` VALUES ('202252000374', 100266, 27, 36, '郝丽', '123456');
INSERT INTO `student` VALUES ('202252000375', 100681, 45, 24, '杨琳', '123456');
INSERT INTO `student` VALUES ('202252000376', 100701, 72, 97, '葛娜小', '123456');
INSERT INTO `student` VALUES ('202252000377', 100808, 99, 90, '何强', '123456');
INSERT INTO `student` VALUES ('202252000378', 100364, 69, 72, '孙丽', '123456');
INSERT INTO `student` VALUES ('202252000379', 100393, 86, 23, '赵丽娜', '123456');
INSERT INTO `student` VALUES ('202252000380', 100513, 20, 80, '郎晓', '123456');
INSERT INTO `student` VALUES ('202252000381', 100788, 64, 12, '傅涛亮', '123456');
INSERT INTO `student` VALUES ('202252000382', 100023, 46, 93, '陈洁', '123456');
INSERT INTO `student` VALUES ('202252000383', 100198, 89, 71, '元娜建', '123456');
INSERT INTO `student` VALUES ('202252000384', 100577, 78, 54, '尤丽磊', '123456');
INSERT INTO `student` VALUES ('202252000385', 100869, 74, 94, '邹明兰', '123456');
INSERT INTO `student` VALUES ('202252000386', 100753, 38, 100, '元雅敏', '123456');
INSERT INTO `student` VALUES ('202252000387', 100195, 72, 60, '方晓美', '123456');
INSERT INTO `student` VALUES ('202252000388', 100645, 86, 53, '郎雷', '123456');
INSERT INTO `student` VALUES ('202252000389', 100517, 92, 75, '李静', '123456');
INSERT INTO `student` VALUES ('202252000390', 100818, 60, 15, '许玲新', '123456');
INSERT INTO `student` VALUES ('202252000391', 100403, 53, 57, '袁娜', '123456');
INSERT INTO `student` VALUES ('202252000392', 100368, 27, 77, '奚敏兰', '123456');
INSERT INTO `student` VALUES ('202252000393', 100396, 79, 48, '郝晓', '123456');
INSERT INTO `student` VALUES ('202252000394', 100191, 64, 50, '黄娜雅', '123456');
INSERT INTO `student` VALUES ('202252000395', 100304, 14, 31, '鲁兰', '123456');
INSERT INTO `student` VALUES ('202252000396', 100020, 63, 65, '窦峰', '123456');
INSERT INTO `student` VALUES ('202252000397', 100216, 30, 22, '傅小强', '123456');
INSERT INTO `student` VALUES ('202252000398', 100532, 46, 65, '昌洁', '123456');
INSERT INTO `student` VALUES ('202252000399', 100177, 27, 13, '昌刚', '123456');
INSERT INTO `student` VALUES ('202252000400', 100483, 95, 97, '冯婷晓', '123456');
INSERT INTO `student` VALUES ('202252000401', 100267, 56, 80, '云亮强', '123456');
INSERT INTO `student` VALUES ('202252000402', 100212, 63, 69, '潘敏', '123456');
INSERT INTO `student` VALUES ('202252000403', 100726, 18, 66, '秦小红', '123456');
INSERT INTO `student` VALUES ('202252000404', 100700, 98, 31, '严婷', '123456');
INSERT INTO `student` VALUES ('202252000405', 100623, 94, 61, '褚兰小', '123456');
INSERT INTO `student` VALUES ('202252000406', 100424, 23, 86, '窦强峰', '123456');
INSERT INTO `student` VALUES ('202252000407', 100363, 69, 89, '常丽玲', '123456');
INSERT INTO `student` VALUES ('202252000408', 100595, 79, 44, '罗红', '123456');
INSERT INTO `student` VALUES ('202252000409', 100886, 97, 31, '皮军', '123456');
INSERT INTO `student` VALUES ('202252000410', 100889, 45, 26, '郝雪玲', '123456');
INSERT INTO `student` VALUES ('202252000411', 100322, 45, 58, '孔亮', '123456');
INSERT INTO `student` VALUES ('202252000412', 100705, 64, 22, '许娜', '123456');
INSERT INTO `student` VALUES ('202252000413', 100715, 35, 96, '罗美', '123456');
INSERT INTO `student` VALUES ('202252000414', 100274, 62, 52, '滕洁雷', '123456');
INSERT INTO `student` VALUES ('202252000415', 100872, 81, 57, '谢婷刚', '123456');
INSERT INTO `student` VALUES ('202252000416', 100576, 21, 32, '岑亮婷', '123456');
INSERT INTO `student` VALUES ('202252000417', 100378, 17, 57, '卜丽', '123456');
INSERT INTO `student` VALUES ('202252000418', 100514, 59, 32, '岑建', '123456');
INSERT INTO `student` VALUES ('202252000419', 100781, 28, 43, '范玲涛', '123456');
INSERT INTO `student` VALUES ('202252000420', 100578, 80, 58, '奚雪', '123456');
INSERT INTO `student` VALUES ('202252000421', 100934, 71, 80, '张亮', '123456');
INSERT INTO `student` VALUES ('202252000422', 100784, 84, 55, '岑峰', '123456');
INSERT INTO `student` VALUES ('202252000423', 100336, 51, 16, '严雪静', '123456');
INSERT INTO `student` VALUES ('202252000424', 100980, 90, 73, '唐丽涛', '123456');
INSERT INTO `student` VALUES ('202252000425', 100021, 32, 96, '朱玲磊', '123456');
INSERT INTO `student` VALUES ('202252000426', 100845, 33, 20, '岑美洁', '123456');
INSERT INTO `student` VALUES ('202252000427', 100919, 94, 85, '金晓', '123456');
INSERT INTO `student` VALUES ('202252000428', 100659, 65, 13, '鲁红小', '123456');
INSERT INTO `student` VALUES ('202252000429', 100851, 26, 33, '戚婷', '123456');
INSERT INTO `student` VALUES ('202252000430', 100288, 45, 95, '华莉洁', '123456');
INSERT INTO `student` VALUES ('202252000431', 100024, 45, 63, '萧莉峰', '123456');
INSERT INTO `student` VALUES ('202252000432', 100060, 16, 49, '常亮', '123456');
INSERT INTO `student` VALUES ('202252000433', 100778, 78, 77, '李艳', '123456');
INSERT INTO `student` VALUES ('202252000434', 100977, 31, 63, '罗娜', '123456');
INSERT INTO `student` VALUES ('202252000435', 100044, 52, 45, '余新', '123456');
INSERT INTO `student` VALUES ('202252000436', 100730, 35, 17, '费国', '123456');
INSERT INTO `student` VALUES ('202252000437', 100561, 70, 33, '时美洁', '123456');
INSERT INTO `student` VALUES ('202252000438', 100935, 21, 31, '苏军', '123456');
INSERT INTO `student` VALUES ('202252000439', 100205, 80, 27, '施明敏', '123456');
INSERT INTO `student` VALUES ('202252000440', 100022, 41, 45, '周新', '123456');
INSERT INTO `student` VALUES ('202252000441', 100991, 18, 25, '余洁', '123456');
INSERT INTO `student` VALUES ('202252000442', 100756, 40, 88, '孔峰强', '123456');
INSERT INTO `student` VALUES ('202252000443', 100787, 84, 81, '尹新娜', '123456');
INSERT INTO `student` VALUES ('202252000444', 100034, 90, 76, '尤敏燕', '123456');
INSERT INTO `student` VALUES ('202252000445', 100210, 17, 59, '康芳琳', '123456');
INSERT INTO `student` VALUES ('202252000446', 100313, 20, 33, '萧建', '123456');
INSERT INTO `student` VALUES ('202252000447', 100259, 14, 91, '余明', '123456');
INSERT INTO `student` VALUES ('202252000448', 100408, 16, 48, '贺亮', '123456');
INSERT INTO `student` VALUES ('202252000449', 100099, 14, 92, '邹红', '123456');
INSERT INTO `student` VALUES ('202252000450', 100100, 62, 38, '卞丽', '123456');
INSERT INTO `student` VALUES ('202252000451', 100506, 13, 98, '郝晓美', '123456');
INSERT INTO `student` VALUES ('202252000452', 100920, 70, 28, '窦丽娜', '123456');
INSERT INTO `student` VALUES ('202252000453', 100007, 91, 26, '和娜', '123456');
INSERT INTO `student` VALUES ('202252000454', 100906, 96, 22, '蒋磊', '123456');
INSERT INTO `student` VALUES ('202252000455', 100203, 11, 17, '倪美', '123456');
INSERT INTO `student` VALUES ('202252000456', 100790, 54, 26, '毕刚', '123456');
INSERT INTO `student` VALUES ('202252000457', 100530, 92, 49, '施小', '123456');
INSERT INTO `student` VALUES ('202252000458', 100355, 92, 69, '周小磊', '123456');
INSERT INTO `student` VALUES ('202252000459', 100053, 96, 32, '尹雷敏', '123456');
INSERT INTO `student` VALUES ('202252000460', 100489, 16, 98, '金美', '123456');
INSERT INTO `student` VALUES ('202252000461', 100107, 88, 99, '章雪', '123456');
INSERT INTO `student` VALUES ('202252000462', 100312, 12, 35, '平玲', '123456');
INSERT INTO `student` VALUES ('202252000463', 100302, 14, 88, '孔小莉', '123456');
INSERT INTO `student` VALUES ('202252000464', 100552, 92, 33, '邬峰新', '123456');
INSERT INTO `student` VALUES ('202252000465', 100855, 64, 63, '韩雅', '123456');
INSERT INTO `student` VALUES ('202252000466', 100997, 83, 47, '李艳', '123456');
INSERT INTO `student` VALUES ('202252000467', 100976, 59, 23, '郝新艳', '123456');
INSERT INTO `student` VALUES ('202252000468', 100366, 65, 67, '钱强', '123456');
INSERT INTO `student` VALUES ('202252000469', 100859, 33, 41, '王婷', '123456');
INSERT INTO `student` VALUES ('202252000470', 100277, 49, 89, '酆敏玲', '123456');
INSERT INTO `student` VALUES ('202252000471', 100473, 27, 33, '彭建', '123456');
INSERT INTO `student` VALUES ('202252000472', 100446, 46, 38, '费丽琳', '123456');
INSERT INTO `student` VALUES ('202252000473', 100111, 97, 86, '于新', '123456');
INSERT INTO `student` VALUES ('202252000474', 100399, 88, 88, '韩美', '123456');
INSERT INTO `student` VALUES ('202252000475', 100749, 20, 62, '奚建', '123456');
INSERT INTO `student` VALUES ('202252000476', 100673, 22, 22, '余琳', '123456');
INSERT INTO `student` VALUES ('202252000477', 100875, 100, 87, '许小', '123456');
INSERT INTO `student` VALUES ('202252000478', 100789, 42, 75, '平军', '123456');
INSERT INTO `student` VALUES ('202252000479', 100573, 33, 23, '邹亮丽', '123456');
INSERT INTO `student` VALUES ('202252000480', 100093, 43, 40, '喻雅', '123456');
INSERT INTO `student` VALUES ('202252000481', 100972, 70, 90, '曹国', '123456');
INSERT INTO `student` VALUES ('202252000482', 100323, 19, 23, '冯国亮', '123456');
INSERT INTO `student` VALUES ('202252000483', 100292, 84, 50, '冯小雪', '123456');
INSERT INTO `student` VALUES ('202252000484', 100268, 72, 41, '赵莉洁', '123456');
INSERT INTO `student` VALUES ('202252000485', 100847, 81, 39, '韩小', '123456');
INSERT INTO `student` VALUES ('202252000486', 100651, 12, 26, '陶娜雷', '123456');
INSERT INTO `student` VALUES ('202252000487', 100602, 24, 22, '李雪', '123456');
INSERT INTO `student` VALUES ('202252000488', 100966, 69, 65, '滕明', '123456');
INSERT INTO `student` VALUES ('202252000489', 100088, 56, 22, '俞建', '123456');
INSERT INTO `student` VALUES ('202252000490', 100186, 49, 34, '尹强', '123456');
INSERT INTO `student` VALUES ('202252000491', 100376, 91, 27, '戚玲雅', '123456');
INSERT INTO `student` VALUES ('202252000492', 100291, 88, 26, '卜琳婷', '123456');
INSERT INTO `student` VALUES ('202252000493', 100434, 78, 24, '奚美涛', '123456');
INSERT INTO `student` VALUES ('202252000494', 100757, 62, 19, '韦晓艳', '123456');
INSERT INTO `student` VALUES ('202252000495', 100942, 15, 24, '穆小', '123456');
INSERT INTO `student` VALUES ('202252000496', 100392, 64, 24, '常艳琳', '123456');
INSERT INTO `student` VALUES ('202252000497', 100549, 90, 47, '毕芳雷', '123456');
INSERT INTO `student` VALUES ('202252000498', 100389, 94, 59, '蒋静雅', '123456');
INSERT INTO `student` VALUES ('202252000499', 100156, 46, 50, '奚晓刚', '123456');
INSERT INTO `student` VALUES ('202252000500', 100921, 27, 87, '安兰娜', '123456');
INSERT INTO `student` VALUES ('202252000501', 100716, 56, 56, '潘静燕', '123456');
INSERT INTO `student` VALUES ('202252000502', 100287, 40, 86, '鲍国娜', '123456');
INSERT INTO `student` VALUES ('202252000503', 100369, 98, 25, '吕新', '123456');
INSERT INTO `student` VALUES ('202252000504', 100116, 98, 33, '马婷露', '123456');
INSERT INTO `student` VALUES ('202252000505', 100810, 41, 19, '方峰', '123456');
INSERT INTO `student` VALUES ('202252000506', 100077, 68, 32, '齐国雷', '123456');
INSERT INTO `student` VALUES ('202252000507', 100083, 37, 36, '和峰明', '123456');
INSERT INTO `student` VALUES ('202252000508', 100096, 84, 26, '鲍涛军', '123456');
INSERT INTO `student` VALUES ('202252000509', 100548, 28, 80, '鲍婷', '123456');
INSERT INTO `student` VALUES ('202252000510', 100949, 12, 88, '尤刚', '123456');
INSERT INTO `student` VALUES ('202252000511', 100538, 100, 94, '水雷', '123456');
INSERT INTO `student` VALUES ('202252000512', 100223, 72, 50, '倪莉', '123456');
INSERT INTO `student` VALUES ('202252000513', 100771, 80, 12, '葛洁强', '123456');
INSERT INTO `student` VALUES ('202252000514', 100402, 23, 47, '顾兰', '123456');
INSERT INTO `student` VALUES ('202252000515', 100958, 85, 45, '朱婷美', '123456');
INSERT INTO `student` VALUES ('202252000516', 100833, 27, 85, '柳明', '123456');
INSERT INTO `student` VALUES ('202252000517', 100564, 32, 27, '唐磊', '123456');
INSERT INTO `student` VALUES ('202252000518', 100721, 25, 23, '冯国雅', '123456');
INSERT INTO `student` VALUES ('202252000519', 100278, 82, 80, '苏婷玲', '123456');
INSERT INTO `student` VALUES ('202252000520', 100407, 16, 79, '韩雅峰', '123456');
INSERT INTO `student` VALUES ('202252000521', 100590, 100, 64, '水小', '123456');
INSERT INTO `student` VALUES ('202252000522', 100967, 10, 15, '韩晓军', '123456');
INSERT INTO `student` VALUES ('202252000523', 100613, 54, 68, '唐涛', '123456');
INSERT INTO `student` VALUES ('202252000524', 100279, 61, 60, '于琳新', '123456');
INSERT INTO `student` VALUES ('202252000525', 100560, 76, 90, '郝兰丽', '123456');
INSERT INTO `student` VALUES ('202252000526', 100463, 52, 38, '郎玲洁', '123456');
INSERT INTO `student` VALUES ('202252000527', 100353, 48, 12, '苗雷涛', '123456');
INSERT INTO `student` VALUES ('202252000528', 100849, 42, 99, '俞雪洁', '123456');
INSERT INTO `student` VALUES ('202252000529', 100410, 47, 35, '汤露雷', '123456');
INSERT INTO `student` VALUES ('202252000530', 100084, 70, 11, '卫明小', '123456');
INSERT INTO `student` VALUES ('202252000531', 100381, 65, 39, '任雪雅', '123456');
INSERT INTO `student` VALUES ('202252000532', 100614, 92, 27, '杨刚静', '123456');
INSERT INTO `student` VALUES ('202252000533', 100010, 80, 63, '昌明', '123456');
INSERT INTO `student` VALUES ('202252000534', 100488, 95, 84, '常艳', '123456');
INSERT INTO `student` VALUES ('202252000535', 100883, 34, 36, '陈兰静', '123456');
INSERT INTO `student` VALUES ('202252000536', 100494, 49, 28, '冯雅', '123456');
INSERT INTO `student` VALUES ('202252000537', 100103, 15, 33, '于强', '123456');
INSERT INTO `student` VALUES ('202252000538', 100984, 80, 44, '苗磊婷', '123456');
INSERT INTO `student` VALUES ('202252000539', 100251, 72, 47, '韩莉', '123456');
INSERT INTO `student` VALUES ('202252000540', 100879, 99, 30, '朱强军', '123456');
INSERT INTO `student` VALUES ('202252000541', 100265, 45, 39, '毕芳', '123456');
INSERT INTO `student` VALUES ('202252000542', 100993, 87, 47, '沈娜红', '123456');
INSERT INTO `student` VALUES ('202252000543', 100709, 80, 23, '孔刚明', '123456');
INSERT INTO `student` VALUES ('202252000544', 100887, 60, 78, '鲍洁莉', '123456');
INSERT INTO `student` VALUES ('202252000545', 100792, 65, 83, '贺露', '123456');
INSERT INTO `student` VALUES ('202252000546', 100062, 74, 88, '窦丽静', '123456');
INSERT INTO `student` VALUES ('202252000547', 100811, 45, 46, '赵静', '123456');
INSERT INTO `student` VALUES ('202252000548', 100458, 11, 65, '曹雪', '123456');
INSERT INTO `student` VALUES ('202252000549', 100956, 11, 39, '贺莉', '123456');
INSERT INTO `student` VALUES ('202252000550', 100444, 55, 38, '卞小芳', '123456');
INSERT INTO `student` VALUES ('202252000551', 100857, 29, 86, '花晓', '123456');
INSERT INTO `student` VALUES ('202252000552', 100338, 82, 99, '蒋涛', '123456');
INSERT INTO `student` VALUES ('202252000553', 100524, 33, 65, '郑红', '123456');
INSERT INTO `student` VALUES ('202252000554', 100840, 92, 47, '袁洁', '123456');
INSERT INTO `student` VALUES ('202252000555', 100075, 36, 28, '费强燕', '123456');
INSERT INTO `student` VALUES ('202252000556', 100682, 80, 23, '雷静涛', '123456');
INSERT INTO `student` VALUES ('202252000557', 100215, 39, 16, '戚雪建', '123456');
INSERT INTO `student` VALUES ('202252000558', 100051, 90, 88, '陶晓', '123456');
INSERT INTO `student` VALUES ('202252000559', 100661, 58, 100, '水兰娜', '123456');
INSERT INTO `student` VALUES ('202252000560', 100431, 21, 75, '贺涛', '123456');
INSERT INTO `student` VALUES ('202252000561', 100487, 35, 20, '傅明', '123456');
INSERT INTO `student` VALUES ('202252000562', 100515, 43, 83, '齐新', '123456');
INSERT INTO `student` VALUES ('202252000563', 100019, 13, 98, '汤琳婷', '123456');
INSERT INTO `student` VALUES ('202252000564', 100766, 88, 85, '章兰明', '123456');
INSERT INTO `student` VALUES ('202252000565', 100360, 52, 93, '滕兰磊', '123456');
INSERT INTO `student` VALUES ('202252000566', 100343, 36, 70, '史美', '123456');
INSERT INTO `student` VALUES ('202252000567', 100610, 46, 82, '凤磊', '123456');
INSERT INTO `student` VALUES ('202252000568', 100141, 72, 14, '花兰亮', '123456');
INSERT INTO `student` VALUES ('202252000569', 100017, 67, 82, '岑艳', '123456');
INSERT INTO `student` VALUES ('202252000570', 100526, 52, 99, '邹静雷', '123456');
INSERT INTO `student` VALUES ('202252000571', 100626, 58, 37, '韦雅', '123456');
INSERT INTO `student` VALUES ('202252000572', 100086, 79, 73, '康丽', '123456');
INSERT INTO `student` VALUES ('202252000573', 100451, 57, 25, '尹雪露', '123456');
INSERT INTO `student` VALUES ('202252000574', 100881, 89, 23, '冯军', '123456');
INSERT INTO `student` VALUES ('202252000575', 100594, 27, 67, '黄雪', '123456');
INSERT INTO `student` VALUES ('202252000576', 100568, 43, 27, '陈晓建', '123456');
INSERT INTO `student` VALUES ('202252000577', 100733, 38, 18, '时涛敏', '123456');
INSERT INTO `student` VALUES ('202252000578', 100470, 42, 86, '卞娜', '123456');
INSERT INTO `student` VALUES ('202252000579', 100696, 48, 64, '毕强建', '123456');
INSERT INTO `student` VALUES ('202252000580', 100419, 19, 59, '褚雷莉', '123456');
INSERT INTO `student` VALUES ('202252000581', 100708, 40, 76, '姜燕晓', '123456');
INSERT INTO `student` VALUES ('202252000582', 100582, 19, 29, '谢莉国', '123456');
INSERT INTO `student` VALUES ('202252000583', 100737, 88, 22, '穆丽', '123456');
INSERT INTO `student` VALUES ('202252000584', 100153, 59, 94, '顾婷雅', '123456');
INSERT INTO `student` VALUES ('202252000585', 100500, 99, 16, '凤燕新', '123456');
INSERT INTO `student` VALUES ('202252000586', 100281, 14, 61, '李峰', '123456');
INSERT INTO `student` VALUES ('202252000587', 100414, 28, 52, '何强亮', '123456');
INSERT INTO `student` VALUES ('202252000588', 100180, 46, 34, '沈涛磊', '123456');
INSERT INTO `student` VALUES ('202252000589', 100339, 82, 88, '凤静小', '123456');
INSERT INTO `student` VALUES ('202252000590', 100242, 32, 16, '葛刚', '123456');
INSERT INTO `student` VALUES ('202252000591', 100031, 29, 82, '郎静丽', '123456');
INSERT INTO `student` VALUES ('202252000592', 100421, 37, 41, '雷小磊', '123456');
INSERT INTO `student` VALUES ('202252000593', 100359, 96, 40, '康涛强', '123456');
INSERT INTO `student` VALUES ('202252000594', 100418, 28, 43, '酆婷艳', '123456');
INSERT INTO `student` VALUES ('202252000595', 100284, 13, 91, '马军', '123456');
INSERT INTO `student` VALUES ('202252000596', 100866, 64, 95, '鲍洁刚', '123456');
INSERT INTO `student` VALUES ('202252000597', 100740, 61, 86, '许艳', '123456');
INSERT INTO `student` VALUES ('202252000598', 100246, 15, 57, '元雷', '123456');
INSERT INTO `student` VALUES ('202252000599', 100957, 79, 51, '陶小雅', '123456');
INSERT INTO `student` VALUES ('202252000600', 100509, 30, 93, '孟露新', '123456');
INSERT INTO `student` VALUES ('202252000601', 100348, 27, 96, '元新军', '123456');
INSERT INTO `student` VALUES ('202252000602', 100219, 64, 33, '韩晓燕', '123456');
INSERT INTO `student` VALUES ('202252000603', 100476, 25, 92, '元红强', '123456');
INSERT INTO `student` VALUES ('202252000604', 100150, 14, 98, '齐涛', '123456');
INSERT INTO `student` VALUES ('202252000605', 100629, 50, 76, '平燕强', '123456');
INSERT INTO `student` VALUES ('202252000606', 100965, 67, 17, '范静', '123456');
INSERT INTO `student` VALUES ('202252000607', 100741, 59, 17, '昌婷芳', '123456');
INSERT INTO `student` VALUES ('202252000608', 100003, 27, 87, '葛艳', '123456');
INSERT INTO `student` VALUES ('202252000609', 100844, 67, 78, '汤丽小', '123456');
INSERT INTO `student` VALUES ('202252000610', 100580, 74, 44, '元婷刚', '123456');
INSERT INTO `student` VALUES ('202252000611', 100989, 66, 10, '郝涛雷', '123456');
INSERT INTO `student` VALUES ('202252000612', 100655, 72, 57, '史兰', '123456');
INSERT INTO `student` VALUES ('202252000613', 100969, 54, 78, '苏洁建', '123456');
INSERT INTO `student` VALUES ('202252000614', 100152, 35, 52, '杨芳', '123456');
INSERT INTO `student` VALUES ('202252000615', 100518, 16, 50, '安涛琳', '123456');
INSERT INTO `student` VALUES ('202252000616', 100951, 73, 72, '何静', '123456');
INSERT INTO `student` VALUES ('202252000617', 100504, 33, 66, '平红涛', '123456');
INSERT INTO `student` VALUES ('202252000618', 100371, 54, 95, '冯刚', '123456');
INSERT INTO `student` VALUES ('202252000619', 100642, 72, 67, '卜美洁', '123456');
INSERT INTO `student` VALUES ('202252000620', 100447, 42, 51, '杨莉艳', '123456');
INSERT INTO `student` VALUES ('202252000621', 100625, 24, 47, '褚芳', '123456');
INSERT INTO `student` VALUES ('202252000622', 100765, 32, 46, '窦军亮', '123456');
INSERT INTO `student` VALUES ('202252000623', 100411, 44, 25, '费莉', '123456');
INSERT INTO `student` VALUES ('202252000624', 100136, 23, 94, '郝芳涛', '123456');
INSERT INTO `student` VALUES ('202252000625', 100233, 50, 28, '奚芳', '123456');
INSERT INTO `student` VALUES ('202252000626', 100758, 47, 15, '康玲', '123456');
INSERT INTO `student` VALUES ('202252000627', 100318, 79, 41, '褚丽莉', '123456');
INSERT INTO `student` VALUES ('202252000628', 100448, 59, 53, '尹雪琳', '123456');
INSERT INTO `student` VALUES ('202252000629', 100724, 75, 51, '穆磊艳', '123456');
INSERT INTO `student` VALUES ('202252000630', 100161, 26, 15, '齐红新', '123456');
INSERT INTO `student` VALUES ('202252000631', 100050, 74, 66, '许婷', '123456');
INSERT INTO `student` VALUES ('202252000632', 100047, 89, 35, '殷露建', '123456');
INSERT INTO `student` VALUES ('202252000633', 100357, 25, 82, '元晓静', '123456');
INSERT INTO `student` VALUES ('202252000634', 100365, 86, 36, '许红新', '123456');
INSERT INTO `student` VALUES ('202252000635', 100471, 79, 35, '卜芳', '123456');
INSERT INTO `student` VALUES ('202252000636', 100449, 23, 18, '邹琳兰', '123456');
INSERT INTO `student` VALUES ('202252000637', 100745, 73, 76, '毕红敏', '123456');
INSERT INTO `student` VALUES ('202252000638', 100401, 85, 69, '廉涛', '123456');
INSERT INTO `student` VALUES ('202252000639', 100944, 90, 40, '李敏艳', '123456');
INSERT INTO `student` VALUES ('202252000640', 100539, 90, 49, '顾洁国', '123456');
INSERT INTO `student` VALUES ('202252000641', 100556, 30, 77, '顾磊', '123456');
INSERT INTO `student` VALUES ('202252000642', 100273, 24, 100, '鲁峰', '123456');
INSERT INTO `student` VALUES ('202252000643', 100885, 65, 69, '杨刚', '123456');
INSERT INTO `student` VALUES ('202252000644', 100087, 84, 37, '喻峰静', '123456');
INSERT INTO `student` VALUES ('202252000645', 100725, 57, 88, '滕莉强', '123456');
INSERT INTO `student` VALUES ('202252000646', 100868, 48, 34, '郎美', '123456');
INSERT INTO `student` VALUES ('202252000647', 100986, 32, 36, '奚新', '123456');
INSERT INTO `student` VALUES ('202252000648', 100932, 62, 39, '费明小', '123456');
INSERT INTO `student` VALUES ('202252000649', 100204, 80, 94, '齐磊峰', '123456');
INSERT INTO `student` VALUES ('202252000650', 100217, 44, 31, '鲍婷美', '123456');
INSERT INTO `student` VALUES ('202252000651', 100617, 74, 43, '施刚新', '123456');
INSERT INTO `student` VALUES ('202252000652', 100185, 61, 45, '倪艳', '123456');
INSERT INTO `student` VALUES ('202252000653', 100485, 46, 77, '康琳', '123456');
INSERT INTO `student` VALUES ('202252000654', 100126, 51, 43, '郎玲', '123456');
INSERT INTO `student` VALUES ('202252000655', 100234, 17, 65, '余雪露', '123456');
INSERT INTO `student` VALUES ('202252000656', 100238, 39, 31, '昌敏涛', '123456');
INSERT INTO `student` VALUES ('202252000657', 100722, 21, 83, '于红雅', '123456');
INSERT INTO `student` VALUES ('202252000658', 100870, 61, 23, '时莉', '123456');
INSERT INTO `student` VALUES ('202252000659', 100441, 27, 23, '殷燕玲', '123456');
INSERT INTO `student` VALUES ('202252000660', 100511, 12, 22, '施婷美', '123456');
INSERT INTO `student` VALUES ('202252000661', 100542, 77, 99, '柳静艳', '123456');
INSERT INTO `student` VALUES ('202252000662', 100460, 22, 64, '尹静国', '123456');
INSERT INTO `student` VALUES ('202252000663', 100916, 56, 65, '奚兰', '123456');
INSERT INTO `student` VALUES ('202252000664', 100591, 23, 73, '酆露雅', '123456');
INSERT INTO `student` VALUES ('202252000665', 100571, 75, 19, '任玲', '123456');
INSERT INTO `student` VALUES ('202252000666', 100140, 26, 57, '曹新红', '123456');
INSERT INTO `student` VALUES ('202252000667', 100109, 42, 71, '戚红', '123456');
INSERT INTO `student` VALUES ('202252000668', 100225, 92, 70, '冯琳', '123456');
INSERT INTO `student` VALUES ('202252000669', 100052, 80, 77, '周磊露', '123456');
INSERT INTO `student` VALUES ('202252000670', 100283, 87, 85, '严红明', '123456');
INSERT INTO `student` VALUES ('202252000671', 100425, 51, 26, '曹丽', '123456');
INSERT INTO `student` VALUES ('202252000672', 100072, 21, 16, '穆雅', '123456');
INSERT INTO `student` VALUES ('202252000673', 100133, 81, 48, '常雷', '123456');
INSERT INTO `student` VALUES ('202252000674', 100717, 22, 63, '严雪', '123456');
INSERT INTO `student` VALUES ('202252000675', 100663, 43, 18, '孔兰玲', '123456');
INSERT INTO `student` VALUES ('202252000676', 100232, 82, 33, '韩美', '123456');
INSERT INTO `student` VALUES ('202252000677', 100326, 42, 72, '韦涛磊', '123456');
INSERT INTO `student` VALUES ('202252000678', 100082, 62, 46, '毕峰亮', '123456');
INSERT INTO `student` VALUES ('202252000679', 100751, 64, 99, '施军明', '123456');
INSERT INTO `student` VALUES ('202252000680', 100797, 95, 85, '袁莉', '123456');
INSERT INTO `student` VALUES ('202252000681', 100940, 36, 52, '鲁新', '123456');
INSERT INTO `student` VALUES ('202252000682', 100480, 24, 94, '秦雅磊', '123456');
INSERT INTO `student` VALUES ('202252000683', 100736, 12, 44, '费小', '123456');
INSERT INTO `student` VALUES ('202252000684', 100693, 28, 90, '时涛', '123456');
INSERT INTO `student` VALUES ('202252000685', 100748, 24, 25, '许玲', '123456');
INSERT INTO `student` VALUES ('202252000686', 100828, 53, 28, '酆美芳', '123456');
INSERT INTO `student` VALUES ('202252000687', 100876, 98, 12, '贺军', '123456');
INSERT INTO `student` VALUES ('202252000688', 100904, 56, 99, '皮国', '123456');
INSERT INTO `student` VALUES ('202252000689', 100307, 24, 97, '王兰', '123456');
INSERT INTO `student` VALUES ('202252000690', 100536, 88, 18, '柏亮强', '123456');
INSERT INTO `student` VALUES ('202252000691', 100493, 97, 50, '雷晓露', '123456');
INSERT INTO `student` VALUES ('202252000692', 100706, 31, 38, '花娜雷', '123456');
INSERT INTO `student` VALUES ('202252000693', 100311, 54, 58, '汤新建', '123456');
INSERT INTO `student` VALUES ('202252000694', 100540, 36, 97, '奚军兰', '123456');
INSERT INTO `student` VALUES ('202252000695', 100785, 77, 81, '潘静', '123456');
INSERT INTO `student` VALUES ('202252000696', 100158, 66, 74, '吴刚', '123456');
INSERT INTO `student` VALUES ('202252000697', 100012, 17, 28, '薛刚', '123456');
INSERT INTO `student` VALUES ('202252000698', 100643, 27, 32, '沈洁', '123456');
INSERT INTO `student` VALUES ('202252000699', 100300, 94, 11, '钱丽', '123456');
INSERT INTO `student` VALUES ('202252000700', 100127, 66, 42, '赵雅', '123456');
INSERT INTO `student` VALUES ('202252000701', 100048, 44, 42, '鲁涛', '123456');
INSERT INTO `student` VALUES ('202252000702', 100435, 37, 53, '窦雷娜', '123456');
INSERT INTO `student` VALUES ('202252000703', 100294, 10, 94, '吴亮', '123456');
INSERT INTO `student` VALUES ('202252000704', 100467, 19, 91, '孔兰', '123456');
INSERT INTO `student` VALUES ('202252000705', 100319, 76, 44, '戚美', '123456');
INSERT INTO `student` VALUES ('202252000706', 100340, 64, 60, '陈亮建', '123456');
INSERT INTO `student` VALUES ('202252000707', 100952, 40, 99, '时军', '123456');
INSERT INTO `student` VALUES ('202252000708', 100579, 20, 44, '水国娜', '123456');
INSERT INTO `student` VALUES ('202252000709', 100306, 17, 55, '水燕露', '123456');
INSERT INTO `student` VALUES ('202252000710', 100189, 34, 49, '张建亮', '123456');
INSERT INTO `student` VALUES ('202252000711', 100791, 87, 41, '平静', '123456');
INSERT INTO `student` VALUES ('202252000712', 100037, 12, 12, '苗国', '123456');
INSERT INTO `student` VALUES ('202252000713', 100437, 16, 66, '韦洁', '123456');
INSERT INTO `student` VALUES ('202252000714', 100118, 16, 24, '任玲', '123456');
INSERT INTO `student` VALUES ('202252000715', 100164, 74, 66, '李美', '123456');
INSERT INTO `student` VALUES ('202252000716', 100131, 80, 87, '和敏', '123456');
INSERT INTO `student` VALUES ('202252000717', 100592, 53, 31, '华雪', '123456');
INSERT INTO `student` VALUES ('202252000718', 100545, 43, 57, '柳雪亮', '123456');
INSERT INTO `student` VALUES ('202252000719', 100443, 88, 76, '滕芳', '123456');
INSERT INTO `student` VALUES ('202252000720', 100240, 30, 26, '史芳', '123456');
INSERT INTO `student` VALUES ('202252000721', 100800, 85, 52, '秦涛', '123456');
INSERT INTO `student` VALUES ('202252000722', 100873, 11, 31, '孟婷', '123456');
INSERT INTO `student` VALUES ('202252000723', 100415, 34, 85, '殷军', '123456');
INSERT INTO `student` VALUES ('202252000724', 100535, 100, 77, '康丽', '123456');
INSERT INTO `student` VALUES ('202252000725', 100272, 19, 59, '严军', '123456');
INSERT INTO `student` VALUES ('202252000726', 100146, 43, 59, '华琳', '123456');
INSERT INTO `student` VALUES ('202252000727', 100206, 88, 47, '顾婷', '123456');
INSERT INTO `student` VALUES ('202252000728', 100250, 18, 11, '顾丽艳', '123456');
INSERT INTO `student` VALUES ('202252000729', 100066, 87, 85, '陈雪刚', '123456');
INSERT INTO `student` VALUES ('202252000730', 100990, 30, 72, '尤建小', '123456');
INSERT INTO `student` VALUES ('202252000731', 100320, 41, 11, '和刚', '123456');
INSERT INTO `student` VALUES ('202252000732', 100523, 72, 55, '李露', '123456');
INSERT INTO `student` VALUES ('202252000733', 100316, 19, 96, '汤建', '123456');
INSERT INTO `student` VALUES ('202252000734', 100455, 30, 24, '葛玲', '123456');
INSERT INTO `student` VALUES ('202252000735', 100298, 59, 98, '吴磊莉', '123456');
INSERT INTO `student` VALUES ('202252000736', 100773, 73, 39, '孔丽涛', '123456');
INSERT INTO `student` VALUES ('202252000737', 100162, 33, 19, '朱明', '123456');
INSERT INTO `student` VALUES ('202252000738', 100544, 65, 47, '花红峰', '123456');
INSERT INTO `student` VALUES ('202252000739', 100386, 17, 34, '康雷', '123456');
INSERT INTO `student` VALUES ('202252000740', 100226, 13, 38, '吴峰', '123456');
INSERT INTO `student` VALUES ('202252000741', 100950, 26, 55, '和涛燕', '123456');
INSERT INTO `student` VALUES ('202252000742', 100676, 44, 25, '姜丽', '123456');
INSERT INTO `student` VALUES ('202252000743', 100104, 64, 63, '穆强', '123456');
INSERT INTO `student` VALUES ('202252000744', 100723, 88, 92, '于军丽', '123456');
INSERT INTO `student` VALUES ('202252000745', 100769, 16, 43, '孙雷', '123456');
INSERT INTO `student` VALUES ('202252000746', 100973, 23, 15, '王婷', '123456');
INSERT INTO `student` VALUES ('202252000747', 100891, 17, 44, '余小', '123456');
INSERT INTO `student` VALUES ('202252000748', 100241, 98, 35, '戚建', '123456');
INSERT INTO `student` VALUES ('202252000749', 100914, 81, 70, '孔明', '123456');
INSERT INTO `student` VALUES ('202252000750', 100453, 90, 87, '元美刚', '123456');
INSERT INTO `student` VALUES ('202252000751', 100734, 22, 66, '廉兰', '123456');
INSERT INTO `student` VALUES ('202252000752', 100543, 19, 33, '奚洁艳', '123456');
INSERT INTO `student` VALUES ('202252000753', 100199, 12, 80, '杨磊琳', '123456');
INSERT INTO `student` VALUES ('202252000754', 100305, 74, 77, '郑明新', '123456');
INSERT INTO `student` VALUES ('202252000755', 100917, 33, 67, '鲍兰娜', '123456');
INSERT INTO `student` VALUES ('202252000756', 100255, 74, 19, '韩涛', '123456');
INSERT INTO `student` VALUES ('202252000757', 100646, 72, 39, '岑红敏', '123456');
INSERT INTO `student` VALUES ('202252000758', 100774, 43, 62, '康玲', '123456');
INSERT INTO `student` VALUES ('202252000759', 100163, 15, 25, '花琳军', '123456');
INSERT INTO `student` VALUES ('202252000760', 100680, 90, 46, '袁雷静', '123456');
INSERT INTO `student` VALUES ('202252000761', 100001, 36, 88, '于强芳', '123456');
INSERT INTO `student` VALUES ('202252000762', 100440, 37, 72, '常峰', '123456');
INSERT INTO `student` VALUES ('202252000763', 100220, 50, 49, '张艳', '123456');
INSERT INTO `student` VALUES ('202252000764', 100759, 40, 39, '卫亮新', '123456');
INSERT INTO `student` VALUES ('202252000765', 100974, 49, 74, '姜玲军', '123456');
INSERT INTO `student` VALUES ('202252000766', 100874, 18, 64, '柏雷敏', '123456');
INSERT INTO `student` VALUES ('202252000767', 100817, 81, 99, '方兰军', '123456');
INSERT INTO `student` VALUES ('202252000768', 100622, 52, 81, '殷娜晓', '123456');
INSERT INTO `student` VALUES ('202252000769', 100898, 59, 16, '于美', '123456');
INSERT INTO `student` VALUES ('202252000770', 100394, 27, 76, '魏国刚', '123456');
INSERT INTO `student` VALUES ('202252000771', 100826, 100, 52, '花小新', '123456');
INSERT INTO `student` VALUES ('202252000772', 100245, 98, 91, '郎琳', '123456');
INSERT INTO `student` VALUES ('202252000773', 100049, 58, 46, '陶刚莉', '123456');
INSERT INTO `student` VALUES ('202252000774', 100148, 18, 66, '廉兰婷', '123456');
INSERT INTO `student` VALUES ('202252000775', 100045, 46, 21, '陈亮军', '123456');
INSERT INTO `student` VALUES ('202252000776', 100939, 23, 65, '孟露磊', '123456');
INSERT INTO `student` VALUES ('202252000777', 100822, 55, 16, '金雅', '123456');
INSERT INTO `student` VALUES ('202252000778', 100529, 70, 63, '范雪', '123456');
INSERT INTO `student` VALUES ('202252000779', 100609, 41, 11, '薛红', '123456');
INSERT INTO `student` VALUES ('202252000780', 100918, 22, 95, '时晓艳', '123456');
INSERT INTO `student` VALUES ('202252000781', 100698, 96, 52, '卫强', '123456');
INSERT INTO `student` VALUES ('202252000782', 100547, 58, 62, '卜峰磊', '123456');
INSERT INTO `student` VALUES ('202252000783', 100929, 16, 42, '顾露峰', '123456');
INSERT INTO `student` VALUES ('202252000784', 100328, 90, 13, '卞亮琳', '123456');
INSERT INTO `student` VALUES ('202252000785', 100672, 99, 85, '水刚', '123456');
INSERT INTO `student` VALUES ('202252000786', 100004, 33, 52, '韦燕兰', '123456');
INSERT INTO `student` VALUES ('202252000787', 100496, 30, 47, '常静', '123456');
INSERT INTO `student` VALUES ('202252000788', 100742, 63, 51, '鲁艳', '123456');
INSERT INTO `student` VALUES ('202252000789', 100058, 85, 18, '章婷', '123456');
INSERT INTO `student` VALUES ('202252000790', 100695, 83, 90, '薛雪', '123456');
INSERT INTO `student` VALUES ('202252000791', 100565, 72, 21, '于美', '123456');
INSERT INTO `student` VALUES ('202252000792', 100038, 18, 14, '孔莉雷', '123456');
INSERT INTO `student` VALUES ('202252000793', 100027, 35, 40, '褚娜', '123456');
INSERT INTO `student` VALUES ('202252000794', 100341, 79, 100, '魏小新', '123456');
INSERT INTO `student` VALUES ('202252000795', 100262, 76, 80, '郎美', '123456');
INSERT INTO `student` VALUES ('202252000796', 100624, 65, 35, '杨敏', '123456');
INSERT INTO `student` VALUES ('202252000797', 100029, 43, 40, '皮雪刚', '123456');
INSERT INTO `student` VALUES ('202252000798', 100675, 96, 15, '卞亮雷', '123456');
INSERT INTO `student` VALUES ('202252000799', 100824, 75, 10, '韦芳', '123456');
INSERT INTO `student` VALUES ('202252000800', 100464, 99, 87, '吕丽', '123456');
INSERT INTO `student` VALUES ('202252000801', 100299, 84, 93, '岑小', '123456');
INSERT INTO `student` VALUES ('202252000802', 100495, 89, 46, '朱美刚', '123456');
INSERT INTO `student` VALUES ('202252000803', 100657, 78, 99, '方玲兰', '123456');
INSERT INTO `student` VALUES ('202252000804', 100290, 63, 13, '华婷国', '123456');
INSERT INTO `student` VALUES ('202252000805', 100964, 44, 56, '苗娜晓', '123456');
INSERT INTO `student` VALUES ('202252000806', 100475, 31, 53, '顾涛', '123456');
INSERT INTO `student` VALUES ('202252000807', 100222, 86, 92, '云琳婷', '123456');
INSERT INTO `student` VALUES ('202252000808', 100638, 46, 65, '齐敏建', '123456');
INSERT INTO `student` VALUES ('202252000809', 100404, 58, 86, '方晓涛', '123456');
INSERT INTO `student` VALUES ('202252000810', 100040, 54, 56, '褚娜', '123456');
INSERT INTO `student` VALUES ('202252000811', 100390, 93, 67, '邹晓强', '123456');
INSERT INTO `student` VALUES ('202252000812', 100143, 43, 32, '鲁雅', '123456');
INSERT INTO `student` VALUES ('202252000813', 100170, 42, 26, '王琳晓', '123456');
INSERT INTO `student` VALUES ('202252000814', 100253, 13, 24, '毕新雪', '123456');
INSERT INTO `student` VALUES ('202252000815', 100346, 37, 82, '奚亮静', '123456');
INSERT INTO `student` VALUES ('202252000816', 100167, 36, 27, '卫玲', '123456');
INSERT INTO `student` VALUES ('202252000817', 100534, 88, 58, '贺兰', '123456');
INSERT INTO `student` VALUES ('202252000818', 100413, 25, 44, '尤峰敏', '123456');
INSERT INTO `student` VALUES ('202252000819', 100978, 78, 23, '韦小芳', '123456');
INSERT INTO `student` VALUES ('202252000820', 100516, 14, 24, '苏刚', '123456');
INSERT INTO `student` VALUES ('202252000821', 100862, 49, 66, '鲁军露', '123456');
INSERT INTO `student` VALUES ('202252000822', 100937, 80, 85, '朱雪新', '123456');
INSERT INTO `student` VALUES ('202252000823', 100903, 20, 83, '俞红明', '123456');
INSERT INTO `student` VALUES ('202252000824', 100117, 35, 57, '许玲', '123456');
INSERT INTO `student` VALUES ('202252000825', 100926, 77, 55, '施涛', '123456');
INSERT INTO `student` VALUES ('202252000826', 100218, 52, 32, '余露', '123456');
INSERT INTO `student` VALUES ('202252000827', 100667, 69, 26, '李晓娜', '123456');
INSERT INTO `student` VALUES ('202252000828', 100190, 15, 94, '安建燕', '123456');
INSERT INTO `student` VALUES ('202252000829', 100606, 49, 37, '史建雪', '123456');
INSERT INTO `student` VALUES ('202252000830', 100112, 51, 34, '孟燕', '123456');
INSERT INTO `student` VALUES ('202252000831', 100713, 28, 24, '云艳', '123456');
INSERT INTO `student` VALUES ('202252000832', 100908, 50, 88, '金国莉', '123456');
INSERT INTO `student` VALUES ('202252000833', 100477, 91, 18, '华兰', '123456');
INSERT INTO `student` VALUES ('202252000834', 100762, 74, 82, '章丽', '123456');
INSERT INTO `student` VALUES ('202252000835', 100882, 99, 62, '鲁峰', '123456');
INSERT INTO `student` VALUES ('202252000836', 100159, 72, 81, '朱磊', '123456');
INSERT INTO `student` VALUES ('202252000837', 100383, 52, 19, '康亮莉', '123456');
INSERT INTO `student` VALUES ('202252000838', 100819, 22, 98, '毕强', '123456');
INSERT INTO `student` VALUES ('202252000839', 100194, 54, 55, '伍琳婷', '123456');
INSERT INTO `student` VALUES ('202252000840', 100910, 40, 60, '康明建', '123456');
INSERT INTO `student` VALUES ('202252000841', 100492, 25, 67, '卫静国', '123456');
INSERT INTO `student` VALUES ('202252000842', 100377, 73, 74, '凤露', '123456');
INSERT INTO `student` VALUES ('202252000843', 100959, 71, 59, '倪军', '123456');
INSERT INTO `student` VALUES ('202252000844', 100498, 54, 52, '鲍晓新', '123456');
INSERT INTO `student` VALUES ('202252000845', 100070, 91, 55, '邬露', '123456');
INSERT INTO `student` VALUES ('202252000846', 100510, 90, 46, '云新雅', '123456');
INSERT INTO `student` VALUES ('202252000847', 100804, 33, 45, '史敏峰', '123456');
INSERT INTO `student` VALUES ('202252000848', 100345, 19, 32, '雷芳露', '123456');
INSERT INTO `student` VALUES ('202252000849', 100603, 44, 61, '苗亮', '123456');
INSERT INTO `student` VALUES ('202252000850', 100550, 12, 66, '周玲雪', '123456');
INSERT INTO `student` VALUES ('202252000851', 100256, 70, 78, '李玲', '123456');
INSERT INTO `student` VALUES ('202252000852', 100092, 22, 73, '贺国雷', '123456');
INSERT INTO `student` VALUES ('202252000853', 100525, 64, 48, '华玲', '123456');
INSERT INTO `student` VALUES ('202252000854', 100106, 84, 44, '邬雪红', '123456');
INSERT INTO `student` VALUES ('202252000855', 100252, 35, 67, '卫磊新', '123456');
INSERT INTO `student` VALUES ('202252000856', 100121, 83, 79, '卜军艳', '123456');
INSERT INTO `student` VALUES ('202252000857', 100285, 25, 57, '郎露刚', '123456');
INSERT INTO `student` VALUES ('202252000858', 100026, 24, 51, '戚丽涛', '123456');
INSERT INTO `student` VALUES ('202252000859', 100379, 81, 79, '孟敏兰', '123456');
INSERT INTO `student` VALUES ('202252000860', 100169, 96, 97, '顾玲敏', '123456');
INSERT INTO `student` VALUES ('202252000861', 100249, 55, 18, '袁娜', '123456');
INSERT INTO `student` VALUES ('202252000862', 100644, 55, 15, '酆国', '123456');
INSERT INTO `student` VALUES ('202252000863', 100433, 93, 32, '吴刚雅', '123456');
INSERT INTO `student` VALUES ('202252000864', 100801, 85, 49, '任莉', '123456');
INSERT INTO `student` VALUES ('202252000865', 100025, 79, 54, '方玲敏', '123456');
INSERT INTO `student` VALUES ('202252000866', 100537, 63, 68, '常雷', '123456');
INSERT INTO `student` VALUES ('202252000867', 100746, 66, 94, '齐强燕', '123456');
INSERT INTO `student` VALUES ('202252000868', 100776, 54, 55, '张燕雅', '123456');
INSERT INTO `student` VALUES ('202252000869', 100884, 58, 80, '萧琳国', '123456');
INSERT INTO `student` VALUES ('202252000870', 100691, 60, 43, '毕晓玲', '123456');
INSERT INTO `student` VALUES ('202252000871', 100658, 74, 97, '伍新', '123456');
INSERT INTO `student` VALUES ('202252000872', 100941, 48, 38, '蒋琳强', '123456');
INSERT INTO `student` VALUES ('202252000873', 100122, 84, 17, '郝雷', '123456');
INSERT INTO `student` VALUES ('202252000874', 100931, 60, 78, '钱亮', '123456');
INSERT INTO `student` VALUES ('202252000875', 100296, 16, 15, '鲁晓', '123456');
INSERT INTO `student` VALUES ('202252000876', 100816, 87, 46, '元婷', '123456');
INSERT INTO `student` VALUES ('202252000877', 100735, 69, 48, '贺兰', '123456');
INSERT INTO `student` VALUES ('202252000878', 100604, 31, 86, '奚丽娜', '123456');
INSERT INTO `student` VALUES ('202252000879', 100033, 73, 22, '尹露敏', '123456');
INSERT INTO `student` VALUES ('202252000880', 100330, 90, 29, '滕艳', '123456');
INSERT INTO `student` VALUES ('202252000881', 100841, 18, 58, '汤军建', '123456');
INSERT INTO `student` VALUES ('202252000882', 100793, 52, 93, '常丽', '123456');
INSERT INTO `student` VALUES ('202252000883', 100649, 29, 53, '史婷雷', '123456');
INSERT INTO `student` VALUES ('202252000884', 100420, 42, 59, '任莉', '123456');
INSERT INTO `student` VALUES ('202252000885', 100702, 51, 55, '奚亮', '123456');
INSERT INTO `student` VALUES ('202252000886', 100832, 23, 62, '卫小', '123456');
INSERT INTO `student` VALUES ('202252000887', 100572, 21, 76, '郎莉', '123456');
INSERT INTO `student` VALUES ('202252000888', 100196, 67, 99, '潘涛', '123456');
INSERT INTO `student` VALUES ('202252000889', 100209, 29, 64, '柏婷明', '123456');
INSERT INTO `student` VALUES ('202252000890', 100654, 28, 34, '褚军', '123456');
INSERT INTO `student` VALUES ('202252000891', 100331, 46, 95, '何娜雷', '123456');
INSERT INTO `student` VALUES ('202252000892', 100836, 15, 81, '贺晓琳', '123456');
INSERT INTO `student` VALUES ('202252000893', 100436, 79, 26, '余玲刚', '123456');
INSERT INTO `student` VALUES ('202252000894', 100597, 88, 40, '凤敏磊', '123456');
INSERT INTO `student` VALUES ('202252000895', 100179, 28, 40, '褚琳', '123456');
INSERT INTO `student` VALUES ('202252000896', 100085, 78, 65, '顾国露', '123456');
INSERT INTO `student` VALUES ('202252000897', 100632, 82, 94, '苗洁', '123456');
INSERT INTO `student` VALUES ('202252000898', 100703, 20, 58, '滕建国', '123456');
INSERT INTO `student` VALUES ('202252000899', 100200, 59, 97, '黄刚', '123456');
INSERT INTO `student` VALUES ('202252000900', 100036, 83, 15, '倪雷小', '123456');
INSERT INTO `student` VALUES ('202252000901', 100456, 65, 38, '蒋敏', '123456');
INSERT INTO `student` VALUES ('202252000902', 100090, 24, 76, '郎刚', '123456');
INSERT INTO `student` VALUES ('202252000903', 100387, 85, 65, '汤小玲', '123456');
INSERT INTO `student` VALUES ('202252000904', 100367, 60, 41, '伍亮', '123456');
INSERT INTO `student` VALUES ('202252000905', 100258, 51, 38, '罗莉', '123456');
INSERT INTO `student` VALUES ('202252000906', 100922, 26, 95, '滕兰雷', '123456');
INSERT INTO `student` VALUES ('202252000907', 100566, 37, 37, '贺涛雷', '123456');
INSERT INTO `student` VALUES ('202252000908', 100839, 50, 54, '黄静军', '123456');
INSERT INTO `student` VALUES ('202252000909', 100132, 58, 61, '昌磊新', '123456');
INSERT INTO `student` VALUES ('202252000910', 100618, 97, 30, '冯艳莉', '123456');
INSERT INTO `student` VALUES ('202252000911', 100948, 43, 18, '元莉雷', '123456');
INSERT INTO `student` VALUES ('202252000912', 100795, 90, 39, '鲍军', '123456');
INSERT INTO `student` VALUES ('202252000913', 100354, 26, 60, '陈兰', '123456');
INSERT INTO `student` VALUES ('202252000914', 100830, 58, 59, '戚雅', '123456');
INSERT INTO `student` VALUES ('202252000915', 100373, 67, 81, '冯晓', '123456');
INSERT INTO `student` VALUES ('202252000916', 100231, 80, 97, '韦敏静', '123456');
INSERT INTO `student` VALUES ('202252000917', 100856, 71, 29, '昌芳', '123456');
INSERT INTO `student` VALUES ('202252000918', 100854, 79, 94, '尹艳莉', '123456');
INSERT INTO `student` VALUES ('202252000919', 100671, 62, 24, '谢雅强', '123456');
INSERT INTO `student` VALUES ('202252000920', 100342, 56, 11, '王建明', '123456');
INSERT INTO `student` VALUES ('202252000921', 100983, 12, 70, '魏燕', '123456');
INSERT INTO `student` VALUES ('202252000922', 100211, 11, 66, '曹婷', '123456');
INSERT INTO `student` VALUES ('202252000923', 100905, 40, 73, '蒋静琳', '123456');
INSERT INTO `student` VALUES ('202252000924', 100472, 45, 27, '黄雅', '123456');
INSERT INTO `student` VALUES ('202252000925', 100555, 82, 15, '张静丽', '123456');
INSERT INTO `student` VALUES ('202252000926', 100752, 49, 37, '卫琳', '123456');
INSERT INTO `student` VALUES ('202252000927', 100607, 74, 29, '鲁玲', '123456');
INSERT INTO `student` VALUES ('202252000928', 100528, 56, 54, '齐雪', '123456');
INSERT INTO `student` VALUES ('202252000929', 100890, 16, 95, '朱敏', '123456');
INSERT INTO `student` VALUES ('202252000930', 100042, 92, 24, '岑军', '123456');
INSERT INTO `student` VALUES ('202252000931', 100139, 86, 25, '何峰', '123456');
INSERT INTO `student` VALUES ('202252000932', 100814, 24, 55, '方刚亮', '123456');
INSERT INTO `student` VALUES ('202252000933', 100519, 58, 25, '卞新', '123456');
INSERT INTO `student` VALUES ('202252000934', 100553, 99, 37, '罗敏雪', '123456');
INSERT INTO `student` VALUES ('202252000935', 100074, 38, 83, '岑磊', '123456');
INSERT INTO `student` VALUES ('202252000936', 100853, 95, 98, '穆莉红', '123456');
INSERT INTO `student` VALUES ('202252000937', 100124, 67, 63, '谢芳国', '123456');
INSERT INTO `student` VALUES ('202252000938', 100089, 35, 52, '潘军红', '123456');
INSERT INTO `student` VALUES ('202252000939', 100372, 92, 37, '花露丽', '123456');
INSERT INTO `student` VALUES ('202252000940', 100130, 61, 70, '冯晓洁', '123456');
INSERT INTO `student` VALUES ('202252000941', 100469, 61, 34, '毕芳', '123456');
INSERT INTO `student` VALUES ('202252000942', 100030, 25, 47, '许雷玲', '123456');
INSERT INTO `student` VALUES ('202252000943', 100450, 61, 38, '马新', '123456');
INSERT INTO `student` VALUES ('202252000944', 100501, 41, 96, '褚国峰', '123456');
INSERT INTO `student` VALUES ('202252000945', 100008, 52, 18, '李娜', '123456');
INSERT INTO `student` VALUES ('202252000946', 100992, 40, 46, '韦莉', '123456');
INSERT INTO `student` VALUES ('202252000947', 100589, 69, 41, '苗洁', '123456');
INSERT INTO `student` VALUES ('202252000948', 100812, 44, 33, '郝刚雷', '123456');
INSERT INTO `student` VALUES ('202252000949', 100668, 85, 23, '穆露燕', '123456');
INSERT INTO `student` VALUES ('202252000950', 100270, 44, 17, '史雷', '123456');
INSERT INTO `student` VALUES ('202252000951', 100961, 69, 95, '苗小涛', '123456');
INSERT INTO `student` VALUES ('202252000952', 100843, 33, 92, '柏明', '123456');
INSERT INTO `student` VALUES ('202252000953', 100656, 97, 94, '杨琳婷', '123456');
INSERT INTO `student` VALUES ('202252000954', 100006, 24, 42, '施雷美', '123456');
INSERT INTO `student` VALUES ('202252000955', 100554, 97, 25, '余小', '123456');
INSERT INTO `student` VALUES ('202252000956', 100575, 42, 23, '傅建娜', '123456');
INSERT INTO `student` VALUES ('202252000957', 100679, 10, 18, '任明洁', '123456');
INSERT INTO `student` VALUES ('202252000958', 100491, 86, 57, '史雷国', '123456');
INSERT INTO `student` VALUES ('202252000959', 100484, 87, 63, '郎琳丽', '123456');
INSERT INTO `student` VALUES ('202252000960', 100860, 73, 78, '钱涛雅', '123456');
INSERT INTO `student` VALUES ('202252000961', 100427, 96, 75, '吴小', '123456');
INSERT INTO `student` VALUES ('202252000962', 100430, 13, 74, '张亮', '123456');
INSERT INTO `student` VALUES ('202252000963', 100996, 33, 35, '尤露', '123456');
INSERT INTO `student` VALUES ('202252000964', 100968, 51, 10, '齐峰露', '123456');
INSERT INTO `student` VALUES ('202252000965', 100907, 13, 67, '岑艳', '123456');
INSERT INTO `student` VALUES ('202252000966', 100356, 49, 22, '昌芳涛', '123456');
INSERT INTO `student` VALUES ('202252000967', 100398, 77, 61, '唐军', '123456');
INSERT INTO `student` VALUES ('202252000968', 100981, 79, 20, '潘峰艳', '123456');
INSERT INTO `student` VALUES ('202252000969', 100596, 29, 96, '马雷芳', '123456');
INSERT INTO `student` VALUES ('202252000970', 100711, 99, 36, '元明', '123456');
INSERT INTO `student` VALUES ('202252000971', 100641, 42, 73, '雷艳', '123456');
INSERT INTO `student` VALUES ('202252000972', 100963, 37, 18, '陶莉', '123456');
INSERT INTO `student` VALUES ('202252000973', 100110, 67, 53, '杨洁小', '123456');
INSERT INTO `student` VALUES ('202252000974', 100000, 49, 16, '云露', '123456');
INSERT INTO `student` VALUES ('202252000975', 100482, 42, 45, '鲍芳美', '123456');
INSERT INTO `student` VALUES ('202252000976', 100095, 97, 88, '范红雪', '123456');
INSERT INTO `student` VALUES ('202252000977', 100799, 99, 49, '黄丽', '123456');
INSERT INTO `student` VALUES ('202252000978', 100474, 64, 45, '金兰', '123456');
INSERT INTO `student` VALUES ('202252000979', 100069, 46, 59, '柏亮', '123456');
INSERT INTO `student` VALUES ('202252000980', 100481, 36, 75, '尤玲', '123456');
INSERT INTO `student` VALUES ('202252000981', 100767, 48, 49, '罗洁', '123456');
INSERT INTO `student` VALUES ('202252000982', 100054, 28, 87, '张娜', '123456');
INSERT INTO `student` VALUES ('202252000983', 100775, 53, 17, '唐亮磊', '123456');
INSERT INTO `student` VALUES ('202252000984', 100375, 12, 62, '于红', '123456');
INSERT INTO `student` VALUES ('202252000985', 100237, 62, 55, '苗玲', '123456');
INSERT INTO `student` VALUES ('202252000986', 100347, 29, 32, '时建', '123456');
INSERT INTO `student` VALUES ('202252000987', 100739, 86, 34, '云莉敏', '123456');
INSERT INTO `student` VALUES ('202252000988', 100728, 29, 30, '殷峰', '123456');
INSERT INTO `student` VALUES ('202252000989', 100183, 68, 22, '和静婷', '123456');
INSERT INTO `student` VALUES ('202252000990', 100522, 50, 94, '穆艳红', '123456');
INSERT INTO `student` VALUES ('202252000991', 100230, 56, 78, '乐丽琳', '123456');
INSERT INTO `student` VALUES ('202252000992', 100559, 76, 77, '马亮刚', '123456');
INSERT INTO `student` VALUES ('202252000993', 100669, 21, 90, '苏娜', '123456');
INSERT INTO `student` VALUES ('202252000994', 100738, 38, 21, '元小红', '123456');
INSERT INTO `student` VALUES ('202252000995', 100867, 77, 97, '常艳', '123456');
INSERT INTO `student` VALUES ('202252000996', 100358, 80, 46, '齐军', '123456');
INSERT INTO `student` VALUES ('202252000997', 100197, 20, 84, '韦琳', '123456');
INSERT INTO `student` VALUES ('202252000998', 100909, 56, 28, '元晓刚', '123456');
INSERT INTO `student` VALUES ('202252000999', 100505, 79, 36, '韦红静', '123456');
INSERT INTO `student` VALUES ('202252001000', 100899, 53, 71, '彭燕建', '123456');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-03-12 09:07:40', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-03-12 09:07:40', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-03-12 09:07:40', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-03-12 09:07:40', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-03-12 09:07:40', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-03-12 09:07:40', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-03-12 09:07:40', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-12 11:40:24');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-12 11:40:27');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-12 11:40:31');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-12 11:40:35');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2007 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-03-12 09:07:40', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-03-12 09:07:40', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-03-12 09:07:40', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-03-12 09:07:40', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-03-12 09:07:40', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-03-12 09:07:40', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-03-12 09:07:40', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-03-12 09:07:40', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-03-12 09:07:40', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-03-12 09:07:40', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-03-12 09:07:40', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-03-12 09:07:40', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-03-12 09:07:40', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-03-12 09:07:40', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-03-12 09:07:40', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-03-12 09:07:40', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-03-12 09:07:40', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-03-12 09:07:40', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-03-12 09:07:40', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-03-12 09:07:40', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-03-12 09:07:40', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-03-12 09:07:40', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-03-12 09:07:40', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-03-12 09:07:40', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '用户名单管理', 0, 1, 'userslist', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'form', 'admin', '2024-03-12 11:45:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '老师', 2000, 1, 'teacher', 'userslist/teacher/index', NULL, 1, 0, 'C', '0', '0', 'userslist:teacher:list', 'edit', 'admin', '2024-03-12 11:50:28', 'admin', '2024-03-12 11:52:23', '老师菜单');
INSERT INTO `sys_menu` VALUES (2002, '老师查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'userslist:teacher:query', '#', 'admin', '2024-03-12 11:50:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '老师新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'userslist:teacher:add', '#', 'admin', '2024-03-12 11:50:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '老师修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'userslist:teacher:edit', '#', 'admin', '2024-03-12 11:50:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '老师删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'userslist:teacher:remove', '#', 'admin', '2024-03-12 11:50:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '老师导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'userslist:teacher:export', '#', 'admin', '2024-03-12 11:50:28', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-03-12 09:07:40', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-03-12 09:07:40', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"teacher\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:42:53', 830);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"teacher\",\"className\":\"Teacher\",\"columns\":[{\"capJavaField\":\"TeaId\",\"columnComment\":\"老师工号\",\"columnId\":1,\"columnName\":\"tea_id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-12 11:42:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"teaId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TeaName\",\"columnComment\":\"老师姓名\",\"columnId\":2,\"columnName\":\"tea_name\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-12 11:42:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":3,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-12 11:42:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"老师\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"老师\",\"tableId\":1,\"tableName\":\"teacher\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:43:14', 650);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户名单管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"userslist\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:45:32', 241);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"teacher\",\"className\":\"Teacher\",\"columns\":[{\"capJavaField\":\"TeaId\",\"columnComment\":\"老师工号\",\"columnId\":1,\"columnName\":\"tea_id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-12 11:42:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"teaId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-03-12 11:43:13\",\"usableColumn\":false},{\"capJavaField\":\"TeaName\",\"columnComment\":\"老师姓名\",\"columnId\":2,\"columnName\":\"tea_name\",\"columnType\":\"varchar(60)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-12 11:42:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"teaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-03-12 11:43:13\",\"usableColumn\":false},{\"capJavaField\":\"Password\",\"columnComment\":\"密码\",\"columnId\":3,\"columnName\":\"password\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-12 11:42:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"password\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-03-12 11:43:14\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"老师\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"userslist\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.userslist\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:45:49', 640);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"teacher\"}', NULL, 0, NULL, '2024-03-12 11:45:52', 396);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"userslist/teacher/index\",\"createTime\":\"2024-03-12 11:50:28\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"老师\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"teacher\",\"perms\":\"userslist:teacher:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:52:24', 211);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-03-12 09:07:40', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-03-12 09:07:40', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-12 09:07:40', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-03-12 19:40:30', 'admin', '2024-03-12 09:07:40', '', '2024-03-12 11:40:35', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-03-12 09:07:40', 'admin', '2024-03-12 09:07:40', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '老师工号',
  `tea_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '老师姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  PRIMARY KEY (`tea_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('19760532056', '费红琳', '123456');
INSERT INTO `teacher` VALUES ('19760532057', '顾勇敏', '123456');
INSERT INTO `teacher` VALUES ('19760532058', '何娜国', '123456');
INSERT INTO `teacher` VALUES ('19760532059', '岑云', '123456');
INSERT INTO `teacher` VALUES ('19760532060', '陈敏芳', '123456');
INSERT INTO `teacher` VALUES ('19760532061', '尤伟', '123456');
INSERT INTO `teacher` VALUES ('19760532062', '曹雷', '123456');
INSERT INTO `teacher` VALUES ('19760532063', '顾芳', '123456');
INSERT INTO `teacher` VALUES ('19760532064', '罗杰伟', '123456');
INSERT INTO `teacher` VALUES ('19760532065', '凤兰', '123456');
INSERT INTO `teacher` VALUES ('19760532066', '卫雅飞', '123456');
INSERT INTO `teacher` VALUES ('19760532067', '施洁', '123456');
INSERT INTO `teacher` VALUES ('19760532068', '昌松国', '123456');
INSERT INTO `teacher` VALUES ('19760532069', '袁文', '123456');
INSERT INTO `teacher` VALUES ('19760532070', '褚晓小', '123456');
INSERT INTO `teacher` VALUES ('19760532071', '孟杰', '123456');
INSERT INTO `teacher` VALUES ('19760532072', '唐新强', '123456');
INSERT INTO `teacher` VALUES ('19760532073', '廉兰丽', '123456');
INSERT INTO `teacher` VALUES ('19760532074', '邹伟平', '123456');
INSERT INTO `teacher` VALUES ('19760532075', '史小露', '123456');
INSERT INTO `teacher` VALUES ('19760532076', '孙静艳', '123456');
INSERT INTO `teacher` VALUES ('19760532077', '岑雅', '123456');
INSERT INTO `teacher` VALUES ('19760532078', '贺超', '123456');
INSERT INTO `teacher` VALUES ('19760532079', '史新', '123456');
INSERT INTO `teacher` VALUES ('19760532080', '顾文', '123456');
INSERT INTO `teacher` VALUES ('19760532081', '俞涛雪', '123456');
INSERT INTO `teacher` VALUES ('19760532082', '顾兰', '123456');
INSERT INTO `teacher` VALUES ('19760532083', '穆军超', '123456');
INSERT INTO `teacher` VALUES ('19760532084', '岑琳晓', '123456');
INSERT INTO `teacher` VALUES ('19760532085', '吕婷', '123456');
INSERT INTO `teacher` VALUES ('19760532086', '郑明小', '123456');
INSERT INTO `teacher` VALUES ('19760532087', '邬磊红', '123456');
INSERT INTO `teacher` VALUES ('19760532088', '贺平', '123456');
INSERT INTO `teacher` VALUES ('19760532089', '卜松燕', '123456');
INSERT INTO `teacher` VALUES ('19760532090', '严艳美', '123456');
INSERT INTO `teacher` VALUES ('19760532091', '时强', '123456');
INSERT INTO `teacher` VALUES ('19760532092', '苗雷红', '123456');
INSERT INTO `teacher` VALUES ('19760532093', '水美', '123456');
INSERT INTO `teacher` VALUES ('19760532094', '戚红雪', '123456');
INSERT INTO `teacher` VALUES ('19760532095', '褚娜峰', '123456');
INSERT INTO `teacher` VALUES ('19760532096', '赵新', '123456');
INSERT INTO `teacher` VALUES ('19760532097', '凤玲小', '123456');
INSERT INTO `teacher` VALUES ('19760532098', '窦勇', '123456');
INSERT INTO `teacher` VALUES ('19760532099', '凤军露', '123456');
INSERT INTO `teacher` VALUES ('19760532100', '张婷建', '123456');
INSERT INTO `teacher` VALUES ('19760532101', '吴雅', '123456');
INSERT INTO `teacher` VALUES ('19760532102', '沈平', '123456');
INSERT INTO `teacher` VALUES ('19760532103', '钱雪', '123456');
INSERT INTO `teacher` VALUES ('19760532104', '葛小', '123456');
INSERT INTO `teacher` VALUES ('19760532105', '罗婷涛', '123456');
INSERT INTO `teacher` VALUES ('19760532106', '汤晓静', '123456');
INSERT INTO `teacher` VALUES ('19760532107', '皮勇琳', '123456');
INSERT INTO `teacher` VALUES ('19760532108', '谢平明', '123456');
INSERT INTO `teacher` VALUES ('19760532109', '于雅娜', '123456');
INSERT INTO `teacher` VALUES ('19760532110', '蒋美磊', '123456');
INSERT INTO `teacher` VALUES ('19760532111', '马敏燕', '123456');
INSERT INTO `teacher` VALUES ('19760532112', '韩平杰', '123456');
INSERT INTO `teacher` VALUES ('19760532113', '卞文', '123456');
INSERT INTO `teacher` VALUES ('19760532114', '任雷燕', '123456');
INSERT INTO `teacher` VALUES ('19760532115', '吴强婷', '123456');
INSERT INTO `teacher` VALUES ('19760532116', '水芳', '123456');
INSERT INTO `teacher` VALUES ('19760532117', '吕雷', '123456');
INSERT INTO `teacher` VALUES ('19760532118', '安强平', '123456');
INSERT INTO `teacher` VALUES ('19760532119', '尹磊国', '123456');
INSERT INTO `teacher` VALUES ('19760532120', '魏强文', '123456');
INSERT INTO `teacher` VALUES ('19760532121', '杨明莉', '123456');
INSERT INTO `teacher` VALUES ('19760532122', '汤静新', '123456');
INSERT INTO `teacher` VALUES ('19760532123', '余敏', '123456');
INSERT INTO `teacher` VALUES ('19760532124', '郑娜峰', '123456');
INSERT INTO `teacher` VALUES ('19760532125', '曹云', '123456');
INSERT INTO `teacher` VALUES ('19760532126', '史超', '123456');
INSERT INTO `teacher` VALUES ('19760532127', '孟文', '123456');
INSERT INTO `teacher` VALUES ('19760532128', '史新兰', '123456');
INSERT INTO `teacher` VALUES ('19760532129', '潘玲平', '123456');
INSERT INTO `teacher` VALUES ('19760532130', '穆勇飞', '123456');
INSERT INTO `teacher` VALUES ('19760532131', '岑杰', '123456');
INSERT INTO `teacher` VALUES ('19760532132', '冯琳静', '123456');
INSERT INTO `teacher` VALUES ('19760532133', '殷平琳', '123456');
INSERT INTO `teacher` VALUES ('19760532134', '章军', '123456');
INSERT INTO `teacher` VALUES ('19760532135', '鲍超', '123456');
INSERT INTO `teacher` VALUES ('19760532136', '柳亮刚', '123456');
INSERT INTO `teacher` VALUES ('19760532137', '水露云', '123456');
INSERT INTO `teacher` VALUES ('19760532138', '戚勇晓', '123456');
INSERT INTO `teacher` VALUES ('19760532139', '钱明', '123456');
INSERT INTO `teacher` VALUES ('19760532140', '乐燕', '123456');
INSERT INTO `teacher` VALUES ('19760532141', '和勇雪', '123456');
INSERT INTO `teacher` VALUES ('19760532142', '毕涛杰', '123456');
INSERT INTO `teacher` VALUES ('19760532143', '葛磊', '123456');
INSERT INTO `teacher` VALUES ('19760532144', '郑强', '123456');
INSERT INTO `teacher` VALUES ('19760532145', '韩燕', '123456');
INSERT INTO `teacher` VALUES ('19760532146', '邹国雪', '123456');
INSERT INTO `teacher` VALUES ('19760532147', '尹勇美', '123456');
INSERT INTO `teacher` VALUES ('19760532148', '戚建莉', '123456');
INSERT INTO `teacher` VALUES ('19760532149', '齐松伟', '123456');
INSERT INTO `teacher` VALUES ('19760532150', '陈娜红', '123456');
INSERT INTO `teacher` VALUES ('19760532151', '孟兰', '123456');
INSERT INTO `teacher` VALUES ('19760532152', '昌丽', '123456');
INSERT INTO `teacher` VALUES ('19760532153', '韦云', '123456');
INSERT INTO `teacher` VALUES ('19760532154', '赵国', '123456');
INSERT INTO `teacher` VALUES ('19760532155', '时建琳', '123456');
INSERT INTO `teacher` VALUES ('19760532156', '穆小', '123456');
INSERT INTO `teacher` VALUES ('19760532157', '何伟磊', '123456');
INSERT INTO `teacher` VALUES ('19760532158', '章建伟', '123456');
INSERT INTO `teacher` VALUES ('19760532159', '陈文小', '123456');
INSERT INTO `teacher` VALUES ('19760532160', '孔丽军', '123456');
INSERT INTO `teacher` VALUES ('19760532161', '魏峰', '123456');
INSERT INTO `teacher` VALUES ('19760532162', '彭兰敏', '123456');
INSERT INTO `teacher` VALUES ('19760532163', '罗雷', '123456');
INSERT INTO `teacher` VALUES ('19760532164', '陶松飞', '123456');
INSERT INTO `teacher` VALUES ('19760532165', '韩艳飞', '123456');
INSERT INTO `teacher` VALUES ('19760532166', '吕小', '123456');
INSERT INTO `teacher` VALUES ('19760532167', '金莉红', '123456');
INSERT INTO `teacher` VALUES ('19760532168', '黄云新', '123456');
INSERT INTO `teacher` VALUES ('19760532169', '苏莉小', '123456');
INSERT INTO `teacher` VALUES ('19760532170', '和琳', '123456');
INSERT INTO `teacher` VALUES ('19760532171', '俞燕云', '123456');
INSERT INTO `teacher` VALUES ('19760532172', '俞兰飞', '123456');
INSERT INTO `teacher` VALUES ('19760532173', '常杰', '123456');
INSERT INTO `teacher` VALUES ('19760532174', '薛露', '123456');
INSERT INTO `teacher` VALUES ('19760532175', '戚杰强', '123456');
INSERT INTO `teacher` VALUES ('19760532176', '雷雷', '123456');
INSERT INTO `teacher` VALUES ('19760532177', '金红小', '123456');
INSERT INTO `teacher` VALUES ('19760532178', '酆辉洁', '123456');
INSERT INTO `teacher` VALUES ('19760532179', '唐洁雪', '123456');
INSERT INTO `teacher` VALUES ('19760532180', '孟雅云', '123456');
INSERT INTO `teacher` VALUES ('19760532181', '皮雷', '123456');
INSERT INTO `teacher` VALUES ('19760532182', '严松', '123456');
INSERT INTO `teacher` VALUES ('19760532183', '余云', '123456');
INSERT INTO `teacher` VALUES ('19760532184', '郝松静', '123456');
INSERT INTO `teacher` VALUES ('19760532185', '韩勇', '123456');
INSERT INTO `teacher` VALUES ('19760532186', '邬美云', '123456');
INSERT INTO `teacher` VALUES ('19760532187', '方国晓', '123456');
INSERT INTO `teacher` VALUES ('19760532188', '于松平', '123456');
INSERT INTO `teacher` VALUES ('19760532189', '蒋涛小', '123456');
INSERT INTO `teacher` VALUES ('19760532190', '薛伟洁', '123456');
INSERT INTO `teacher` VALUES ('19760532191', '罗晓峰', '123456');
INSERT INTO `teacher` VALUES ('19760532192', '蒋娜', '123456');
INSERT INTO `teacher` VALUES ('19760532193', '乐静', '123456');
INSERT INTO `teacher` VALUES ('19760532194', '许新琳', '123456');
INSERT INTO `teacher` VALUES ('19760532195', '鲁明', '123456');
INSERT INTO `teacher` VALUES ('19760532196', '俞超静', '123456');
INSERT INTO `teacher` VALUES ('19760532197', '金芳', '123456');
INSERT INTO `teacher` VALUES ('19760532198', '皮燕', '123456');
INSERT INTO `teacher` VALUES ('19760532199', '周云涛', '123456');
INSERT INTO `teacher` VALUES ('19760532200', '赵亮', '123456');
INSERT INTO `teacher` VALUES ('19760532201', '常芳建', '123456');
INSERT INTO `teacher` VALUES ('19760532202', '窦超磊', '123456');
INSERT INTO `teacher` VALUES ('19760532203', '潘洁涛', '123456');
INSERT INTO `teacher` VALUES ('19760532204', '元飞芳', '123456');
INSERT INTO `teacher` VALUES ('19760532205', '史杰辉', '123456');
INSERT INTO `teacher` VALUES ('19760532206', '卜晓', '123456');
INSERT INTO `teacher` VALUES ('19760532207', '邬勇', '123456');
INSERT INTO `teacher` VALUES ('19760532208', '皮雪', '123456');
INSERT INTO `teacher` VALUES ('19760532209', '姜军', '123456');
INSERT INTO `teacher` VALUES ('19760532210', '金露', '123456');
INSERT INTO `teacher` VALUES ('19760532211', '张娜燕', '123456');
INSERT INTO `teacher` VALUES ('19760532212', '郑雪', '123456');
INSERT INTO `teacher` VALUES ('19760532213', '柳敏勇', '123456');
INSERT INTO `teacher` VALUES ('19760532214', '花雅', '123456');
INSERT INTO `teacher` VALUES ('19760532215', '陈飞', '123456');
INSERT INTO `teacher` VALUES ('19760532216', '俞国勇', '123456');
INSERT INTO `teacher` VALUES ('19760532217', '方国', '123456');
INSERT INTO `teacher` VALUES ('19760532218', '史琳勇', '123456');
INSERT INTO `teacher` VALUES ('19760532219', '孔红', '123456');
INSERT INTO `teacher` VALUES ('19760532220', '余强', '123456');
INSERT INTO `teacher` VALUES ('19760532221', '鲁军', '123456');
INSERT INTO `teacher` VALUES ('19760532222', '殷莉', '123456');
INSERT INTO `teacher` VALUES ('19760532223', '郝勇', '123456');
INSERT INTO `teacher` VALUES ('19760532224', '苏雷', '123456');
INSERT INTO `teacher` VALUES ('19760532225', '范亮明', '123456');
INSERT INTO `teacher` VALUES ('19760532226', '苗飞莉', '123456');
INSERT INTO `teacher` VALUES ('19760532227', '平丽军', '123456');
INSERT INTO `teacher` VALUES ('19760532228', '曹洁伟', '123456');
INSERT INTO `teacher` VALUES ('19760532229', '鲁娜静', '123456');
INSERT INTO `teacher` VALUES ('19760532230', '薛峰', '123456');
INSERT INTO `teacher` VALUES ('19760532231', '陈莉', '123456');
INSERT INTO `teacher` VALUES ('19760532232', '鲁雅', '123456');
INSERT INTO `teacher` VALUES ('19760532233', '时超丽', '123456');
INSERT INTO `teacher` VALUES ('19760532234', '雷飞勇', '123456');
INSERT INTO `teacher` VALUES ('19760532235', '傅文松', '123456');
INSERT INTO `teacher` VALUES ('19760532236', '常磊晓', '123456');
INSERT INTO `teacher` VALUES ('19760532237', '孔伟', '123456');
INSERT INTO `teacher` VALUES ('19760532238', '顾雪雷', '123456');
INSERT INTO `teacher` VALUES ('19760532239', '葛玲辉', '123456');
INSERT INTO `teacher` VALUES ('19760532240', '冯丽', '123456');
INSERT INTO `teacher` VALUES ('19760532241', '华平', '123456');
INSERT INTO `teacher` VALUES ('19760532242', '俞玲', '123456');
INSERT INTO `teacher` VALUES ('19760532243', '昌娜', '123456');
INSERT INTO `teacher` VALUES ('19760532244', '和雪', '123456');
INSERT INTO `teacher` VALUES ('19760532245', '卞国文', '123456');
INSERT INTO `teacher` VALUES ('19760532246', '伍明杰', '123456');
INSERT INTO `teacher` VALUES ('19760532247', '张强杰', '123456');
INSERT INTO `teacher` VALUES ('19760532248', '平莉婷', '123456');
INSERT INTO `teacher` VALUES ('19760532249', '尤云', '123456');
INSERT INTO `teacher` VALUES ('19760532250', '邹莉芳', '123456');
INSERT INTO `teacher` VALUES ('19760532251', '唐雪辉', '123456');
INSERT INTO `teacher` VALUES ('19760532252', '凤洁', '123456');
INSERT INTO `teacher` VALUES ('19760532253', '周云', '123456');
INSERT INTO `teacher` VALUES ('19760532254', '沈峰军', '123456');
INSERT INTO `teacher` VALUES ('19760532255', '冯兰', '123456');
INSERT INTO `teacher` VALUES ('19760532256', '昌婷平', '123456');
INSERT INTO `teacher` VALUES ('19760532257', '金玲', '123456');
INSERT INTO `teacher` VALUES ('19760532258', '戚勇', '123456');
INSERT INTO `teacher` VALUES ('19760532259', '韦美', '123456');
INSERT INTO `teacher` VALUES ('19760532260', '邬刚美', '123456');
INSERT INTO `teacher` VALUES ('19760532261', '窦露琳', '123456');
INSERT INTO `teacher` VALUES ('19760532262', '平云磊', '123456');
INSERT INTO `teacher` VALUES ('19760532263', '滕刚', '123456');
INSERT INTO `teacher` VALUES ('19760532264', '余莉晓', '123456');
INSERT INTO `teacher` VALUES ('19760532265', '施松超', '123456');
INSERT INTO `teacher` VALUES ('19760532266', '乐雷明', '123456');
INSERT INTO `teacher` VALUES ('19760532267', '倪雅兰', '123456');
INSERT INTO `teacher` VALUES ('19760532268', '花平峰', '123456');
INSERT INTO `teacher` VALUES ('19760532269', '曹勇', '123456');
INSERT INTO `teacher` VALUES ('19760532270', '孙玲亮', '123456');
INSERT INTO `teacher` VALUES ('19760532271', '尹超建', '123456');
INSERT INTO `teacher` VALUES ('19760532272', '凤涛新', '123456');
INSERT INTO `teacher` VALUES ('19760532273', '严娜', '123456');
INSERT INTO `teacher` VALUES ('19760532274', '张国', '123456');
INSERT INTO `teacher` VALUES ('19760532275', '廉莉', '123456');
INSERT INTO `teacher` VALUES ('19760532276', '滕刚', '123456');
INSERT INTO `teacher` VALUES ('19760532277', '沈文', '123456');
INSERT INTO `teacher` VALUES ('19760532278', '韩峰', '123456');
INSERT INTO `teacher` VALUES ('19760532279', '王雪', '123456');
INSERT INTO `teacher` VALUES ('19760532280', '章红', '123456');
INSERT INTO `teacher` VALUES ('19760532281', '邬刚', '123456');
INSERT INTO `teacher` VALUES ('19760532282', '奚洁', '123456');
INSERT INTO `teacher` VALUES ('19760532283', '韩超辉', '123456');
INSERT INTO `teacher` VALUES ('19760532284', '陈军莉', '123456');
INSERT INTO `teacher` VALUES ('19760532285', '雷云玲', '123456');
INSERT INTO `teacher` VALUES ('19760532286', '郎燕雅', '123456');
INSERT INTO `teacher` VALUES ('19760532287', '范国婷', '123456');
INSERT INTO `teacher` VALUES ('19760532288', '谢晓峰', '123456');
INSERT INTO `teacher` VALUES ('19760532289', '任杰', '123456');
INSERT INTO `teacher` VALUES ('19760532290', '苗文', '123456');
INSERT INTO `teacher` VALUES ('19760532291', '穆辉兰', '123456');
INSERT INTO `teacher` VALUES ('19760532292', '葛玲敏', '123456');
INSERT INTO `teacher` VALUES ('19760532293', '卞玲杰', '123456');
INSERT INTO `teacher` VALUES ('19760532294', '褚露刚', '123456');
INSERT INTO `teacher` VALUES ('19760532295', '费飞', '123456');
INSERT INTO `teacher` VALUES ('19760532296', '陈超', '123456');
INSERT INTO `teacher` VALUES ('19760532297', '花辉红', '123456');
INSERT INTO `teacher` VALUES ('19760532298', '郑磊松', '123456');
INSERT INTO `teacher` VALUES ('19760532299', '姜涛', '123456');
INSERT INTO `teacher` VALUES ('19760532300', '柳敏', '123456');
INSERT INTO `teacher` VALUES ('19760532301', '金雅兰', '123456');
INSERT INTO `teacher` VALUES ('19760532302', '孙杰小', '123456');
INSERT INTO `teacher` VALUES ('19760532303', '卫美', '123456');
INSERT INTO `teacher` VALUES ('19760532304', '李超', '123456');
INSERT INTO `teacher` VALUES ('19760532305', '章强', '123456');
INSERT INTO `teacher` VALUES ('19760532306', '黄红', '123456');
INSERT INTO `teacher` VALUES ('19760532307', '齐艳琳', '123456');
INSERT INTO `teacher` VALUES ('19760532308', '张强', '123456');
INSERT INTO `teacher` VALUES ('19760532309', '毕雅丽', '123456');
INSERT INTO `teacher` VALUES ('19760532310', '郑亮', '123456');
INSERT INTO `teacher` VALUES ('19760532311', '于敏', '123456');
INSERT INTO `teacher` VALUES ('19760532312', '元芳刚', '123456');
INSERT INTO `teacher` VALUES ('19760532313', '秦强晓', '123456');
INSERT INTO `teacher` VALUES ('19760532314', '伍军', '123456');
INSERT INTO `teacher` VALUES ('19760532315', '岑伟', '123456');
INSERT INTO `teacher` VALUES ('19760532316', '倪燕', '123456');
INSERT INTO `teacher` VALUES ('19760532317', '郑勇雷', '123456');
INSERT INTO `teacher` VALUES ('19760532318', '沈莉晓', '123456');
INSERT INTO `teacher` VALUES ('19760532319', '水刚', '123456');
INSERT INTO `teacher` VALUES ('19760532320', '苏雪', '123456');
INSERT INTO `teacher` VALUES ('19760532321', '凤峰', '123456');
INSERT INTO `teacher` VALUES ('19760532322', '滕洁', '123456');
INSERT INTO `teacher` VALUES ('19760532323', '顾燕莉', '123456');
INSERT INTO `teacher` VALUES ('19760532324', '毕伟静', '123456');
INSERT INTO `teacher` VALUES ('19760532325', '赵国军', '123456');
INSERT INTO `teacher` VALUES ('19760532326', '黄飞', '123456');
INSERT INTO `teacher` VALUES ('19760532327', '黄小', '123456');
INSERT INTO `teacher` VALUES ('19760532328', '罗勇芳', '123456');
INSERT INTO `teacher` VALUES ('19760532329', '任雪建', '123456');
INSERT INTO `teacher` VALUES ('19760532330', '廉辉雷', '123456');
INSERT INTO `teacher` VALUES ('19760532331', '邹磊松', '123456');
INSERT INTO `teacher` VALUES ('19760532332', '元丽刚', '123456');
INSERT INTO `teacher` VALUES ('19760532333', '许洁小', '123456');
INSERT INTO `teacher` VALUES ('19760532334', '喻国娜', '123456');
INSERT INTO `teacher` VALUES ('19760532335', '凤刚', '123456');
INSERT INTO `teacher` VALUES ('19760532336', '唐雷', '123456');
INSERT INTO `teacher` VALUES ('19760532337', '俞杰', '123456');
INSERT INTO `teacher` VALUES ('19760532338', '马露', '123456');
INSERT INTO `teacher` VALUES ('19760532339', '褚亮雪', '123456');
INSERT INTO `teacher` VALUES ('19760532340', '鲁刚', '123456');
INSERT INTO `teacher` VALUES ('19760532341', '元国', '123456');
INSERT INTO `teacher` VALUES ('19760532342', '陈红平', '123456');
INSERT INTO `teacher` VALUES ('19760532343', '许新', '123456');
INSERT INTO `teacher` VALUES ('19760532344', '萧美亮', '123456');
INSERT INTO `teacher` VALUES ('19760532345', '范晓', '123456');
INSERT INTO `teacher` VALUES ('19760532346', '郝婷艳', '123456');
INSERT INTO `teacher` VALUES ('19760532347', '伍军明', '123456');
INSERT INTO `teacher` VALUES ('19760532348', '陈露雅', '123456');
INSERT INTO `teacher` VALUES ('19760532349', '尤琳亮', '123456');
INSERT INTO `teacher` VALUES ('19760532350', '邬婷', '123456');
INSERT INTO `teacher` VALUES ('19760532351', '顾强洁', '123456');
INSERT INTO `teacher` VALUES ('19760532352', '傅建', '123456');
INSERT INTO `teacher` VALUES ('19760532353', '施亮', '123456');
INSERT INTO `teacher` VALUES ('19760532354', '水强', '123456');
INSERT INTO `teacher` VALUES ('19760532355', '钱燕', '123456');
INSERT INTO `teacher` VALUES ('19760532356', '何辉', '123456');
INSERT INTO `teacher` VALUES ('19760532357', '凤杰国', '123456');
INSERT INTO `teacher` VALUES ('19760532358', '韦峰伟', '123456');
INSERT INTO `teacher` VALUES ('19760532359', '黄伟', '123456');
INSERT INTO `teacher` VALUES ('19760532360', '罗莉燕', '123456');
INSERT INTO `teacher` VALUES ('19760532361', '殷雪', '123456');
INSERT INTO `teacher` VALUES ('19760532362', '岑美', '123456');
INSERT INTO `teacher` VALUES ('19760532363', '杨洁晓', '123456');
INSERT INTO `teacher` VALUES ('19760532364', '雷静杰', '123456');
INSERT INTO `teacher` VALUES ('19760532365', '赵小', '123456');
INSERT INTO `teacher` VALUES ('19760532366', '沈杰婷', '123456');
INSERT INTO `teacher` VALUES ('19760532367', '韩兰建', '123456');
INSERT INTO `teacher` VALUES ('19760532368', '陈松雷', '123456');
INSERT INTO `teacher` VALUES ('19760532369', '薛伟杰', '123456');
INSERT INTO `teacher` VALUES ('19760532370', '柳丽露', '123456');
INSERT INTO `teacher` VALUES ('19760532371', '窦峰燕', '123456');
INSERT INTO `teacher` VALUES ('19760532372', '鲍琳磊', '123456');
INSERT INTO `teacher` VALUES ('19760532373', '殷露', '123456');
INSERT INTO `teacher` VALUES ('19760532374', '姜洁', '123456');
INSERT INTO `teacher` VALUES ('19760532375', '窦兰飞', '123456');
INSERT INTO `teacher` VALUES ('19760532376', '曹勇杰', '123456');
INSERT INTO `teacher` VALUES ('19760532377', '常莉静', '123456');
INSERT INTO `teacher` VALUES ('19760532378', '许云', '123456');
INSERT INTO `teacher` VALUES ('19760532379', '赵雅丽', '123456');
INSERT INTO `teacher` VALUES ('19760532380', '范国露', '123456');
INSERT INTO `teacher` VALUES ('19760532381', '吕艳', '123456');
INSERT INTO `teacher` VALUES ('19760532382', '穆洁伟', '123456');
INSERT INTO `teacher` VALUES ('19760532383', '顾平磊', '123456');
INSERT INTO `teacher` VALUES ('19760532384', '卜婷峰', '123456');
INSERT INTO `teacher` VALUES ('19760532385', '尤玲燕', '123456');
INSERT INTO `teacher` VALUES ('19760532386', '黄琳', '123456');
INSERT INTO `teacher` VALUES ('19760532387', '陶新', '123456');
INSERT INTO `teacher` VALUES ('19760532388', '倪文丽', '123456');
INSERT INTO `teacher` VALUES ('19760532389', '赵涛燕', '123456');
INSERT INTO `teacher` VALUES ('19760532390', '范燕峰', '123456');
INSERT INTO `teacher` VALUES ('19760532391', '周雅晓', '123456');
INSERT INTO `teacher` VALUES ('19760532392', '谢杰洁', '123456');
INSERT INTO `teacher` VALUES ('19760532393', '皮莉敏', '123456');
INSERT INTO `teacher` VALUES ('19760532394', '金敏', '123456');
INSERT INTO `teacher` VALUES ('19760532395', '费艳', '123456');
INSERT INTO `teacher` VALUES ('19760532396', '郎国露', '123456');
INSERT INTO `teacher` VALUES ('19760532397', '奚国伟', '123456');
INSERT INTO `teacher` VALUES ('19760532398', '平静', '123456');
INSERT INTO `teacher` VALUES ('19760532399', '鲁琳', '123456');
INSERT INTO `teacher` VALUES ('19760532400', '蒋勇玲', '123456');
INSERT INTO `teacher` VALUES ('19760532401', '窦雅', '123456');
INSERT INTO `teacher` VALUES ('19760532402', '方新', '123456');
INSERT INTO `teacher` VALUES ('19760532403', '酆峰艳', '123456');
INSERT INTO `teacher` VALUES ('19760532404', '韩晓涛', '123456');
INSERT INTO `teacher` VALUES ('19760532405', '姜伟婷', '123456');
INSERT INTO `teacher` VALUES ('19760532406', '郑露国', '123456');
INSERT INTO `teacher` VALUES ('19760532407', '吴静露', '123456');
INSERT INTO `teacher` VALUES ('19760532408', '鲍艳', '123456');
INSERT INTO `teacher` VALUES ('19760532409', '卞玲丽', '123456');
INSERT INTO `teacher` VALUES ('19760532410', '潘飞', '123456');
INSERT INTO `teacher` VALUES ('19760532411', '于婷', '123456');
INSERT INTO `teacher` VALUES ('19760532412', '昌建', '123456');
INSERT INTO `teacher` VALUES ('19760532413', '金明飞', '123456');
INSERT INTO `teacher` VALUES ('19760532414', '任兰云', '123456');
INSERT INTO `teacher` VALUES ('19760532415', '马芳琳', '123456');
INSERT INTO `teacher` VALUES ('19760532416', '潘辉敏', '123456');
INSERT INTO `teacher` VALUES ('19760532417', '余敏建', '123456');
INSERT INTO `teacher` VALUES ('19760532418', '王雷明', '123456');
INSERT INTO `teacher` VALUES ('19760532419', '陶敏玲', '123456');
INSERT INTO `teacher` VALUES ('19760532420', '卫松', '123456');
INSERT INTO `teacher` VALUES ('19760532421', '沈亮', '123456');
INSERT INTO `teacher` VALUES ('19760532422', '水美燕', '123456');
INSERT INTO `teacher` VALUES ('19760532423', '马燕洁', '123456');
INSERT INTO `teacher` VALUES ('19760532424', '赵敏建', '123456');
INSERT INTO `teacher` VALUES ('19760532425', '张新', '123456');
INSERT INTO `teacher` VALUES ('19760532426', '伍静国', '123456');
INSERT INTO `teacher` VALUES ('19760532427', '周雅平', '123456');
INSERT INTO `teacher` VALUES ('19760532428', '郎涛云', '123456');
INSERT INTO `teacher` VALUES ('19760532429', '苗婷莉', '123456');
INSERT INTO `teacher` VALUES ('19760532430', '于亮明', '123456');
INSERT INTO `teacher` VALUES ('19760532431', '安平美', '123456');
INSERT INTO `teacher` VALUES ('19760532432', '穆飞', '123456');
INSERT INTO `teacher` VALUES ('19760532433', '鲁敏平', '123456');
INSERT INTO `teacher` VALUES ('19760532434', '常露明', '123456');
INSERT INTO `teacher` VALUES ('19760532435', '和云莉', '123456');
INSERT INTO `teacher` VALUES ('19760532436', '昌松芳', '123456');
INSERT INTO `teacher` VALUES ('19760532437', '倪露', '123456');
INSERT INTO `teacher` VALUES ('19760532438', '余玲兰', '123456');
INSERT INTO `teacher` VALUES ('19760532439', '水杰', '123456');
INSERT INTO `teacher` VALUES ('19760532440', '柳敏芳', '123456');
INSERT INTO `teacher` VALUES ('19760532441', '谢峰', '123456');
INSERT INTO `teacher` VALUES ('19760532442', '岑晓超', '123456');
INSERT INTO `teacher` VALUES ('19760532443', '萧平', '123456');
INSERT INTO `teacher` VALUES ('19760532444', '马云松', '123456');
INSERT INTO `teacher` VALUES ('19760532445', '许强', '123456');
INSERT INTO `teacher` VALUES ('19760532446', '水松', '123456');
INSERT INTO `teacher` VALUES ('19760532447', '葛松敏', '123456');
INSERT INTO `teacher` VALUES ('19760532448', '酆松勇', '123456');
INSERT INTO `teacher` VALUES ('19760532449', '张文杰', '123456');
INSERT INTO `teacher` VALUES ('19760532450', '元玲', '123456');
INSERT INTO `teacher` VALUES ('19760532451', '费勇', '123456');
INSERT INTO `teacher` VALUES ('19760532452', '花勇', '123456');
INSERT INTO `teacher` VALUES ('19760532453', '费雷', '123456');
INSERT INTO `teacher` VALUES ('19760532454', '卫云', '123456');
INSERT INTO `teacher` VALUES ('19760532455', '费婷', '123456');
INSERT INTO `teacher` VALUES ('19760532456', '康琳', '123456');
INSERT INTO `teacher` VALUES ('19760532457', '皮军文', '123456');
INSERT INTO `teacher` VALUES ('19760532458', '郎琳涛', '123456');
INSERT INTO `teacher` VALUES ('19760532459', '郎琳', '123456');
INSERT INTO `teacher` VALUES ('19760532460', '葛亮', '123456');
INSERT INTO `teacher` VALUES ('19760532461', '柳雅', '123456');
INSERT INTO `teacher` VALUES ('19760532462', '苗建', '123456');
INSERT INTO `teacher` VALUES ('19760532463', '喻婷磊', '123456');
INSERT INTO `teacher` VALUES ('19760532464', '秦磊', '123456');
INSERT INTO `teacher` VALUES ('19760532465', '郑莉', '123456');
INSERT INTO `teacher` VALUES ('19760532466', '顾新勇', '123456');
INSERT INTO `teacher` VALUES ('19760532467', '陶超飞', '123456');
INSERT INTO `teacher` VALUES ('19760532468', '康兰飞', '123456');
INSERT INTO `teacher` VALUES ('19760532469', '潘燕', '123456');
INSERT INTO `teacher` VALUES ('19760532470', '于红美', '123456');
INSERT INTO `teacher` VALUES ('19760532471', '潘敏', '123456');
INSERT INTO `teacher` VALUES ('19760532472', '俞平静', '123456');
INSERT INTO `teacher` VALUES ('19760532473', '陶涛', '123456');
INSERT INTO `teacher` VALUES ('19760532474', '邬洁建', '123456');
INSERT INTO `teacher` VALUES ('19760532475', '郝艳勇', '123456');
INSERT INTO `teacher` VALUES ('19760532476', '褚明洁', '123456');
INSERT INTO `teacher` VALUES ('19760532477', '滕雪娜', '123456');
INSERT INTO `teacher` VALUES ('19760532478', '冯涛', '123456');
INSERT INTO `teacher` VALUES ('19760532479', '薛辉', '123456');
INSERT INTO `teacher` VALUES ('19760532480', '苏国兰', '123456');
INSERT INTO `teacher` VALUES ('19760532481', '方明', '123456');
INSERT INTO `teacher` VALUES ('19760532482', '卞莉强', '123456');
INSERT INTO `teacher` VALUES ('19760532483', '邬莉静', '123456');
INSERT INTO `teacher` VALUES ('19760532484', '凤雅', '123456');
INSERT INTO `teacher` VALUES ('19760532485', '柏娜', '123456');
INSERT INTO `teacher` VALUES ('19760532486', '毕娜', '123456');
INSERT INTO `teacher` VALUES ('19760532487', '彭丽涛', '123456');
INSERT INTO `teacher` VALUES ('19760532488', '柳松云', '123456');
INSERT INTO `teacher` VALUES ('19760532489', '潘军', '123456');
INSERT INTO `teacher` VALUES ('19760532490', '余明露', '123456');
INSERT INTO `teacher` VALUES ('19760532491', '郑新', '123456');
INSERT INTO `teacher` VALUES ('19760532492', '曹美', '123456');
INSERT INTO `teacher` VALUES ('19760532493', '张峰', '123456');
INSERT INTO `teacher` VALUES ('19760532494', '倪磊', '123456');
INSERT INTO `teacher` VALUES ('19760532495', '褚建芳', '123456');
INSERT INTO `teacher` VALUES ('19760532496', '杨建燕', '123456');
INSERT INTO `teacher` VALUES ('19760532497', '殷飞', '123456');
INSERT INTO `teacher` VALUES ('19760532498', '卫敏', '123456');
INSERT INTO `teacher` VALUES ('19760532499', '余芳', '123456');
INSERT INTO `teacher` VALUES ('19760532500', '窦艳新', '123456');
INSERT INTO `teacher` VALUES ('19760532501', '尹洁', '123456');
INSERT INTO `teacher` VALUES ('19760532502', '尹文', '123456');
INSERT INTO `teacher` VALUES ('19760532503', '姜雷文', '123456');
INSERT INTO `teacher` VALUES ('19760532504', '鲁燕', '123456');
INSERT INTO `teacher` VALUES ('19760532505', '褚洁', '123456');
INSERT INTO `teacher` VALUES ('19760532506', '蒋丽明', '123456');
INSERT INTO `teacher` VALUES ('19760532507', '苗雪兰', '123456');
INSERT INTO `teacher` VALUES ('19760532508', '贺露娜', '123456');
INSERT INTO `teacher` VALUES ('19760532509', '钱兰新', '123456');
INSERT INTO `teacher` VALUES ('19760532510', '萧强', '123456');
INSERT INTO `teacher` VALUES ('19760532511', '皮明', '123456');
INSERT INTO `teacher` VALUES ('19760532512', '康涛', '123456');
INSERT INTO `teacher` VALUES ('19760532513', '穆刚', '123456');
INSERT INTO `teacher` VALUES ('19760532514', '毕建芳', '123456');
INSERT INTO `teacher` VALUES ('19760532515', '吕勇小', '123456');
INSERT INTO `teacher` VALUES ('19760532516', '朱兰', '123456');
INSERT INTO `teacher` VALUES ('19760532517', '马云', '123456');
INSERT INTO `teacher` VALUES ('19760532518', '尤国', '123456');
INSERT INTO `teacher` VALUES ('19760532519', '张勇云', '123456');
INSERT INTO `teacher` VALUES ('19760532520', '罗静涛', '123456');
INSERT INTO `teacher` VALUES ('19760532521', '穆亮', '123456');
INSERT INTO `teacher` VALUES ('19760532522', '许伟辉', '123456');
INSERT INTO `teacher` VALUES ('19760532523', '陈娜涛', '123456');
INSERT INTO `teacher` VALUES ('19760532524', '苏刚磊', '123456');
INSERT INTO `teacher` VALUES ('19760532525', '雷亮', '123456');
INSERT INTO `teacher` VALUES ('19760532526', '伍莉飞', '123456');
INSERT INTO `teacher` VALUES ('19760532527', '窦文丽', '123456');
INSERT INTO `teacher` VALUES ('19760532528', '马艳娜', '123456');
INSERT INTO `teacher` VALUES ('19760532529', '穆建', '123456');
INSERT INTO `teacher` VALUES ('19760532530', '范雪', '123456');
INSERT INTO `teacher` VALUES ('19760532531', '吕新平', '123456');
INSERT INTO `teacher` VALUES ('19760532532', '邬军', '123456');
INSERT INTO `teacher` VALUES ('19760532533', '雷晓刚', '123456');
INSERT INTO `teacher` VALUES ('19760532534', '汤军辉', '123456');
INSERT INTO `teacher` VALUES ('19760532535', '蒋燕丽', '123456');
INSERT INTO `teacher` VALUES ('19760532536', '薛峰', '123456');
INSERT INTO `teacher` VALUES ('19760532537', '卜刚', '123456');
INSERT INTO `teacher` VALUES ('19760532538', '陈雷杰', '123456');
INSERT INTO `teacher` VALUES ('19760532539', '奚兰', '123456');
INSERT INTO `teacher` VALUES ('19760532540', '周燕亮', '123456');
INSERT INTO `teacher` VALUES ('19760532541', '何雪燕', '123456');
INSERT INTO `teacher` VALUES ('19760532542', '柳军美', '123456');
INSERT INTO `teacher` VALUES ('19760532543', '谢美', '123456');
INSERT INTO `teacher` VALUES ('19760532544', '倪磊红', '123456');
INSERT INTO `teacher` VALUES ('19760532545', '黄军', '123456');
INSERT INTO `teacher` VALUES ('19760532546', '贺丽云', '123456');
INSERT INTO `teacher` VALUES ('19760532547', '喻燕', '123456');
INSERT INTO `teacher` VALUES ('19760532548', '鲍峰', '123456');
INSERT INTO `teacher` VALUES ('19760532549', '沈飞敏', '123456');
INSERT INTO `teacher` VALUES ('19760532550', '水明', '123456');
INSERT INTO `teacher` VALUES ('19760532551', '赵雅', '123456');
INSERT INTO `teacher` VALUES ('19760532552', '云小', '123456');
INSERT INTO `teacher` VALUES ('19760532553', '花雷', '123456');
INSERT INTO `teacher` VALUES ('19760532554', '滕红晓', '123456');
INSERT INTO `teacher` VALUES ('19760532555', '凤辉', '123456');
INSERT INTO `teacher` VALUES ('19760532556', '沈丽', '123456');
INSERT INTO `teacher` VALUES ('19760532557', '苏雅', '123456');
INSERT INTO `teacher` VALUES ('19760532558', '孙红雪', '123456');
INSERT INTO `teacher` VALUES ('19760532559', '倪丽', '123456');
INSERT INTO `teacher` VALUES ('19760532560', '酆峰露', '123456');
INSERT INTO `teacher` VALUES ('19760532561', '薛平', '123456');
INSERT INTO `teacher` VALUES ('19760532562', '张美', '123456');
INSERT INTO `teacher` VALUES ('19760532563', '尹雪', '123456');
INSERT INTO `teacher` VALUES ('19760532564', '尹玲超', '123456');
INSERT INTO `teacher` VALUES ('19760532565', '云松平', '123456');
INSERT INTO `teacher` VALUES ('19760532566', '齐小雪', '123456');
INSERT INTO `teacher` VALUES ('19760532567', '柳文建', '123456');
INSERT INTO `teacher` VALUES ('19760532568', '李亮', '123456');
INSERT INTO `teacher` VALUES ('19760532569', '于红敏', '123456');
INSERT INTO `teacher` VALUES ('19760532570', '施娜', '123456');
INSERT INTO `teacher` VALUES ('19760532571', '褚峰国', '123456');
INSERT INTO `teacher` VALUES ('19760532572', '平燕红', '123456');
INSERT INTO `teacher` VALUES ('19760532573', '赵辉强', '123456');
INSERT INTO `teacher` VALUES ('19760532574', '薛婷芳', '123456');
INSERT INTO `teacher` VALUES ('19760532575', '章莉建', '123456');
INSERT INTO `teacher` VALUES ('19760532576', '韦伟涛', '123456');
INSERT INTO `teacher` VALUES ('19760532577', '伍建', '123456');
INSERT INTO `teacher` VALUES ('19760532578', '窦娜国', '123456');
INSERT INTO `teacher` VALUES ('19760532579', '酆琳文', '123456');
INSERT INTO `teacher` VALUES ('19760532580', '方辉', '123456');
INSERT INTO `teacher` VALUES ('19760532581', '余红', '123456');
INSERT INTO `teacher` VALUES ('19760532582', '罗辉静', '123456');
INSERT INTO `teacher` VALUES ('19760532583', '殷琳杰', '123456');
INSERT INTO `teacher` VALUES ('19760532584', '和娜艳', '123456');
INSERT INTO `teacher` VALUES ('19760532585', '平伟兰', '123456');
INSERT INTO `teacher` VALUES ('19760532586', '孔飞', '123456');
INSERT INTO `teacher` VALUES ('19760532587', '何辉勇', '123456');
INSERT INTO `teacher` VALUES ('19760532588', '于芳晓', '123456');
INSERT INTO `teacher` VALUES ('19760532589', '伍丽', '123456');
INSERT INTO `teacher` VALUES ('19760532590', '郎红婷', '123456');
INSERT INTO `teacher` VALUES ('19760532591', '昌雅', '123456');
INSERT INTO `teacher` VALUES ('19760532592', '安亮', '123456');
INSERT INTO `teacher` VALUES ('19760532593', '雷小', '123456');
INSERT INTO `teacher` VALUES ('19760532594', '费晓', '123456');
INSERT INTO `teacher` VALUES ('19760532595', '蒋芳', '123456');
INSERT INTO `teacher` VALUES ('19760532596', '傅强勇', '123456');
INSERT INTO `teacher` VALUES ('19760532597', '倪雅琳', '123456');
INSERT INTO `teacher` VALUES ('19760532598', '沈刚艳', '123456');
INSERT INTO `teacher` VALUES ('19760532599', '吕国', '123456');
INSERT INTO `teacher` VALUES ('19760532600', '苏飞', '123456');
INSERT INTO `teacher` VALUES ('19760532601', '穆燕艳', '123456');
INSERT INTO `teacher` VALUES ('19760532602', '蒋雷', '123456');
INSERT INTO `teacher` VALUES ('19760532603', '许军', '123456');
INSERT INTO `teacher` VALUES ('19760532604', '酆玲明', '123456');
INSERT INTO `teacher` VALUES ('19760532605', '鲁玲', '123456');
INSERT INTO `teacher` VALUES ('19760532606', '于杰小', '123456');
INSERT INTO `teacher` VALUES ('19760532607', '吕娜', '123456');
INSERT INTO `teacher` VALUES ('19760532608', '何涛玲', '123456');
INSERT INTO `teacher` VALUES ('19760532609', '陶美', '123456');
INSERT INTO `teacher` VALUES ('19760532610', '窦军', '123456');
INSERT INTO `teacher` VALUES ('19760532611', '姜国', '123456');
INSERT INTO `teacher` VALUES ('19760532612', '苏军', '123456');
INSERT INTO `teacher` VALUES ('19760532613', '葛露', '123456');
INSERT INTO `teacher` VALUES ('19760532614', '倪伟', '123456');
INSERT INTO `teacher` VALUES ('19760532615', '谢峰亮', '123456');
INSERT INTO `teacher` VALUES ('19760532616', '贺洁雷', '123456');
INSERT INTO `teacher` VALUES ('19760532617', '罗雅', '123456');
INSERT INTO `teacher` VALUES ('19760532618', '昌强刚', '123456');
INSERT INTO `teacher` VALUES ('19760532619', '水涛亮', '123456');
INSERT INTO `teacher` VALUES ('19760532620', '柳雷', '123456');
INSERT INTO `teacher` VALUES ('19760532621', '谢建飞', '123456');
INSERT INTO `teacher` VALUES ('19760532622', '奚超婷', '123456');
INSERT INTO `teacher` VALUES ('19760532623', '许雅', '123456');
INSERT INTO `teacher` VALUES ('19760532624', '杨强', '123456');
INSERT INTO `teacher` VALUES ('19760532625', '昌玲新', '123456');
INSERT INTO `teacher` VALUES ('19760532626', '奚飞', '123456');
INSERT INTO `teacher` VALUES ('19760532627', '贺国建', '123456');
INSERT INTO `teacher` VALUES ('19760532628', '滕芳军', '123456');
INSERT INTO `teacher` VALUES ('19760532629', '乐峰芳', '123456');
INSERT INTO `teacher` VALUES ('19760532630', '伍雷洁', '123456');
INSERT INTO `teacher` VALUES ('19760532631', '谢峰', '123456');
INSERT INTO `teacher` VALUES ('19760532632', '卫敏飞', '123456');
INSERT INTO `teacher` VALUES ('19760532633', '戚云丽', '123456');
INSERT INTO `teacher` VALUES ('19760532634', '葛军强', '123456');
INSERT INTO `teacher` VALUES ('19760532635', '邹云平', '123456');
INSERT INTO `teacher` VALUES ('19760532636', '杨国', '123456');
INSERT INTO `teacher` VALUES ('19760532637', '常明雪', '123456');
INSERT INTO `teacher` VALUES ('19760532638', '伍婷', '123456');
INSERT INTO `teacher` VALUES ('19760532639', '卜新莉', '123456');
INSERT INTO `teacher` VALUES ('19760532640', '王雅雪', '123456');
INSERT INTO `teacher` VALUES ('19760532641', '李艳文', '123456');
INSERT INTO `teacher` VALUES ('19760532642', '许杰', '123456');
INSERT INTO `teacher` VALUES ('19760532643', '岑洁红', '123456');
INSERT INTO `teacher` VALUES ('19760532644', '傅丽', '123456');
INSERT INTO `teacher` VALUES ('19760532645', '袁军敏', '123456');
INSERT INTO `teacher` VALUES ('19760532646', '穆杰', '123456');
INSERT INTO `teacher` VALUES ('19760532647', '滕芳雷', '123456');
INSERT INTO `teacher` VALUES ('19760532648', '谢琳磊', '123456');
INSERT INTO `teacher` VALUES ('19760532649', '韦琳', '123456');
INSERT INTO `teacher` VALUES ('19760532650', '窦军', '123456');
INSERT INTO `teacher` VALUES ('19760532651', '方飞', '123456');
INSERT INTO `teacher` VALUES ('19760532652', '鲍杰', '123456');
INSERT INTO `teacher` VALUES ('19760532653', '岑芳涛', '123456');
INSERT INTO `teacher` VALUES ('19760532654', '华军建', '123456');
INSERT INTO `teacher` VALUES ('19760532655', '雷琳辉', '123456');
INSERT INTO `teacher` VALUES ('19760532656', '苏燕婷', '123456');
INSERT INTO `teacher` VALUES ('19760532657', '任峰', '123456');
INSERT INTO `teacher` VALUES ('19760532658', '钱雷', '123456');
INSERT INTO `teacher` VALUES ('19760532659', '罗明伟', '123456');
INSERT INTO `teacher` VALUES ('19760532660', '卞新晓', '123456');
INSERT INTO `teacher` VALUES ('19760532661', '郎燕', '123456');
INSERT INTO `teacher` VALUES ('19760532662', '费平', '123456');
INSERT INTO `teacher` VALUES ('19760532663', '褚涛', '123456');
INSERT INTO `teacher` VALUES ('19760532664', '鲍雅', '123456');
INSERT INTO `teacher` VALUES ('19760532665', '邬勇建', '123456');
INSERT INTO `teacher` VALUES ('19760532666', '于敏辉', '123456');
INSERT INTO `teacher` VALUES ('19760532667', '汤雷', '123456');
INSERT INTO `teacher` VALUES ('19760532668', '冯文兰', '123456');
INSERT INTO `teacher` VALUES ('19760532669', '常静', '123456');
INSERT INTO `teacher` VALUES ('19760532670', '雷强超', '123456');
INSERT INTO `teacher` VALUES ('19760532671', '滕勇', '123456');
INSERT INTO `teacher` VALUES ('19760532672', '柏刚', '123456');
INSERT INTO `teacher` VALUES ('19760532673', '周雷', '123456');
INSERT INTO `teacher` VALUES ('19760532674', '杨军', '123456');
INSERT INTO `teacher` VALUES ('19760532675', '花刚芳', '123456');
INSERT INTO `teacher` VALUES ('19760532676', '乐涛小', '123456');
INSERT INTO `teacher` VALUES ('19760532677', '朱伟', '123456');
INSERT INTO `teacher` VALUES ('19760532678', '尤露', '123456');
INSERT INTO `teacher` VALUES ('19760532679', '岑莉露', '123456');
INSERT INTO `teacher` VALUES ('19760532680', '沈文国', '123456');
INSERT INTO `teacher` VALUES ('19760532681', '平松', '123456');
INSERT INTO `teacher` VALUES ('19760532682', '廉刚', '123456');
INSERT INTO `teacher` VALUES ('19760532683', '褚刚敏', '123456');
INSERT INTO `teacher` VALUES ('19760532684', '曹峰辉', '123456');
INSERT INTO `teacher` VALUES ('19760532685', '鲍静', '123456');
INSERT INTO `teacher` VALUES ('19760532686', '施磊杰', '123456');
INSERT INTO `teacher` VALUES ('19760532687', '于国', '123456');
INSERT INTO `teacher` VALUES ('19760532688', '乐伟强', '123456');
INSERT INTO `teacher` VALUES ('19760532689', '陶晓', '123456');
INSERT INTO `teacher` VALUES ('19760532690', '章飞刚', '123456');
INSERT INTO `teacher` VALUES ('19760532691', '杨峰', '123456');
INSERT INTO `teacher` VALUES ('19760532692', '萧云小', '123456');
INSERT INTO `teacher` VALUES ('19760532693', '乐敏洁', '123456');
INSERT INTO `teacher` VALUES ('19760532694', '韦婷敏', '123456');
INSERT INTO `teacher` VALUES ('19760532695', '齐露明', '123456');
INSERT INTO `teacher` VALUES ('19760532696', '蒋雪芳', '123456');
INSERT INTO `teacher` VALUES ('19760532697', '唐娜', '123456');
INSERT INTO `teacher` VALUES ('19760532698', '乐磊燕', '123456');
INSERT INTO `teacher` VALUES ('19760532699', '傅莉小', '123456');
INSERT INTO `teacher` VALUES ('19760532700', '葛亮', '123456');
INSERT INTO `teacher` VALUES ('19760532701', '卜芳', '123456');
INSERT INTO `teacher` VALUES ('19760532702', '褚晓', '123456');
INSERT INTO `teacher` VALUES ('19760532703', '罗燕平', '123456');
INSERT INTO `teacher` VALUES ('19760532704', '酆敏军', '123456');
INSERT INTO `teacher` VALUES ('19760532705', '乐平辉', '123456');
INSERT INTO `teacher` VALUES ('19760532706', '何飞辉', '123456');
INSERT INTO `teacher` VALUES ('19760532707', '施超亮', '123456');
INSERT INTO `teacher` VALUES ('19760532708', '严国雅', '123456');
INSERT INTO `teacher` VALUES ('19760532709', '许云峰', '123456');
INSERT INTO `teacher` VALUES ('19760532710', '苏红', '123456');
INSERT INTO `teacher` VALUES ('19760532711', '俞松', '123456');
INSERT INTO `teacher` VALUES ('19760532712', '傅燕磊', '123456');
INSERT INTO `teacher` VALUES ('19760532713', '花兰', '123456');
INSERT INTO `teacher` VALUES ('19760532714', '花伟红', '123456');
INSERT INTO `teacher` VALUES ('19760532715', '方燕美', '123456');
INSERT INTO `teacher` VALUES ('19760532716', '韩兰', '123456');
INSERT INTO `teacher` VALUES ('19760532717', '沈飞', '123456');
INSERT INTO `teacher` VALUES ('19760532718', '卞国', '123456');
INSERT INTO `teacher` VALUES ('19760532719', '卫新云', '123456');
INSERT INTO `teacher` VALUES ('19760532720', '常涛', '123456');
INSERT INTO `teacher` VALUES ('19760532721', '金晓', '123456');
INSERT INTO `teacher` VALUES ('19760532722', '苗刚', '123456');
INSERT INTO `teacher` VALUES ('19760532723', '水杰明', '123456');
INSERT INTO `teacher` VALUES ('19760532724', '吕伟', '123456');
INSERT INTO `teacher` VALUES ('19760532725', '殷小', '123456');
INSERT INTO `teacher` VALUES ('19760532726', '殷红', '123456');
INSERT INTO `teacher` VALUES ('19760532727', '雷燕', '123456');
INSERT INTO `teacher` VALUES ('19760532728', '杨艳', '123456');
INSERT INTO `teacher` VALUES ('19760532729', '郎雪雅', '123456');
INSERT INTO `teacher` VALUES ('19760532730', '罗敏', '123456');
INSERT INTO `teacher` VALUES ('19760532731', '昌亮', '123456');
INSERT INTO `teacher` VALUES ('19760532732', '廉文雅', '123456');
INSERT INTO `teacher` VALUES ('19760532733', '穆雅', '123456');
INSERT INTO `teacher` VALUES ('19760532734', '吕飞军', '123456');
INSERT INTO `teacher` VALUES ('19760532735', '戚婷', '123456');
INSERT INTO `teacher` VALUES ('19760532736', '酆云', '123456');
INSERT INTO `teacher` VALUES ('19760532737', '蒋美', '123456');
INSERT INTO `teacher` VALUES ('19760532738', '陈婷琳', '123456');
INSERT INTO `teacher` VALUES ('19760532739', '费美文', '123456');
INSERT INTO `teacher` VALUES ('19760532740', '葛建', '123456');
INSERT INTO `teacher` VALUES ('19760532741', '张小', '123456');
INSERT INTO `teacher` VALUES ('19760532742', '郑艳', '123456');
INSERT INTO `teacher` VALUES ('19760532743', '苗雅明', '123456');
INSERT INTO `teacher` VALUES ('19760532744', '费超伟', '123456');
INSERT INTO `teacher` VALUES ('19760532745', '顾兰超', '123456');
INSERT INTO `teacher` VALUES ('19760532746', '韦婷', '123456');
INSERT INTO `teacher` VALUES ('19760532747', '马敏琳', '123456');
INSERT INTO `teacher` VALUES ('19760532748', '穆超', '123456');
INSERT INTO `teacher` VALUES ('19760532749', '葛琳', '123456');
INSERT INTO `teacher` VALUES ('19760532750', '谢艳琳', '123456');
INSERT INTO `teacher` VALUES ('19760532751', '费超', '123456');
INSERT INTO `teacher` VALUES ('19760532752', '华国', '123456');
INSERT INTO `teacher` VALUES ('19760532753', '傅娜新', '123456');
INSERT INTO `teacher` VALUES ('19760532754', '喻伟露', '123456');
INSERT INTO `teacher` VALUES ('19760532755', '余伟', '123456');
INSERT INTO `teacher` VALUES ('19760532756', '傅辉云', '123456');
INSERT INTO `teacher` VALUES ('19760532757', '孟娜', '123456');
INSERT INTO `teacher` VALUES ('19760532758', '何亮红', '123456');
INSERT INTO `teacher` VALUES ('19760532759', '傅晓洁', '123456');
INSERT INTO `teacher` VALUES ('19760532760', '于峰杰', '123456');
INSERT INTO `teacher` VALUES ('19760532761', '尹雪明', '123456');
INSERT INTO `teacher` VALUES ('19760532762', '施飞', '123456');
INSERT INTO `teacher` VALUES ('19760532763', '姜婷', '123456');
INSERT INTO `teacher` VALUES ('19760532764', '皮雪辉', '123456');
INSERT INTO `teacher` VALUES ('19760532765', '吕芳松', '123456');
INSERT INTO `teacher` VALUES ('19760532766', '秦国琳', '123456');
INSERT INTO `teacher` VALUES ('19760532767', '苏美', '123456');
INSERT INTO `teacher` VALUES ('19760532768', '吴军', '123456');
INSERT INTO `teacher` VALUES ('19760532769', '章涛伟', '123456');
INSERT INTO `teacher` VALUES ('19760532770', '廉雷', '123456');
INSERT INTO `teacher` VALUES ('19760532771', '郎军', '123456');
INSERT INTO `teacher` VALUES ('19760532772', '傅莉国', '123456');
INSERT INTO `teacher` VALUES ('19760532773', '常红静', '123456');
INSERT INTO `teacher` VALUES ('19760532774', '孙洁', '123456');
INSERT INTO `teacher` VALUES ('19760532775', '葛丽琳', '123456');
INSERT INTO `teacher` VALUES ('19760532776', '邹亮平', '123456');
INSERT INTO `teacher` VALUES ('19760532777', '褚雷', '123456');
INSERT INTO `teacher` VALUES ('19760532778', '苗国', '123456');
INSERT INTO `teacher` VALUES ('19760532779', '李辉', '123456');
INSERT INTO `teacher` VALUES ('19760532780', '萧超', '123456');
INSERT INTO `teacher` VALUES ('19760532781', '彭红雪', '123456');
INSERT INTO `teacher` VALUES ('19760532782', '汤杰露', '123456');
INSERT INTO `teacher` VALUES ('19760532783', '冯明莉', '123456');
INSERT INTO `teacher` VALUES ('19760532784', '伍平松', '123456');
INSERT INTO `teacher` VALUES ('19760532785', '奚杰芳', '123456');
INSERT INTO `teacher` VALUES ('19760532786', '平文琳', '123456');
INSERT INTO `teacher` VALUES ('19760532787', '冯静', '123456');
INSERT INTO `teacher` VALUES ('19760532788', '赵敏建', '123456');
INSERT INTO `teacher` VALUES ('19760532789', '邬美丽', '123456');
INSERT INTO `teacher` VALUES ('19760532790', '潘云', '123456');
INSERT INTO `teacher` VALUES ('19760532791', '齐勇', '123456');
INSERT INTO `teacher` VALUES ('19760532792', '华雅飞', '123456');
INSERT INTO `teacher` VALUES ('19760532793', '韩伟', '123456');
INSERT INTO `teacher` VALUES ('19760532794', '孔兰', '123456');
INSERT INTO `teacher` VALUES ('19760532795', '邹莉', '123456');
INSERT INTO `teacher` VALUES ('19760532796', '费涛', '123456');
INSERT INTO `teacher` VALUES ('19760532797', '史云', '123456');
INSERT INTO `teacher` VALUES ('19760532798', '苏晓松', '123456');
INSERT INTO `teacher` VALUES ('19760532799', '卫露', '123456');
INSERT INTO `teacher` VALUES ('19760532800', '褚红', '123456');
INSERT INTO `teacher` VALUES ('19760532801', '元玲晓', '123456');
INSERT INTO `teacher` VALUES ('19760532802', '滕磊', '123456');
INSERT INTO `teacher` VALUES ('19760532803', '尹丽', '123456');
INSERT INTO `teacher` VALUES ('19760532804', '酆杰军', '123456');
INSERT INTO `teacher` VALUES ('19760532805', '潘杰', '123456');
INSERT INTO `teacher` VALUES ('19760532806', '褚文晓', '123456');
INSERT INTO `teacher` VALUES ('19760532807', '郎红', '123456');
INSERT INTO `teacher` VALUES ('19760532808', '伍峰', '123456');
INSERT INTO `teacher` VALUES ('19760532809', '柳飞', '123456');
INSERT INTO `teacher` VALUES ('19760532810', '卜辉', '123456');
INSERT INTO `teacher` VALUES ('19760532811', '卞雷莉', '123456');
INSERT INTO `teacher` VALUES ('19760532812', '金军', '123456');
INSERT INTO `teacher` VALUES ('19760532813', '李艳娜', '123456');
INSERT INTO `teacher` VALUES ('19760532814', '廉兰平', '123456');
INSERT INTO `teacher` VALUES ('19760532815', '李伟', '123456');
INSERT INTO `teacher` VALUES ('19760532816', '昌红', '123456');
INSERT INTO `teacher` VALUES ('19760532817', '陈娜', '123456');
INSERT INTO `teacher` VALUES ('19760532818', '尤峰', '123456');
INSERT INTO `teacher` VALUES ('19760532819', '尤强', '123456');
INSERT INTO `teacher` VALUES ('19760532820', '奚露文', '123456');
INSERT INTO `teacher` VALUES ('19760532821', '陶莉', '123456');
INSERT INTO `teacher` VALUES ('19760532822', '魏亮敏', '123456');
INSERT INTO `teacher` VALUES ('19760532823', '李云', '123456');
INSERT INTO `teacher` VALUES ('19760532824', '雷雪', '123456');
INSERT INTO `teacher` VALUES ('19760532825', '罗军', '123456');
INSERT INTO `teacher` VALUES ('19760532826', '奚辉静', '123456');
INSERT INTO `teacher` VALUES ('19760532827', '邬飞露', '123456');
INSERT INTO `teacher` VALUES ('19760532828', '周平', '123456');
INSERT INTO `teacher` VALUES ('19760532829', '花平云', '123456');
INSERT INTO `teacher` VALUES ('19760532830', '尤丽新', '123456');
INSERT INTO `teacher` VALUES ('19760532831', '凤雷娜', '123456');
INSERT INTO `teacher` VALUES ('19760532832', '毕敏', '123456');
INSERT INTO `teacher` VALUES ('19760532833', '魏辉红', '123456');
INSERT INTO `teacher` VALUES ('19760532834', '杨美明', '123456');
INSERT INTO `teacher` VALUES ('19760532835', '萧艳', '123456');
INSERT INTO `teacher` VALUES ('19760532836', '章玲敏', '123456');
INSERT INTO `teacher` VALUES ('19760532837', '酆飞', '123456');
INSERT INTO `teacher` VALUES ('19760532838', '苗敏', '123456');
INSERT INTO `teacher` VALUES ('19760532839', '魏飞芳', '123456');
INSERT INTO `teacher` VALUES ('19760532840', '雷亮琳', '123456');
INSERT INTO `teacher` VALUES ('19760532841', '邬涛', '123456');
INSERT INTO `teacher` VALUES ('19760532842', '姜燕', '123456');
INSERT INTO `teacher` VALUES ('19760532843', '蒋建', '123456');
INSERT INTO `teacher` VALUES ('19760532844', '吴磊雅', '123456');
INSERT INTO `teacher` VALUES ('19760532845', '尤艳雪', '123456');
INSERT INTO `teacher` VALUES ('19760532846', '吴雪小', '123456');
INSERT INTO `teacher` VALUES ('19760532847', '齐莉', '123456');
INSERT INTO `teacher` VALUES ('19760532848', '喻洁伟', '123456');
INSERT INTO `teacher` VALUES ('19760532849', '费新', '123456');
INSERT INTO `teacher` VALUES ('19760532850', '张峰', '123456');
INSERT INTO `teacher` VALUES ('19760532851', '袁云', '123456');
INSERT INTO `teacher` VALUES ('19760532852', '安飞伟', '123456');
INSERT INTO `teacher` VALUES ('19760532853', '方娜丽', '123456');
INSERT INTO `teacher` VALUES ('19760532854', '彭云', '123456');
INSERT INTO `teacher` VALUES ('19760532855', '萧娜丽', '123456');
INSERT INTO `teacher` VALUES ('19760532856', '戚刚莉', '123456');
INSERT INTO `teacher` VALUES ('19760532857', '萧强', '123456');
INSERT INTO `teacher` VALUES ('19760532858', '赵丽', '123456');
INSERT INTO `teacher` VALUES ('19760532859', '元洁', '123456');
INSERT INTO `teacher` VALUES ('19760532860', '钱雪小', '123456');
INSERT INTO `teacher` VALUES ('19760532861', '范勇', '123456');
INSERT INTO `teacher` VALUES ('19760532862', '喻玲', '123456');
INSERT INTO `teacher` VALUES ('19760532863', '水敏', '123456');
INSERT INTO `teacher` VALUES ('19760532864', '乐洁', '123456');
INSERT INTO `teacher` VALUES ('19760532865', '廉雅', '123456');
INSERT INTO `teacher` VALUES ('19760532866', '奚红勇', '123456');
INSERT INTO `teacher` VALUES ('19760532867', '鲍艳洁', '123456');
INSERT INTO `teacher` VALUES ('19760532868', '鲍新', '123456');
INSERT INTO `teacher` VALUES ('19760532869', '邬建红', '123456');
INSERT INTO `teacher` VALUES ('19760532870', '罗露红', '123456');
INSERT INTO `teacher` VALUES ('19760532871', '尤敏', '123456');
INSERT INTO `teacher` VALUES ('19760532872', '顾刚', '123456');
INSERT INTO `teacher` VALUES ('19760532873', '殷辉', '123456');
INSERT INTO `teacher` VALUES ('19760532874', '邬建磊', '123456');
INSERT INTO `teacher` VALUES ('19760532875', '俞兰美', '123456');
INSERT INTO `teacher` VALUES ('19760532876', '袁兰涛', '123456');
INSERT INTO `teacher` VALUES ('19760532877', '吴强', '123456');
INSERT INTO `teacher` VALUES ('19760532878', '章小兰', '123456');
INSERT INTO `teacher` VALUES ('19760532879', '顾玲琳', '123456');
INSERT INTO `teacher` VALUES ('19760532880', '云玲', '123456');
INSERT INTO `teacher` VALUES ('19760532881', '华美', '123456');
INSERT INTO `teacher` VALUES ('19760532882', '吕勇', '123456');
INSERT INTO `teacher` VALUES ('19760532883', '褚雪', '123456');
INSERT INTO `teacher` VALUES ('19760532884', '费娜明', '123456');
INSERT INTO `teacher` VALUES ('19760532885', '卞文', '123456');
INSERT INTO `teacher` VALUES ('19760532886', '苏美', '123456');
INSERT INTO `teacher` VALUES ('19760532887', '孙红', '123456');
INSERT INTO `teacher` VALUES ('19760532888', '余伟雷', '123456');
INSERT INTO `teacher` VALUES ('19760532889', '酆雅建', '123456');
INSERT INTO `teacher` VALUES ('19760532890', '喻娜芳', '123456');
INSERT INTO `teacher` VALUES ('19760532891', '黄娜', '123456');
INSERT INTO `teacher` VALUES ('19760532892', '华峰明', '123456');
INSERT INTO `teacher` VALUES ('19760532893', '鲁婷琳', '123456');
INSERT INTO `teacher` VALUES ('19760532894', '殷敏磊', '123456');
INSERT INTO `teacher` VALUES ('19760532895', '廉婷露', '123456');
INSERT INTO `teacher` VALUES ('19760532896', '任琳', '123456');
INSERT INTO `teacher` VALUES ('19760532897', '潘文松', '123456');
INSERT INTO `teacher` VALUES ('19760532898', '方艳', '123456');
INSERT INTO `teacher` VALUES ('19760532899', '平雷芳', '123456');
INSERT INTO `teacher` VALUES ('19760532900', '萧新国', '123456');
INSERT INTO `teacher` VALUES ('19760532901', '鲁晓', '123456');
INSERT INTO `teacher` VALUES ('19760532902', '尤国红', '123456');
INSERT INTO `teacher` VALUES ('19760532903', '滕美娜', '123456');
INSERT INTO `teacher` VALUES ('19760532904', '齐晓丽', '123456');
INSERT INTO `teacher` VALUES ('19760532905', '酆勇', '123456');
INSERT INTO `teacher` VALUES ('19760532906', '常国', '123456');
INSERT INTO `teacher` VALUES ('19760532907', '花刚', '123456');
INSERT INTO `teacher` VALUES ('19760532908', '廉娜琳', '123456');
INSERT INTO `teacher` VALUES ('19760532909', '郎雪静', '123456');
INSERT INTO `teacher` VALUES ('19760532910', '岑明', '123456');
INSERT INTO `teacher` VALUES ('19760532911', '余军松', '123456');
INSERT INTO `teacher` VALUES ('19760532912', '窦文伟', '123456');
INSERT INTO `teacher` VALUES ('19760532913', '马娜', '123456');
INSERT INTO `teacher` VALUES ('19760532914', '周兰', '123456');
INSERT INTO `teacher` VALUES ('19760532915', '韦勇', '123456');
INSERT INTO `teacher` VALUES ('19760532916', '殷敏超', '123456');
INSERT INTO `teacher` VALUES ('19760532917', '窦峰', '123456');
INSERT INTO `teacher` VALUES ('19760532918', '张涛飞', '123456');
INSERT INTO `teacher` VALUES ('19760532919', '安雪小', '123456');
INSERT INTO `teacher` VALUES ('19760532920', '常涛文', '123456');
INSERT INTO `teacher` VALUES ('19760532921', '章美', '123456');
INSERT INTO `teacher` VALUES ('19760532922', '邹静美', '123456');
INSERT INTO `teacher` VALUES ('19760532923', '马军', '123456');
INSERT INTO `teacher` VALUES ('19760532924', '殷勇', '123456');
INSERT INTO `teacher` VALUES ('19760532925', '傅莉丽', '123456');
INSERT INTO `teacher` VALUES ('19760532926', '余平燕', '123456');
INSERT INTO `teacher` VALUES ('19760532927', '葛敏雅', '123456');
INSERT INTO `teacher` VALUES ('19760532928', '吴莉雷', '123456');
INSERT INTO `teacher` VALUES ('19760532929', '周兰涛', '123456');
INSERT INTO `teacher` VALUES ('19760532930', '罗雪刚', '123456');
INSERT INTO `teacher` VALUES ('19760532931', '柳松', '123456');
INSERT INTO `teacher` VALUES ('19760532932', '黄文松', '123456');
INSERT INTO `teacher` VALUES ('19760532933', '元丽', '123456');
INSERT INTO `teacher` VALUES ('19760532934', '俞杰', '123456');
INSERT INTO `teacher` VALUES ('19760532935', '岑磊', '123456');
INSERT INTO `teacher` VALUES ('19760532936', '苗娜', '123456');
INSERT INTO `teacher` VALUES ('19760532937', '卞军', '123456');
INSERT INTO `teacher` VALUES ('19760532938', '费明飞', '123456');
INSERT INTO `teacher` VALUES ('19760532939', '齐伟', '123456');
INSERT INTO `teacher` VALUES ('19760532940', '元峰', '123456');
INSERT INTO `teacher` VALUES ('19760532941', '安婷', '123456');
INSERT INTO `teacher` VALUES ('19760532942', '贺洁', '123456');
INSERT INTO `teacher` VALUES ('19760532943', '韦文丽', '123456');
INSERT INTO `teacher` VALUES ('19760532944', '马雪', '123456');
INSERT INTO `teacher` VALUES ('19760532945', '卫磊', '123456');
INSERT INTO `teacher` VALUES ('19760532946', '窦军', '123456');
INSERT INTO `teacher` VALUES ('19760532947', '秦松国', '123456');
INSERT INTO `teacher` VALUES ('19760532948', '康杰兰', '123456');
INSERT INTO `teacher` VALUES ('19760532949', '柏红', '123456');
INSERT INTO `teacher` VALUES ('19760532950', '曹明', '123456');
INSERT INTO `teacher` VALUES ('19760532951', '吕涛', '123456');
INSERT INTO `teacher` VALUES ('19760532952', '潘新', '123456');
INSERT INTO `teacher` VALUES ('19760532953', '顾晓', '123456');
INSERT INTO `teacher` VALUES ('19760532954', '苏辉', '123456');
INSERT INTO `teacher` VALUES ('19760532955', '常静莉', '123456');
INSERT INTO `teacher` VALUES ('19760532956', '韦国', '123456');
INSERT INTO `teacher` VALUES ('19760532957', '杨新', '123456');
INSERT INTO `teacher` VALUES ('19760532958', '窦洁', '123456');
INSERT INTO `teacher` VALUES ('19760532959', '顾峰', '123456');
INSERT INTO `teacher` VALUES ('19760532960', '蒋琳', '123456');
INSERT INTO `teacher` VALUES ('19760532961', '苏刚云', '123456');
INSERT INTO `teacher` VALUES ('19760532962', '黄军', '123456');
INSERT INTO `teacher` VALUES ('19760532963', '张强', '123456');
INSERT INTO `teacher` VALUES ('19760532964', '伍静亮', '123456');
INSERT INTO `teacher` VALUES ('19760532965', '冯美雪', '123456');
INSERT INTO `teacher` VALUES ('19760532966', '时雪', '123456');
INSERT INTO `teacher` VALUES ('19760532967', '康兰', '123456');
INSERT INTO `teacher` VALUES ('19760532968', '郑飞艳', '123456');
INSERT INTO `teacher` VALUES ('19760532969', '钱辉', '123456');
INSERT INTO `teacher` VALUES ('19760532970', '卞涛刚', '123456');
INSERT INTO `teacher` VALUES ('19760532971', '尤琳莉', '123456');
INSERT INTO `teacher` VALUES ('19760532972', '沈洁', '123456');
INSERT INTO `teacher` VALUES ('19760532973', '邬红', '123456');
INSERT INTO `teacher` VALUES ('19760532974', '尹晓', '123456');
INSERT INTO `teacher` VALUES ('19760532975', '葛松露', '123456');
INSERT INTO `teacher` VALUES ('19760532976', '孙军云', '123456');
INSERT INTO `teacher` VALUES ('19760532977', '伍雪敏', '123456');
INSERT INTO `teacher` VALUES ('19760532978', '方露伟', '123456');
INSERT INTO `teacher` VALUES ('19760532979', '毕文勇', '123456');
INSERT INTO `teacher` VALUES ('19760532980', '卫文洁', '123456');
INSERT INTO `teacher` VALUES ('19760532981', '尹伟', '123456');
INSERT INTO `teacher` VALUES ('19760532982', '和露琳', '123456');
INSERT INTO `teacher` VALUES ('19760532983', '罗文雅', '123456');
INSERT INTO `teacher` VALUES ('19760532984', '柳红', '123456');
INSERT INTO `teacher` VALUES ('19760532985', '萧松', '123456');
INSERT INTO `teacher` VALUES ('19760532986', '何辉', '123456');
INSERT INTO `teacher` VALUES ('19760532987', '滕云杰', '123456');
INSERT INTO `teacher` VALUES ('19760532988', '滕娜雷', '123456');
INSERT INTO `teacher` VALUES ('19760532989', '雷婷', '123456');
INSERT INTO `teacher` VALUES ('19760532990', '元刚', '123456');
INSERT INTO `teacher` VALUES ('19760532991', '殷美雷', '123456');
INSERT INTO `teacher` VALUES ('19760532992', '韩勇军', '123456');
INSERT INTO `teacher` VALUES ('19760532993', '俞勇刚', '123456');
INSERT INTO `teacher` VALUES ('19760532994', '郝伟', '123456');
INSERT INTO `teacher` VALUES ('19760532995', '黄娜辉', '123456');
INSERT INTO `teacher` VALUES ('19760532996', '薛芳', '123456');
INSERT INTO `teacher` VALUES ('19760532997', '顾军', '123456');
INSERT INTO `teacher` VALUES ('19760532998', '李刚', '123456');
INSERT INTO `teacher` VALUES ('19760532999', '俞燕', '123456');
INSERT INTO `teacher` VALUES ('19760533000', '马雷', '123456');
INSERT INTO `teacher` VALUES ('19760533001', '苏燕', '123456');
INSERT INTO `teacher` VALUES ('19760533002', '尹飞洁', '123456');
INSERT INTO `teacher` VALUES ('19760533003', '陶琳云', '123456');
INSERT INTO `teacher` VALUES ('19760533004', '马小红', '123456');
INSERT INTO `teacher` VALUES ('19760533005', '章超', '123456');
INSERT INTO `teacher` VALUES ('19760533006', '潘敏', '123456');
INSERT INTO `teacher` VALUES ('19760533007', '廉涛', '123456');
INSERT INTO `teacher` VALUES ('19760533008', '罗静红', '123456');
INSERT INTO `teacher` VALUES ('19760533009', '平明艳', '123456');
INSERT INTO `teacher` VALUES ('19760533010', '苏红敏', '123456');
INSERT INTO `teacher` VALUES ('19760533011', '魏露琳', '123456');
INSERT INTO `teacher` VALUES ('19760533012', '褚小', '123456');
INSERT INTO `teacher` VALUES ('19760533013', '范磊兰', '123456');
INSERT INTO `teacher` VALUES ('19760533014', '殷明', '123456');
INSERT INTO `teacher` VALUES ('19760533015', '褚平', '123456');
INSERT INTO `teacher` VALUES ('19760533016', '奚露', '123456');
INSERT INTO `teacher` VALUES ('19760533017', '余国', '123456');
INSERT INTO `teacher` VALUES ('19760533018', '何辉', '123456');
INSERT INTO `teacher` VALUES ('19760533019', '葛云雅', '123456');
INSERT INTO `teacher` VALUES ('19760533020', '平飞雅', '123456');
INSERT INTO `teacher` VALUES ('19760533021', '潘芳', '123456');
INSERT INTO `teacher` VALUES ('19760533022', '华飞', '123456');
INSERT INTO `teacher` VALUES ('19760533023', '袁军伟', '123456');
INSERT INTO `teacher` VALUES ('19760533024', '罗芳', '123456');
INSERT INTO `teacher` VALUES ('19760533025', '苏琳磊', '123456');
INSERT INTO `teacher` VALUES ('19760533026', '唐新平', '123456');
INSERT INTO `teacher` VALUES ('19760533027', '倪玲云', '123456');
INSERT INTO `teacher` VALUES ('19760533028', '彭建文', '123456');
INSERT INTO `teacher` VALUES ('19760533029', '于飞莉', '123456');
INSERT INTO `teacher` VALUES ('19760533030', '殷露辉', '123456');
INSERT INTO `teacher` VALUES ('19760533031', '钱涛小', '123456');
INSERT INTO `teacher` VALUES ('19760533032', '孔雷莉', '123456');
INSERT INTO `teacher` VALUES ('19760533033', '穆亮', '123456');
INSERT INTO `teacher` VALUES ('19760533034', '滕飞露', '123456');
INSERT INTO `teacher` VALUES ('19760533035', '柏娜燕', '123456');
INSERT INTO `teacher` VALUES ('19760533036', '苏娜露', '123456');
INSERT INTO `teacher` VALUES ('19760533037', '平莉', '123456');
INSERT INTO `teacher` VALUES ('19760533038', '郎亮敏', '123456');
INSERT INTO `teacher` VALUES ('19760533039', '苏雪', '123456');
INSERT INTO `teacher` VALUES ('19760533040', '薛美', '123456');
INSERT INTO `teacher` VALUES ('19760533041', '韦芳露', '123456');
INSERT INTO `teacher` VALUES ('19760533042', '吕洁', '123456');
INSERT INTO `teacher` VALUES ('19760533043', '柏文雅', '123456');
INSERT INTO `teacher` VALUES ('19760533044', '薛涛超', '123456');
INSERT INTO `teacher` VALUES ('19760533045', '平平', '123456');
INSERT INTO `teacher` VALUES ('19760533046', '郑刚静', '123456');
INSERT INTO `teacher` VALUES ('19760533047', '元涛', '123456');
INSERT INTO `teacher` VALUES ('19760533048', '吴军', '123456');
INSERT INTO `teacher` VALUES ('19760533049', '李磊伟', '123456');
INSERT INTO `teacher` VALUES ('19760533050', '方芳红', '123456');
INSERT INTO `teacher` VALUES ('19760533051', '施雷', '123456');
INSERT INTO `teacher` VALUES ('19760533052', '云磊', '123456');
INSERT INTO `teacher` VALUES ('19760533053', '穆玲美', '123456');
INSERT INTO `teacher` VALUES ('19760533054', '孔云', '123456');
INSERT INTO `teacher` VALUES ('19760533055', '韩杰', '123456');

-- ----------------------------
-- Table structure for teaching_table
-- ----------------------------
DROP TABLE IF EXISTS `teaching_table`;
CREATE TABLE `teaching_table`  (
  `teaching_id` decimal(10, 0) NOT NULL COMMENT '教学资源ID',
  `tea_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师工号',
  `view_id` decimal(10, 0) NULL DEFAULT NULL COMMENT '记录ID',
  `resource_url` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源url',
  `created_at` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`teaching_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'A1 线上学习 教学表\r\n\r\n一对一{\r\na1_viewed\r\nview_id\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teaching_table
-- ----------------------------

-- ----------------------------
-- Table structure for total_score
-- ----------------------------
DROP TABLE IF EXISTS `total_score`;
CREATE TABLE `total_score`  (
  `ts_id` decimal(40, 0) NOT NULL COMMENT '总分ID',
  `semester_id` decimal(60, 0) NULL DEFAULT NULL COMMENT '学期ID',
  `ep_score` decimal(40, 3) NOT NULL COMMENT '期末成绩',
  PRIMARY KEY (`ts_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '总分表\r\n\r\nsemester\r\nsemester_id' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of total_score
-- ----------------------------

-- ----------------------------
-- View structure for student_performance
-- ----------------------------
DROP VIEW IF EXISTS `student_performance`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_performance` AS select `s`.`stu_id` AS `学号`,`s`.`stu_name` AS `学生姓名`,`cr`.`cr_date` AS `上课时间`,`dri`.`dri_analysis` AS `运球`,`sho`.`sho_analysis` AS `投篮` from (((`student` `s` join `class_register` `cr` on((`s`.`class_id` = `cr`.`cr_id`))) join `a_dribble` `dri` on((`s`.`stu_id` = `dri`.`dri_id`))) join `shoot` `sho` on((`s`.`stu_id` = `sho`.`sho_id`)));

SET FOREIGN_KEY_CHECKS = 1;
