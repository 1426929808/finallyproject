/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 22/02/2020 13:58:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music`  (
  `musicid` int(11) NOT NULL AUTO_INCREMENT,
  `musicname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musicstyle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musiclanguage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musictime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `musicurl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musiccover` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`musicid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES (1, '阅读爱情', '流行', '汉语', '4:50', '阅读爱情.mp3', '阅读爱情.jpg');
INSERT INTO `music` VALUES (2, '起风了', '流行', '汉语', '5:23', '起风了.mp3', '起风了.jpg');
INSERT INTO `music` VALUES (3, '年轮', '流行', '汉语', '4:34', '年轮.mp3', '年轮.jpg');
INSERT INTO `music` VALUES (21, '老街', '流行', '汉语', '5:18', '老街.mp3', '老街.jpg');
INSERT INTO `music` VALUES (22, '秋酿', '民谣', '汉语', '3:46', '秋酿.mp3', '秋酿.jpg');
INSERT INTO `music` VALUES (23, '慢慢来', '流行', '汉语', '2:40', '慢慢来.mp3', '慢慢来.jpg');
INSERT INTO `music` VALUES (24, 'despacito', '欧美', '英语', '3:48', 'despacito（Remix）.mp3', 'despacito（Remix）.jpg');
INSERT INTO `music` VALUES (26, '再见前任', '流行', '汉语', '3:20', '10.mp3', '再见前任.jpg');
INSERT INTO `music` VALUES (27, '寂静之声', '纯音乐', '纯音乐', '3:52', '寂静之声.mp3', '寂静之声.jpg');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userpwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usertype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('ttt', '123456', '用户');
INSERT INTO `users` VALUES ('孙七', '123456', '用户');
INSERT INTO `users` VALUES ('小唐', '123456', '用户');
INSERT INTO `users` VALUES ('小明', '123456789', '管理员');
INSERT INTO `users` VALUES ('小红', '123456789', '管理员');
INSERT INTO `users` VALUES ('张三', '123456', '用户');
INSERT INTO `users` VALUES ('李四', '123456', '用户');
INSERT INTO `users` VALUES ('王五', '123456', '用户');
INSERT INTO `users` VALUES ('赵六', '123456', '用户');

-- ----------------------------
-- Table structure for usersinfo
-- ----------------------------
DROP TABLE IF EXISTS `usersinfo`;
CREATE TABLE `usersinfo`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `usersex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userimg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `useraddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `usersinfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usersinfo
-- ----------------------------
INSERT INTO `usersinfo` VALUES (4, '女', '老街.jpg', '62387615978', '上海', 'ttt');
INSERT INTO `usersinfo` VALUES (5, '男', '小姐姐.png', '12312352345', '广东', '张三');
INSERT INTO `usersinfo` VALUES (6, '男', '', '12312352345', '广东', '张三');
INSERT INTO `usersinfo` VALUES (7, '男', '', '', '', '张三');
INSERT INTO `usersinfo` VALUES (8, '男', '', '', '', '张三');
INSERT INTO `usersinfo` VALUES (9, '男', '', '', '', '张三');

-- ----------------------------
-- Table structure for usersmusic
-- ----------------------------
DROP TABLE IF EXISTS `usersmusic`;
CREATE TABLE `usersmusic`  (
  `musicid` int(11) NOT NULL AUTO_INCREMENT,
  `musicname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musicstyle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musiclanguage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musictime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `musicurl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `musiccover` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`musicid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `usersmusic_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usersmusic
-- ----------------------------
INSERT INTO `usersmusic` VALUES (26, '起风了', '流行', '汉语', '5:23', '起风了.mp3', '起风了.jpg', '张三');
INSERT INTO `usersmusic` VALUES (31, '秋酿', '民谣', '汉语', '3:46', '秋酿.mp3', '秋酿.jpg', '张三');
INSERT INTO `usersmusic` VALUES (32, '寂静之声', '纯音乐', '纯音乐', '3:52', '寂静之声.mp3', '寂静之声.jpg', '张三');
INSERT INTO `usersmusic` VALUES (33, 'despacito', '欧美', '英语', '3:48', 'despacito（Remix）.mp3', 'despacito（Remix）.jpg', '张三');

SET FOREIGN_KEY_CHECKS = 1;
