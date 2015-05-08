/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : project_db

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2015-05-08 19:44:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `expName` varchar(16) DEFAULT NULL,
  `expPwd` varchar(16) DEFAULT NULL,
  `expID` varchar(16) DEFAULT NULL,
  `groupID` int(11) NOT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expert
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `groID` int(11) NOT NULL,
  `groName` varchar(16) DEFAULT NULL,
  `subNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`groID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------

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

-- ----------------------------
-- Table structure for proposer
-- ----------------------------
DROP TABLE IF EXISTS `proposer`;
CREATE TABLE `proposer` (
  `userID` int(11) NOT NULL,
  `userName` varchar(16) DEFAULT NULL,
  `userPwd` varchar(16) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `subClass` varchar(16) DEFAULT NULL,
  `subID` int(11) DEFAULT NULL,
  `recID` int(11) DEFAULT NULL,
  `recResult` int(11) DEFAULT NULL,
  `firCount` int(11) DEFAULT NULL,
  `lasResult` int(11) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proposer
-- ----------------------------

-- ----------------------------
-- Table structure for rec_units
-- ----------------------------
DROP TABLE IF EXISTS `rec_units`;
CREATE TABLE `rec_units` (
  `unitsID` int(11) NOT NULL,
  `unitsName` varchar(16) DEFAULT NULL,
  `untisPwd` varchar(16) DEFAULT NULL,
  `recTotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`unitsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rec_units
-- ----------------------------
