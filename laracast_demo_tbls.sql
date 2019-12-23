-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table laracast_demo.billings
CREATE TABLE IF NOT EXISTS `billings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `addr1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addr2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `postalcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bilings_user_id_foreign` (`user_id`),
  CONSTRAINT `bilings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.billings: ~0 rows (approximately)
/*!40000 ALTER TABLE `billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `billings` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezones` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.countries: ~0 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `name`, `abbr`, `timezones`, `created_at`, `updated_at`) VALUES
	(1, 'Unisted States', 'USA', NULL, NULL, NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.data_rows: ~46 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(23, 4, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
	(24, 4, 'message_id', 'text', 'Message Id', 0, 1, 1, 1, 1, 1, '{}', 3),
	(25, 4, 'state', 'text', 'State', 0, 1, 1, 1, 1, 1, '{}', 4),
	(26, 4, 'gallery_id', 'text', 'Gallery Id', 0, 1, 1, 1, 1, 1, '{}', 5),
	(27, 4, 'dob', 'text', 'Dob', 1, 1, 1, 1, 1, 1, '{}', 6),
	(28, 4, 'bio', 'text', 'Bio', 0, 1, 1, 1, 1, 1, '{}', 7),
	(29, 4, 'country', 'text', 'Country', 0, 1, 1, 1, 1, 1, '{}', 8),
	(30, 4, 'gender', 'text', 'Gender', 1, 1, 1, 1, 1, 1, '{}', 9),
	(31, 4, 'seeking_gender', 'text', 'Seeking Gender', 1, 1, 1, 1, 1, 1, '{}', 10),
	(32, 4, 'seeking_desc', 'text', 'Seeking Desc', 0, 1, 1, 1, 1, 1, '{}', 11),
	(33, 4, 'interests', 'text', 'Interests', 0, 1, 1, 1, 1, 1, '{}', 12),
	(34, 4, 'values', 'text', 'Values', 0, 1, 1, 1, 1, 1, '{}', 13),
	(35, 4, 'likes', 'text', 'Likes', 0, 1, 1, 1, 1, 1, '{}', 14),
	(36, 4, 'matches', 'text', 'Matches', 0, 1, 1, 1, 1, 1, '{}', 15),
	(37, 4, 'favorites', 'text', 'Favorites', 0, 1, 1, 1, 1, 1, '{}', 16),
	(38, 4, 'city', 'text', 'City', 0, 1, 1, 1, 1, 1, '{}', 17),
	(39, 4, 'postalcode', 'text', 'Postalcode', 0, 1, 1, 1, 1, 1, '{}', 18),
	(40, 4, 'active', 'text', 'Active', 1, 1, 1, 1, 1, 1, '{}', 19),
	(41, 4, 'account', 'text', 'Account', 1, 1, 1, 1, 1, 1, '{}', 20),
	(42, 4, 'appearance', 'text', 'Appearance', 0, 1, 1, 1, 1, 1, '{}', 21),
	(43, 4, 'notes', 'text', 'Notes', 0, 1, 1, 1, 1, 1, '{}', 22),
	(44, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 23),
	(45, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 24),
	(46, 4, 'online', 'text', 'Online', 0, 1, 1, 1, 1, 1, '{}', 25);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.data_types: ~2 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(4, 'dating_profiles', 'dating-profiles', 'Dating Profile', 'Dating Profiles', NULL, 'App\\DatingProfile', NULL, NULL, NULL, 1, 1, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-09-13 19:37:01', '2019-09-13 19:37:01');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.dating_profiles
CREATE TABLE IF NOT EXISTS `dating_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `message_id` int(10) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT '1',
  `state_id` int(10) unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `gallery` json DEFAULT NULL,
  `gender` tinyint(1) unsigned NOT NULL,
  `seeking_gender` tinyint(1) unsigned NOT NULL,
  `seeking_desc` text COLLATE utf8mb4_unicode_ci,
  `interests` json DEFAULT NULL,
  `values` json DEFAULT NULL,
  `likes` json DEFAULT NULL,
  `matches` json DEFAULT NULL,
  `favorites` json DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guest',
  `appearance` json DEFAULT NULL,
  `notes` json DEFAULT NULL,
  `online` tinyint(1) unsigned DEFAULT NULL COMMENT 'User online, bool',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.dating_profiles: ~7 rows (approximately)
