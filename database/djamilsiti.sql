-- MySQL dump 10.13  Distrib 8.0.45, for Linux (aarch64)
--
-- Host: localhost    Database: djamilsiti
-- ------------------------------------------------------
-- Server version	8.0.45

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keluhan`
--

LOCK TABLES `keluhan` WRITE;
/*!40000 ALTER TABLE `keluhan` DISABLE KEYS */;
INSERT INTO `keluhan` VALUES (1,'2b18c35',3,'2026-01-10',0,1,0,0,'2026-09-23 12:33:03'),(2,'c3028b7',3,'2026-08-31',0,0,1,0,'2026-09-23 12:33:03'),(3,'25474c7',2,'2026-08-10',0,2,2,1,'2026-09-23 12:33:03'),(4,'3000631',3,'2026-09-01',0,0,2,0,'2026-09-23 12:33:03'),(5,'9092d0b',6,'2026-09-01',0,0,3,1,'2026-09-23 12:33:03'),(6,'10f8b77',2,'2026-09-02',0,1,0,0,'2026-09-23 12:33:03'),(7,'3000631',3,'2026-09-01',0,0,0,0,'2026-09-23 12:33:03'),(8,'2711b07',5,'2026-09-02',0,1,1,1,'2026-09-23 12:33:03'),(9,'3000631',3,'2026-09-01',0,0,0,0,'2026-09-23 12:33:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_credential`
--

