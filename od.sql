/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : od

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-12-13 22:23:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for od_department
-- ----------------------------
DROP TABLE IF EXISTS `od_department`;
CREATE TABLE `od_department` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(255) DEFAULT NULL,
  `dep_desc` varchar(255) DEFAULT NULL,
  `dep_role` int(11) DEFAULT NULL,
  `dep_manager` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_department
-- ----------------------------
INSERT INTO `od_department` VALUES ('1', '党委办公室', null, null, null);
INSERT INTO `od_department` VALUES ('2', '第一党', null, null, null);
INSERT INTO `od_department` VALUES ('3', '党委组织部', null, null, null);
INSERT INTO `od_department` VALUES ('4', '党委宣传部', null, null, null);
INSERT INTO `od_department` VALUES ('5', '党委统战部', null, null, null);
INSERT INTO `od_department` VALUES ('6', '党校', null, null, null);
INSERT INTO `od_department` VALUES ('7', '学生处', null, null, null);
INSERT INTO `od_department` VALUES ('8', '保卫处', null, null, null);
INSERT INTO `od_department` VALUES ('9', '党委研究生工作部', null, null, null);
INSERT INTO `od_department` VALUES ('10', '纪委', null, null, null);
INSERT INTO `od_department` VALUES ('11', '监察处', null, null, null);
INSERT INTO `od_department` VALUES ('12', '纪委办公室主任', null, null, null);
INSERT INTO `od_department` VALUES ('13', '校工会', null, null, null);
INSERT INTO `od_department` VALUES ('14', '12', null, null, null);

-- ----------------------------
-- Table structure for od_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `od_evaluate`;
CREATE TABLE `od_evaluate` (
  `eval_id` int(11) NOT NULL AUTO_INCREMENT,
  `eval_evalby` int(11) DEFAULT NULL,
  `eval_evalto` int(11) DEFAULT NULL,
  `eval_rank` int(11) DEFAULT NULL,
  `eval_cate` int(11) DEFAULT NULL,
  `eval_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eval_id`),
  KEY `FK_evalby` (`eval_evalby`),
  KEY `FK_evalto` (`eval_evalto`),
  CONSTRAINT `FK_evalby` FOREIGN KEY (`eval_evalby`) REFERENCES `od_user` (`user_id`),
  CONSTRAINT `FK_evalto` FOREIGN KEY (`eval_evalto`) REFERENCES `od_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for od_role
-- ----------------------------
DROP TABLE IF EXISTS `od_role`;
CREATE TABLE `od_role` (
  `role_id` int(255) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_role
-- ----------------------------
INSERT INTO `od_role` VALUES ('1', '校正厅', null);
INSERT INTO `od_role` VALUES ('2', '校副厅', null);
INSERT INTO `od_role` VALUES ('3', '党群部门', null);
INSERT INTO `od_role` VALUES ('4', '教学书记副书记', null);
INSERT INTO `od_role` VALUES ('5', '行政教辅部门', null);
INSERT INTO `od_role` VALUES ('6', '院系院长副院长', null);

-- ----------------------------
-- Table structure for od_user
-- ----------------------------
DROP TABLE IF EXISTS `od_user`;
CREATE TABLE `od_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_num` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_np` int(11) DEFAULT NULL,
  `user_report` varchar(255) DEFAULT NULL,
  `user_duty` varchar(255) DEFAULT NULL,
  `user_desc` varchar(255) DEFAULT NULL,
  `user_dep` int(11) DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`user_role`),
  KEY `FK_user_dep` (`user_dep`),
  CONSTRAINT `FK_user_dep` FOREIGN KEY (`user_dep`) REFERENCES `od_department` (`dep_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`user_role`) REFERENCES `od_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of od_user
-- ----------------------------
INSERT INTO `od_user` VALUES ('1', '郭秋萍', 'guoqiuping', '123456', '0', null, '党委办公室主任', null, '1', '3');
INSERT INTO `od_user` VALUES ('2', '李峰梅', 'lifengmei', '12345', '0', null, '第一党总支书记', null, '2', '3');
