/*
Navicat MySQL Data Transfer

Source Server         : A318
Source Server Version : 50096
Source Host           : 127.0.0.1:3306
Source Database       : edu

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2019-07-24 10:49:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo` (
  `classId` int(11) NOT NULL auto_increment,
  `className` varchar(50) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `teacherId` int(11) default NULL,
  PRIMARY KEY  (`classId`),
  KEY `teacherId` (`teacherId`),
  KEY `FK_Reference_1` (`gradeId`),
  CONSTRAINT `classinfo_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacherinfo` (`teacherId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`gradeId`) REFERENCES `gradeinfo` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES ('1', '18软件一班', '1', '1');
INSERT INTO `classinfo` VALUES ('2', '18软件二班', '1', '1');
INSERT INTO `classinfo` VALUES ('3', '18软件三班', '1', '1');
INSERT INTO `classinfo` VALUES ('4', '18软件四班', '1', '1');
INSERT INTO `classinfo` VALUES ('5', '18软件五班', '1', '1');
INSERT INTO `classinfo` VALUES ('6', '18软件六班', '1', '1');
INSERT INTO `classinfo` VALUES ('7', '17软件一班', '2', '2');
INSERT INTO `classinfo` VALUES ('8', '17软件二班', '2', '2');
INSERT INTO `classinfo` VALUES ('9', '17软件三班', '2', '2');
INSERT INTO `classinfo` VALUES ('10', '17软件四班', '2', '2');
INSERT INTO `classinfo` VALUES ('11', '17软件五班', '2', '2');
INSERT INTO `classinfo` VALUES ('12', '17软件六班', '2', '2');
INSERT INTO `classinfo` VALUES ('13', '16软件一班', '3', '3');
INSERT INTO `classinfo` VALUES ('14', '16软件二班', '3', '3');
INSERT INTO `classinfo` VALUES ('15', '16软件三班', '3', '3');
INSERT INTO `classinfo` VALUES ('16', '16软件四班', '3', '3');
INSERT INTO `classinfo` VALUES ('17', '16软件五班', '3', '3');
INSERT INTO `classinfo` VALUES ('18', '16软件六班', '3', '3');
INSERT INTO `classinfo` VALUES ('19', '15软件一班', '4', '4');
INSERT INTO `classinfo` VALUES ('20', '15软件二班', '4', '4');

-- ----------------------------
-- Table structure for courseinfo
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo` (
  `courseId` int(11) NOT NULL auto_increment,
  `courseName` varchar(50) NOT NULL,
  `division` int(11) default '0',
  `gradeId` int(11) default NULL,
  PRIMARY KEY  (`courseId`),
  KEY `gradeId` (`gradeId`),
  CONSTRAINT `courseinfo_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `gradeinfo` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseinfo
-- ----------------------------
INSERT INTO `courseinfo` VALUES ('1', '大学语文一', '0', '1');
INSERT INTO `courseinfo` VALUES ('2', '高等数学一', '0', '1');
INSERT INTO `courseinfo` VALUES ('3', '大学英语一', '0', '1');
INSERT INTO `courseinfo` VALUES ('4', '思修品德', '0', '1');
INSERT INTO `courseinfo` VALUES ('5', '大学历史', '0', '1');
INSERT INTO `courseinfo` VALUES ('6', '毛概思想', '0', '2');
INSERT INTO `courseinfo` VALUES ('7', '大学生职业规划', '0', '2');
INSERT INTO `courseinfo` VALUES ('8', 'javaScript', '0', '3');
INSERT INTO `courseinfo` VALUES ('9', 'java基础', '0', '2');
INSERT INTO `courseinfo` VALUES ('10', '数据结构', '0', '1');
INSERT INTO `courseinfo` VALUES ('11', 'mysql数据库设计', '0', '2');
INSERT INTO `courseinfo` VALUES ('12', 'C语言', '0', '1');
INSERT INTO `courseinfo` VALUES ('13', 'Struts框架技术', '0', '3');
INSERT INTO `courseinfo` VALUES ('14', '大学英语二', '0', '2');
INSERT INTO `courseinfo` VALUES ('15', '高等数学二', '0', '2');
INSERT INTO `courseinfo` VALUES ('16', 'spring框架技术', '0', '3');

-- ----------------------------
-- Table structure for examchooseinfo
-- ----------------------------
DROP TABLE IF EXISTS `examchooseinfo`;
CREATE TABLE `examchooseinfo` (
  `chooseId` int(11) NOT NULL auto_increment,
  `studentId` int(11) NOT NULL,
  `examPaperId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `chooseResult` varchar(500) NOT NULL,
  PRIMARY KEY  (`chooseId`),
  KEY `FK_Reference_11` (`studentId`),
  KEY `FK_Reference_12` (`examPaperId`),
  KEY `FK_Reference_13` (`subjectId`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`studentId`) REFERENCES `studentinfo` (`studentId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`examPaperId`) REFERENCES `exampaperinfo` (`examPaperId`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`subjectId`) REFERENCES `subjectinfo` (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examchooseinfo
-- ----------------------------
INSERT INTO `examchooseinfo` VALUES ('31', '115', '5', '233', 'A');
INSERT INTO `examchooseinfo` VALUES ('32', '115', '5', '234', 'A');
INSERT INTO `examchooseinfo` VALUES ('33', '115', '5', '235', 'A');
INSERT INTO `examchooseinfo` VALUES ('34', '115', '5', '236', 'A');
INSERT INTO `examchooseinfo` VALUES ('35', '115', '5', '237', 'A');
INSERT INTO `examchooseinfo` VALUES ('36', '115', '5', '238', 'A');
INSERT INTO `examchooseinfo` VALUES ('37', '115', '5', '239', 'B');

-- ----------------------------
-- Table structure for examhistoryinfo
-- ----------------------------
DROP TABLE IF EXISTS `examhistoryinfo`;
CREATE TABLE `examhistoryinfo` (
  `historyId` int(11) NOT NULL auto_increment,
  `studentId` int(11) NOT NULL,
  `examPaperId` int(11) NOT NULL,
  `examScore` int(11) default NULL,
  PRIMARY KEY  (`historyId`),
  KEY `FK_Reference_10` (`studentId`),
  KEY `FK_Reference_9` (`examPaperId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`studentId`) REFERENCES `studentinfo` (`studentId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`examPaperId`) REFERENCES `exampaperinfo` (`examPaperId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examhistoryinfo
-- ----------------------------
INSERT INTO `examhistoryinfo` VALUES ('5', '115', '5', '4');

-- ----------------------------
-- Table structure for exampaperinfo
-- ----------------------------
DROP TABLE IF EXISTS `exampaperinfo`;
CREATE TABLE `exampaperinfo` (
  `examPaperId` int(11) NOT NULL auto_increment,
  `examPaperName` varchar(50) NOT NULL,
  `subjectNum` int(11) NOT NULL,
  `examPaperTime` int(11) NOT NULL,
  `examPaperScore` int(11) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `division` int(11) default '0',
  `examPaperEasy` int(11) default '1',
  PRIMARY KEY  (`examPaperId`),
  KEY `FK_Reference_4` (`gradeId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`gradeId`) REFERENCES `gradeinfo` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exampaperinfo
-- ----------------------------
INSERT INTO `exampaperinfo` VALUES ('5', 'Spring', '7', '5', '14', '3', '0', '0');

-- ----------------------------
-- Table structure for examplaninfo
-- ----------------------------
DROP TABLE IF EXISTS `examplaninfo`;
CREATE TABLE `examplaninfo` (
  `examPlanId` int(11) NOT NULL auto_increment,
  `courseId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `examPaperId` int(11) NOT NULL,
  `beginTime` datetime NOT NULL,
  PRIMARY KEY  (`examPlanId`),
  KEY `courseId` (`courseId`),
  KEY `classId` (`classId`),
  KEY `examPaperId` (`examPaperId`),
  CONSTRAINT `examplaninfo_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courseinfo` (`courseId`),
  CONSTRAINT `examplaninfo_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `classinfo` (`classId`),
  CONSTRAINT `examplaninfo_ibfk_3` FOREIGN KEY (`examPaperId`) REFERENCES `exampaperinfo` (`examPaperId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examplaninfo
-- ----------------------------
INSERT INTO `examplaninfo` VALUES ('2', '16', '13', '5', '2019-07-22 16:11:45');

-- ----------------------------
-- Table structure for examsubjectmiddleinfo
-- ----------------------------
DROP TABLE IF EXISTS `examsubjectmiddleinfo`;
CREATE TABLE `examsubjectmiddleinfo` (
  `esmId` int(11) NOT NULL auto_increment,
  `examPaperId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  PRIMARY KEY  (`esmId`),
  KEY `FK_Reference_7` (`examPaperId`),
  KEY `FK_Reference_8` (`subjectId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`examPaperId`) REFERENCES `exampaperinfo` (`examPaperId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`subjectId`) REFERENCES `subjectinfo` (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examsubjectmiddleinfo
-- ----------------------------
INSERT INTO `examsubjectmiddleinfo` VALUES ('37', '5', '233');
INSERT INTO `examsubjectmiddleinfo` VALUES ('38', '5', '234');
INSERT INTO `examsubjectmiddleinfo` VALUES ('39', '5', '235');
INSERT INTO `examsubjectmiddleinfo` VALUES ('40', '5', '236');
INSERT INTO `examsubjectmiddleinfo` VALUES ('41', '5', '237');
INSERT INTO `examsubjectmiddleinfo` VALUES ('42', '5', '238');
INSERT INTO `examsubjectmiddleinfo` VALUES ('43', '5', '239');

-- ----------------------------
-- Table structure for gradeinfo
-- ----------------------------
DROP TABLE IF EXISTS `gradeinfo`;
CREATE TABLE `gradeinfo` (
  `gradeId` int(11) NOT NULL auto_increment,
  `gradeName` varchar(50) NOT NULL,
  PRIMARY KEY  (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gradeinfo
-- ----------------------------
INSERT INTO `gradeinfo` VALUES ('1', '大一');
INSERT INTO `gradeinfo` VALUES ('2', '大二');
INSERT INTO `gradeinfo` VALUES ('3', '大三');
INSERT INTO `gradeinfo` VALUES ('4', '大四');

-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `studentId` int(11) NOT NULL auto_increment,
  `studentName` varchar(10) NOT NULL,
  `studentAccount` varchar(10) NOT NULL,
  `studentPwd` varchar(10) NOT NULL,
  `classId` int(11) NOT NULL,
  PRIMARY KEY  (`studentId`),
  KEY `FK_Reference_3` (`classId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`classId`) REFERENCES `classinfo` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES ('1', '李坤', 'likun', '123456', '1');
INSERT INTO `studentinfo` VALUES ('2', '李茜茜', 'lixix', '123456', '1');
INSERT INTO `studentinfo` VALUES ('3', '刘宇', 'liuyu', '123456', '1');
INSERT INTO `studentinfo` VALUES ('4', '老高', 'laogao', '123456', '1');
INSERT INTO `studentinfo` VALUES ('5', 'jack', 'jack', '123456', '4');
INSERT INTO `studentinfo` VALUES ('6', '寅鑫', 'yinxin', '123456', '1');
INSERT INTO `studentinfo` VALUES ('7', '陈坤', 'chenkun', '123456', '1');
INSERT INTO `studentinfo` VALUES ('8', '梁辰', 'liangchen', '123456', '1');
INSERT INTO `studentinfo` VALUES ('9', '黄宇', 'huangyu', '123456', '2');
INSERT INTO `studentinfo` VALUES ('10', '加晓', 'jiaxiao', '123456', '2');
INSERT INTO `studentinfo` VALUES ('11', '然烁', 'ranshuo', '123456', '2');
INSERT INTO `studentinfo` VALUES ('12', '帆年', 'fannian', '123456', '2');
INSERT INTO `studentinfo` VALUES ('13', '帆加', 'fanjia', '123456', '2');
INSERT INTO `studentinfo` VALUES ('14', '彬谛', 'binti', '123456', '2');
INSERT INTO `studentinfo` VALUES ('15', '皓吉', 'haoji', '123456', '2');
INSERT INTO `studentinfo` VALUES ('16', '驰泽', 'chize', '123456', '2');
INSERT INTO `studentinfo` VALUES ('17', '博琛', 'bochen', '123456', '2');
INSERT INTO `studentinfo` VALUES ('18', '骏郁', 'junyu', '123456', '2');
INSERT INTO `studentinfo` VALUES ('19', '谷炳', 'gubin', '123456', '2');
INSERT INTO `studentinfo` VALUES ('20', '斌澄', 'bincheng', '123456', '2');
INSERT INTO `studentinfo` VALUES ('21', '加骏', 'jiajun', '123456', '3');
INSERT INTO `studentinfo` VALUES ('22', '升祥', 'shengxiang', '123456', '3');
INSERT INTO `studentinfo` VALUES ('23', '锟运', 'kunyun', '123456', '3');
INSERT INTO `studentinfo` VALUES ('24', '运泽', 'yunze', '123456', '3');
INSERT INTO `studentinfo` VALUES ('25', '炳楷', 'binxie', '123456', '3');
INSERT INTO `studentinfo` VALUES ('26', '星腾', 'xinteng', '123456', '3');
INSERT INTO `studentinfo` VALUES ('27', '家德', 'jiade', '123456', '3');
INSERT INTO `studentinfo` VALUES ('28', '子杰', 'zijie', '123456', '3');
INSERT INTO `studentinfo` VALUES ('29', '凯乘', 'kaicheng', '123456', '3');
INSERT INTO `studentinfo` VALUES ('30', '诚锋', 'chengfeng', '123456', '3');
INSERT INTO `studentinfo` VALUES ('31', '海晨', 'haichen', '123456', '3');
INSERT INTO `studentinfo` VALUES ('32', '星振', 'xinzhen', '123456', '3');
INSERT INTO `studentinfo` VALUES ('33', '韦加', 'weijia', '123456', '4');
INSERT INTO `studentinfo` VALUES ('34', '德逸', 'deyi', '123456', '4');
INSERT INTO `studentinfo` VALUES ('35', '谷嘉', 'guajia', '123456', '4');
INSERT INTO `studentinfo` VALUES ('36', '逸强', 'yiqiang', '123456', '4');
INSERT INTO `studentinfo` VALUES ('37', '柏鹤', 'baihe', '123456', '4');
INSERT INTO `studentinfo` VALUES ('38', '权杞', 'quanqi', '123456', '4');
INSERT INTO `studentinfo` VALUES ('39', '辞平', 'cipin', '123456', '4');
INSERT INTO `studentinfo` VALUES ('40', '禧哲', 'xizhe', '123456', '4');
INSERT INTO `studentinfo` VALUES ('41', '贤帆', 'xianfan', '123456', '5');
INSERT INTO `studentinfo` VALUES ('42', '琛恒', 'chenhuan', '123456', '5');
INSERT INTO `studentinfo` VALUES ('43', '杞沛', 'qipei', '123456', '5');
INSERT INTO `studentinfo` VALUES ('44', '锟潍', 'kunhuai', '123456', '5');
INSERT INTO `studentinfo` VALUES ('45', '烁帆', 'yefan', '123456', '5');
INSERT INTO `studentinfo` VALUES ('46', '伟星', 'weixing', '123456', '5');
INSERT INTO `studentinfo` VALUES ('47', '日炳', 'ribin', '123456', '5');
INSERT INTO `studentinfo` VALUES ('48', '星桓', 'xingheng', '123456', '6');
INSERT INTO `studentinfo` VALUES ('49', '阳骏', 'yangjun', '123456', '6');
INSERT INTO `studentinfo` VALUES ('50', '成颜', 'chenyan', '123456', '6');
INSERT INTO `studentinfo` VALUES ('51', '帝延', 'diyan', '123456', '6');
INSERT INTO `studentinfo` VALUES ('52', '禧龙', 'xilong', '123456', '6');
INSERT INTO `studentinfo` VALUES ('53', '裕康', 'lukang', '123456', '6');
INSERT INTO `studentinfo` VALUES ('54', '喆骏', 'zhejun', '123456', '6');
INSERT INTO `studentinfo` VALUES ('55', '乘安', 'chengan', '123456', '6');
INSERT INTO `studentinfo` VALUES ('56', '弦珊', '9b3146', '444383', '7');
INSERT INTO `studentinfo` VALUES ('57', '采媛', '273c06', 'eea71c', '7');
INSERT INTO `studentinfo` VALUES ('58', '菡敏', 'd655a2', '4ebacb', '7');
INSERT INTO `studentinfo` VALUES ('59', '淑萱', 'fad476', '64e161', '7');
INSERT INTO `studentinfo` VALUES ('60', '珠菡', '808e34', 'e3a1e3', '7');
INSERT INTO `studentinfo` VALUES ('61', '涵怡', 'bb0737', '72fb07', '7');
INSERT INTO `studentinfo` VALUES ('62', '优雨', 'eb3983', '35ec7b', '7');
INSERT INTO `studentinfo` VALUES ('63', '初娜', '90af66', 'c89ef5', '7');
INSERT INTO `studentinfo` VALUES ('64', '可韵', 'c94913', '48a92b', '7');
INSERT INTO `studentinfo` VALUES ('65', '文惠', '9da445', '2ad233', '8');
INSERT INTO `studentinfo` VALUES ('66', '薇娅', 'd9d54f', '644c47', '8');
INSERT INTO `studentinfo` VALUES ('67', '依香', '88204b', '9ae21a', '8');
INSERT INTO `studentinfo` VALUES ('68', '格璇', '0b1b4f', '5fb247', '8');
INSERT INTO `studentinfo` VALUES ('69', '月娜', 'af25d9', '03c2bc', '8');
INSERT INTO `studentinfo` VALUES ('70', '玉梦', 'ee0da0', 'c8da43', '8');
INSERT INTO `studentinfo` VALUES ('71', '玉瑶', '882c65', 'eb7bf2', '8');
INSERT INTO `studentinfo` VALUES ('72', '颖媛', 'c77c53', 'ab1ca4', '8');
INSERT INTO `studentinfo` VALUES ('73', '鹤芸', 'cfd249', 'b3c3e1', '8');
INSERT INTO `studentinfo` VALUES ('74', '心云', '552b7d', '4a6cae', '9');
INSERT INTO `studentinfo` VALUES ('75', '沛芳', '20fb7f', 'f7e47c', '9');
INSERT INTO `studentinfo` VALUES ('76', '香云', '01f388', '8f7318', '9');
INSERT INTO `studentinfo` VALUES ('77', '花馨', 'bd8e90', 'a6fcc9', '9');
INSERT INTO `studentinfo` VALUES ('78', '鑫璇', '287e24', 'c6aa36', '9');
INSERT INTO `studentinfo` VALUES ('79', '凡娅', '1e4023', '2a13db', '9');
INSERT INTO `studentinfo` VALUES ('80', '菲碧', '880592', '8d58ca', '9');
INSERT INTO `studentinfo` VALUES ('81', '涵桂', '9faf2f', '4ec550', '9');
INSERT INTO `studentinfo` VALUES ('82', '雨采', '465815', 'd85616', '9');
INSERT INTO `studentinfo` VALUES ('83', '丽洲', 'de3c87', 'e63f55', '10');
INSERT INTO `studentinfo` VALUES ('84', '欣桂', '13ccce', '938f6c', '10');
INSERT INTO `studentinfo` VALUES ('85', '琬家', 'd5a202', 'e22c7f', '10');
INSERT INTO `studentinfo` VALUES ('86', '华灵', 'b16839', 'e8c531', '10');
INSERT INTO `studentinfo` VALUES ('87', '丽静', 'b765b1', '071c7c', '10');
INSERT INTO `studentinfo` VALUES ('88', '彤琛', 'd17ce5', 'b98654', '10');
INSERT INTO `studentinfo` VALUES ('89', '梦丽', '51ee1a', '9b78fd', '10');
INSERT INTO `studentinfo` VALUES ('90', '雯诗', '2407ab', 'cdaf39', '10');
INSERT INTO `studentinfo` VALUES ('91', '莉晨', 'f829a8', 'bb0751', '10');
INSERT INTO `studentinfo` VALUES ('92', '茜柏', '39252a', '05f5e0', '11');
INSERT INTO `studentinfo` VALUES ('93', '芸漫', 'f85daf', '00fe7d', '11');
INSERT INTO `studentinfo` VALUES ('94', '惠曦', '230210', '3a3d4b', '11');
INSERT INTO `studentinfo` VALUES ('95', '月蓓', '2b5b9e', 'da37b7', '11');
INSERT INTO `studentinfo` VALUES ('96', '梦惠', 'ff9af7', '34d9fb', '11');
INSERT INTO `studentinfo` VALUES ('97', '碧阳', '1a7cf4', '1f697f', '11');
INSERT INTO `studentinfo` VALUES ('98', '雨紫', '0718ec', '54c12b', '11');
INSERT INTO `studentinfo` VALUES ('99', '芙怡', '8e87cd', 'cabd0f', '11');
INSERT INTO `studentinfo` VALUES ('100', '婷珍', '834219', 'fc691e', '11');
INSERT INTO `studentinfo` VALUES ('101', '婷珍', '834219', 'fc691e', '11');
INSERT INTO `studentinfo` VALUES ('102', '婷珍', '834219', 'fc691e', '11');
INSERT INTO `studentinfo` VALUES ('103', '婷珍', '834219', 'fc691e', '11');
INSERT INTO `studentinfo` VALUES ('104', '诗岚', 'e40e03', '61fdfe', '12');
INSERT INTO `studentinfo` VALUES ('105', '涵颖', '85c082', '7ef429', '12');
INSERT INTO `studentinfo` VALUES ('106', '芝蕾', '2e3276', '37dba2', '12');
INSERT INTO `studentinfo` VALUES ('107', '莉枫', 'ad4a79', 'fc0db5', '12');
INSERT INTO `studentinfo` VALUES ('108', '舒菡', '572c59', '9203cc', '12');
INSERT INTO `studentinfo` VALUES ('109', '芸敏', '2e1b40', '07ab44', '12');
INSERT INTO `studentinfo` VALUES ('110', '妮华', 'ef0856', '72319d', '12');
INSERT INTO `studentinfo` VALUES ('111', '诗琬', '53f566', '57bc1b', '12');
INSERT INTO `studentinfo` VALUES ('112', '珍瑶', 'b0eb38', 'fe2583', '12');
INSERT INTO `studentinfo` VALUES ('113', '月馨', '5c05fc', '0df25a', '12');
INSERT INTO `studentinfo` VALUES ('114', '华莲', 'efdcb8', '960f3e', '13');
INSERT INTO `studentinfo` VALUES ('115', '菲鸿', '9744b6', '123456', '13');
INSERT INTO `studentinfo` VALUES ('116', '妍雪', 'd83968', '02f679', '13');
INSERT INTO `studentinfo` VALUES ('117', '茹雨', 'cec606', '861194', '13');
INSERT INTO `studentinfo` VALUES ('118', '莉婷', '116d99', 'd93ebb', '13');
INSERT INTO `studentinfo` VALUES ('119', '桂曦', '3bab88', '802c1d', '13');
INSERT INTO `studentinfo` VALUES ('120', '碧鑫', '65c60c', '964d8b', '13');
INSERT INTO `studentinfo` VALUES ('121', '馨珊', '618891', 'c5bf7f', '13');
INSERT INTO `studentinfo` VALUES ('122', '芙柔', 'd428a4', '37040f', '14');
INSERT INTO `studentinfo` VALUES ('123', '家香', '0a774b', 'f768d1', '14');
INSERT INTO `studentinfo` VALUES ('124', '格琬', '1ab9a3', '1f31a7', '14');
INSERT INTO `studentinfo` VALUES ('125', '林娜', 'e2422a', 'a89fd7', '14');
INSERT INTO `studentinfo` VALUES ('126', '丽敏', '26bc30', 'ffb6c3', '14');
INSERT INTO `studentinfo` VALUES ('127', '钰璟', '6c68b6', '85d0ee', '14');
INSERT INTO `studentinfo` VALUES ('128', '钰璟', '6c68b6', '85d0ee', '14');
INSERT INTO `studentinfo` VALUES ('129', '钰璟', '6c68b6', '85d0ee', '14');
INSERT INTO `studentinfo` VALUES ('130', '钰璟', '6c68b6', '85d0ee', '14');
INSERT INTO `studentinfo` VALUES ('131', '钰璟', '6c68b6', '85d0ee', '14');
INSERT INTO `studentinfo` VALUES ('132', '惠惠', '5c96c8', 'b9e003', '14');
INSERT INTO `studentinfo` VALUES ('133', '梦舒', 'a359f1', '6bc2e9', '14');
INSERT INTO `studentinfo` VALUES ('134', '呈怡', '096ae1', 'b89908', '14');
INSERT INTO `studentinfo` VALUES ('135', '俊露', 'e467da', '7280a3', '15');
INSERT INTO `studentinfo` VALUES ('136', '歆梦', 'd337ad', '819df9', '15');
INSERT INTO `studentinfo` VALUES ('137', '芙云', '5bb284', '124f6a', '15');
INSERT INTO `studentinfo` VALUES ('138', '琬欢', '86e9bc', '995259', '15');
INSERT INTO `studentinfo` VALUES ('139', '涵珊', '4880c1', '4b4979', '15');
INSERT INTO `studentinfo` VALUES ('140', '璇婷', '9da90e', '523ddd', '15');
INSERT INTO `studentinfo` VALUES ('141', '珊娅', '30510b', 'a2ae28', '15');
INSERT INTO `studentinfo` VALUES ('142', '梦静', '749ab4', '98b9fd', '15');
INSERT INTO `studentinfo` VALUES ('143', '梦静2', '749ab4', '98b9fd', '15');
INSERT INTO `studentinfo` VALUES ('144', '梦静3', '749ab4', '98b9fd', '15');
INSERT INTO `studentinfo` VALUES ('145', '梦静4', '749ab4', '98b9fd', '15');
INSERT INTO `studentinfo` VALUES ('146', '帝信', '5e8a39', 'ff749c', '15');
INSERT INTO `studentinfo` VALUES ('147', '瑞谛', '2c7ba3', '1eed42', '16');
INSERT INTO `studentinfo` VALUES ('148', '强翰', '4e8faa', 'eb7276', '16');
INSERT INTO `studentinfo` VALUES ('149', '俊栋', 'fb7399', '05415c', '16');
INSERT INTO `studentinfo` VALUES ('150', '乘材', '4dd44f', '36209a', '16');
INSERT INTO `studentinfo` VALUES ('151', '尧文', '3883a6', '523f72', '16');
INSERT INTO `studentinfo` VALUES ('152', '韦权', '66473a', '7203c0', '16');
INSERT INTO `studentinfo` VALUES ('153', '泽槐', '72cf03', '40bd99', '16');
INSERT INTO `studentinfo` VALUES ('154', '欣谛', '35d8d5', 'cde17b', '16');
INSERT INTO `studentinfo` VALUES ('155', '阳康', '684530', 'cdc7a4', '16');
INSERT INTO `studentinfo` VALUES ('156', '阳康1', '6845301', 'cdc7a4', '16');
INSERT INTO `studentinfo` VALUES ('157', '阳康2', '6845302', 'cdc7a4', '16');
INSERT INTO `studentinfo` VALUES ('158', '阳康3', '6845303', 'cdc7a4', '16');
INSERT INTO `studentinfo` VALUES ('159', '阳康4', '6845304', 'cdc7a4', '16');
INSERT INTO `studentinfo` VALUES ('160', '阳康5', '6845305', 'cdc7a4', '16');
INSERT INTO `studentinfo` VALUES ('161', '阳康6', '6845306', 'cdc7a4', '16');
INSERT INTO `studentinfo` VALUES ('162', '晖轩', '9b09b3', 'ba3d5b', '17');
INSERT INTO `studentinfo` VALUES ('163', '材谷', '305d63', 'cd93d8', '17');
INSERT INTO `studentinfo` VALUES ('164', '暄瑞', 'ee047a', 'ca51c5', '17');
INSERT INTO `studentinfo` VALUES ('165', '龙龙', '6af697', '90ffae', '17');
INSERT INTO `studentinfo` VALUES ('166', '文德', '7ed8b4', 'a4a743', '17');
INSERT INTO `studentinfo` VALUES ('167', '瑞韦', '84d7d7', '446cda', '17');
INSERT INTO `studentinfo` VALUES ('168', '斌博', '4940eb', 'fcbbf2', '17');
INSERT INTO `studentinfo` VALUES ('169', '远阳', 'ecee77', 'f831d7', '17');
INSERT INTO `studentinfo` VALUES ('170', '枫德', 'd036cc', '2958f4', '17');
INSERT INTO `studentinfo` VALUES ('171', '泽暄', '29b818', 'fc7314', '17');
INSERT INTO `studentinfo` VALUES ('172', '瑞韦', '84d7d7', '446cda', '18');
INSERT INTO `studentinfo` VALUES ('173', '坤骞', '802550', 'a3b535', '18');
INSERT INTO `studentinfo` VALUES ('174', '荣骏', '3b3287', '0f8622', '18');
INSERT INTO `studentinfo` VALUES ('175', '振骞', '35f7d6', '5d8037', '18');
INSERT INTO `studentinfo` VALUES ('176', '锦锟', 'c4911b', '24806e', '18');
INSERT INTO `studentinfo` VALUES ('177', '年佑', '08971a', '8911ee', '18');
INSERT INTO `studentinfo` VALUES ('178', '瑞韦', '84d7d7', '446cda', '18');
INSERT INTO `studentinfo` VALUES ('179', '瑞韦2', '84d7d7', '446cda', '18');
INSERT INTO `studentinfo` VALUES ('180', '瑞韦3', '84d7d7', '446cda', '18');
INSERT INTO `studentinfo` VALUES ('181', '瑞韦4', '84d7d7', '446cda', '18');
INSERT INTO `studentinfo` VALUES ('182', '基围虾', 'jwx', '446cda', '18');
INSERT INTO `studentinfo` VALUES ('183', '典韦', 'dianwei', '123456', '1');
INSERT INTO `studentinfo` VALUES ('184', 'zhangsan', 'zs', '123456', '2');
INSERT INTO `studentinfo` VALUES ('185', '李亏', 'likui', '123456', '1');
INSERT INTO `studentinfo` VALUES ('186', '万军凯', 'wjk', 'wanjunkai', '1');
INSERT INTO `studentinfo` VALUES ('187', '梁伟杰', 'lwj', '123456', '1');
INSERT INTO `studentinfo` VALUES ('188', '立坤坤', 'likunkun', '123456', '1');
INSERT INTO `studentinfo` VALUES ('189', '写真帮', 'xiezhen', '123456', '1');
INSERT INTO `studentinfo` VALUES ('190', '贾宋江', 'jsong', '123456', '12');
INSERT INTO `studentinfo` VALUES ('191', '张家豪', 'zjh', '123456', '1');

-- ----------------------------
-- Table structure for subjectinfo
-- ----------------------------
DROP TABLE IF EXISTS `subjectinfo`;
CREATE TABLE `subjectinfo` (
  `subjectId` int(11) NOT NULL auto_increment,
  `subjectName` varchar(500) NOT NULL,
  `optionA` varchar(500) NOT NULL,
  `optionB` varchar(500) NOT NULL,
  `optionC` varchar(500) NOT NULL,
  `optionD` varchar(500) NOT NULL,
  `rightResult` varchar(500) NOT NULL,
  `subjectScore` int(11) NOT NULL,
  `subjectType` int(11) default '0',
  `courseId` int(11) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `subjectEasy` int(11) default '1',
  `division` int(11) default '0',
  PRIMARY KEY  (`subjectId`),
  KEY `FK_Reference_5` (`courseId`),
  KEY `FK_Reference_6` (`gradeId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`courseId`) REFERENCES `courseinfo` (`courseId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`gradeId`) REFERENCES `gradeinfo` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjectinfo
-- ----------------------------
INSERT INTO `subjectinfo` VALUES ('3', '我国明代医学家李时珍编写医学巨著是：', '《齐民要术》', '《物种起源》', '《本草纲目》', '《扁鹊经》', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('4', '柑橘主要分布在南方，苹果主要分布在北方，造成这一分布差异的主要原因：', '湿度', '阳光', '温度', '水分', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('5', '动物体内各种类型的细胞中，具有最高全能性的细胞是：', '体细胞', '生殖细胞', '受精卵', '肝细胞', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('6', '由环境因素刺激动物所引起的最简单定向反应叫做：', '向性运动', '感性运动', '趋性', '生物钟', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('7', '属于第一信号系统参与的反射活动是：', '鹦鹉学舌', '飞蛾扑火', '婴儿排尿', '谈虎色变', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('8', '花生果是由下列哪一项发育而成的：', '花冠和花托', '子房壁', '子房壁和胚珠', '花托和胚珠', 'C', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('9', '湖泊在下列哪种情况下，湖水中的含氧量最低:', '白天，末被污染', '夜间，未被污染', '白天，被污染', '夜间，被污染', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('10', '有丝分裂中，姊妹染色单体着丝粒分开发生于：', '前期', '中期', '后期', '末期', 'C', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('11', '热带雨林在中国主要分布在：', '西双版纳', '海南岛', '台湾', '上述各项', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('12', '一种蝴蝶突然展开翅膀露出鲜艳的黑红环纹，这是什么行为：', '拟态', '警戒色', '威吓', '逃避', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('13', '酸雨主要是由——引起的：', 'NO，S02', 'NO，C02', 'C02，S02', 'NO，S02，C02', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('14', '无法使蛋白质变性沉淀的因素有：', '加入中性盐', '剧烈搅拌', '加入乙醇', '加热', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('15', '下列对叶绿素分子功能的叙述，不正确的是：', '吸收光能', '传递光能', '储藏光能', '转化光能', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('16', '下列食物中，属于果实的是：', '黄豆', '葵花籽', '花生仁', '蚕豆', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('17', '下列哪些病不是由病毒侵染直接引起的：', '乙肝', '口蹄疫', '疯牛病', '禽流感', 'C', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('18', '植物细胞中具有半自主性的细胞器是：', '高尔基体', '线粒体', '溶酶体', '内质网', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('19', '细胞中无核糖体存在的部位有：', '细胞质基质', '粗面内质网', '细胞核外膜', '溶酶体膜', 'D', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('20', '江苏省的省花是：', '茉莉花', '梅花', '桃花', '桂花', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('21', '江苏省的省树：', '香樟', '银杏', '水杉', '枫树', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('22', '茉莉花什么时候开花：', '1-3月份', '4-5月份', '6—10月份', '11-12月份', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('23', '银杏树原产于什么地方：', '印度', '泰国', '越南', '中国', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('24', '被国际上誉为“杂交水稻之父”的中国科学家是：', '袁隆平', ' 袁耀', '袁国平', '袁义达', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('25', '俗称\"四不象\"的动物是：', '麋鹿', '骡子', '驴', '梅花鹿', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('26', '世界上最好的咖啡产于：', '巴西', '德国', '牙买加', '匈牙利', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('27', '经常食用哪种食物容易引起铅中毒：', '松花蛋', '茶叶蛋', '荷包蛋', '咸鸭蛋', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('28', '1997 年世界第一只克隆羊诞生，它是在哪个国家诞生？', '英国', '美国', '前苏联', '澳大利亚', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('29', '每年的世界环境日在哪一天？', '6月4号', '43256', '6月6号', '6月7号', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('30', '植物细胞和动物细胞的主要区别？', '液泡', '质粒', '中心体', '细胞壁', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('31', '植物光合作用作用的动力是什么？', '水分', '氧气', '适宜温度', '太阳光', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('32', '南极特有的动物是：', '企鹅', '北极熊', '半滑舌鳎', '鮟鱇', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('33', '什么植物不是先开花，后长叶？', '连翘', '迎春花', '腊梅', '桂花', 'D', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('34', '世界上最毒的蜘蛛叫什么？', '红玫瑰', '毛蜘蛛', '狼蜘', '狼蛛', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('35', '不是我国的四大海产是哪四样？', '乌贼', '大黄鱼', '带鱼', '鳕鱼', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('36', '不是我国四大油料作物是什么？', '油菜', '大豆', '芝麻', '葵花籽', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('37', '人体最坚硬的部分是：', '牙齿', '脊椎', '颧骨', '肋骨', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('38', '地球的厚被是什么？', '地壳', '大气圈', '岩石圈', '水圈', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('39', '鸟类的祖先是什么鸟？', '翼龙', '始祖鸟', '候鸟', '鸵鸟', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('40', '最大的哺乳动物是什么？', '扬子鳄', '中华鲟', '大白鲨', '蓝鲸', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('41', '跑得最快的鸟是：', '环颈雉', '準', '鸵鸟', '企鹅', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('42', '最大的动物是：', '白鲸', '蓝鲸', '大白鲨', '中华鲟', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('43', '海洋中最多的生物是：', '光和生物', '浮游生物', '寄生生物', '腐生生物', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('44', '薄公英靠什么传播种子？', '靠风力', '靠水', '靠动物', '靠人', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('45', '鸟类中最小的是：', '麻雀', '金丝雀', '云雀', '蜂鸟', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('46', '人体内的水份约占体重的百分?仁嵌嗌伲?', '0', '0', '1', '1', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('47', '被称为菊月的月份是：', '八月', '九月', '十月', '十一月', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('48', '玉米受潮后产生的致癌物质是：', '黄曲霉毒素', '肉毒素', '青霉素', '红霉素', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('49', '绿色植物在生态系统中的地位是:', '消费者', '分解者', '传递者', '生产者', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('50', '银杏属于什么种类水果？', '复果', '坚果类', '聚合果', '蓇葖果', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('51', '下列属于我国特产的是:', '荔枝', '柿子', '白果', '山药', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('52', '下列属于种子植物的是:', '松', '柳树', '杉', '柏', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('53', '海带怎样一煮就烂?', '加酒精', '加盐巴', '加醋', '加酱油', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('54', '高血压病人适合食用以下哪种食物？', '南瓜', '芹菜', '番薯', '竹笋', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('55', '下列植物中，只能通过有性生殖繁育后代的是：', '向日葵', '马铃薯', '仙人掌', '金鱼藻', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('56', '下列现象中，与动物的繁殖行为无关的是：', '池边蛙群声声鸣', '蜂王雄蜂空中舞', '花丛蜜蜂翩翩舞', '蜻蜓点水款款飞', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('57', '下列与美丽的蝴蝶发育方式不同的昆虫是：', '菜粉蝶', '螳螂', '家蚕', '蝇', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('58', '鸟类的生殖和发育比昆虫高等，主要表现在：', '体内受精', '非变态发育', '卵生', '卵外有卵壳保护', 'D', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('59', '下列植物中，常用扦插繁殖的是：', '甘薯和银杉', '葡萄和月季', '梨和苹果', '菊花和金鱼藻', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('60', '从孔雀自身的角度考虑，你认为孔雀开屏的目的是：', '展示自己的美丽', '向人求食', '求偶', '孵卵', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('61', '下列不属于生命现象的是：', '母鸡下蛋', '铁皮生锈', '雨后春笋', '葵花向阳', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('62', '在一个生态系统中，对各种生物数量起决定作用的是：', '生产者', '消费者', '分解者', '食肉动物', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('63', '地球上最大的生态系统是：', '生物圈', '陆地生态系统', '海洋生态系统', '草原生态系统', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('64', '在一个生态系统中最不稳定的成分是：', '高大乔木', '低矮灌木', '细菌、真菌', '大型动物', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('65', '鱼必须生活在水中，离开水一段时间就会死亡。对此最恰当的解释是：', '生物影响环境', '生物适应环境', '生物改变环境', '生物依赖环境', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('66', '在显微镜下观察写在纸片上的“b”字母时，物像是：', 'b', 'd', 'p', 'q', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('67', '动物细胞中的能量转换器是：', '液泡', '染色体', '线粒体', '叶绿体', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('68', '人类的遗传物质主要存在于：', '细胞质中', '细胞膜中', '细胞核中', '细胞的各个部分', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('69', '人体细胞内的染色体数目是：', '23条', '23对', '46对', '30条', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('70', '细胞数目的增多是通过细胞的哪一项生理活动实现的？', '细胞分裂', '细胞分化', '细胞生长', '细胞分离', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('71', '制作人口腔上皮细胞临时装片时，滴加0.9%的生理盐水的目的是：', '利于染色', '利于盖盖玻片', '杀灭细菌', '维持细胞形态', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('72', '下列结构属于器官的是：', '表皮', '血液', '心脏', '骨骼肌', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('73', '构成大脑的主要组织是：', '上皮组织', '肌肉组织', '神经组织', '结缔组织', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('74', '下列结构可称做组织的是：', '肝脏', '心脏', '血液', '皮肤', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('75', '下列物质中，动物细胞内不具有的是：', '葡萄糖', '糖原', '核糖', '纤维素', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('76', '植物从土壤中吸收的氮元素，可以用来合成下列那种物质：', '葡萄糖', '淀粉', '脂肪', '蛋白质', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('77', '属于生物体内的微量元素的是：', 'C', 'H', 'O', 'Mn', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('78', '细胞核的主要功能是：', '进行能量转换', '合成蛋白质', '贮存、复制遗传物质', '贮存能源物质', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('79', '常温常压下，要使过氧化氢溶液放出大量的氧气，应投入：', '新鲜猪肝', '煮熟猪肝', '冰冻猪肝', '生锈铁钉', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('80', '对食物中脂肪，蛋白质和糖类都能产生消化作用的是：', '胃液', '胰液', '胆汁', '唾液', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('81', '“一山不容二虎”描述的生物知识是：', '种内斗争', '种间斗争', '捕食', '互助', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('82', '高处坠落造成人高位瘫痪（颈椎损坏），以下四种表现不符合实际的是：', '大小便失禁', '触觉完全消失', '躯干冷温觉丧失', '躯干痛觉丧失', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('83', '我们常说的噪声污染是指：', '90dB以上', '80dB以上', '50dB以上', '70dB以上', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('84', '联合国于哪一年发表了《人类环境宣言》？', '1972', '1973', '1974', '1975', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('85', '谷类食品含量最高的是：', '蛋白质', '钙质', '维生素', '碳水化合物', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('86', '下列酒中最宜在吃海鲜时饮用的是：', '啤酒', '干白葡萄酒', '白酒', '红葡萄酒', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('87', '白菜属于____________科', '豆科', '菊科', '十字花科', '蔷薇科', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('88', '成年人身上有多少块骨骼？', '205', '206', '207', '208', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('89', '蚯蚓的血是什么颜色？', '白色', '蓝色', '红色', '黑色', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('90', '请问禽流感的?≡迨鞘裟且恢稚锬兀?', '细菌', '真菌', '染色体', '病毒', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('91', '多莉羊 是在几时克隆出来的？', '九十年代', '八十年代', '2000年', '2001年', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('92', '核酸由什么组成？', 'DNT和DNA', 'DNA和RNA', 'RNA和DNT', 'RNT和DNT', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('93', '下面不属于天然纤维的有：', '棉麻', '真丝', '冰丝', '天然彩棉', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('94', '防腐剂过量属于食品污染的哪一种？', '原料污染', '保鲜产生的污染', '制作过程中的污染', '生物性污染', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('95', '对传染病病人和疑似传染病病人应当采取的措施是：', '就地隔离', '就地观察', '就地治疗', '上述各项均是', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('96', '甲型肝炎主要传播途径为：', '血液传播', '消化道传播', '性接触传播', '呼吸道传播', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('97', '流行性乙型脑炎和登革热最关键的预防措施是：', '接种疫苗', '防蚊和灭蚊', '通风换气', '勤换衣服', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('98', '我国政府将非典型肺炎列入法定传染病的时间为：', '37719', '37720', '37721', '37722', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('99', '从全世界来看，一般高致病性禽流感的高发季节是在：', '冬、春季节', '夏、秋季节', '春、夏季节', '秋、冬季节', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('100', '世界上最大的熊是：', '黑熊', '棕熊', '树袋熊', '北极熊', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('101', '下列鸟类属国家一级保护动物的是：', '金雕', '大天鹅', '猎隼', '蓑羽鹤', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('102', '山雀一昼夜所吃的昆虫等于：', '它自己体重的一半', '它自己的体重', '它自己体重的1/3', '它自己体重的1/4', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('103', '下列哪一组动物均具爪？', '', '蛇', '海马\"', '\"蜥蜴', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('104', '水稻种子在氧气供应不足的条件下的萌发特点是：', '胚芽', '根短', '胚芽', '根长', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('105', '下列植物那组全是种子植物？', '黑', '叶兰', '狸', '子蕨', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('106', '使用哪种仪器,可以获得三维图象？', '扫描电子显微镜', '透射电子显微镜', '荧光显微镜', '光学显微镜', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('107', '下列植物哪种具有种子？', '石松', '地钱', '银杏', '裸蕨', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('108', '小狗经常伸出舌头直喘气，这是因为：', '小狗靠舌头散热', '小狗太累需要呼吸', '小狗饿了想进食', '小狗觉得好玩', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('109', '地球上最大的淡水资源宝库是：', '南北极的冰川', '地下水', '陆地上的江河湖泊', '自来水', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('110', '哪种污染被称为“世界头号杀手”？', '水污染', '光污染', '大气污染', '噪音污染', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('111', '新房中最厉害的“空气杀手”是：', '二氧化碳', '颗粒物', '粉尘', '氡', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('112', '在地球上称霸一时的恐龙突然消失了,它消失在：', '侏罗纪末期', '白垩纪中期', '白垩纪末期', '第三纪', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('113', '食品污染不包括：', '生物性污染', '土壤污染', '化学污染', '噪音污染', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('114', '多晒太阳可以促进人体对(???)的吸收', '镁', '钙', '磷', '铁', 'B', '2', '0', '5', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('115', '感冒忌用下列哪一种食物', '海鱼', '豆浆', '青菜', '生姜', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('116', '洗有颜色的衣服时，先用以下哪种水浸泡10分钟，然后再洗，不容易掉色？', '漂白水', '50%盐水', '5%盐水', '醋', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('117', '柠檬汁有哪些营养含量？', '维生素A和维生素C', '维生素B1和维生素C', '维生素C', '维生素B', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('118', '酒中含有酒精，饮酒过多或经常饮酒，会造成酒精中毒，使身体受损，那么，饮酒对人体的哪些器官最为有害？', '眼睛', '皮肤', '心脏', '肺', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('119', '苹果中含有增强记忆力的微量元素是？', '铁', '锌', '钙', '碘', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('120', '吃太多手摇爆米花机爆出的米花会导致什么问题？', '锡中毒', '铅中毒', '铬中毒', '碘中毒', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('121', '方便面里必然有哪种食品添加剂？', '防腐剂', '合成抗氧化剂', '食用色素', '漂白剂', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('122', '下列哪种维生素可治脚气病？', '维生素A', '维生素B', '维生素C', '维生素D', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('123', '为了减轻眼睛疲劳，看电视要保持适当距离，如14英寸彩电应保持距离为', '1米', '1.5米', '2米', '2.5米', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('124', '碘缺乏会导致儿童、青少年', '甲亢', '无力', '心理疾病', '生长发育和智力受影响', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('125', '夏季在烈日下工作或运动量过大出汗多时，为预防中暑应多喝', '糖水', '糖醋水', '盐开水', '白开水', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('126', '烧菜时最好在何时加碘盐以减少碘的损失？', '烧菜前用碘盐爆锅', '烧菜加水前', '烧菜加水后', '菜将出锅时', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('127', '某人由于营养不良，身体浮肿，其食疗补救措施是', '多吃蔬菜', '多喝豆汁', '多吃馒头', '多喝水', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('128', '下半旗是将旗子下降到', '旗杆的一半处', '下降1米', '下降1.5米', '间隔杆顶的1/3处', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('129', '什么时间吃水果比较好', '饭前食用', '饭后食用', '空腹食用', '睡前食用', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('130', '醋放久了会生白，为了防止其生白，最好在醋内加一些黄酒后再渗进少量', '姜末', '白糖', '精盐', '味精', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('131', '理发吹风前，在头上喷一点什么，洗烫的发式能长久保持？', '盐', '醋', '酒精', '酱油', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('132', '洗鱼后手上有腥味儿用下列哪种东西可以去除？', '洗手液', '洗洁精', '牙膏', '奶粉', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('133', '食品的保质期是指它的：', '生产日期', '最终食用期', '最佳食用期', '出厂日期', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('134', '以下哪种食品可以食用?', '发霉的茶叶', '发芽的土豆', '变绿的豆芽', '变红的汤圆', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('135', '豆浆又叫“植物奶”，被国际营养协会评定为健康食品和世界六大营养饮料之一。但是喝豆浆也有注意事项，以下正确的食用方法是：', '喝没有煮沸的豆浆', '豆浆中冲入鸡蛋', '喝豆浆时配其他食物', '保温瓶长时间存豆浆', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('136', '牛奶不能与下列哪种食品同时食用', '面食', '水果', '肉制品', '零食', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('137', '郊游时，看见野生蘑菇，您应该怎么做？', '采下来带回家食用', '凭经验判断', '咨询他人后再食用', '野生的蘑菇不采摘不食用', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('138', '出现食物中毒症状或者误食化学品时，最先采取的急救措施是？', '催吐', '吃止泻药物', '进行人工呼吸', '向卫生防疫部门报告', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('139', '铜器与下列什么物品不宜长久接触，否则会产生铜绿。用生有铜绿的铜器盛放食品或烹炒菜肴易中毒。', '酱油', '花椒面', '味精', '醋', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('140', '牛奶不能与以下哪种水果搭配食用？', '香蕉', '火龙果', '柿子', '梨', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('141', '我国铁路部门规定身高多少的儿童要买全票？', '1.20米', '1.30米', '1.40米', '1.50米', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('142', '下列哪个试剂可用于除去圆珠笔痕迹?', '丙酮', '酒精', '盐水', '醋', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('143', '小华家的电灯丝断了，他把灯泡晃了晃使灯丝又搭上了，再用的时候会发现', '灯比原来亮了', '灯比原来暗了', '灯跟原来一样亮', '灯再也不亮了', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('144', '现代体育运动会“火炬”火炬中常用的火炬燃料是', '汽油', '柴油', '丁烷和煤油', '重油和酒精', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('145', '飞机票头等舱的票价一般为普通舱票价的', '200%', '180%', '150%', '130%', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('146', '以下哪个选项中的糖按比例混合后甜度最高', '蔗糖、葡萄糖', '果糖、葡萄糖', '果糖、蔗糖', '果糖、乳糖', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('147', '煮鸡蛋时不宜用以下哪种容器', '银制容器', '不锈钢制容器', '陶制容器', '铝制容器', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('148', '埋木桩前，将埋入地下的一段表面用火微微烧焦，是因为碳在常温下', '具有吸附性', '具有氧化性', '具有还原性', '化学性质不活泼', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('149', '下列元素中，哪种元素在饮水时，可引起人的牙齿骨质疏松', '碘 ', '硫', '汞', '氟', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('150', '父母和一个已婚子女及其配偶、后代组成的家庭属于什么类型的家庭?', '复合家庭', '单身家庭', '核心家庭', '直系家庭', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('151', '下面哪个物质可同胡萝卜同食?', '酒', '桔子', '苹果', '海味', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('152', '在生活中常说的“五金” 不包括下列哪种金属', '金', '铁', '锌', '锡', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('153', '营养学家分析了各种蔬菜的养分，下列蔬菜中，营养物质最低的是？', '红色蔬菜', '白色蔬菜', '绿色蔬菜', '黄色蔬菜', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('154', '以下哪种水果核可以食用？', '苹果核', '枇杷核', '苦杏仁核', '桃核', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('155', '很多人都喜欢吃水果，下列关于水果的选项哪个是正确的', '水果可以代替蔬菜', '削去果皮仍有农药', '水果富含维生素很多', '多吃水果可以减肥', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('156', '下列可以作为鉴别含甲醛水发食品的方法是', '看颜色是否正常', '闻是否有刺激性的异味', '手一捏食品就易碎', '以上方法均正确', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('157', '长期使用铝制品作为食品容器会引发下列哪种疾病？', '老年痴呆症', '甲状腺肿大', '肠胃疾病', '癌症', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('158', '绿色蔬菜营养营养?岣唬铝胁皇粲诼躺卟怂镏实奈?', '钙质', '叶酸', '维生素C', '维生素A', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('159', '多大的数字常被称为“天文数字”', '万以上', '千万以上', '亿以上', '千亿以上', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('160', '所谓“低碳经济”是以低能耗、(   )、低污染为基础的经济发展模式', '低排放', '低标准', '低效率', '低含量', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('161', '造成气候变暖的主要原因是人类生产活动中排放大量什么温室气体？', '二氧化硫', '一氧化碳', '二氧化碳', '二氧化氮', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('162', '自来水表上的一度电表示耗水量为', '100公斤水', '1000公斤水', '一吨水', '一立方米水', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('163', '世界环境日为每年几月几日', '3月12日', '3月21日', '6月5日', '6月15日', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('164', '我国是一个缺水的国家，人均水资源仅为世界人均量的', '1/2', '1/3', '1/4', '1/5', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('165', '现在美国国旗星条上有多少颗星', '25颗', '30颗', '50颗', '60颗', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('166', '俗称“四不像”的动物是', '麋鹿', '白唇鹿', '斑马', '河马', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('167', '燕窝中最珍贵的是', '官燕', '毛燕', '血燕', '燕尾', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('168', '居室中什么地方污染最重', '卧室', '洗手间', '厨房', '客厅', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('169', '废电池乱丢对人体可能造成', '镉中毒', '氰中毒', '铅中毒', '汞中毒', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('170', '含磷洗衣粉中的那种物质是造成水体富营养化的罪魁祸首', '磷酸', '磷酸盐', '甲醛', '氮盐', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('171', '以下食品中铅含量最高的是', '黄瓜', '松花蛋', '面包', '蛋清', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('172', '能提高身体排污能力的食品是', '高蛋白、高热量、高脂肪的食品', '粗粮、豆类、海藻', '各种饮料', '减肥茶', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('173', '数字符号中的“0”起源于', '古印度', '古希腊', '中国', '古埃及', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('174', '我国从2007年起，每年什么日期开展城市“公交周及无车日活动”。', '7月16—22日', '8月16—22日', '9月16—22日', '10月16-22日', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('175', '工业三废是指', '废水、废料、废渣', '废水、废气、废料', '废水、废气、废渣', '废料、废气、废渣', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('176', '节能灯是一种绿色照明光源，它与白炽灯相比可节电', '10%～20%', '30%～40%', '50%～60%', '70%～80', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('177', '科学研究表明，室外锻炼最佳时间是什么时候？', '下午、傍晚', '早晨、傍晚', '早晨、晚上', '早晨、下午', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('178', '复印机在复印过程中会产生什么气体从而损害人体健康', '臭氧', '二氧化碳', '二氧化硫', '二氧化氮', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('179', '冰箱内食物的存放量以占容积的多少，不太会?朔训?', '70%', '80%', '90%', '100%', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('180', '菊花在秋天开，如果把菊花一直放在温暖的环境里，这些菊花会', '都会开花', '不会开花', '开的花比不开的花多', '开的花比不开的花少', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('181', '以下哪项不是汽车节油的有效方法？', '确保发动机状态良好', '高速行驶时关空调开窗', '彻底实行车辆轻量化', '选择电气混合动力源', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('182', '下列关于花木整枝的说法不正确的是', '减去部分新枝顶梢', '减去枯枝弱叶过密枝', '减去主根过长的部分', '摘除花木上的不定芽', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('183', '废旧电池是有害垃圾，它的回收方式是', '归入不可利用垃圾', '放在可再利用垃圾一起', '专门回收', '与平时常用垃圾一起摆放', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('184', '我们常说的噪声污染是指', '90分贝以上', '80分贝以上', '70分贝以上', '60分贝以上', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('185', '塑料在自然界可停留', '100—200年', '50年', '20年', '10年', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('186', '以下哪种洗涤用品对环境的破坏最小?', '洗衣粉', '洁厕灵', '肥皂', '杀虫剂', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('187', '电脑显示器的哪个部位辐射最强?', '正面', '侧面', '背面', '上面', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('188', '哪种植物适合放在室内用来净化空气?', '含羞草', '郁金香', '富贵竹', '吊兰', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('189', '中国植树节是每年的几月几号？', '2月12日', '3月12日', '4月12日', '5月12日', 'B', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('190', '大气的臭氧层对人体是有益的，因为它能', '吸收部分紫外线', '吸收红外线', '吸收白光', '吸收全部可见光', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('191', '买回来的蔬菜，最好在清水中浸泡多久，可除掉大部分残留农药？', '60分钟以上', '30-60分钟', '30-10分钟', '5-10分钟', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('192', '每个家庭每使用一度电，相当于排放了多少公斤的二氧化碳？', '2', '0', '1', '45', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('193', '（   ）消费、（ ）分享、简单生活这是减少温室效应的老办法', '少，多', '少，少', '多，多', '多，少', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('194', '居民家庭每使用二度自来水，相当于排放二氧化碳多少公斤', '1', '2', '2', '3', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('195', '小汽车每消耗1公斤汽油等于排放多少公斤的二氧化碳', '1', '4', '6', '8', 'A', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('196', '家居用电：二氧化碳排放量(kg)=耗电度数×(  )', '0', '1', '1', '1', 'B', '2', '0', '4', '1', '1', '0');
INSERT INTO `subjectinfo` VALUES ('197', '咖啡的故乡是哪里', '亚洲', '美洲', '大洋洲', '非洲', 'D', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('198', '神话《白蛇传》中\"白娘娘盗仙草\"盗的是', '人参', '冬虫夏草', '灵芝', '田七', 'C', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('199', '铅笔有硬软之分,用英文字母来表示,下列符号相比哪个表示较硬', 'H', 'HB', 'B', '2B', 'A', '2', '0', '4', '1', '0', '0');
INSERT INTO `subjectinfo` VALUES ('220', '使用JdbcTemplate模板类，需要配置的属性是(   )', 'sessionFactory', 'session', 'transactionManager', 'dataSource', 'D', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('221', '下面选项中，哪一个不是Spring中注入的实现方式(  )', '设值注入', '构造器注入', '自动注入', '指针注入', 'D', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('222', 'bean 的scope属性不能取下面那个值', 'singleton 单例', 'page 每页面一实例', 'session 在同一会话范围内使用同一个实例', 'request 每次请求一个新的实例', 'B', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('223', '以下关于Spring对Hibernate提供支持的说法中，错误的是（ ）', '提供了综合的事务管理', '提供了统一的异常集成体系', '便于测试', '没有给查询提供良好的支持', 'D', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('224', 'Spring整合hibernate，配置Hibernate事务管理器（HibernateTransactionManager）时，必须为其哪个属性注入值', 'TRANSACTIONPROXYFACTORYBEAN', 'SESSIONFACTORY', 'DATASOURCE', 'BASEHIBERNATEDAO', 'B', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('225', '关于SSH整合过程中添加框架的顺序的表述正确的是', '必须先添加SPRING', '必须先添加STRUTS2', '必须最后添加HIBERNATE', '在SSH的整合过程中添加框架的顺序并没有严格要求，但是SPRING作为应用容器要对DAO和ACTION进行管理，一般先添加SPRING', 'D', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('226', '以下解释AOP术语切面的说法正确的是（  ）', 'AOP框架产生的对象', '关注点的模块化', '程序执行过程中某个特定的点', '通知发生某些特殊的点，包括before，after等类型', 'B', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('227', '在Spring中，可以通过（  ）方式实现了依赖注入', 'getter方法', 'setter方法', '自定义赋值方法', '静态方法', 'B', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('228', 'Spring和Struts2集成后下面说法正确的有（   ）', 'Struts2的Action交给Spring来管理', 'Struts2的Action必须在Spring中进行配置', 'Struts2的Action不必在Spring中进行配置', 'Struts2的Action没有交给Spring管理', 'A', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('229', '在Spring框架中,面向方面编程(AOP)的目标在于(  )。', '编写程序时不用关心其依赖组件的实现', '将程序中涉及的公用问题集中解决', '封装JDBC访问数据库的代码,简化数据访问层的重复性代码', '实现页面的”无刷新”', 'B', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('230', '在Spring中，下面关于AOP的说法错误的是（  ）。', 'AOP将散落在系统中的“方面”代码集中实现', 'AOP有助于提高系统的可维护性', 'AOP已经表现出了将要替代面向对象的趋势', 'AOP是一种设计模式，Spring提供了一种实现', 'C', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('231', '使用JdbcTemplate类，增加一条记录使用（）方法？', 'save', 'delete', 'update', 'query', 'C', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('232', '关于IOC的理解，下面说法正确的是（  ）。', '依赖注入', '对象被动的接受依赖类', '对象主动的去找依赖类', '一定要用接口', 'B', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('233', '下面关于设值注入优点说法正确的是（    ）', '构造期即创建一个完整、合法的对象', '需要写繁琐的setter方法的', '对于复杂的依赖关系，设置注入更简洁，直观', '以上说法都不对', 'C', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('234', '在 Spring框架中，面向方面编程 (AOP)的目标在于以下哪一点()', '编写程序时无须关注其依赖组件的实现', '封装JDBC访问数据库的代码，简化数据访问层的重复性代码', '将程序中涉及的公共问题集中解决', '可以通过Web服务调用', 'C', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('235', 'Spring 是一个功能丰富而易用的集成框架，它的核心是', '依赖注入(DI)', '面向方面编程(AOP)', '分层架构', '丰富的标签库', 'A', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('236', '在SSH整合开发中，关于生成都DAO类中方法说明错误的是(   )', 'save:根据对象添加', 'delete:根据对象删除', 'findById:根据ID查询对象', 'merge:合并session中不同ID的对象', 'D', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('237', '下面关于Spring工作原理描述不正确的是： (  )', 'Spring bean可以被动接受依赖，而不必主动获取依赖', 'Spring是一个包含且管理系统对象生命周期和配置的容器', 'Spring 采用工厂模式创建spring bean对象', 'Spring直接通过new关键字创建spring bean对象', 'D', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('238', '在Spring中，关于依赖注入，下面说法错误的是（ ）', '依赖注入提倡面向接口编程', '依赖注入可降低系统的各个组件之间的依赖程度', '依赖注入的组件对外提供接口时，使得可以随意更换接口的实现', '依赖注入使得在实现组件时，必须考虑各个组件中的依赖关系', 'B', '2', '0', '16', '3', '1', '0');
INSERT INTO `subjectinfo` VALUES ('239', 'Spring通知说法错误的是', 'before是前置通知', 'after是后置通知', 'afterthrowing是异常通知', 'aroud是环绕通知', 'B', '2', '0', '16', '3', '1', '0');

-- ----------------------------
-- Table structure for teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE `teacherinfo` (
  `teacherId` int(11) NOT NULL auto_increment,
  `teacherName` varchar(10) default NULL,
  `teacherAccount` varchar(10) default NULL,
  `teacherPwd` varchar(10) default NULL,
  `adminPower` int(11) default '0',
  `isWork` int(11) default '0',
  PRIMARY KEY  (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacherinfo
-- ----------------------------
INSERT INTO `teacherinfo` VALUES ('1', '张三丰', 'zsf', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('2', '皮长山', 'pcs', '123456', '1', '1');
INSERT INTO `teacherinfo` VALUES ('3', '方正', 'fz', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('4', '曾勇', 'zy', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('5', '董勇', 'dongy', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('6', '周应琴', 'zhouyq', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('7', '万红兵', 'wanhb', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('8', '黄小荣', 'hxr123', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('9', '代丽敏', 'dailm', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('10', '赵国强', 'zgq121', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('11', '刘能', 'liun', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('12', '谢广坤', 'gungk', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('13', '王长贵', 'changg', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('14', '谢大脚', 'dajiao', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('15', '谢永强', 'yongq', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('16', '王小蒙', 'xiaom', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('17', '赵玉田', 'yutian', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('18', '刘英', 'yingzi', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('19', '刘一水', 'yishui', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('20', '谢小梅', 'xiaom', '123456', '0', '1');
INSERT INTO `teacherinfo` VALUES ('21', '大头', 'wangyang', '123456', '0', '1');
