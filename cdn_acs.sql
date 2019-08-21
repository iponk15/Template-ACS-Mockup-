/*
 Navicat Premium Data Transfer

 Source Server         : localhost72
 Source Server Type    : MySQL
 Source Server Version : 100134
 Source Host           : localhost:3307
 Source Schema         : cdn_acs

 Target Server Type    : MySQL
 Target Server Version : 100134
 File Encoding         : 65001

 Date: 02/08/2019 09:52:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acs_config
-- ----------------------------
DROP TABLE IF EXISTS `acs_config`;
CREATE TABLE `acs_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_kode` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `config_nama` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `config_limitemail` int(11) DEFAULT NULL,
  `config_temp` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `config_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `config_status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '0=off,1=on',
  `config_createdby` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `config_createddate` datetime(0) DEFAULT NULL,
  `config_lastupdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `config_udpatedby` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `config_ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_config
-- ----------------------------
INSERT INTO `acs_config` VALUES (14, 'BGR', 'Background Login', NULL, 'bg-1.jpg', 'Konfigurasi Background Login', '1', '111111', '2019-04-16 14:18:42', '2019-04-16 14:18:42', NULL, NULL);

-- ----------------------------
-- Table structure for acs_group
-- ----------------------------
DROP TABLE IF EXISTS `acs_group`;
CREATE TABLE `acs_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_role` int(11) DEFAULT NULL,
  `group_menu_id` int(11) DEFAULT NULL,
  `group_status` enum('0','1','99') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '0=off,1=on,99=trash',
  `group_createdby` int(11) DEFAULT NULL,
  `group_createddate` datetime(0) DEFAULT NULL,
  `group_updatedby` int(11) DEFAULT NULL,
  `group_lastupdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_ip` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  INDEX `del_child_menu`(`group_menu_id`) USING BTREE,
  INDEX `del_child_role`(`group_role`) USING BTREE,
  CONSTRAINT `acs_group_ibfk_1` FOREIGN KEY (`group_menu_id`) REFERENCES `acs_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `acs_group_ibfk_2` FOREIGN KEY (`group_role`) REFERENCES `acs_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_group
-- ----------------------------
INSERT INTO `acs_group` VALUES (178, 1, 1, '1', 27, '2019-07-23 15:21:59', NULL, '2019-07-23 15:21:59', '::1');
INSERT INTO `acs_group` VALUES (179, 1, 21, '1', 27, '2019-07-23 15:21:59', NULL, '2019-07-23 15:21:59', '::1');
INSERT INTO `acs_group` VALUES (180, 1, 28, '1', 27, '2019-07-23 15:21:59', NULL, '2019-07-23 15:21:59', '::1');
INSERT INTO `acs_group` VALUES (181, 1, 30, '1', 27, '2019-07-23 15:21:59', NULL, '2019-07-23 15:21:59', '::1');
INSERT INTO `acs_group` VALUES (182, 1, 29, '1', 27, '2019-07-23 15:21:59', NULL, '2019-07-23 15:21:59', '::1');
INSERT INTO `acs_group` VALUES (183, 1, 4, '1', 27, '2019-07-23 15:21:59', NULL, '2019-07-23 15:21:59', '::1');

-- ----------------------------
-- Table structure for acs_icon
-- ----------------------------
DROP TABLE IF EXISTS `acs_icon`;
CREATE TABLE `acs_icon`  (
  `icon_id` int(11) NOT NULL AUTO_INCREMENT,
  `icon_label` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `icon_deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `icon_tipe` enum('1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '1=flaticon,2=fontawesome,3=lineawesome,4=socicons',
  `icon_status` enum('0','1','99') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '0=of,1=on,99=trash',
  `icon_createdby` int(11) DEFAULT NULL,
  `icon_createddate` datetime(0) DEFAULT NULL,
  `icon_updatedby` int(11) DEFAULT NULL,
  `icon_lastupdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `icon_ip` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`icon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_icon
-- ----------------------------
INSERT INTO `acs_icon` VALUES (1, 'flaticon-email-black-circular-button', 'flaticon-email-black-circular-button', '1', NULL, 2147483647, '2019-07-05 10:27:45', NULL, '2019-07-05 10:27:45', '::1');
INSERT INTO `acs_icon` VALUES (2, 'flaticon-map', 'flaticon-map', '1', NULL, 2147483647, '2019-07-05 10:28:05', NULL, '2019-07-05 10:28:05', '::1');
INSERT INTO `acs_icon` VALUES (3, 'flaticon-alert-off', 'flaticon-alert-off', '1', NULL, 2147483647, '2019-07-05 10:28:15', NULL, '2019-07-05 10:28:15', '::1');
INSERT INTO `acs_icon` VALUES (4, 'flaticon-alert', 'flaticon-alert', '1', NULL, 2147483647, '2019-07-05 10:32:51', NULL, '2019-07-05 10:32:51', '::1');
INSERT INTO `acs_icon` VALUES (5, 'flaticon-computer', 'flaticon-computer', '1', NULL, 2147483647, '2019-07-05 10:33:10', NULL, '2019-07-05 10:33:10', '::1');
INSERT INTO `acs_icon` VALUES (6, 'flaticon-responsive', 'flaticon-responsive', '1', NULL, 2147483647, '2019-07-05 10:33:30', NULL, '2019-07-05 10:33:30', '::1');
INSERT INTO `acs_icon` VALUES (7, 'flaticon-presentation', 'flaticon-presentation', '1', NULL, 2147483647, '2019-07-05 10:33:43', NULL, '2019-07-05 10:33:43', '::1');
INSERT INTO `acs_icon` VALUES (8, 'flaticon-arrows', 'flaticon-arrows', '1', NULL, 2147483647, '2019-07-05 10:33:59', NULL, '2019-07-05 10:33:59', '::1');
INSERT INTO `acs_icon` VALUES (9, 'flaticon-rocket', 'flaticon-rocket', '1', NULL, 2147483647, '2019-07-05 10:34:33', NULL, '2019-07-05 10:34:33', '::1');
INSERT INTO `acs_icon` VALUES (10, 'flaticon-reply', 'flaticon-reply', '1', NULL, 2147483647, '2019-07-05 10:34:40', NULL, '2019-07-05 10:34:40', '::1');
INSERT INTO `acs_icon` VALUES (11, 'flaticon-gift', 'flaticon-gift', '1', NULL, 2147483647, '2019-07-05 10:35:11', NULL, '2019-07-05 10:35:11', '::1');
INSERT INTO `acs_icon` VALUES (12, 'flaticon-confetti', 'flaticon-confetti', '1', NULL, 2147483647, '2019-07-05 10:35:17', NULL, '2019-07-05 10:35:17', '::1');
INSERT INTO `acs_icon` VALUES (13, 'flaticon-piggy-bank', 'flaticon-piggy-bank', '1', NULL, 2147483647, '2019-07-05 10:35:30', NULL, '2019-07-05 10:35:30', '::1');
INSERT INTO `acs_icon` VALUES (14, 'flaticon-support', 'flaticon-support', '1', NULL, 2147483647, '2019-07-05 10:35:38', NULL, '2019-07-05 10:35:38', '::1');
INSERT INTO `acs_icon` VALUES (15, 'flaticon-delete', 'flaticon-delete', '1', NULL, 2147483647, '2019-07-05 10:35:45', NULL, '2019-07-05 10:35:45', '::1');
INSERT INTO `acs_icon` VALUES (16, 'flaticon-eye', 'flaticon-eye', '1', NULL, 2147483647, '2019-07-05 10:35:53', NULL, '2019-07-05 10:35:53', '::1');
INSERT INTO `acs_icon` VALUES (17, 'flaticon-multimedia', 'flaticon-multimedia', '1', NULL, 2147483647, '2019-07-05 10:36:09', NULL, '2019-07-05 10:36:09', '::1');
INSERT INTO `acs_icon` VALUES (18, 'flaticon-whatsapp', 'flaticon-whatsapp', '1', NULL, 2147483647, '2019-07-05 10:36:16', NULL, '2019-07-05 10:36:16', '::1');
INSERT INTO `acs_icon` VALUES (19, 'flaticon-multimedia-2', 'flaticon-multimedia-2', '1', NULL, 2147483647, '2019-07-05 10:36:25', NULL, '2019-07-05 10:36:25', '::1');
INSERT INTO `acs_icon` VALUES (20, 'flaticon-email', 'flaticon-email', '1', NULL, 2147483647, '2019-07-05 10:36:48', NULL, '2019-07-05 10:36:48', '::1');
INSERT INTO `acs_icon` VALUES (21, 'flaticon-presentation-1', 'flaticon-presentation-1', '1', NULL, 2147483647, '2019-07-05 10:36:59', NULL, '2019-07-05 10:36:59', '::1');
INSERT INTO `acs_icon` VALUES (22, 'flaticon-trophy', 'flaticon-trophy', '1', NULL, 2147483647, '2019-07-05 10:37:07', NULL, '2019-07-05 10:37:07', '::1');
INSERT INTO `acs_icon` VALUES (23, 'flaticon-psd', 'flaticon-psd', '1', NULL, 2147483647, '2019-07-05 10:37:13', NULL, '2019-07-05 10:37:13', '::1');
INSERT INTO `acs_icon` VALUES (24, 'flaticon-layer', 'flaticon-layer', '1', NULL, 2147483647, '2019-07-05 10:37:20', NULL, '2019-07-05 10:37:20', '::1');
INSERT INTO `acs_icon` VALUES (25, 'flaticon-doc', 'flaticon-doc', '1', NULL, 2147483647, '2019-07-05 10:37:26', NULL, '2019-07-05 10:37:26', '::1');
INSERT INTO `acs_icon` VALUES (26, 'flaticon-file', 'flaticon-file', '1', NULL, 2147483647, '2019-07-05 10:37:33', NULL, '2019-07-05 10:37:33', '::1');
INSERT INTO `acs_icon` VALUES (27, 'flaticon-network', 'flaticon-network', '1', NULL, 2147483647, '2019-07-05 10:37:38', NULL, '2019-07-05 10:37:38', '::1');
INSERT INTO `acs_icon` VALUES (28, 'flaticon-bus-stop', 'flaticon-bus-stop', '1', NULL, 2147483647, '2019-07-05 10:37:44', NULL, '2019-07-05 10:37:44', '::1');
INSERT INTO `acs_icon` VALUES (29, 'flaticon-globe', 'flaticon-globe', '1', NULL, 2147483647, '2019-07-05 10:37:50', NULL, '2019-07-05 10:37:50', '::1');
INSERT INTO `acs_icon` VALUES (30, 'flaticon-upload', 'flaticon-upload', '1', NULL, 2147483647, '2019-07-05 10:37:55', NULL, '2019-07-05 10:37:55', '::1');
INSERT INTO `acs_icon` VALUES (31, 'flaticon-squares', 'flaticon-squares', '1', NULL, 2147483647, '2019-07-05 10:38:01', NULL, '2019-07-05 10:38:01', '::1');
INSERT INTO `acs_icon` VALUES (32, 'flaticon-technology', 'flaticon-technology\r\n', '1', NULL, 2147483647, '2019-07-05 10:38:08', NULL, '2019-07-05 10:38:08', '::1');
INSERT INTO `acs_icon` VALUES (33, 'flaticon-up-arrow', 'flaticon-up-arrow', '1', NULL, 2147483647, '2019-07-05 10:38:14', NULL, '2019-07-05 10:38:14', '::1');
INSERT INTO `acs_icon` VALUES (34, 'flaticon-browser', 'flaticon-browser', '1', NULL, 2147483647, '2019-07-05 10:38:32', NULL, '2019-07-05 10:38:32', '::1');
INSERT INTO `acs_icon` VALUES (35, 'flaticon-speech-bubble', 'flaticon-speech-bubble', '1', NULL, 2147483647, '2019-07-05 10:38:39', NULL, '2019-07-05 10:38:39', '::1');
INSERT INTO `acs_icon` VALUES (36, 'flaticon-coins', 'flaticon-coins', '1', NULL, 2147483647, '2019-07-05 10:38:49', NULL, '2019-07-05 10:38:49', '::1');
INSERT INTO `acs_icon` VALUES (37, 'flaticon-open-box', 'flaticon-open-box', '1', NULL, 2147483647, '2019-07-05 10:39:00', NULL, '2019-07-05 10:39:00', '::1');
INSERT INTO `acs_icon` VALUES (38, 'flaticon-speech-bubble-1', 'flaticon-speech-bubble-1', '1', NULL, 2147483647, '2019-07-05 10:39:08', NULL, '2019-07-05 10:39:08', '::1');
INSERT INTO `acs_icon` VALUES (39, 'flaticon-attachment', 'flaticon-attachment', '1', NULL, 2147483647, '2019-07-05 10:39:21', NULL, '2019-07-05 10:39:21', '::1');
INSERT INTO `acs_icon` VALUES (40, 'flaticon-photo-camera', 'flaticon-photo-camera', '1', NULL, 2147483647, '2019-07-05 10:39:27', NULL, '2019-07-05 10:39:27', '::1');
INSERT INTO `acs_icon` VALUES (41, 'flaticon-skype-logo', 'flaticon-skype-logo', '1', NULL, 2147483647, '2019-07-05 10:39:48', NULL, '2019-07-05 10:39:48', '::1');
INSERT INTO `acs_icon` VALUES (42, 'flaticon-linkedin-logo', 'flaticon-linkedin-logo', '1', NULL, 2147483647, '2019-07-05 10:39:56', NULL, '2019-07-05 10:39:56', '::1');
INSERT INTO `acs_icon` VALUES (43, 'flaticon-twitter-logo', 'flaticon-twitter-logo', '1', NULL, 2147483647, '2019-07-05 10:40:16', NULL, '2019-07-05 10:40:16', '::1');
INSERT INTO `acs_icon` VALUES (44, 'flaticon-facebook-letter-logo', 'flaticon-facebook-letter-logo', '1', NULL, 2147483647, '2019-07-05 10:40:20', NULL, '2019-07-05 10:40:20', '::1');
INSERT INTO `acs_icon` VALUES (45, 'flaticon-calendar-with-a-clock-time-tools', 'flaticon-calendar-with-a-clock-time-tools', '1', NULL, 2147483647, '2019-07-05 10:40:29', NULL, '2019-07-05 10:40:29', '::1');
INSERT INTO `acs_icon` VALUES (46, 'flaticon-youtube', 'flaticon-youtube', '1', NULL, 2147483647, '2019-07-05 10:40:35', NULL, '2019-07-05 10:40:35', '::1');
INSERT INTO `acs_icon` VALUES (47, 'flaticon-add-circular-button', 'flaticon-add-circular-button', '1', NULL, 2147483647, '2019-07-05 10:40:44', NULL, '2019-07-05 10:40:44', '::1');
INSERT INTO `acs_icon` VALUES (48, 'flaticon-more-v2', 'flaticon-more-v2', '1', NULL, 2147483647, '2019-07-05 10:40:50', NULL, '2019-07-05 10:40:50', '::1');
INSERT INTO `acs_icon` VALUES (49, 'flaticon-search', 'flaticon-search', '1', NULL, 2147483647, '2019-07-05 10:40:59', NULL, '2019-07-05 10:40:59', '::1');
INSERT INTO `acs_icon` VALUES (50, 'flaticon-search-magnifier-interface-symbol', 'flaticon-search-magnifier-interface-symbol', '1', NULL, 2147483647, '2019-07-05 10:41:08', NULL, '2019-07-05 10:41:08', '::1');
INSERT INTO `acs_icon` VALUES (51, 'flaticon-questions-circular-button', 'flaticon-questions-circular-button', '1', NULL, 2147483647, '2019-07-05 10:41:16', NULL, '2019-07-05 10:41:16', '::1');
INSERT INTO `acs_icon` VALUES (52, 'flaticon-refresh', 'flaticon-refresh', '1', NULL, 2147483647, '2019-07-05 10:41:21', NULL, '2019-07-05 10:41:21', '::1');
INSERT INTO `acs_icon` VALUES (53, 'flaticon-logout', 'flaticon-logout', '1', NULL, 2147483647, '2019-07-05 10:41:26', NULL, '2019-07-05 10:41:26', '::1');
INSERT INTO `acs_icon` VALUES (54, 'flaticon-event-calendar-symbol', 'flaticon-event-calendar-symbol', '1', NULL, 2147483647, '2019-07-05 10:41:31', NULL, '2019-07-05 10:41:31', '::1');
INSERT INTO `acs_icon` VALUES (55, 'flaticon-laptop', 'flaticon-laptop', '1', NULL, 2147483647, '2019-07-05 10:41:42', NULL, '2019-07-05 10:41:42', '::1');
INSERT INTO `acs_icon` VALUES (56, 'flaticon-tool', 'flaticon-tool', '1', NULL, 2147483647, '2019-07-05 10:41:49', NULL, '2019-07-05 10:41:49', '::1');
INSERT INTO `acs_icon` VALUES (57, 'flaticon-graphic', 'flaticon-graphic', '1', NULL, 2147483647, '2019-07-05 10:41:54', NULL, '2019-07-05 10:41:54', '::1');
INSERT INTO `acs_icon` VALUES (58, 'flaticon-symbol', 'flaticon-symbol', '1', NULL, 2147483647, '2019-07-05 10:42:01', NULL, '2019-07-05 10:42:01', '::1');
INSERT INTO `acs_icon` VALUES (59, 'flaticon-graphic-1', 'flaticon-graphic-1', '1', NULL, 2147483647, '2019-07-05 10:42:13', NULL, '2019-07-05 10:42:13', '::1');
INSERT INTO `acs_icon` VALUES (60, 'flaticon-clock', 'flaticon-clock', '1', NULL, 2147483647, '2019-07-05 10:42:19', NULL, '2019-07-05 10:42:19', '::1');
INSERT INTO `acs_icon` VALUES (61, 'flaticon-squares-1', 'flaticon-squares-1', '1', NULL, 2147483647, '2019-07-05 10:42:27', NULL, '2019-07-05 10:42:27', '::1');
INSERT INTO `acs_icon` VALUES (62, 'flaticon-black', 'flaticon-black', '1', NULL, 2147483647, '2019-07-05 10:42:35', NULL, '2019-07-05 10:42:35', '::1');
INSERT INTO `acs_icon` VALUES (63, 'flaticon-book', 'flaticon-book', '1', NULL, 2147483647, '2019-07-05 10:42:41', NULL, '2019-07-05 10:42:41', '::1');
INSERT INTO `acs_icon` VALUES (64, 'flaticon-cogwheel', 'flaticon-cogwheel', '1', NULL, 2147483647, '2019-07-05 10:42:46', NULL, '2019-07-05 10:42:46', '::1');
INSERT INTO `acs_icon` VALUES (65, 'flaticon-exclamation', 'flaticon-exclamation\r\n', '1', NULL, 2147483647, '2019-07-05 10:42:52', NULL, '2019-07-05 10:42:52', '::1');
INSERT INTO `acs_icon` VALUES (66, 'flaticon-add-label-button', 'flaticon-add-label-button', '1', NULL, 2147483647, '2019-07-05 10:42:59', NULL, '2019-07-05 10:42:59', '::1');
INSERT INTO `acs_icon` VALUES (67, 'flaticon-delete-1', 'flaticon-delete-1', '1', NULL, 2147483647, '2019-07-05 10:43:07', NULL, '2019-07-05 10:43:07', '::1');
INSERT INTO `acs_icon` VALUES (68, 'flaticon-interface', 'flaticon-interface', '1', NULL, 2147483647, '2019-07-05 10:43:20', NULL, '2019-07-05 10:43:20', '::1');
INSERT INTO `acs_icon` VALUES (69, 'flaticon-more', 'flaticon-more', '1', NULL, 2147483647, '2019-07-05 10:43:27', NULL, '2019-07-05 10:43:27', '::1');
INSERT INTO `acs_icon` VALUES (70, 'flaticon-warning-sign', 'flaticon-warning-sign', '1', NULL, 2147483647, '2019-07-05 10:43:40', NULL, '2019-07-05 10:43:40', '::1');
INSERT INTO `acs_icon` VALUES (71, 'flaticon-calendar', 'flaticon-calendar', '1', NULL, 2147483647, '2019-07-05 10:43:49', NULL, '2019-07-05 10:43:49', '::1');
INSERT INTO `acs_icon` VALUES (72, 'flaticon-instagram-logo', 'flaticon-instagram-logo', '1', NULL, 2147483647, '2019-07-05 10:43:57', NULL, '2019-07-05 10:43:57', '::1');
INSERT INTO `acs_icon` VALUES (73, 'flaticon-linkedin', 'flaticon-linkedin', '1', NULL, 2147483647, '2019-07-05 10:44:22', NULL, '2019-07-05 10:44:22', '::1');
INSERT INTO `acs_icon` VALUES (74, 'flaticon-facebook-logo-button', 'flaticon-facebook-logo-button', '1', NULL, 2147483647, '2019-07-05 10:45:00', NULL, '2019-07-05 10:45:00', '::1');
INSERT INTO `acs_icon` VALUES (75, 'flaticon-twitter-logo-button', 'flaticon-twitter-logo-button', '1', NULL, 2147483647, '2019-07-05 10:45:27', NULL, '2019-07-05 10:45:27', '::1');
INSERT INTO `acs_icon` VALUES (76, 'flaticon-cancel', 'flaticon-cancel', '1', NULL, 2147483647, '2019-07-05 10:45:47', NULL, '2019-07-05 10:45:47', '::1');
INSERT INTO `acs_icon` VALUES (77, 'flaticon-exclamation-square', 'flaticon-exclamation-square', '1', NULL, 2147483647, '2019-07-05 10:45:52', NULL, '2019-07-05 10:45:52', '::1');
INSERT INTO `acs_icon` VALUES (78, 'flaticon-buildings', 'flaticon-buildings', '1', NULL, 2147483647, '2019-07-05 10:46:02', NULL, '2019-07-05 10:46:02', '::1');
INSERT INTO `acs_icon` VALUES (79, 'flaticon-danger', 'flaticon-danger', '1', NULL, 2147483647, '2019-07-05 10:46:08', NULL, '2019-07-05 10:46:08', '::1');
INSERT INTO `acs_icon` VALUES (80, 'flaticon-technology-1', 'flaticon-technology-1', '1', NULL, 2147483647, '2019-07-05 10:46:22', NULL, '2019-07-05 10:46:22', '::1');
INSERT INTO `acs_icon` VALUES (81, 'flaticon-letter-g', 'flaticon-letter-g', '1', NULL, 2147483647, '2019-07-05 10:46:30', NULL, '2019-07-05 10:46:30', '::1');
INSERT INTO `acs_icon` VALUES (82, 'flaticon-interface-1', 'flaticon-interface-1', '1', NULL, 2147483647, '2019-07-05 10:46:36', NULL, '2019-07-05 10:46:36', '::1');
INSERT INTO `acs_icon` VALUES (83, 'flaticon-circle', 'flaticon-circle', '1', NULL, 2147483647, '2019-07-05 10:46:41', NULL, '2019-07-05 10:46:41', '::1');
INSERT INTO `acs_icon` VALUES (84, 'flaticon-pin', 'flaticon-pin', '1', NULL, 2147483647, '2019-07-05 10:46:47', NULL, '2019-07-05 10:46:47', '::1');
INSERT INTO `acs_icon` VALUES (85, 'flaticon-close', 'flaticon-close', '1', NULL, 2147483647, '2019-07-05 10:47:03', NULL, '2019-07-05 10:47:03', '::1');
INSERT INTO `acs_icon` VALUES (86, 'flaticon-clock-1', 'flaticon-clock-1', '1', NULL, 2147483647, '2019-07-05 10:47:11', NULL, '2019-07-05 10:47:11', '::1');
INSERT INTO `acs_icon` VALUES (87, 'flaticon-apps', 'flaticon-apps', '1', NULL, 2147483647, '2019-07-05 10:47:17', NULL, '2019-07-05 10:47:17', '::1');
INSERT INTO `acs_icon` VALUES (88, 'flaticon-user', 'flaticon-user', '1', NULL, 2147483647, '2019-07-05 10:47:32', NULL, '2019-07-05 10:47:32', '::1');
INSERT INTO `acs_icon` VALUES (89, 'flaticon-menu-button', 'flaticon-menu-button', '1', NULL, 2147483647, '2019-07-05 10:47:45', NULL, '2019-07-05 10:47:45', '::1');
INSERT INTO `acs_icon` VALUES (90, 'flaticon-settings', 'flaticon-settings', '1', NULL, 2147483647, '2019-07-05 10:47:54', NULL, '2019-07-05 10:47:54', '::1');
INSERT INTO `acs_icon` VALUES (91, 'flaticon-home', 'flaticon-home', '1', NULL, 2147483647, '2019-07-05 10:49:15', NULL, '2019-07-05 10:49:15', '::1');
INSERT INTO `acs_icon` VALUES (92, 'flaticon-clock-2', 'flaticon-clock-2', '1', NULL, 2147483647, '2019-07-05 10:49:20', NULL, '2019-07-05 10:49:20', '::1');
INSERT INTO `acs_icon` VALUES (93, 'flaticon-lifebuoy', 'flaticon-lifebuoy', '1', NULL, 2147483647, '2019-07-05 10:49:26', NULL, '2019-07-05 10:49:26', '::1');
INSERT INTO `acs_icon` VALUES (94, 'flaticon-cogwheel-1', 'flaticon-cogwheel-1', '1', NULL, 2147483647, '2019-07-05 10:49:33', NULL, '2019-07-05 10:49:33', '::1');
INSERT INTO `acs_icon` VALUES (95, 'flaticon-paper-plane', 'flaticon-paper-plane', '1', NULL, 2147483647, '2019-07-05 10:49:39', NULL, '2019-07-05 10:49:39', '::1');
INSERT INTO `acs_icon` VALUES (96, 'flaticon-statistics', 'flaticon-statistics', '1', NULL, 2147483647, '2019-07-05 10:49:45', NULL, '2019-07-05 10:49:45', '::1');
INSERT INTO `acs_icon` VALUES (97, 'flaticon-diagram', 'flaticon-diagram', '1', NULL, 2147483647, '2019-07-05 10:49:50', NULL, '2019-07-05 10:49:50', '::1');
INSERT INTO `acs_icon` VALUES (98, 'flaticon-line-graph', 'flaticon-line-graph', '1', NULL, 2147483647, '2019-07-05 10:49:59', NULL, '2019-07-05 10:49:59', '::1');
INSERT INTO `acs_icon` VALUES (99, 'flaticon-customer', 'flaticon-customer\r\n', '1', NULL, 2147483647, '2019-07-05 10:50:08', NULL, '2019-07-05 10:50:08', '::1');
INSERT INTO `acs_icon` VALUES (100, 'flaticon-visible', 'flaticon-visible', '1', NULL, 2147483647, '2019-07-05 10:50:15', NULL, '2019-07-05 10:50:15', '::1');
INSERT INTO `acs_icon` VALUES (101, 'flaticon-shopping-basket', 'flaticon-shopping-basket', '1', NULL, 2147483647, '2019-07-05 10:50:22', NULL, '2019-07-05 10:50:22', '::1');
INSERT INTO `acs_icon` VALUES (102, 'flaticon-price-tag', 'flaticon-price-tag', '1', NULL, 2147483647, '2019-07-05 10:50:28', NULL, '2019-07-05 10:50:28', '::1');
INSERT INTO `acs_icon` VALUES (103, 'flaticon-businesswoman', 'flaticon-businesswoman\r\n', '1', NULL, 2147483647, '2019-07-05 10:50:39', NULL, '2019-07-05 10:50:39', '::1');
INSERT INTO `acs_icon` VALUES (104, 'flaticon-medal', 'flaticon-medal', '1', NULL, 2147483647, '2019-07-05 10:50:44', NULL, '2019-07-05 10:50:44', '::1');
INSERT INTO `acs_icon` VALUES (105, 'flaticon-like', 'flaticon-like', '1', NULL, 2147483647, '2019-07-05 10:50:48', NULL, '2019-07-05 10:50:48', '::1');
INSERT INTO `acs_icon` VALUES (106, 'flaticon-edit', 'flaticon-edit', '1', NULL, 2147483647, '2019-07-05 10:50:54', NULL, '2019-07-05 10:50:54', '::1');
INSERT INTO `acs_icon` VALUES (107, 'flaticon-avatar', 'flaticon-avatar', '1', NULL, 2147483647, '2019-07-05 10:50:59', NULL, '2019-07-05 10:50:59', '::1');
INSERT INTO `acs_icon` VALUES (108, 'flaticon-download', 'flaticon-download', '1', NULL, 2147483647, '2019-07-05 10:51:04', NULL, '2019-07-05 10:51:04', '::1');
INSERT INTO `acs_icon` VALUES (109, 'flaticon-home-1', 'flaticon-home-1', '1', NULL, 2147483647, '2019-07-05 10:51:18', NULL, '2019-07-05 10:51:18', '::1');
INSERT INTO `acs_icon` VALUES (110, 'flaticon-mail', 'flaticon-mail', '1', NULL, 2147483647, '2019-07-05 10:51:24', NULL, '2019-07-05 10:51:24', '::1');
INSERT INTO `acs_icon` VALUES (111, 'flaticon-mail-1', 'flaticon-mail-1', '1', NULL, 2147483647, '2019-07-05 10:51:30', NULL, '2019-07-05 10:51:30', '::1');
INSERT INTO `acs_icon` VALUES (112, 'flaticon-warning', 'flaticon-warning', '1', NULL, 2147483647, '2019-07-05 10:51:36', NULL, '2019-07-05 10:51:36', '::1');
INSERT INTO `acs_icon` VALUES (113, 'flaticon-cart', 'flaticon-cart', '1', NULL, 2147483647, '2019-07-05 10:51:43', NULL, '2019-07-05 10:51:43', '::1');
INSERT INTO `acs_icon` VALUES (114, 'flaticon-bag', 'flaticon-bag', '1', NULL, 2147483647, '2019-07-05 10:51:47', NULL, '2019-07-05 10:51:47', '::1');
INSERT INTO `acs_icon` VALUES (115, 'flaticon-pie-chart', 'flaticon-pie-chart', '1', NULL, 2147483647, '2019-07-05 10:51:58', NULL, '2019-07-05 10:51:58', '::1');
INSERT INTO `acs_icon` VALUES (116, 'flaticon-graph', 'flaticon-graph', '1', NULL, 2147483647, '2019-07-05 10:52:04', NULL, '2019-07-05 10:52:04', '::1');
INSERT INTO `acs_icon` VALUES (117, 'flaticon-interface-2', 'flaticon-interface-2', '1', NULL, 2147483647, '2019-07-05 10:52:10', NULL, '2019-07-05 10:52:10', '::1');
INSERT INTO `acs_icon` VALUES (118, 'flaticon-chat', 'flaticon-chat', '1', NULL, 2147483647, '2019-07-05 10:52:15', NULL, '2019-07-05 10:52:15', '::1');
INSERT INTO `acs_icon` VALUES (119, 'flaticon-envelope', 'flaticon-envelope\r\n', '1', NULL, 2147483647, '2019-07-05 10:52:20', NULL, '2019-07-05 10:52:20', '::1');
INSERT INTO `acs_icon` VALUES (120, 'flaticon-chat-1', 'flaticon-chat-1', '1', NULL, 2147483647, '2019-07-05 10:52:26', NULL, '2019-07-05 10:52:26', '::1');
INSERT INTO `acs_icon` VALUES (121, 'flaticon-interface-3', 'flaticon-interface-3', '1', NULL, 2147483647, '2019-07-05 10:52:51', NULL, '2019-07-05 10:52:51', '::1');
INSERT INTO `acs_icon` VALUES (122, 'flaticon-background', 'flaticon-background\r\n', '1', NULL, 2147483647, '2019-07-05 10:52:59', NULL, '2019-07-05 10:52:59', '::1');
INSERT INTO `acs_icon` VALUES (123, 'flaticon-file-1', 'flaticon-file-1', '1', NULL, 2147483647, '2019-07-05 10:53:04', NULL, '2019-07-05 10:53:04', '::1');
INSERT INTO `acs_icon` VALUES (124, 'flaticon-interface-4', 'flaticon-interface-4', '1', NULL, 2147483647, '2019-07-05 10:53:09', NULL, '2019-07-05 10:53:09', '::1');
INSERT INTO `acs_icon` VALUES (125, 'flaticon-multimedia-3', 'flaticon-multimedia-3', '1', NULL, 2147483647, '2019-07-05 10:53:15', NULL, '2019-07-05 10:53:15', '::1');
INSERT INTO `acs_icon` VALUES (126, 'flaticon-list', 'flaticon-list', '1', NULL, 2147483647, '2019-07-05 10:53:21', NULL, '2019-07-05 10:53:21', '::1');
INSERT INTO `acs_icon` VALUES (127, 'flaticon-time', 'flaticon-time', '1', NULL, 2147483647, '2019-07-05 10:54:33', NULL, '2019-07-05 10:54:33', '::1');
INSERT INTO `acs_icon` VALUES (128, 'flaticon-profile', 'flaticon-profile', '1', NULL, 2147483647, '2019-07-05 10:54:38', NULL, '2019-07-05 10:54:38', '::1');
INSERT INTO `acs_icon` VALUES (129, 'flaticon-imac', 'flaticon-imac', '1', NULL, 2147483647, '2019-07-05 10:54:50', NULL, '2019-07-05 10:54:50', '::1');
INSERT INTO `acs_icon` VALUES (130, 'flaticon-medical', 'flaticon-medical', '1', NULL, 2147483647, '2019-07-05 10:54:55', NULL, '2019-07-05 10:54:55', '::1');
INSERT INTO `acs_icon` VALUES (131, 'flaticon-music', 'flaticon-music', '1', NULL, 2147483647, '2019-07-05 10:55:07', NULL, '2019-07-05 10:55:07', '::1');
INSERT INTO `acs_icon` VALUES (132, 'flaticon-plus', 'flaticon-plus', '1', NULL, 2147483647, '2019-07-05 10:55:13', NULL, '2019-07-05 10:55:13', '::1');
INSERT INTO `acs_icon` VALUES (133, 'flaticon-exclamation-1', 'flaticon-exclamation-1', '1', NULL, 2147483647, '2019-07-05 10:55:23', NULL, '2019-07-05 10:55:23', '::1');
INSERT INTO `acs_icon` VALUES (134, 'flaticon-info', 'flaticon-info', '1', NULL, 2147483647, '2019-07-05 10:55:29', NULL, '2019-07-05 10:55:29', '::1');
INSERT INTO `acs_icon` VALUES (135, 'flaticon-menu-1', 'flaticon-menu-1', '1', NULL, 2147483647, '2019-07-05 10:55:35', NULL, '2019-07-05 10:55:35', '::1');
INSERT INTO `acs_icon` VALUES (136, 'flaticon-menu-2', 'flaticon-menu-2', '1', NULL, 2147483647, '2019-07-05 10:55:40', NULL, '2019-07-05 10:55:40', '::1');
INSERT INTO `acs_icon` VALUES (137, 'flaticon-share', 'flaticon-share', '1', NULL, 2147483647, '2019-07-05 10:55:55', NULL, '2019-07-05 10:55:55', '::1');
INSERT INTO `acs_icon` VALUES (138, 'flaticon-interface-5', 'flaticon-interface-5', '1', NULL, 2147483647, '2019-07-05 10:55:59', NULL, '2019-07-05 10:55:59', '::1');
INSERT INTO `acs_icon` VALUES (139, 'flaticon-signs', 'flaticon-signs', '1', NULL, 2147483647, '2019-07-05 10:57:30', NULL, '2019-07-05 10:57:30', '::1');
INSERT INTO `acs_icon` VALUES (140, 'flaticon-tabs', 'flaticon-tabs', '1', NULL, 2147483647, '2019-07-05 10:57:34', NULL, '2019-07-05 10:57:34', '::1');
INSERT INTO `acs_icon` VALUES (141, 'flaticon-multimedia-4', 'flaticon-multimedia-4', '1', NULL, 2147483647, '2019-07-05 10:57:39', NULL, '2019-07-05 10:57:39', '::1');
INSERT INTO `acs_icon` VALUES (142, 'flaticon-upload-1', 'flaticon-upload-1', '1', NULL, 2147483647, '2019-07-05 10:57:44', NULL, '2019-07-05 10:57:44', '::1');
INSERT INTO `acs_icon` VALUES (143, 'flaticon-web', 'flaticon-web', '1', NULL, 2147483647, '2019-07-05 10:57:49', NULL, '2019-07-05 10:57:49', '::1');
INSERT INTO `acs_icon` VALUES (144, 'flaticon-placeholder', 'flaticon-placeholder', '1', NULL, 2147483647, '2019-07-05 10:57:54', NULL, '2019-07-05 10:57:54', '::1');
INSERT INTO `acs_icon` VALUES (151, 'fab fa-500px', 'fab fa-500px', '2', NULL, 2147483647, '2019-07-05 11:00:50', NULL, '2019-07-05 11:00:50', '::1');
INSERT INTO `acs_icon` VALUES (152, 'fab fa-accessible-icon', 'fab fa-accessible-icon', '2', NULL, 2147483647, '2019-07-05 11:01:07', NULL, '2019-07-05 11:01:07', '::1');

-- ----------------------------
-- Table structure for acs_jadwal
-- ----------------------------
DROP TABLE IF EXISTS `acs_jadwal`;
CREATE TABLE `acs_jadwal`  (
  `jadwal_id` int(11) NOT NULL AUTO_INCREMENT,
  `jadwal_pesawat_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jadwal_flt_no` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jadwal_dari` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jadwal_ke` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jadwal_atd` datetime(0) DEFAULT NULL,
  `jadwal_ata` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`jadwal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for acs_log_activity
-- ----------------------------
DROP TABLE IF EXISTS `acs_log_activity`;
CREATE TABLE `acs_log_activity`  (
  `logAct_id` int(11) NOT NULL AUTO_INCREMENT,
  `logAct_menu` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logAct_emp` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logAct_note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `logAct_bo` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logAct_role` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logAct_ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logAct_date` datetime(0) DEFAULT NULL,
  `logAct_flag` enum('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '1=system,2=transaction',
  `logAct_device` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `logAct_flight_no` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `logAct_flight_status` enum('1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '1=reservasi,2=claim,3=compare,4=good receipt',
  PRIMARY KEY (`logAct_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 935 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_log_activity
-- ----------------------------
INSERT INTO `acs_log_activity` VALUES (1, 'Flight Schedule', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 31 ]', 'PDG', 'KK', '::1', '2019-04-22 09:53:32', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (2, 'Flight Schedule', '777777', 'Flights with number GA-162 successfully booked by user with nopeg <b>777777</b> at the hotel Mercure (PDG)', 'PDG', 'KK', '172.18.60.63', '2019-04-22 09:59:08', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (3, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '::1', '2019-04-22 11:06:11', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (4, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '::1', '2019-04-22 12:10:00', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (5, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '172.18.60.184', '2019-04-22 15:02:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (6, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.184', '2019-04-22 15:02:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (7, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-04-22-2019-04-22 by <b>888888</b>', 'PDG', 'AA', '172.18.60.184', '2019-04-22 15:03:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (8, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '172.18.60.184', '2019-04-22 15:03:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (9, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.184', '2019-04-22 15:03:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (10, 'Flight Schedule', '777777', 'Flights with number GA-168 successfully booked by user with nopeg <b>777777</b> at the hotel Mercure (PDG)', 'PDG', 'KK', '172.18.60.184', '2019-04-22 15:07:03', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (11, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '172.18.60.184', '2019-04-22 15:07:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (12, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.184', '2019-04-22 15:07:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (13, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-04-21-2019-04-22 by <b>888888</b>', 'PDG', 'AA', '172.18.60.184', '2019-04-22 15:08:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (14, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '172.18.60.184', '2019-04-22 15:08:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (15, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.184', '2019-04-22 15:08:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (16, 'Flight Schedule', '777777', 'Flights with number GA-162 successfully booked by user with nopeg <b>777777</b> at the hotel Mercure (PDG)', 'PDG', 'KK', '172.18.60.7', '2019-04-22 17:28:31', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (17, 'Flight Schedule', '777777', 'Flights with number GA-168 successfully booked by user with nopeg <b>777777</b> at the hotel Mercure (PDG)', 'PDG', 'KK', '172.18.60.7', '2019-04-22 17:28:45', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (18, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '172.18.60.7', '2019-04-22 17:28:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (19, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '172.18.60.7', '2019-04-22 17:29:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (20, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '172.18.60.7', '2019-04-22 17:29:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (21, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '172.18.60.7', '2019-04-22 17:29:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (22, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.7', '2019-04-22 17:33:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (23, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-04-21-2019-04-21 by <b>888888</b>', 'PDG', 'AA', '172.18.60.7', '2019-04-22 17:37:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (24, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '172.18.60.7', '2019-04-22 17:37:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (25, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.7', '2019-04-22 17:37:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (26, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '::1', '2019-04-22 17:45:37', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (27, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '::1', '2019-04-22 17:45:51', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (28, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '::1', '2019-04-22 17:58:54', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (29, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 09:33:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (30, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 09:33:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (31, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 09:34:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (32, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 09:34:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (33, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 09:35:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (34, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 09:36:26', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (35, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 10:05:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (36, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:05:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (37, 'Flight Schedule', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 29 ]', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:12:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (38, 'Flight Schedule', '777777', 'Flights with number GA-168 successfully booked by user with nopeg <b>777777</b> at the hotel Mercure (PDG)', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:13:23', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (39, 'Flight Schedule', '777777', 'Flights with number GA-162 successfully booked by user with nopeg <b>777777</b> at the hotel Mercure (PDG)', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:13:52', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (40, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:20:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (41, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:21:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (42, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:21:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (43, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:22:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (44, 'Reservasi', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG with flight GA-162 [ Total Flight 1 || Total Crews 7 ]', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:32:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (45, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:33:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (46, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:34:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (47, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:37:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (48, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 10:38:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (49, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign in to system', 'PDG', 'AA', '172.18.21.255', '2019-04-23 10:39:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (50, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-04-23-2019-04-23 by <b>888888</b>', 'PDG', 'AA', '172.18.21.255', '2019-04-23 10:39:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (51, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '172.18.21.255', '2019-04-23 10:39:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (52, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.21.255', '2019-04-23 10:40:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (53, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:41:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (54, 'Compare', '777777', 'Invoice from <b>Hotel</b> with number <b>pdg23apr2019</b> has been claimed by <b>777777</b>. Email has been send to Hotel', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:43:57', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (55, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign in to system', 'PDG', 'AA', '172.18.21.255', '2019-04-23 10:44:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (56, 'Compare', '888888', 'File with comdat_id 4 has successfully updated! 888888', 'PDG', 'AA', '172.18.21.255', '2019-04-23 10:47:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (57, 'Compare', '777777', 'Invoice from <b>HAS System</b> with number <b>pdg23apr2019</b> has been claimed with a list of flight numbers <b>168</b> by <b>777777</b>', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:48:25', '2', 'gaazrdevproject', '168', '2');
INSERT INTO `acs_log_activity` VALUES (58, 'Claim', '777777', 'user with Nopeg <b>777777</b> has entered additional cost data on invoice number <b>pdg23apr2019</b> and flight number <b>168</b>', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:51:27', '2', 'gaazrdevproject', '168', '3');
INSERT INTO `acs_log_activity` VALUES (59, 'Reservation', '777777', 'Generate report invoice PDG periode 2019-04-23-2019-04-23 by <b>777777</b>', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:51:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (60, 'Compare', '777777', 'User with Nopeg <b>777777</b> has regenerate the invoice with number <b>pdg23apr2019</b>', 'PDG', 'KK', '172.18.21.255', '2019-04-23 10:51:40', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (61, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.21.255', '2019-04-23 10:57:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (62, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 11:12:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (63, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '172.18.21.255', '2019-04-23 11:15:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (64, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 11:25:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (65, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.33', '2019-04-23 11:34:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (66, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.21.255', '2019-04-23 11:41:06', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (67, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '::1', '2019-04-23 11:42:10', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (68, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-04-23 12:12:56', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (69, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.21.255', '2019-04-23 12:31:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (70, 'Flight Schedule', '333333', 'Flights with number GA-328 successfully booked by user with nopeg <b>333333</b> at the hotel Rich Palace (SUB)', 'SUB', 'KK', '172.18.21.255', '2019-04-23 12:32:13', '2', 'gaazrdevproject', '328', '1');
INSERT INTO `acs_log_activity` VALUES (71, 'Flight Schedule', '333333', 'Flights with number GA-326 successfully booked by user with nopeg <b>333333</b> at the hotel Rich Palace (SUB)', 'SUB', 'KK', '172.18.21.255', '2019-04-23 12:33:22', '2', 'gaazrdevproject', '326', '1');
INSERT INTO `acs_log_activity` VALUES (72, 'Reservation', '333333', 'report reservation with flight number GA-326 successfully generated by <b>333333</b>', 'SUB', 'KK', '172.18.21.255', '2019-04-23 12:34:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (73, 'Reservation', '333333', 'Report reservation has been send to hotel management', 'SUB', 'KK', '172.18.21.255', '2019-04-23 12:34:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (74, 'Reservation', '333333', 'report reservation with flight number GA-328 successfully generated by <b>333333</b>', 'SUB', 'KK', '172.18.21.255', '2019-04-23 12:34:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (75, 'Reservation', '333333', 'Report reservation has been send to hotel management', 'SUB', 'KK', '172.18.21.255', '2019-04-23 12:34:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (76, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 12:35:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (77, 'Reservation', '444444', 'Generate report invoice SUB periode 2019-04-23-2019-04-23 by <b>444444</b>', 'SUB', 'AA', '172.18.21.255', '2019-04-23 12:35:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (78, 'Reservation', '444444', 'Invoice has been upload by  <b>444444</b>', 'SUB', 'AA', '172.18.21.255', '2019-04-23 12:35:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (79, 'Login', '444444', 'User with nopeg <b>444444</b> successfully sign out from system', 'SUB', 'AA', '172.18.21.255', '2019-04-23 12:36:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (80, 'Compare', '333333', 'Invoice from <b>HAS System</b> with number <b>sub23apr</b> has been claimed with a list of flight numbers <b>328</b> by <b>333333</b>', 'SUB', 'KK', '172.18.21.255', '2019-04-23 12:38:20', '2', 'gaazrdevproject', '328', '2');
INSERT INTO `acs_log_activity` VALUES (81, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.33', '2019-04-23 12:57:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (82, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-04-23 12:57:11', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (83, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '::1', '2019-04-23 13:05:44', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (84, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.33', '2019-04-23 13:33:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (85, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.33', '2019-04-23 13:33:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (86, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.33', '2019-04-23 13:34:06', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (87, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-04-23 13:43:26', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (88, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '172.18.21.255', '2019-04-23 13:48:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (89, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '172.18.21.255', '2019-04-23 13:50:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (90, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 2 || Total Crews 16 ]', 'SIN', 'KK', '172.18.21.255', '2019-04-23 13:52:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (91, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '172.18.21.255', '2019-04-23 13:54:42', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (92, 'Reservation', '123456', 'report reservation with flight number GA-822 successfully generated by <b>123456</b>', 'SIN', 'KK', '172.18.21.255', '2019-04-23 13:55:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (93, 'Reservation', '123456', 'Report reservation has been send to hotel management', 'SIN', 'KK', '172.18.21.255', '2019-04-23 13:55:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (94, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.33', '2019-04-23 13:58:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (95, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.33', '2019-04-23 13:59:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (96, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.33', '2019-04-23 14:00:33', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (97, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.33', '2019-04-23 14:10:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (98, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.33', '2019-04-23 14:12:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (99, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.33', '2019-04-23 14:17:44', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (100, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '172.18.60.33', '2019-04-23 14:18:48', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (101, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '172.18.21.255', '2019-04-23 14:20:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (102, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.21.255', '2019-04-23 14:21:08', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (103, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '172.18.21.255', '2019-04-23 14:21:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (104, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '172.18.21.255', '2019-04-23 14:21:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (105, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '172.18.21.255', '2019-04-23 14:22:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (106, 'Reservation', '666666', 'Generate report invoice PER periode 2019-04-23-2019-04-23 by <b>666666</b>', 'PER', 'AA', '172.18.21.255', '2019-04-23 14:23:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (107, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '172.18.21.255', '2019-04-23 14:23:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (108, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.33', '2019-04-23 14:23:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (109, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '172.18.60.33', '2019-04-23 14:24:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (110, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.202', '2019-04-24 09:10:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (111, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '::1', '2019-04-24 09:16:17', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (112, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '172.18.60.122', '2019-04-24 09:23:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (113, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.122', '2019-04-24 09:34:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (114, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-04-24 09:43:38', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (115, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '172.18.60.122', '2019-04-24 09:54:26', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (116, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.122', '2019-04-24 09:55:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (117, 'Flight Schedule', '333333', 'Flights with number GA-364 successfully booked by user with nopeg <b>333333</b> at the hotel RICH PALACE (SUB)', 'SUB', 'KK', '172.18.60.122', '2019-04-24 10:01:15', '2', 'gaazrdevproject', '364', '1');
INSERT INTO `acs_log_activity` VALUES (118, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '::1', '2019-04-24 10:51:01', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (119, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '172.18.60.56', '2019-04-24 11:53:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (120, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.56', '2019-04-24 11:54:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (121, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.56', '2019-04-24 11:56:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (122, 'Reservation', '333333', 'report reservation with flight number GA-364 successfully generated by <b>333333</b>', 'SUB', 'KK', '172.18.60.56', '2019-04-24 11:58:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (123, 'Reservation', '333333', 'Report reservation has been send to hotel management', 'SUB', 'KK', '172.18.60.56', '2019-04-24 11:59:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (124, 'Flight Schedule', '333333', 'Flights with number GA-310 successfully booked by user with nopeg <b>333333</b> at the hotel RICH PALACE (SUB)', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:00:56', '2', 'gaazrdevproject', '310', '1');
INSERT INTO `acs_log_activity` VALUES (125, 'Reservation', '333333', 'report reservation with flight number GA-310 successfully generated by <b>333333</b>', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:01:06', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (126, 'Reservation', '333333', 'Report reservation has been send to hotel management', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:01:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (127, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.56', '2019-04-24 12:01:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (128, 'Reservation', '444444', 'Generate report invoice SUB periode 2019-04-24-2019-04-24 by <b>444444</b>', 'SUB', 'AA', '172.18.60.56', '2019-04-24 12:03:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (129, 'Reservation', '444444', 'Invoice has been upload by  <b>444444</b>', 'SUB', 'AA', '172.18.60.56', '2019-04-24 12:03:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (130, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-04-24 12:04:59', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (131, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '::1', '2019-04-24 12:05:15', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (132, 'Compare', '333333', 'Invoice from <b>Hotel</b> with number <b>TFAN</b> has been claimed by <b>333333</b>. Email has been send to Hotel', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:14:16', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (133, 'Compare', '333333', 'Invoice from <b>Hotel</b> with number <b>TFAN</b> has been claimed by <b>333333</b>. Email has been send to Hotel', 'SUB', 'KK', '::1', '2019-04-24 12:24:46', '2', 'DESKTOP-M8KSV5J', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (134, 'Compare', '444444', 'File with comdat_id 7 has successfully updated! 444444', 'SUB', 'AA', '::1', '2019-04-24 12:31:11', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (135, 'Flight Schedule', '333333', 'User with nopeg <b>333333</b> successfully syncron crews RON data BO SUB [ Total Flihgt 20 || Total Crews 142 ]', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:37:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (136, 'Flight Schedule', '333333', 'Flights with number GA-364 successfully booked by user with nopeg <b>333333</b> at the hotel RICH PALACE (SUB)', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:42:36', '2', 'gaazrdevproject', '364', '1');
INSERT INTO `acs_log_activity` VALUES (137, 'Reservation', '333333', 'report reservation with flight number GA-364 successfully generated by <b>333333</b>', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:42:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (138, 'Reservation', '333333', 'Report reservation has been send to hotel management', 'SUB', 'KK', '172.18.60.56', '2019-04-24 12:42:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (139, 'Reservation', '444444', 'Generate report invoice SUB periode 2019-04-24-2019-04-24 by <b>444444</b>', 'SUB', 'AA', '172.18.60.56', '2019-04-24 12:43:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (140, 'Reservation', '444444', 'Invoice has been upload by  <b>444444</b>', 'SUB', 'AA', '172.18.60.56', '2019-04-24 12:43:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (141, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '::1', '2019-04-24 12:56:48', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (142, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '::1', '2019-04-24 13:13:25', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (143, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '172.18.60.56', '2019-04-24 13:19:10', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (144, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.56', '2019-04-24 13:25:08', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (145, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '172.18.60.56', '2019-04-24 13:25:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (146, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '172.18.60.56', '2019-04-24 13:25:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (147, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.56', '2019-04-24 13:25:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (148, 'Reservation', '666666', 'Generate report invoice PER periode 2019-04-24-2019-04-24 by <b>666666</b>', 'PER', 'AA', '172.18.60.56', '2019-04-24 13:26:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (149, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '172.18.60.56', '2019-04-24 13:26:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (150, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '172.18.60.56', '2019-04-24 13:26:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (151, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.56', '2019-04-24 13:27:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (152, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '172.18.60.56', '2019-04-24 13:34:28', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (153, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '172.18.60.56', '2019-04-24 13:36:58', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (154, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '172.18.60.56', '2019-04-24 13:59:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (155, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '172.18.61.12', '2019-04-24 14:40:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (156, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.61.12', '2019-04-24 14:41:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (157, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '172.18.61.12', '2019-04-24 14:43:53', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (158, 'Reservation', '123456', 'report reservation with flight number GA-822 successfully generated by <b>123456</b>', 'SIN', 'KK', '172.18.61.12', '2019-04-24 14:44:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (159, 'Reservation', '123456', 'Report reservation has been send to hotel management', 'SIN', 'KK', '172.18.61.12', '2019-04-24 14:44:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (160, 'Reservation', '123457', 'Generate report invoice SIN periode 2019-04-24-2019-04-24 by <b>123457</b>', 'SIN', 'AA', '172.18.61.12', '2019-04-24 14:45:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (161, 'Reservation', '123457', 'Invoice has been upload by  <b>123457</b>', 'SIN', 'AA', '172.18.61.12', '2019-04-24 14:45:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (162, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '192.168.111.123', '2019-04-24 15:01:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (163, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.123', '2019-04-24 15:03:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (164, 'Flight Schedule', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 28 ]', 'PDG', 'KK', '192.168.111.123', '2019-04-24 15:04:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (165, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.208', '2019-04-24 15:06:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (166, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '172.18.61.12', '2019-04-24 15:11:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (167, 'Flight Schedule', '777777', 'Flights with number GA-168 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.123', '2019-04-24 15:15:02', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (168, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.208', '2019-04-24 15:20:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (169, 'Flight Schedule', '777777', 'Flights with number GA-162 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.123', '2019-04-24 15:22:55', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (170, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-24 15:33:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (171, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.123', '2019-04-24 15:33:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (172, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-24 15:33:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (173, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.123', '2019-04-24 15:33:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (174, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-04-24-2019-04-24 by <b>888888</b>', 'PDG', 'AA', '192.168.111.123', '2019-04-25 08:52:26', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (175, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '192.168.111.123', '2019-04-25 08:52:26', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (176, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.123', '2019-04-25 09:00:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (177, 'Compare', '777777', 'Invoice from <b>HAS System</b> with number <b>pdg24apr2019</b> has been claimed with a list of flight numbers <b>162</b> by <b>777777</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-25 09:01:12', '2', 'gaazrdevproject', '162', '2');
INSERT INTO `acs_log_activity` VALUES (178, 'Claim', '777777', 'user with Nopeg <b>777777</b> has entered additional cost data on invoice number <b>pdg24apr2019</b> and flight number <b>162</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-25 09:02:00', '2', 'gaazrdevproject', '162', '3');
INSERT INTO `acs_log_activity` VALUES (179, 'Reservation', '777777', 'Generate report invoice PDG periode 2019-04-24-2019-04-24 by <b>777777</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-25 09:02:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (180, 'Compare', '777777', 'User with Nopeg <b>777777</b> has regenerate the invoice with number <b>pdg24apr2019</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-25 09:02:07', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (181, 'Compare', '777777', 'Invoice from <b>Hotel</b> with number <b>pdg24apr2019</b> has been claimed by <b>777777</b>. Email has been send to Hotel', 'PDG', 'KK', '192.168.111.123', '2019-04-25 09:05:02', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (182, 'Compare', '888888', 'File with comdat_id 11 has successfully updated! 888888', 'PDG', 'AA', '192.168.111.123', '2019-04-25 09:05:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (183, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.123', '2019-04-25 09:10:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (184, 'Flight Schedule', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER [ Total Flihgt 3 || Total Crews 26 ]', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:11:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (185, 'Flight Schedule', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER [ Total Flihgt 3 || Total Crews 26 ]', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:11:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (186, 'Flight Schedule', '555555', 'Flights with number GA-724 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:14:23', '2', 'gaazrdevproject', '724', '1');
INSERT INTO `acs_log_activity` VALUES (187, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:15:11', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (188, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:16:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (189, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:16:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (190, 'Reservation', '555555', 'report reservation with flight number GA-724 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:16:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (191, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:16:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (192, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.123', '2019-04-25 09:17:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (193, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.123', '2019-04-25 09:18:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (194, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.228', '2019-04-25 09:18:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (195, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:19:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (196, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.123', '2019-04-25 09:19:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (197, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.123', '2019-04-25 09:22:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (198, 'Reservation', '666666', 'Generate report invoice PER periode 2019-04-25-2019-04-25 by <b>666666</b>', 'PER', 'AA', '192.168.111.123', '2019-04-25 09:22:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (199, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '192.168.111.123', '2019-04-25 09:22:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (200, 'Compare', '555555', 'Invoice from <b>HAS System</b> with number <b>per25apr2019</b> has been claimed with a list of flight numbers <b>724</b> by <b>555555</b>', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:24:07', '2', 'gaazrdevproject', '724', '2');
INSERT INTO `acs_log_activity` VALUES (201, 'Claim', '555555', 'user with Nopeg <b>555555</b> has entered additional cost data on invoice number <b>per25apr2019</b> and flight number <b>724</b>', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:25:45', '2', 'gaazrdevproject', '724', '3');
INSERT INTO `acs_log_activity` VALUES (202, 'Reservation', '555555', 'Generate report invoice PER periode 2019-04-25-2019-04-25 by <b>555555</b>', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:25:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (203, 'Compare', '555555', 'User with Nopeg <b>555555</b> has regenerate the invoice with number <b>per25apr2019</b>', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:25:50', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (204, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.123', '2019-04-25 09:27:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (205, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.208', '2019-04-25 09:41:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (206, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 2 || Total Crews 16 ]', 'SIN', 'KK', '192.168.111.208', '2019-04-25 09:42:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (207, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '192.168.111.208', '2019-04-25 09:43:36', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (208, 'Reservation', '123456', 'report reservation with flight number GA-822 successfully generated by <b>123456</b>', 'SIN', 'KK', '192.168.111.208', '2019-04-25 09:44:48', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (209, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.208', '2019-04-25 09:49:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (210, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.208', '2019-04-25 09:52:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (211, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.208', '2019-04-25 09:53:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (212, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.208', '2019-04-25 09:55:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (213, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.208', '2019-04-25 09:59:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (214, 'Flight Schedule', '333333', 'User with nopeg <b>333333</b> successfully syncron crews RON data BO SUB [ Total Flihgt 15 || Total Crews 113 ]', 'SUB', 'KK', '192.168.111.208', '2019-04-25 10:00:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (215, 'Flight Schedule', '333333', 'Flights with number GA-328 successfully booked by user with nopeg <b>333333</b> at the hotel RICH PALACE (SUB)', 'SUB', 'KK', '192.168.111.208', '2019-04-25 10:01:29', '2', 'gaazrdevproject', '328', '1');
INSERT INTO `acs_log_activity` VALUES (216, 'Reservation', '333333', 'report reservation with flight number GA-328 successfully generated by <b>333333</b>', 'SUB', 'KK', '192.168.111.208', '2019-04-25 10:05:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (217, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.123', '2019-04-25 13:51:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (218, 'Flight Schedule', '777777', 'Flights with number GA-162 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:03:13', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (219, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:03:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (220, 'Flight Schedule', '777777', 'Flights with number GA-168 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:08:37', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (221, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:09:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (222, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:09:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (223, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:09:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (224, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-04-25-2019-04-25 by <b>888888</b>', 'PDG', 'AA', '192.168.111.123', '2019-04-25 14:24:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (225, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '192.168.111.123', '2019-04-25 14:24:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (226, 'Reservasi', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG with flight GA-168 [ Total Flight 1 || Total Crews 9 ]', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:33:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (227, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:38:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (228, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.123', '2019-04-25 14:47:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (229, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:49:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (230, 'Flight Schedule', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 30 ]', 'PDG', 'KK', '192.168.111.123', '2019-04-25 14:58:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (231, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.123', '2019-04-25 15:10:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (232, 'Flight Schedule', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 30 ]', 'PDG', 'KK', '192.168.111.123', '2019-04-25 15:12:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (233, 'Flight Schedule', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 30 ]', 'PDG', 'KK', '192.168.111.123', '2019-04-25 15:12:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (234, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.123', '2019-04-25 15:13:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (235, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.123', '2019-04-25 15:22:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (236, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.123', '2019-04-25 15:29:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (237, 'Reservation', '666666', 'Generate report invoice PER periode 2019-04-22-2019-04-22 by <b>666666</b>', 'PER', 'AA', '192.168.111.123', '2019-04-25 15:31:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (238, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '192.168.111.123', '2019-04-25 15:31:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (239, 'Compare', '555555', 'Invoice from <b>Hotel</b> with number <b>per22apr</b> has been claimed by <b>555555</b>. Email has been send to Hotel', 'PER', 'KK', '192.168.111.123', '2019-04-25 15:34:09', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (240, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.126', '2019-04-25 15:45:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (241, 'Compare', '666666', 'File with comdat_id 14 has successfully updated! 666666', 'PER', 'AA', '172.18.60.126', '2019-04-25 15:49:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (242, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '172.18.60.126', '2019-04-25 16:01:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (243, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.126', '2019-04-25 16:04:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (244, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.123', '2019-04-26 14:33:21', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (245, 'Login', '131313', 'User with nopeg <b>131313</b> successfully sign in to system', 'PNK', 'KK', '192.168.111.123', '2019-04-26 14:33:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (246, 'Flight Schedule', '131313', 'User with nopeg <b>131313</b> successfully syncron crews RON data BO PNK [ Total Flihgt 5 || Total Crews 15 ]', 'PNK', 'KK', '192.168.111.123', '2019-04-26 14:33:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (247, 'Login', '131313', 'User with nopeg <b>131313</b> successfully sign out from system', 'PNK', 'KK', '192.168.111.123', '2019-04-26 14:44:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (248, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.186', '2019-04-26 14:49:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (249, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.186', '2019-04-26 14:51:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (250, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.123', '2019-04-26 14:54:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (251, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.123', '2019-04-26 15:00:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (252, 'Flight Schedule', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER [ Total Flihgt 4 || Total Crews 33 ]', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:02:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (253, 'Flight Schedule', '555555', 'Flights with number GA-724 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:07:25', '2', 'gaazrdevproject', '724', '1');
INSERT INTO `acs_log_activity` VALUES (254, 'Reservation', '555555', 'report reservation with flight number GA-724 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:07:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (255, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:08:30', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (256, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:08:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (257, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:10:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (258, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:11:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (259, 'Reservation', '666666', 'Generate report invoice PER periode 2019-04-26-2019-04-28 by <b>666666</b>', 'PER', 'AA', '192.168.111.123', '2019-04-26 15:15:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (260, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '192.168.111.123', '2019-04-26 15:15:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (261, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:27:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (262, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.123', '2019-04-26 15:34:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (263, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.186', '2019-04-26 15:49:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (264, 'Compare', '555555', 'Invoice from <b>Hotel</b> with number <b>per2628</b> has been claimed by <b>555555</b>. Email has been send to Hotel', 'PER', 'KK', '192.168.111.123', '2019-04-26 15:57:48', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (265, 'Compare', '555555', 'Invoice from <b>Hotel</b> with number <b>per22apr</b> has been claimed by <b>555555</b>. Email has been send to Hotel', 'PER', 'KK', '192.168.111.123', '2019-04-26 16:08:19', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (266, 'Compare', '666666', 'File with comdat_id 15 has successfully updated! 666666', 'PER', 'AA', '192.168.111.123', '2019-04-26 16:09:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (267, 'Compare', '666666', 'File with comdat_id 15 has successfully updated! 666666', 'PER', 'AA', '192.168.111.123', '2019-04-26 16:09:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (268, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.123', '2019-04-26 16:30:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (269, 'Flight Schedule', '333333', 'Flights with number GA-326 successfully booked by user with nopeg <b>333333</b> at the hotel RICH PALACE (SUB)', 'SUB', 'KK', '192.168.111.123', '2019-04-26 16:31:13', '2', 'gaazrdevproject', '326', '1');
INSERT INTO `acs_log_activity` VALUES (270, 'Reservation', '333333', 'report reservation with flight number GA-326 successfully generated by <b>333333</b>', 'SUB', 'KK', '192.168.111.123', '2019-04-26 16:31:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (271, 'Reservation', '333333', 'Report reservation has been send to hotel management', 'SUB', 'KK', '192.168.111.123', '2019-04-26 16:31:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (272, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.123', '2019-04-26 16:31:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (273, 'Reservation', '444444', 'Generate report invoice SUB periode 2019-04-26-2019-04-26 by <b>444444</b>', 'SUB', 'AA', '192.168.111.123', '2019-04-26 16:32:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (274, 'Reservation', '444444', 'Invoice has been upload by  <b>444444</b>', 'SUB', 'AA', '192.168.111.123', '2019-04-26 16:32:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (275, 'Compare', '333333', 'Invoice from <b>Hotel</b> with number <b>sub26apr</b> has been claimed by <b>333333</b>. Email has been send to Hotel', 'SUB', 'KK', '192.168.111.123', '2019-04-26 16:33:24', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (276, 'Compare', '444444', 'File with comdat_id 16 has successfully updated! 444444', 'SUB', 'AA', '192.168.111.123', '2019-04-26 16:33:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (277, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '172.18.60.118', '2019-04-29 08:53:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (278, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 09:34:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (279, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:34:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (280, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:35:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (281, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.161', '2019-04-29 09:36:10', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (282, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:36:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (283, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', 'CGK', NULL, '192.168.111.161', '2019-04-29 09:36:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (284, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:37:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (285, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', 'CGK', NULL, '192.168.111.161', '2019-04-29 09:37:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (286, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:37:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (287, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', 'CGK', NULL, '192.168.111.161', '2019-04-29 09:37:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (288, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', 'CGK', NULL, '192.168.111.161', '2019-04-29 09:38:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (289, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:39:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (290, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:39:48', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (291, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', 'CGK', NULL, '192.168.111.165', '2019-04-29 09:41:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (292, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 09:44:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (293, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', 'CGK', NULL, '192.168.111.161', '2019-04-29 09:51:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (294, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.121', '2019-04-29 10:15:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (295, 'Login', '444444', 'User with nopeg <b>444444</b> successfully sign out from system', 'SUB', 'AA', '172.18.60.138', '2019-04-29 10:21:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (296, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.138', '2019-04-29 10:21:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (297, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.138', '2019-04-29 10:21:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (298, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.138', '2019-04-29 10:24:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (299, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', 'SUB', 'KK', '172.18.60.138', '2019-04-29 10:24:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (300, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '172.18.60.138', '2019-04-29 10:25:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (301, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '172.18.60.155', '2019-04-29 10:38:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (302, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.155', '2019-04-29 10:38:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (303, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 14:17:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (304, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 14:25:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (305, 'Login', '303030', 'User with nopeg <b>303030</b> successfully sign in to system', NULL, 'Admin', '192.168.111.165', '2019-04-29 14:25:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (306, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '192.168.111.161', '2019-04-29 14:28:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (307, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', 'CGK', 'Admin', '192.168.111.161', '2019-04-29 14:28:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (308, 'Login', '303030', 'User with nopeg <b>303030</b> successfully sign out from system', NULL, 'Admin', '192.168.111.165', '2019-04-29 14:28:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (309, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', 'CGK', 'Admin', '192.168.111.161', '2019-04-29 14:28:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (310, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', 'CGK', 'Admin', '192.168.111.165', '2019-04-29 14:28:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (311, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', 'CGK', 'Admin', '192.168.111.165', '2019-04-29 14:31:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (312, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 14:32:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (313, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', 'CGK', 'Admin', '192.168.111.161', '2019-04-29 14:32:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (314, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.138', '2019-04-29 14:39:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (315, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', 'CGK', 'Admin', '172.18.60.138', '2019-04-29 14:40:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (316, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 14:48:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (317, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', NULL, 'Admin', '192.168.111.165', '2019-04-29 14:49:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (318, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '172.18.60.138', '2019-04-29 14:49:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (319, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', NULL, 'Admin', '192.168.111.165', '2019-04-29 14:50:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (320, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 14:50:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (321, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.165', '2019-04-29 14:51:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (322, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', 'CGK', 'Admin', '192.168.111.161', '2019-04-29 14:51:21', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (323, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', NULL, 'Admin', '192.168.111.165', '2019-04-29 14:51:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (324, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', NULL, 'Admin', '192.168.111.165', '2019-04-29 14:53:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (325, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', NULL, 'Admin', '192.168.111.161', '2019-04-29 14:54:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (326, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.165', '2019-04-30 08:30:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (327, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:32:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (328, 'Flight Schedule', '555555', 'Flights with number GA-724 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:38:13', '2', 'gaazrdevproject', '724', '1');
INSERT INTO `acs_log_activity` VALUES (329, 'Flight Schedule', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER [ Total Flihgt 2 || Total Crews 11 ]', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:41:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (330, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:41:55', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (331, 'Reservation', '555555', 'report reservation with flight number GA-724 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:47:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (332, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:48:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (333, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:51:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (334, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.165', '2019-04-30 08:53:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (335, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.165', '2019-04-30 08:54:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (336, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.165', '2019-04-30 08:55:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (337, 'Reservation', '666666', 'Generate report invoice PER periode 2019-04-30-2019-05-02 by <b>666666</b>', 'PER', 'AA', '192.168.111.165', '2019-04-30 08:56:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (338, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '192.168.111.165', '2019-04-30 08:56:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (339, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '::1', '2019-04-30 11:26:52', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (340, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-04-30 11:27:46', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (341, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '::1', '2019-04-30 11:28:18', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (342, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.223', '2019-04-30 11:35:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (343, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.223', '2019-04-30 11:35:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (344, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '172.18.60.223', '2019-04-30 11:35:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (345, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.161', '2019-04-30 14:34:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (346, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '172.18.60.161', '2019-04-30 14:35:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (347, 'Flight Schedule', '000002', 'Flights with number GA-724 successfully booked by user with nopeg <b>000002</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:22:43', '2', 'gaazrdevproject', '724', '1');
INSERT INTO `acs_log_activity` VALUES (348, 'Flight Schedule', '000002', 'Flights with number GA-728 successfully booked by user with nopeg <b>000002</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:23:01', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (349, 'Reservation', '000002', 'report reservation with flight number GA-724 successfully generated by <b>000002</b>', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:23:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (350, 'Reservation', '000002', 'Report reservation has been send to hotel management', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:23:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (351, 'Reservation', '000002', 'report reservation with flight number GA-728 successfully generated by <b>000002</b>', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:23:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (352, 'Reservation', '000002', 'Report reservation has been send to hotel management', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:23:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (353, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.54', '2019-04-30 15:24:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (354, 'Login', '000003', 'User with nopeg <b>000003</b> successfully sign in to system', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:25:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (355, 'Login', '000003', 'User with nopeg <b>000003</b> successfully sign out from system', 'PER', 'KK', '172.18.60.54', '2019-04-30 15:25:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (356, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.54', '2019-04-30 15:25:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (357, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.54', '2019-04-30 15:25:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (358, 'Login', '000003', 'User with nopeg <b>000003</b> successfully sign in to system', 'PER', 'AA', '172.18.60.54', '2019-04-30 15:25:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (359, 'Reservation', '000003', 'Generate report invoice PER periode 2019-04-27-2019-04-27 by <b>000003</b>', 'PER', 'AA', '172.18.60.54', '2019-04-30 15:26:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (360, 'Reservation', '000003', 'Invoice has been upload by  <b>000003</b>', 'PER', 'AA', '172.18.60.54', '2019-04-30 15:26:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (361, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 09:21:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (362, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 09:25:50', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (363, 'Login', 'apa', 'User with nopeg <b>apa</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 09:32:51', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (364, 'Login', '000002', 'User with nopeg <b>000002</b> force offline by Admin', 'PER', 'Admin', NULL, '2019-05-02 09:39:12', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (365, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '172.18.60.186', '2019-05-02 09:39:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (366, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '172.18.60.186', '2019-05-02 09:39:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (367, 'Login', '777777', 'User with nopeg <b>777777</b> force offline by Admin', 'PDG', 'Admin', NULL, '2019-05-02 09:50:26', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (368, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 09:50:54', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (369, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '172.18.60.186', '2019-05-02 09:52:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (370, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:00:27', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (371, 'Login', '222222', 'User with nopeg <b>222222</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:01:27', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (372, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:04:04', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (373, 'Login', '222222', 'User with nopeg <b>222222</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:04:16', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (374, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:04:40', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (375, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:07:08', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (376, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.221', '2019-05-02 10:07:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (377, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 10:07:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (378, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '172.18.60.186', '2019-05-02 10:09:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (379, 'Login', '000002', 'User with nopeg <b>000002</b> force offline by Admin', 'PER', 'Admin', NULL, '2019-05-02 10:09:47', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (380, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '172.18.60.186', '2019-05-02 10:09:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (381, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '172.18.60.186', '2019-05-02 10:10:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (382, 'Login', '000002', 'User with nopeg <b>000002</b> force offline by Admin', 'PER', 'Admin', NULL, '2019-05-02 10:10:43', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (383, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 10:15:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (384, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:15:23', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (385, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 10:15:31', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (386, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 10:15:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (387, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 10:26:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (388, 'Login', '555555', 'User with nopeg <b>555555</b> force offline by Admin', 'PER', 'Admin', NULL, '2019-05-02 10:26:41', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (389, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.221', '2019-05-02 10:26:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (390, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.242', '2019-05-02 10:26:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (391, 'Login', '123456', 'User with nopeg <b>123456</b> force offline by Admin', 'SIN', 'Admin', NULL, '2019-05-02 10:26:57', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (392, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-02 10:27:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (393, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 4 || Total Crews 31 ]', 'SIN', 'KK', '192.168.111.221', '2019-05-02 10:28:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (394, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.242', '2019-05-02 10:28:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (395, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 10:28:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (396, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign in to system', 'SUB', 'KK', '192.168.111.242', '2019-05-02 10:36:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (397, 'Login', '333333', 'User with nopeg <b>333333</b> force offline by Admin', 'SUB', 'Admin', NULL, '2019-05-02 10:38:05', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (398, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 4 || Total Crews 31 ]', 'SIN', 'KK', '192.168.111.221', '2019-05-02 10:39:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (399, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 10:56:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (400, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '192.168.111.242', '2019-05-02 10:57:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (401, 'Flight Schedule', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG [ Total Flihgt 3 || Total Crews 24 ]', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:04:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (402, 'Flight Schedule', '777777', 'Flights with number GA-162 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:05:48', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (403, 'Flight Schedule', '777777', 'Flights with number GA-168 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:08:53', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (404, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:10:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (405, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:10:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (406, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:10:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (407, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:11:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (408, 'Reservasi', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG with flight GA-168 [ Total Flight 1 || Total Crews 11 ]', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:12:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (409, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:13:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (410, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.242', '2019-05-02 11:13:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (411, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign in to system', 'PDG', 'AA', '192.168.111.242', '2019-05-02 11:14:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (412, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-05-01-2019-05-03 by <b>888888</b>', 'PDG', 'AA', '192.168.111.242', '2019-05-02 11:15:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (413, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '192.168.111.242', '2019-05-02 11:15:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (414, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 13:21:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (415, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 14:03:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (416, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '172.18.60.186', '2019-05-02 14:03:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (417, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign out from system', 'PER', 'KK', '172.18.60.186', '2019-05-02 14:05:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (418, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 14:06:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (419, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 14:06:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (420, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign in to system', 'PER', 'KK', '172.18.60.186', '2019-05-02 14:07:21', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (421, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '192.168.111.242', '2019-05-02 14:31:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (422, 'Login', '532117', 'User with nopeg <b>532117</b> successfully sign in to system', NULL, 'Admin', '192.168.111.242', '2019-05-02 14:32:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (423, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.221', '2019-05-02 14:33:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (424, 'Login', '202020', 'User with nopeg <b>202020</b> force offline by Admin', NULL, NULL, NULL, '2019-05-02 14:33:44', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (425, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', NULL, 'Admin', '192.168.111.221', '2019-05-02 14:33:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (426, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '192.168.111.242', '2019-05-02 14:54:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (427, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 14:55:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (428, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 15:00:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (429, 'Login', '000002', 'User with nopeg <b>000002</b> successfully sign out from system', 'PER', 'KK', '172.18.60.186', '2019-05-02 15:02:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (430, 'Login', '000004', 'User with nopeg <b>000004</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:02:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (431, 'Compare', '000004', 'Invoice from <b>HAS System</b> with number <b>pdg1-3May</b> has been claimed with a list of flight numbers <b>162</b> by <b>000004</b>', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:04:38', '2', 'gaazrdevproject', '162', '2');
INSERT INTO `acs_log_activity` VALUES (432, 'Claim', '000004', 'Invoice with number <b>pdg1-3May</b> and Flight Number <b>162</b> has been rollback by <b>000004</b>', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:04:44', '2', 'gaazrdevproject', '162', '3');
INSERT INTO `acs_log_activity` VALUES (433, 'Reservation', '000004', 'Generate report invoice PDG periode 2019-05-01-2019-05-03 by <b>000004</b>', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:04:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (434, 'Compare', '000004', 'User with Nopeg <b>000004</b> has regenerate the invoice with number <b>pdg1-3May</b>', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:04:50', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (435, 'Compare', '000004', 'Invoice from <b>Hotel</b> with number <b>pdg1-3May</b> has been claimed by <b>000004</b>. Email has been send to Hotel', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:06:48', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (436, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 15:07:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (437, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:08:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (438, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:08:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (439, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 15:09:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (440, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 15:09:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (441, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 15:10:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (442, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 15:10:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (443, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.186', '2019-05-02 15:11:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (444, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:11:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (445, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign in to system', 'PDG', 'AA', '172.18.60.186', '2019-05-02 15:11:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (446, 'Login', '532117', 'User with nopeg <b>532117</b> successfully sign out from system', NULL, 'Admin', '192.168.111.242', '2019-05-02 15:11:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (447, 'Compare', '000005', 'File with comdat_id 19 has successfully updated! 000005', 'PDG', 'AA', '172.18.60.186', '2019-05-02 15:11:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (448, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:12:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (449, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 15:12:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (450, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.242', '2019-05-02 15:12:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (451, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign in to system', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:12:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (452, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.186', '2019-05-02 15:13:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (453, 'Login', '000004', 'User with nopeg <b>000004</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.186', '2019-05-02 15:13:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (454, 'Login', 'apa', 'User with nopeg <b>apa</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-02 15:13:26', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (455, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign in to system', 'PDG', 'AA', '::1', '2019-05-02 15:13:46', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (456, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:14:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (457, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign out from system', 'PDG', 'AA', '::1', '2019-05-02 15:15:13', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (458, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign in to system', 'PDG', 'AA', '172.18.60.186', '2019-05-02 15:15:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (459, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.186', '2019-05-02 15:16:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (460, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign in to system', 'PDG', 'AA', '::1', '2019-05-02 15:16:26', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (461, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign out from system', 'PDG', 'AA', '::1', '2019-05-02 15:16:34', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (462, 'Login', '000004', 'User with nopeg <b>000004</b> successfully sign in to system', 'PDG', 'KK', '::1', '2019-05-02 15:16:48', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (463, 'Compare', '777777', 'Invoice from <b>Hotel</b> with number <b>pdg1-3May</b> has been claimed by <b>777777</b>. Email has been send to Hotel', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:21:06', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (464, 'Compare', '888888', 'File with comdat_id 19 has successfully updated! 888888', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:21:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (465, 'Compare', '888888', 'Invoice from <b>HAS System</b> with number <b>pdg1-3May</b> has been claimed with a list of flight numbers <b>162</b> by <b>888888</b>', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:23:22', '2', 'gaazrdevproject', '162', '2');
INSERT INTO `acs_log_activity` VALUES (466, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:29:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (467, 'Login', '532117', 'User with nopeg <b>532117</b> successfully sign in to system', NULL, 'Admin', '192.168.111.242', '2019-05-02 15:29:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (468, 'Login', '000005', 'User with nopeg <b>000005</b> successfully sign in to system', 'PDG', 'AA', '172.18.60.119', '2019-05-02 15:39:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (469, 'Login', '000004', 'User with nopeg <b>000004</b> successfully sign out from system', 'PDG', 'KK', '::1', '2019-05-02 15:40:54', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (470, 'Login', '532117', 'User with nopeg <b>532117</b> successfully sign out from system', NULL, 'Admin', '192.168.111.242', '2019-05-02 15:41:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (471, 'Login', '000004', 'User with nopeg <b>000004</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.119', '2019-05-02 15:41:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (472, 'Compare', '000004', 'Invoice from <b>Hotel</b> with number <b>ddd</b> has been claimed by <b>000004</b>. Email has been send to Hotel', 'PDG', 'KK', '172.18.60.119', '2019-05-02 15:41:42', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (473, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign in to system', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:41:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (474, 'Compare', '888888', 'File with comdat_id 3 has successfully updated! 888888', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:42:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (475, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:45:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (476, 'Login', '532117', 'User with nopeg <b>532117</b> successfully sign in to system', NULL, 'Admin', '192.168.111.242', '2019-05-02 15:46:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (477, 'Claim', '777777', 'Invoice with number <b>pdg1-3May</b> and Flight Number <b>162</b> has been rollback by <b>777777</b>', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:51:20', '2', 'gaazrdevproject', '162', '3');
INSERT INTO `acs_log_activity` VALUES (478, 'Reservation', '777777', 'Generate report invoice PDG periode 2019-05-01-2019-05-03 by <b>777777</b>', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:51:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (479, 'Compare', '777777', 'User with Nopeg <b>777777</b> has regenerate the invoice with number <b>pdg1-3May</b>', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:51:28', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (480, 'Compare', '777777', 'Invoice from <b>Hotel</b> with number <b>pdg1-3May</b> has been claimed by <b>777777</b>. Email has been send to Hotel', 'PDG', 'KK', '192.168.111.242', '2019-05-02 15:52:30', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (481, 'Login', '532117', 'User with nopeg <b>532117</b> successfully sign out from system', NULL, 'Admin', '192.168.111.242', '2019-05-02 15:52:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (482, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign in to system', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:53:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (483, 'Compare', '888888', 'File with comdat_id 19 has successfully updated! 888888', 'PDG', 'AA', '192.168.111.242', '2019-05-02 15:53:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (484, 'Compare', '000004', 'Invoice from <b>Hotel</b> with number <b>ddd</b> has been claimed by <b>000004</b>. Email has been send to Hotel', 'PDG', 'KK', '172.18.60.119', '2019-05-02 15:57:27', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (485, 'Compare', '000005', 'File with comdat_id 3 has successfully updated! 000005', 'PDG', 'AA', '172.18.60.119', '2019-05-02 15:57:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (486, 'Compare', '000004', 'Invoice from <b>Hotel</b> with number <b>ddd</b> has been claimed by <b>000004</b>. Email has been send to Hotel', 'PDG', 'KK', '172.18.60.119', '2019-05-02 15:58:43', '2', 'gaazrdevproject', NULL, '2');
INSERT INTO `acs_log_activity` VALUES (487, 'Compare', '000005', 'File with comdat_id 3 has successfully updated! 000005', 'PDG', 'AA', '172.18.60.119', '2019-05-02 15:59:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (488, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '::1', '2019-05-02 16:01:45', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (489, 'Login', '000009', 'User with nopeg <b>000009</b> successfully sign in to system', NULL, 'Admin', '172.18.60.119', '2019-05-02 16:02:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (490, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.9', '2019-05-03 08:38:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (491, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 09:00:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (492, 'Login', 'apa', 'User with nopeg <b>apa</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.9', '2019-05-03 09:04:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (493, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.9', '2019-05-03 09:05:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (494, 'Login', '000009', 'User with nopeg <b>000009</b> force offline by Admin', NULL, NULL, NULL, '2019-05-03 09:05:58', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (495, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.9', '2019-05-03 09:06:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (496, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 09:09:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (497, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '192.168.111.221', '2019-05-03 09:10:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (498, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '192.168.111.48', '2019-05-03 09:11:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (499, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '192.168.111.221', '2019-05-03 09:17:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (500, 'Login', '249955', 'User with nopeg <b>249955</b> successfully sign in to system', NULL, 'Admin', '192.168.111.221', '2019-05-03 09:17:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (501, 'Login', '324995', 'User with nopeg <b>324995</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-03 09:20:05', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (502, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.48', '2019-05-03 09:24:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (503, 'Login', '249955', 'User with nopeg <b>249955</b> successfully sign out from system', NULL, 'Admin', '192.168.111.221', '2019-05-03 09:35:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (504, 'Login', '123456', 'User with nopeg <b>123456</b> force offline by Admin', 'SIN', 'Admin', NULL, '2019-05-03 09:35:51', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (505, 'Login', '123456', 'User with nopeg <b>123456</b> force offline by Admin', 'SIN', 'Admin', NULL, '2019-05-03 09:36:02', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (506, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 09:36:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (507, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 09:43:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (508, 'Reservasi', '777777', 'User with nopeg <b>777777</b> successfully syncron crews RON data BO PDG with flight GA-168 [ Total Flight 1 || Total Crews 11 ]', 'PDG', 'KK', '192.168.111.48', '2019-05-03 09:43:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (509, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.164', '2019-05-03 10:06:06', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (510, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.9', '2019-05-03 10:35:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (511, 'Login', '249955', 'User with nopeg <b>249955</b> successfully sign in to system', NULL, 'Admin', '172.18.60.9', '2019-05-03 10:35:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (512, 'Login', '324995', 'User with nopeg <b>324995</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-03 10:37:25', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (513, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.9', '2019-05-03 10:37:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (514, 'Login', '249955', 'User with nopeg <b>249955</b> successfully sign out from system', NULL, 'Admin', '172.18.60.9', '2019-05-03 10:46:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (515, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.9', '2019-05-03 10:46:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (516, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.9', '2019-05-03 10:51:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (517, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.9', '2019-05-03 10:52:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (518, 'Flight Schedule', '777777', 'Flights with number GA-400 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.48', '2019-05-03 10:56:25', '2', 'gaazrdevproject', '400', '1');
INSERT INTO `acs_log_activity` VALUES (519, 'Reservation', '777777', 'report reservation with flight number GA-400 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 11:00:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (520, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.48', '2019-05-03 11:04:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (521, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.9', '2019-05-03 11:11:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (522, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.9', '2019-05-03 11:11:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (523, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.167', '2019-05-03 14:28:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (524, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:30:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (525, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign in to system', 'PDG', 'AA', '192.168.111.48', '2019-05-03 14:33:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (526, 'Reservation', '888888', 'Generate report invoice PDG periode 2019-05-03-2019-05-03 by <b>888888</b>', 'PDG', 'AA', '192.168.111.48', '2019-05-03 14:34:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (527, 'Reservation', '888888', 'Invoice has been upload by  <b>888888</b>', 'PDG', 'AA', '192.168.111.48', '2019-05-03 14:34:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (528, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 14:34:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (529, 'Compare', '777777', 'Invoice from <b>HAS System</b> with number <b>ga400 irreg 3 may 2019</b> has been claimed with a list of flight numbers <b>400</b> by <b>777777</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:36:09', '2', 'gaazrdevproject', '400', '2');
INSERT INTO `acs_log_activity` VALUES (530, 'Claim', '777777', 'user with Nopeg <b>777777</b> has entered additional cost data on invoice number <b>ga400 irreg 3 may 2019</b> and flight number <b>400</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:36:40', '2', 'gaazrdevproject', '400', '3');
INSERT INTO `acs_log_activity` VALUES (531, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.167', '2019-05-03 14:40:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (532, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 14:41:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (533, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:41:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (534, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 4 || Total Crews 28 ]', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:43:06', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (535, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:43:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (536, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.167', '2019-05-03 14:44:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (537, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 14:44:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (538, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 14:44:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (539, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:44:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (540, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:45:48', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (541, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 14:45:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (542, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 14:46:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (543, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:47:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (544, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:48:11', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (545, 'Reservation', '123456', 'report reservation with flight number GA-822 successfully generated by <b>123456</b>', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:48:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (546, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:49:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (547, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign in to system', 'SIN', 'AA', '192.168.111.221', '2019-05-03 14:50:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (548, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.221', '2019-05-03 14:51:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (549, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:51:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (550, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 4 || Total Crews 28 ]', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:52:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (551, 'Flight Schedule', '777777', 'Flights with number GA-162 successfully booked by user with nopeg <b>777777</b> at the hotel hotel grand inna (PDG)', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:52:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (552, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.118', '2019-05-03 14:53:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (553, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:53:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (554, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.118', '2019-05-03 14:53:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (555, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign in to system', 'SIN', 'AA', '192.168.111.221', '2019-05-03 14:54:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (556, 'Reservation', '777777', 'Generate report invoice PDG periode 2019-05-03-2019-05-03 by <b>777777</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:54:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (557, 'Compare', '777777', 'User with Nopeg <b>777777</b> has regenerate the invoice with number <b>ga400 irreg 3 may 2019</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:54:13', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (558, 'Reservation', '123457', 'Generate report invoice SIN periode 2019-05-03-2019-05-03 by <b>123457</b>', 'SIN', 'AA', '192.168.111.221', '2019-05-03 14:54:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (559, 'Reservation', '123457', 'Invoice has been upload by  <b>123457</b>', 'SIN', 'AA', '192.168.111.221', '2019-05-03 14:54:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (560, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.221', '2019-05-03 14:55:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (561, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 14:55:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (562, 'Reservation', '777777', 'report reservation with flight number GA-162 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:58:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (563, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.48', '2019-05-03 14:59:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (564, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 15:01:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (565, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 15:01:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (566, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.221', '2019-05-03 15:02:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (567, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 15:02:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (568, 'Flight Schedule', '777777', 'Flights with number GA-168 successfully booked by user with nopeg <b>777777</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '192.168.111.48', '2019-05-03 15:03:53', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (569, 'Login', '888888', 'User with nopeg <b>888888</b> successfully sign out from system', 'PDG', 'AA', '192.168.111.48', '2019-05-03 15:04:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (570, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.118', '2019-05-03 15:05:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (571, 'Reservation', '777777', 'report reservation with flight number GA-168 successfully generated by <b>777777</b>', 'PDG', 'KK', '192.168.111.48', '2019-05-03 15:08:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (572, 'Reservation', '777777', 'Report reservation has been send to hotel management', 'PDG', 'KK', '192.168.111.48', '2019-05-03 15:10:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (573, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.48', '2019-05-03 15:11:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (574, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:11:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (575, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:15:11', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (576, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:16:18', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (577, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:16:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (578, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:17:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (579, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:18:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (580, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:19:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (581, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.48', '2019-05-03 15:20:01', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (582, 'Reservation', '666666', 'Generate report invoice PER periode 2019-05-02-2019-05-05 by <b>666666</b>', 'PER', 'AA', '192.168.111.48', '2019-05-03 15:20:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (583, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '192.168.111.48', '2019-05-03 15:20:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (584, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.48', '2019-05-03 15:31:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (585, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.221', '2019-05-03 15:39:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (586, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', NULL, 'Admin', '192.168.111.221', '2019-05-03 15:40:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (587, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.164', '2019-05-03 15:41:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (588, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.10', '2019-05-03 15:44:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (589, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:47:10', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (590, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.48', '2019-05-03 15:48:48', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (591, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', NULL, 'Admin', '192.168.111.221', '2019-05-03 15:51:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (592, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.48', '2019-05-03 15:56:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (593, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:57:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (594, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.10', '2019-05-03 15:58:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (595, 'Flight Schedule', '555555', 'Flights with number GA-110 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.48', '2019-05-03 15:59:31', '2', 'gaazrdevproject', '110', '1');
INSERT INTO `acs_log_activity` VALUES (596, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.48', '2019-05-03 16:00:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (597, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.48', '2019-05-03 16:00:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (598, 'Login', '045222', 'User with nopeg <b>045222</b> successfully sign in to system', 'PER', 'AA', '172.18.60.10', '2019-05-03 16:07:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (599, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.164', '2019-05-03 16:09:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (600, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.48', '2019-05-03 16:16:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (601, 'Login', '045222', 'User with nopeg <b>045222</b> successfully sign out from system', 'PER', 'AA', '172.18.60.10', '2019-05-03 16:18:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (602, 'Login', '202020', 'User with nopeg <b>202020</b> force offline by Admin', NULL, NULL, NULL, '2019-05-06 08:35:20', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (603, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', NULL, 'Admin', '192.168.111.115', '2019-05-06 08:35:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (604, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.102', '2019-05-06 08:39:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (605, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.102', '2019-05-06 08:53:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (606, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.102', '2019-05-06 08:56:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (607, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', NULL, 'Admin', '192.168.111.115', '2019-05-06 09:11:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (608, 'Flight Schedule', '046999', 'User with nopeg <b>046999</b> successfully syncron crews RON data BO PDG [ Total Flihgt 3 || Total Crews 26 ]', 'PDG', 'KK', '172.18.60.102', '2019-05-06 09:11:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (609, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.115', '2019-05-06 09:58:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (610, 'Flight Schedule', '046999', 'Flights with number GA-162 successfully booked by user with nopeg <b>046999</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '172.18.60.102', '2019-05-06 09:59:53', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (611, 'Reservation', '046999', 'report reservation with flight number GA-162 successfully generated by <b>046999</b>', 'PDG', 'KK', '172.18.60.102', '2019-05-06 10:00:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (612, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.115', '2019-05-06 10:20:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (613, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.76', '2019-05-06 10:30:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (614, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.76', '2019-05-06 10:33:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (615, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.76', '2019-05-06 10:56:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (616, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:11:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (617, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:11:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (618, 'Flight Schedule', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER [ Total Flihgt 2 || Total Crews 23 ]', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:16:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (619, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 4 || Total Crews 31 ]', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:16:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (620, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:20:20', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (621, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:20:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (622, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign in to system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:20:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (623, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:20:50', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (624, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:22:05', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (625, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:22:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (626, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:22:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (627, 'Reservation', '123456', 'report reservation with flight number GA-822 successfully generated by <b>123456</b>', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:24:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (628, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:24:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (629, 'Reservation', '123456', 'Report reservation has been send to hotel management', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:24:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (630, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:24:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (631, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign in to system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:25:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (632, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:25:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (633, 'Reservation', '123457', 'Generate report invoice SIN periode 2019-05-06-2019-05-06 by <b>123457</b>', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:26:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (634, 'Reservation', '123457', 'Invoice has been upload by  <b>123457</b>', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:26:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (635, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:26:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (636, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign in to system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:27:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (637, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:27:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (638, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 13:28:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (639, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:28:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (640, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.76', '2019-05-06 13:31:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (641, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.76', '2019-05-06 13:33:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (642, 'Login', '398999', 'User with nopeg <b>398999</b> successfully sign in to system', 'SIN', 'KK', '172.18.60.76', '2019-05-06 13:34:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (643, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.132', '2019-05-06 13:38:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (644, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 13:40:44', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (645, 'Compare', '398999', 'Invoice from <b>HAS System</b> with number <b>822SIN</b> has been claimed with a list of flight numbers <b>822</b> by <b>398999</b>', 'SIN', 'KK', '172.18.60.76', '2019-05-06 13:46:32', '2', 'gaazrdevproject', '822', '2');
INSERT INTO `acs_log_activity` VALUES (646, 'Claim', '398999', 'Invoice with number <b>822SIN</b> and Flight Number <b>822</b> has been rollback by <b>398999</b>', 'SIN', 'KK', '172.18.60.76', '2019-05-06 13:46:37', '2', 'gaazrdevproject', '822', '3');
INSERT INTO `acs_log_activity` VALUES (647, 'Reservation', '398999', 'Generate report invoice SIN periode 2019-05-06-2019-05-06 by <b>398999</b>', 'SIN', 'KK', '172.18.60.76', '2019-05-06 13:46:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (648, 'Compare', '398999', 'User with Nopeg <b>398999</b> has regenerate the invoice with number <b>822SIN</b>', 'SIN', 'KK', '172.18.60.76', '2019-05-06 13:46:42', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (650, 'Login', '398999', 'User with nopeg <b>398999</b> successfully sign out from system', 'SIN', 'KK', '172.18.60.76', '2019-05-06 13:55:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (651, 'Login', '398999', 'User with nopeg <b>398999</b> successfully sign in to system', 'SIN', 'KK', '::1', '2019-05-06 13:56:00', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (652, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:02:24', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (653, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 14:13:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (654, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 14:15:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (655, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign in to system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 14:15:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (656, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.115', '2019-05-06 14:15:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (657, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 14:16:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (658, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:18:43', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (659, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:19:02', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (660, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:19:59', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (661, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:20:14', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (662, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:26:14', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (663, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:27:09', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (664, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel dda (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:27:40', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (665, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel ASTON (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:29:43', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (666, 'Flight Schedule', '398999', 'Flights with number GA-832 successfully booked by user with nopeg <b>398999</b> at the hotel AAA (SIN)', 'SIN', 'KK', '::1', '2019-05-06 14:33:37', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (667, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.115', '2019-05-06 14:35:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (668, 'Login', '398999', 'User with nopeg <b>398999</b> successfully sign out from system', 'SIN', 'KK', '::1', '2019-05-06 15:01:52', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (669, 'Login', '555555', 'User with nopeg <b>555555</b> force offline by Admin', 'PER', 'Admin', NULL, '2019-05-07 07:35:34', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (670, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.132', '2019-05-07 07:35:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (671, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.132', '2019-05-07 07:36:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (672, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.132', '2019-05-07 07:42:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (673, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.132', '2019-05-07 07:43:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (674, 'Reservation', '666666', 'Generate report invoice PER periode 2019-05-05-2019-05-06 by <b>666666</b>', 'PER', 'AA', '192.168.111.132', '2019-05-07 07:46:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (675, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '192.168.111.132', '2019-05-07 07:46:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (676, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.132', '2019-05-07 07:46:26', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (677, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.132', '2019-05-07 07:46:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (678, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.132', '2019-05-07 08:13:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (679, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.132', '2019-05-07 08:18:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (680, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.132', '2019-05-07 08:20:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (681, 'Compare', '555555', 'Invoice from <b>HAS System</b> with number <b>per5-6Mei</b> has been claimed with a list of flight numbers <b>728</b> by <b>555555</b>', 'PER', 'KK', '192.168.111.132', '2019-05-07 08:20:42', '2', 'gaazrdevproject', '728', '2');
INSERT INTO `acs_log_activity` VALUES (682, 'Claim', '555555', 'Invoice with number <b>per5-6Mei</b> and Flight Number <b>728</b> has been rollback by <b>555555</b>', 'PER', 'KK', '192.168.111.132', '2019-05-07 08:20:51', '2', 'gaazrdevproject', '728', '3');
INSERT INTO `acs_log_activity` VALUES (683, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.132', '2019-05-07 08:31:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (684, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.132', '2019-05-07 08:41:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (685, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.141', '2019-05-07 09:16:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (686, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.141', '2019-05-07 09:42:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (687, 'Login', '046222', 'User with nopeg <b>046222</b> successfully sign in to system', 'PDG', 'AA', '172.18.60.141', '2019-05-07 09:47:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (688, 'Login', '046222', 'User with nopeg <b>046222</b> successfully sign out from system', 'PDG', 'AA', '172.18.60.141', '2019-05-07 09:59:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (689, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.141', '2019-05-07 10:07:43', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (690, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.141', '2019-05-07 10:18:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (691, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.141', '2019-05-07 10:20:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (692, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.141', '2019-05-07 10:35:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (693, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.190', '2019-05-09 09:16:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (694, 'Flight Schedule', '045999', 'Flights with number GA-728 successfully booked by user with nopeg <b>045999</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.190', '2019-05-09 09:25:06', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (695, 'Reservation', '045999', 'report reservation with flight number GA-728 successfully generated by <b>045999</b>', 'PER', 'KK', '172.18.60.190', '2019-05-09 09:27:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (696, 'Reservation', '045999', 'Report reservation has been send to hotel management', 'PER', 'KK', '172.18.60.190', '2019-05-09 09:27:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (697, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.190', '2019-05-09 09:35:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (698, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.30', '2019-05-09 09:39:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (699, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.30', '2019-05-09 09:51:48', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (700, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.30', '2019-05-09 10:00:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (701, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel mercure swanston (PER)', 'PER', 'KK', '192.168.111.30', '2019-05-09 10:10:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (702, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.190', '2019-05-09 10:17:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (703, 'Reservation', '045999', 'report reservation with flight number GA-728 successfully generated by <b>045999</b>', 'PER', 'KK', '172.18.60.190', '2019-05-09 10:20:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (704, 'Flight Schedule', '045999', 'Flights with number GA-728 successfully booked by user with nopeg <b>045999</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.190', '2019-05-09 10:22:01', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (705, 'Reservasi', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER with flight GA-728 [ Total Flight 1 || Total Crews 12 ]', 'PER', 'KK', '192.168.111.30', '2019-05-09 10:22:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (706, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.30', '2019-05-09 10:23:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (707, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.30', '2019-05-09 10:24:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (708, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel mercure swanston (PER)', 'PER', 'KK', '192.168.111.30', '2019-05-09 10:41:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (709, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.30', '2019-05-09 11:09:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (710, 'Flight Schedule', '045999', 'Flights with number GA-728 successfully booked by user with nopeg <b>045999</b> at the hotel MERCURE SWANSTON (PER)', 'PER', 'KK', '172.18.60.190', '2019-05-09 11:18:58', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (711, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.30', '2019-05-09 11:22:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (712, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel mercure swanston (PER)', 'PER', 'KK', '192.168.111.30', '2019-05-09 11:28:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (713, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE SWANSTON (PER)', 'PER', 'KK', '192.168.111.30', '2019-05-09 11:29:23', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (714, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.190', '2019-05-09 11:29:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (715, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.30', '2019-05-09 11:30:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (716, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.30', '2019-05-09 11:30:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (717, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.190', '2019-05-09 11:35:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (718, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.30', '2019-05-09 11:41:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (719, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.190', '2019-05-09 11:46:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (720, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.190', '2019-05-09 13:46:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (721, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.30', '2019-05-09 14:00:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (722, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:21:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (723, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:22:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (724, 'Flight Schedule', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER [ Total Flihgt 2 || Total Crews 24 ]', 'PER', 'KK', '192.168.111.30', '2019-05-09 14:25:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (725, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.30', '2019-05-09 14:26:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (726, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.30', '2019-05-09 14:26:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (727, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.30', '2019-05-09 14:27:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (728, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.30', '2019-05-09 14:27:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (729, 'Flight Schedule', '045999', 'Flights with number GA-728 successfully booked by user with nopeg <b>045999</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:28:16', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (730, 'Reservation', '045999', 'report reservation with flight number GA-728 successfully generated by <b>045999</b>', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:28:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (731, 'Reservation', '045999', 'Report reservation has been send to hotel management', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:29:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (732, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:29:28', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (733, 'Login', '045222', 'User with nopeg <b>045222</b> successfully sign in to system', 'PER', 'AA', '172.18.60.190', '2019-05-09 14:30:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (734, 'Reservation', '045222', 'Generate report invoice PER periode 2019-05-01-2019-05-01 by <b>045222</b>', 'PER', 'AA', '172.18.60.190', '2019-05-09 14:31:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (735, 'Reservation', '045222', 'Invoice has been upload by  <b>045222</b>', 'PER', 'AA', '172.18.60.190', '2019-05-09 14:31:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (736, 'Login', '045222', 'User with nopeg <b>045222</b> successfully sign out from system', 'PER', 'AA', '172.18.60.190', '2019-05-09 14:31:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (737, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:31:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (738, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.190', '2019-05-09 14:54:09', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (739, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.9', '2019-05-10 09:23:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (740, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.9', '2019-05-10 09:34:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (741, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.9', '2019-05-10 09:43:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (742, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.30', '2019-05-10 09:47:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (743, 'Flight Schedule', '045999', 'Flights with number GA-724 successfully booked by user with nopeg <b>045999</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.9', '2019-05-10 09:47:42', '2', 'gaazrdevproject', '724', '1');
INSERT INTO `acs_log_activity` VALUES (744, 'Reservation', '045999', 'report reservation with flight number GA-724 successfully generated by <b>045999</b>', 'PER', 'KK', '172.18.60.9', '2019-05-10 09:48:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (745, 'Login', '045222', 'User with nopeg <b>045222</b> successfully sign in to system', 'PER', 'AA', '172.18.60.9', '2019-05-10 09:49:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (746, 'Reservation', '045222', 'Generate report invoice PER periode 2019-05-04-2019-05-04 by <b>045222</b>', 'PER', 'AA', '172.18.60.9', '2019-05-10 09:50:21', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (747, 'Reservation', '045222', 'Invoice has been upload by  <b>045222</b>', 'PER', 'AA', '172.18.60.9', '2019-05-10 09:50:21', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (748, 'Login', '045222', 'User with nopeg <b>045222</b> successfully sign out from system', 'PER', 'AA', '172.18.60.9', '2019-05-10 09:50:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (749, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.9', '2019-05-10 10:02:07', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (750, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:07:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (751, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.9', '2019-05-10 10:15:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (752, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:24:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (753, 'Reservasi', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER with flight GA-728 [ Total Flight 1 || Total Crews 12 ]', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:24:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (754, 'Reservation', '555555', 'report reservation with flight number GA-724 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:25:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (755, 'Reservasi', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER with flight GA-724 [ Total Flight 1 || Total Crews 2 ]', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:25:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (756, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:29:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (757, 'Reservasi', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER with flight GA-728 [ Total Flight 1 || Total Crews 12 ]', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:29:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (758, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.9', '2019-05-10 10:29:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (759, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '172.18.60.9', '2019-05-10 10:33:45', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (760, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.30', '2019-05-10 10:43:03', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (761, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.30', '2019-05-10 13:58:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (762, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.30', '2019-05-10 13:58:52', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (763, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', NULL, 'Admin', '192.168.111.30', '2019-05-10 14:11:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (764, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', NULL, 'Admin', '192.168.111.30', '2019-05-10 14:24:26', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (765, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.89', '2019-05-14 08:57:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (766, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.89', '2019-05-14 09:22:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (767, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.89', '2019-05-14 09:43:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (768, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.89', '2019-05-14 09:58:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (769, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.199', '2019-05-20 09:46:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (770, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.199', '2019-05-20 09:57:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (771, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.199', '2019-05-20 10:15:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (772, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.199', '2019-05-20 11:25:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (773, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.199', '2019-05-20 11:25:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (774, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.199', '2019-05-20 11:40:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (775, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', NULL, 'Admin', '192.168.111.199', '2019-05-20 13:40:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (776, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign out from system', NULL, 'Admin', '192.168.111.199', '2019-05-20 14:03:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (777, 'Login', '101010', 'User with nopeg <b>101010</b> successfully sign in to system', NULL, 'Admin', '192.168.111.199', '2019-05-20 14:05:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (778, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.199', '2019-05-24 08:11:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (779, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.199', '2019-05-24 08:31:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (780, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.199', '2019-05-24 09:00:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (781, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.199', '2019-05-24 09:43:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (782, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.199', '2019-05-24 09:45:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (783, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.199', '2019-05-24 10:07:35', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (784, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.199', '2019-05-24 10:07:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (785, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.199', '2019-05-24 10:25:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (786, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.199', '2019-05-24 10:26:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (787, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.199', '2019-05-24 10:32:32', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (788, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.61.27', '2019-05-24 10:32:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (789, 'Login', '202020', 'User with nopeg <b>202020</b> force offline by Admin', NULL, NULL, NULL, '2019-05-24 10:38:12', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (790, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign in to system', NULL, 'Admin', '192.168.111.199', '2019-05-24 10:38:22', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (791, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.61.27', '2019-05-24 10:45:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (792, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.61.27', '2019-05-24 10:47:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (793, 'Login', '202020', 'User with nopeg <b>202020</b> successfully sign out from system', NULL, 'Admin', '192.168.111.199', '2019-05-24 10:54:29', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (794, 'Login', '249955', 'User with nopeg <b>249955</b> successfully sign in to system', NULL, 'Admin', '172.18.60.248', '2019-05-24 11:16:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (795, 'Login', '249955', 'User with nopeg <b>249955</b> successfully sign out from system', NULL, 'Admin', '172.18.60.248', '2019-05-24 11:16:26', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (796, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.61.27', '2019-05-24 11:16:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (797, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.248', '2019-05-24 11:16:58', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (798, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.248', '2019-05-24 11:35:23', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (799, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.85', '2019-05-24 13:35:46', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (800, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.85', '2019-05-24 13:40:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (801, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.85', '2019-05-24 13:42:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (802, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.85', '2019-05-24 13:50:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (803, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.55', '2019-05-24 13:50:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (804, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '172.18.60.55', '2019-05-24 14:00:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (805, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '::1', '2019-05-24 14:00:25', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (806, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '::1', '2019-05-24 14:01:26', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (807, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.60.55', '2019-05-24 14:49:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (808, 'Flight Schedule', '046999', 'User with nopeg <b>046999</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 28 ]', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:09:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (809, 'Flight Schedule', '046999', 'Flights with number GA-162 successfully booked by user with nopeg <b>046999</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:10:35', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (810, 'Flight Schedule', '046999', 'Flights with number GA-168 successfully booked by user with nopeg <b>046999</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:10:47', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (811, 'Flight Schedule', '046999', 'User with nopeg <b>046999</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 28 ]', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:12:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (812, 'Flight Schedule', '046999', 'Flights with number GA-162 successfully booked by user with nopeg <b>046999</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:13:00', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (813, 'Flight Schedule', '046999', 'Flights with number GA-168 successfully booked by user with nopeg <b>046999</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:13:13', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (814, 'Flight Schedule', '046999', 'Flights with number GA-162 successfully booked by user with nopeg <b>046999</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:13:27', '2', 'gaazrdevproject', '162', '1');
INSERT INTO `acs_log_activity` VALUES (815, 'Flight Schedule', '046999', 'Flights with number GA-168 successfully booked by user with nopeg <b>046999</b> at the hotel MERCURE (PDG)', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:13:39', '2', 'gaazrdevproject', '168', '1');
INSERT INTO `acs_log_activity` VALUES (816, 'Flight Schedule', '046999', 'User with nopeg <b>046999</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 29 ]', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:16:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (817, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.42', '2019-05-24 15:26:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (818, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '172.18.60.42', '2019-05-24 15:27:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (819, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.142', '2019-05-27 08:21:36', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (820, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.142', '2019-05-27 08:31:10', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (821, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.142', '2019-05-27 08:44:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (822, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.142', '2019-05-27 08:46:49', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (823, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.142', '2019-05-27 08:47:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (824, 'Flight Schedule', '555555', 'User with nopeg <b>555555</b> successfully syncron crews RON data BO PER [ Total Flihgt 2 || Total Crews 24 ]', 'PER', 'KK', '192.168.111.142', '2019-05-27 08:47:24', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (825, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.112', '2019-05-27 09:00:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (826, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:09:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (827, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:11:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (828, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.66', '2019-05-27 09:22:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (829, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.112', '2019-05-27 09:23:06', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (830, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:23:57', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (831, 'Login', NULL, 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '192.168.111.142', '2019-05-27 09:24:02', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (832, 'Flight Schedule', '045999', 'Flights with number GA-728 successfully booked by user with nopeg <b>045999</b> at the hotel MERCURE (PER)', 'PER', 'KK', '172.18.60.93', '2019-05-27 09:40:56', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (833, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:43:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (834, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:43:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (835, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:45:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (836, 'Flight Schedule', '555555', 'Flights with number GA-728 successfully booked by user with nopeg <b>555555</b> at the hotel MERCURE (PER)', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:46:30', '2', 'gaazrdevproject', '728', '1');
INSERT INTO `acs_log_activity` VALUES (837, 'Reservation', '555555', 'report reservation with flight number GA-728 successfully generated by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:46:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (838, 'Reservation', '555555', 'Report reservation has been send to hotel management', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:46:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (839, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:46:59', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (840, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign in to system', 'PER', 'AA', '192.168.111.142', '2019-05-27 09:47:15', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (841, 'Reservation', '666666', 'Generate report invoice PER periode 2019-05-26-2019-05-27 by <b>666666</b>', 'PER', 'AA', '192.168.111.142', '2019-05-27 09:48:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (842, 'Reservation', '666666', 'Invoice has been upload by  <b>666666</b>', 'PER', 'AA', '192.168.111.142', '2019-05-27 09:48:08', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (843, 'Login', '666666', 'User with nopeg <b>666666</b> successfully sign out from system', 'PER', 'AA', '192.168.111.142', '2019-05-27 09:48:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (844, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:48:27', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (845, 'Compare', '555555', 'Invoice from <b>HAS System</b> with number <b>26-27Mei2019</b> has been claimed with a list of flight numbers <b>728</b> by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:49:11', '2', 'gaazrdevproject', '728', '2');
INSERT INTO `acs_log_activity` VALUES (846, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.93', '2019-05-27 09:53:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (847, 'Claim', '555555', 'Invoice with number <b>26-27Mei2019</b> and Flight Number <b>728</b> has been rollback by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:53:42', '2', 'gaazrdevproject', '728', '3');
INSERT INTO `acs_log_activity` VALUES (848, 'Reservation', '555555', 'Generate report invoice PER periode 2019-05-26-2019-05-27 by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:55:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (849, 'Compare', '555555', 'User with Nopeg <b>555555</b> has regenerate the invoice with number <b>26-27Mei2019</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:55:20', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (850, 'Compare', '555555', 'Invoice from <b>HAS System</b> with number <b>26-27Mei2019</b> has been claimed with a list of flight numbers <b>728</b> by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 09:56:12', '2', 'gaazrdevproject', '728', '2');
INSERT INTO `acs_log_activity` VALUES (851, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.142', '2019-05-27 10:12:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (852, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.93', '2019-05-27 10:22:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (853, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.166', '2019-05-27 10:38:16', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (854, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.142', '2019-05-27 10:40:40', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (855, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign in to system', 'PER', 'KK', '172.18.60.166', '2019-05-27 10:43:12', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (856, 'Claim', '555555', 'Invoice with number <b>26-27Mei2019</b> and Flight Number <b>728</b> has been rollback by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 10:44:33', '2', 'gaazrdevproject', '728', '3');
INSERT INTO `acs_log_activity` VALUES (857, 'Reservation', '555555', 'Generate report invoice PER periode 2019-05-26-2019-05-27 by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 10:44:47', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (858, 'Compare', '555555', 'User with Nopeg <b>555555</b> has regenerate the invoice with number <b>26-27Mei2019</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 10:44:47', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (859, 'Compare', '555555', 'Invoice from <b>HAS System</b> with number <b>26-27Mei2019</b> has been claimed with a list of flight numbers <b>728 and 728</b> by <b>555555</b>', 'PER', 'KK', '192.168.111.142', '2019-05-27 10:45:14', '2', 'gaazrdevproject', '728 and 728', '2');
INSERT INTO `acs_log_activity` VALUES (860, 'Login', '045999', 'User with nopeg <b>045999</b> successfully sign out from system', 'PER', 'KK', '172.18.60.166', '2019-05-27 11:12:33', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (861, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.142', '2019-05-27 11:16:18', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (862, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '172.18.60.247', '2019-05-27 11:21:04', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (863, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.112', '2019-05-27 13:33:38', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (864, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign in to system', 'PDG', 'KK', '192.168.111.142', '2019-05-27 13:35:11', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (865, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.61.42', '2019-05-27 13:38:41', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (866, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.112', '2019-05-27 13:42:42', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (867, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.112', '2019-05-27 13:42:56', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (868, 'Flight Schedule', '123456', 'User with nopeg <b>123456</b> successfully syncron crews RON data BO SIN [ Total Flihgt 4 || Total Crews 30 ]', 'SIN', 'KK', '192.168.111.112', '2019-05-27 13:45:50', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (869, 'Flight Schedule', '123456', 'Flights with number GA-822 successfully booked by user with nopeg <b>123456</b> at the hotel GRAND MERCURE (SIN)', 'SIN', 'KK', '192.168.111.112', '2019-05-27 13:47:50', '2', 'gaazrdevproject', '822', '1');
INSERT INTO `acs_log_activity` VALUES (870, 'Reservation', '123456', 'report reservation with flight number GA-822 successfully generated by <b>123456</b>', 'SIN', 'KK', '192.168.111.112', '2019-05-27 13:48:39', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (871, 'Reservation', '123456', 'Report reservation has been send to hotel management', 'SIN', 'KK', '192.168.111.112', '2019-05-27 13:49:06', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (872, 'Login', '777777', 'User with nopeg <b>777777</b> successfully sign out from system', 'PDG', 'KK', '192.168.111.142', '2019-05-27 13:49:31', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (873, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.142', '2019-05-27 13:49:48', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (874, 'Flight Schedule', '046999', 'User with nopeg <b>046999</b> successfully syncron crews RON data BO PDG [ Total Flihgt 4 || Total Crews 33 ]', 'PDG', 'KK', '172.18.61.42', '2019-05-27 13:55:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (875, 'Flight Schedule', '046999', 'User with nopeg <b>046999</b> successfully syncron crews RON data BO PDG [ Total Flihgt 1 || Total Crews 7 ]', 'PDG', 'KK', '172.18.61.42', '2019-05-27 13:56:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (876, 'Flight Schedule', '046999', 'User with nopeg <b>046999</b> successfully syncron crews RON data BO PDG [ Total Flihgt 3 || Total Crews 21 ]', 'PDG', 'KK', '172.18.61.42', '2019-05-27 13:57:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (877, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.61.42', '2019-05-27 14:12:21', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (878, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.142', '2019-05-27 14:23:25', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (879, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.112', '2019-05-27 14:23:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (880, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign in to system', 'SIN', 'KK', '192.168.111.112', '2019-05-28 08:08:05', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (881, 'Login', '111111', 'User with nopeg <b>111111</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-05-28 08:08:53', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (882, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.164', '2019-05-28 08:12:34', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (883, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.164', '2019-05-28 08:13:19', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (884, 'Login', '123456', 'User with nopeg <b>123456</b> successfully sign out from system', 'SIN', 'KK', '192.168.111.112', '2019-05-28 08:13:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (885, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign in to system', 'SIN', 'AA', '192.168.111.112', '2019-05-28 08:13:51', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (886, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.164', '2019-05-28 08:13:54', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (887, 'Login', '123457', 'User with nopeg <b>123457</b> successfully sign out from system', 'SIN', 'AA', '192.168.111.112', '2019-05-28 08:14:13', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (888, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.112', '2019-05-28 08:14:21', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (889, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.164', '2019-05-28 08:16:17', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (890, 'Login', '222222', 'User with nopeg <b>222222</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.112', '2019-05-28 08:37:20', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (891, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign in to system', NULL, 'Superadmin', '192.168.111.164', '2019-05-28 08:42:10', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (892, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '192.168.111.164', '2019-05-28 08:46:37', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (893, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign in to system', 'PER', 'KK', '192.168.111.164', '2019-05-28 08:46:53', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (894, 'Claim', '555555', 'Invoice with number <b>26-27Mei2019</b> and Flight Number <b>728</b> has been rollback by <b>555555</b>', 'PER', 'KK', '192.168.111.164', '2019-05-28 08:48:52', '2', 'gaazrdevproject', '728', '3');
INSERT INTO `acs_log_activity` VALUES (895, 'Claim', '555555', 'Invoice with number <b>26-27Mei2019</b> and Flight Number <b>728</b> has been rollback by <b>555555</b>', 'PER', 'KK', '192.168.111.164', '2019-05-28 08:48:56', '2', 'gaazrdevproject', '728', '3');
INSERT INTO `acs_log_activity` VALUES (896, 'Reservation', '555555', 'Generate report invoice PER periode 2019-05-26-2019-05-27 by <b>555555</b>', 'PER', 'KK', '192.168.111.164', '2019-05-28 08:49:14', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (897, 'Compare', '555555', 'User with Nopeg <b>555555</b> has regenerate the invoice with number <b>26-27Mei2019</b>', 'PER', 'KK', '192.168.111.164', '2019-05-28 08:49:15', '2', 'gaazrdevproject', NULL, '3');
INSERT INTO `acs_log_activity` VALUES (898, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign in to system', 'PDG', 'KK', '172.18.61.28', '2019-05-28 08:58:30', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (899, 'Login', '555555', 'User with nopeg <b>555555</b> successfully sign out from system', 'PER', 'KK', '192.168.111.164', '2019-05-28 09:00:55', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (900, 'Login', '046999', 'User with nopeg <b>046999</b> successfully sign out from system', 'PDG', 'KK', '172.18.60.148', '2019-05-28 09:53:00', '1', 'gaazrdevproject', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (901, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '::1', '2019-05-29 14:14:44', '1', 'KANADE-PC', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (902, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-05-29 15:36:26', '1', 'KANADE-PC', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (903, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign in to system', NULL, 'Superadmin', '::1', '2019-05-29 15:48:54', '1', 'KANADE-PC', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (904, 'Login', '324995', 'User with nopeg <b>324995</b> force offline by Admin', NULL, 'Superadmin', NULL, '2019-06-19 13:31:20', NULL, NULL, NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (905, 'Login', NULL, 'User with nopeg <b></b> successfully sign in to system', NULL, NULL, '::1', '2019-06-20 14:54:03', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (906, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-06-20 15:13:36', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (907, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-06-21 09:39:57', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (908, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-06-22 09:22:50', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (909, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-06-22 09:23:39', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (910, 'Login', '324995', 'User with nopeg <b>324995</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-06-28 14:42:07', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (911, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-07-11 14:22:16', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (912, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-07-14 17:28:53', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (913, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-07-14 17:49:02', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (914, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-07-14 17:59:48', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (915, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-07-14 18:00:20', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (916, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-07-17 13:43:30', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (917, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, 'Superadmin', '::1', '2019-07-17 14:20:27', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (918, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', NULL, NULL, '::1', '2019-07-17 14:35:45', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (919, 'Login', '-', 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '::1', '2019-07-17 14:36:45', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (920, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, NULL, '::1', '2019-07-17 14:39:42', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (921, 'Login', '-', 'User with nopeg <b></b> successfully sign out from system', NULL, NULL, '::1', '2019-07-17 14:40:21', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (922, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, NULL, '::1', '2019-07-17 14:41:02', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (923, 'Login', '-', 'User with nopeg <b></b> successfully sign out from system', NULL, '-', '::1', '2019-07-17 14:45:25', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (924, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-17 14:46:40', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (925, 'Login', '333333', 'User with nopeg <b>333333</b> successfully sign out from system', NULL, '8', '::1', '2019-07-17 14:47:20', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (926, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-17 15:12:55', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (927, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-19 11:19:24', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (928, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-19 13:54:22', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (929, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-19 14:09:03', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (930, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-22 14:01:13', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (931, 'Login', '111111', 'User with nopeg <b></b> successfully sign out from system', NULL, '1', '::1', '2019-07-22 14:24:08', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (932, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-22 14:35:26', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (933, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-23 10:29:32', '1', 'DESKTOP-M8KSV5J', NULL, NULL);
INSERT INTO `acs_log_activity` VALUES (934, 'Login', '111111', 'User with nopeg <b>111111</b> successfully sign out from system', NULL, '1', '::1', '2019-07-24 11:01:03', '1', 'DESKTOP-M8KSV5J', NULL, NULL);

-- ----------------------------
-- Table structure for acs_log_loginx
-- ----------------------------
DROP TABLE IF EXISTS `acs_log_loginx`;
CREATE TABLE `acs_log_loginx`  (
  `logattmps_id` int(11) NOT NULL AUTO_INCREMENT,
  `logattmps_username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logattmps_ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logattmps_device` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `logattmps_createddate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logattmps_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_log_loginx
-- ----------------------------
INSERT INTO `acs_log_loginx` VALUES (13, '222222', '192.168.111.208', 'gaazrdevproject', '2019-04-24 08:56:36');
INSERT INTO `acs_log_loginx` VALUES (14, '222222', '192.168.111.208', 'gaazrdevproject', '2019-04-24 08:57:20');
INSERT INTO `acs_log_loginx` VALUES (15, '222222', '192.168.111.208', 'gaazrdevproject', '2019-04-24 09:01:23');
INSERT INTO `acs_log_loginx` VALUES (30, '555555', '172.18.60.223', 'gaazrdevproject', '2019-04-30 11:18:28');
INSERT INTO `acs_log_loginx` VALUES (31, '555555', '172.18.60.223', 'gaazrdevproject', '2019-04-30 11:21:39');
INSERT INTO `acs_log_loginx` VALUES (32, '555555', '::1', 'DESKTOP-M8KSV5J', '2019-04-30 11:26:19');
INSERT INTO `acs_log_loginx` VALUES (57, '046999', '192.168.111.221', 'gaazrdevproject', '2019-05-03 09:09:58');
INSERT INTO `acs_log_loginx` VALUES (59, '324995', '::1', 'DESKTOP-A8GN4K0', '2019-06-19 14:47:41');
INSERT INTO `acs_log_loginx` VALUES (60, '324995', '::1', 'DESKTOP-A8GN4K0', '2019-06-19 14:48:36');
INSERT INTO `acs_log_loginx` VALUES (61, '333333', '::1', 'DESKTOP-M8KSV5J', '2019-07-17 14:22:47');

-- ----------------------------
-- Table structure for acs_login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `acs_login_attempts`;
CREATE TABLE `acs_login_attempts`  (
  `logatt_id` int(11) NOT NULL AUTO_INCREMENT,
  `logatt_ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logatt_login` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logatt_waktu` int(11) DEFAULT NULL,
  PRIMARY KEY (`logatt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for acs_menu
-- ----------------------------
DROP TABLE IF EXISTS `acs_menu`;
CREATE TABLE `acs_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_parent` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `menu_nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `menu_link` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `menu_icon` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_status` enum('0','1','99') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '0=off,1=on,99=trash',
  `menu_createdby` int(255) DEFAULT NULL,
  `menu_createddate` datetime(0) DEFAULT NULL,
  `menu_udpatedby` int(255) DEFAULT NULL,
  `menu_lastupdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `menu_ip` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_menu
-- ----------------------------
INSERT INTO `acs_menu` VALUES (1, NULL, 'Dashboard', 'dashboard', 'line-graph', 0, '1', 27, '2019-07-17 09:47:47', 27, '2019-07-17 09:47:47', '::1');
INSERT INTO `acs_menu` VALUES (4, NULL, 'Data Master', NULL, 'interface-2', 1, '1', 27, '2019-07-17 09:48:05', 27, '2019-07-17 09:48:05', '::1');
INSERT INTO `acs_menu` VALUES (21, '4', 'User Management', 'user', 'user-settings', 0, '1', 27, '2019-07-17 09:50:43', 27, '2019-07-17 09:50:43', '::1');
INSERT INTO `acs_menu` VALUES (28, '4', 'Role', 'role', 'user-settings', 1, '1', 27, '2019-07-17 14:56:03', 27, '2019-07-17 14:56:03', '::1');
INSERT INTO `acs_menu` VALUES (29, '4', 'Menu', 'menu', 'share', 3, '1', 27, '2019-07-17 14:56:11', 27, '2019-07-17 14:56:11', '::1');
INSERT INTO `acs_menu` VALUES (30, '4', 'Icon', 'icon', 'share', 2, '1', 27, '2019-07-17 14:56:15', 27, '2019-07-17 14:56:15', '::1');

-- ----------------------------
-- Table structure for acs_pesawat
-- ----------------------------
DROP TABLE IF EXISTS `acs_pesawat`;
CREATE TABLE `acs_pesawat`  (
  `pesawat_id` int(11) NOT NULL,
  `pesawat_ac_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pesawat_glp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pesawat_sheet` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`pesawat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for acs_role
-- ----------------------------
DROP TABLE IF EXISTS `acs_role`;
CREATE TABLE `acs_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `role_deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `role_status` enum('0','1','99') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '0=off,1=on,99=trash',
  `role_createdby` int(11) DEFAULT NULL,
  `role_createddate` datetime(0) DEFAULT NULL,
  `role_updatedby` int(11) DEFAULT NULL,
  `role_lastupdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_ip` char(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_role
-- ----------------------------
INSERT INTO `acs_role` VALUES (1, 'Superadmin', 'Ini role superadmin', '1', NULL, NULL, 27, '2019-07-16 09:12:29', '::1');

-- ----------------------------
-- Table structure for acs_user
-- ----------------------------
DROP TABLE IF EXISTS `acs_user`;
CREATE TABLE `acs_user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_role_id` int(11) DEFAULT NULL,
  `user_nopeg` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_password` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `user_salt` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_status` enum('0','1','99') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  `user_avatar` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `user_last_login` int(11) DEFAULT NULL,
  `user_activate_code` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_forgotpass_code` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_remember_code` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_forgotpass_time` int(11) DEFAULT NULL,
  `user_ip_temp` char(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_createdby` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_createddate` datetime(0) DEFAULT NULL,
  `user_updatedby` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_lastupdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `del_child_role_user`(`user_role_id`) USING BTREE,
  CONSTRAINT `acs_user_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `acs_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acs_user
-- ----------------------------
INSERT INTO `acs_user` VALUES (27, 1, '111111', 'Irwan Jimkeri', 'jimkeri@mail.com', '$2y$07$cCMZyobS6ss2zEMZsltQL.hetYcKRD2gybDRaqSg5njZsUxTOCaG6', 'EXtNncR12m6WGr0h8ZpXGe', '1', NULL, 1563934153, NULL, NULL, NULL, NULL, '::1', '324995', '2019-06-21 09:39:44', '111111', '2019-06-21 09:39:44');
INSERT INTO `acs_user` VALUES (29, 1, '918273', 'Wirahadi', 'wirahadi@mail.com', '$2y$07$zLkzku0fcS01VUzcewN91u6uYcOcbGs3yzyR2S.fZ4MEkfLFbn3IS', '5MbIQGOnE6WUOdFuXDG00u', '1', NULL, NULL, NULL, NULL, NULL, NULL, '::1', '111111', '2019-07-12 16:40:38', '111111', '2019-07-12 16:40:38');
INSERT INTO `acs_user` VALUES (30, 1, '123456', 'a', 'a@m.com', '$2y$07$Hz2lmZrKHYah.ywA.0qllON01o3fr.OlJHC6pAYLa2KLlszu/2WRe', 'FzJM2v57826jx2hBzX/Zm.', '1', NULL, NULL, NULL, NULL, NULL, NULL, '::1', '111111', '2019-07-23 14:53:30', '111111', '2019-07-23 14:53:30');

SET FOREIGN_KEY_CHECKS = 1;
