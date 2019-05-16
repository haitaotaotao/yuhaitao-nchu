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

 Date: 11/05/2019 21:02:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `account` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账号',
  `password` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `status` bigint(20) DEFAULT NULL COMMENT '权限状态（0-普通 1-管理员 3-禁用）',
  `creat_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `faculty` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '院系',
  `sex` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '性别',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;
