/*
Navicat MySQL Data Transfer

Source Server         : mysql_Lwoo1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : stu_man_sys

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-25 23:07:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `assoId` int(11) DEFAULT NULL,
  `lock` int(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_as_ad` (`assoId`),
  CONSTRAINT `fk_as_ad` FOREIGN KEY (`assoId`) REFERENCES `asso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '会计协会', '1001', null, null);
INSERT INTO `admin` VALUES ('2', '缘弈棋社', '1002', null, null);

-- ----------------------------
-- Table structure for asso
-- ----------------------------
DROP TABLE IF EXISTS `asso`;
CREATE TABLE `asso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(30) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c` (`cid`),
  CONSTRAINT `fk_c` FOREIGN KEY (`cid`) REFERENCES `category_` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asso
-- ----------------------------
INSERT INTO `asso` VALUES ('1', '缘弈棋社', '缘弈棋社成立于2010年6月2日，是由棋类爱好者组织形成的学习型兴趣爱好类学生社团组织，缘弈棋社以弘扬中华名族博大精深的棋类文化为目标，以“以棋会友”为宗旨，为广大棋类爱好者提供一个真实有效的切磋交流平台。棋社下设秘书部、组织部、外联部、宣传部、技艺部和四大棋队。', 'qishe', '5');

-- ----------------------------
-- Table structure for category_
-- ----------------------------
DROP TABLE IF EXISTS `category_`;
CREATE TABLE `category_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_
-- ----------------------------
INSERT INTO `category_` VALUES ('1', '学习实践类社团');
INSERT INTO `category_` VALUES ('2', '体育竞技类社团');
INSERT INTO `category_` VALUES ('3', '社会公益类社团');
INSERT INTO `category_` VALUES ('4', '学术科技类社团');
INSERT INTO `category_` VALUES ('5', '文化艺术类社团');
INSERT INTO `category_` VALUES ('6', 'fgkdsajf');
INSERT INTO `category_` VALUES ('7', '6666666');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(30) NOT NULL,
  `time` date NOT NULL,
  `click` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_as_con` (`aid`),
  CONSTRAINT `fk_as_con` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `statu` int(2) NOT NULL,
  `assoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `f_k` (`assoId`),
  CONSTRAINT `f_k` FOREIGN KEY (`assoId`) REFERENCES `asso` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhangsan', '1112', '男', '110112', '1', '1');
INSERT INTO `user` VALUES ('3', '王五', '3333', '女', '546156', '1', '1');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_roles` (`username`,`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
