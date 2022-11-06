/*
Navicat MySQL Data Transfer

Source Server         : test2
Source Server Version : 50562
Source Host           : 192.168.56.106:3306
Source Database       : notedb

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2022-11-06 23:09:03
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `notes`
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notes
-- ----------------------------
