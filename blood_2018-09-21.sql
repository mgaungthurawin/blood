# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: blood
# Generation Time: 2018-09-21 10:11:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table blood_require
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blood_require`;

CREATE TABLE `blood_require` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blood_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table blood_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blood_type`;

CREATE TABLE `blood_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blood_type` WRITE;
/*!40000 ALTER TABLE `blood_type` DISABLE KEYS */;

INSERT INTO `blood_type` (`id`, `group`, `type`, `quantity`, `created_at`, `updated_at`)
VALUES
	(1,'A','A-','108','2018-08-05 04:04:32','2018-09-12 04:39:56'),
	(2,'AB','AB--','100','2018-08-05 04:04:45','2018-08-05 09:12:43'),
	(3,'B','B-','100','2018-08-05 04:04:57','2018-08-05 04:04:57'),
	(4,'O','0-','100','2018-08-05 04:05:06','2018-08-05 04:11:55');

/*!40000 ALTER TABLE `blood_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table donar_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `donar_history`;

CREATE TABLE `donar_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `donar_history_user_id_foreign` (`user_id`),
  KEY `donar_history_location_id_foreign` (`location_id`),
  CONSTRAINT `donar_history_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `donar_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `donar_history` WRITE;
/*!40000 ALTER TABLE `donar_history` DISABLE KEYS */;

INSERT INTO `donar_history` (`id`, `user_id`, `location_id`, `group`, `type`, `quantity`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'A','A-',1,'2018-08-05 04:13:02','2018-09-06 14:31:11'),
	(2,3,1,'AB','AB--',100,'2018-08-05 04:25:11','2018-08-05 04:25:11'),
	(3,4,1,'AB','AB--',100,'2018-08-05 09:12:36','2018-08-05 09:12:36'),
	(4,2,1,'A','A-',2,'2018-01-06 00:00:00','2018-09-06 13:30:17'),
	(5,2,1,'A','A-',3,'2018-09-06 14:20:48','2018-09-06 14:20:48'),
	(6,8,1,'A','A-',2,'2018-09-12 04:39:56','2018-09-12 04:39:56');

/*!40000 ALTER TABLE `donar_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table doners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doners`;

CREATE TABLE `doners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `blood_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doners_user_id_foreign` (`user_id`),
  KEY `doners_blood_id_foreign` (`blood_id`),
  KEY `doners_location_id_foreign` (`location_id`),
  CONSTRAINT `doners_blood_id_foreign` FOREIGN KEY (`blood_id`) REFERENCES `blood_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doners_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `doners` WRITE;
/*!40000 ALTER TABLE `doners` DISABLE KEYS */;

INSERT INTO `doners` (`id`, `user_id`, `blood_id`, `location_id`, `address`, `phone`, `dob`, `image`, `created_at`, `updated_at`)
VALUES
	(1,2,3,2,'No 12 Pyi Thu Kwet Thit (4) Street','09403488850','19-04-1995','images/1533446852.baby.jpg','2018-08-05 04:08:06','2018-09-11 02:21:24'),
	(2,3,2,1,'Myay Ni Gone, Sanchaung','09769867204','19-04-1982','images/1533442967.baby.jpg','2018-08-05 04:22:47','2018-08-05 04:22:47'),
	(3,4,2,1,'No 8 Pyi Thu Kwet Thit (3) Street','09403488850','19-04-1992','images/1533460208.bigrubiktube.jpg','2018-08-05 09:09:42','2018-08-05 09:10:08'),
	(4,5,2,1,'Washington DC Street Block C 85 Update','09403488850','August-29','images/1533461724.bbcake.jpg','2018-08-05 09:35:24','2018-08-05 09:35:24'),
	(5,7,1,1,'No 8 Pyi Thu Kwet Thit (3) Street','09403488850','19-04-1992','images/1534932699.kofi.jpg','2018-08-22 10:11:39','2018-08-22 10:11:39'),
	(6,8,1,1,'Sanchaung','0912345','19-04-1992','images/1536727104.profile.jpg','2018-09-12 04:38:24','2018-09-12 04:38:24');

