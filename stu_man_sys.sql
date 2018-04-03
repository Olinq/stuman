/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : stu_man_sys

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-03 15:35:11
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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
INSERT INTO `admin` VALUES ('23', 'admins', 'admins', '26@qq.com', null, '1');

-- ----------------------------
-- Table structure for asso
-- ----------------------------
DROP TABLE IF EXISTS `asso`;
CREATE TABLE `asso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(30) NOT NULL,
  `description` varchar(600) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c` (`cid`),
  CONSTRAINT `fk_c` FOREIGN KEY (`cid`) REFERENCES `category_` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asso
-- ----------------------------
INSERT INTO `asso` VALUES ('1', '缘弈棋社', '缘弈棋社成立于2010年6月2日，是由棋类爱好者组织形成的学习型兴趣爱好类学生社团组织，缘弈棋社以弘扬中华名族博大精深的棋类文化为目标，以“以棋会友”为宗旨，为广大棋类爱好者提供一个真实有效的切磋交流平台。棋社下设秘书部、组织部、外联部、宣传部、技艺部和四大棋队。', 'qishe.jpg', '5');
INSERT INTO `asso` VALUES ('2', 'MDG模联社', '估计很多人对模联都是一脸茫然（这啥玩意？）\r\n简单来说，模拟联合国，是一项社交活动，可以让你学到课本之外的知识，锻炼你的口才和思维能力，让你交到来自各个学校的新朋友，能够玩得开心的活动。\r\n  模联会让你从一次次会议中加强你的责任感、社交能力、领袖能力、大局观、敏捷的思维、优秀的口才能力……甚至是终身的知己以及从课本上永远都学不不到的知识！', '2.jpg', '2');
INSERT INTO `asso` VALUES ('3', '榕旭文学社', '榕与旭的融合，正如古老源远的文学艺术与青年的碰撞。你是否愿意腾空而起，化身成灼眼的旭日，将全身的光辉洒向细碎的榕叶？你是否愿意将自己年轻躁动的心灵与文学艺术持续千年的古老脉搏相贴近？加入我们，一道上路吧。', '3.jpg', '3');
INSERT INTO `asso` VALUES ('4', '韩语社', '我们不仅教授一些基础的韩语，还会传授学弟学妹们一些韩国团体的歌/舞哟，更有参加活动表演自家爱豆歌曲的机会^^当然，兴趣部的学姐也会和喜欢韩剧的宝宝讨论热播韩剧哒！', '4.jpg', '4');
INSERT INTO `asso` VALUES ('5', '德语社', '这里是邪魅娟狂高大上的酷炫德语社！我们德语社创立于2015年的招新前夕，是一个年轻但充满朝气的社团！在这个温暖有爱的大家庭里，你可以学习到基础字母、音节、数字、发音规则和日常用语等，足以让你在同学面前小秀一遭√我们也会结合课程讲一些有关德国的动漫，历史，骨科『误』之类的，让课程多元化，还会发放福利的哦『放放德语电影发发小零食什么的啦』！', '5.jpg', '1');
INSERT INTO `asso` VALUES ('6', '星岚文史社', '星，是夜空的明珠；岚，是朦胧的面纱。文史，正如夜空繁星与林间幽雾，悠远神秘而又引人入胜。　这就是我们星岚文史学社。在这里你将拥有展现自己的舞台；在这里你将探索历史的奥秘；在这里你将感受到文史的纵横豪放，也将体验到国学知识竞赛中的龙争虎斗。', '6.jpg', '5');
INSERT INTO `asso` VALUES ('7', 'i7魔术社', '一中i7魔术社成立至今已有十年，无论你之前是否有接触过魔术，只要你对魔术有着向往和兴趣，i7这个大家庭随时都欢迎你的加入。', '7.jpg', '1');
INSERT INTO `asso` VALUES ('8', 'Musiclub ', '“我们闯入未来，但双眼却被太阳蒙蔽。我们每时每刻都在重生，谁也没办法知道下一秒我们将成为什么。束缚我们的锁链终将崩裂，我们将身上的血舔舐而尽，原始的荒蛮与文明如洪荒般冲袭而来。这是我们的声音，耶路撒冷的钟声敲响般的圣洁优雅，在阴霾中刺出一道圣光。', '8.jpg', '2');
INSERT INTO `asso` VALUES ('9', '春华摄影社', '踏过一道白光，迈入一片阴影，我们穿行于光影交织的空间：定格被雨滴晕染的繁花，印刻被岁月泛黄的胶卷。', '9.jpg', '3');
INSERT INTO `asso` VALUES ('10', '翰墨书法社', '翰墨书法社是一个以交流写字技巧为主要活动形式的社团。', '10.jpg', '4');
INSERT INTO `asso` VALUES ('11', '芝星电影社', '芝星电影社是一个让广大爱好电影的同学们展示自我和相互交流的社团。同学们可以在这里感受到电影所带来的魅力，并且有机会亲身参与进微电影的制作中，更加真切地体会到电影对我们的意义。', '11.jpg', '5');
INSERT INTO `asso` VALUES ('12', 'F.F.F吉他社', '我们是F.F.F.吉他社\r\nFascinating，Felicitous，Faithful，即迷人的，灵巧的，忠诚的，这是我们吉他社的宗旨\r\n我们一直在寻找，寻找一些人，一些和我们志趣相投的人。', '12.jpg', '2');
INSERT INTO `asso` VALUES ('13', 'ShowMe话剧社1222', 'ShowMe话剧社成立于2010年，至今已于校园内屹立7年之久！', '13.jpg', '1');
INSERT INTO `asso` VALUES ('14', '游鱼橡皮章社', '这里是游鱼橡皮章社.一个让你的橡皮变得special的gensokyo——成立于2016年6月，旨在促进社团成员在爱好和学习上互帮互助，共同进步，以业余的爱好缓解学习压力，促进全面发展，咳……', '14.jpg', '2');
INSERT INTO `asso` VALUES ('15', '摘星阁天文社', '往古来今谓之宙，四方上下谓之宇。宇宙神秘莫测又与我们息息相关，其蕴含无尽的知识和美丽神秘的星空吸引着无数学者为之痴迷。一中天文学会是一个很好的平台对于天文爱好者，可以让一届届天文爱好者在天文社学习知识、观测天体，燃烧热情', '15.jpg', '3');
INSERT INTO `asso` VALUES ('16', '纸艺社', '纸艺社，就是使用不同规格的纸张折出各式各样的作品。在纸艺社，你将会学习折纸教程中的基本符号与一些可爱的小作品；探讨在折纸上遇到的困难；也可以没事与社员嗑嗑瓜子，唠唠嗑。', '16.jpg', '5');
INSERT INTO `asso` VALUES ('17', 'AE电音社', ' 当下，电子音乐涉足领域覆盖了国内外乐坛的很大部分。在中国，更是开启了电音元年，全球最大电音节Ultra进军中国，王思聪生日多次邀请大牌DJ，不可否认的是，电子音乐越来越受欢迎。', '17.jpg', '4');
INSERT INTO `asso` VALUES ('18', '篮球社', '宗旨：让每个热爱篮球的人实现篮球梦。', '18.jpg', '5');
INSERT INTO `asso` VALUES ('19', '乒乓球社', '我们疾行于球台前，会神于挥拍间，比赛时沉稳而不失狂野。赛后，练习时，我们却总是欢声笑语，活泼无限。 没错，这就是我们活泼青春激情四射的一中乒乓球社，一个温暖的大家庭~', '19.jpg', '1');
INSERT INTO `asso` VALUES ('20', '医学爱好者协会', '欢迎加入医学爱好者协会！简称医协，是爱好医学知识者的集聚地。这里能够讨论自己对各类医学知识的见解，提出自己的疑惑，更可以提高自己的医学素养，扩展自己的知识面。', '20.jpg', '2');
INSERT INTO `asso` VALUES ('21', 'DT协会', '青岛科技大学DT协会（Data Technogical协会）是一个由一群喜爱传媒技术的青科大学生组成的，兼顾图片处理和视频剪辑的学生社团。在现在这种社会的背景下，学习和交流大数据社会下我们应该如何去把握市场，如何在这种情况下运用大数据。未来大数据是发展中非常重要的东西，学会搜集和处理数据。不断学习跟巩固互联网的营销模式跟大数据时代的创新，创业。培养学生们的兴趣，给喜欢互联网，喜欢大数据的同学们提供一个交流，学习，共同进步的学生组织社团。其下设秘书部、宣传部、外联部相关部门。', '21.png', '3');
INSERT INTO `asso` VALUES ('22', 'Marvel魔方协会', '青岛科技大学marvel魔方协会成立于2013年10月，在2014年正式由魔方协会更名为marvel魔方协会，原魔方协会可以追溯到2010年，是由青岛科技大学魔方高手以及有丰富的教学经验的魔方爱好者共同发起建立的，是以弘扬魔方文化，丰富校园生活，提高魔方爱好者的速拧水平为目标的学生社团。', '23.jpg', '3');
INSERT INTO `asso` VALUES ('23', '魅影曳步舞协会', '魅影曳步舞协会成立于2015年5月24日。魅影曳步舞协会是青岛科技大学校级社团，为三星级社团，属于兴趣爱好类社团。魅影曳步舞协会是一群热爱曳步舞、充满激情、积极向上、幽默友爱、团结互助的大学生聚集地。在这里有互帮互助的同学，有积极进取的朋友，更有情深四海的兄弟，如果你希望在舞蹈中找到一群可以生死相依、志同道合的伙伴，希望不断取得进步，那么，别犹豫，我们等的就是你！你要找的就是我们，我们在这里等着你！为了方便于管理，内部分为会长、副会长、秘书长、教练、后勤等几个部分。', '24.png', '1');
INSERT INTO `asso` VALUES ('24', '音乐爱好者协会', '青岛科技大学音乐爱好者协会成立于1999年9月9日，是校团委领导下的全校性的学生社团组织.。协会下设秘书处，宣传部，组织部，外联部，策划部等五大部门。协会开设了免费的特色吉他班，即由水平较高的会员为喜爱吉他的同学传授技艺，大家互相交流学习，切磋技艺，共同进步。即使你没有任何音乐功底也可以参加。我们还会为会员提供演出锻炼的机会，让你在这里展现才能。总之，只要你喜欢音乐，只要你拥有才能，只要你怀揣梦想，我们真诚欢迎你的加入，们的目标是：让生活充满音乐，没有寂寞', '25.jpg', '4');
INSERT INTO `asso` VALUES ('25', '缤彩魔术气球社', '本社团成立于2016年9月百团大战之时。本社团是一个致力于让每位社员掌握气球艺术造型入门技巧的兴趣社团，同时本社团也旨在让每一位对气球感兴趣的同学可以完成从“学习气球”“实践气球”到“创造气球”的转变，发掘每位社员的创造力是我们应有的职责。纵观全国，气球社团只在中小学生中出现过，大学生社团中气球社团可以说是我们只此一家。虽然没有前车之鉴，但这也给了我们机会来发扬“敢为人先，开拓创新”的科大精神。作为一个新成立社团，本社团必定牢记“橡胶品格”，克服发展道路上的所有困难，让气球成为我们人生发展的第一步。', '26.jpg', '1');
INSERT INTO `asso` VALUES ('26', '魔方协会', '魔方协会是2016年新成立的社团，本着以魔会友的理念，由一群热爱魔方的小伙伴共同成立。还记得曾经那个童年的小小梦想么？', '27.jpg', '2');
INSERT INTO `asso` VALUES ('27', '凌空排球社', '青岛科技大学凌空排球社正式成立于2014年，由一群热爱排球并希望将这种运动传承和继续下去的同学们创立。排球社创建的目的是更加广泛地将排球这项运动在校园里传播 。我们经常组织训练，为新老会员提供了一个广大的舞台来展示自己的球技，这样既能使老队员们满意地“退役”，又让年轻队员拥有展示自我、大显身手的机会；我们还常与兄弟协会一起举办友谊赛，旨在促进所有排球爱好者的交流和沟通，让大家能够更好地互相认识了解。排球社以“热爱排球、玩耍排球、享受排球”为宗旨，以提倡全民运动、增强体质、发展团结为目标；以广交朋', '28.jpg', '2');
INSERT INTO `asso` VALUES ('28', '梅花桩武术协会', '青岛科技大学梅花桩武术协会（四方校区）成立于2002年11月14日，内部分设秘书处、财务部、宣传部、技术部以及组织部。梅花拳属于传统武术，是采周易之神奇妙用，夺孙子兵法之谋略，深受传统文化影响的一支文武合一的文化，故梅花桩最大的特点是文武合一， 以武治心，通过平时的训练和对拳理的学习达到“强身健体，技击制敌，开发智慧”的目的。梅花桩协会成立的宗旨是“弘扬中华传统文化，传承梅花拳，渡人渡己”，经过15年来老师与师兄师姐们的不懈努力，青科梅花武协得到了飞速发展，吸引了一大批热爱武术的志同道合之士加入，人员不断发展壮大，社团管理有章可依，各部门各司其职，内部结构不断优化。', '56A64AC3D8CC5E0CEBFE98FCF89_AA9D7843_7D19.png', '2');
INSERT INTO `asso` VALUES ('29', 'Be Young英语晨读社团', 'Be Young英语晨读社团成立于2012年5月，是由每天在东山操场上晨读的一个阳光快乐的Big Family组成的青岛科技大学校级社团。社团以“提高自己，帮助他人”为宗旨，举行晨读过程中有英语达人带练，专业细致地讲解五十个美式音标，每周会有一篇脱口而出的英语演讲，系统地为有共同爱好的人提升英文听说实力，让你说一口标准流利的英文，做英语实力最牛的理科生！此外，社团还会举办英语角，演讲比赛，教英文歌曲等趣味活动，让我们快乐热血的爱上英文！Be Young教你玩转英文，高分飘过四六级！想让你的大学生活变得不一样么，这里有一群快乐洒脱实力超群的人儿哦！', 'E6A242820B5E375D2EC8FDB2511_B85362EC_31568.png', '3');
INSERT INTO `asso` VALUES ('30', '职业精英社', '我社注重理论与学习实践相结合，校内活动和校外项目兼容发展的模式，结合校园代理、市场开发、项目合作、兼职就业与一身，引导青岛科大各个学院充满激情、满怀报负的创业精英，使同学们认清社会形势，顺应社会潮流，提高团队合作意识，创业意识，自助择业，自主创业，书写新一届的精英传奇。', 'b833686a-5790-4fd0-b0af-5fff09b34729A7C98824C8BCD20389C1D5894B4_677FB787_AAE4E.png', '4');

