# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: blood
# Generation Time: 2018-08-03 03:55:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
	(1,'O','O-','5','2018-07-22 08:57:56','2018-07-22 08:57:56'),
	(2,'B','BB','10','2018-07-22 08:58:07','2018-07-22 08:58:07'),
	(3,'AB','AB--','10','2018-07-22 08:58:39','2018-07-22 08:58:39'),
	(4,'A','A','10','2018-07-22 08:58:53','2018-07-22 08:58:53');

/*!40000 ALTER TABLE `blood_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table donar_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `donar_history`;

CREATE TABLE `donar_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `donar_history_user_id_foreign` (`user_id`),
  CONSTRAINT `donar_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table doners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doners`;

CREATE TABLE `doners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `blood_id` int(10) unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doners_user_id_foreign` (`user_id`),
  KEY `doners_blood_id_foreign` (`blood_id`),
  CONSTRAINT `doners_blood_id_foreign` FOREIGN KEY (`blood_id`) REFERENCES `blood_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `doners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `doners` WRITE;
/*!40000 ALTER TABLE `doners` DISABLE KEYS */;

INSERT INTO `doners` (`id`, `user_id`, `blood_id`, `address`, `phone`, `dob`, `image`, `created_at`, `updated_at`)
VALUES
	(1,5,1,'Latha','09403488850','August-29','images/1532250530.localization.png','2018-07-22 09:08:50','2018-07-22 09:08:50'),
	(2,7,1,'Sanchaung','0943056553','August-29','images/1532251062.eggwhitesonly.jpg','2018-07-22 09:17:42','2018-07-22 09:17:42');

/*!40000 ALTER TABLE `doners` ENABLE KEYS */;
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
	(7,'2014_10_12_000000_create_users_table',1),
	(8,'2014_10_12_100000_create_password_resets_table',1),
	(9,'2018_07_19_061755_create_blood_type_table',1),
	(10,'2018_07_19_090705_create_doner_table',1),
	(11,'2018_07_19_094135_create_donar_history_table',1);

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
	(2,'thura','mgaungthurawin@gmail.com','$2y$10$zzhccf4Ix/AOugCFEZCHweev1Ky5obGjiDloLliaxqGN9mCASVEHe',1,'sLTZS2Ih2ZU2exv5TcmfihgUAa9IHwJeuXoTpHQL3h82X69ziYtThna2uHeW','2018-07-22 08:57:38','2018-07-22 08:57:38'),
	(4,'Myat Sandi','myatsandi@gmail.com','$2y$10$7l0UVsYs.2XmWucgxbk0e.w4NhzqXwtGi1yiXGY3MGiww65fxic6m',2,NULL,'2018-07-22 09:00:58','2018-07-22 09:00:58'),
	(5,'sandi','sandi@gmail.com','$2y$10$Q6vbNb3.LeEKHT6hfQSe.eR38qZZy7WftIneNsxdiKB68m/VXjILW',2,NULL,'2018-07-22 09:08:50','2018-07-22 09:08:50'),
	(7,'sandi','myatsandione@gmail.com','$2y$10$Aus5U060iWYumGgADl.Vle9nlptswRFF0ssCkl0jbUHtxzbmfETn6',2,NULL,'2018-07-22 09:17:42','2018-07-22 09:17:42');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
