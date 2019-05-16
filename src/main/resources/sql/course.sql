/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:8889
 Source Schema         : yht

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 11/05/2019 21:01:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '课程名',
  `course_code` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '课程号',
  `course_creat_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '课程创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='课程表';

SET FOREIGN_KEY_CHECKS = 1;
