/*
Navicat MySQL Data Transfer

Source Server         : czx
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : myfile

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-04-26 20:57:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 二手房', '7', 'add_houseinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 二手房', '7', 'change_houseinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 二手房', '7', 'delete_houseinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 二手房', '7', 'view_houseinfo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'mylink', 'houseinfo');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-04-25 11:44:59.066574');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-04-25 11:44:59.468142');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-04-25 11:45:00.999614');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-04-25 11:45:01.509107');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2019-04-25 11:45:01.533672');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2019-04-25 11:45:01.850013');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-04-25 11:45:02.048042');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-04-25 11:45:02.107198');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-04-25 11:45:02.129758');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-04-25 11:45:02.327288');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-04-25 11:45:02.333306');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-04-25 11:45:02.348248');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-04-25 11:45:02.504163');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-04-25 11:45:02.792733');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2019-04-25 11:45:02.839859');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2019-04-25 11:45:02.861917');
INSERT INTO `django_migrations` VALUES ('17', 'mylink', '0001_initial', '2019-04-25 11:45:02.955667');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2019-04-25 11:45:03.029364');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for mylink_houseinfo
-- ----------------------------
DROP TABLE IF EXISTS `mylink_houseinfo`;
CREATE TABLE `mylink_houseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `house` varchar(20) NOT NULL,
  `bedroom` varchar(20) NOT NULL,
  `area` varchar(20) NOT NULL,
  `direction` varchar(20) NOT NULL,
  `floor` varchar(60) NOT NULL,
  `year` varchar(10) NOT NULL,
  `location` varchar(10) NOT NULL,
  `total_price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `add_date` datetime(6) NOT NULL,
  `mod_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mylink_houseinfo
-- ----------------------------
INSERT INTO `mylink_houseinfo` VALUES ('1', '1楼带天井，满五年唯一，看房方便，诚意出售', '白杨小区 ', '2室1厅', '71.3平米', '南', '低楼层(共6层)', '未知', ' 北蔡', '368', '51613', '2019-04-25 14:23:20.649214', '2019-04-25 14:23:20.649214');
INSERT INTO `mylink_houseinfo` VALUES ('2', '长达佳苑宜居尚城 2室2厅 310万', '长达佳苑宜居尚城 ', '2室2厅', '84平米', '南', '高楼层(共6层)', '未知', ' 航头', '310', '36905', '2019-04-25 14:23:20.667262', '2019-04-25 14:23:20.667262');
INSERT INTO `mylink_houseinfo` VALUES ('3', '产证已到手 新装目前已出租 看房方便 诚意出售', '碧桂园浦东星作 ', '2室2厅', '92.11平米', '南', '中楼层(共8层)', '未知', ' 泥城镇', '340', '36913', '2019-04-25 14:23:20.676287', '2019-04-25 14:23:20.676287');
INSERT INTO `mylink_houseinfo` VALUES ('4', '妙境公寓 2室2厅 315万新上', '妙境公寓 ', '2室2厅', '83.42平米', '南', '中楼层(共5层)', '未知', ' 川沙', '315', '37761', '2019-04-25 14:23:20.686313', '2019-04-25 14:23:20.686815');
INSERT INTO `mylink_houseinfo` VALUES ('5', '1楼带天井，满五年唯一，看房方便，诚意出售', '白杨小区 ', '2室1厅', '71.3平米', '南', '低楼层(共6层)', '未知', ' 北蔡', '368', '51613', '2019-04-25 14:23:23.181480', '2019-04-25 14:23:23.181480');
INSERT INTO `mylink_houseinfo` VALUES ('6', '长达佳苑宜居尚城 2室2厅 310万', '长达佳苑宜居尚城 ', '2室2厅', '84平米', '南', '高楼层(共6层)', '未知', ' 航头', '310', '36905', '2019-04-25 14:23:23.187497', '2019-04-25 14:23:23.187497');
INSERT INTO `mylink_houseinfo` VALUES ('7', '产证已到手 新装目前已出租 看房方便 诚意出售', '碧桂园浦东星作 ', '2室2厅', '92.11平米', '南', '中楼层(共8层)', '未知', ' 泥城镇', '340', '36913', '2019-04-25 14:23:23.192510', '2019-04-25 14:23:23.192510');
INSERT INTO `mylink_houseinfo` VALUES ('8', '妙境公寓 2室2厅 315万新上', '妙境公寓 ', '2室2厅', '83.42平米', '南', '中楼层(共5层)', '未知', ' 川沙', '315', '37761', '2019-04-25 14:23:23.199027', '2019-04-25 14:23:23.199528');
INSERT INTO `mylink_houseinfo` VALUES ('9', '1楼带天井，满五年唯一，看房方便，诚意出售', '白杨小区 ', '2室1厅', '71.3平米', '南', '低楼层(共6层)', '未知', ' 北蔡', '368', '51613', '2019-04-25 14:23:33.004149', '2019-04-25 14:23:33.004149');
INSERT INTO `mylink_houseinfo` VALUES ('10', '长达佳苑宜居尚城 2室2厅 310万', '长达佳苑宜居尚城 ', '2室2厅', '84平米', '南', '高楼层(共6层)', '未知', ' 航头', '310', '36905', '2019-04-25 14:23:33.010167', '2019-04-25 14:23:33.010167');
INSERT INTO `mylink_houseinfo` VALUES ('11', '产证已到手 新装目前已出租 看房方便 诚意出售', '碧桂园浦东星作 ', '2室2厅', '92.11平米', '南', '中楼层(共8层)', '未知', ' 泥城镇', '340', '36913', '2019-04-25 14:23:33.015180', '2019-04-25 14:23:33.015180');
INSERT INTO `mylink_houseinfo` VALUES ('12', '妙境公寓 2室2厅 315万新上', '妙境公寓 ', '2室2厅', '83.42平米', '南', '中楼层(共5层)', '未知', ' 川沙', '315', '37761', '2019-04-25 14:23:33.020197', '2019-04-25 14:23:33.020197');
INSERT INTO `mylink_houseinfo` VALUES ('13', '上坤公园天地 5房间2卫 260万', '上坤公园天地 ', '3室2厅', '70平米', '南', '低楼层(共21层)', '未知', ' 顾村', '260', '37143', '2019-04-26 11:52:33.130572', '2019-04-26 11:52:33.130572');
INSERT INTO `mylink_houseinfo` VALUES ('14', '新城云间锦苑 4房电梯叠加 一家老小住方便', '新城云间锦院 ', '4室2厅', '129平米', '南', '中楼层(共8层)', '未知', ' 松江老城', '630', '48838', '2019-04-26 11:54:35.676294', '2019-04-26 11:54:35.676294');
INSERT INTO `mylink_houseinfo` VALUES ('15', '申汉小区 3室2厅 380万', '申汉小区 ', '3室2厅', '131.77平米', '东 西', '高楼层(共31层)', '未知', ' 长风', '380', '28839', '2019-04-26 12:12:34.762188', '2019-04-26 12:12:34.762188');
