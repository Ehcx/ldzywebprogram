/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : constructiondb

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-09-29 16:43:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `Project_id` varchar(32) NOT NULL,
  `Project_name` varchar(64) NOT NULL,
  `Deputy_name` varchar(16) DEFAULT NULL,
  `Telephone` varchar(16) DEFAULT NULL,
  `Addr` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('2003-01', '住宅小区一期工程', '张三', '2626266', '长沙市天心区');
INSERT INTO `t_project` VALUES ('2003-02', '教学大楼', '王平', '8374777', '长沙市芙蓉区');
