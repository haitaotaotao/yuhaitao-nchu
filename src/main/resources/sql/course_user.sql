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

 Date: 11/05/2019 21:01:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course_user
-- ----------------------------
DROP TABLE IF EXISTS `course_user`;
CREATE TABLE `course_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` bigint(20) DEFAULT NULL COMMENT '课程id',
  `course_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '课程名',
  `uesr_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `course_time` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上课时间',
  `address` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上课地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='课程用户关联表';

SET FOREIGN_KEY_CHECKS = 1;
