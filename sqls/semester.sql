/*
 Navicat Premium Data Transfer

 Source Server         : eRock
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : 101.43.33.73:3305
 Source Schema         : erock

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 12/03/2024 13:18:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `semester_id` decimal(60, 0) NOT NULL COMMENT '学期ID',
  `start_date` date NOT NULL COMMENT '学期开始日期',
  `finish_date` date NOT NULL COMMENT '学期结束日期',
  PRIMARY KEY (`semester_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学期表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of semester
-- ----------------------------
INSERT INTO `semester` VALUES (1, '2021-09-01', '2022-06-30');
INSERT INTO `semester` VALUES (2, '2022-09-01', '2023-06-30');
INSERT INTO `semester` VALUES (3, '2023-09-01', '2024-06-30');

SET FOREIGN_KEY_CHECKS = 1;
