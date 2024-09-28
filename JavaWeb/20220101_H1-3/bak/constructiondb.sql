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

 Date: 09/10/2022 16:03:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_expert
-- ----------------------------
DROP TABLE IF EXISTS `t_expert`;
CREATE TABLE `t_expert`  (
  `Expert_id` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Expert_name` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Dept` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Expert_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_expert
-- ----------------------------
INSERT INTO `t_expert` VALUES ('E1001', '金陵', '430911196909289910', '工程造价咨询公司');
INSERT INTO `t_expert` VALUES ('E1002', '胡文', '430911197009228111', '建设监理公司');
INSERT INTO `t_expert` VALUES ('E1003', '刘向荣', '430234196907224560', '长沙学院');
INSERT INTO `t_expert` VALUES ('E1004', '卜飞', '430345197605127664', '长沙会计师事务所');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `Project_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Project_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Deputy_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Telephone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Addr` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('2003-01', '住宅小区一期工程', '张三', '2626266', '长沙市天心区');
INSERT INTO `t_project` VALUES ('2003-02', '教学大楼', '王平', '8374777', '长沙市芙蓉区');

-- ----------------------------
-- Table structure for t_project_expert
-- ----------------------------
DROP TABLE IF EXISTS `t_project_expert`;
CREATE TABLE `t_project_expert`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `Project_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Expert_id` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Project_id`(`Project_id`) USING BTREE,
  INDEX `Expert_id`(`Expert_id`) USING BTREE,
  CONSTRAINT `t_project_expert_ibfk_1` FOREIGN KEY (`Project_id`) REFERENCES `t_project` (`Project_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_project_expert_ibfk_2` FOREIGN KEY (`Expert_id`) REFERENCES `t_expert` (`Expert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_expert
-- ----------------------------
INSERT INTO `t_project_expert` VALUES (1, '2003-01', 'E1001');
INSERT INTO `t_project_expert` VALUES (2, '2003-01', 'E1002');
INSERT INTO `t_project_expert` VALUES (3, '2003-01', 'E1003');
INSERT INTO `t_project_expert` VALUES (4, '2003-02', 'E1004');

SET FOREIGN_KEY_CHECKS = 1;
