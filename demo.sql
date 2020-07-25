/*
 Navicat Premium Data Transfer

 Source Server         : centos
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost
 Source Database       : demo

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : utf-8

 Date: 04/23/2019 11:30:30 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_menu`
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Index', 'fa-bar-chart', 'dashboard', null, null, '2019-04-18 14:25:30'), ('2', '0', '2', 'Admin', 'fa-tasks', '', null, null, null), ('3', '2', '3', 'Users', 'fa-users', 'auth/users', null, null, null), ('4', '2', '4', 'Roles', 'fa-user', 'auth/roles', null, null, null), ('5', '2', '5', 'Permission', 'fa-ban', 'auth/permissions', null, null, null), ('6', '2', '6', 'Menu', 'fa-bars', 'auth/menu', null, null, null), ('7', '2', '7', 'Operation log', 'fa-history', 'auth/logs', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `admin_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_operation_log`
-- ----------------------------
BEGIN;
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:06:54', '2019-04-18 14:06:54'), ('2', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:07:08', '2019-04-18 14:07:08'), ('3', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:07:12', '2019-04-18 14:07:12'), ('4', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:07:16', '2019-04-18 14:07:16'), ('5', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:15:10', '2019-04-18 14:15:10'), ('6', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:15:55', '2019-04-18 14:15:55'), ('7', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:15:58', '2019-04-18 14:15:58'), ('8', '1', 'admin/auth/setting', 'PUT', '192.168.242.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$MCMh0Nf\\/ss2Gj79G\\/KtaYOPNeuz8ZCF5vPb2.ZjxhAJ6Sj3FfDq1O\",\"password_confirmation\":\"$2y$10$MCMh0Nf\\/ss2Gj79G\\/KtaYOPNeuz8ZCF5vPb2.ZjxhAJ6Sj3FfDq1O\",\"_token\":\"XOnigKF9USe0FHh1sAc6kYTS3JAd16AHtohQudPO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/demo.me\\/admin\\/auth\\/login\"}', '2019-04-18 14:16:08', '2019-04-18 14:16:08'), ('9', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:16:08', '2019-04-18 14:16:08'), ('10', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:16:13', '2019-04-18 14:16:13'), ('11', '1', 'admin/auth/setting', 'GET', '192.168.242.1', '[]', '2019-04-18 14:16:46', '2019-04-18 14:16:46'), ('12', '1', 'admin', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:16:49', '2019-04-18 14:16:49'), ('13', '1', 'admin/auth/users', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:16:52', '2019-04-18 14:16:52'), ('14', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:26:35', '2019-04-18 14:26:35'), ('15', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:26:38', '2019-04-18 14:26:38'), ('16', '1', 'admin/auth/users', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:26:44', '2019-04-18 14:26:44'), ('17', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:27:56', '2019-04-18 14:27:56'), ('18', '1', 'admin', 'GET', '192.168.242.1', '{\"_pjax\":\"#pjax-container\"}', '2019-04-18 14:28:00', '2019-04-18 14:28:00'), ('19', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:03', '2019-04-18 14:28:03'), ('20', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:04', '2019-04-18 14:28:04'), ('21', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:20', '2019-04-18 14:28:20'), ('22', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:21', '2019-04-18 14:28:21'), ('23', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:28', '2019-04-18 14:28:28'), ('24', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-04-18 14:28:31', '2019-04-18 14:28:31'), ('25', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 14:29:09', '2019-04-18 14:29:09'), ('26', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:46', '2019-04-18 14:58:46'), ('27', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:47', '2019-04-18 14:58:47'), ('28', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:53', '2019-04-18 14:58:53'), ('29', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:54', '2019-04-18 14:58:54'), ('30', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:56', '2019-04-18 14:58:56'), ('31', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:58:57', '2019-04-18 14:58:57'), ('32', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:17', '2019-04-18 14:59:17'), ('33', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:18', '2019-04-18 14:59:18'), ('34', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:41', '2019-04-18 14:59:41'), ('35', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 14:59:42', '2019-04-18 14:59:42'), ('36', '1', 'admin/auth/roles', 'GET', '192.168.242.1', '[]', '2019-04-18 15:01:36', '2019-04-18 15:01:36'), ('37', '1', 'admin/auth/permissions', 'GET', '192.168.242.1', '[]', '2019-04-18 15:01:37', '2019-04-18 15:01:37'), ('38', '1', 'admin/auth/menu', 'GET', '192.168.242.1', '[]', '2019-04-18 15:01:38', '2019-04-18 15:01:38'), ('39', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 15:13:52', '2019-04-18 15:13:52'), ('40', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 15:13:53', '2019-04-18 15:13:53'), ('41', '1', 'admin', 'GET', '192.168.242.1', '[]', '2019-04-18 17:41:36', '2019-04-18 17:41:36'), ('42', '1', 'admin/dashboard', 'GET', '192.168.242.1', '[]', '2019-04-18 17:41:37', '2019-04-18 17:41:37'), ('43', '1', 'admin/auth/users', 'GET', '192.168.242.1', '[]', '2019-04-18 17:41:40', '2019-04-18 17:41:40');
COMMIT;

-- ----------------------------
--  Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_permissions`
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null), ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null), ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null), ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null), ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null), ('6', 'Tab-dashboard', 'tabs.dashboard', null, '/dashboard', '2019-04-18 14:25:30', '2019-04-18 14:25:30');
COMMIT;

-- ----------------------------
--  Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `admin_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_role_permissions`
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `admin_role_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_role_users`
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_roles`
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2019-04-18 03:17:16', '2019-04-18 03:17:16');
COMMIT;

-- ----------------------------
--  Table structure for `admin_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_users`
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$MCMh0Nf/ss2Gj79G/KtaYOPNeuz8ZCF5vPb2.ZjxhAJ6Sj3FfDq1O', 'Administrator', 'images/IMG_7105.JPG', null, '2019-04-18 03:17:16', '2019-04-18 14:16:08', '1');
COMMIT;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1'), ('2', '2014_10_12_100000_create_password_resets_table', '1'), ('3', '2016_01_04_173148_create_admin_tables', '1'), ('4', '2019_01_02_050524_table_enabled_into_admin_user', '2');
COMMIT;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
