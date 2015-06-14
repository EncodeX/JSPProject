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
