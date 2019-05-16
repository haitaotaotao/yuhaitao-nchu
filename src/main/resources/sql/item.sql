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

 Date: 11/05/2019 21:02:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `creat_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `status` bigint(20) DEFAULT NULL COMMENT '状态(0-审核中 1-审核通过 2-结题 3-撤销 4-拒绝)',
  `status_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `item_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '项目名',
  `dead_line` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '期限',
  `file` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='项目表';

SET FOREIGN_KEY_CHECKS = 1;
