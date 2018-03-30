/*
Navicat MySQL Data Transfer

Source Server         : mysql_Lwoo1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : stu_man_sys

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-30 15:04:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `assoId` int(11) DEFAULT NULL,
  `lock` int(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_username` (`username`),
  KEY `fk_as_ad` (`assoId`),
  CONSTRAINT `fk_as_ad` FOREIGN KEY (`assoId`) REFERENCES `asso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '会计协会', '1001', '2629910752', '1', null);
INSERT INTO `admin` VALUES ('2', '缘弈棋社', '1002', '42124452', null, null);
INSERT INTO `admin` VALUES ('3', '123', '1003', '1212313213', '13', null);
INSERT INTO `admin` VALUES ('4', '124', '1004', '123123131', '12', null);
INSERT INTO `admin` VALUES ('6', '125', '1005', '66544', '3', null);
INSERT INTO `admin` VALUES ('7', '126', '1006', '665', '4', null);
INSERT INTO `admin` VALUES ('8', '127', '1007', '2665656', '2', null);
INSERT INTO `admin` VALUES ('9', '128', '1008', '4545', '3', null);
INSERT INTO `admin` VALUES ('10', '129', '1009', '556', '4', null);
INSERT INTO `admin` VALUES ('11', '130', '1010', '454', '6', null);
INSERT INTO `admin` VALUES ('12', '131', '565566', null, '7', null);
INSERT INTO `admin` VALUES ('13', '132', '4545', '14', '9', null);
INSERT INTO `admin` VALUES ('14', '133', '4', '232', '10', null);
INSERT INTO `admin` VALUES ('15', '134', '134', '00', '11', null);
INSERT INTO `admin` VALUES ('16', '135', '134', '222', '20', null);
INSERT INTO `admin` VALUES ('17', 'ds', 'dfs', 'asad', '4', null);
INSERT INTO `admin` VALUES ('22', '广泛的', '广泛的官方', 'gfgfgf@qq.com', '8', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asso
-- ----------------------------
INSERT INTO `asso` VALUES ('1', '缘弈棋社', '缘弈棋社成立于2010年6月2日，是由棋类爱好者组织形成的学习型兴趣爱好类学生社团组织，缘弈棋社以弘扬中华名族博大精深的棋类文化为目标，以“以棋会友”为宗旨，为广大棋类爱好者提供一个真实有效的切磋交流平台。棋社下设秘书部、组织部、外联部、宣传部、技艺部和四大棋队。', 'qishe', '5');
INSERT INTO `asso` VALUES ('2', 'MDG模联社', '估计很多人对模联都是一脸茫然（这啥玩意？）\r\n简单来说，模拟联合国，是一项社交活动，可以让你学到课本之外的知识，锻炼你的口才和思维能力，让你交到来自各个学校的新朋友，能够玩得开心的活动。\r\n  模联会让你从一次次会议中加强你的责任感、社交能力、领袖能力、大局观、敏捷的思维、优秀的口才能力……甚至是终身的知己以及从课本上永远都学不不到的知识！', '2', '2');
INSERT INTO `asso` VALUES ('3', '榕旭文学社', '榕与旭的融合，正如古老源远的文学艺术与青年的碰撞。你是否愿意腾空而起，化身成灼眼的旭日，将全身的光辉洒向细碎的榕叶？你是否愿意将自己年轻躁动的心灵与文学艺术持续千年的古老脉搏相贴近？加入我们，一道上路吧。', '3', '3');
INSERT INTO `asso` VALUES ('4', '韩语社', '我们不仅教授一些基础的韩语，还会传授学弟学妹们一些韩国团体的歌/舞哟，更有参加活动表演自家爱豆歌曲的机会^^当然，兴趣部的学姐也会和喜欢韩剧的宝宝讨论热播韩剧哒！', '4', '4');
INSERT INTO `asso` VALUES ('5', '德语社', '这里是邪魅娟狂高大上的酷炫德语社！我们德语社创立于2015年的招新前夕，是一个年轻但充满朝气的社团！在这个温暖有爱的大家庭里，你可以学习到基础字母、音节、数字、发音规则和日常用语等，足以让你在同学面前小秀一遭√我们也会结合课程讲一些有关德国的动漫，历史，骨科『误』之类的，让课程多元化，还会发放福利的哦『放放德语电影发发小零食什么的啦』！', '5', '1');
INSERT INTO `asso` VALUES ('6', '星岚文史社', '星，是夜空的明珠；岚，是朦胧的面纱。文史，正如夜空繁星与林间幽雾，悠远神秘而又引人入胜。　这就是我们星岚文史学社。在这里你将拥有展现自己的舞台；在这里你将探索历史的奥秘；在这里你将感受到文史的纵横豪放，也将体验到国学知识竞赛中的龙争虎斗。', '6', '5');
INSERT INTO `asso` VALUES ('7', 'i7魔术社', '一中i7魔术社成立至今已有十年，无论你之前是否有接触过魔术，只要你对魔术有着向往和兴趣，i7这个大家庭随时都欢迎你的加入。', '7', '1');
INSERT INTO `asso` VALUES ('8', 'Musiclub ', '“我们闯入未来，但双眼却被太阳蒙蔽。我们每时每刻都在重生，谁也没办法知道下一秒我们将成为什么。束缚我们的锁链终将崩裂，我们将身上的血舔舐而尽，原始的荒蛮与文明如洪荒般冲袭而来。这是我们的声音，耶路撒冷的钟声敲响般的圣洁优雅，在阴霾中刺出一道圣光。', '8', '2');
INSERT INTO `asso` VALUES ('9', '春华摄影社', '踏过一道白光，迈入一片阴影，我们穿行于光影交织的空间：定格被雨滴晕染的繁花，印刻被岁月泛黄的胶卷。', '9', '3');
INSERT INTO `asso` VALUES ('10', '翰墨书法社', '翰墨书法社是一个以交流写字技巧为主要活动形式的社团。', '10', '4');
INSERT INTO `asso` VALUES ('11', '芝星电影社', '芝星电影社是一个让广大爱好电影的同学们展示自我和相互交流的社团。同学们可以在这里感受到电影所带来的魅力，并且有机会亲身参与进微电影的制作中，更加真切地体会到电影对我们的意义。', '11', '5');
INSERT INTO `asso` VALUES ('12', 'F.F.F吉他社', '我们是F.F.F.吉他社\r\nFascinating，Felicitous，Faithful，即迷人的，灵巧的，忠诚的，这是我们吉他社的宗旨\r\n我们一直在寻找，寻找一些人，一些和我们志趣相投的人。', '12', '2');
INSERT INTO `asso` VALUES ('13', 'ShowMe话剧社', 'ShowMe话剧社成立于2010年，至今已于校园内屹立7年之久！', '13', '1');
INSERT INTO `asso` VALUES ('14', '游鱼橡皮章社', '这里是游鱼橡皮章社.一个让你的橡皮变得special的gensokyo——成立于2016年6月，旨在促进社团成员在爱好和学习上互帮互助，共同进步，以业余的爱好缓解学习压力，促进全面发展，咳……', '14', '2');
INSERT INTO `asso` VALUES ('15', '摘星阁天文社', '往古来今谓之宙，四方上下谓之宇。宇宙神秘莫测又与我们息息相关，其蕴含无尽的知识和美丽神秘的星空吸引着无数学者为之痴迷。一中天文学会是一个很好的平台对于天文爱好者，可以让一届届天文爱好者在天文社学习知识、观测天体，燃烧热情', '15', '3');
INSERT INTO `asso` VALUES ('16', '纸艺社', '纸艺社，就是使用不同规格的纸张折出各式各样的作品。在纸艺社，你将会学习折纸教程中的基本符号与一些可爱的小作品；探讨在折纸上遇到的困难；也可以没事与社员嗑嗑瓜子，唠唠嗑。', '16', '5');
INSERT INTO `asso` VALUES ('17', 'AE电音社', ' 当下，电子音乐涉足领域覆盖了国内外乐坛的很大部分。在中国，更是开启了电音元年，全球最大电音节Ultra进军中国，王思聪生日多次邀请大牌DJ，不可否认的是，电子音乐越来越受欢迎。', '17', '4');
INSERT INTO `asso` VALUES ('18', '篮球社', '宗旨：让每个热爱篮球的人实现篮球梦。', '18', '5');
INSERT INTO `asso` VALUES ('19', '乒乓球社', '我们疾行于球台前，会神于挥拍间，比赛时沉稳而不失狂野。赛后，练习时，我们却总是欢声笑语，活泼无限。 没错，这就是我们活泼青春激情四射的一中乒乓球社，一个温暖的大家庭~', '19', '1');
INSERT INTO `asso` VALUES ('20', '医学爱好者协会', '欢迎加入医学爱好者协会！简称医协，是爱好医学知识者的集聚地。这里能够讨论自己对各类医学知识的见解，提出自己的疑惑，更可以提高自己的医学素养，扩展自己的知识面。', '20', '2');

-- ----------------------------
-- Table structure for category_
-- ----------------------------
DROP TABLE IF EXISTS `category_`;
CREATE TABLE `category_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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
INSERT INTO `category_` VALUES ('9', '41');
INSERT INTO `category_` VALUES ('10', '54542');
INSERT INTO `category_` VALUES ('14', '14444424');
INSERT INTO `category_` VALUES ('17', 'fdswf');
INSERT INTO `category_` VALUES ('21', '太过分的');
INSERT INTO `category_` VALUES ('37', '银行股');
INSERT INTO `category_` VALUES ('38', '和规范');
INSERT INTO `category_` VALUES ('39', '那边');
INSERT INTO `category_` VALUES ('40', '那边v你');
INSERT INTO `category_` VALUES ('41', '才出现');
INSERT INTO `category_` VALUES ('44', '犯得上发射点');
INSERT INTO `category_` VALUES ('45', '阿');
INSERT INTO `category_` VALUES ('48', '4545');
INSERT INTO `category_` VALUES ('52', '1');
INSERT INTO `category_` VALUES ('55', '人文社会类社团');

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
  `email` varchar(30) DEFAULT NULL,
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
INSERT INTO `user` VALUES ('4', 'zais', '2121', '男', '范德萨', '1', '3');
SET FOREIGN_KEY_CHECKS=1;