/*!40000 ALTER TABLE `doners` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Sanchaung','2018-08-05 04:05:16','2018-08-05 04:05:16'),
	(2,'Kyi Myint Daing','2018-08-05 04:05:24','2018-08-05 04:05:24'),
	(3,'Alone','2018-08-05 04:05:29','2018-08-05 04:05:29'),
	(4,'Lanmadaw','2018-08-05 04:05:37','2018-08-05 04:05:37'),
	(5,'Latha','2018-08-05 04:05:43','2018-08-05 04:05:43'),
	(6,'Kyauk da dar','2018-08-05 04:05:57','2018-08-05 04:05:57'),
	(7,'pa pe dan','2018-08-05 04:06:03','2018-08-05 04:06:03'),
	(8,'Bo Ta Htaung','2018-08-05 04:06:16','2018-08-05 04:06:16'),
	(9,'Thaketa','2018-08-05 04:06:24','2018-08-05 04:06:24'),
	(10,'Kamaryut','2018-08-05 04:06:30','2018-08-05 04:06:30'),
	(11,'Hlaing','2018-08-05 04:06:37','2018-08-05 04:06:37'),
	(12,'Ma Yan Gone','2018-08-05 04:06:50','2018-08-05 04:06:50');

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2018_07_19_061755_create_blood_type_table',1),
	(4,'2018_08_04_075235_create_locaion_table',1),
	(5,'2018_08_04_090807_create_doner_table',1),
	(6,'2018_08_05_040048_create_donar_history_table',1),
	(7,'2018_08_05_060901_creat_seeker_tables',2),
	(9,'2018_08_05_095544_seeker_request_table',3),
	(10,'2018_09_21_080922_create_blood_require_table',4);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table seeker_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seeker_request`;

CREATE TABLE `seeker_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seeker_id` int(10) unsigned NOT NULL,
  `blood_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seeker_request_seeker_id_foreign` (`seeker_id`),
  KEY `seeker_request_blood_id_foreign` (`blood_id`),
  KEY `seeker_request_location_id_foreign` (`location_id`),
  CONSTRAINT `seeker_request_blood_id_foreign` FOREIGN KEY (`blood_id`) REFERENCES `blood_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `seeker_request_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `seeker_request_seeker_id_foreign` FOREIGN KEY (`seeker_id`) REFERENCES `seekers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `seeker_request` WRITE;
/*!40000 ALTER TABLE `seeker_request` DISABLE KEYS */;

INSERT INTO `seeker_request` (`id`, `seeker_id`, `blood_id`, `location_id`, `quantity`, `status`, `created_at`, `updated_at`)
VALUES
	(1,4,2,1,2,1,'2018-08-05 10:31:53','2018-08-07 15:39:30'),
	(2,5,2,1,1,1,'2018-08-05 10:35:20','2018-08-07 15:44:52'),
	(3,7,2,1,1,1,'2018-09-07 00:50:58','2018-09-07 01:06:02'),
	(4,7,2,1,1,0,'2018-09-07 00:59:35','2018-09-07 00:59:35'),
	(5,7,1,1,1,1,'2018-09-10 07:10:34','2018-09-10 08:04:26'),
	(6,8,2,1,1,0,'2018-09-10 07:31:16','2018-09-10 07:31:16'),
	(7,9,1,1,1,0,'2018-09-21 07:54:40','2018-09-21 07:54:40'),
	(8,9,1,1,1,0,'2018-09-21 07:56:39','2018-09-21 07:56:39');

/*!40000 ALTER TABLE `seeker_request` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table seekers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seekers`;

CREATE TABLE `seekers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seekers_location_id_foreign` (`location_id`),
  CONSTRAINT `seekers_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `seekers` WRITE;
/*!40000 ALTER TABLE `seekers` DISABLE KEYS */;