LOCK TABLES `login_credential` WRITE;
/*!40000 ALTER TABLE `login_credential` DISABLE KEYS */;
INSERT INTO `login_credential` VALUES (1,'59dc3ba','1231234564567890','$2y$10$KGokrG9ecYiIGIAGbrSAEeZEdAHcVCOiNlaMVIHwdnvT4DLG1SKuW',3,1,'2026-08-12 03:38:10','2026-09-23 12:43:22','2026-09-23 12:43:22'),(2,'2b18c35','3174011008010005','$2y$10$6bP.rYlght565XoBxP79tOD/Aul4rsBbYFeA6jLiXcCQVGvKka3sS',3,1,'2026-08-31 01:01:15','2026-09-23 12:43:22','2026-09-23 12:43:22'),(3,'a06a866','3217116909920004','$2y$10$TkquIbx0ed47VO5bprbWrerhyuYtV5PiYRf7dhiuuza/TJQ9VsN0C',3,1,'2026-08-31 05:27:06','2026-09-23 12:43:22','2026-09-23 12:43:22'),(4,'9475ba6','1372011112990001','$2y$10$cNMR4RfVWjgYC.TZQ5SdyuWd9dOv37nN4wI0vWtKCx7JRha8TDKSS',3,1,'2026-09-11 12:54:27','2026-09-23 12:43:22','2026-09-23 12:43:22'),(5,'25474c7','1308141303010002','$2y$10$Q1ZZNM6mXhNOTChu9crXs./Bea2O7L9iRYUMuHx3vXFSz.bi.d8ni',3,1,'2026-08-31 02:54:36','2026-09-23 12:43:22','2026-09-23 12:43:22'),(6,'c3028b7','1302100109050002','$2y$10$ZSev5Fd7MaU7VheAMuGKS.FsVH/JIkN9LxmWTghdG4HdK.CJX1TjG',3,1,'2026-09-23 12:58:28','2026-09-23 12:43:22','2026-09-23 12:58:28'),(7,'3000631','1304054905900001','$2y$10$FmLbQQen4bjqfPJR6Hrm1.pbTXfdxau40XKcMEVh9D5gajHvkcuNC',3,1,'2026-09-03 03:20:24','2026-09-23 12:43:22','2026-09-23 12:43:22'),(8,'f4eb221','3201025107890012','$2y$10$AjB4fchkyiPiUN9xtsRYIeyFGp.zJGVZ24wTziHyMTsQIY92AuQKm',3,1,'2026-09-01 05:52:20','2026-09-23 12:43:22','2026-09-23 12:43:22'),(9,'9092d0b','1310015201010002','$2y$10$8voXnS.OczGTbHqXtlbDouRCpRNf8Rp6O/tOmXQtFqCieMCGj2EC6',3,1,'2026-09-01 06:29:07','2026-09-23 12:43:22','2026-09-23 12:43:22'),(10,'6b3deb3','1306046606920003','$2y$10$9YNDwi1Whl1gjhtpJBV7i.WU3pVoP9GBcGO.W2i0XIPAjHQ4ws61S',3,1,'2026-09-02 02:10:02','2026-09-23 12:43:22','2026-09-23 12:43:22'),(11,'10f8b77','1371014901860005','$2y$10$EjiKh53kxRGcYASuHObsyOQ7H3dYup0pxhN/33hTR/SLU5e/UEgQe',3,1,'2026-09-02 03:34:21','2026-09-23 12:43:22','2026-09-23 12:43:22'),(12,'f5d63cd','321513551083003','$2y$10$5elKUC8Z84MCTgW3lHHTyeKMQrOt05q4A5dnCJZHWT/Nq4Xaykipa',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(13,'2711b07','1572026001860002','$2y$10$ehEbnXEqpRXyGX2jcEj28Om3LHHo.s82o2aIgsLY.qLsCNXOBa4vS',3,1,'2026-09-02 04:56:38','2026-09-23 12:43:22','2026-09-23 12:43:22'),(14,'0f4811c','1301044910980001','$2y$10$HA4eeA.o1VR.DdiEL23GWOnVfqXisVVLnBN6xaYqAYOeDw3VyGmBG',3,1,'2026-09-02 08:58:50','2026-09-23 12:43:22','2026-09-23 12:43:22'),(15,'fb9b070','1305047006600004','$2y$10$CLMX0ebL9oLqLEIreNSZDe2lYr/E6myj8IVouyEiNTyWfUhSBaEVS',3,1,'2026-09-03 01:21:42','2026-09-23 12:43:22','2026-09-23 12:43:22'),(16,'ae23916','1302074204870004','$2y$10$4YZZJNvNEYtok7WYqJQruOcuEZQwicbLebTtS0Q3QKM5AxbTo8Fy2',3,1,'2026-09-03 02:32:52','2026-09-23 12:43:22','2026-09-23 12:43:22'),(17,'a68167c','1371112810790007','$2y$10$GzT8GsrK72i7OIouoosMCeSrmdU7xItW203b.p9noXh3l.P3rVaBm',3,1,'2026-09-04 01:32:24','2026-09-23 12:43:22','2026-09-23 12:43:22'),(18,'0eef9f0','1305150612950001','$2y$10$PrCheU4Yjvk16A9TPKL6c.RKBCcXtOED6/6CVRU7Iti/.rGrtsIZi',3,1,'2026-09-04 01:52:11','2026-09-23 12:43:22','2026-09-23 12:43:22'),(19,'f4bd3cb','1371066312000009','$2y$10$csfSr7RwhKLwMQgzwOcUW.aD9VXskNmnfmSLh.yz2escLJTjfad..',3,1,'2026-09-04 02:07:25','2026-09-23 12:43:22','2026-09-23 12:43:22'),(20,'0ac0ecb','1501056206950001','$2y$10$ChKauSN2F2TTB7K5nsCcdup67ORpywoaLU/Szb6UslmumqTFEUxO.',3,1,'2026-09-04 02:12:10','2026-09-23 12:43:22','2026-09-23 12:43:22'),(21,'575f923','1471080409660022','$2y$10$CWmQX3ZUHpTKd7zaXVFR/OVaTAK77yOw9ZRG9bh0qoy7CTsGAWd9i',3,1,'2026-09-07 01:59:35','2026-09-23 12:43:22','2026-09-23 12:43:22'),(22,'6b8da18','1303064906830001','$2y$10$QVk0Izn3BPPb.GM.QlLlqu3g5NnNJ0QUze1Z4h9oGyQkfdNfrlKBi',3,1,'2026-09-07 02:40:14','2026-09-23 12:43:22','2026-09-23 12:43:22'),(23,'2b73571','1501176702080001','$2y$10$HM2K6p7GP65SWRHk8PlrXOFRGRZgNsKfclJEIYcDR.EvrVF54ySnW',3,1,'2026-09-07 02:53:22','2026-09-23 12:43:22','2026-09-23 12:43:22'),(24,'3425df3','1308135705070001','$2y$10$V1dAYnWhQd2SCk4uTE0cs.BFNbsXKnKW2IXBd1nwfnHHo25GHn21a',3,1,'2026-09-07 03:20:31','2026-09-23 12:43:22','2026-09-23 12:43:22'),(25,'6787173','137301531780001','$2y$10$VrE1E76aGHoU8iVcmLS2r.jfqSJU/fs6EZnO452PCvO7N4QfpaA7y',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(26,'468d2f8','1371026003850006','$2y$10$/igR6AG8lG08Sguu.TrCyuhSoPVFa/HqNTkUVZu/V8Z7VyIqU7X0u',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(27,'78042e8','1371025908050013','$2y$10$t4B9KrkNs9hQMniXW0.J0O5ogCIoA/0b8Xu7szJ7VVdobKrh74.9y',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(28,'1a37a73','1305024112060003','$2y$10$TYJc2vOAVNcqb6wYV2s7.uBcumpEMmQhaaLs5w6tNquiDBxoQjjRi',3,1,'2026-09-11 02:30:53','2026-09-23 12:43:22','2026-09-23 12:43:22'),(29,'a86d06b','1301044303040005','$2y$10$Fl.AFb6GJxFTZyWpyQKL7eUwQ3OTvYSj/oJjkRJIgK98jMoOPch9e',3,1,'2026-09-11 02:34:39','2026-09-23 12:43:22','2026-09-23 12:43:22'),(30,'5067c49','1508096811850001','$2y$10$Fa3jYG2xyAlWz6gLLB4MYOhyLU3zI.zoY5nUd7BM1UhlDABC4.SDu',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(31,'0ecf5a3','1371114104870018','$2y$10$HJ1JDhvDQRgEdMGcLOFq8esFPjEWdIgnipy7nkn8MgoXUVPe/tUom',3,1,'2026-09-11 02:43:18','2026-09-23 12:43:22','2026-09-23 12:43:22'),(32,'013dda9','1703141706000001','$2y$10$bQcUECp1eGfHg6Dx9xz28e80PPjTYTcVrb1fPAgL.ond75z82B7ne',3,1,'2026-09-11 02:43:52','2026-09-23 12:43:22','2026-09-23 12:43:22'),(33,'58c57cd','1377010510920004','$2y$10$GGx9gS.tIg8H0qrg32p2n.bxQENJeocdKsTnX/IUmXlpY.CGn./DG',3,1,'2026-09-11 02:46:52','2026-09-23 12:43:22','2026-09-23 12:43:22'),(34,'0bf55ea','1508012201090001','$2y$10$ujh/mxwMiaLNCQv0FauUsej4Sd1a/RBwV6.8uHn1epbLd76EZ3tfa',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(35,'d64f7a6','1305056705830001','$2y$10$QmPsCDjfizMHxyMJMsVkYejH94RS9NGM.gRoFDHGgfPeb1BtjswZy',3,1,'2026-09-11 02:51:20','2026-09-23 12:43:22','2026-09-23 12:43:22'),(36,'ce919dc','1305165006950001','$2y$10$wo8C7qMUbhDOxHU2YopgC.5CWD1T1KQ7aiv.fz3GbAKJw29n5CMle',3,1,'2026-09-11 02:52:11','2026-09-23 12:43:22','2026-09-23 12:43:22'),(37,'cc67868','1501026808930002','$2y$10$EDWNSJFyF/GAFNmK1pFzweXXuCRsB.ezbdrng4CS2di7I7Kgnw2ua',3,1,'2026-09-11 02:51:49','2026-09-23 12:43:22','2026-09-23 12:43:22'),(38,'59cec2c','1501025009900004','$2y$10$ZCrcSwzwmtxLkOOlu/tcq.EXa3maLjhHq5T7zHoenPxrJnR0weaq2',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(39,'51efae3','1408100504990001','$2y$10$D1/2d5MnuU/scpU7oN2u9.MhpTLS/DngDRpwAJc7QM2.yhbzE5Ln.',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(40,'97e63de','1376011212700001','$2y$10$HHtP97bOQf5LPKeIN9lShemBEzOvu8Q3WJZR0n.OY6ZTy6NkQANn2',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(41,'ab67b46','1302070610080001','$2y$10$vXiL12KM6p4ESJHDdoz4g.TOV/6KB25Kjz2xxTDg9dspz90yuatA.',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(42,'b83235d','1312015509690002','$2y$10$r9CmFi6rsH3fijfdhygrq.9pT3/GyR87gm3IwH3COq0FcMjcz9.bO',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(43,'baf5a83','1304025305720001','$2y$10$eTt8WEbqgAF2dTtFgO3C0u.CntCi0vQsXKKsH5lS.Ylt4r4zoBSf6',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(44,'cd2aca7','1302191111750002','$2y$10$vcVja0saQItAKKGcElPYEuDvjXrPhIGF8Rb/fbKlPVpJUoMmL7qXy',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(45,'0b496e8','1310034103780003','$2y$10$EXroUq2LGxaZyl8gS4uFDuWS5VjFxHFxbSkZj.MCFTYoNhLwORcia',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(46,'4d6109a','1301045110670001','$2y$10$Uy2Fzp7K3Ev7VCH7vrRm6uice9zXCqtRxhAe8OJcKlivO/RC1FmHu',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(47,'e229ecb','1304064909010001','$2y$10$gha9nDrBtcfmWYcdC2WnUe.wha5J8d9ry.wjslLAMF606niM9eoDC',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(48,'87f94fd','1301030508720004','$2y$10$iYw1lqHqpJv2pLzerd1MEOE4JREn7ZxoiYReZzlE9VSBxKWso2oBO',3,1,NULL,'2026-09-23 12:43:22','2026-09-23 12:43:22'),(49,'d38f4ac','1371104711760004','$2y$10$lpoxALeJKbzjg1nSnmsaqOBJNN/Ciu33iK7lDlRNPoDKRf.ma3LwW',3,1,'2026-09-15 03:24:00','2026-09-23 12:43:22','2026-09-23 12:43:22'),(50,'eb4d342','3174198512250034','$2y$10$mS60lvTxHXONfBUAMFk5JenVpQ0pRx5Rp1kEht4lo9qi/0l00o3Xe',1,1,'2026-09-23 12:56:04','2026-09-23 12:43:22','2026-09-23 12:56:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` VALUES (1,3,'2026-09-23 12:58:28','2026-09-23 13:00:06','::1');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Inti','inti',1,1,1,'2026-08-17 06:54:33','2026-08-17 06:54:33',NULL),(2,'Keluhan','keluhan',2,1,1,'2026-08-17 06:54:33','2026-08-17 06:54:33',NULL),(3,'Profile','profile',3,1,1,'2026-08-17 06:54:33','2026-08-17 06:54:33',NULL),(4,'Pasien','pasien',4,1,1,'2026-08-17 06:54:33','2026-08-17 06:54:33',NULL),(5,'Staff','staff',5,1,1,'2026-08-17 06:54:33','2026-08-17 06:54:33',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patientkeluhan`
--

DROP TABLE IF EXISTS `patientkeluhan`;
/*!50001 DROP VIEW IF EXISTS `patientkeluhan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientkeluhan` AS SELECT 
 1 AS `id`,
 1 AS `kode`,
 1 AS `mrn`,
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'9475ba6',3,NULL,'1372011112990001','Muhammad Afdhal','muhammadafdal5436@gmail.com','088267089642','1999-12-11','Pria','Solok',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(2,'25474c7',3,NULL,'1308141303010002','Mario Resta','restario13@gmail.com','082268609088','2001-03-13','Pria','Payakumbuh',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(3,'c3028b7',3,NULL,'1302100109050002','Putra Erlangga','putraaerlanggaa28@gmail.com','083171596074','2005-09-01','Pria','Simpang Rombio',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:59:37',NULL),(4,'3000631',3,NULL,'1304054905900001','Nani Yulia BS','naniyuliabs@gmail.com','082385568818','1990-05-09','Wanita','Payakumbuh',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(5,'f4eb221',3,NULL,'3201025107890012','Nidia Melati','nidya323@gmail.com','082286902446','1989-07-11','Wanita','Sako Batu Hampar Selatan Kec. Koto XI Tarusan Pesisir Selatan',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(6,'9092d0b',3,NULL,'1310015201010002','Fazillah','fazillahabhizar@gmail.com','085668069912','2001-01-12','Wanita','Dharmasraya',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(7,'6b3deb3',3,NULL,'1306046606920003','Indah Putri Yuni','indahputriyuni144@gmail.com','081267121961','1992-06-26','Wanita','Komp. Puri Filano Asri Blok D 1, Kubu Dalam, Parak Karakah, Padang Timur, Kota Padang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(8,'10f8b77',3,NULL,'1371014901860005','Arfika Dewi','ekadewibimaikhsan@gmail.com','085240529300','1986-01-09','Wanita','Padang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(9,'f5d63cd',3,NULL,'321513551083003','Erawati','erawati@gmail.com','081291144163','1983-10-15','Wanita','Pesisir',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(10,'2711b07',3,NULL,'1572026001860002','Mira','umar123yadi@gmail.com','082251854463','1986-01-20','Wanita','Kerinci',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(11,'0f4811c',3,NULL,'1301044910980001','Oktaviani Akbar','dep367612@gmail.com','081275740229','1998-10-09','Wanita','Padang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(12,'fb9b070',3,NULL,'1305047006600004','Alam Sori','dafitri045@gmail.com','089529483283','1960-06-30','Wanita','Sikudarak, Kapalo Hilalang, 2x11 Kayu Tanam',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(13,'ae23916',3,NULL,'1302074204870004','Mice','aristaelokbgt@gmail.com','085121234997','1987-04-02','Wanita','Solok',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(14,'a68167c',3,NULL,'1371112810790007','Zuliorahman','zuliorahman99@gmail.com','085272586062','1979-10-28','Pria','Kp.Jambak, Lubuk Buaya',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(15,'0eef9f0',3,NULL,'1305150612950001','Rozisyafri','ladiangmaja3@gmail.com','082178655757','1995-12-06','Pria','Padang Bukit',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(16,'f4bd3cb',3,NULL,'1371066312000009','Velya Puti Seruni','cecelseruni23bb@gmail.com','083194011860','2000-12-23','Wanita','Kubu Dalam Parak Karakah',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(17,'0ac0ecb',3,NULL,'1501056206950001','Anggun Susantri','anggunsusantri22@gmail.com','082278588500','1995-06-22','Wanita','Kerinci',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(18,'575f923',3,NULL,'1471080409660022','Iswandi','iswandirosman@gmail.com','082360630006','2026-09-04','Pria','Alang Lawas 4 No 29 Padang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(19,'6b8da18',3,NULL,'1303064906830001','Yanti','arin34750@gmail.com','082260468210','1983-06-02','Wanita','02.06.1983',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(20,'2b73571',3,NULL,'1501176702080001','Denia Febria','deniafebria1@gmail.com','082282690518','2008-02-27','Wanita','Kerinci',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(21,'3425df3',3,NULL,'1308135705070001','Meila Fatma','larafatmameila@gmail.com','082217351600','2007-05-17','Wanita','Ladang Panjang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(22,'6787173',3,NULL,'137301531780001','Dina Yulia','dinayulia22@gmail.com','082166034122','1978-11-13','Wanita','Andalas',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(23,'468d2f8',3,NULL,'1371026003850006','Indrawati','indrawati10@gmail.com','082160853697','1985-03-20','Pria','Purus',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(24,'78042e8',3,NULL,'1371025908050013','Shinta','sinta09@gmail.com','083136855566','1985-08-19','Wanita','Bandar Buat',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(25,'1a37a73',3,NULL,'1305024112060003','Zahwa Erianto','zahwaeriyanto2006@gmail.com','083181893102','2006-12-01','Wanita','Dusun Baru Kasai',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(26,'a86d06b',3,NULL,'1301044303040005','Abella Syelfira','syelfiraabella@gmail.com','083165723144','2004-03-03','Wanita','Koto Tuo, Kec. Batang Kapas. Kab Pesisir Selatan',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(27,'5067c49',3,NULL,'1508096811850001','Suryani','suryani@gmail.com','083136855566','1983-11-28','Wanita','Muaro Bungo',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(28,'0ecf5a3',3,NULL,'1371114104870018','Shinta Apsari','ShintaApsari1987@gmail.com','085374883369','1987-04-01','Wanita','Padang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(29,'013dda9',3,NULL,'1703141706000001','M. Reffi Pasha','mreffipasha7080@gmail.com','081268990710','2000-06-17','Pria','Kota Bani',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(30,'58c57cd',3,NULL,'1377010510920004','Oxsivo Yandra','yoxsivo@gmail.com','081267731590','1992-10-05','Pria','Kota Pariaman',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(31,'0bf55ea',3,NULL,'1508012201090001','Igo Saniawan','igosaniawan@gmail.com','082160853697','2009-02-22','Pria','Muaro Bungo',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(32,'d64f7a6',3,NULL,'1305056705830001','Reni Nila Sari','nilasarirenii3694@gmail.com','085274014503','1983-05-27','Wanita','Padang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(33,'ce919dc',3,NULL,'1305165006950001','Alvina Anggraini','alvinaaggraini@gmail.com','082385069515','1995-06-10','Wanita','Tungka Lubuak Aro, Tandikek',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(34,'cc67868',3,NULL,'1501026808930002','Nirwana','zehanm820@gmail.com','085142783193','1993-08-28','Wanita','Jambi',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(35,'59cec2c',3,NULL,'1501025009900004','Nuriman','nurimanumar43@gmail.com','081367253667','1990-09-10','Wanita','Jambi',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(36,'51efae3',3,NULL,'1408100504990001','Rinaldy Syamboja Tanjung','rinaldyranjung04@gmail.com','081256389124','1999-04-05','Pria','Bangko',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(37,'97e63de',3,NULL,'1376011212700001','Deni Permana','permanadeniii@gmail.com','083186730642','1970-12-12','Pria','Air Pacah',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(38,'ab67b46',3,NULL,'1302070610080001','Aurel Permana','aurelzxyprmn@gmail.com','08125264730','2008-01-06','Pria','Solok, Cupak',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(39,'b83235d',3,NULL,'1312015509690002','Ani Enzita','anienzitaa09@gmail.com','081266743827','1969-09-05','Wanita','Parak Karakah Kubu Dalam',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(40,'baf5a83',3,NULL,'1304025305720001','Sakinah','sakinahsari72@gmail.com','083850724476','1972-05-13','Wanita','Berok Nipah',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(41,'cd2aca7',3,NULL,'1302191111750002','Novembli','novembliansyh75@gmail.com','08318452235','1975-11-11','Pria','Bengkulu',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(42,'0b496e8',3,NULL,'1310034103780003','Asrita','asritasuliswati@gmail.com','08122787466','1978-03-01','Wanita','Jln Gang Malayu',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(43,'4d6109a',3,NULL,'1301045110670001','Yusneti','donaputri733@gmail.com','082391731445','1967-10-11','Wanita','Pesisir selatan',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(44,'e229ecb',3,NULL,'1304064909010001','Dinda Tika Azilia','tindatikaazilia@gmail.com','082286339210','2001-09-09','Wanita','Lintau',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL),(45,'87f94fd',3,NULL,'1301030508720004','Yusmarni','yusmarniarsp@gmail.com','083187764531','1972-08-10','Wanita','Padang',NULL,1,'2026-09-23 12:19:26','2026-09-23 12:19:26',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,1,'Inti','inti',1,1,1,1,'2026-08-17 06:55:44','2026-08-17 06:55:44',NULL),(2,2,'Keluhan','keluhan',1,1,1,1,'2026-08-17 06:55:44','2026-08-17 06:55:44',NULL),(3,3,'Profile','profile',1,1,1,1,'2026-08-17 06:55:44','2026-08-17 06:55:44',NULL),(4,4,'Pasien','pasien',1,1,1,1,'2026-08-17 06:55:44','2026-08-17 06:55:44',NULL),(5,5,'Staff','staff',1,1,1,1,'2026-08-17 06:55:44','2026-08-17 06:55:44',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,3,1,1,1,1,1,1,'2026-08-17 06:56:12','2026-08-17 06:56:12',NULL),(3,2,3,1,1,1,1,1,'2026-08-17 06:56:26','2026-08-17 06:56:26',NULL),(4,3,3,1,1,1,1,1,'2026-08-17 06:56:26','2026-08-17 06:56:26',NULL),(5,2,4,1,1,1,1,1,'2026-08-17 06:56:32','2026-08-17 06:56:32',NULL),(6,2,5,1,1,1,1,1,'2026-08-17 06:56:38','2026-08-17 06:56:38',NULL);
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `roles` VALUES (1,'Super Admin','superadmin',1,1,'2026-08-16 18:32:24','2026-08-16 18:32:24',NULL),(2,'Perawat','perawat',1,1,'2026-08-16 18:32:43','2026-08-16 18:32:43',NULL),(3,'Patient','patient',1,1,'2026-08-16 18:32:59','2026-08-16 18:32:59',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `roleview`
--

DROP TABLE IF EXISTS `roleview`;
/*!50001 DROP VIEW IF EXISTS `roleview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `roleview` AS SELECT 
 1 AS `privilege_id`,
 1 AS `role_id`,
 1 AS `permission_id`,
 1 AS `readable`,
 1 AS `creatable`,
 1 AS `editable`,
 1 AS `deletable`,
 1 AS `privilege_status`,
 1 AS `permission_nama`,
 1 AS `permission_label`,
 1 AS `module_id`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `sessions` VALUES ('hheuq4mfrkdj6bpg4tp6k5cdor6pj40k','::1',1790168091,_binary '__ci_last_regenerate|i:1790168091;login_attempts_22b0fa751c6e523c5158d8f6ffd81fb8|a:2:{s:5:\"count\";i:4;s:12:\"last_attempt\";i:1790167639;}id|s:1:\"1\";kode|s:7:\"eb4d342\";usernik|s:16:\"3174198512250034\";name|s:12:\"Rajesh Kumar\";roleKey|s:1:\"1\";islogin|b:1;'),('i742dhjb8m9udc4nrdjjafndkfrgg2ba','::1',1790168406,_binary '__ci_last_regenerate|i:1790168406;'),('n18lbal80qvkjpj4l1r8929shsl18jd9','::1',1790167437,_binary '__ci_last_regenerate|i:1790167437;id|s:1:\"1\";kode|s:7:\"eb4d342\";usernik|s:16:\"3174198512250034\";name|s:12:\"Rajesh Kumar\";roleKey|s:1:\"1\";islogin|b:1;'),('opv0rj7batsqcb2eh4t81rcj7sm3nas0','::1',1790166795,_binary '__ci_last_regenerate|i:1790166795;id|s:1:\"1\";kode|s:7:\"eb4d342\";usernik|s:16:\"3174198512250034\";name|s:12:\"Rajesh Kumar\";roleKey|s:1:\"1\";islogin|b:1;'),('tc2nqk0fllo149l00eev494pa2duek9u','::1',1790166376,_binary '__ci_last_regenerate|i:1790166376;id|s:1:\"1\";kode|s:7:\"eb4d342\";usernik|s:16:\"3174198512250034\";name|s:12:\"Rajesh Kumar\";roleKey|s:1:\"1\";islogin|b:1;');
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
INSERT INTO `staff` VALUES (1,'eb4d342',1,'3174198512250034','198512250034','Rajesh Kumar','rajesh.kumar@example.com','+1-212-555-0187','1985-12-25','Pria','One World Trade Center, 285 Fulton St, New York, NY 10007, USA',NULL,1,'2026-09-23 06:52:20','2026-09-23 06:52:20',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `patientkeluhan`
--

/*!50001 DROP VIEW IF EXISTS `patientkeluhan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientkeluhan` AS select `p`.`id` AS `id`,`p`.`kode` AS `kode`,`p`.`mrn` AS `mrn`,`p`.`fullname` AS `fullname`,`k`.`siklus` AS `siklus`,`k`.`last_session` AS `last_session`,`k`.`mukositis` AS `mukositis`,`k`.`kelelahan` AS `kelelahan`,`k`.`mual` AS `mual`,`k`.`muntah` AS `muntah`,`k`.`created` AS `created` from (`patients` `p` join `keluhan` `k` on((`p`.`kode` = `k`.`userKey`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `roleview`
--

/*!50001 DROP VIEW IF EXISTS `roleview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `roleview` AS select `privileges`.`id` AS `privilege_id`,`privileges`.`roleKey` AS `role_id`,`privileges`.`permissionKey` AS `permission_id`,`privileges`.`readable` AS `readable`,`privileges`.`creatable` AS `creatable`,`privileges`.`editable` AS `editable`,`privileges`.`deletable` AS `deletable`,`privileges`.`status` AS `privilege_status`,`permissions`.`nama` AS `permission_nama`,`permissions`.`label` AS `permission_label`,`permissions`.`moduleKey` AS `module_id` from (`privileges` join `permissions` on((`permissions`.`id` = `privileges`.`permissionKey`))) where ((`privileges`.`status` = 1) and (`privileges`.`deleted` is null) and (`permissions`.`deleted` is null)) */;
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

-- Dump completed on 2026-09-23 13:02:41
