/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : project_db

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2015-06-13 22:35:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for experience
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experience` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `expName` varchar(16) DEFAULT NULL,
  `expPwd` varchar(16) DEFAULT NULL,
  `expID` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`expID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fund
-- ----------------------------
DROP TABLE IF EXISTS `fund`;
CREATE TABLE `fund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `way` varchar(32) DEFAULT NULL,
  `situation` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for honor
-- ----------------------------
DROP TABLE IF EXISTS `honor`;
CREATE TABLE `honor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hname` varchar(10) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `htime` datetime DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for opentime
-- ----------------------------
DROP TABLE IF EXISTS `opentime`;
CREATE TABLE `opentime` (
  `type` varchar(20) NOT NULL,
  `openTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opentime
-- ----------------------------
INSERT INTO `opentime` VALUES('proposer','2011-11-11 21:12:21',"2012-12-12 12:12");
INSERT INTO `opentime` VALUES('expert','2011-11-11 21:12:21',"2012-12-12 12:12");
INSERT INTO `opentime` valVALUESues('recunits','2011-11-11 21:12:21',"2012-12-12 12:12");

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proposer
-- ----------------------------
DROP TABLE IF EXISTS `proposer`;
CREATE TABLE `proposer` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(16) DEFAULT NULL,
  `userPwd` varchar(16) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `subClass` varchar(16) DEFAULT NULL,
  `subID` int(11) DEFAULT NULL,
  `recID` int(11) DEFAULT NULL,
  `recResult` int(11) DEFAULT NULL,
  `firCount` int(11) DEFAULT NULL,
  `firResult` int(11) DEFAULT NULL,
  `lasResult` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rec_units