INSERT INTO `seekers` (`id`, `name`, `email`, `password`, `location_id`, `address`, `created_at`, `updated_at`)
VALUES
	(1,'thura','mgaungthurawin@gmail.com',NULL,1,'Sanchaung','2018-08-05 07:16:50','2018-08-05 07:16:50'),
	(2,'test','handsomeman.atrw@gmail.com',NULL,1,'Sanchaung','2018-08-05 09:10:35','2018-08-05 09:10:35'),
	(3,'thura','aung.thura@miaki.co',NULL,1,'Sanchaung','2018-08-05 09:37:11','2018-08-05 09:37:11'),
	(4,'thura','thura@gmail.com',NULL,1,'Sanchaung','2018-08-05 09:47:00','2018-08-05 09:47:00'),
	(5,'Technoland','tech@gmail.com',NULL,1,'Sanchaung','2018-08-05 10:34:28','2018-08-05 10:34:28'),
	(6,'lol','lol@gmail.com','password',1,'Sanchaung','2018-09-07 00:48:07','2018-09-07 00:48:07'),
	(7,'lol1','lol1@gmail.com','password',1,'Sanchaung','2018-09-07 00:50:58','2018-09-07 00:50:58'),
	(8,'testone','testone@gmail.com','password',1,'Sanchaung','2018-09-10 07:31:16','2018-09-10 07:31:16'),
	(9,'lol','lol@gmail.com',NULL,1,'Sanchaung','2018-09-21 07:54:40','2018-09-21 07:54:40');

/*!40000 ALTER TABLE `seekers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'thura','mgaungthurawin@gmail.com','$2y$10$azvNf0aCYrRHK2tNPYNnDe4uLtmNgP.fJo50k5DqbGpAPpHHi3VzC',1,'zr97pFKzk4skbsFFatb0HZJk6OYmvqGMhaAPxcP6HlcosDxOkFZAuziZxL8K','2018-08-05 04:03:33','2018-08-05 04:03:33'),
	(2,'Mr Donar','donar@gmail.com','$2y$10$D5Jy17pRKRVjRwoeA7dO0OLGzz/pxH/hmmJWBBx.j4bOgAEjxDyRi',2,'xKIIE5VrqnFm3UdFVHi40xTX5eQ9z5OL35XbaJW4FKonC2yYDfOpjolK5vLS','2018-08-05 04:08:06','2018-08-05 05:27:32'),
	(3,'daw hla hla','hlahla@gmail.com','$2y$10$3NhDB4ciV1R9YuDO9xiaruE/vT6r4xOAbNsSvENKxg1YR98pfbyhS',2,'3T1Cluty5Oi7P78rnuu1foUAoaM1OwIWNaoQU2crWZ9u3UI0CXGaCjrSpImG','2018-08-05 04:22:47','2018-08-05 04:22:47'),
	(4,'test','test@gmail.com','$2y$10$lGwYrjA75dnqdPMUnOJkDOXT/H729iADtp2DXRYera8uMvCtIhJXO',2,'YOIo1srnu7biXGPcq83r1yT7HnwEPACedAEZSrH4FSD3QNWC11i6tnQGlU7u','2018-08-05 09:09:42','2018-08-05 09:09:42'),
	(5,'test2','test2@gmail.com','$2y$10$WwdfLs/XfXGBiileo7yO5OTEJR81O/uQVGKcaT34HCpbImII5cl46',2,'Uz2sGwnkadTuSWg6pIORXMvoRyoJv3FCskupLJ5F2WtfHMdNwjSTDyySWW1p','2018-08-05 09:35:24','2018-08-05 09:35:24'),
	(7,'tester','tester@gmail.com','$2y$10$J6u8FgKPiSs4Z1kiWjdQI.TW5qNBB/9UxUa1VFl8zjWngcMh6ghjG',2,'PbqwGb57UuHhDl5o03b9BTLVejGxZ50awunPUk5RVKBe1UyWA5W1T3flCpWg','2018-08-22 10:11:39','2018-08-22 10:11:39'),
	(8,'donar one','donarone@gmail.com','$2y$10$gCD6B9FQZWcUjazPDEA2luNi0vIWoyeXpFh1UtEBUSUVymDmVPK0q',2,NULL,'2018-09-12 04:38:24','2018-09-12 04:38:24');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
