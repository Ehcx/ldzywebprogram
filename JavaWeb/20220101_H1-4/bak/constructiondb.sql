/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : constructiondb

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 09/10/2022 08:37:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_flow_step_def
-- ----------------------------
DROP TABLE IF EXISTS `t_flow_step_def`;
CREATE TABLE `t_flow_step_def`  (
  `Step_no` int(0) NOT NULL AUTO_INCREMENT,
  `Step_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Limit_time` int(0) NULL DEFAULT NULL COMMENT '单位(天)',
  `Step_des` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `URL` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Step_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_flow_step_def
-- ----------------------------
INSERT INTO `t_flow_step_def` VALUES (1, '建设工程项目施工报建 申请', 10, '施工报建', 'Flow/ConstructManager.html');
INSERT INTO `t_flow_step_def` VALUES (2, '入场交易登记', 7, '入场交易', 'Flow/ConstructManager.html');

SET FOREIGN_KEY_CHECKS = 1;
