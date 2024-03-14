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

 Date: 12/03/2024 13:18:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `class_id` decimal(10, 0) NOT NULL COMMENT '班级编号',
  `class_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业班级名',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '班级' ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