-- ----------------------------
-- Table structure for category_
-- ----------------------------
DROP TABLE IF EXISTS `category_`;
CREATE TABLE `category_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

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
  `time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `click` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_as_con` (`aid`),
  CONSTRAINT `fk_as_con` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '1', '【缤FUN社团】力拔山兮气盖世，决战活中英雄志', '这次一年一度的社团“三走”活动拔河比赛已经结束了，相信社联和社团最终收获的不只有成功或失败。更重要的是那一份拼搏的豪情和彼此间的友谊。让我们期待来年的“三走”活动更加精彩！', 'aaa', '2018-04-02 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('2', '2', '缘弈棋社丨我和你的故事从这里开始', '缘弈棋社开始招新啦~~，在这种大喜日子，小编决定要给大家详细介绍一下缘弈棋社。点击下方阅读全文，有详细简介哦111111111111', 'bbb', '2018-04-26 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('3', '3', '扫除情绪垃圾，释放心灵空间', '是时候为自己的内心来一次彻底的到扫除了！今天某某心理协会为您提供别开生面的一次体验！尽情宣泄积累多时的情绪垃圾，释放心灵空间，储存更多快乐和幸福，用色彩描绘更绚丽的自我风采吧！', 'ccc', '2018-04-01 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('4', '4', '你是否为繁重的学习任务感到疲惫？', '是时候为自己的内心来一次彻底的到扫除了！今天某某心理协会为您提供别开生面的一次体验！尽情宣泄积累多时的情绪垃圾，释放心灵空间，储存更多快乐和幸福，用色彩描绘更绚丽的自我风采吧！', 'ddd', '2018-03-05 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('5', '6', '你是否为琐碎的生活小事感到心烦？', '是时候为自己的内心来一次彻底的到扫除了！今天某某心理协会为您提供别开生面的一次体验！尽情宣泄积累多时的情绪垃圾，释放心灵空间，储存更多快乐和幸福，用色彩描绘更绚丽的自我风采吧！', 'eee', '2018-03-12 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('6', '7', '你是否为枯燥的工作方式感到厌倦？', '是时候为自己的内心来一次彻底的到扫除了！今天某某心理协会为您提供别开生面的一次体验！尽情宣泄积累多时的情绪垃圾，释放心灵空间，储存更多快乐和幸福，用色彩描绘更绚丽的自我风采吧！', 'fff', '2018-03-12 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('7', '8', '组织宗旨——服务社团 管理社团 发展社团', '服务社团是社联的“心”．社团联合会是为华工众多社团而生的，用心为社团提供优质满意的服务我们义不容辞', 'ggg', '2018-04-11 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('8', '9', '组织宗旨——服务社团 管理社团 发展社团', '发展社团是社联的“足“．发展是服务与管理的目的，我们社联究竟能走多远，到底还是取决于社团的发展状况．整体规划华工社团的发展方向，切实为社团提供有建设性的意见．', 'hhh', '2018-02-12 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('9', '10', '组织精神——全力以赴 同甘共苦', '社团联合会是我们一起开拓的事业，九年的坎坷而辉煌的历程不可以在我们的脚下停滞不前，我们要全力以赴，相信团队的力量，这是我们内心深处对事业与梦想的呼喊与执着，这是同事之间心照不宣的默契与鼓励。', 'iii', '2018-03-28 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('10', '4', '社联文化——社联** 一条心 一家亲', '九年的风雨路，让我们更加坚定所有社联人都是一家人，每个人都可以在这里找到温暖、找到归属感、找到家的感觉、找到最好的朋友。', 'a11', '2018-03-18 00:00:00', '00000000000');
INSERT INTO `news` VALUES ('12', '1', '1', '11', '1', '2018-04-02 13:32:10', '00000000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhangsan', '1112', '男', '110112', '1', '1');
INSERT INTO `user` VALUES ('3', '王五', '3333', '女', '546156', '1', '1');
INSERT INTO `user` VALUES ('4', 'zais', '2121', '男', '范德萨', '1', '3');
INSERT INTO `user` VALUES ('5', '111', '111', '女', '2211@qq.com', '1', '26');
SET FOREIGN_KEY_CHECKS=1;
