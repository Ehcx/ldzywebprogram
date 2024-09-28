/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : constructiondb

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 09/10/2022 09:36:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_enterprise_info
-- ----------------------------
DROP TABLE IF EXISTS `t_enterprise_info`;
CREATE TABLE `t_enterprise_info`  (
  `Ent_id` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ent_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Begin_date` datetime(0) NULL DEFAULT NULL,
  `Addr` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Reg_capital` decimal(12, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`Ent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_enterprise_info
-- ----------------------------
INSERT INTO `t_enterprise_info` VALUES ('200200078', '长沙城建有限公司', '2002-01-01 00:00:00', '长沙市天心区', 1000.0000);
INSERT INTO `t_enterprise_info` VALUES ('200400005', '天信建筑企业有限 公司', '2004-01-01 00:00:00', '长沙市芙蓉区', 1500.0000);

SET FOREIGN_KEY_CHECKS = 1;
