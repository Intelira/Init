-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: djamil_siti
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) NOT NULL,
  `url` varchar(255) NOT NULL,
  `penulis` varchar(150) NOT NULL,
  `asal` enum('Kemenkes','Sendiri','Other') NOT NULL,
  `gambar` text,
  `status` tinyint(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keluhan`
--

DROP TABLE IF EXISTS `keluhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keluhan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userKey` varchar(7) NOT NULL,
  `siklus` int NOT NULL,
  `last_session` date NOT NULL,
  `mukositis` int NOT NULL,
  `kelelahan` int NOT NULL,
  `mual` int NOT NULL,
  `muntah` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keluhan`
--

LOCK TABLES `keluhan` WRITE;
/*!40000 ALTER TABLE `keluhan` DISABLE KEYS */;
INSERT INTO `keluhan` VALUES (1,'2b18c35',3,'2026-01-10',0,1,0,0,'2026-08-31 01:01:45'),(2,'c3028b7',3,'2026-08-31',0,0,1,0,'2026-08-31 03:00:11'),(3,'25474c7',2,'2026-08-10',0,2,2,1,'2026-08-31 03:34:35'),(4,'3000631',3,'2026-09-01',0,0,2,0,'2026-09-01 05:50:30'),(5,'9092d0b',6,'2026-09-01',0,0,3,1,'2026-09-01 06:31:26'),(6,'10f8b77',2,'2026-09-02',0,1,0,0,'2026-09-02 03:37:15'),(7,'3000631',3,'2026-09-01',0,0,0,0,'2026-09-02 03:43:17'),(8,'2711b07',5,'2026-09-02',0,1,1,1,'2026-09-02 04:57:33'),(9,'3000631',3,'2026-09-01',0,0,0,0,'2026-09-03 03:20:49'),(10,'0ac0ecb',10,'2026-09-04',0,1,0,0,'2026-09-04 02:26:53'),(11,'0ecf5a3',10,'2026-09-11',0,1,0,0,'2026-09-11 02:45:13'),(12,'1a37a73',10,'2026-09-11',0,0,1,0,'2026-09-11 02:49:14'),(13,'d64f7a6',4,'2026-09-11',0,1,0,0,'2026-09-11 02:52:06'),(14,'ce919dc',4,'2026-09-11',0,1,1,1,'2026-09-11 02:54:30'),(15,'cc67868',8,'2026-09-11',0,1,0,0,'2026-09-11 03:00:11'),(16,'d38f4ac',5,'2026-09-15',0,1,1,0,'2026-09-15 03:25:19');
/*!40000 ALTER TABLE `keluhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_credential`
--

DROP TABLE IF EXISTS `login_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_credential` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userKey` varchar(7) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleKey` int NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `last_login` timestamp NULL DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nik` (`nik`),
  UNIQUE KEY `userKey` (`userKey`),
  KEY `idx_login_credential_roleKey` (`roleKey`),
  CONSTRAINT `fk_login_credential_role` FOREIGN KEY (`roleKey`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_credential`
--

LOCK TABLES `login_credential` WRITE;
/*!40000 ALTER TABLE `login_credential` DISABLE KEYS */;
INSERT INTO `login_credential` VALUES (1,'59dc3ba','1231234564567890','$2y$10$KGokrG9ecYiIGIAGbrSAEeZEdAHcVCOiNlaMVIHwdnvT4DLG1SKuW',3,1,'2026-08-12 03:38:10','2026-08-12 03:38:00','2026-08-12 03:38:10'),(2,'2b18c35','3174011008010005','$2y$10$6bP.rYlght565XoBxP79tOD/Aul4rsBbYFeA6jLiXcCQVGvKka3sS',3,1,'2026-08-31 01:01:15','2026-08-31 01:00:54','2026-08-31 01:01:15'),(5,'a06a866','3217116909920004','$2y$10$TkquIbx0ed47VO5bprbWrerhyuYtV5PiYRf7dhiuuza/TJQ9VsN0C',3,1,'2026-08-31 05:27:06','2026-08-31 01:15:25','2026-08-31 05:27:06'),(6,'9475ba6','1372011112990001','$2y$10$cNMR4RfVWjgYC.TZQ5SdyuWd9dOv37nN4wI0vWtKCx7JRha8TDKSS',3,1,'2026-09-11 12:54:27','2026-08-31 02:14:35','2026-09-11 12:54:27'),(7,'25474c7','1308141303010002','$2y$10$Q1ZZNM6mXhNOTChu9crXs./Bea2O7L9iRYUMuHx3vXFSz.bi.d8ni',3,1,'2026-08-31 02:54:36','2026-08-31 02:54:12','2026-08-31 02:54:36'),(8,'c3028b7','1302100109050002','$2y$10$8kfVv8iynzcrPer70SPDeuJ0aJhFcgLo2SyKomfu0ZrEUDpDv9OW6',3,1,'2026-08-31 02:57:58','2026-08-31 02:56:52','2026-08-31 02:57:58'),(9,'3000631','1304054905900001','$2y$10$FmLbQQen4bjqfPJR6Hrm1.pbTXfdxau40XKcMEVh9D5gajHvkcuNC',3,1,'2026-09-03 03:20:24','2026-09-01 05:47:15','2026-09-03 03:20:24'),(10,'f4eb221','3201025107890012','$2y$10$AjB4fchkyiPiUN9xtsRYIeyFGp.zJGVZ24wTziHyMTsQIY92AuQKm',3,1,'2026-09-01 05:52:20','2026-09-01 05:51:59','2026-09-01 05:52:20'),(11,'9092d0b','1310015201010002','$2y$10$8voXnS.OczGTbHqXtlbDouRCpRNf8Rp6O/tOmXQtFqCieMCGj2EC6',3,1,'2026-09-01 06:29:07','2026-09-01 06:27:45','2026-09-01 06:29:07'),(12,'6b3deb3','1306046606920003','$2y$10$9YNDwi1Whl1gjhtpJBV7i.WU3pVoP9GBcGO.W2i0XIPAjHQ4ws61S',3,1,'2026-09-02 02:10:02','2026-09-02 02:09:16','2026-09-02 02:10:02'),(13,'10f8b77','1371014901860005','$2y$10$EjiKh53kxRGcYASuHObsyOQ7H3dYup0pxhN/33hTR/SLU5e/UEgQe',3,1,'2026-09-02 03:34:21','2026-09-02 03:33:30','2026-09-02 03:34:21'),(14,'f5d63cd','321513551083003','$2y$10$5elKUC8Z84MCTgW3lHHTyeKMQrOt05q4A5dnCJZHWT/Nq4Xaykipa',3,1,NULL,'2026-09-02 03:34:28','2026-09-02 03:34:28'),(15,'2711b07','1572026001860002','$2y$10$ehEbnXEqpRXyGX2jcEj28Om3LHHo.s82o2aIgsLY.qLsCNXOBa4vS',3,1,'2026-09-02 04:56:38','2026-09-02 04:56:06','2026-09-02 04:56:38'),(16,'0f4811c','1301044910980001','$2y$10$HA4eeA.o1VR.DdiEL23GWOnVfqXisVVLnBN6xaYqAYOeDw3VyGmBG',3,1,'2026-09-02 08:58:50','2026-09-02 08:50:58','2026-09-02 08:58:50'),(17,'fb9b070','1305047006600004','$2y$10$CLMX0ebL9oLqLEIreNSZDe2lYr/E6myj8IVouyEiNTyWfUhSBaEVS',3,1,'2026-09-03 01:21:42','2026-09-03 01:20:35','2026-09-03 01:21:42'),(18,'ae23916','1302074204870004','$2y$10$4YZZJNvNEYtok7WYqJQruOcuEZQwicbLebTtS0Q3QKM5AxbTo8Fy2',3,1,'2026-09-03 02:32:52','2026-09-03 02:30:44','2026-09-03 02:32:52'),(19,'a68167c','1371112810790007','$2y$10$GzT8GsrK72i7OIouoosMCeSrmdU7xItW203b.p9noXh3l.P3rVaBm',3,1,'2026-09-04 01:32:24','2026-09-04 01:31:49','2026-09-04 01:32:24'),(20,'0eef9f0','1305150612950001','$2y$10$PrCheU4Yjvk16A9TPKL6c.RKBCcXtOED6/6CVRU7Iti/.rGrtsIZi',3,1,'2026-09-04 01:52:11','2026-09-04 01:50:33','2026-09-04 01:52:11'),(21,'f4bd3cb','1371066312000009','$2y$10$csfSr7RwhKLwMQgzwOcUW.aD9VXskNmnfmSLh.yz2escLJTjfad..',3,1,'2026-09-04 02:07:25','2026-09-04 02:06:34','2026-09-04 02:07:25'),(22,'0ac0ecb','1501056206950001','$2y$10$ChKauSN2F2TTB7K5nsCcdup67ORpywoaLU/Szb6UslmumqTFEUxO.',3,1,'2026-09-04 02:12:10','2026-09-04 02:11:51','2026-09-04 02:12:10'),(23,'575f923','1471080409660022','$2y$10$CWmQX3ZUHpTKd7zaXVFR/OVaTAK77yOw9ZRG9bh0qoy7CTsGAWd9i',3,1,'2026-09-07 01:59:35','2026-09-07 01:58:39','2026-09-07 01:59:35'),(24,'6b8da18','1303064906830001','$2y$10$QVk0Izn3BPPb.GM.QlLlqu3g5NnNJ0QUze1Z4h9oGyQkfdNfrlKBi',3,1,'2026-09-07 02:40:14','2026-09-07 02:39:10','2026-09-07 02:40:14'),(25,'2b73571','1501176702080001','$2y$10$HM2K6p7GP65SWRHk8PlrXOFRGRZgNsKfclJEIYcDR.EvrVF54ySnW',3,1,'2026-09-07 02:53:22','2026-09-07 02:50:46','2026-09-07 02:53:22'),(26,'3425df3','1308135705070001','$2y$10$V1dAYnWhQd2SCk4uTE0cs.BFNbsXKnKW2IXBd1nwfnHHo25GHn21a',3,1,'2026-09-07 03:20:31','2026-09-07 03:19:48','2026-09-07 03:20:31'),(27,'6787173','137301531780001','$2y$10$VrE1E76aGHoU8iVcmLS2r.jfqSJU/fs6EZnO452PCvO7N4QfpaA7y',3,1,NULL,'2026-09-11 01:55:21','2026-09-11 01:55:21'),(30,'468d2f8','1371026003850006','$2y$10$/igR6AG8lG08Sguu.TrCyuhSoPVFa/HqNTkUVZu/V8Z7VyIqU7X0u',3,1,NULL,'2026-09-11 02:01:57','2026-09-11 02:01:57'),(31,'78042e8','1371025908050013','$2y$10$t4B9KrkNs9hQMniXW0.J0O5ogCIoA/0b8Xu7szJ7VVdobKrh74.9y',3,1,NULL,'2026-09-11 02:05:23','2026-09-11 02:05:23'),(32,'1a37a73','1305024112060003','$2y$10$TYJc2vOAVNcqb6wYV2s7.uBcumpEMmQhaaLs5w6tNquiDBxoQjjRi',3,1,'2026-09-11 02:30:53','2026-09-11 02:30:10','2026-09-11 02:30:53'),(33,'a86d06b','1301044303040005','$2y$10$Fl.AFb6GJxFTZyWpyQKL7eUwQ3OTvYSj/oJjkRJIgK98jMoOPch9e',3,1,'2026-09-11 02:34:39','2026-09-11 02:34:05','2026-09-11 02:34:39'),(34,'5067c49','1508096811850001','$2y$10$Fa3jYG2xyAlWz6gLLB4MYOhyLU3zI.zoY5nUd7BM1UhlDABC4.SDu',3,1,NULL,'2026-09-11 02:37:33','2026-09-11 02:37:33'),(35,'0ecf5a3','1371114104870018','$2y$10$HJ1JDhvDQRgEdMGcLOFq8esFPjEWdIgnipy7nkn8MgoXUVPe/tUom',3,1,'2026-09-11 02:43:18','2026-09-11 02:38:33','2026-09-11 02:43:18'),(36,'013dda9','1703141706000001','$2y$10$bQcUECp1eGfHg6Dx9xz28e80PPjTYTcVrb1fPAgL.ond75z82B7ne',3,1,'2026-09-11 02:43:52','2026-09-11 02:42:55','2026-09-11 02:43:52'),(37,'58c57cd','1377010510920004','$2y$10$GGx9gS.tIg8H0qrg32p2n.bxQENJeocdKsTnX/IUmXlpY.CGn./DG',3,1,'2026-09-11 02:46:52','2026-09-11 02:45:59','2026-09-11 02:46:52'),(38,'0bf55ea','1508012201090001','$2y$10$ujh/mxwMiaLNCQv0FauUsej4Sd1a/RBwV6.8uHn1epbLd76EZ3tfa',3,1,NULL,'2026-09-11 02:49:07','2026-09-11 02:49:07'),(39,'d64f7a6','1305056705830001','$2y$10$QmPsCDjfizMHxyMJMsVkYejH94RS9NGM.gRoFDHGgfPeb1BtjswZy',3,1,'2026-09-11 02:51:20','2026-09-11 02:50:45','2026-09-11 02:51:20'),(40,'ce919dc','1305165006950001','$2y$10$wo8C7qMUbhDOxHU2YopgC.5CWD1T1KQ7aiv.fz3GbAKJw29n5CMle',3,1,'2026-09-11 02:52:11','2026-09-11 02:50:58','2026-09-11 02:52:11'),(41,'cc67868','1501026808930002','$2y$10$EDWNSJFyF/GAFNmK1pFzweXXuCRsB.ezbdrng4CS2di7I7Kgnw2ua',3,1,'2026-09-11 02:51:49','2026-09-11 02:51:23','2026-09-11 02:51:49'),(42,'59cec2c','1501025009900004','$2y$10$ZCrcSwzwmtxLkOOlu/tcq.EXa3maLjhHq5T7zHoenPxrJnR0weaq2',3,1,NULL,'2026-09-11 02:59:45','2026-09-11 02:59:45'),(43,'51efae3','1408100504990001','$2y$10$D1/2d5MnuU/scpU7oN2u9.MhpTLS/DngDRpwAJc7QM2.yhbzE5Ln.',3,1,NULL,'2026-09-14 03:44:24','2026-09-14 03:44:24'),(44,'97e63de','1376011212700001','$2y$10$HHtP97bOQf5LPKeIN9lShemBEzOvu8Q3WJZR0n.OY6ZTy6NkQANn2',3,1,NULL,'2026-09-14 03:47:36','2026-09-14 03:47:36'),(45,'ab67b46','1302070610080001','$2y$10$vXiL12KM6p4ESJHDdoz4g.TOV/6KB25Kjz2xxTDg9dspz90yuatA.',3,1,NULL,'2026-09-14 03:49:20','2026-09-14 03:49:20'),(46,'b83235d','1312015509690002','$2y$10$r9CmFi6rsH3fijfdhygrq.9pT3/GyR87gm3IwH3COq0FcMjcz9.bO',3,1,NULL,'2026-09-14 03:54:37','2026-09-14 03:54:37'),(47,'baf5a83','1304025305720001','$2y$10$eTt8WEbqgAF2dTtFgO3C0u.CntCi0vQsXKKsH5lS.Ylt4r4zoBSf6',3,1,NULL,'2026-09-14 03:57:46','2026-09-14 03:57:46'),(48,'cd2aca7','1302191111750002','$2y$10$vcVja0saQItAKKGcElPYEuDvjXrPhIGF8Rb/fbKlPVpJUoMmL7qXy',3,1,NULL,'2026-09-14 04:22:57','2026-09-14 04:22:57'),(49,'0b496e8','1310034103780003','$2y$10$EXroUq2LGxaZyl8gS4uFDuWS5VjFxHFxbSkZj.MCFTYoNhLwORcia',3,1,NULL,'2026-09-14 04:25:19','2026-09-14 04:25:19'),(50,'4d6109a','1301045110670001','$2y$10$Uy2Fzp7K3Ev7VCH7vrRm6uice9zXCqtRxhAe8OJcKlivO/RC1FmHu',3,1,NULL,'2026-09-15 02:19:25','2026-09-15 02:19:25'),(60,'e229ecb','1304064909010001','$2y$10$gha9nDrBtcfmWYcdC2WnUe.wha5J8d9ry.wjslLAMF606niM9eoDC',3,1,NULL,'2026-09-15 02:44:37','2026-09-15 02:44:37'),(61,'87f94fd','1301030508720004','$2y$10$iYw1lqHqpJv2pLzerd1MEOE4JREn7ZxoiYReZzlE9VSBxKWso2oBO',3,1,NULL,'2026-09-15 02:49:52','2026-09-15 02:49:52'),(62,'d38f4ac','1371104711760004','$2y$10$lpoxALeJKbzjg1nSnmsaqOBJNN/Ciu33iK7lDlRNPoDKRf.ma3LwW',3,1,'2026-09-15 03:24:00','2026-09-15 03:23:05','2026-09-15 03:24:00'),(63,'eb4d342','3174198512250034','$2y$10$mS60lvTxHXONfBUAMFk5JenVpQ0pRx5Rp1kEht4lo9qi/0l00o3Xe',1,1,'2026-09-23 07:43:10','2026-09-23 07:41:27','2026-09-23 07:43:10'),(64,'c67d47f','8989','$2y$10$Z6zVMa128eXTBB3pW.F2R.2KYMtWET3sMKNMighsEHVnFPaN1P8i2',3,1,'2026-09-23 07:48:01','2026-09-23 07:47:50','2026-09-23 07:48:01');
/*!40000 ALTER TABLE `login_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patientKey` int NOT NULL,
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_patient_login_history_patientKey` (`patientKey`),
  KEY `idx_patient_login_history_logout_at` (`logout_at`),
  CONSTRAINT `fk_patient_login_history_patient` FOREIGN KEY (`patientKey`) REFERENCES `patients` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` VALUES (1,3,'2026-08-12 03:38:10','2026-08-12 03:47:12','104.22.80.137'),(2,4,'2026-08-31 01:01:16','2026-08-31 01:03:09','172.70.93.6'),(3,5,'2026-08-31 01:15:45',NULL,'162.158.88.135'),(4,6,'2026-08-31 02:14:57',NULL,'104.23.176.7'),(5,7,'2026-08-31 02:54:36',NULL,'104.22.176.3'),(6,8,'2026-08-31 02:57:58',NULL,'172.69.176.5'),(7,5,'2026-08-31 05:26:05','2026-08-31 05:26:56','104.22.66.245'),(8,5,'2026-08-31 05:27:07',NULL,'172.68.164.147'),(9,9,'2026-09-01 05:49:42',NULL,'104.22.176.3'),(10,10,'2026-09-01 05:52:20',NULL,'104.23.176.8'),(11,11,'2026-09-01 06:29:07',NULL,'172.71.124.159'),(12,12,'2026-09-02 02:10:02',NULL,'172.68.211.180'),(13,13,'2026-09-02 03:34:21',NULL,'172.71.124.4'),(14,9,'2026-09-02 03:42:33',NULL,'104.22.176.3'),(15,15,'2026-09-02 04:56:38',NULL,'172.71.152.50'),(16,16,'2026-09-02 08:58:51',NULL,'172.70.188.18'),(17,17,'2026-09-03 01:21:42',NULL,'104.22.176.3'),(18,18,'2026-09-03 02:32:53',NULL,'172.70.93.6'),(19,9,'2026-09-03 03:20:24',NULL,'172.70.208.127'),(20,19,'2026-09-04 01:32:24',NULL,'172.69.176.4'),(21,20,'2026-09-04 01:52:11',NULL,'172.69.176.5'),(22,21,'2026-09-04 02:07:25',NULL,'172.68.164.147'),(23,22,'2026-09-04 02:12:10',NULL,'104.22.66.251'),(24,23,'2026-09-07 01:59:35',NULL,'172.69.165.73'),(25,24,'2026-09-07 02:40:14',NULL,'162.158.193.73'),(26,25,'2026-09-07 02:53:22',NULL,'104.22.176.3'),(27,26,'2026-09-07 03:20:31',NULL,'104.22.176.3'),(28,30,'2026-09-11 02:30:56',NULL,'162.158.108.32'),(29,31,'2026-09-11 02:34:39',NULL,'104.22.176.3'),(30,33,'2026-09-11 02:43:19',NULL,'162.158.108.32'),(31,34,'2026-09-11 02:43:53',NULL,'162.158.190.3'),(32,35,'2026-09-11 02:46:52',NULL,'172.69.166.55'),(33,37,'2026-09-11 02:51:20',NULL,'172.71.124.158'),(34,39,'2026-09-11 02:51:49',NULL,'172.71.219.66'),(35,38,'2026-09-11 02:52:11',NULL,'162.158.88.135'),(36,6,'2026-09-11 12:54:27',NULL,'104.22.80.137'),(37,51,'2026-09-15 03:24:00',NULL,'162.159.98.14'),(38,52,'2026-09-23 07:48:01',NULL,'104.22.80.137');
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `sorted` tinyint NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Hub','hub',1,1,1,'2026-06-07 06:34:00','2026-06-07 06:34:00',NULL),(2,'Blog','blog',2,1,1,'2026-06-07 06:34:00','2026-06-07 06:34:00',NULL),(3,'Inti','inti',3,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(4,'Profile','profile',4,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(5,'Patient','patient',5,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(6,'App','app',6,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patientkeluhanview`
--

DROP TABLE IF EXISTS `patientkeluhanview`;
/*!50001 DROP VIEW IF EXISTS `patientkeluhanview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientkeluhanview` AS SELECT 
 1 AS `id`,
 1 AS `userKey`,
 1 AS `mrn`,
 1 AS `nik`,
 1 AS `fullname`,
 1 AS `siklus`,
 1 AS `last_session`,
 1 AS `mukositis`,
 1 AS `kelelahan`,
 1 AS `mual`,
 1 AS `muntah`,
 1 AS `created`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(7) NOT NULL,
  `roleKey` int NOT NULL,
  `mrn` varchar(9) DEFAULT NULL,
  `nik` varchar(16) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Pria','Wanita') NOT NULL,
  `alamat` text NOT NULL,
  `urlfiles` text,
  `isactive` tinyint(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `nik` (`nik`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_patients_roleKey` (`roleKey`),
  CONSTRAINT `fk_patients_role` FOREIGN KEY (`roleKey`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'ebd30c2',3,'01234567','4526987473469121','Yura Puspita Sari','mailgas@gmail.com','081234567890','2010-01-01','Wanita','Jalan Petapa',NULL,1,'2026-07-13 04:31:29','2026-07-18 08:31:52',NULL),(2,'f89487d',3,NULL,'1234123412341234','Pain','pain@gmail.com','0898374721','1945-08-17','Pria','Desa Hujan','pain.jpg',1,'2026-07-27 04:04:02','2026-07-28 03:58:15',NULL),(3,'59dc3ba',3,NULL,'1231234564567890','Budiman Santoso','budiman@gmail.com','081234567890','1945-08-17','Pria','Jalan Jalan',NULL,1,'2026-08-12 03:38:00','2026-08-12 03:38:00',NULL),(4,'2b18c35',3,NULL,'3174011008010005','Peter Parker','peterparker@gmail.com','081234567890','1945-08-17','Pria','California',NULL,1,'2026-08-31 01:00:54','2026-08-31 01:00:54',NULL),(5,'a06a866',3,NULL,'3217116909920004','Siti Herlina Ali Sopiah','asitiherlina@gmail.com','081210124745','1992-09-29','Wanita','Padang',NULL,1,'2026-08-31 01:15:25','2026-08-31 01:15:25',NULL),(6,'9475ba6',3,NULL,'1372011112990001','Muhammad afdhal','muhammadafdal5436@gmail.com','088267089642','1999-12-11','Pria','Solok ',NULL,1,'2026-08-31 02:14:35','2026-08-31 02:14:35',NULL),(7,'25474c7',3,NULL,'1308141303010002','Mario Resta','restario13@gmail.com','082268609088','2001-03-13','Pria','Payakumbuh ',NULL,1,'2026-08-31 02:54:12','2026-08-31 02:54:12',NULL),(8,'c3028b7',3,NULL,'1302100109050002','Putra Erlangga','putraaerlanggaa28@gmail.com','083171596074','2005-09-01','Pria','Simpang rombio',NULL,1,'2026-08-31 02:56:52','2026-08-31 02:56:52',NULL),(9,'3000631',3,NULL,'1304054905900001','Nani Yulia bs','naniyuliabs@gmail.com','082385568818','1990-05-09','Wanita','Payakumbuh ',NULL,1,'2026-09-01 05:47:15','2026-09-01 05:47:15',NULL),(10,'f4eb221',3,NULL,'3201025107890012','Nidia melati','nidya323@gmail.com','082286902446','1989-07-11','Wanita','Sako batu hampar selatan kec.koto xI tarusan pesisir selatan',NULL,1,'2026-09-01 05:51:59','2026-09-01 05:51:59',NULL),(11,'9092d0b',3,NULL,'1310015201010002','Fazillah','fazillahabhizar@gmail.com','085668069912','2001-01-12','Wanita','Dharmasraya',NULL,1,'2026-09-01 06:27:45','2026-09-01 06:27:45',NULL),(12,'6b3deb3',3,NULL,'1306046606920003','Indah Putri Yuni','indahputriyuni144@gmail.com','081267121961','1992-06-26','Wanita','Komp. Puri Filano Asri Blok D 1, Kubu Dalam, Parak Karakah, Padang Timur, Kota Padang',NULL,1,'2026-09-02 02:09:16','2026-09-02 02:09:16',NULL),(13,'10f8b77',3,NULL,'1371014901860005','arfika dewi ','ekadewibimaikhsan@gmail.com','085240529300','1986-01-09','Wanita','Padang ',NULL,1,'2026-09-02 03:33:30','2026-09-02 03:33:30',NULL),(14,'f5d63cd',3,NULL,'321513551083003','Erawati','erawati@gmail.com','081291144163','1983-10-15','Wanita','Pesisir',NULL,1,'2026-09-02 03:34:28','2026-09-02 03:34:28',NULL),(15,'2711b07',3,NULL,'1572026001860002','Mira ','umar123yadi@gmail.com','082251854463','1986-01-20','Wanita','Kerinci',NULL,1,'2026-09-02 04:56:06','2026-09-02 04:56:06',NULL),(16,'0f4811c',3,NULL,'1301044910980001','Oktaviani akbar','dep367612@gmail.com','081275740229','1998-10-09','Wanita','Padang',NULL,1,'2026-09-02 08:50:58','2026-09-02 08:50:58',NULL),(17,'fb9b070',3,NULL,'1305047006600004','Alam Sori','dafitri045@gmail.com','089529483283','1960-06-30','Wanita','Sikudarak, Kapalo Hilalang, 2x11 Kayu Tanam',NULL,1,'2026-09-03 01:20:35','2026-09-03 01:20:35',NULL),(18,'ae23916',3,NULL,'1302074204870004','MICE','aristaelokbgt@gmail.com','085121234997','1987-04-02','Wanita','Solok',NULL,1,'2026-09-03 02:30:44','2026-09-03 02:30:44',NULL),(19,'a68167c',3,NULL,'1371112810790007','zuliorahman','zuliorahman99@gmail.com','085272586062','1979-10-28','Pria','Kp.jambak, lubuk buaya',NULL,1,'2026-09-04 01:31:49','2026-09-04 01:31:49',NULL),(20,'0eef9f0',3,NULL,'1305150612950001','Rozisyafri','ladiangmaja3@gmail.com','082178655757','1995-12-06','Pria','Padang bukit',NULL,1,'2026-09-04 01:50:33','2026-09-04 01:50:33',NULL),(21,'f4bd3cb',3,NULL,'1371066312000009','Velya Puti Seruni','cecelseruni23bb@gmail.com','083194011860','2000-12-23','Wanita','Kubu dalam parak karakah',NULL,1,'2026-09-04 02:06:34','2026-09-04 02:06:34',NULL),(22,'0ac0ecb',3,NULL,'1501056206950001','Anggun susantri','anggunsusantri22@gmail.com','082278588500','1995-06-22','Wanita','Kerinci',NULL,1,'2026-09-04 02:11:51','2026-09-04 02:11:51',NULL),(23,'575f923',3,NULL,'1471080409660022','Iswandi ','iswandirosman@gmail.com','082360630006','2026-09-04','Pria','Alang lawas 4 no 29 Padang ',NULL,1,'2026-09-07 01:58:39','2026-09-07 01:58:39',NULL),(24,'6b8da18',3,NULL,'1303064906830001','Yanti ','arin34750@gmail.com','082260468210','1983-06-02','Wanita','02.06.1983',NULL,1,'2026-09-07 02:39:10','2026-09-07 02:39:10',NULL),(25,'2b73571',3,NULL,'1501176702080001','Denia Febria','deniafebria1@gmail.com','082282690518','2008-02-27','Wanita','Kerinci ',NULL,1,'2026-09-07 02:50:46','2026-09-07 02:50:46',NULL),(26,'3425df3',3,NULL,'1308135705070001','Meila Fatma','larafatmameila@gmail.com','082217351600','2007-05-17','Wanita','Ladang panjang',NULL,1,'2026-09-07 03:19:48','2026-09-07 03:19:48',NULL),(27,'6787173',3,NULL,'137301531780001','Dina yulia','dinayulia22@gmail.com','082166034122','1978-11-13','Wanita','andalas ',NULL,1,'2026-09-11 01:55:21','2026-09-11 01:55:21',NULL),(28,'468d2f8',3,NULL,'1371026003850006','Indrawati','indrawati10@gmail.com','082160853697','1985-03-20','Pria','purus',NULL,1,'2026-09-11 02:01:57','2026-09-11 02:01:57',NULL),(29,'78042e8',3,NULL,'1371025908050013','Shinta','sinta09@gmail.com','083136855566','1985-08-19','Wanita','bandar buat',NULL,1,'2026-09-11 02:05:23','2026-09-11 02:05:23',NULL),(30,'1a37a73',3,NULL,'1305024112060003','Zahwa erianto','zahwaeriyanto2006@gmail.com','083181893102','2006-12-01','Wanita','DUSUN BARU KASAI',NULL,1,'2026-09-11 02:30:10','2026-09-11 02:30:10',NULL),(31,'a86d06b',3,NULL,'1301044303040005','Abella syelfira','syelfiraabella@gmail.com','083165723144','2004-03-03','Wanita','Koto tuo, kec. Batang kapas. Kab pesisir selatan',NULL,1,'2026-09-11 02:34:05','2026-09-11 02:34:05',NULL),(32,'5067c49',3,NULL,'1508096811850001','Suryani','suryani@gmail.com','083136855566','1983-11-28','Wanita','muaro bungo',NULL,1,'2026-09-11 02:37:33','2026-09-11 02:37:33',NULL),(33,'0ecf5a3',3,NULL,'1371114104870018','Shinta Apsari','ShintaApsari1987@gmail.com','085374883369','1987-04-01','Wanita','Padang',NULL,1,'2026-09-11 02:38:33','2026-09-11 02:38:33',NULL),(34,'013dda9',3,NULL,'1703141706000001','M. Reffi Pasha','mreffipasha7080@gmail.com','081268990710','2000-06-17','Pria','Kota bani',NULL,1,'2026-09-11 02:42:55','2026-09-11 02:42:55',NULL),(35,'58c57cd',3,NULL,'1377010510920004','oxsivo yandra','yoxsivo@gmail.com','081267731590','1992-10-05','Pria','kota pariaman',NULL,1,'2026-09-11 02:45:59','2026-09-11 02:45:59',NULL),(36,'0bf55ea',3,NULL,'1508012201090001','igo saniawan','igosaniawan@gmail.com','082160853697','2009-02-22','Pria','muaro bungo',NULL,1,'2026-09-11 02:49:07','2026-09-11 02:49:07',NULL),(37,'d64f7a6',3,NULL,'1305056705830001','Reni Nila Sari','nilasarirenii3694@gmail.com','085274014503','1983-05-27','Wanita','Padang',NULL,1,'2026-09-11 02:50:45','2026-09-11 02:50:45',NULL),(38,'ce919dc',3,NULL,'1305165006950001','Alvina Anggraini','alvinaaggraini@gmail.com','082385069515','1995-06-10','Wanita','Tungka lubuak aro, tandikek',NULL,1,'2026-09-11 02:50:58','2026-09-11 02:50:58',NULL),(39,'cc67868',3,NULL,'1501026808930002','Nirwana','zehanm820@gmail.com','085142783193','1993-08-28','Wanita','Jambi',NULL,1,'2026-09-11 02:51:23','2026-09-11 02:51:23',NULL),(40,'59cec2c',3,NULL,'1501025009900004','Nuriman','nurimanumar43@gmail.com','081367253667','1990-09-10','Wanita','Jambi',NULL,1,'2026-09-11 02:59:45','2026-09-11 02:59:45',NULL),(41,'51efae3',3,NULL,'1408100504990001','rinaldy syamboja tanjung','rinaldyranjung04@gmail.com','081256389124','1999-04-05','Pria','bangko',NULL,1,'2026-09-14 03:44:24','2026-09-14 03:44:24',NULL),(42,'97e63de',3,NULL,'1376011212700001','deni permana','permanadeniii@gmail.com','083186730642','1970-12-12','Pria','air pacah',NULL,1,'2026-09-14 03:47:36','2026-09-14 03:47:36',NULL),(43,'ab67b46',3,NULL,'1302070610080001','aurel permana','aurelzxyprmn@gmail.com','08125264730','2008-01-06','Pria','solok, cupak',NULL,1,'2026-09-14 03:49:20','2026-09-14 03:49:20',NULL),(44,'b83235d',3,NULL,'1312015509690002','ani enzita','anienzitaa09@gmail.com','081266743827','1969-09-05','Wanita','parak karakah kubu dalam',NULL,1,'2026-09-14 03:54:37','2026-09-14 03:54:37',NULL),(45,'baf5a83',3,NULL,'1304025305720001','sakinah','sakinahsari72@gmail.com','083850724476','1972-05-13','Wanita','berok nipah',NULL,1,'2026-09-14 03:57:46','2026-09-14 03:57:46',NULL),(46,'cd2aca7',3,NULL,'1302191111750002','novembli','novembliansyh75@gmail.com','08318452235','1975-11-11','Pria','bengkulu',NULL,1,'2026-09-14 04:22:57','2026-09-14 04:22:57',NULL),(47,'0b496e8',3,NULL,'1310034103780003','asrita','asritasuliswati@gmail.com','08122787466','1978-03-01','Wanita','jln gang malayu',NULL,1,'2026-09-14 04:25:19','2026-09-14 04:25:19',NULL),(48,'4d6109a',3,NULL,'1301045110670001','Yusneti','donaputri733@gmail.com','082391731445','1967-10-11','Wanita','Pesisir selatan',NULL,1,'2026-09-15 02:19:25','2026-09-15 02:19:25',NULL),(49,'e229ecb',3,NULL,'1304064909010001','Dinda Tika azilia','tindatikaazilia@gmail.com','082286339210','2001-09-09','Wanita','Lintau',NULL,1,'2026-09-15 02:44:37','2026-09-15 02:44:37',NULL),(50,'87f94fd',3,NULL,'1301030508720004','Yusmarni','yusmarniarsp@gmail.com','083187764531','1972-08-10','Wanita','padang',NULL,1,'2026-09-15 02:49:52','2026-09-15 02:49:52',NULL),(51,'d38f4ac',3,NULL,'1371104711760004','Siti Herlina Ali Sopiah','najlamahfuzahbusran@gmail.com','081363432776','1976-11-07','Wanita','Padang',NULL,1,'2026-09-15 03:23:05','2026-09-15 03:23:05',NULL),(52,'c67d47f',3,NULL,'8989','Unta','unta@gmail.com','081234567890','1945-08-17','Pria','Gurun Pasir',NULL,1,'2026-09-23 07:47:50','2026-09-23 07:47:50',NULL);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `moduleKey` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `readable` tinyint(1) NOT NULL DEFAULT '1',
  `creatable` tinyint(1) NOT NULL DEFAULT '1',
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_module_nama` (`moduleKey`,`nama`),
  KEY `idx_permissions_moduleKey` (`moduleKey`),
  CONSTRAINT `fk_permissions_module` FOREIGN KEY (`moduleKey`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,1,'Hub','hub',1,1,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(2,2,'Blog','blog',1,1,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(3,3,'Inti','inti',1,1,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(4,4,'Profile','profile',1,1,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(5,5,'Patient','patient',1,1,1,1,'2026-06-30 02:38:15','2026-06-30 02:38:15',NULL),(6,6,'App','app',1,1,1,1,'2026-06-30 02:38:16','2026-06-30 02:38:16',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleKey` int NOT NULL,
  `permissionKey` int NOT NULL,
  `readable` tinyint(1) NOT NULL DEFAULT '0',
  `creatable` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `deletable` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_role_permission` (`roleKey`,`permissionKey`),
  KEY `fk_privileges_permission` (`permissionKey`),
  CONSTRAINT `fk_privileges_permission` FOREIGN KEY (`permissionKey`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_privileges_role` FOREIGN KEY (`roleKey`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `riwayatlogin`
--

DROP TABLE IF EXISTS `riwayatlogin`;
/*!50001 DROP VIEW IF EXISTS `riwayatlogin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `riwayatlogin` AS SELECT 
 1 AS `id`,
 1 AS `patientKey`,
 1 AS `fullname`,
 1 AS `total_login`,
 1 AS `first_login`,
 1 AS `last_login`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `rolelimit`
--

DROP TABLE IF EXISTS `rolelimit`;
/*!50001 DROP VIEW IF EXISTS `rolelimit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rolelimit` AS SELECT 
 1 AS `privilegeKey`,
 1 AS `roleKey`,
 1 AS `readable`,
 1 AS `creatable`,
 1 AS `editable`,
 1 AS `deletable`,
 1 AS `permissionKey`,
 1 AS `nama`,
 1 AS `label`,
 1 AS `moduleKey`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','superadmin',1,1,'2026-06-07 06:34:00','2026-06-07 06:34:00',NULL),(2,'Perawat','perawat',1,1,'2026-06-07 06:34:00','2026-06-07 06:34:00',NULL),(3,'Patient','patient',1,1,'2026-06-07 06:34:00','2026-06-07 06:34:00',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0acd38an5eqjhb0nlb3d4sckams1tats','162.158.88.134',1788147276,_binary '__ci_last_regenerate|i:1788147276;historyKey|i:5;id|s:1:\"7\";kode|s:7:\"25474c7\";usernik|s:16:\"1308141303010002\";name|s:11:\"Mario Resta\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('0b3m98upcd4sps4msj7a88f4oeh29vep','172.71.152.8',1789628629,_binary '__ci_last_regenerate|i:1789628629;'),('0o8k1jph6ligmm6h80vpriqcuteov6qp','162.158.163.97',1789438858,_binary '__ci_last_regenerate|i:1789438858;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"new\";}'),('0ra3tpcbq15id9ectp4r49ocjhl4lvva','104.22.176.3',1788513761,_binary '__ci_last_regenerate|i:1788513761;'),('0tinakrru0r0kjct6jcs32oepnn5u1c9','162.158.88.134',1788138966,_binary '__ci_last_regenerate|i:1788138802;historyKey|i:3;id|s:1:\"5\";kode|s:7:\"a06a866\";usernik|s:16:\"3217116909920004\";name|s:23:\"Siti Herlina Ali Sopiah\";roleKey|s:1:\"3\";islogin|b:1;'),('0tnjp0tsbe0gopfu08ag10p33lt319g9','172.68.225.144',1788748831,_binary '__ci_last_regenerate|i:1788748750;historyKey|i:25;id|s:2:\"24\";kode|s:7:\"6b8da18\";usernik|s:16:\"1303064906830001\";name|s:6:\"Yanti \";roleKey|s:1:\"3\";islogin|b:1;'),('11vvrl88t8n04g12nd320276qosk556e','172.71.152.49',1788243833,_binary '__ci_last_regenerate|i:1788243833;'),('172cpua5odrndegh73ha5b6to3uffhf7','162.158.163.97',1789097147,_binary '__ci_last_regenerate|i:1789097146;historyKey|i:30;id|s:2:\"33\";kode|s:7:\"0ecf5a3\";usernik|s:16:\"1371114104870018\";name|s:13:\"Shinta Apsari\";roleKey|s:1:\"3\";islogin|b:1;'),('1qgc8edd31dc2qmsorvteaddk7f09uie','162.158.88.134',1788488813,_binary '__ci_last_regenerate|i:1788488813;historyKey|i:23;id|s:2:\"22\";kode|s:7:\"0ac0ecb\";usernik|s:16:\"1501056206950001\";name|s:15:\"Anggun susantri\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"new\";}'),('1rl2mtutlopq8flri182jaf32n05hk73','162.159.98.15',1789453264,_binary '__ci_last_regenerate|i:1789453263;redirect_url|s:56:\"https://kelpin.my.id/chemonitor/index.php/inti/detail/13\";'),('1ueqq70usjjggdjhtfu2so19tn2721bm','172.68.164.147',1789440277,_binary '__ci_last_regenerate|i:1789440277;'),('25teg5bkpedmi4bejkakojbvp6hbjelb','104.22.176.3',1788144469,_binary '__ci_last_regenerate|i:1788144469;'),('2au078rd7k86ui314ssc5e5958d5aiqs','172.68.164.147',1788320200,_binary '__ci_last_regenerate|i:1788320200;historyKey|i:13;id|s:2:\"13\";kode|s:7:\"10f8b77\";usernik|s:16:\"1371014901860005\";name|s:12:\"arfika dewi \";roleKey|s:1:\"3\";islogin|b:1;'),('2c94i19v7t80kj9sqramlv6712ebn4cj','104.22.176.3',1788402720,_binary '__ci_last_regenerate|i:1788402676;'),('2icr9h3lp8490tiftb6f4mos7vo44kus','108.162.226.252',1788144416,_binary '__ci_last_regenerate|i:1788144416;historyKey|i:4;id|s:1:\"6\";kode|s:7:\"9475ba6\";usernik|s:16:\"1372011112990001\";name|s:15:\"Muhammad afdhal\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:16:\"Selamat Datang !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('33958micme3gudac18dbf162gc0segu7','104.22.66.115',1788316796,_binary '__ci_last_regenerate|i:1788316796;'),('3fs4uubq027a2e810baq22617t4sg8a0','172.71.215.30',1789095306,_binary '__ci_last_regenerate|i:1789095281;historyKey|i:32;id|s:2:\"35\";kode|s:7:\"58c57cd\";usernik|s:16:\"1377010510920004\";name|s:13:\"oxsivo yandra\";roleKey|s:1:\"3\";islogin|b:1;'),('41jhq12mfevq8gqf07u16lsav5k5v04j','172.71.124.5',1788320446,_binary '__ci_last_regenerate|i:1788320200;historyKey|i:13;id|s:2:\"13\";kode|s:7:\"10f8b77\";usernik|s:16:\"1371014901860005\";name|s:12:\"arfika dewi \";roleKey|s:1:\"3\";islogin|b:1;'),('46d9nqdoknd6grm91n9311fss4o9b1vo','162.158.108.32',1788486633,_binary '__ci_last_regenerate|i:1788486633;'),('4eqaa21q9qto5p31c5hqjnodftjueqdu','104.22.176.3',1788399084,_binary '__ci_last_regenerate|i:1788399070;'),('4g41jful0tkp3p347gc8819hldrkgeru','104.22.160.61',1789454196,_binary '__ci_last_regenerate|i:1789454196;'),('4j5g15v228cuemk0p61nmu1spem86a1o','172.69.176.5',1789355827,_binary '__ci_last_regenerate|i:1789355796;'),('55rfhpchft20s0dptc8iikmmsmke6ab1','172.69.166.54',1789094524,_binary '__ci_last_regenerate|i:1789094524;'),('5cj4v35ru8lqjq3bvhkbmtnq54a4us80','172.71.218.148',1788746319,_binary '__ci_last_regenerate|i:1788746319;'),('5d06lf33qo1jptp0p28q0n8gjnoeg0a7','162.158.88.134',1788521878,_binary '__ci_last_regenerate|i:1788521878;'),('5ea0n207sidkg6rplf5o7kgu37887vif','172.71.219.65',1788242095,_binary '__ci_last_regenerate|i:1788242095;redirect_url|s:49:\"https://kelpin.my.id/chemonitor/index.php/profile\";'),('5lq55t81ep0873t48djlu8q2lm4e2fmm','172.71.152.49',1788145338,_binary '__ci_last_regenerate|i:1788145338;historyKey|i:6;id|s:1:\"8\";kode|s:7:\"c3028b7\";usernik|s:16:\"1302100109050002\";name|s:14:\"Putra Erlangga\";roleKey|s:1:\"3\";islogin|b:1;'),('5t5slgaaerm0q3st455cof4631c0rvdh','104.22.176.3',1789094415,_binary '__ci_last_regenerate|i:1789094415;historyKey|i:29;id|s:2:\"31\";kode|s:7:\"a86d06b\";usernik|s:16:\"1301044303040005\";name|s:15:\"Abella syelfira\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:16:\"Selamat Datang !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('63hajsnuddqfg7g256scavmdpfel0q3k','104.22.66.251',1788314082,_binary '__ci_last_regenerate|i:1788314073;'),('653s0o8giqj1finumeat3l5f6gbpoq4t','172.71.124.159',1789439177,_binary '__ci_last_regenerate|i:1789439177;'),('6alqpugp5gfb80if598m39kukmcktd2v','172.71.214.190',1788488154,_binary '__ci_last_regenerate|i:1788488154;'),('6clo7e4e80qks8d1ocroaehlc53ig34p','104.23.175.107',1789091774,_binary '__ci_last_regenerate|i:1789091774;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('6cn607nhpci7tp4309itj1t71pdfevpq','104.22.176.3',1788242726,_binary '__ci_last_regenerate|i:1788242726;historyKey|i:9;id|s:1:\"9\";kode|s:7:\"3000631\";usernik|s:16:\"1304054905900001\";name|s:13:\"Nani Yulia bs\";roleKey|s:1:\"3\";islogin|b:1;'),('73242f861aagtb09p7sn3oesiv5r868t','172.68.164.147',1788095980,_binary '__ci_last_regenerate|i:1788095980;'),('7d137sh76cmmenjaevoc6e37m4iajp9v','172.69.176.4',1788145011,_binary '__ci_last_regenerate|i:1788145011;'),('7legmogvurj5ron55c7v9eolonciqmsc','104.23.176.7',1788487134,_binary '__ci_last_regenerate|i:1788487134;historyKey|i:21;id|s:2:\"20\";kode|s:7:\"0eef9f0\";usernik|s:16:\"1305150612950001\";name|s:10:\"Rozisyafri\";roleKey|s:1:\"3\";islogin|b:1;'),('7r8g1nnf79k2r6kmvahdjsu9340b19qp','172.70.93.7',1788241923,_binary '__ci_last_regenerate|i:1788241923;'),('7rks8ni7bg8tepp7abm0pd4c317jjd00','162.158.163.97',1788241781,_binary '__ci_last_regenerate|i:1788241781;'),('7ubri6ucdmrufa7cjh3eab5aepaqbt7g','172.71.124.5',1788320068,_binary '__ci_last_regenerate|i:1788320068;'),('86vg0jnlhnfnke0v7s9cj60h49qpi1p6','172.68.164.146',1788511971,_binary '__ci_last_regenerate|i:1788511970;redirect_url|s:56:\"https://kelpin.my.id/chemonitor/index.php/inti/detail/10\";'),('8fnr6ls697ukm9lqg710gip45o9fc04l','172.71.214.190',1788241466,_binary '__ci_last_regenerate|i:1788241466;'),('8i0un75bjut11m0ob0usrcpd42gkphae','172.68.164.146',1789094950,_binary '__ci_last_regenerate|i:1789094822;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('8khekj42k6ahqqnoptiop8njc4l2h7ej','104.22.176.3',1788749857,_binary '__ci_last_regenerate|i:1788749857;historyKey|i:26;id|s:2:\"25\";kode|s:7:\"2b73571\";usernik|s:16:\"1501176702080001\";name|s:12:\"Denia Febria\";roleKey|s:1:\"3\";islogin|b:1;'),('8nvonti5rtm7u7bkketmjl1cfh16f4s5','172.71.214.190',1788488134,_binary '__ci_last_regenerate|i:1788488130;historyKey|i:22;id|s:2:\"21\";kode|s:7:\"f4bd3cb\";usernik|s:16:\"1371066312000009\";name|s:17:\"Velya Puti Seruni\";roleKey|s:1:\"3\";islogin|b:1;'),('8rlttogbkgtsf7jpekfl9r0fub4fonrq','172.70.100.108',1788142503,_binary '__ci_last_regenerate|i:1788142503;'),('9ba7al5p20vuiprnvarabmsg72o20sso','172.71.152.50',1788144462,_binary '__ci_last_regenerate|i:1788144462;'),('9haoviak2b7sr38e2gt3jv8fklduqs65','172.68.164.147',1788398882,_binary '__ci_last_regenerate|i:1788398882;historyKey|i:17;id|s:2:\"17\";kode|s:7:\"fb9b070\";usernik|s:16:\"1305047006600004\";name|s:9:\"Alam Sori\";roleKey|s:1:\"3\";islogin|b:1;'),('9jq3e29ivpd69jdj3nkvqlrvj5t6a4bu','104.23.175.89',1788325121,_binary '__ci_last_regenerate|i:1788324855;historyKey|i:15;id|s:2:\"15\";kode|s:7:\"2711b07\";usernik|s:16:\"1572026001860002\";name|s:5:\"Mira \";roleKey|s:1:\"3\";islogin|b:1;'),('9o8inep3830lbtkuhd4ricmiv0iaherj','172.69.176.4',1788164986,_binary '__ci_last_regenerate|i:1788164986;redirect_url|s:49:\"https://kelpin.my.id/chemonitor/index.php/keluhan\";'),('9pbne395ltj1714nle8tmvm1vpvjl5tt','172.69.176.4',1788751795,_binary '__ci_last_regenerate|i:1788751621;historyKey|i:27;id|s:2:\"26\";kode|s:7:\"3425df3\";usernik|s:16:\"1308135705070001\";name|s:11:\"Meila Fatma\";roleKey|s:1:\"3\";islogin|b:1;'),('a1ejg17l7unc7b2l7n0s20no87ns7r41','104.22.66.115',1788314849,_binary '__ci_last_regenerate|i:1788314849;'),('a7jvssbeeqkvij1s1fq4ppm8q0tv4iig','172.71.152.7',1789443820,_binary '__ci_last_regenerate|i:1789443820;historyKey|i:37;id|s:2:\"51\";kode|s:7:\"d38f4ac\";usernik|s:16:\"1371104711760004\";name|s:23:\"Siti Herlina Ali Sopiah\";roleKey|s:1:\"3\";islogin|b:1;'),('advslrp4uaec86bcbdi86o0sf0qk1n7s','104.22.80.137',1790149746,_binary '__ci_last_regenerate|i:1790149681;login_attempts_0138023215122dd9ed71f0a2e1b47051|a:2:{s:5:\"count\";i:3;s:12:\"last_attempt\";i:1790149585;}historyKey|i:38;id|s:2:\"52\";kode|s:7:\"c67d47f\";usernik|s:4:\"8989\";name|s:4:\"Unta\";roleKey|s:1:\"3\";islogin|b:1;'),('afvi794v586k663a9hqqk1pkj7o0vf7a','172.70.93.7',1788402772,_binary '__ci_last_regenerate|i:1788402772;alert-error|s:46:\"Login Gagal, Pastikan NIK dan Password Benar !\";__ci_vars|a:1:{s:11:\"alert-error\";s:3:\"old\";}'),('ak7a41fupqp7ic3edbenr6l5bks7n896','172.71.124.159',1788487329,_binary '__ci_last_regenerate|i:1788487134;historyKey|i:21;id|s:2:\"20\";kode|s:7:\"0eef9f0\";usernik|s:16:\"1305150612950001\";name|s:10:\"Rozisyafri\";roleKey|s:1:\"3\";islogin|b:1;'),('alcqab8egc71hglf2hgaagik7rsg0r5v','172.71.152.50',1788403160,_binary '__ci_last_regenerate|i:1788403160;historyKey|i:17;id|s:2:\"17\";kode|s:7:\"fb9b070\";usernik|s:16:\"1305047006600004\";name|s:9:\"Alam Sori\";roleKey|s:1:\"3\";islogin|b:1;'),('am6hff3ujur0jj4fsskr62ifnun80n1q','162.159.98.15',1788746543,_binary '__ci_last_regenerate|i:1788746543;'),('b5bhvcbupn4fm5daei28gov6jt7fh8t9','162.158.170.183',1789439177,_binary '__ci_last_regenerate|i:1789439177;'),('b95c3nq72modjqid9qg2kg2hui0eph4e','162.158.108.33',1789094622,_binary '__ci_last_regenerate|i:1789094622;historyKey|i:30;id|s:2:\"33\";kode|s:7:\"0ecf5a3\";usernik|s:16:\"1371114104870018\";name|s:13:\"Shinta Apsari\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:16:\"Selamat Datang !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('bj47qngv1gvhv33g3677jsot4o90kqoe','172.70.188.18',1788339561,_binary '__ci_last_regenerate|i:1788339530;historyKey|i:16;id|s:2:\"16\";kode|s:7:\"0f4811c\";usernik|s:16:\"1301044910980001\";name|s:15:\"Oktaviani akbar\";roleKey|s:1:\"3\";islogin|b:1;'),('bmnf1i8d6626r18rdn3n16kcs1c7bgur','172.70.208.126',1788148912,_binary '__ci_last_regenerate|i:1788148912;'),('bph5sq4rnc2ik8j8jmcne940rikcp6al','172.70.208.126',1788148953,_binary '__ci_last_regenerate|i:1788148953;'),('bq6l61rhihp699dui11ol3mbentkel1g','172.71.81.110',1788142501,_binary '__ci_last_regenerate|i:1788142501;'),('c31cbp8couorp4l9fcrfhnfcind66sd9','104.22.66.245',1788746440,_binary '__ci_last_regenerate|i:1788746440;'),('c5obv0fm2o0dq6u68aoum24qu6m6oi6s','162.158.163.98',1788145273,_binary '__ci_last_regenerate|i:1788145272;redirect_url|s:53:\"https://kelpin.my.id/chemonitor/index.php/inti/insert\";'),('c5qhr5g8mcsr687kea7ojf9isv8hefnq','172.71.219.66',1789095441,_binary '__ci_last_regenerate|i:1789095441;historyKey|i:34;id|s:2:\"39\";kode|s:7:\"cc67868\";usernik|s:16:\"1501026808930002\";name|s:7:\"Nirwana\";roleKey|s:1:\"3\";islogin|b:1;'),('clkrcc5ln5e2tggv0anl4q7bk5ajdtgi','172.70.93.6',1788402811,_binary '__ci_last_regenerate|i:1788402772;historyKey|i:18;id|s:2:\"18\";kode|s:7:\"ae23916\";usernik|s:16:\"1302074204870004\";name|s:4:\"MICE\";roleKey|s:1:\"3\";islogin|b:1;'),('cs49fhacmaavujpetbdmv1sa9g33okja','172.71.81.209',1788142500,_binary '__ci_last_regenerate|i:1788142500;redirect_url|s:46:\"https://kelpin.my.id/chemonitor/index.php/inti\";'),('cu8o7it4idksaqq96uqjs9reg2igj4e1','104.23.175.107',1789122436,_binary '__ci_last_regenerate|i:1789122436;redirect_url|s:56:\"https://kelpin.my.id/chemonitor/index.php/inti/detail/14\";'),('d09fek5kin3sjolbjhib2k0fdb5gmofb','172.69.176.4',1788487897,_binary '__ci_last_regenerate|i:1788487896;historyKey|i:20;id|s:2:\"19\";kode|s:7:\"a68167c\";usernik|s:16:\"1371112810790007\";name|s:11:\"zuliorahman\";roleKey|s:1:\"3\";islogin|b:1;'),('dfu3kjh136lc96v8c4r31ed2ib8ukg4d','172.71.124.158',1788242726,_binary '__ci_last_regenerate|i:1788242726;historyKey|i:9;id|s:1:\"9\";kode|s:7:\"3000631\";usernik|s:16:\"1304054905900001\";name|s:13:\"Nani Yulia bs\";roleKey|s:1:\"3\";islogin|b:1;'),('dksp5iqsa76nijapfnlmgbjbgnflsehb','162.159.98.15',1789641612,_binary '__ci_last_regenerate|i:1789641612;'),('dm2pv7aksb5n1v3241qio1b6j1aodiss','172.68.164.146',1789359922,_binary '__ci_last_regenerate|i:1789359676;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('dqv7vjvd77bb53p556h5oma4mdnh54qh','172.70.93.7',1788338574,_binary '__ci_last_regenerate|i:1788338574;'),('dvdbue34nhin4rogjlepvme1mu96gioh','162.158.108.32',1789095128,_binary '__ci_last_regenerate|i:1789095128;historyKey|i:30;id|s:2:\"33\";kode|s:7:\"0ecf5a3\";usernik|s:16:\"1371114104870018\";name|s:13:\"Shinta Apsari\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('dvpeh82tbm7bhik8dekdgs4ff6hab3du','104.23.175.5',1788488814,_binary '__ci_last_regenerate|i:1788488813;historyKey|i:23;id|s:2:\"22\";kode|s:7:\"0ac0ecb\";usernik|s:16:\"1501056206950001\";name|s:15:\"Anggun susantri\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('e0j7l961o84ml4heet0lvtstkbtse2i0','172.69.166.54',1789095054,_binary '__ci_last_regenerate|i:1789095054;historyKey|i:31;id|s:2:\"34\";kode|s:7:\"013dda9\";usernik|s:16:\"1703141706000001\";name|s:14:\"M. Reffi Pasha\";roleKey|s:1:\"3\";islogin|b:1;'),('e3gm8pt5bl8lbgqe78kh7d8gcr1dad1h','172.68.164.146',1789357655,_binary '__ci_last_regenerate|i:1789357655;'),('e6kqoafeb7bs8r0u2jigp6m91cdg95i4','172.70.188.19',1788241789,_binary '__ci_last_regenerate|i:1788241789;redirect_url|s:46:\"https://kelpin.my.id/chemonitor/index.php/inti\";'),('f3m072mucideqs5n25iqrp6c5tqaf0tv','162.158.163.97',1789121594,_binary '__ci_last_regenerate|i:1789121594;redirect_url|s:55:\"https://kelpin.my.id/chemonitor/index.php/inti/detail/2\";'),('fbvu27bnbgm5fss9e7h3qmr7c4atd0re','104.23.176.7',1788746474,_binary '__ci_last_regenerate|i:1788746474;'),('filo5msvdb8ketmjo9toqq7vj9hsoiu5','104.22.176.3',1789095166,_binary '__ci_last_regenerate|i:1789095166;historyKey|i:35;id|s:2:\"38\";kode|s:7:\"ce919dc\";usernik|s:16:\"1305165006950001\";name|s:16:\"Alvina Anggraini\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:16:\"Selamat Datang !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('fk1raukblt9marbfup4jdevb9vng2fs9','162.158.178.13',1789095501,_binary '__ci_last_regenerate|i:1789095498;historyKey|i:33;id|s:2:\"37\";kode|s:7:\"d64f7a6\";usernik|s:16:\"1305056705830001\";name|s:14:\"Reni Nila Sari\";roleKey|s:1:\"3\";islogin|b:1;'),('fop5q6pu8uppmcea5kl37ajpgo2pmt57','162.158.88.134',1788138787,_binary '__ci_last_regenerate|i:1788138770;'),('frhrpov4pubp0n81trevvpaqb4h5gu02','162.158.163.98',1788145016,_binary '__ci_last_regenerate|i:1788145015;'),('fvmoud9dvutttj6slv2rain4uhmdu6rb','162.158.88.135',1788486832,_binary '__ci_last_regenerate|i:1788486832;'),('g07ukh266pouf2gp50h848b1b0jk9b0o','162.158.162.129',1788486394,_binary '__ci_last_regenerate|i:1788486394;'),('g50k29nokk79i1bjg5stip3rr4ki88bk','162.158.88.135',1788486911,_binary '__ci_last_regenerate|i:1788486833;'),('g5jjpvrmefkt01pgjmu1f6knoq189re8','172.69.176.127',1788241692,_binary '__ci_last_regenerate|i:1788241692;'),('gfsp34rponjus7acvee5icafariqse3j','104.22.66.114',1788316796,_binary '__ci_last_regenerate|i:1788316796;'),('gg7p19fnv3jle9i6dsa5rr7rcerffl0p','104.22.176.3',1789094575,_binary '__ci_last_regenerate|i:1789094575;'),('gn08lfik7cf512dph17bdqiem8om7bv2','172.69.165.73',1788315186,_binary '__ci_last_regenerate|i:1788314899;'),('h1oa7fbsdit4mnbsikp2uflibpnep3p5','172.71.152.7',1789443881,_binary '__ci_last_regenerate|i:1789443820;historyKey|i:37;id|s:2:\"51\";kode|s:7:\"d38f4ac\";usernik|s:16:\"1371104711760004\";name|s:23:\"Siti Herlina Ali Sopiah\";roleKey|s:1:\"3\";islogin|b:1;'),('h4euqqmhs4gorrf2hgp4or12o6a0m3mg','172.69.166.55',1789095281,_binary '__ci_last_regenerate|i:1789095281;historyKey|i:32;id|s:2:\"35\";kode|s:7:\"58c57cd\";usernik|s:16:\"1377010510920004\";name|s:13:\"oxsivo yandra\";roleKey|s:1:\"3\";islogin|b:1;'),('h4sn12n50lc0j5uh9unntlgtirrikfug','162.158.88.135',1788438376,_binary '__ci_last_regenerate|i:1788438376;'),('hd8vi8hcuh1g5ptj2akr5975ft91ao4s','104.22.176.3',1788244147,_binary '__ci_last_regenerate|i:1788244147;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('hfc2t9bk0941ub9jjtu3nli63rsm0eo6','172.71.124.159',1788751621,_binary '__ci_last_regenerate|i:1788751621;historyKey|i:27;id|s:2:\"26\";kode|s:7:\"3425df3\";usernik|s:16:\"1308135705070001\";name|s:11:\"Meila Fatma\";roleKey|s:1:\"3\";islogin|b:1;'),('hqfve8vsknc6m0ohagtqh24561dboj8e','172.70.208.126',1788148914,_binary '__ci_last_regenerate|i:1788148914;'),('hrsjackogfasfe7i9reogenqgum8u9fi','172.68.164.146',1788485984,_binary '__ci_last_regenerate|i:1788485984;historyKey|i:20;id|s:2:\"19\";kode|s:7:\"a68167c\";usernik|s:16:\"1371112810790007\";name|s:11:\"zuliorahman\";roleKey|s:1:\"3\";islogin|b:1;'),('i3hpv0u890tcuar5hakjaodbhh3400p8','104.22.176.3',1788324855,_binary '__ci_last_regenerate|i:1788324855;'),('i7l8l0afc0oh5ddd4odbf33grmddjmso','172.71.218.148',1788748317,_binary '__ci_last_regenerate|i:1788748317;'),('ilkbr604119hlrld8oshi7l9ekdeiicp','172.68.211.180',1788315146,_binary '__ci_last_regenerate|i:1788314956;historyKey|i:12;id|s:2:\"12\";kode|s:7:\"6b3deb3\";usernik|s:16:\"1306046606920003\";name|s:16:\"Indah Putri Yuni\";roleKey|s:1:\"3\";islogin|b:1;'),('inqqjvrf1n15ot8u201vc6qmounh19eh','172.71.124.159',1788147276,_binary '__ci_last_regenerate|i:1788147276;historyKey|i:5;id|s:1:\"7\";kode|s:7:\"25474c7\";usernik|s:16:\"1308141303010002\";name|s:11:\"Mario Resta\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"new\";}'),('ipa0q96k157tlb4o2u3f3kscfenm1aaq','172.71.81.178',1789440456,_binary '__ci_last_regenerate|i:1789440456;'),('ivgipv8ol7c7r3epa0u5e15ld5gq8ac5','172.71.152.49',1788148919,_binary '__ci_last_regenerate|i:1788148919;'),('j0frduo6o5t3s54jbumjjoj4rooi21pg','172.69.166.54',1789095271,_binary '__ci_last_regenerate|i:1789095166;historyKey|i:35;id|s:2:\"38\";kode|s:7:\"ce919dc\";usernik|s:16:\"1305165006950001\";name|s:16:\"Alvina Anggraini\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('j3gl7jhvve1vvgu9t79qemkd361nf8n6','108.162.226.253',1788314956,_binary '__ci_last_regenerate|i:1788314956;'),('j4l7ggimpeb6qd1mnk018eftsc4k2bl5','172.70.208.127',1789095044,_binary '__ci_last_regenerate|i:1789095044;'),('jctgh7tap4pt69ofhe3da1rg8dkk40lb','162.158.170.136',1788138190,_binary '__ci_last_regenerate|i:1788138190;'),('jfecqbqslr1d3llgedltihh1jgunhpru','172.68.164.147',1788745870,_binary '__ci_last_regenerate|i:1788745864;'),('jgo4miitcd47mukafu15ik0od6tkf9q0','104.23.175.4',1788746492,_binary '__ci_last_regenerate|i:1788746475;'),('jihuftn1sesne0ug77i8e5ghb3qlfccq','162.158.108.32',1789094928,_binary '__ci_last_regenerate|i:1789094928;historyKey|i:28;id|s:2:\"30\";kode|s:7:\"1a37a73\";usernik|s:16:\"1305024112060003\";name|s:13:\"Zahwa erianto\";roleKey|s:1:\"3\";islogin|b:1;'),('jiipqsk9spg3biboa6r9igfe4e0tnl8p','162.159.98.14',1788241865,_binary '__ci_last_regenerate|i:1788241865;'),('jocr1uaev3oq5djvcqacj69pgm7g4080','172.71.152.8',1789704377,_binary '__ci_last_regenerate|i:1789704376;redirect_url|s:53:\"https://kelpin.my.id/chemonitor/index.php/inti/insert\";'),('jpfdha58ff2vd7ohrgth6phktv0gsult','104.22.80.137',1786506432,_binary '__ci_last_regenerate|i:1786506432;historyKey|i:1;id|s:1:\"3\";kode|s:7:\"59dc3ba\";usernik|s:16:\"1231234564567890\";name|s:15:\"Budiman Santoso\";roleKey|s:1:\"3\";islogin|b:1;'),('jre19gcjkn0538kpssdgve5epv4kh1bm','162.158.106.149',1788746971,_binary '__ci_last_regenerate|i:1788746971;'),('jsk69eu0dgf9butthcqqiob7cb3kvc48','104.22.176.3',1789094954,_binary '__ci_last_regenerate|i:1789094928;historyKey|i:28;id|s:2:\"30\";kode|s:7:\"1a37a73\";usernik|s:16:\"1305024112060003\";name|s:13:\"Zahwa erianto\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('k6vsvk8bgaj9m3ok4k5dvvdn4buri576','104.22.176.3',1788242088,_binary '__ci_last_regenerate|i:1788242088;historyKey|i:9;id|s:1:\"9\";kode|s:7:\"3000631\";usernik|s:16:\"1304054905900001\";name|s:13:\"Nani Yulia bs\";roleKey|s:1:\"3\";islogin|b:1;'),('khh5h8mfho3vvavjh3v40rhp9jjofe0d','162.158.108.32',1789011134,_binary '__ci_last_regenerate|i:1789011134;'),('kofnnlr2jiusv6hm7qct7h4p14dnctij','172.70.93.6',1788317024,_binary '__ci_last_regenerate|i:1788317024;'),('kqqva9e7nb6iqnu6e5mbjcfdq7cm2bl8','162.158.108.33',1789094313,_binary '__ci_last_regenerate|i:1789094313;'),('l6nf0d58j1n6qjhlv50g3k62spmmr9p6','162.159.98.15',1790149583,_binary '__ci_last_regenerate|i:1790149583;'),('l9rhp0c2cbmmqht8t14blu6s3fa1338e','172.71.81.96',1788749894,_binary '__ci_last_regenerate|i:1788749857;historyKey|i:26;id|s:2:\"25\";kode|s:7:\"2b73571\";usernik|s:16:\"1501176702080001\";name|s:12:\"Denia Febria\";roleKey|s:1:\"3\";islogin|b:1;'),('lavuli0cp5tomvipfs6229br0hpcj5dp','162.158.88.134',1789013128,_binary '__ci_last_regenerate|i:1789013128;redirect_url|s:55:\"https://kelpin.my.id/chemonitor/index.php/inti/detail/2\";'),('lv6bmk9u4k3993f0birq80mvkgdpk11o','172.71.81.210',1788245984,_binary '__ci_last_regenerate|i:1788245804;historyKey|i:11;id|s:2:\"11\";kode|s:7:\"9092d0b\";usernik|s:16:\"1310015201010002\";name|s:8:\"Fazillah\";roleKey|s:1:\"3\";islogin|b:1;'),('m1voujepnp7aeb9pd73ol9ipr7hlvv4b','162.158.190.3',1789095054,_binary '__ci_last_regenerate|i:1789095054;historyKey|i:31;id|s:2:\"34\";kode|s:7:\"013dda9\";usernik|s:16:\"1703141706000001\";name|s:14:\"M. Reffi Pasha\";roleKey|s:1:\"3\";islogin|b:1;'),('m5rroegov2g70bpoqc9l3tnd5mb7emdq','104.22.176.3',1788154152,_binary '__ci_last_regenerate|i:1788154016;historyKey|i:8;id|s:1:\"5\";kode|s:7:\"a06a866\";usernik|s:16:\"3217116909920004\";name|s:23:\"Siti Herlina Ali Sopiah\";roleKey|s:1:\"3\";islogin|b:1;'),('mg59rqp64kpuquvct7hc7nbjo34ksllr','172.69.176.127',1788243168,_binary '__ci_last_regenerate|i:1788243168;'),('mq8c2dkqnj9bjb7f16c586m5tj9l8pjp','172.70.208.126',1789440615,_binary '__ci_last_regenerate|i:1789440456;'),('mu476bt4sntlfdi95glg7qbhm7telkd1','172.68.242.32',1788241952,_binary '__ci_last_regenerate|i:1788241791;historyKey|i:10;id|s:2:\"10\";kode|s:7:\"f4eb221\";usernik|s:16:\"3201025107890012\";name|s:12:\"Nidia melati\";roleKey|s:1:\"3\";islogin|b:1;'),('n97l1mvcds3o1091pqrv4nrc5rt60uvj','172.71.124.159',1788488289,_binary '__ci_last_regenerate|i:1788488289;historyKey|i:23;id|s:2:\"22\";kode|s:7:\"0ac0ecb\";usernik|s:16:\"1501056206950001\";name|s:15:\"Anggun susantri\";roleKey|s:1:\"3\";islogin|b:1;'),('naihc6tfv6293hhvja81qnojqno8vrt7','162.158.88.134',1788145013,_binary '__ci_last_regenerate|i:1788145013;historyKey|i:5;id|s:1:\"7\";kode|s:7:\"25474c7\";usernik|s:16:\"1308141303010002\";name|s:11:\"Mario Resta\";roleKey|s:1:\"3\";islogin|b:1;'),('nkvkoj9dst53eotvgq8fgmuoqsdgsvfn','172.71.124.158',1788137986,_binary '__ci_last_regenerate|i:1788137986;'),('nnbg6epv670be03avrbm0qa3dm1hcuep','172.70.208.127',1788746387,_binary '__ci_last_regenerate|i:1788746319;historyKey|i:24;id|s:2:\"23\";kode|s:7:\"575f923\";usernik|s:16:\"1471080409660022\";name|s:8:\"Iswandi \";roleKey|s:1:\"3\";islogin|b:1;'),('nnlg5qono1f8n1p0rgo05pq9dtmnag57','162.158.108.32',1788320111,_binary '__ci_last_regenerate|i:1788320068;alert-error|s:46:\"Login Gagal, Pastikan NIK dan Password Benar !\";__ci_vars|a:1:{s:11:\"alert-error\";s:3:\"old\";}'),('occn3e7si7e027fbitb5fj760lhmuerl','172.71.81.209',1788148912,_binary '__ci_last_regenerate|i:1788148912;'),('odk29le3o4lqne7cgkq2emkkb0i3at4b','172.69.176.4',1789094415,_binary '__ci_last_regenerate|i:1789094415;historyKey|i:29;id|s:2:\"31\";kode|s:7:\"a86d06b\";usernik|s:16:\"1301044303040005\";name|s:15:\"Abella syelfira\";roleKey|s:1:\"3\";islogin|b:1;'),('odpd1akgd53l3ubgnijkbr1pip05kamg','104.22.176.3',1788320605,_binary '__ci_last_regenerate|i:1788320547;redirect_url|s:46:\"https://kelpin.my.id/chemonitor/index.php/inti\";historyKey|i:14;id|s:1:\"9\";kode|s:7:\"3000631\";usernik|s:16:\"1304054905900001\";name|s:13:\"Nani Yulia bs\";roleKey|s:1:\"3\";islogin|b:1;'),('ojdqr05mr1gq5fsuvsgl1hj19ltr7bdr','162.158.189.14',1788145338,_binary '__ci_last_regenerate|i:1788145338;historyKey|i:6;id|s:1:\"8\";kode|s:7:\"c3028b7\";usernik|s:16:\"1302100109050002\";name|s:14:\"Putra Erlangga\";roleKey|s:1:\"3\";islogin|b:1;'),('oor38sleb6cn45a63fqu8na7b060emjm','172.71.124.158',1789095498,_binary '__ci_last_regenerate|i:1789095498;historyKey|i:33;id|s:2:\"37\";kode|s:7:\"d64f7a6\";usernik|s:16:\"1305056705830001\";name|s:14:\"Reni Nila Sari\";roleKey|s:1:\"3\";islogin|b:1;'),('or5g32nlihvq8uqfc5hg9f4mh9s8aehk','172.71.124.158',1789092117,_binary '__ci_last_regenerate|i:1789092117;'),('ou0ir1s3gt1v36r5mpu14s41lnvduet4','104.22.80.134',1786506131,_binary '__ci_last_regenerate|i:1786506131;historyKey|i:1;id|s:1:\"3\";kode|s:7:\"59dc3ba\";usernik|s:16:\"1231234564567890\";name|s:15:\"Budiman Santoso\";roleKey|s:1:\"3\";islogin|b:1;'),('p3bctpee05j941kbpgkaulk4o848f9jf','172.68.211.180',1789440355,_binary '__ci_last_regenerate|i:1789440277;alert-error|s:46:\"Login Gagal, Pastikan NIK dan Password Benar !\";__ci_vars|a:1:{s:11:\"alert-error\";s:3:\"old\";}'),('p4kaem179e6kjo3lnum1l5dqih79vg7n','172.69.176.4',1789439138,_binary '__ci_last_regenerate|i:1789439138;'),('p4p49pk2hkqlrgf8mp656fk4r36ca9ho','162.158.108.15',1788229461,_binary '__ci_last_regenerate|i:1788229459;redirect_url|s:53:\"https://kelpin.my.id/chemonitor/index.php/inti/insert\";'),('p5u3gleisqm4pn642fa6htp1159gu5nu','172.69.176.5',1788339530,_binary '__ci_last_regenerate|i:1788339530;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('p8t6d383es38obqp25j0160r0rcclo1l','172.71.124.159',1789358076,_binary '__ci_last_regenerate|i:1789358076;'),('p9qor1v0jifkecp383t02loqjp80f4hr','172.68.211.140',1789443453,_binary '__ci_last_regenerate|i:1789443453;historyKey|i:37;id|s:2:\"51\";kode|s:7:\"d38f4ac\";usernik|s:16:\"1371104711760004\";name|s:23:\"Siti Herlina Ali Sopiah\";roleKey|s:1:\"3\";islogin|b:1;'),('pfvjlee7be3m777mlabd1de77p2ppabf','162.158.108.32',1789094834,_binary '__ci_last_regenerate|i:1789094834;historyKey|i:32;id|s:2:\"35\";kode|s:7:\"58c57cd\";usernik|s:16:\"1377010510920004\";name|s:13:\"oxsivo yandra\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:16:\"Selamat Datang !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('pkkvp57bolq2m7lvnijprnm3uei1ii0q','172.71.124.159',1789094156,_binary '__ci_last_regenerate|i:1789094156;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('q2cna3qpbqga12neerdh4fg40elraib6','104.23.176.7',1788316333,_binary '__ci_last_regenerate|i:1788316315;'),('q5dph72fm62i3d1s7k6h5ekcos3pvufp','162.158.163.97',1788398531,_binary '__ci_last_regenerate|i:1788398531;redirect_url|s:49:\"https://kelpin.my.id/chemonitor/index.php/profile\";'),('q5lv599gs6tgj35fc9v4khqo1speri59','172.71.219.65',1789095611,_binary '__ci_last_regenerate|i:1789095441;historyKey|i:34;id|s:2:\"39\";kode|s:7:\"cc67868\";usernik|s:16:\"1501026808930002\";name|s:7:\"Nirwana\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('qc297mmh9n4vuc1ooaptfmio812ocunj','172.71.81.210',1788138802,_binary '__ci_last_regenerate|i:1788138802;'),('qckr6b7nl3kbdnj8s67992j913hf0hq1','172.71.254.63',1788142503,_binary '__ci_last_regenerate|i:1788142503;'),('ql1o1o8p06c1cdpgkdqk31tgi6pnl3pc','104.22.80.137',1789131319,_binary '__ci_last_regenerate|i:1789131229;redirect_url|s:49:\"https://kelpin.my.id/chemonitor/index.php/keluhan\";historyKey|i:36;id|s:1:\"6\";kode|s:7:\"9475ba6\";usernik|s:16:\"1372011112990001\";name|s:15:\"Muhammad afdhal\";roleKey|s:1:\"3\";islogin|b:1;'),('qmpdaqhf8vg61tagrrnsi1ef3i3ltuvf','172.69.176.4',1788403278,_binary '__ci_last_regenerate|i:1788403160;historyKey|i:17;id|s:2:\"17\";kode|s:7:\"fb9b070\";usernik|s:16:\"1305047006600004\";name|s:9:\"Alam Sori\";roleKey|s:1:\"3\";islogin|b:1;'),('qrq9r9u8dmefgmm062omr8rfa48etgbq','162.158.162.2',1788314080,_binary '__ci_last_regenerate|i:1788314080;'),('qtf6cv03oss8br4s74nnq0cooufefqhu','162.159.98.14',1789095082,_binary '__ci_last_regenerate|i:1789095082;'),('r119pf6hjaq6s6593ggkobuvnbd1r5sd','104.23.176.8',1788487896,_binary '__ci_last_regenerate|i:1788487896;historyKey|i:20;id|s:2:\"19\";kode|s:7:\"a68167c\";usernik|s:16:\"1371112810790007\";name|s:11:\"zuliorahman\";roleKey|s:1:\"3\";islogin|b:1;'),('ra8cpsh0ebp8sf7pvflbvumvuie7k2cq','172.71.124.159',1788314849,_binary '__ci_last_regenerate|i:1788314849;'),('rrb15onn5atrkkh3atdtatd9f7nqqmbj','172.71.124.159',1788144885,_binary '__ci_last_regenerate|i:1788144885;'),('rsv2k6050n0ngnmkpdthf9gcj9hb0puh','172.68.164.146',1789359676,_binary '__ci_last_regenerate|i:1789359676;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('s08gv876p4d9ptgkjip5b7bu2vbjbo83','104.23.176.7',1788398435,_binary '__ci_last_regenerate|i:1788398435;'),('s3mv237jr3p44ok3sm0ik99hgb2e6r3f','172.71.81.209',1788144434,_binary '__ci_last_regenerate|i:1788144416;historyKey|i:4;id|s:1:\"6\";kode|s:7:\"9475ba6\";usernik|s:16:\"1372011112990001\";name|s:15:\"Muhammad afdhal\";roleKey|s:1:\"3\";islogin|b:1;'),('ss2fop8qbegiva7trbf2plv77namugh7','172.71.219.65',1789442753,_binary '__ci_last_regenerate|i:1789442753;historyKey|i:37;id|s:2:\"51\";kode|s:7:\"d38f4ac\";usernik|s:16:\"1371104711760004\";name|s:23:\"Siti Herlina Ali Sopiah\";roleKey|s:1:\"3\";islogin|b:1;'),('t181orqu3ul45cgrr1ejgodfg4k2carc','104.22.80.137',1786506432,_binary '__ci_last_regenerate|i:1786506432;'),('t4mbhcs7asklqadogt8aga94b7o2mr25','104.22.176.3',1788241782,_binary '__ci_last_regenerate|i:1788241782;alert-error|s:46:\"Login Gagal, Pastikan NIK dan Password Benar !\";__ci_vars|a:1:{s:11:\"alert-error\";s:3:\"old\";}'),('t61efep3m1dje7cv0mgftd6tm4gg199m','104.22.176.3',1788144880,_binary '__ci_last_regenerate|i:1788144879;redirect_url|s:46:\"https://kelpin.my.id/chemonitor/index.php/inti\";'),('tdh8au35csjr364t2b70h2nms70cji3v','162.158.106.149',1789094822,_binary '__ci_last_regenerate|i:1789094822;alert-success|s:22:\"Pendaftaran Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('tj5gtqtci6j3jtu1qr4tmbigpjfcnqfi','172.70.208.126',1788241958,_binary '__ci_last_regenerate|i:1788241957;redirect_url|s:53:\"https://kelpin.my.id/chemonitor/index.php/inti/insert\";'),('u2op12mh1kr50d1ojtc52dfrjq7ebg04','172.70.208.127',1788405649,_binary '__ci_last_regenerate|i:1788405619;redirect_url|s:49:\"https://kelpin.my.id/chemonitor/index.php/profile\";historyKey|i:19;id|s:1:\"9\";kode|s:7:\"3000631\";usernik|s:16:\"1304054905900001\";name|s:13:\"Nani Yulia bs\";roleKey|s:1:\"3\";islogin|b:1;alert-success|s:24:\"Input Keluhan Berhasil !\";__ci_vars|a:1:{s:13:\"alert-success\";s:3:\"old\";}'),('u70q1h8qbg53n1hh11jr7fstnnk37dnm','172.68.164.146',1788488130,_binary '__ci_last_regenerate|i:1788488130;historyKey|i:22;id|s:2:\"21\";kode|s:7:\"f4bd3cb\";usernik|s:16:\"1371066312000009\";name|s:17:\"Velya Puti Seruni\";roleKey|s:1:\"3\";islogin|b:1;'),('uf027eam7659sc527bqaq8nfgrlj8n77','172.71.124.159',1788245804,_binary '__ci_last_regenerate|i:1788245804;historyKey|i:11;id|s:2:\"11\";kode|s:7:\"9092d0b\";usernik|s:16:\"1310015201010002\";name|s:8:\"Fazillah\";roleKey|s:1:\"3\";islogin|b:1;'),('ukv865d2mcrifufoilrafmml8i4o8rba','172.69.176.4',1789097146,_binary '__ci_last_regenerate|i:1789097146;historyKey|i:30;id|s:2:\"33\";kode|s:7:\"0ecf5a3\";usernik|s:16:\"1371114104870018\";name|s:13:\"Shinta Apsari\";roleKey|s:1:\"3\";islogin|b:1;'),('unp0r8gvkoo113id19dsgsun3qmgo9pe','172.69.176.5',1789122436,_binary '__ci_last_regenerate|i:1789122436;redirect_url|s:56:\"https://kelpin.my.id/chemonitor/index.php/inti/detail/14\";'),('usr6i6it9a78pgclemq197sr8eojvlcs','172.70.93.7',1788317024,_binary '__ci_last_regenerate|i:1788317024;'),('uuiaj3coa8j8eq73qv9168ermh45f77a','172.71.124.158',1788339058,_binary '__ci_last_regenerate|i:1788339058;'),('v329dahp4vkoa0bf5uf6l112kvk613r9','172.68.211.180',1788748750,_binary '__ci_last_regenerate|i:1788748750;'),('velqsj5rdl6555ou3b53jfmfu2knjahc','172.71.219.66',1789106041,_binary '__ci_last_regenerate|i:1789106041;');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(7) NOT NULL,
  `roleKey` int NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Pria','Wanita') NOT NULL,
  `alamat` text NOT NULL,
  `urlfiles` text,
  `isactive` tinyint(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `nik` (`nik`),
  UNIQUE KEY `nip` (`nip`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_staff_roleKey` (`roleKey`),
  CONSTRAINT `fk_staff_role` FOREIGN KEY (`roleKey`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'eb4d342',1,'3174198512250034','198512250034','Rajesh Kumar','rajesh.kumar@example.com','+1-212-555-0187','1985-12-25','Pria','One World Trade Center, 285 Fulton St, New York, NY 10007, USA',NULL,1,'2026-09-23 07:42:35','2026-09-23 07:42:35',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `patientkeluhanview`
--

/*!50001 DROP VIEW IF EXISTS `patientkeluhanview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientkeluhanview` AS select `k`.`id` AS `id`,`p`.`kode` AS `userKey`,`p`.`mrn` AS `mrn`,`p`.`nik` AS `nik`,`p`.`fullname` AS `fullname`,`k`.`siklus` AS `siklus`,`k`.`last_session` AS `last_session`,`k`.`mukositis` AS `mukositis`,`k`.`kelelahan` AS `kelelahan`,`k`.`mual` AS `mual`,`k`.`muntah` AS `muntah`,`k`.`created` AS `created` from (`patients` `p` join `keluhan` `k` on((`p`.`kode` = `k`.`userKey`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `riwayatlogin`
--

/*!50001 DROP VIEW IF EXISTS `riwayatlogin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `riwayatlogin` AS select `p`.`id` AS `id`,`p`.`kode` AS `patientKey`,`p`.`fullname` AS `fullname`,count(`lh`.`id`) AS `total_login`,min(`lh`.`login_at`) AS `first_login`,max(`lh`.`login_at`) AS `last_login` from (`patients` `p` left join `login_history` `lh` on((`lh`.`patientKey` = `p`.`id`))) where (`p`.`deleted` is null) group by `p`.`id`,`p`.`kode`,`p`.`fullname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rolelimit`
--

/*!50001 DROP VIEW IF EXISTS `rolelimit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rolelimit` AS select `priv`.`id` AS `privilegeKey`,`priv`.`roleKey` AS `roleKey`,`priv`.`readable` AS `readable`,`priv`.`creatable` AS `creatable`,`priv`.`editable` AS `editable`,`priv`.`deletable` AS `deletable`,`perm`.`id` AS `permissionKey`,`perm`.`nama` AS `nama`,`perm`.`label` AS `label`,`perm`.`moduleKey` AS `moduleKey` from (`privileges` `priv` join `permissions` `perm` on((`perm`.`id` = `priv`.`permissionKey`))) where ((`priv`.`deleted` is null) and (`perm`.`deleted` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23  7:54:47