/*!40000 ALTER TABLE `dating_profiles` DISABLE KEYS */;
INSERT INTO `dating_profiles` (`id`, `user_id`, `message_id`, `country_id`, `state_id`, `dob`, `bio`, `gallery`, `gender`, `seeking_gender`, `seeking_desc`, `interests`, `values`, `likes`, `matches`, `favorites`, `city`, `postalcode`, `active`, `account`, `appearance`, `notes`, `online`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 1, 36, '1999-10-22', 'Updating the profile to see if it can be patched in.', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Columbus', '43211', 0, 'guest', NULL, NULL, NULL, NULL, '2019-09-25 14:00:08'),
	(2, 2, NULL, 1, 44, '1952-12-12', 'This is John\'s personal biography online.', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Houston', '67321', 0, 'guest', NULL, NULL, NULL, '2019-09-20 13:47:32', '2019-09-25 14:02:13'),
	(3, 5, NULL, 1, 33, '2001-11-22', 'asdfa adfa qwertaer qertq ert', '["main_id_2.jpg"]', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Paleno', '99447', 0, 'guest', NULL, NULL, NULL, '2019-09-26 13:44:55', '2019-09-26 14:12:12'),
	(4, 211, NULL, 1, 17, '2001-11-22', 'My name is after one edit is still Annabel and I am looking to meet friends living in the Northwestern US.', '["main_id1.jpg", "myavatar.png"]', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Humpster', '76123', 0, 'guest', NULL, NULL, NULL, NULL, '2019-10-29 18:26:44'),
	(5, 221, NULL, 1, 17, '1986-01-20', 'I am Kasey, currently between jobs but I am a registered nurse.  Looking to relocate near my family in Pottstown, NY.', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Hopeville', '22345', 0, 'guest', NULL, NULL, NULL, NULL, NULL),
	(6, 224, NULL, 1, 17, '1963-10-22', 'Just a simple West Coast Gal hoping to meet a good man with lots of money.', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Stockton', '98331', 0, 'guest', NULL, NULL, NULL, NULL, NULL),
	(8, 223, NULL, 1, 17, '1999-10-20', 'What can I say.  I am a big Utah fan.  Go Utes!', '{"images": {"main": "faker_profile_img_f1.jpg"}}', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Century City', '69342', 0, 'guest', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `dating_profiles` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.dating_profile_tag
CREATE TABLE IF NOT EXISTS `dating_profile_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL,
  `dating_profile_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dating_profile_tag_dating_profile_id_tag_id_unique` (`dating_profile_id`,`tag_id`),
  KEY `FK_dating_profile_tag_tags` (`tag_id`),
  CONSTRAINT `FK_dating_profile_tag_dating_profiles` FOREIGN KEY (`dating_profile_id`) REFERENCES `dating_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dating_profile_tag_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pivot table relating tags and dating_profiles tables in a many-to-many.';

-- Dumping data for table laracast_demo.dating_profile_tag: ~6 rows (approximately)
/*!40000 ALTER TABLE `dating_profile_tag` DISABLE KEYS */;
INSERT INTO `dating_profile_tag` (`id`, `tag_id`, `dating_profile_id`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, NULL, NULL),
	(2, 3, 1, NULL, NULL),
	(3, 5, 1, NULL, NULL),
	(4, 6, 1, NULL, NULL),
	(5, 5, 4, NULL, NULL),
	(6, 6, 4, NULL, NULL),
	(7, 2, 4, NULL, NULL);
/*!40000 ALTER TABLE `dating_profile_tag` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.galleries
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imgs` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dating_profile_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_galleries_galleries` (`dating_profile_id`),
  CONSTRAINT `FK_galleries_galleries` FOREIGN KEY (`dating_profile_id`) REFERENCES `dating_profiles` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.galleries: ~3 rows (approximately)
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` (`id`, `imgs`, `created_at`, `updated_at`, `dating_profile_id`) VALUES
	(1, '["main_id1.jpg", "myavatar.png"]', '2019-10-31 19:09:22', '2019-10-31 19:09:22', 1),
	(2, '["main_id_2.jpg"]', '2019-10-31 19:11:39', '2019-10-31 19:11:39', 2),
	(4, '["faker_profile_img_f1.jpg"]', '2019-10-31 19:25:04', '2019-10-31 19:25:04', 8);
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.menus: ~0 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2019-09-12 18:28:37', '2019-09-12 18:28:37');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.menu_items: ~10 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-09-12 18:28:37', '2019-09-12 18:28:37', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.settings.index', NULL),
	(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2019-09-12 18:28:37', '2019-09-12 18:28:37', 'voyager.hooks', NULL),
	(12, 1, 'Dating Profiles', '', '_self', NULL, NULL, NULL, 15, '2019-09-13 19:37:01', '2019-09-13 19:37:01', 'voyager.dating-profiles.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` bigint(20) unsigned NOT NULL,
  `deleted` int(10) unsigned DEFAULT NULL COMMENT 'default null, or id of one user who has deleted this from their messages queue.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_messages_threads` (`thread_id`),
  CONSTRAINT `FK_messages_threads` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.migrations: ~28 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(14, '2014_10_12_000000_create_users_table', 1),
	(17, '2014_10_12_100000_create_password_resets_table', 2),
	(18, '2016_12_22_150439_create_projects_table', 2),
	(19, '2019_08_22_122434_create_threads_table', 2),
	(20, '2019_08_22_133606_create_galleries_table', 2),
	(22, '2019_08_22_180805_create_postalcodes_table', 2),
	(23, '2016_01_01_000000_add_voyager_user_fields', 3),
	(24, '2016_01_01_000000_create_data_types_table', 3),
	(25, '2016_05_19_173453_create_menu_table', 3),
	(26, '2016_10_21_190000_create_roles_table', 3),
	(27, '2016_10_21_190000_create_settings_table', 3),
	(28, '2016_11_30_135954_create_permission_table', 3),
	(29, '2016_11_30_141208_create_permission_role_table', 3),
	(30, '2016_12_26_201236_data_types__add__server_side', 3),
	(31, '2017_01_13_000000_add_route_to_menu_items_table', 3),
	(32, '2017_01_14_005015_create_translations_table', 3),
	(33, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 3),
	(34, '2017_03_06_000000_add_controller_to_data_types_table', 3),
	(35, '2017_04_21_000000_add_order_to_data_rows_table', 3),
	(36, '2017_07_05_210000_add_policyname_to_data_types_table', 3),
	(37, '2017_08_05_000000_add_group_to_settings_table', 3),
	(38, '2017_11_26_013050_add_user_role_relationship', 3),
	(39, '2017_11_26_015000_create_user_roles_table', 3),
	(40, '2018_03_11_000000_add_user_settings', 3),
	(41, '2018_03_14_000000_add_details_to_data_types_table', 3),
	(42, '2018_03_16_000000_make_settings_value_nullable', 3),
	(43, '2018_08_08_100000_create_telescope_entries_table', 4),
	(46, '2019_09_23_191555_createstatestable', 5),
	(48, '2019_11_04_141503_create_tag_categories_table', 6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.permissions: ~31 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(2, 'browse_bread', NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(3, 'browse_database', NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(4, 'browse_media', NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(5, 'browse_compass', NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(6, 'browse_menus', 'menus', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(7, 'read_menus', 'menus', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(8, 'edit_menus', 'menus', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(9, 'add_menus', 'menus', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(10, 'delete_menus', 'menus', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(11, 'browse_roles', 'roles', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(12, 'read_roles', 'roles', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(13, 'edit_roles', 'roles', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(14, 'add_roles', 'roles', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(15, 'delete_roles', 'roles', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(16, 'browse_users', 'users', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(17, 'read_users', 'users', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(18, 'edit_users', 'users', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(19, 'add_users', 'users', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(20, 'delete_users', 'users', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(21, 'browse_settings', 'settings', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(22, 'read_settings', 'settings', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(23, 'edit_settings', 'settings', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(24, 'add_settings', 'settings', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(25, 'delete_settings', 'settings', '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(26, 'browse_hooks', NULL, '2019-09-12 18:28:37', '2019-09-12 18:28:37'),
	(27, 'browse_dating_profiles', 'dating_profiles', '2019-09-13 19:37:01', '2019-09-13 19:37:01'),
	(28, 'read_dating_profiles', 'dating_profiles', '2019-09-13 19:37:01', '2019-09-13 19:37:01'),
	(29, 'edit_dating_profiles', 'dating_profiles', '2019-09-13 19:37:01', '2019-09-13 19:37:01'),
	(30, 'add_dating_profiles', 'dating_profiles', '2019-09-13 19:37:01', '2019-09-13 19:37:01'),
	(31, 'delete_dating_profiles', 'dating_profiles', '2019-09-13 19:37:01', '2019-09-13 19:37:01');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.permission_role: ~31 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.postalcodes
CREATE TABLE IF NOT EXISTS `postalcodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.postalcodes: ~0 rows (approximately)
/*!40000 ALTER TABLE `postalcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `postalcodes` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.regions
CREATE TABLE IF NOT EXISTS `regions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `name` json NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.regions: ~0 rows (approximately)
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` (`id`, `country_id`, `name`, `active`, `created_at`, `updated_at`) VALUES
	(1, 1, '{"AL": "Alabama"}', 1, NULL, NULL);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2019-09-12 18:22:08', '2019-09-12 18:22:08'),
	(2, 'user', 'Normal User', '2019-09-12 18:28:37', '2019-09-12 18:28:37');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.settings: ~10 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.states
CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_name_unique` (`name`),
  UNIQUE KEY `states_abbr_unique` (`abbr`),
  KEY `FK_states_countries` (`country_id`),
  CONSTRAINT `FK_states_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.states: ~51 rows (approximately)
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`id`, `name`, `abbr`, `country_id`, `published`, `created_at`, `updated_at`) VALUES
	(1, 'Alaska', 'AK', 1, 1, NULL, NULL),
	(2, 'Alabama', 'AL', 1, 1, NULL, NULL),
	(3, 'Arkansas', 'AR', 1, 1, NULL, NULL),
	(4, 'Arizona', 'AZ', 1, 1, NULL, NULL),
	(5, 'California', 'CA', 1, 1, NULL, NULL),
	(6, 'Colorado', 'CO', 1, 1, NULL, NULL),
	(7, 'Connecticut', 'CT', 1, 1, NULL, NULL),
	(8, 'District of Columbia', 'DC', 1, 1, NULL, NULL),
	(9, 'Delaware', 'DE', 1, 1, NULL, NULL),
	(10, 'Florida', 'FL', 1, 1, NULL, NULL),
	(11, 'Georgia', 'GA', 1, 1, NULL, NULL),
	(12, 'Hawaii', 'HI', 1, 1, NULL, NULL),
	(13, 'Iowa', 'IA', 1, 1, NULL, NULL),
	(14, 'Idaho', 'ID', 1, 1, NULL, NULL),
	(15, 'Illinois', 'IL', 1, 1, NULL, NULL),
	(16, 'Indiana', 'IN', 1, 1, NULL, NULL),
	(17, 'Kansas', 'KS', 1, 1, NULL, NULL),
	(18, 'Kentucky', 'KY', 1, 1, NULL, NULL),
	(19, 'Louisiana', 'LA', 1, 1, NULL, NULL),
	(20, 'Massachusetts', 'MA', 1, 1, NULL, NULL),
	(21, 'Maryland', 'MD', 1, 1, NULL, NULL),
	(22, 'Maine', 'ME', 1, 1, NULL, NULL),
	(23, 'Michigan', 'MI', 1, 1, NULL, NULL),
	(24, 'Minnesota', 'MN', 1, 1, NULL, NULL),
	(25, 'Missouri', 'MO', 1, 1, NULL, NULL),
	(26, 'Mississippi', 'MS', 1, 1, NULL, NULL),
	(27, 'Montana', 'MT', 1, 1, NULL, NULL),
	(28, 'North Carolina', 'NC', 1, 1, NULL, NULL),
	(29, 'North Dakota', 'ND', 1, 1, NULL, NULL),
	(30, 'Nebraska', 'NE', 1, 1, NULL, NULL),
	(31, 'New Hampshire', 'NH', 1, 1, NULL, NULL),
	(32, 'New Jersey', 'NJ', 1, 1, NULL, NULL),
	(33, 'New Mexico', 'NM', 1, 1, NULL, NULL),
	(34, 'Nevada', 'NV', 1, 1, NULL, NULL),
	(35, 'New York', 'NY', 1, 1, NULL, NULL),
	(36, 'Ohio', 'OH', 1, 1, NULL, NULL),
	(37, 'Oklahoma', 'OK', 1, 1, NULL, NULL),
	(38, 'Oregon', 'OR', 1, 1, NULL, NULL),
	(39, 'Pennsylvania', 'PA', 1, 1, NULL, NULL),
	(40, 'Rhode Island', 'RI', 1, 1, NULL, NULL),
	(41, 'South Carolina', 'SC', 1, 1, NULL, NULL),
	(42, 'South Dakota', 'SD', 1, 1, NULL, NULL),
	(43, 'Tennessee', 'TN', 1, 1, NULL, NULL),
	(44, 'Texas', 'TX', 1, 1, NULL, NULL),
	(45, 'Utah', 'UT', 1, 1, NULL, NULL),
	(46, 'Virginia', 'VA', 1, 1, NULL, NULL),
	(47, 'Vermont', 'VT', 1, 1, NULL, NULL),
	(48, 'Washington', 'WA', 1, 1, NULL, NULL),
	(49, 'Wisconsin', 'WI', 1, 1, NULL, NULL),
	(50, 'West Virginia', 'WV', 1, 1, NULL, NULL),
	(51, 'Wyoming', 'WY', 1, 1, NULL, NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_category_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tags_tags` (`tag_category_id`),
  CONSTRAINT `FK_tags_tags` FOREIGN KEY (`tag_category_id`) REFERENCES `tag_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.tags: ~5 rows (approximately)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`, `tag_category_id`, `created_at`, `updated_at`) VALUES
	(2, 'Golf', 7, NULL, NULL),
	(3, 'Hiking', 7, NULL, NULL),
	(4, 'Knitting', 1, NULL, NULL),
	(5, 'Fishing', 1, NULL, NULL),
	(6, 'Casinos', 1, NULL, NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.tag_categories
CREATE TABLE IF NOT EXISTS `tag_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_categories_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.tag_categories: ~3 rows (approximately)
/*!40000 ALTER TABLE `tag_categories` DISABLE KEYS */;
INSERT INTO `tag_categories` (`id`, `name`, `parent`, `created_at`, `updated_at`) VALUES
	(1, 'Hobbies', NULL, NULL, NULL),
	(2, 'Art', 1, NULL, NULL),
	(7, 'Activities', NULL, NULL, NULL);
/*!40000 ALTER TABLE `tag_categories` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.threads
CREATE TABLE IF NOT EXISTS `threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` json NOT NULL,
  `accessed_at` timestamp NULL DEFAULT NULL,
  `accessed_by` int(10) unsigned NOT NULL COMMENT 'user id of most recent fetch request',
  PRIMARY KEY (`id`),
  KEY `FK_threads_users` (`accessed_by`),
  CONSTRAINT `FK_threads_users` FOREIGN KEY (`accessed_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.threads: ~0 rows (approximately)
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL DEFAULT '2',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` json DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.users: ~132 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `mname`, `lname`, `email`, `avatar`, `password`, `secret`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Chris', 'A', 'Nichols', 'chrisnicholsinbox@outlook.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '1hRwVlqkCVvNOwlvPL3UPapHlq7z80y9s4z6egwZefsBihkHjUZlWPpv16RU', NULL, '2019-08-29 17:58:45', '2019-09-12 18:22:08'),
	(2, 2, 'John', 'Q', 'Doe', 'cf_is_here@hotmail.com', 'users/default.png', '$2y$10$QRg.XhziqScsIQf7xcdvkea4ckp2Ifj9hgKnXutWf1zk5.aFpRbWi', NULL, 'm79V4euLxTXwb36HrjvmmjBytDjOvS2dfRBCcX4xSiXm8nc09DJJ5mhc5WvM', NULL, '2019-09-12 18:08:32', '2019-09-12 18:08:32'),
	(4, 2, 'Billy', 'A', 'Madison', 'billym@madisonBilly.work', 'users/default.png', '$2y$10$oxAf01yrHqCn15fyi4hevOSNX6kAizp1KJ7e7t48KWgNRiYQ0xHba', NULL, NULL, NULL, '2019-09-18 19:30:52', '2019-09-18 19:30:52'),
	(5, 2, 'Sally', 'M', 'WIlson', 'sally@sally.sally', 'users/default.png', '$2y$10$FGx2QqIM4t.uzxDp/sRrHu82FiNZVcsZrK1fX0/kFn5iMeIT4lDk2', NULL, '1TzEsm5VZyjOIou2v13ZGlF6maVg6zg9OCCDuNjdE8iv0vp2iq83D13GaehI', NULL, '2019-09-24 13:54:18', '2019-09-24 13:54:18'),
	(6, 2, 'Bobbi', 'Q.', 'Hopewell', 'bobbi@bobbi.bobbi', 'users/default.png', '$2y$10$bZTMJ88NiEipVImgoDJPCO7MbUH9NIHbGKy9qe1WYUBtfY9qLShwC', NULL, NULL, NULL, '2019-09-26 17:34:20', '2019-09-26 17:34:20'),
	(7, 2, 'Guy Hilpert', NULL, NULL, 'angelita.carroll@example.net', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '0GKHUsqzgo', NULL, '2019-10-24 16:21:29', '2019-10-24 16:21:29'),
	(8, 2, 'Alexandrine Wilkinson', NULL, NULL, 'rwilderman@example.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '4DkQNeUPrO', NULL, '2019-10-24 16:21:29', '2019-10-24 16:21:29'),
	(9, 2, 'Dr. Shana Beer DVM', NULL, NULL, 'hoeger.sarina@example.org', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'puYxsHTx9g', NULL, '2019-10-24 16:21:29', '2019-10-24 16:21:29'),
	(10, 2, 'Miss Danyka Cruickshank', NULL, NULL, 'kparisian@example.org', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '2wYahGGSlU', NULL, '2019-10-24 16:21:29', '2019-10-24 16:21:29'),
	(11, 2, 'Silas Mitchell MD', NULL, NULL, 'schneider.wyman@example.net', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '7hxiu29lo9', NULL, '2019-10-24 16:21:29', '2019-10-24 16:21:29'),
	(12, 2, 'Maye Heller', NULL, NULL, 'vernie.trantow@example.org', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '1mKZsT1lOD', NULL, '2019-10-24 16:21:29', '2019-10-24 16:21:29'),
	(207, 2, 'Anita', NULL, 'Olson', 'fabian.stamm@stark.info', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '5Tjqufz8cB', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(208, 2, 'Unique', NULL, 'Kessler', 'schumm.daphney@schmeler.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'D5bjTSsP1h', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(209, 2, 'Kelley', NULL, 'Beier', 'moore.bria@hotmail.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'KZS4uMYYma', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(210, 2, 'Ernestina', NULL, 'Kshlerin', 'morissette.christy@yahoo.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'OeQc7edSJe', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(211, 2, 'Annabel', NULL, 'Willms', 'modesto.leuschke@wolff.biz', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'sVqVxOpGdZ0Spj3EtDCPezFnPRv1T5TWdlOSRlnwSlL55bhu1HY660XQhOl0', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(212, 2, 'Javon', NULL, 'Daniel', 'wbarrows@williamson.biz', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'HF88fT2EMc', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(213, 2, 'Brady', NULL, 'Rohan', 'alicia97@hahn.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'tCX0fP8hwk', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(214, 2, 'Jordon', NULL, 'Turner', 'ila.beer@yahoo.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'uJ1JR3TCyi', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(215, 2, 'Berry', NULL, 'Lockman', 'mann.jesus@gutkowski.net', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'C2pwaIWYKx', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(216, 2, 'Jamaal', NULL, 'Walter', 'nya.fisher@gmail.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'YGA6xjn3Z2', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(217, 2, 'Zora', NULL, 'Moen', 'kolby59@raynor.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'mEgwp2RjLR', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(218, 2, 'Macey', NULL, 'Mann', 'peyton18@stracke.net', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'RuElXeBfO4', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(219, 2, 'Jamey', NULL, 'Swaniawski', 'eichmann.skyla@nikolaus.net', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'RD2FKywaJXwDhpbEDCGxZTUwjTEXrWjxPMftsBxViwspdFPxYi5jNezMLYPc', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(220, 2, 'Milan', NULL, 'Lind', 'vinnie.streich@koch.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'dBBjKjqZoh', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(221, 2, 'Kasey', NULL, 'Runolfsson', 'cbauch@gmail.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'clkthGFW2YpzjVq3qb7yuUzXwDN56DDNfrmG7yNIR8j15IniJecrSS17xEOG', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(222, 2, 'Destinee', NULL, 'Ernser', 'frami.jerel@gmail.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'ETNzjvKMRg', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(223, 2, 'Fiona', NULL, 'Koepp', 'geovany51@vandervort.biz', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'kEnwxtuZMXFoLXID0jhNtlmsEHVEw7bPivlze0s2gQiip3SVyApsXtUbuzTG', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(224, 2, 'Georgianna', NULL, 'Stehr', 'theo.strosin@gmail.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'WZL1p7qfZ2Gj0huvNDHPfIQFe8snWB3YrPKmVIVC2SA13ptZESI543YXyc2j', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(225, 2, 'Maxime', NULL, 'Abernathy', 'josianne16@gmail.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, 'ukJz9Tu0Iu', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(226, 2, 'Rasheed', NULL, 'Stark', 'kaylah.blick@kertzmann.com', 'users/default.png', '$2y$10$yCUKvyBH7VzzBuYe3M6Ej.X5260W6IM/4pSah4mQfk1tx4PrgHNV6', NULL, '0fbIwmX7f8', NULL, '2019-10-24 16:46:17', '2019-10-24 16:46:17'),
	(227, 2, 'Sammy', 'J', 'Fleckerbacher', 'samfleck@gmailus.us', 'users/default.png', '$2y$10$3vk7STvq4/O.Od1E4x.RCeeKrvmgPyOgTjjugAS/YMnBFhA.3WXty', NULL, NULL, NULL, '2019-11-12 20:35:16', '2019-11-12 20:35:16'),
	(228, 2, 'Keyshawn', NULL, 'Howe', 'jadyn.mccullough@anderson.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'zNoRHXoyrq', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(229, 2, 'Eunice', NULL, 'Dach', 'frieda41@stracke.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'fjwvXWHprW', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(230, 2, 'Jayne', NULL, 'Rempel', 'jermain.dooley@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '7K7yvC5RhE', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(231, 2, 'Adolphus', NULL, 'Jacobi', 'loren.bruen@feeney.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'KdO90Ec1lV', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(232, 2, 'Fidel', NULL, 'Larkin', 'jaskolski.lavina@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '4k8zsa2B7y', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(233, 2, 'Hermina', NULL, 'O\'Conner', 'rebeca77@kunde.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '9axeXeaaf2', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(234, 2, 'Mazie', NULL, 'Reichert', 'orlo43@dare.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Cwny2uTyuk', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(235, 2, 'Peyton', NULL, 'Romaguera', 'doug98@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'W1YYiZUmaf', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(236, 2, 'Dane', NULL, 'Collier', 'edwardo.sanford@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'ezTkzsl2Cn', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(237, 2, 'Dayton', NULL, 'Hudson', 'bjohns@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Q0tz9zf1At', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(238, 2, 'Elmer', NULL, 'Auer', 'raymond03@cole.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'ZSdy8hiJ1N', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(239, 2, 'Laisha', NULL, 'Shields', 'wkiehn@bogisich.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Pbz7urJJyn', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(240, 2, 'Virgie', NULL, 'Roob', 'chill@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '8VCzi1abaU', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(241, 2, 'Skylar', NULL, 'Erdman', 'pmcdermott@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '4qbp94A6Ub', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(242, 2, 'Neha', NULL, 'Pacocha', 'arden.schmitt@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'fizUyL30h4', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(243, 2, 'Jeanne', NULL, 'Morissette', 'melba.funk@barrows.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'IQKETlJZWd', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(244, 2, 'Joshua', NULL, 'Dare', 'sierra75@yundt.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'aES6jmSiO3', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(245, 2, 'Jakob', NULL, 'Hettinger', 'clifford47@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'kPfjo0Tjv3', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(246, 2, 'Coy', NULL, 'Hoppe', 'kulas.linnea@hane.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '8aqsnAE8pu', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(247, 2, 'Prince', NULL, 'Berge', 'hand.matilde@koch.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'b1yjEfHFyK', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(248, 2, 'Dillan', NULL, 'Langosh', 'jacky.hills@witting.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'djFOLOZCsx', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(249, 2, 'Susie', NULL, 'Heathcote', 'welch.hailee@ryan.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'cvlfKMigfS', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(250, 2, 'Mara', NULL, 'Smitham', 'storp@kreiger.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'wnEaN9ITd8', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(251, 2, 'Carmel', NULL, 'Goodwin', 'isom.kuhlman@murphy.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'iBaVZRJw4r', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(252, 2, 'Terence', NULL, 'Friesen', 'bergnaum.ella@kessler.net', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'SD7unbwBiu', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(253, 2, 'Anderson', NULL, 'Tillman', 'wilfred79@weimann.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'eY3cPwy29T', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(254, 2, 'Jessy', NULL, 'Macejkovic', 'hailee74@wuckert.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'VLYQ3yOlcf', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(255, 2, 'Cheyenne', NULL, 'Homenick', 'barry.willms@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'h4C1enqGtu', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(256, 2, 'Howell', NULL, 'Kuphal', 'randal.koelpin@torphy.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'DrkZVpDM3B', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(257, 2, 'Meta', NULL, 'O\'Hara', 'legros.rashawn@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'UOJ9DR1Sfg', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(258, 2, 'Kristian', NULL, 'O\'Conner', 'ryann.heathcote@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'vKTXs26oMn', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(259, 2, 'Sammie', NULL, 'Ryan', 'gaston.rippin@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'iwVW04COxP', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(260, 2, 'Shanna', NULL, 'Spinka', 'charles.morar@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'iQsr1V6KwP', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(261, 2, 'Creola', NULL, 'Strosin', 'saul07@witting.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'VufN7OveiC', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(262, 2, 'Walton', NULL, 'O\'Hara', 'ayden80@kihn.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'LoUxRHDJio', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(263, 2, 'Joannie', NULL, 'Legros', 'bahringer.rosario@pollich.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'mdu9gQnx2n', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(264, 2, 'Aurore', NULL, 'Mueller', 'kunze.euna@mcdermott.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'l26NKJ7aCH', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(265, 2, 'Austin', NULL, 'Lemke', 'swift.maria@marquardt.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'kzyoOZ8Vte', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(266, 2, 'Shanny', NULL, 'Leffler', 'viva85@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'iGRj10QkfE', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(267, 2, 'Jo', NULL, 'Kilback', 'christiansen.reuben@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'k4KN42H6v6', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(268, 2, 'Joan', NULL, 'Sipes', 'parisian.horacio@farrell.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '6sq0SWPomp', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(269, 2, 'Valentine', NULL, 'Kerluke', 'connelly.mara@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'tQLxOmQbcY', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(270, 2, 'Pascale', NULL, 'Johns', 'maximo.cole@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'ttGil1O9vS', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(271, 2, 'Gaetano', NULL, 'Kuvalis', 'amaya15@huels.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Ljo2RoZwL5', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(272, 2, 'Lea', NULL, 'Cartwright', 'nlemke@kutch.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'r7iEt193mU', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(273, 2, 'Jessy', NULL, 'Champlin', 'jacobi.nova@halvorson.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'NJPeWzmNj4', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(274, 2, 'Grayce', NULL, 'Heller', 'glennie.legros@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'fKmKanAngK', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(275, 2, 'Alfredo', NULL, 'Stehr', 'sreichel@champlin.net', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'a6ISBy1pE3', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(276, 2, 'Brisa', NULL, 'DuBuque', 'ifriesen@keeling.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'W0zfHJNH3V', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(277, 2, 'Meagan', NULL, 'Brekke', 'upouros@stiedemann.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'p20xjJZ8dn', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(278, 2, 'Wilford', NULL, 'O\'Connell', 'catalina20@heaney.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '8tsEGWivpc', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(279, 2, 'Vance', NULL, 'Maggio', 'urunolfsdottir@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'sC6ralDrda', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(280, 2, 'Chauncey', NULL, 'Hamill', 'vframi@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'gKwKrgixgc', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(281, 2, 'Trey', NULL, 'Schowalter', 'iliana.reichel@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'jkbepaeweC', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(282, 2, 'Hermann', NULL, 'Grady', 'wberge@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'd7Pfdq81JH', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(283, 2, 'Luna', NULL, 'Leffler', 'macie.weimann@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Y9XcULYKgz', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(284, 2, 'Oda', NULL, 'Beier', 'legros.maverick@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'CXZn9NcA1L', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(285, 2, 'Breanne', NULL, 'Kilback', 'noe30@koelpin.info', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'CcRvnAxvTd', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(286, 2, 'Pierce', NULL, 'Ritchie', 'treutel.albert@feil.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '38zKdVDtod', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(287, 2, 'Jaime', NULL, 'Kautzer', 'bins.laverne@johnson.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'ZIWr6AcaBj', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(288, 2, 'Ezra', NULL, 'Cremin', 'gutkowski.april@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '6tnOb39mo3', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(289, 2, 'Brando', NULL, 'Cronin', 'dora23@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Jk2pgxhOHt', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(290, 2, 'Raina', NULL, 'Wintheiser', 'marlene.beatty@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'ijBSrKnglX', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(291, 2, 'Branson', NULL, 'Considine', 'vicky.waters@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'w32xbaemHL', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(292, 2, 'Casey', NULL, 'Osinski', 'daren74@quigley.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Ecjwn88gz3', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(293, 2, 'Ignatius', NULL, 'Harris', 'adeckow@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'ObHkxtuPXC', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(294, 2, 'Giovanna', NULL, 'Fritsch', 'keebler.alexandra@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'TX1xxrS4fR', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(295, 2, 'Briana', NULL, 'McKenzie', 'ondricka.gerda@brekke.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'oauvGoeRp5', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(296, 2, 'Matilda', NULL, 'Kling', 'miracle.schaefer@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'Y1J8XN9CTP', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(297, 2, 'Wendell', NULL, 'Donnelly', 'dfarrell@grimes.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'nOxqu5QK3n', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(298, 2, 'Jadyn', NULL, 'Hill', 'gayle04@vandervort.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'yPRzBUAUd5', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(299, 2, 'Maeve', NULL, 'Emard', 'qkuhlman@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'VrTruFQiSf', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(300, 2, 'Ephraim', NULL, 'Yundt', 'gorczany.jacynthe@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'KKPIi9Bwd3', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(301, 2, 'Mose', NULL, 'Luettgen', 'roscoe.hackett@bins.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '8TCOuQzgak', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(302, 2, 'Granville', NULL, 'Schiller', 'ngaylord@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'rA8G97MzGo', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(303, 2, 'Gregoria', NULL, 'Romaguera', 'catherine64@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'd0VTASYNSf', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(304, 2, 'Muhammad', NULL, 'Treutel', 'jaycee87@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'XNDVg7fGcs', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(305, 2, 'Gustave', NULL, 'Kerluke', 'toby25@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, '5c8lDjY7nh', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(306, 2, 'Caesar', NULL, 'Kessler', 'jalyn76@cassin.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'krDzmCf8Tf', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(307, 2, 'Rossie', NULL, 'Bayer', 'conor26@swaniawski.net', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'WsCi8RprAX', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(308, 2, 'Estel', NULL, 'Ritchie', 'bkling@predovic.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'lH30oFQHsX', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(309, 2, 'Cassandre', NULL, 'Dietrich', 'weimann.shad@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'BS5q4NL6Ox', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(310, 2, 'Mazie', NULL, 'Bauch', 'tpurdy@goodwin.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'I72SU50EPX', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(311, 2, 'Mayra', NULL, 'Wunsch', 'haley.amina@greenfelder.info', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'CYmlffxsZS', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(312, 2, 'Magnolia', NULL, 'Leffler', 'jaylon00@klocko.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'KmCowGYPJm', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(313, 2, 'Magdalena', NULL, 'Bins', 'kaelyn.gutkowski@yahoo.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'ykrC85mAtf', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(314, 2, 'Ubaldo', NULL, 'Reilly', 'ibeatty@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'jeU8SOQ9Ss', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(315, 2, 'Frances', NULL, 'Weber', 'zieme.demetris@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'DZaIskFMdQ', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(316, 2, 'Susana', NULL, 'Bergnaum', 'selena84@goyette.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'iRSJdq4Nk6', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(317, 2, 'Gillian', NULL, 'Conn', 'eladio64@pfannerstill.org', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'qh5cPmRLAD', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(318, 2, 'Jamar', NULL, 'Kassulke', 'briana.zboncak@ward.info', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'RwIF1SZOUi', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(319, 2, 'Kristopher', NULL, 'Sauer', 'rschaefer@dooley.biz', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'a04hwjgeUN', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(320, 2, 'Dortha', NULL, 'Yundt', 'jamir05@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'BHovAbV17f', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(321, 2, 'Destany', NULL, 'Wilderman', 'oboyle@bode.net', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'EjzWxdetj9', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(322, 2, 'Aimee', NULL, 'Douglas', 'damion.dooley@nitzsche.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'cTKMlZkjwE', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(323, 2, 'Alford', NULL, 'Hahn', 'emmerich.elinore@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'f1LpVfDLM6', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(324, 2, 'Antoinette', NULL, 'Littel', 'toy.akeem@gmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'XvJ2ZVcHdV', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(325, 2, 'Isobel', NULL, 'Jenkins', 'kadin.welch@hotmail.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'FC5kQnbfYR', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(326, 2, 'Michele', NULL, 'Olson', 'ebayer@bednar.com', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'VPYQJt5CE6', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59'),
	(327, 2, 'Billy', NULL, 'Runte', 'rolfson.cynthia@effertz.info', 'users/default.png', '$2y$10$OPlQbWMNeWSRKN.4rZHW9e3C/NpwEOb..XuoTIRl446RBZpErHdwC', NULL, 'wGxSFrft0h', NULL, '2019-12-20 19:43:59', '2019-12-20 19:43:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table laracast_demo.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laracast_demo.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