-- ----------------------------
DROP TABLE IF EXISTS `rec_units`;
CREATE TABLE `rec_units` (
  `unitsID` int(11) NOT NULL AUTO_INCREMENT,
  `unitsName` varchar(16) DEFAULT NULL,
  `unitsPwd` varchar(16) DEFAULT NULL,
  `recTotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`unitsID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rec_units
-- ----------------------------
INSERT INTO `rec_units` VALUES ('1', '沈阳市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('2', '大连市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('3', '鞍山市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('4', '抚顺市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('5', '本溪市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('6', '丹东市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('7', '锦州市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('8', '营口市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('9', '阜新市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('10', '辽阳市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('11', '铁岭市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('12', '朝阳市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('13', '盘锦市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('14', '葫芦岛市科协', '123', '10');
INSERT INTO `rec_units` VALUES ('15', '辽宁省数学会', '123', '10');
INSERT INTO `rec_units` VALUES ('16', '辽宁省物理学会', '123', '10');
INSERT INTO `rec_units` VALUES ('17', '辽宁省力学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('18', '辽宁省气象学会', '123', '10');
INSERT INTO `rec_units` VALUES ('19', '辽宁省地质学会', '123', '10');
INSERT INTO `rec_units` VALUES ('20', '辽宁省地理学会', '123', '10');
INSERT INTO `rec_units` VALUES ('21', '辽宁省海洋学会', '123', '10');
INSERT INTO `rec_units` VALUES ('22', '辽宁省地震学会', '123', '10');
INSERT INTO `rec_units` VALUES ('23', '辽宁省动物学会', '123', '10');
INSERT INTO `rec_units` VALUES ('24', '辽宁省昆虫学会', '123', '10');
INSERT INTO `rec_units` VALUES ('25', '辽宁省微生物学会', '123', '10');
INSERT INTO `rec_units` VALUES ('26', '辽宁省生态学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('27', '辽宁省环境科学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('28', '辽宁省野生动物保护协会', '123', '10');
INSERT INTO `rec_units` VALUES ('29', '辽宁省地球物理学会', '123', '10');
INSERT INTO `rec_units` VALUES ('30', '辽宁省生物技术协会', '123', '10');
INSERT INTO `rec_units` VALUES ('31', '辽宁省机械工程学会', '123', '10');
INSERT INTO `rec_units` VALUES ('32', '辽宁省电机工程学会', '123', '10');
INSERT INTO `rec_units` VALUES ('33', '辽宁省电工技术学会', '123', '10');
INSERT INTO `rec_units` VALUES ('34', '辽宁省水利学会', '123', '10');
INSERT INTO `rec_units` VALUES ('35', '辽宁省复合材料学会', '123', '10');
INSERT INTO `rec_units` VALUES ('36', '辽宁省制冷学会', '123', '10');
INSERT INTO `rec_units` VALUES ('37', '辽宁省自动化学会', '123', '10');
INSERT INTO `rec_units` VALUES ('38', '辽宁省计量测试学会', '123', '10');
INSERT INTO `rec_units` VALUES ('39', '辽宁省标准化协会', '123', '10');
INSERT INTO `rec_units` VALUES ('40', '辽宁省图学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('41', '辽宁省计算机学会', '123', '10');
INSERT INTO `rec_units` VALUES ('42', '辽宁省通信学会', '123', '10');
INSERT INTO `rec_units` VALUES ('43', '辽宁省测绘学会', '123', '10');
INSERT INTO `rec_units` VALUES ('44', '辽宁省造船工程学会', '123', '10');
INSERT INTO `rec_units` VALUES ('45', '辽宁省航海学会', '123', '10');
INSERT INTO `rec_units` VALUES ('46', '辽宁省铁道学会', '123', '10');
INSERT INTO `rec_units` VALUES ('47', '辽宁省公路学会', '123', '10');
INSERT INTO `rec_units` VALUES ('48', '辽宁省航空宇航学会', '123', '10');
INSERT INTO `rec_units` VALUES ('49', '辽宁省兵工学会', '123', '10');
INSERT INTO `rec_units` VALUES ('50', '辽宁省金属学会', '123', '10');
INSERT INTO `rec_units` VALUES ('51', '辽宁省有色金属学会', '123', '10');
INSERT INTO `rec_units` VALUES ('52', '辽宁省腐蚀与防护学会', '123', '10');
INSERT INTO `rec_units` VALUES ('53', '辽宁省核学会', '123', '10');
INSERT INTO `rec_units` VALUES ('54', '辽宁省石油石化学会', '123', '10');
INSERT INTO `rec_units` VALUES ('55', '辽宁省可再生能源学会', '123', '10');
INSERT INTO `rec_units` VALUES ('56', '辽宁省土木建筑学会', '123', '10');
INSERT INTO `rec_units` VALUES ('57', '辽宁省纺织工程学会', '123', '10');
INSERT INTO `rec_units` VALUES ('58', '辽宁省印刷技术协会', '123', '10');
INSERT INTO `rec_units` VALUES ('59', '辽宁省仪器仪表学会', '123', '10');
INSERT INTO `rec_units` VALUES ('60', '辽宁省地方供电设施管理学会', '123', '10');
INSERT INTO `rec_units` VALUES ('61', '辽宁省烟草学会', '123', '10');
INSERT INTO `rec_units` VALUES ('62', '辽宁省振动工程学会', '123', '10');
INSERT INTO `rec_units` VALUES ('63', '辽宁省颗粒学会', '123', '10');
INSERT INTO `rec_units` VALUES ('64', '辽宁省消防协会', '123', '10');
INSERT INTO `rec_units` VALUES ('65', '辽宁省人工智能学会', '123', '10');
INSERT INTO `rec_units` VALUES ('66', '辽宁省质量协会', '123', '10');
INSERT INTO `rec_units` VALUES ('67', '辽宁省人民防空学会', '123', '10');
INSERT INTO `rec_units` VALUES ('68', '辽宁省包装联合会', '123', '10');
INSERT INTO `rec_units` VALUES ('69', '辽宁省互联网协会', '123', '10');
INSERT INTO `rec_units` VALUES ('70', '辽宁省分析测试协会', '123', '10');
INSERT INTO `rec_units` VALUES ('71', '辽宁省化工学会', '123', '10');
INSERT INTO `rec_units` VALUES ('72', '辽宁省农学会', '123', '10');
INSERT INTO `rec_units` VALUES ('73', '辽宁省林学会', '123', '10');
INSERT INTO `rec_units` VALUES ('74', '辽宁省土壤学会', '123', '10');
INSERT INTO `rec_units` VALUES ('75', '辽宁省水产学会', '123', '10');
INSERT INTO `rec_units` VALUES ('76', '辽宁省畜牧兽医学会', '123', '10');
INSERT INTO `rec_units` VALUES ('77', '辽宁省水土保持学会', '123', '10');
INSERT INTO `rec_units` VALUES ('78', '辽宁省农业经济学会', '123', '10');
INSERT INTO `rec_units` VALUES ('79', '辽宁省土地学会', '123', '10');
INSERT INTO `rec_units` VALUES ('80', '辽宁省食品科学技术学会', '123', '10');
INSERT INTO `rec_units` VALUES ('81', '辽宁省花卉协会', '123', '10');
INSERT INTO `rec_units` VALUES ('82', '辽宁省园艺学会', '123', '10');
INSERT INTO `rec_units` VALUES ('83', '辽宁省食品质量与安全学会', '123', '10');
INSERT INTO `rec_units` VALUES ('84', '辽宁省植物保护学会', '123', '10');
INSERT INTO `rec_units` VALUES ('85', '辽宁省作物学会', '123', '10');
INSERT INTO `rec_units` VALUES ('86', '辽宁省医学会', '123', '10');
INSERT INTO `rec_units` VALUES ('87', '辽宁省中医药学会', '123', '10');
INSERT INTO `rec_units` VALUES ('88', '辽宁省药学会', '123', '10');
INSERT INTO `rec_units` VALUES ('89', '辽宁省护理学会', '123', '10');
INSERT INTO `rec_units` VALUES ('90', '辽宁省营养学会', '123', '10');
INSERT INTO `rec_units` VALUES ('91', '辽宁省针灸学会', '123', '10');
INSERT INTO `rec_units` VALUES ('92', '辽宁省防痨协会', '123', '10');
INSERT INTO `rec_units` VALUES ('93', '辽宁省心理卫生协会', '123', '10');
INSERT INTO `rec_units` VALUES ('94', '辽宁省抗癌协会', '123', '10');
INSERT INTO `rec_units` VALUES ('95', '辽宁省体育科学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('96', '辽宁省康复医学会', '123', '10');
INSERT INTO `rec_units` VALUES ('97', '辽宁省预防医学会', '123', '10');
INSERT INTO `rec_units` VALUES ('98', '辽宁省法医学会', '123', '10');
INSERT INTO `rec_units` VALUES ('99', '辽宁省中西医结合学会', '123', '10');
INSERT INTO `rec_units` VALUES ('100', '辽宁省生命科学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('101', '辽宁省医学影像学会', '123', '10');
INSERT INTO `rec_units` VALUES ('102', '辽宁省性病艾滋病防治协会', '123', '10');
INSERT INTO `rec_units` VALUES ('103', '辽宁省按摩协会', '123', '10');
INSERT INTO `rec_units` VALUES ('104', '辽宁省蒙医药学会', '123', '10');
INSERT INTO `rec_units` VALUES ('105', '辽宁省职工疗养学会', '123', '10');
INSERT INTO `rec_units` VALUES ('106', '辽宁省细胞生物学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('107', '辽宁省超声医学工程学会', '123', '10');
INSERT INTO `rec_units` VALUES ('108', '辽宁省亚健康学会', '123', '10');
INSERT INTO `rec_units` VALUES ('109', '辽宁省手法诊疗研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('110', '辽宁省糖尿病医学营养防治学会', '123', '10');
INSERT INTO `rec_units` VALUES ('111', '辽宁省卫生法学会', '123', '10');
INSERT INTO `rec_units` VALUES ('112', '辽宁省科学技术情报学会', '123', '10');
INSERT INTO `rec_units` VALUES ('113', '辽宁省图书馆学会', '123', '10');
INSERT INTO `rec_units` VALUES ('114', '辽宁省科普作家协会', '123', '10');
INSERT INTO `rec_units` VALUES ('115', '辽宁省档案学会', '123', '10');
INSERT INTO `rec_units` VALUES ('116', '辽宁省老科技工作者协会', '123', '10');
INSERT INTO `rec_units` VALUES ('117', '辽宁省中直企事业会计学会', '123', '10');
INSERT INTO `rec_units` VALUES ('118', '辽宁省会计学会', '123', '10');
INSERT INTO `rec_units` VALUES ('119', '辽宁省民族科普协会', '123', '10');
INSERT INTO `rec_units` VALUES ('120', '辽宁省人才研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('121', '辽宁省继续工程教育协会', '123', '10');
INSERT INTO `rec_units` VALUES ('122', '辽宁省技术经济研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('123', '辽宁省珠算心算协会', '123', '10');
INSERT INTO `rec_units` VALUES ('124', '辽宁省发明协会', '123', '10');
INSERT INTO `rec_units` VALUES ('125', '辽宁省管理科学研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('126', '辽宁省策划学会', '123', '10');
INSERT INTO `rec_units` VALUES ('127', '辽宁省营养师协会', '123', '10');
INSERT INTO `rec_units` VALUES ('128', '辽宁省理财规划师协会', '123', '10');
INSERT INTO `rec_units` VALUES ('129', '辽宁省可持续发展促进会', '123', '10');
INSERT INTO `rec_units` VALUES ('130', '辽宁省科技新闻学会', '123', '10');
INSERT INTO `rec_units` VALUES ('131', '辽宁省心理咨询师协会', '123', '10');
INSERT INTO `rec_units` VALUES ('132', '辽宁省认知科学学会', '123', '10');
INSERT INTO `rec_units` VALUES ('133', '辽宁省社会组织发展促进会', '123', '10');
INSERT INTO `rec_units` VALUES ('134', '辽宁省传播与科技研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('135', '辽宁省老干部摄影协会', '123', '10');
INSERT INTO `rec_units` VALUES ('136', '辽宁省科技创新与人才培养研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('137', '辽宁省民营科技企业家协会', '123', '10');
INSERT INTO `rec_units` VALUES ('138', '辽宁省农村专业技术协会', '123', '10');
INSERT INTO `rec_units` VALUES ('139', '辽宁省科学发展研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('140', '辽宁省区域协调发展研究会', '123', '10');
INSERT INTO `rec_units` VALUES ('141', '辽宁省青少年科技辅导员协会', '123', '10');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `situation` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subgrp
-- ----------------------------
DROP TABLE IF EXISTS `subgrp`;
CREATE TABLE `subgrp` (
  `groID` int(11) NOT NULL AUTO_INCREMENT,
  `groName` varchar(16) DEFAULT NULL,
  `subNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`groID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vote
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `eid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
