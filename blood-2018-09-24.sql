-- MySQL dump 10.13  Distrib 5.7.21, for osx10.13 (x86_64)
--
-- Host: localhost    Database: blood
-- ------------------------------------------------------
-- Server version	5.7.21

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_require`
--

LOCK TABLES `blood_require` WRITE;
/*!40000 ALTER TABLE `blood_require` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_type`
--

LOCK TABLES `blood_type` WRITE;
/*!40000 ALTER TABLE `blood_type` DISABLE KEYS */;
INSERT INTO `blood_type` VALUES (1,'A','A-','108','2018-08-04 21:34:32','2018-09-11 22:09:56'),(2,'AB','AB--','100','2018-08-04 21:34:45','2018-08-05 02:42:43'),(3,'B','B-','100','2018-08-04 21:34:57','2018-08-04 21:34:57'),(4,'O','0-','100','2018-08-04 21:35:06','2018-08-04 21:41:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donar_history`
--

LOCK TABLES `donar_history` WRITE;
/*!40000 ALTER TABLE `donar_history` DISABLE KEYS */;
INSERT INTO `donar_history` VALUES (1,2,1,'A','A-',1,'2018-08-04 21:43:02','2018-09-06 08:01:11'),(2,3,1,'AB','AB--',100,'2018-08-04 21:55:11','2018-08-04 21:55:11'),(3,4,1,'AB','AB--',100,'2018-08-05 02:42:36','2018-08-05 02:42:36'),(4,2,1,'A','A-',2,'2018-01-05 17:30:00','2018-09-06 07:00:17'),(5,2,1,'A','A-',3,'2018-09-06 07:50:48','2018-09-06 07:50:48'),(6,8,1,'A','A-',2,'2018-09-11 22:09:56','2018-09-11 22:09:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doners`
--

LOCK TABLES `doners` WRITE;
/*!40000 ALTER TABLE `doners` DISABLE KEYS */;
INSERT INTO `doners` VALUES (1,2,3,2,'No 12 Pyi Thu Kwet Thit (4) Street','09403488850','19-04-1995','images/1533446852.baby.jpg','2018-08-04 21:38:06','2018-09-10 19:51:24'),(2,3,2,1,'Myay Ni Gone, Sanchaung','09769867204','19-04-1982','images/1533442967.baby.jpg','2018-08-04 21:52:47','2018-08-04 21:52:47'),(3,4,2,1,'No 8 Pyi Thu Kwet Thit (3) Street','09403488850','19-04-1992','images/1533460208.bigrubiktube.jpg','2018-08-05 02:39:42','2018-08-05 02:40:08'),(4,5,2,1,'Washington DC Street Block C 85 Update','09403488850','August-29','images/1533461724.bbcake.jpg','2018-08-05 03:05:24','2018-08-05 03:05:24'),(5,7,1,1,'No 8 Pyi Thu Kwet Thit (3) Street','09403488850','19-04-1992','images/1534932699.kofi.jpg','2018-08-22 03:41:39','2018-08-22 03:41:39'),(6,8,1,1,'Sanchaung','0912345','19-04-1992','images/1536727104.profile.jpg','2018-09-11 22:08:24','2018-09-11 22:08:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Sanchaung','2018-08-04 21:35:16','2018-08-04 21:35:16'),(2,'Kyi Myint Daing','2018-08-04 21:35:24','2018-08-04 21:35:24'),(3,'Alone','2018-08-04 21:35:29','2018-08-04 21:35:29'),(4,'Lanmadaw','2018-08-04 21:35:37','2018-08-04 21:35:37'),(5,'Latha','2018-08-04 21:35:43','2018-08-04 21:35:43'),(6,'Kyauk da dar','2018-08-04 21:35:57','2018-08-04 21:35:57'),(7,'pa pe dan','2018-08-04 21:36:03','2018-08-04 21:36:03'),(8,'Bo Ta Htaung','2018-08-04 21:36:16','2018-08-04 21:36:16'),(9,'Thaketa','2018-08-04 21:36:24','2018-08-04 21:36:24'),(10,'Kamaryut','2018-08-04 21:36:30','2018-08-04 21:36:30'),(11,'Hlaing','2018-08-04 21:36:37','2018-08-04 21:36:37'),(12,'Ma Yan Gone','2018-08-04 21:36:50','2018-08-04 21:36:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeker_request`
--

LOCK TABLES `seeker_request` WRITE;
/*!40000 ALTER TABLE `seeker_request` DISABLE KEYS */;
INSERT INTO `seeker_request` VALUES (1,4,2,1,2,1,'2018-08-05 04:01:53','2018-08-07 09:09:30'),(2,5,2,1,1,1,'2018-08-05 04:05:20','2018-08-07 09:14:52'),(3,7,2,1,1,1,'2018-09-06 18:20:58','2018-09-06 18:36:02'),(4,7,2,1,1,0,'2018-09-06 18:29:35','2018-09-06 18:29:35'),(5,7,1,1,1,1,'2018-09-10 00:40:34','2018-09-10 01:34:26'),(6,8,2,1,1,0,'2018-09-10 01:01:16','2018-09-10 01:01:16'),(7,9,1,1,1,0,'2018-09-21 01:24:40','2018-09-21 01:24:40'),(8,9,1,1,1,0,'2018-09-21 01:26:39','2018-09-21 01:26:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seekers`
--

LOCK TABLES `seekers` WRITE;
/*!40000 ALTER TABLE `seekers` DISABLE KEYS */;
INSERT INTO `seekers` VALUES (1,'thura','mgaungthurawin@gmail.com',NULL,1,'Sanchaung','2018-08-05 00:46:50','2018-08-05 00:46:50'),(2,'test','handsomeman.atrw@gmail.com',NULL,1,'Sanchaung','2018-08-05 02:40:35','2018-08-05 02:40:35'),(3,'thura','aung.thura@miaki.co',NULL,1,'Sanchaung','2018-08-05 03:07:11','2018-08-05 03:07:11'),(4,'thura','thura@gmail.com',NULL,1,'Sanchaung','2018-08-05 03:17:00','2018-08-05 03:17:00'),(5,'Technoland','tech@gmail.com',NULL,1,'Sanchaung','2018-08-05 04:04:28','2018-08-05 04:04:28'),(6,'lol','lol@gmail.com','password',1,'Sanchaung','2018-09-06 18:18:07','2018-09-06 18:18:07'),(7,'lol1','lol1@gmail.com','password',1,'Sanchaung','2018-09-06 18:20:58','2018-09-06 18:20:58'),(8,'testone','testone@gmail.com','password',1,'Sanchaung','2018-09-10 01:01:16','2018-09-10 01:01:16'),(9,'lol','lol@gmail.com',NULL,1,'Sanchaung','2018-09-21 01:24:40','2018-09-21 01:24:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thura','mgaungthurawin@gmail.com','$2y$10$azvNf0aCYrRHK2tNPYNnDe4uLtmNgP.fJo50k5DqbGpAPpHHi3VzC',1,'zr97pFKzk4skbsFFatb0HZJk6OYmvqGMhaAPxcP6HlcosDxOkFZAuziZxL8K','2018-08-04 21:33:33','2018-08-04 21:33:33'),(2,'Mr Donar','donar@gmail.com','$2y$10$D5Jy17pRKRVjRwoeA7dO0OLGzz/pxH/hmmJWBBx.j4bOgAEjxDyRi',2,'xKIIE5VrqnFm3UdFVHi40xTX5eQ9z5OL35XbaJW4FKonC2yYDfOpjolK5vLS','2018-08-04 21:38:06','2018-08-04 22:57:32'),(3,'daw hla hla','hlahla@gmail.com','$2y$10$3NhDB4ciV1R9YuDO9xiaruE/vT6r4xOAbNsSvENKxg1YR98pfbyhS',2,'3T1Cluty5Oi7P78rnuu1foUAoaM1OwIWNaoQU2crWZ9u3UI0CXGaCjrSpImG','2018-08-04 21:52:47','2018-08-04 21:52:47'),(4,'test','test@gmail.com','$2y$10$lGwYrjA75dnqdPMUnOJkDOXT/H729iADtp2DXRYera8uMvCtIhJXO',2,'YOIo1srnu7biXGPcq83r1yT7HnwEPACedAEZSrH4FSD3QNWC11i6tnQGlU7u','2018-08-05 02:39:42','2018-08-05 02:39:42'),(5,'test2','test2@gmail.com','$2y$10$WwdfLs/XfXGBiileo7yO5OTEJR81O/uQVGKcaT34HCpbImII5cl46',2,'Uz2sGwnkadTuSWg6pIORXMvoRyoJv3FCskupLJ5F2WtfHMdNwjSTDyySWW1p','2018-08-05 03:05:24','2018-08-05 03:05:24'),(7,'tester','tester@gmail.com','$2y$10$J6u8FgKPiSs4Z1kiWjdQI.TW5qNBB/9UxUa1VFl8zjWngcMh6ghjG',2,'PbqwGb57UuHhDl5o03b9BTLVejGxZ50awunPUk5RVKBe1UyWA5W1T3flCpWg','2018-08-22 03:41:39','2018-08-22 03:41:39'),(8,'donar one','donarone@gmail.com','$2y$10$gCD6B9FQZWcUjazPDEA2luNi0vIWoyeXpFh1UtEBUSUVymDmVPK0q',2,NULL,'2018-09-11 22:08:24','2018-09-11 22:08:24');
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

-- Dump completed on 2018-09-24 16:39:48
