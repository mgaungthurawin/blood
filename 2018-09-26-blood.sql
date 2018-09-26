-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: blood
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blood_require`
--

DROP TABLE IF EXISTS `blood_require`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_require` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blood_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_require`
--

LOCK TABLES `blood_require` WRITE;
/*!40000 ALTER TABLE `blood_require` DISABLE KEYS */;
INSERT INTO `blood_require` VALUES (1,8,1,'Blood Type O is require in Sanchaung','2018-09-26 02:02:19','2018-09-26 02:02:19'),(2,1,1,'Blood Type A is require in Sanchaung','2018-09-26 02:07:35','2018-09-26 02:07:35');
/*!40000 ALTER TABLE `blood_require` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_type`
--

DROP TABLE IF EXISTS `blood_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_type`
--

LOCK TABLES `blood_type` WRITE;
/*!40000 ALTER TABLE `blood_type` DISABLE KEYS */;
INSERT INTO `blood_type` VALUES (1,'A','A +','12','2018-09-26 01:55:56','2018-09-26 02:06:16'),(2,'A','A -','10','2018-09-26 01:56:08','2018-09-26 01:56:08'),(3,'B','B +','12','2018-09-26 01:56:23','2018-09-26 02:31:25'),(4,'B','B -','10','2018-09-26 01:56:33','2018-09-26 01:56:33'),(5,'AB','AB +','12','2018-09-26 01:56:46','2018-09-26 02:33:50'),(6,'AB','AB -','10','2018-09-26 01:56:58','2018-09-26 01:56:58'),(7,'O','O +','11','2018-09-26 01:57:10','2018-09-26 02:01:56'),(8,'O','O -','10','2018-09-26 01:57:25','2018-09-26 01:57:25');
/*!40000 ALTER TABLE `blood_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donar_history`
--

DROP TABLE IF EXISTS `donar_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donar_history`
--

LOCK TABLES `donar_history` WRITE;
/*!40000 ALTER TABLE `donar_history` DISABLE KEYS */;
INSERT INTO `donar_history` VALUES (1,2,5,'O','O +',1,'2018-09-26 02:01:56','2018-09-26 02:01:56'),(2,3,6,'A','A +',2,'2018-09-26 02:06:16','2018-09-26 02:06:16'),(3,4,2,'B','B +',2,'2018-09-26 02:31:26','2018-09-26 02:31:26'),(4,5,7,'AB','AB +',2,'2018-09-26 02:33:50','2018-09-26 02:33:50');
/*!40000 ALTER TABLE `donar_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doners`
--

DROP TABLE IF EXISTS `doners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doners`
--

LOCK TABLES `doners` WRITE;
/*!40000 ALTER TABLE `doners` DISABLE KEYS */;
INSERT INTO `doners` VALUES (1,2,7,5,'Kamayut','09425372234','25-06-1993','images/1537950650.41700059_137338950546905_7869806621004660736_n.jpg','2018-09-26 02:00:50','2018-09-26 02:00:50'),(2,3,1,6,'Hlaing','09799855210','17.10.1966','images/1537950951.bbcake.jpg','2018-09-26 02:05:51','2018-09-26 02:05:51'),(3,4,3,2,'Htauk Kyant','09769867204','21.5.1987','images/1537952450.daddycake.png','2018-09-26 02:30:51','2018-09-26 02:30:51'),(4,5,5,7,'Mayangone','09799855210','21.5.1993','images/1537952598.23754824_895068190653202_7844338103992270586_n.jpg','2018-09-26 02:33:19','2018-09-26 02:33:19');
/*!40000 ALTER TABLE `doners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Sanchaung','2018-09-26 01:57:34','2018-09-26 01:57:34'),(2,'Kyi Myint Dine','2018-09-26 01:57:43','2018-09-26 01:57:43'),(3,'Alone','2018-09-26 01:57:50','2018-09-26 01:57:50'),(4,'Latha','2018-09-26 01:57:57','2018-09-26 01:57:57'),(5,'Kamayut','2018-09-26 01:58:05','2018-09-26 01:58:05'),(6,'Hlaing','2018-09-26 01:58:10','2018-09-26 01:58:10'),(7,'Mayangone','2018-09-26 01:58:17','2018-09-26 01:58:17'),(8,'Innsein','2018-09-26 01:58:26','2018-09-26 01:58:26'),(9,'Lanmadaw','2018-09-26 01:58:34','2018-09-26 01:58:34'),(10,'Kyaukdadar','2018-09-26 01:58:42','2018-09-26 01:58:42');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_07_19_061755_create_blood_type_table',1),(4,'2018_08_04_075235_create_locaion_table',1),(5,'2018_08_04_090807_create_doner_table',1),(6,'2018_08_05_040048_create_donar_history_table',1),(7,'2018_08_05_060901_creat_seeker_tables',2),(9,'2018_08_05_095544_seeker_request_table',3),(10,'2018_09_21_080922_create_blood_require_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeker_request`
--

DROP TABLE IF EXISTS `seeker_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker_request`
--

LOCK TABLES `seeker_request` WRITE;
/*!40000 ALTER TABLE `seeker_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `seeker_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seekers`
--

DROP TABLE IF EXISTS `seekers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seekers`
--

LOCK TABLES `seekers` WRITE;
/*!40000 ALTER TABLE `seekers` DISABLE KEYS */;
/*!40000 ALTER TABLE `seekers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thura','mgaungthurawin@gmail.com','$2y$10$FgZi/kcS95R2yi6qpgjtwe8O1.h45ZPl.3drCxN9vHJaE5VWIV182',1,'q086QlW6i5y1pntbMhlFQYZ5wQA0DqZfV9q8t9HLlP6YmjtnHvbWiqr0nCKp','2018-09-26 01:55:26','2018-09-26 01:55:26'),(2,'Nyo Lay Htike','nyolayhtike@gmail.com','$2y$10$BeIoHYznTFYyN4pNdzEvD.lpiTG/LPxoTosxieb/lBMrMbrSz3ZqW',2,'Vi6Xqq357iignEG98Q47hSFS12MQKwTazeujSBf85W3stxnKnp7ZPYvM1rb0','2018-09-26 02:00:50','2018-09-26 02:00:50'),(3,'Pan Ei','pannei@gmail.com','$2y$10$cOdk9EXfofC0uxGJBQMKQuiJdOohvZlwjdEx9G/oznt2dFVPOU9H2',2,'EiSsu5Zjt2ovcXmnV0jiczLDk5FzlUVIlOXoVaM1d2EkbEDUw3vzYpfhwzSm','2018-09-26 02:05:51','2018-09-26 02:05:51'),(4,'Nga Kyi','ngakyi@gmail.com','$2y$10$rH.UjPizaXneXg0wm2LBO.Ig68Kci6bRghjw8/7De2doCgxZ53eOK',2,'j3EFO4EAgNhLEgCDX9DQ7ziNknlu57jFkeMy31tXspAriNJHDf0hOYuHH2S5','2018-09-26 02:30:50','2018-09-26 02:30:50'),(5,'Khant Khant','khantkhant@gmail.com','$2y$10$pRgU/rGJadNZF8ojKYlmh.tUd.LV8VPhxlMZWBupnBItMsGO9cWa6',2,NULL,'2018-09-26 02:33:18','2018-09-26 02:33:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-26 16:14:00
