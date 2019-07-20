/*
Navicat MySQL Data Transfer

Source Server         : A318
Source Server Version : 50096
Source Host           : 127.0.0.1:3306
Source Database       : drom

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2019-07-20 10:36:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `buildId` int(11) NOT NULL auto_increment,
  `buildName` varchar(30) default NULL,
  `dormCount` int(11) default NULL,
  `dormFloor` int(11) default NULL,
  PRIMARY KEY  (`buildId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('1', '1号楼', '20', '4');
INSERT INTO `building` VALUES ('2', '2号楼', '30', '5');
INSERT INTO `building` VALUES ('4', '3号楼', '30', '5');

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge` (
  `chargeId` int(11) NOT NULL auto_increment,
  `chargeDate` datetime default NULL,
  `fk_typeId` int(11) default NULL,
  `fk_stuId` int(11) default NULL,
  `payMoney` decimal(10,2) default NULL,
  `fk_teachId` int(11) default NULL,
  `memo` varchar(100) default NULL,
  PRIMARY KEY  (`chargeId`),
  KEY `fk_typeId` (`fk_typeId`),
  KEY `fk_stuId` (`fk_stuId`),
  KEY `fk_teachId` (`fk_teachId`),
  CONSTRAINT `charge_ibfk_2` FOREIGN KEY (`fk_stuId`) REFERENCES `student` (`stuId`),
  CONSTRAINT `charge_ibfk_3` FOREIGN KEY (`fk_teachId`) REFERENCES `teacher` (`teachId`),
  CONSTRAINT `FK7fq17mhiqe210ats09n5p90nj` FOREIGN KEY (`fk_teachId`) REFERENCES `teacher` (`teachId`),
  CONSTRAINT `FKb7hln35i446617x7jc87w0owl` FOREIGN KEY (`fk_typeId`) REFERENCES `chargetype` (`typeid`),
  CONSTRAINT `FKi0vrykidn3g8636ud2p4n8f6l` FOREIGN KEY (`fk_stuId`) REFERENCES `student` (`stuId`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charge
-- ----------------------------
INSERT INTO `charge` VALUES ('45', '2019-05-17 18:38:21', '33', '18', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('46', '2019-05-17 18:38:37', '34', '19', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('47', '2019-05-17 18:42:52', '35', '20', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('48', '2019-05-17 18:54:14', '36', '21', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('49', '2019-05-17 18:55:10', '37', '22', '500.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('50', '2019-05-18 08:36:24', '38', '24', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('51', '2019-05-18 08:38:37', '39', '25', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('52', '2019-05-18 09:07:37', '40', '26', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('53', '2019-05-18 12:08:48', '41', '23', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('54', '2019-05-22 19:18:14', '42', '27', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('55', '2019-05-23 15:44:04', '43', '18', '500.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('56', '2019-05-23 15:44:27', '44', '24', '500.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('57', '2019-05-24 09:45:12', '45', '25', '500.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('58', '2019-05-24 09:47:32', '46', '26', '500.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('59', '2019-05-24 09:49:15', '47', '27', '500.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('60', '2019-05-24 09:59:02', '48', '22', '1000.00', '28', '住宿费');
INSERT INTO `charge` VALUES ('66', '2019-05-24 12:22:55', '54', '24', '500.00', '28', '住宿补费');
INSERT INTO `charge` VALUES ('67', '2019-05-24 16:10:13', '55', '26', '500.00', '28', '住宿补费');

-- ----------------------------
-- Table structure for chargetype
-- ----------------------------
DROP TABLE IF EXISTS `chargetype`;
CREATE TABLE `chargetype` (
  `typeid` int(11) NOT NULL auto_increment,
  `typeName` varchar(20) default NULL,
  `unitPrice` decimal(18,2) default NULL,
  `flag` int(11) default NULL,
  `memo` varchar(100) default NULL,
  PRIMARY KEY  (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chargetype
-- ----------------------------
INSERT INTO `chargetype` VALUES ('33', '现金支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('34', '支付宝支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('35', '支付宝支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('36', '现金支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('37', '现金支付', '500.00', '1', null);
INSERT INTO `chargetype` VALUES ('38', '支付宝支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('39', '现金支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('40', '现金支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('41', '支付宝支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('42', '支付宝支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('43', '现金支付', '500.00', '1', null);
INSERT INTO `chargetype` VALUES ('44', '支付宝支付', '500.00', '1', null);
INSERT INTO `chargetype` VALUES ('45', '现金支付', '500.00', '1', null);
INSERT INTO `chargetype` VALUES ('46', '现金支付', '500.00', '1', null);
INSERT INTO `chargetype` VALUES ('47', '支付宝支付', '500.00', '1', null);
INSERT INTO `chargetype` VALUES ('48', '现金支付', '1000.00', '1', null);
INSERT INTO `chargetype` VALUES ('54', '支付宝支付', '500.00', '1', null);
INSERT INTO `chargetype` VALUES ('55', '支付宝支付', '500.00', '1', null);

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo` (
  `classId` int(11) NOT NULL auto_increment,
  `className` varchar(20) default NULL,
  `fk_teachId` int(11) default NULL,
  `createDate` datetime default NULL,
  `endDate` datetime default NULL,
  `flag` int(11) default NULL,
  `memo` varchar(100) default NULL,
  PRIMARY KEY  (`classId`),
  KEY `fk_teachId` (`fk_teachId`),
  CONSTRAINT `classinfo_ibfk_1` FOREIGN KEY (`fk_teachId`) REFERENCES `teacher` (`teachId`),
  CONSTRAINT `FK3jfgl2cbiuffbq1ojygd3pkl2` FOREIGN KEY (`fk_teachId`) REFERENCES `teacher` (`teachId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES ('5', '180101', '28', '2019-05-09 12:11:27', null, '0', '已注');
INSERT INTO `classinfo` VALUES ('6', '180102', '28', '2019-05-13 15:27:16', null, '0', '已注');
INSERT INTO `classinfo` VALUES ('7', '180103', '28', '2019-05-13 15:27:32', null, '0', '已注');

-- ----------------------------
-- Table structure for dorm
-- ----------------------------
DROP TABLE IF EXISTS `dorm`;
CREATE TABLE `dorm` (
  `dormId` int(11) NOT NULL auto_increment,
  `dormNum` varchar(10) default NULL,
  `fk_typeId` int(11) default NULL,
  `fk_buildid` int(11) default NULL,
  `personCount` int(11) default NULL,
  `flag` int(11) default NULL,
  `memo` varchar(100) default NULL,
  PRIMARY KEY  (`dormId`),
  KEY `fk_typeId` (`fk_typeId`),
  KEY `fk_buildid` (`fk_buildid`),
  CONSTRAINT `FK5ni7cciss6osxdq5fskmdbmwk` FOREIGN KEY (`fk_typeId`) REFERENCES `dormtype` (`typeId`),
  CONSTRAINT `FKqmhw1plfl00mk8fojjhh3prms` FOREIGN KEY (`fk_buildid`) REFERENCES `building` (`buildId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dorm
-- ----------------------------
INSERT INTO `dorm` VALUES ('5', '101', '1', '1', '1', '0', null);
INSERT INTO `dorm` VALUES ('6', '102', '1', '1', '2', '0', '');
INSERT INTO `dorm` VALUES ('7', '103', '1', '1', '1', '0', '');
INSERT INTO `dorm` VALUES ('8', '104', '1', '1', '0', '0', '');
INSERT INTO `dorm` VALUES ('9', '105', '1', '1', '1', '0', '');
INSERT INTO `dorm` VALUES ('10', '201', '5', '1', '1', '0', '');
INSERT INTO `dorm` VALUES ('11', '202', '5', '1', '0', '0', '');
INSERT INTO `dorm` VALUES ('12', '203', '5', '1', '1', '0', '');
INSERT INTO `dorm` VALUES ('13', '204', '5', '1', '0', '0', '');
INSERT INTO `dorm` VALUES ('14', '205', '5', '1', '0', '0', '');
INSERT INTO `dorm` VALUES ('15', '101', '2', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('16', '102', '2', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('17', '103', '2', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('18', '104', '2', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('19', '105', '2', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('20', '201', '7', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('21', '202', '7', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('22', '203', '7', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('23', '204', '7', '4', '0', '0', '');
INSERT INTO `dorm` VALUES ('24', '205', '7', '4', '0', '0', '');

-- ----------------------------
-- Table structure for dormtype
-- ----------------------------
DROP TABLE IF EXISTS `dormtype`;
CREATE TABLE `dormtype` (
  `typeId` int(11) NOT NULL auto_increment,
  `typeName` varchar(20) default NULL,
  `personCount` int(11) default NULL,
  `price` decimal(8,2) default NULL,
  `flag` int(11) default NULL,
  `sex` char(2) default NULL,
  `memo` varchar(50) default NULL,
  PRIMARY KEY  (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dormtype
-- ----------------------------
INSERT INTO `dormtype` VALUES ('1', '4人间（M）', '4', '1000.00', '0', '男', null);
INSERT INTO `dormtype` VALUES ('2', '4人间（W）', '4', '1000.00', '0', '女', null);
INSERT INTO `dormtype` VALUES ('5', '8人间（M）', '8', '500.00', '0', '男', '已注');
INSERT INTO `dormtype` VALUES ('7', '6人间（W）', '6', '600.00', '0', '女', '');
INSERT INTO `dormtype` VALUES ('8', '8人间（W）', '8', '400.00', '0', '女', '');
INSERT INTO `dormtype` VALUES ('9', '6人间（M）', '6', '600.00', '0', '男', '');

-- ----------------------------
-- Table structure for outlt
-- ----------------------------
DROP TABLE IF EXISTS `outlt`;
CREATE TABLE `outlt` (
  `o_id` int(11) NOT NULL auto_increment,
  `stuid` int(11) default NULL,
  `dormid` int(11) default NULL,
  `teachid` int(11) default NULL,
  `memo` varchar(255) default NULL,
  `flag` int(11) default NULL,
  `Tmemo` varchar(255) default NULL,
  `Dmemo` varchar(255) default NULL,
  `sendTime` datetime default NULL,
  `TcheckTime` datetime default NULL,
  `DcheckTime` datetime default NULL,
  PRIMARY KEY  (`o_id`),
  KEY `fk_o_stuid` (`stuid`),
  KEY `fk_o_dormid` (`dormid`),
  KEY `fk_o_teachid` (`teachid`),
  CONSTRAINT `fk_o_dormid` FOREIGN KEY (`dormid`) REFERENCES `dorm` (`dormId`),
  CONSTRAINT `fk_o_stuid` FOREIGN KEY (`stuid`) REFERENCES `student` (`stuId`),
  CONSTRAINT `fk_o_teachid` FOREIGN KEY (`teachid`) REFERENCES `teacher` (`teachId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outlt
-- ----------------------------

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `p_id` int(11) NOT NULL auto_increment,
  `p_name` varchar(255) default NULL,
  `p_url` varchar(255) default NULL,
  `p_mgr` int(11) default NULL,
  PRIMARY KEY  (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '首页列表', '', '0');
INSERT INTO `power` VALUES ('2', '基础数据', '', '0');
INSERT INTO `power` VALUES ('3', '学生管理', '', '0');
INSERT INTO `power` VALUES ('4', '教师管理', '', '0');
INSERT INTO `power` VALUES ('5', '收费管理', '', '0');
INSERT INTO `power` VALUES ('6', '用户管理', '', '0');
INSERT INTO `power` VALUES ('7', '权限管理', '', '0');
INSERT INTO `power` VALUES ('8', '宿舍楼管理', '/DormMange/building/findAll', '2');
INSERT INTO `power` VALUES ('9', '宿舍类型管理', '/DormMange/dormtype/findAll', '2');
INSERT INTO `power` VALUES ('10', '宿舍管理', '/DormMange/dorm/findAll', '2');
INSERT INTO `power` VALUES ('11', '班级管理', '/DormMange/classinfo/findAll', '2');
INSERT INTO `power` VALUES ('12', '学生信息录入', '/DormMange/student/toInsert', '3');
INSERT INTO `power` VALUES ('13', '学生信息查询', '/DormMange/student/toFind', '3');
INSERT INTO `power` VALUES ('14', '教师信息录入', '/DormMange/teacher/toInsert', '4');
INSERT INTO `power` VALUES ('15', '教师信息查询', '/DormMange/teacher/findAll', '4');
INSERT INTO `power` VALUES ('16', '帮助', null, '0');
INSERT INTO `power` VALUES ('17', '用户列表', 'findAll', '6');
INSERT INTO `power` VALUES ('18', '分配权力', 'role/findAll', '7');
INSERT INTO `power` VALUES ('19', '更新权限', 'power/findAll', '7');
INSERT INTO `power` VALUES ('20', '关于我们', 'about.jsp', '16');
INSERT INTO `power` VALUES ('21', 'CallForHelp', '', '16');
INSERT INTO `power` VALUES ('22', '系统管理', '', '0');
INSERT INTO `power` VALUES ('23', '数据库备份', '', '22');
INSERT INTO `power` VALUES ('24', '个人信息管理', '', '0');
INSERT INTO `power` VALUES ('25', '个人选项', 'student/self.jsp', '24');
INSERT INTO `power` VALUES ('26', '个人信息管理', '', '0');
INSERT INTO `power` VALUES ('27', '个人选项', 'teacher/self.jsp', '26');
INSERT INTO `power` VALUES ('29', '财务管理', null, '0');
INSERT INTO `power` VALUES ('30', '学生缴费', 'teacher/findStudent.jsp', '29');
INSERT INTO `power` VALUES ('31', '本学年缴费统计', '', '5');
INSERT INTO `power` VALUES ('32', '学生补费', 'teacher/findstu.jsp', '29');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int(11) NOT NULL auto_increment,
  `r_name` varchar(255) default NULL,
  `r_sort` int(11) default NULL,
  PRIMARY KEY  (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '院长', '1');
INSERT INTO `role` VALUES ('2', '老师', '4');
INSERT INTO `role` VALUES ('3', '辅导员', '3');
INSERT INTO `role` VALUES ('4', '教导主任', '2');
INSERT INTO `role` VALUES ('5', '宿管', '5');
INSERT INTO `role` VALUES ('6', '学生', '7');
INSERT INTO `role` VALUES ('7', '财务', '6');

-- ----------------------------
-- Table structure for role_power
-- ----------------------------
DROP TABLE IF EXISTS `role_power`;
CREATE TABLE `role_power` (
  `r_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  KEY `FK49qx7bhya8564kyqicls1h5in` (`p_id`),
  KEY `FKnwukctn969q58s6ydehxxx7lh` (`r_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_power
-- ----------------------------
INSERT INTO `role_power` VALUES ('3', '27');
INSERT INTO `role_power` VALUES ('1', '22');
INSERT INTO `role_power` VALUES ('1', '21');
INSERT INTO `role_power` VALUES ('1', '20');
INSERT INTO `role_power` VALUES ('1', '16');
INSERT INTO `role_power` VALUES ('1', '19');
INSERT INTO `role_power` VALUES ('1', '18');
INSERT INTO `role_power` VALUES ('1', '7');
INSERT INTO `role_power` VALUES ('1', '17');
INSERT INTO `role_power` VALUES ('1', '6');
INSERT INTO `role_power` VALUES ('1', '31');
INSERT INTO `role_power` VALUES ('1', '5');
INSERT INTO `role_power` VALUES ('1', '15');
INSERT INTO `role_power` VALUES ('1', '14');
INSERT INTO `role_power` VALUES ('1', '4');
INSERT INTO `role_power` VALUES ('1', '13');
INSERT INTO `role_power` VALUES ('1', '12');
INSERT INTO `role_power` VALUES ('1', '3');
INSERT INTO `role_power` VALUES ('1', '11');
INSERT INTO `role_power` VALUES ('1', '10');
INSERT INTO `role_power` VALUES ('5', '16');
INSERT INTO `role_power` VALUES ('6', '20');
INSERT INTO `role_power` VALUES ('6', '16');
INSERT INTO `role_power` VALUES ('1', '9');
INSERT INTO `role_power` VALUES ('1', '8');
INSERT INTO `role_power` VALUES ('1', '2');
INSERT INTO `role_power` VALUES ('1', '1');
INSERT INTO `role_power` VALUES ('6', '21');
INSERT INTO `role_power` VALUES ('6', '24');
INSERT INTO `role_power` VALUES ('6', '25');
INSERT INTO `role_power` VALUES ('3', '26');
INSERT INTO `role_power` VALUES ('3', '21');
INSERT INTO `role_power` VALUES ('3', '20');
INSERT INTO `role_power` VALUES ('3', '16');
INSERT INTO `role_power` VALUES ('3', '13');
INSERT INTO `role_power` VALUES ('3', '12');
INSERT INTO `role_power` VALUES ('3', '3');
INSERT INTO `role_power` VALUES ('3', '28');
INSERT INTO `role_power` VALUES ('1', '23');
INSERT INTO `role_power` VALUES ('7', '30');
INSERT INTO `role_power` VALUES ('7', '29');
INSERT INTO `role_power` VALUES ('7', '21');
INSERT INTO `role_power` VALUES ('7', '20');
INSERT INTO `role_power` VALUES ('7', '16');
INSERT INTO `role_power` VALUES ('7', '32');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stuId` int(11) NOT NULL auto_increment,
  `stuNum` varchar(30) default NULL,
  `stuName` varchar(20) default NULL,
  `stuUserName` varchar(20) default NULL,
  `stuPass` varchar(20) default NULL,
  `sex` varchar(2) default NULL,
  `birthday` datetime default NULL,
  `cardId` varchar(20) default NULL,
  `fk_classId` int(11) default NULL,
  `tel` varchar(20) default NULL,
  `province` varchar(20) default NULL,
  `city` varchar(20) default NULL,
  `inDate` datetime default NULL,
  `outDate` datetime default NULL,
  `dormStartDate` datetime default NULL,
  `dormEndDate` datetime default NULL,
  `fk_dormId` int(11) default NULL,
  `flag` int(11) default NULL,
  `memo` varchar(100) default NULL,
  PRIMARY KEY  (`stuId`),
  KEY `fk_classId` (`fk_classId`),
  KEY `fk_dormId` (`fk_dormId`),
  CONSTRAINT `FK4mo81vpjnpr7cm5v46ga5sqa0` FOREIGN KEY (`fk_dormId`) REFERENCES `dorm` (`dormId`),
  CONSTRAINT `FKaqyniva1cgfj0v1i0h226wx3i` FOREIGN KEY (`fk_classId`) REFERENCES `classinfo` (`classId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`fk_classId`) REFERENCES `classinfo` (`classId`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`fk_dormId`) REFERENCES `dorm` (`dormId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('18', '20180101', 'jack', '9068', '0000', '男', '1999-02-12 00:00:00', '4128291999010101', '5', '12580', '河南', '郑州', '2019-05-09 12:12:15', null, '2019-05-23 15:44:07', null, '10', '1', null);
INSERT INTO `student` VALUES ('19', '20180102', '徐昱帆', '879064', '0000', '男', '1999-02-13 00:00:00', '4128291999010101', '5', '12580', '河南', '郑州', '2019-05-13 15:30:20', null, '2019-05-23 10:45:13', null, '7', '1', null);
INSERT INTO `student` VALUES ('20', '20180103', '张无忌', '821395', '0000', '男', '1990-02-12 00:00:00', '4128291990010101', '5', '110', '河南', '郑州', '2019-05-13 15:31:20', null, '2019-05-17 18:44:01', null, '5', '1', null);
INSERT INTO `student` VALUES ('21', '20180104', '王样', '413786', '0000', '男', '1999-02-12 00:00:00', '4128291999010101', '6', '12580', '河南', '郑州', '2019-05-13 15:32:07', null, '2019-05-22 19:07:31', null, '6', '1', null);
INSERT INTO `student` VALUES ('22', '20180105', '王杨', '217450', '0000', '男', '1980-02-12 00:00:00', '412829198010101', '7', '12580', '河南', '郑州', '2019-05-13 15:33:34', null, '2019-05-24 09:59:04', null, '9', '1', null);
INSERT INTO `student` VALUES ('23', '20180106', '王思聪', '698152', '0000', '女', '1980-02-12 00:00:00', '412829198010101', '7', '12580', '河南', '郑州', '2019-05-13 15:35:43', null, null, null, null, '0', '');
INSERT INTO `student` VALUES ('24', '20180107', '张飞', '068134', '0000', '男', '1999-02-12 00:00:00', '4128291999010101', '6', '12580', '河南', '洛阳', '2019-05-18 08:32:19', null, '2019-05-24 12:23:41', null, '6', '1', '');
INSERT INTO `student` VALUES ('25', '20180108', '张翠山', '936041', '0000', '男', '1999-02-12 00:00:00', '4128291999010101', '6', '12580', '河南', '郑州', '2019-05-18 08:33:16', null, '2019-05-24 09:45:15', null, '12', '1', '');
INSERT INTO `student` VALUES ('26', '20180109', '蔡徐坤', '479068', '0000', '男', '1999-02-12 00:00:00', '4128291999010101', '6', '12580', '河南', '郑州', '2019-05-18 08:34:00', null, null, null, null, '0', '');
INSERT INTO `student` VALUES ('27', '20180110', '徐誉滕', '641508', '0000', '男', '1999-02-12 00:00:00', '4128291999010101', '6', '12580', '河南', '洛阳', '2019-05-18 08:34:54', null, null, null, null, '0', '');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teachId` int(11) NOT NULL auto_increment,
  `teachName` varchar(30) default NULL,
  `teachUserName` varchar(20) default NULL,
  `teachPass` varchar(20) default NULL,
  `sex` varchar(2) default NULL,
  `birthday` datetime default NULL,
  `idCard` varchar(20) default NULL,
  `edulevel` varchar(20) default NULL,
  `specialty` varchar(30) default NULL,
  `tel` varchar(20) default NULL,
  `address` varchar(50) default NULL,
  `flag` int(11) default NULL,
  `memo` varchar(100) default NULL,
  `hireDate` datetime default NULL,
  `leaveDate` datetime default NULL,
  `fk_typeid` int(11) default NULL,
  PRIMARY KEY  (`teachId`),
  KEY `fk_typeid` (`fk_typeid`),
  CONSTRAINT `FK3ppk7xoa6graw06kmj7cyxu8x` FOREIGN KEY (`fk_typeid`) REFERENCES `teachertype` (`typeId`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`fk_typeid`) REFERENCES `teachertype` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('28', '张三丰', '2466', '0000', '男', '1980-02-12 00:00:00', '4128291980070253', '本科', '计算机科学与技术', '12580', '河北', '0', null, '2019-05-09 12:09:05', null, '2');
INSERT INTO `teacher` VALUES ('29', '李世民', '9752', '0000', '男', '1980-02-12 00:00:00', '4128291980070253', '研究生', '计算机科学与技术', '12580', '河北', '0', null, '2019-05-09 12:19:51', null, '6');
INSERT INTO `teacher` VALUES ('30', '刘钰瑾', '182903', '0000', '男', '1980-02-12 00:00:00', '4128291980070253', '本科', '数控', '12580', '河南', '0', null, '2019-05-10 11:09:19', null, '3');
INSERT INTO `teacher` VALUES ('31', '陈小二', '187549', '0000', '男', '1980-02-12 00:00:00', '4128291980070253', '本科', '财务管理', '120110', '河南开封', '0', null, '2019-05-14 09:36:59', null, '8');

-- ----------------------------
-- Table structure for teachertype
-- ----------------------------
DROP TABLE IF EXISTS `teachertype`;
CREATE TABLE `teachertype` (
  `typeId` int(11) NOT NULL auto_increment,
  `typeName` varchar(30) default NULL,
  `memo` varchar(100) default NULL,
  PRIMARY KEY  (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachertype
-- ----------------------------
INSERT INTO `teachertype` VALUES ('1', '老师', '跟八戒一样');
INSERT INTO `teachertype` VALUES ('2', '辅导员', '负责管理');
INSERT INTO `teachertype` VALUES ('3', '宿管', '管理寝室');
INSERT INTO `teachertype` VALUES ('6', '院长', '厉害极了！');
INSERT INTO `teachertype` VALUES ('7', '教导主任', '训话，请家长，开除');
INSERT INTO `teachertype` VALUES ('8', '财务', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL auto_increment,
  `u_name` varchar(255) default NULL,
  `u_pass` varchar(255) default NULL,
  `u_num` int(11) default NULL,
  `u_rename` varchar(255) default NULL,
  `u_type` varchar(255) default NULL,
  `u_role` varchar(255) default NULL,
  PRIMARY KEY  (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '2466', '0000', '28', '张三丰', '老师', '辅导员');
INSERT INTO `users` VALUES ('2', '9068', '0000', '18', 'jack', '学生', '学生');
INSERT INTO `users` VALUES ('3', '9752', '0000', '29', '李世民', '老师', '院长');
INSERT INTO `users` VALUES ('4', '182903', '0000', '30', '刘钰瑾', '老师', '宿管');
INSERT INTO `users` VALUES ('5', '879064', '0000', '19', '徐昱帆', '学生', '学生');
INSERT INTO `users` VALUES ('6', '821395', '0000', '20', '张无忌', '学生', '学生');
INSERT INTO `users` VALUES ('7', '413786', '0000', '21', '王样', '学生', '学生');
INSERT INTO `users` VALUES ('8', '217450', '0000', '22', '王杨', '学生', '学生');
INSERT INTO `users` VALUES ('9', '698152', '0000', '23', '王思聪', '学生', '学生');
INSERT INTO `users` VALUES ('10', '187549', '0000', '31', '陈小二', '老师', '财务');
INSERT INTO `users` VALUES ('11', '068134', '0000', '24', '张飞', '学生', '学生');
INSERT INTO `users` VALUES ('12', '936041', '0000', '25', '张翠山', '学生', '学生');
INSERT INTO `users` VALUES ('13', '479068', '0000', '26', '蔡徐坤', '学生', '学生');
INSERT INTO `users` VALUES ('14', '641508', '0000', '27', '徐誉滕', '学生', '学生');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `u_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  KEY `FKrruhbdg2sdr7d605ubv0fe4mt` (`r_id`),
  KEY `FKgy4ndc6ixap5iocw0410iooym` (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('3', '1');
INSERT INTO `users_role` VALUES ('4', '5');
INSERT INTO `users_role` VALUES ('2', '6');
INSERT INTO `users_role` VALUES ('7', '6');
INSERT INTO `users_role` VALUES ('5', '6');
INSERT INTO `users_role` VALUES ('6', '6');
INSERT INTO `users_role` VALUES ('8', '6');
INSERT INTO `users_role` VALUES ('1', '3');
INSERT INTO `users_role` VALUES ('9', '6');
INSERT INTO `users_role` VALUES ('10', '7');
INSERT INTO `users_role` VALUES ('11', '6');
INSERT INTO `users_role` VALUES ('12', '6');
INSERT INTO `users_role` VALUES ('13', '6');
INSERT INTO `users_role` VALUES ('14', '6');

-- ----------------------------
-- Table structure for users_student
-- ----------------------------
DROP TABLE IF EXISTS `users_student`;
CREATE TABLE `users_student` (
  `u_id` int(11) NOT NULL,
  `stuId` int(11) NOT NULL,
  KEY `FKpeygfamowgo7wi90r44gwuo38` (`stuId`),
  KEY `FK7kwcbbtxepsj2ntltgjbqhrs7` (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_student
-- ----------------------------
INSERT INTO `users_student` VALUES ('2', '18');
INSERT INTO `users_student` VALUES ('5', '19');
INSERT INTO `users_student` VALUES ('6', '20');
INSERT INTO `users_student` VALUES ('7', '21');
INSERT INTO `users_student` VALUES ('8', '22');
INSERT INTO `users_student` VALUES ('9', '23');
INSERT INTO `users_student` VALUES ('11', '24');
INSERT INTO `users_student` VALUES ('12', '25');
INSERT INTO `users_student` VALUES ('13', '26');
INSERT INTO `users_student` VALUES ('14', '27');

-- ----------------------------
-- Table structure for users_teacher
-- ----------------------------
DROP TABLE IF EXISTS `users_teacher`;
CREATE TABLE `users_teacher` (
  `u_id` int(11) NOT NULL,
  `teachId` int(11) NOT NULL,
  KEY `FK9jx214xad35rwdc63bjestl3k` (`teachId`),
  KEY `FK6bu4xddx31cc1470a6lsloi9m` (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_teacher
-- ----------------------------
INSERT INTO `users_teacher` VALUES ('3', '29');
INSERT INTO `users_teacher` VALUES ('4', '30');
INSERT INTO `users_teacher` VALUES ('10', '31');
