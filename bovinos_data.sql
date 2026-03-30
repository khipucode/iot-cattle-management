/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.2.1-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: bovinos
-- ------------------------------------------------------
-- Server version	12.2.1-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle`
--

LOCK TABLES `cattle` WRITE;
/*!40000 ALTER TABLE `cattle` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cattle` VALUES
(1,'BR00001','2023-01-15','Nelore',2500.00,NULL,'active',NULL,'2025-11-22 00:31:59'),
(2,'BR00002','2023-11-10','Angus',2800.50,NULL,'active',NULL,'2025-11-22 00:32:52'),
(3,'BR00003','2024-02-26','Simental',1890.00,NULL,'active',NULL,'2025-11-24 12:26:26'),
(4,'BR00004','2022-02-07','Nelore',1500.00,NULL,'active',NULL,'2025-11-24 15:56:55'),
(5,'BR00005','2022-02-02','Guzera',3400.00,NULL,'active',NULL,'2025-11-24 15:56:55'),
(6,'BR00006','2022-06-09','Guzera',3400.00,NULL,'active',NULL,'2025-11-24 15:56:55'),
(7,'BR00007','2023-03-09','Guzera',2200.00,NULL,'active',NULL,'2025-11-24 16:37:47'),
(8,'BR00008','2021-10-03','Angus',1600.00,NULL,'active',NULL,'2025-11-24 16:37:47'),
(9,'BR00009','2020-06-04','Angus',1600.00,NULL,'active',NULL,'2025-11-24 16:37:47'),
(10,'BR00010','2021-05-02','Devon',2000.00,NULL,'active',NULL,'2025-11-24 16:37:47'),
(11,'BR00011','2023-08-22','mini_Jarsey',1400.00,NULL,'active',NULL,'2025-11-24 16:37:47'),
(12,'BR00012','2023-03-02','Tabapua',2300.00,NULL,'active',NULL,'2025-11-24 16:37:47'),
(13,'BR00013','2021-06-20','Tabapua',2200.00,NULL,'active',NULL,'2025-11-24 17:00:17'),
(14,'BR00014','2020-11-07','Nelore',2800.00,NULL,'active',NULL,'2025-11-24 17:00:17'),
(15,'BR00015','2024-12-31','Devon',2100.00,NULL,'active',NULL,'2025-11-24 17:00:17'),
(16,'BR00016','2020-03-18','Angus',1890.00,NULL,'active',NULL,'2025-11-24 17:00:17'),
(17,'BR00017','2023-10-07','Holandes',3600.00,NULL,'active',NULL,'2025-11-24 17:00:17'),
(18,'BR00018','2022-07-26','Holandes',3600.00,NULL,'active',NULL,'2025-11-24 17:00:17'),
(19,'BR00019','2018-05-12','Devon',3000.00,NULL,'active',NULL,'2025-11-24 17:00:17'),
(20,'BR00020','2019-09-11','Devon',2300.00,NULL,'active',NULL,'2025-11-24 17:00:17');
/*!40000 ALTER TABLE `cattle` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_births`
--

LOCK TABLES `cattle_births` WRITE;
/*!40000 ALTER TABLE `cattle_births` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_births` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_breeding`
--

LOCK TABLES `cattle_breeding` WRITE;
/*!40000 ALTER TABLE `cattle_breeding` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_breeding` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_deaths`
--

LOCK TABLES `cattle_deaths` WRITE;
/*!40000 ALTER TABLE `cattle_deaths` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_deaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_feeding`
--

LOCK TABLES `cattle_feeding` WRITE;
/*!40000 ALTER TABLE `cattle_feeding` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_feeding` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_health`
--

LOCK TABLES `cattle_health` WRITE;
/*!40000 ALTER TABLE `cattle_health` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_health` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_milking`
--

LOCK TABLES `cattle_milking` WRITE;
/*!40000 ALTER TABLE `cattle_milking` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_milking` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_missing`
--

LOCK TABLES `cattle_missing` WRITE;
/*!40000 ALTER TABLE `cattle_missing` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_missing` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_movements`
--

LOCK TABLES `cattle_movements` WRITE;
/*!40000 ALTER TABLE `cattle_movements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_movements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_photos`
--

LOCK TABLES `cattle_photos` WRITE;
/*!40000 ALTER TABLE `cattle_photos` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_photos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_sales`
--

LOCK TABLES `cattle_sales` WRITE;
/*!40000 ALTER TABLE `cattle_sales` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_sales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_tags`
--

LOCK TABLES `cattle_tags` WRITE;
/*!40000 ALTER TABLE `cattle_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_treatments`
--

LOCK TABLES `cattle_treatments` WRITE;
/*!40000 ALTER TABLE `cattle_treatments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_treatments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_vaccinations`
--

LOCK TABLES `cattle_vaccinations` WRITE;
/*!40000 ALTER TABLE `cattle_vaccinations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cattle_vaccinations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cattle_weights`
--

LOCK TABLES `cattle_weights` WRITE;
/*!40000 ALTER TABLE `cattle_weights` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cattle_weights` VALUES
(1,1,'2025-11-22 00:31:59',250.50,NULL,'migrao inicial'),
(2,2,'2025-11-22 00:32:52',250.50,NULL,'migrao inicial'),
(3,3,'2025-11-24 12:26:26',200.00,NULL,'migrao inicial'),
(4,4,'2025-11-24 15:56:55',100.00,NULL,'migrao inicial'),
(5,5,'2025-11-24 15:56:55',340.00,NULL,'migrao inicial'),
(6,6,'2025-11-24 15:56:55',340.00,NULL,'migrao inicial'),
(7,7,'2025-11-24 16:37:47',300.00,NULL,'migrao inicial'),
(8,8,'2025-11-24 16:37:47',150.00,NULL,'migrao inicial'),
(9,9,'2025-11-24 16:37:47',150.00,NULL,'migrao inicial'),
(10,10,'2025-11-24 16:37:47',170.00,NULL,'migrao inicial'),
(11,11,'2025-11-24 16:37:47',100.00,NULL,'migrao inicial'),
(12,12,'2025-11-24 16:37:47',192.00,NULL,'migrao inicial'),
(13,13,'2025-11-24 17:00:17',160.00,NULL,'migrao inicial'),
(14,14,'2025-11-24 17:00:17',222.00,NULL,'migrao inicial'),
(15,15,'2025-11-24 17:00:17',270.00,NULL,'migrao inicial'),
(16,16,'2025-11-24 17:00:17',230.00,NULL,'migrao inicial'),
(17,17,'2025-11-24 17:00:17',196.00,NULL,'migrao inicial'),
(18,18,'2025-11-24 17:00:17',270.00,NULL,'migrao inicial'),
(19,19,'2025-11-24 17:00:17',167.00,NULL,'migrao inicial'),
(20,20,'2025-11-24 17:00:17',234.00,NULL,'migrao inicial'),
(32,8,'2026-02-09 14:21:54',NULL,NULL,''),
(33,19,'2026-02-09 14:22:02',NULL,NULL,''),
(34,9,'2026-02-09 14:22:04',NULL,NULL,''),
(35,16,'2026-02-09 14:22:08',NULL,NULL,''),
(36,19,'2026-02-09 14:22:15',367.20,NULL,''),
(37,9,'2026-02-09 14:22:19',NULL,NULL,''),
(38,16,'2026-02-09 14:22:21',NULL,NULL,''),
(39,17,'2026-02-09 14:22:27',NULL,NULL,''),
(40,10,'2026-02-09 14:22:33',245.90,NULL,''),
(41,15,'2026-02-09 14:22:38',NULL,NULL,''),
(42,11,'2026-02-09 14:22:46',NULL,NULL,''),
(43,6,'2026-02-09 14:22:49',NULL,NULL,''),
(44,11,'2026-02-09 14:22:56',NULL,NULL,''),
(45,11,'2026-02-09 14:23:03',296.70,NULL,''),
(46,6,'2026-02-09 14:23:07',NULL,NULL,''),
(47,14,'2026-02-09 14:23:11',NULL,NULL,''),
(48,12,'2026-02-09 14:23:13',NULL,NULL,''),
(49,1,'2026-02-09 14:23:16',NULL,NULL,''),
(50,5,'2026-02-09 14:23:21',333.60,NULL,''),
(51,20,'2026-02-09 14:23:26',NULL,NULL,''),
(52,17,'2026-02-09 14:23:30',NULL,NULL,''),
(53,15,'2026-02-09 14:23:33',NULL,NULL,''),
(54,12,'2026-02-09 14:23:39',NULL,NULL,''),
(55,16,'2026-02-09 14:23:42',NULL,NULL,''),
(56,11,'2026-02-09 14:23:45',367.40,NULL,''),
(57,9,'2026-02-09 14:23:49',287.90,NULL,''),
(58,12,'2026-02-09 14:23:53',NULL,NULL,''),
(59,13,'2026-02-09 14:24:00',NULL,NULL,''),
(60,14,'2026-02-09 14:24:05',NULL,NULL,''),
(61,18,'2026-02-09 14:24:10',NULL,NULL,''),
(62,4,'2026-02-09 14:24:15',NULL,NULL,''),
(63,19,'2026-02-09 14:24:21',NULL,NULL,''),
(64,7,'2026-02-09 14:24:26',NULL,NULL,''),
(65,18,'2026-02-09 14:24:31',NULL,NULL,''),
(66,20,'2026-02-09 14:24:38',NULL,NULL,''),
(67,16,'2026-02-09 14:24:42',NULL,NULL,''),
(68,20,'2026-02-09 14:24:45',NULL,NULL,''),
(69,11,'2026-02-09 14:24:53',266.90,NULL,''),
(70,15,'2026-02-09 14:25:00',NULL,NULL,''),
(71,1,'2026-02-09 14:25:06',NULL,NULL,''),
(72,17,'2026-02-09 14:25:12',NULL,NULL,''),
(73,11,'2026-02-09 14:25:19',NULL,NULL,''),
(74,8,'2026-02-09 14:25:25',NULL,NULL,''),
(75,10,'2026-02-09 14:25:28',NULL,NULL,''),
(76,11,'2026-02-09 14:25:33',NULL,NULL,''),
(77,11,'2026-02-09 14:25:35',NULL,NULL,''),
(78,12,'2026-02-09 14:25:38',NULL,NULL,''),
(79,10,'2026-02-09 14:25:44',NULL,NULL,''),
(80,18,'2026-02-09 14:25:50',NULL,NULL,''),
(81,13,'2026-02-09 14:25:56',NULL,NULL,''),
(82,4,'2026-02-09 14:26:03',NULL,NULL,''),
(83,7,'2026-02-09 14:26:07',310.90,NULL,''),
(84,20,'2026-02-09 14:26:10',NULL,NULL,''),
(85,9,'2026-02-09 14:26:17',379.10,NULL,''),
(86,2,'2026-02-09 14:26:24',NULL,NULL,''),
(87,11,'2026-02-09 14:26:31',256.60,NULL,''),
(88,6,'2026-02-09 14:26:38',NULL,NULL,''),
(89,19,'2026-02-09 14:26:41',NULL,NULL,''),
(90,4,'2026-02-09 14:26:44',NULL,NULL,''),
(91,19,'2026-02-09 14:26:50',NULL,NULL,''),
(92,6,'2026-02-09 14:26:54',NULL,NULL,''),
(93,20,'2026-02-09 14:27:00',NULL,NULL,''),
(94,1,'2026-02-09 14:27:06',NULL,NULL,''),
(95,18,'2026-02-09 14:27:11',NULL,NULL,''),
(96,17,'2026-02-09 14:27:13',324.30,NULL,''),
(97,2,'2026-02-09 14:27:16',NULL,NULL,''),
(98,6,'2026-02-09 14:27:24',NULL,NULL,''),
(99,7,'2026-02-09 14:27:30',NULL,NULL,''),
(100,12,'2026-02-09 14:27:35',NULL,NULL,''),
(101,4,'2026-02-09 14:27:41',NULL,NULL,''),
(102,2,'2026-02-09 14:27:48',NULL,NULL,''),
(103,12,'2026-02-09 14:27:51',NULL,NULL,''),
(104,5,'2026-02-09 14:27:57',NULL,NULL,''),
(105,2,'2026-02-09 14:28:01',217.60,NULL,''),
(106,18,'2026-02-09 14:28:07',NULL,NULL,''),
(107,20,'2026-02-09 14:28:11',NULL,NULL,''),
(108,14,'2026-02-09 14:28:15',309.60,NULL,''),
(109,14,'2026-02-09 14:28:17',NULL,NULL,''),
(110,3,'2026-02-09 14:28:23',286.90,NULL,''),
(111,13,'2026-02-09 14:28:25',NULL,NULL,''),
(112,8,'2026-02-09 14:28:28',NULL,NULL,''),
(113,18,'2026-02-09 14:28:34',NULL,NULL,''),
(114,18,'2026-02-09 14:28:42',NULL,NULL,''),
(115,19,'2026-02-09 14:28:45',NULL,NULL,''),
(116,7,'2026-02-09 14:28:52',387.50,NULL,''),
(117,20,'2026-02-09 14:28:57',NULL,NULL,''),
(118,5,'2026-02-09 14:29:05',NULL,NULL,''),
(119,3,'2026-02-09 14:29:07',NULL,NULL,''),
(120,5,'2026-02-09 14:29:12',NULL,NULL,''),
(121,13,'2026-02-09 14:29:16',240.80,NULL,''),
(122,1,'2026-02-09 11:46:00',350.00,NULL,'Pesagem automática'),
(123,2,'2026-02-09 15:46:29',293.30,NULL,'Pesagem automática'),
(124,2,'2026-02-09 15:47:07',302.80,NULL,'Pesagem automática'),
(125,5,'2026-02-09 15:47:22',305.00,NULL,'Pesagem automática'),
(126,5,'2026-02-09 15:47:41',332.20,NULL,'Pesagem automática'),
(127,4,'2026-02-09 15:47:52',317.40,NULL,'Pesagem automática'),
(128,4,'2026-02-09 15:47:57',329.80,NULL,'Pesagem automática'),
(129,3,'2026-02-09 15:48:13',220.30,NULL,'Pesagem automática'),
(130,1,'2026-02-09 15:48:40',269.10,NULL,'Pesagem automática'),
(131,3,'2026-02-09 15:48:54',226.10,NULL,'Pesagem automática'),
(132,4,'2026-02-09 15:49:10',361.00,NULL,'Pesagem automática'),
(133,2,'2026-02-09 15:49:25',331.60,NULL,'Pesagem automática'),
(134,4,'2026-02-09 15:49:31',295.80,NULL,'Pesagem automática'),
(135,1,'2026-02-09 15:50:01',228.00,NULL,'Pesagem automática'),
(136,4,'2026-02-09 15:50:21',326.10,NULL,'Pesagem automática'),
(137,2,'2026-02-09 15:50:27',384.30,NULL,'Pesagem automática'),
(138,4,'2026-02-09 15:50:45',209.60,NULL,'Pesagem automática'),
(139,3,'2026-02-09 15:51:18',216.20,NULL,'Pesagem automática'),
(140,4,'2026-02-09 15:51:26',295.50,NULL,'Pesagem automática'),
(141,1,'2026-02-09 15:51:59',342.20,NULL,'Pesagem automática'),
(142,3,'2026-02-09 15:52:15',260.80,NULL,'Pesagem automática'),
(143,3,'2026-02-09 15:52:30',384.10,NULL,'Pesagem automática'),
(144,2,'2026-02-09 15:53:01',368.50,NULL,'Pesagem automática'),
(145,1,'2026-02-09 15:53:03',341.70,NULL,'Pesagem automática'),
(146,3,'2026-02-09 15:53:54',385.50,NULL,'Pesagem automática'),
(147,2,'2026-02-09 15:54:03',265.10,NULL,'Pesagem automática'),
(148,2,'2026-02-09 15:54:13',283.90,NULL,'Pesagem automática'),
(149,5,'2026-02-09 15:54:27',388.40,NULL,'Pesagem automática'),
(150,1,'2026-02-09 15:54:38',359.20,NULL,'Pesagem automática'),
(151,2,'2026-02-09 15:54:41',333.50,NULL,'Pesagem automática'),
(152,5,'2026-02-09 15:54:47',277.00,NULL,'Pesagem automática'),
(153,2,'2026-02-09 15:55:15',222.10,NULL,'Pesagem automática'),
(154,8,'2026-02-09 15:55:25',377.00,NULL,'Pesagem automática'),
(155,15,'2026-02-09 15:55:33',214.20,NULL,'Pesagem automática'),
(156,18,'2026-02-09 15:55:35',257.20,NULL,'Pesagem automática'),
(157,9,'2026-02-09 15:55:45',290.90,NULL,'Pesagem automática'),
(158,16,'2026-02-09 15:55:55',369.40,NULL,'Pesagem automática'),
(159,2,'2026-02-09 15:56:05',277.10,NULL,'Pesagem automática'),
(160,9,'2026-02-09 15:56:23',270.00,NULL,'Pesagem automática'),
(161,18,'2026-02-09 15:56:32',324.60,NULL,'Pesagem automática'),
(162,11,'2026-02-09 15:56:42',216.10,NULL,'Pesagem automática'),
(163,14,'2026-02-09 15:56:47',298.40,NULL,'Pesagem automática'),
(164,8,'2026-02-09 15:56:50',251.10,NULL,'Pesagem automática'),
(165,7,'2026-02-09 15:57:28',225.20,NULL,'Pesagem automática'),
(166,11,'2026-02-09 15:57:42',398.90,NULL,'Pesagem automática'),
(167,7,'2026-02-09 15:57:44',249.90,NULL,'Pesagem automática'),
(168,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(169,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(170,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(171,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(172,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(173,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(174,2,'2026-02-23 11:15:00',482.00,NULL,'pesagem automática'),
(175,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(176,2,'2026-02-23 11:15:00',482.00,NULL,'pesagem automática'),
(177,2,'2026-02-23 11:15:00',482.00,NULL,'pesagem automática'),
(178,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(179,2,'2026-02-23 11:15:00',482.00,NULL,'pesagem automática'),
(180,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(181,5,'2026-02-23 11:10:32',247.00,NULL,'Pesagem automática'),
(182,16,'2026-02-23 11:11:05',289.40,NULL,'Pesagem automática'),
(183,9,'2026-02-23 11:11:40',263.00,NULL,'Pesagem automática'),
(184,15,'2026-02-23 11:12:19',374.20,NULL,'Pesagem automática'),
(185,6,'2026-02-23 11:12:25',345.30,NULL,'Pesagem automática'),
(186,1,'2026-02-23 11:12:50',300.00,NULL,'Pesagem automática'),
(187,6,'2026-02-23 11:13:16',377.50,NULL,'Pesagem automática'),
(188,2,'2026-02-23 11:13:31',322.60,NULL,'Pesagem automática'),
(189,5,'2026-02-23 11:13:52',225.80,NULL,'Pesagem automática'),
(190,1,'2026-02-23 11:14:19',386.90,NULL,'Pesagem automática'),
(191,4,'2026-02-23 11:14:53',339.40,NULL,'Pesagem automática'),
(192,17,'2026-02-23 11:14:57',305.40,NULL,'Pesagem automática'),
(193,17,'2026-02-23 11:15:17',281.70,NULL,'Pesagem automática'),
(194,20,'2026-02-23 11:15:22',232.00,NULL,'Pesagem automática'),
(195,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(196,1,'2026-02-23 11:16:21',238.00,NULL,'Pesagem automática'),
(197,18,'2026-02-23 11:16:49',352.90,NULL,'Pesagem automática'),
(198,15,'2026-02-23 11:16:54',210.50,NULL,'Pesagem automática'),
(199,5,'2026-02-23 11:16:58',250.90,NULL,'Pesagem automática'),
(200,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(201,19,'2026-02-23 11:17:44',363.70,NULL,'Pesagem automática'),
(202,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(203,13,'2026-02-23 11:17:51',381.40,NULL,'Pesagem automática'),
(204,8,'2026-02-23 11:17:57',270.80,NULL,'Pesagem automática'),
(205,12,'2026-02-23 11:18:32',384.00,NULL,'Pesagem automática'),
(206,14,'2026-02-23 11:18:41',396.30,NULL,'Pesagem automática'),
(207,1,'2026-02-23 11:19:09',302.00,NULL,'Pesagem automática'),
(208,17,'2026-02-23 11:19:11',382.50,NULL,'Pesagem automática'),
(209,2,'2026-02-23 11:20:00',450.50,NULL,'Teste manual de pesagem'),
(210,7,'2026-02-23 11:19:53',274.00,NULL,'Pesagem automática'),
(211,12,'2026-02-23 11:20:03',342.70,NULL,'Pesagem automática'),
(212,15,'2026-02-23 11:20:10',231.40,NULL,'Pesagem automática'),
(213,8,'2026-02-23 11:20:16',387.40,NULL,'Pesagem automática'),
(214,1,'2026-02-23 11:20:00',450.50,NULL,'Teste manual de pesagem'),
(215,14,'2026-02-23 11:20:55',378.40,NULL,'Pesagem automática'),
(216,5,'2026-02-23 11:21:04',384.30,NULL,'Pesagem automática'),
(217,9,'2026-02-23 11:21:10',368.70,NULL,'Pesagem automática'),
(218,18,'2026-02-23 11:21:16',352.20,NULL,'Pesagem automática'),
(219,4,'2026-02-23 11:21:20',206.10,NULL,'Pesagem automática'),
(220,17,'2026-02-23 11:21:31',217.80,NULL,'Pesagem automática'),
(221,14,'2026-02-23 11:21:34',382.40,NULL,'Pesagem automática'),
(222,12,'2026-02-23 11:22:08',331.10,NULL,'Pesagem automática'),
(223,15,'2026-02-23 11:22:11',321.20,NULL,'Pesagem automática'),
(224,1,'2026-02-23 11:20:00',450.50,NULL,'Teste manual de pesagem'),
(225,1,'2026-02-23 11:20:00',450.50,NULL,'Teste manual de pesagem'),
(226,2,'2026-02-23 10:25:00',480.00,NULL,'pesagem realizada automaticamente'),
(227,8,'2026-02-23 15:35:54',248.60,3,'Pesagem automática'),
(228,3,'2026-02-23 18:40:05',363.00,2,'Pesagem de rotina'),
(229,2,'2026-02-23 18:40:11',421.20,2,'Pesagem de rotina'),
(230,6,'2026-02-23 18:40:14',449.90,3,'Pesagem manual'),
(231,14,'2026-02-23 18:40:32',324.80,3,'Pesagem de rotina'),
(232,2,'2026-02-23 18:40:47',213.60,2,'Pesagem automática'),
(233,19,'2026-02-23 18:41:00',247.40,6,'Pesagem automática'),
(234,3,'2026-02-23 18:41:06',244.80,6,'Pesagem de rotina'),
(235,9,'2026-02-23 18:41:18',385.30,6,'Pesagem automática'),
(236,9,'2026-02-23 18:41:28',403.80,3,'Pesagem automática'),
(237,12,'2026-02-23 18:41:36',437.80,6,'Pesagem de rotina'),
(238,13,'2026-02-23 18:41:40',218.30,2,'Pesagem de rotina'),
(239,15,'2026-02-23 18:41:47',253.80,3,'Pesagem manual'),
(240,16,'2026-02-23 18:42:13',269.30,3,'Pesagem automática'),
(241,14,'2026-02-23 18:42:17',289.00,6,'Pesagem automática'),
(242,6,'2026-02-23 18:42:19',400.30,2,'Pesagem de rotina'),
(243,19,'2026-02-23 18:42:23',374.70,3,'Pesagem automática'),
(244,10,'2026-02-23 18:42:38',292.50,6,'Pesagem automática'),
(245,20,'2026-02-23 18:42:53',357.10,2,'Pesagem de rotina'),
(246,5,'2026-02-23 18:43:21',254.60,3,'Pesagem de rotina'),
(247,19,'2026-02-23 18:43:27',379.50,3,'Pesagem automática'),
(248,19,'2026-02-23 18:43:55',213.80,2,'Pesagem de rotina'),
(249,7,'2026-02-23 18:44:10',239.90,2,'Pesagem manual'),
(250,5,'2026-02-23 18:44:12',360.80,6,'Pesagem manual'),
(251,6,'2026-02-23 18:44:41',374.20,6,'Pesagem manual'),
(252,9,'2026-02-23 18:44:52',235.70,6,'Pesagem de rotina'),
(253,1,'2026-02-23 18:45:02',393.30,2,'Pesagem de rotina'),
(254,6,'2026-02-23 18:45:20',442.90,2,'Pesagem automática'),
(255,7,'2026-02-23 18:45:23',245.40,3,'Pesagem manual'),
(256,3,'2026-02-23 18:45:27',228.40,2,'Pesagem manual'),
(257,18,'2026-02-23 18:45:44',300.60,3,'Pesagem manual'),
(258,9,'2026-02-23 18:45:49',371.20,6,'Pesagem automática'),
(259,3,'2026-02-23 18:45:59',257.60,6,'Pesagem manual'),
(260,5,'2026-02-23 18:46:45',432.80,6,'Pesagem manual'),
(261,4,'2026-02-23 18:46:53',377.10,2,'Pesagem automática'),
(262,3,'2026-02-23 18:47:10',367.40,6,'Pesagem de rotina'),
(263,9,'2026-02-23 18:47:13',416.20,6,'Pesagem de rotina'),
(264,6,'2026-02-23 18:47:28',203.60,6,'Pesagem de rotina'),
(265,6,'2026-02-23 18:47:58',441.70,6,'Pesagem automática'),
(266,16,'2026-02-23 18:48:02',321.50,6,'Pesagem manual'),
(267,3,'2026-02-23 18:48:04',222.80,6,'Pesagem automática'),
(268,18,'2026-02-23 18:48:23',281.10,2,'Pesagem automática'),
(269,12,'2026-02-23 18:48:37',377.60,2,'Pesagem de rotina'),
(270,14,'2026-02-23 18:48:45',407.50,2,'Pesagem manual'),
(271,4,'2026-02-23 18:48:48',221.90,2,'Pesagem manual'),
(272,18,'2026-02-23 18:48:53',304.60,2,'Pesagem de rotina'),
(273,14,'2026-02-23 18:49:08',270.30,3,'Pesagem manual'),
(274,12,'2026-02-23 18:49:24',339.30,2,'Pesagem de rotina'),
(275,5,'2026-02-23 18:49:47',445.00,2,'Pesagem de rotina'),
(276,13,'2026-02-23 18:50:21',287.10,6,'Pesagem automática'),
(277,16,'2026-02-23 18:50:24',326.60,6,'Pesagem automática'),
(278,13,'2026-02-23 18:50:42',351.00,2,'Pesagem manual'),
(279,8,'2026-02-23 18:51:03',355.20,2,'Pesagem manual'),
(280,6,'2026-02-23 18:51:24',225.40,2,'Pesagem de rotina'),
(281,16,'2026-02-23 18:51:30',294.20,6,'Pesagem manual'),
(282,8,'2026-02-23 18:51:55',421.70,3,'Pesagem manual'),
(283,10,'2026-02-23 18:52:12',251.20,6,'Pesagem de rotina'),
(284,4,'2026-02-23 18:52:34',429.10,3,'Pesagem manual'),
(285,16,'2026-02-23 18:52:39',217.10,6,'Pesagem automática'),
(286,9,'2026-02-23 18:52:55',408.10,6,'Pesagem manual'),
(287,7,'2026-02-23 18:53:09',410.80,3,'Pesagem manual'),
(288,20,'2026-02-23 18:53:19',217.00,3,'Pesagem de rotina'),
(289,11,'2026-02-23 18:53:30',231.30,6,'Pesagem de rotina'),
(290,13,'2026-02-23 18:53:40',203.50,6,'Pesagem manual'),
(291,6,'2026-02-23 18:53:52',400.00,6,'Pesagem de rotina'),
(292,20,'2026-02-23 18:54:07',345.10,3,'Pesagem de rotina'),
(293,3,'2026-02-23 18:54:25',261.30,6,'Pesagem de rotina'),
(294,1,'2026-02-23 18:55:02',352.90,2,'Pesagem manual'),
(295,9,'2026-02-23 18:55:28',357.60,2,'Pesagem manual'),
(296,9,'2026-02-23 18:55:34',336.70,2,'Pesagem manual'),
(297,3,'2026-02-23 18:55:39',427.80,6,'Pesagem manual'),
(298,19,'2026-02-23 18:56:02',433.20,3,'Pesagem de rotina'),
(299,6,'2026-02-23 18:56:09',340.50,6,'Pesagem automática'),
(300,13,'2026-02-23 18:56:14',282.90,2,'Pesagem automática'),
(301,4,'2026-02-23 18:56:19',448.90,2,'Pesagem manual'),
(302,13,'2026-02-23 18:56:48',407.80,6,'Pesagem manual'),
(303,11,'2026-02-23 18:56:50',291.40,3,'Pesagem manual'),
(304,11,'2026-02-23 18:56:56',243.50,2,'Pesagem automática'),
(305,19,'2026-02-23 18:57:05',337.60,6,'Pesagem manual'),
(306,4,'2026-02-23 18:57:12',236.60,6,'Pesagem automática'),
(307,20,'2026-02-23 18:57:40',418.10,6,'Pesagem manual'),
(308,7,'2026-02-23 18:57:54',356.20,3,'Pesagem de rotina'),
(309,11,'2026-02-23 18:58:27',285.70,3,'Pesagem automática'),
(310,18,'2026-02-23 18:58:52',367.70,6,'Pesagem de rotina'),
(311,15,'2026-02-23 18:59:04',352.40,2,'Pesagem automática'),
(312,14,'2026-02-23 18:59:32',250.40,2,'Pesagem manual'),
(313,6,'2026-02-23 19:00:04',306.00,3,'Pesagem manual'),
(314,6,'2026-02-23 19:00:18',414.60,3,'Pesagem automática'),
(315,9,'2026-02-23 19:00:35',229.90,2,'Pesagem de rotina'),
(316,7,'2026-02-23 19:00:43',390.70,3,'Pesagem manual'),
(317,15,'2026-02-23 19:00:54',375.40,6,'Pesagem de rotina'),
(318,19,'2026-02-23 19:00:57',239.00,2,'Pesagem automática'),
(319,3,'2026-02-23 19:01:06',371.20,3,'Pesagem manual'),
(320,15,'2026-02-23 19:01:09',343.50,6,'Pesagem automática'),
(321,12,'2026-02-23 19:01:13',320.80,6,'Pesagem de rotina'),
(322,13,'2026-02-23 19:01:21',283.50,6,'Pesagem manual'),
(323,2,'2026-02-23 19:01:42',231.20,2,'Pesagem de rotina'),
(324,6,'2026-02-23 19:01:52',400.80,6,'Pesagem de rotina'),
(325,15,'2026-02-23 19:02:11',284.40,6,'Pesagem manual'),
(326,20,'2026-02-23 19:02:21',407.90,6,'Pesagem de rotina'),
(327,19,'2026-02-23 19:02:29',288.10,6,'Pesagem automática'),
(328,3,'2026-02-23 19:03:02',317.40,2,'Pesagem de rotina'),
(329,12,'2026-02-23 19:03:09',293.70,2,'Pesagem manual'),
(330,1,'2026-02-23 19:03:13',232.90,6,'Pesagem de rotina'),
(331,19,'2026-02-23 19:03:17',380.10,2,'Pesagem automática'),
(332,13,'2026-02-23 19:03:32',237.70,3,'Pesagem automática'),
(333,11,'2026-02-23 19:04:08',259.90,3,'Pesagem de rotina'),
(334,15,'2026-02-23 19:04:15',250.40,3,'Pesagem manual'),
(335,5,'2026-02-23 19:04:39',419.80,2,'Pesagem automática'),
(336,10,'2026-02-23 19:04:49',213.40,3,'Pesagem de rotina'),
(337,7,'2026-02-23 19:05:06',203.00,2,'Pesagem manual'),
(338,15,'2026-02-23 19:05:09',383.10,3,'Pesagem de rotina'),
(339,10,'2026-02-23 19:05:28',229.60,6,'Pesagem de rotina'),
(340,7,'2026-02-23 19:06:04',418.40,3,'Pesagem manual'),
(341,15,'2026-02-23 19:06:08',213.90,6,'Pesagem automática'),
(342,13,'2026-02-23 19:06:21',375.80,3,'Pesagem automática'),
(343,3,'2026-02-23 19:06:23',439.60,3,'Pesagem manual'),
(344,19,'2026-02-23 19:06:41',270.60,6,'Pesagem automática'),
(345,14,'2026-02-23 19:06:51',268.20,6,'Pesagem de rotina'),
(346,6,'2026-02-23 19:06:58',376.30,6,'Pesagem automática'),
(347,15,'2026-02-23 19:07:06',420.30,2,'Pesagem de rotina'),
(348,17,'2026-02-23 19:07:17',233.70,2,'Pesagem manual'),
(349,8,'2026-02-23 19:07:23',379.60,3,'Pesagem automática'),
(350,11,'2026-02-23 19:07:26',363.50,2,'Pesagem de rotina'),
(351,11,'2026-02-23 19:07:38',271.80,2,'Pesagem manual'),
(352,6,'2026-02-23 19:07:43',248.40,6,'Pesagem manual'),
(353,6,'2026-02-23 19:08:04',287.70,2,'Pesagem manual'),
(354,8,'2026-02-23 19:08:13',206.60,6,'Pesagem de rotina'),
(355,13,'2026-02-23 19:08:25',416.10,2,'Pesagem manual'),
(356,6,'2026-02-23 19:08:29',383.30,2,'Pesagem de rotina'),
(357,6,'2026-02-23 19:09:03',234.50,3,'Pesagem manual'),
(358,10,'2026-02-23 19:09:59',346.70,2,'Pesagem manual'),
(359,5,'2026-02-23 19:10:34',304.40,2,'Pesagem manual'),
(360,3,'2026-02-23 19:10:38',325.40,3,'Pesagem de rotina'),
(361,16,'2026-02-23 19:10:48',209.30,2,'Pesagem manual'),
(362,15,'2026-02-23 19:11:09',379.50,3,'Pesagem manual'),
(363,15,'2026-02-23 19:11:29',372.30,2,'Pesagem de rotina'),
(364,5,'2026-02-23 19:11:35',392.50,3,'Pesagem de rotina'),
(365,13,'2026-02-23 19:12:11',207.50,2,'Pesagem de rotina'),
(366,2,'2026-02-23 19:12:28',316.30,3,'Pesagem automática'),
(367,15,'2026-02-23 19:12:31',216.50,3,'Pesagem de rotina'),
(368,6,'2026-02-23 19:12:46',229.20,6,'Pesagem de rotina'),
(369,18,'2026-02-23 19:13:13',266.10,2,'Pesagem automática'),
(370,19,'2026-02-23 19:13:25',293.90,6,'Pesagem de rotina'),
(371,13,'2026-02-23 19:13:37',336.70,6,'Pesagem manual'),
(372,17,'2026-02-23 19:13:41',265.40,6,'Pesagem manual'),
(373,18,'2026-02-23 19:13:49',231.00,6,'Pesagem de rotina'),
(374,6,'2026-02-23 19:14:33',316.30,3,'Pesagem de rotina'),
(375,8,'2026-02-23 19:19:12',272.30,3,'Pesagem automática'),
(376,19,'2026-02-23 19:19:18',344.10,3,'Pesagem de rotina'),
(377,20,'2026-03-16 11:13:40',279.50,2,'Pesagem de rotina'),
(378,6,'2026-03-16 11:13:51',314.70,2,'Pesagem manual'),
(379,11,'2026-03-16 11:14:11',419.70,3,'Pesagem de rotina'),
(380,11,'2026-03-16 11:14:54',342.60,3,'Pesagem manual'),
(381,2,'2026-03-16 11:15:00',386.50,2,'Pesagem automática'),
(382,16,'2026-03-16 11:15:04',292.80,3,'Pesagem de rotina'),
(383,15,'2026-03-16 11:15:20',212.90,2,'Pesagem automática'),
(384,2,'2026-03-16 11:15:56',221.30,6,'Pesagem manual'),
(385,7,'2026-03-16 11:16:01',281.70,6,'Pesagem manual'),
(386,4,'2026-03-16 11:16:34',437.30,3,'Pesagem manual'),
(387,18,'2026-03-16 11:16:45',212.40,2,'Pesagem automática'),
(388,20,'2026-03-16 11:17:03',248.20,6,'Pesagem automática'),
(389,4,'2026-03-16 11:17:09',273.80,2,'Pesagem automática'),
(390,12,'2026-03-16 11:17:21',413.40,3,'Pesagem automática'),
(391,12,'2026-03-16 11:17:31',312.10,3,'Pesagem automática'),
(392,2,'2026-03-16 11:17:54',433.50,6,'Pesagem manual'),
(393,12,'2026-03-16 11:18:14',272.80,3,'Pesagem de rotina'),
(394,19,'2026-03-16 11:18:23',308.30,3,'Pesagem manual'),
(395,3,'2026-03-16 11:18:37',443.20,6,'Pesagem automática'),
(396,2,'2026-03-16 11:19:01',227.70,2,'Pesagem automática');
/*!40000 ALTER TABLE `cattle_weights` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `devices` VALUES
('1','rfid_stick',1,'2026-02-23 12:09:04','2026-02-09 12:30:00'),
('2','gateway',1,'2026-02-23 12:09:04','2026-02-09 13:00:00'),
('3','sensor',1,'2026-02-23 12:09:04','2026-02-09 13:30:00');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ear_tags`
--

LOCK TABLES `ear_tags` WRITE;
/*!40000 ALTER TABLE `ear_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ear_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `environment_samples`
--

LOCK TABLES `environment_samples` WRITE;
/*!40000 ALTER TABLE `environment_samples` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `environment_samples` VALUES
(1,NULL,NULL,'2026-02-09 14:21:54',38.50,NULL,'{\"bovino_id\": 8, \"brinco\": \"BR18013\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:21:54\", \"local\": \"cocho_principal\", \"temperatura\": 38.5, \"peso_kg\": null}'),
(2,NULL,NULL,'2026-02-09 14:22:02',NULL,NULL,'{\"bovino_id\": 19, \"brinco\": \"BR11882\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:22:02\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(3,NULL,NULL,'2026-02-09 14:22:04',NULL,NULL,'{\"bovino_id\": 9, \"brinco\": \"BR11411\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:22:04\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(4,NULL,NULL,'2026-02-09 14:22:08',NULL,NULL,'{\"bovino_id\": 16, \"brinco\": \"BR14060\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:22:08\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(5,NULL,NULL,'2026-02-09 14:22:15',NULL,NULL,'{\"bovino_id\": 19, \"brinco\": \"BR18101\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:22:15\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": 367.2}'),
(6,NULL,NULL,'2026-02-09 14:22:19',38.70,NULL,'{\"bovino_id\": 9, \"brinco\": \"BR12610\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:22:19\", \"local\": \"cocho_principal\", \"temperatura\": 38.7, \"peso_kg\": null}'),
(7,NULL,NULL,'2026-02-09 14:22:21',38.50,NULL,'{\"bovino_id\": 16, \"brinco\": \"BR13524\", \"tipo_evento\": \"pesagem\", \"data_evento\": \"2026-02-09 14:22:21\", \"local\": \"pastagem\", \"temperatura\": 38.5, \"peso_kg\": null}'),
(8,NULL,NULL,'2026-02-09 14:22:27',NULL,NULL,'{\"bovino_id\": 17, \"brinco\": \"BR15125\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:22:27\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(9,NULL,NULL,'2026-02-09 14:22:33',38.90,NULL,'{\"bovino_id\": 10, \"brinco\": \"BR14705\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:22:33\", \"local\": \"bebedouro_norte\", \"temperatura\": 38.9, \"peso_kg\": 245.9}'),
(10,NULL,NULL,'2026-02-09 14:22:38',NULL,NULL,'{\"bovino_id\": 15, \"brinco\": \"BR10385\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:22:38\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(11,NULL,NULL,'2026-02-09 14:22:46',NULL,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR16291\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:22:46\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(12,NULL,NULL,'2026-02-09 14:22:49',NULL,NULL,'{\"bovino_id\": 6, \"brinco\": \"BR11439\", \"tipo_evento\": \"pesagem\", \"data_evento\": \"2026-02-09 14:22:49\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(13,NULL,NULL,'2026-02-09 14:22:56',NULL,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR15183\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:22:56\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(14,NULL,NULL,'2026-02-09 14:23:03',NULL,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR16884\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:23:03\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": 296.7}'),
(15,NULL,NULL,'2026-02-09 14:23:07',NULL,NULL,'{\"bovino_id\": 6, \"brinco\": \"BR19401\", \"tipo_evento\": \"vacina\\u00e7\\u00e3o\", \"data_evento\": \"2026-02-09 14:23:07\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(16,NULL,NULL,'2026-02-09 14:23:11',NULL,NULL,'{\"bovino_id\": 14, \"brinco\": \"BR19527\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:23:11\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": null}'),
(17,NULL,NULL,'2026-02-09 14:23:13',NULL,NULL,'{\"bovino_id\": 12, \"brinco\": \"BR15377\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:23:13\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(18,NULL,NULL,'2026-02-09 14:23:16',NULL,NULL,'{\"bovino_id\": 1, \"brinco\": \"BR10539\", \"tipo_evento\": \"pesagem\", \"data_evento\": \"2026-02-09 14:23:16\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(19,NULL,NULL,'2026-02-09 14:23:21',38.80,NULL,'{\"bovino_id\": 5, \"brinco\": \"BR13347\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:23:21\", \"local\": \"curral\", \"temperatura\": 38.8, \"peso_kg\": 333.6}'),
(20,NULL,NULL,'2026-02-09 14:23:26',NULL,NULL,'{\"bovino_id\": 20, \"brinco\": \"BR13249\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:23:26\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(21,NULL,NULL,'2026-02-09 14:23:30',39.50,NULL,'{\"bovino_id\": 17, \"brinco\": \"BR16271\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:23:30\", \"local\": \"cocho_principal\", \"temperatura\": 39.5, \"peso_kg\": null}'),
(22,NULL,NULL,'2026-02-09 14:23:33',39.30,NULL,'{\"bovino_id\": 15, \"brinco\": \"BR11650\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:23:33\", \"local\": \"sala_ordenha\", \"temperatura\": 39.3, \"peso_kg\": null}'),
(23,NULL,NULL,'2026-02-09 14:23:39',NULL,NULL,'{\"bovino_id\": 12, \"brinco\": \"BR15834\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:23:39\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(24,NULL,NULL,'2026-02-09 14:23:42',38.60,NULL,'{\"bovino_id\": 16, \"brinco\": \"BR16717\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:23:42\", \"local\": \"pastagem\", \"temperatura\": 38.6, \"peso_kg\": null}'),
(25,NULL,NULL,'2026-02-09 14:23:45',39.10,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR17161\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:23:45\", \"local\": \"pastagem\", \"temperatura\": 39.1, \"peso_kg\": 367.4}'),
(26,NULL,NULL,'2026-02-09 14:23:49',NULL,NULL,'{\"bovino_id\": 9, \"brinco\": \"BR18906\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:23:49\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": 287.9}'),
(27,NULL,NULL,'2026-02-09 14:23:53',NULL,NULL,'{\"bovino_id\": 12, \"brinco\": \"BR19993\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:23:53\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(28,NULL,NULL,'2026-02-09 14:24:00',38.80,NULL,'{\"bovino_id\": 13, \"brinco\": \"BR19034\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:24:00\", \"local\": \"bebedouro_norte\", \"temperatura\": 38.8, \"peso_kg\": null}'),
(29,NULL,NULL,'2026-02-09 14:24:05',NULL,NULL,'{\"bovino_id\": 14, \"brinco\": \"BR17862\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:24:05\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(30,NULL,NULL,'2026-02-09 14:24:10',39.30,NULL,'{\"bovino_id\": 18, \"brinco\": \"BR19990\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:24:10\", \"local\": \"bebedouro_norte\", \"temperatura\": 39.3, \"peso_kg\": null}'),
(31,NULL,NULL,'2026-02-09 14:24:15',NULL,NULL,'{\"bovino_id\": 4, \"brinco\": \"BR12641\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:24:15\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(32,NULL,NULL,'2026-02-09 14:24:21',NULL,NULL,'{\"bovino_id\": 19, \"brinco\": \"BR11109\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:24:21\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": null}'),
(33,NULL,NULL,'2026-02-09 14:24:26',38.40,NULL,'{\"bovino_id\": 7, \"brinco\": \"BR15809\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:24:26\", \"local\": \"sala_ordenha\", \"temperatura\": 38.4, \"peso_kg\": null}'),
(34,NULL,NULL,'2026-02-09 14:24:31',NULL,NULL,'{\"bovino_id\": 18, \"brinco\": \"BR19061\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:24:31\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(35,NULL,NULL,'2026-02-09 14:24:38',NULL,NULL,'{\"bovino_id\": 20, \"brinco\": \"BR17117\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:24:38\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(36,NULL,NULL,'2026-02-09 14:24:42',NULL,NULL,'{\"bovino_id\": 16, \"brinco\": \"BR13438\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:24:42\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(37,NULL,NULL,'2026-02-09 14:24:45',NULL,NULL,'{\"bovino_id\": 20, \"brinco\": \"BR11162\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:24:45\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(38,NULL,NULL,'2026-02-09 14:24:53',38.60,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR17479\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:24:53\", \"local\": \"sala_ordenha\", \"temperatura\": 38.6, \"peso_kg\": 266.9}'),
(39,NULL,NULL,'2026-02-09 14:25:00',NULL,NULL,'{\"bovino_id\": 15, \"brinco\": \"BR14206\", \"tipo_evento\": \"pesagem\", \"data_evento\": \"2026-02-09 14:25:00\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": null}'),
(40,NULL,NULL,'2026-02-09 14:25:06',NULL,NULL,'{\"bovino_id\": 1, \"brinco\": \"BR16163\", \"tipo_evento\": \"vacina\\u00e7\\u00e3o\", \"data_evento\": \"2026-02-09 14:25:06\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(41,NULL,NULL,'2026-02-09 14:25:12',38.70,NULL,'{\"bovino_id\": 17, \"brinco\": \"BR10342\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:25:12\", \"local\": \"cocho_principal\", \"temperatura\": 38.7, \"peso_kg\": null}'),
(42,NULL,NULL,'2026-02-09 14:25:19',39.30,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR15225\", \"tipo_evento\": \"temperatura alta\", \"data_evento\": \"2026-02-09 14:25:19\", \"local\": \"sala_ordenha\", \"temperatura\": 39.3, \"peso_kg\": null}'),
(43,NULL,NULL,'2026-02-09 14:25:25',38.50,NULL,'{\"bovino_id\": 8, \"brinco\": \"BR12261\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:25:25\", \"local\": \"cocho_principal\", \"temperatura\": 38.5, \"peso_kg\": null}'),
(44,NULL,NULL,'2026-02-09 14:25:28',NULL,NULL,'{\"bovino_id\": 10, \"brinco\": \"BR12164\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:25:28\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(45,NULL,NULL,'2026-02-09 14:25:33',NULL,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR16020\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:25:33\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(46,NULL,NULL,'2026-02-09 14:25:35',NULL,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR10750\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:25:35\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(47,NULL,NULL,'2026-02-09 14:25:38',NULL,NULL,'{\"bovino_id\": 12, \"brinco\": \"BR17379\", \"tipo_evento\": \"vacina\\u00e7\\u00e3o\", \"data_evento\": \"2026-02-09 14:25:38\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(48,NULL,NULL,'2026-02-09 14:25:44',NULL,NULL,'{\"bovino_id\": 10, \"brinco\": \"BR14802\", \"tipo_evento\": \"temperatura alta\", \"data_evento\": \"2026-02-09 14:25:44\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(49,NULL,NULL,'2026-02-09 14:25:50',NULL,NULL,'{\"bovino_id\": 18, \"brinco\": \"BR17177\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:25:50\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(50,NULL,NULL,'2026-02-09 14:25:56',NULL,NULL,'{\"bovino_id\": 13, \"brinco\": \"BR19680\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:25:56\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(51,NULL,NULL,'2026-02-09 14:26:03',NULL,NULL,'{\"bovino_id\": 4, \"brinco\": \"BR11935\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:26:03\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(52,NULL,NULL,'2026-02-09 14:26:07',38.50,NULL,'{\"bovino_id\": 7, \"brinco\": \"BR10200\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:26:07\", \"local\": \"bebedouro_norte\", \"temperatura\": 38.5, \"peso_kg\": 310.9}'),
(53,NULL,NULL,'2026-02-09 14:26:10',NULL,NULL,'{\"bovino_id\": 20, \"brinco\": \"BR11451\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:26:10\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(54,NULL,NULL,'2026-02-09 14:26:17',NULL,NULL,'{\"bovino_id\": 9, \"brinco\": \"BR10020\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:26:17\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": 379.1}'),
(55,NULL,NULL,'2026-02-09 14:26:24',NULL,NULL,'{\"bovino_id\": 2, \"brinco\": \"BR14267\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:26:24\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(56,NULL,NULL,'2026-02-09 14:26:31',NULL,NULL,'{\"bovino_id\": 11, \"brinco\": \"BR17017\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:26:31\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": 256.6}'),
(57,NULL,NULL,'2026-02-09 14:26:38',NULL,NULL,'{\"bovino_id\": 6, \"brinco\": \"BR18085\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:26:38\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(58,NULL,NULL,'2026-02-09 14:26:41',NULL,NULL,'{\"bovino_id\": 19, \"brinco\": \"BR12257\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:26:41\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(59,NULL,NULL,'2026-02-09 14:26:44',NULL,NULL,'{\"bovino_id\": 4, \"brinco\": \"BR19281\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:26:44\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": null}'),
(60,NULL,NULL,'2026-02-09 14:26:50',38.60,NULL,'{\"bovino_id\": 19, \"brinco\": \"BR15677\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:26:50\", \"local\": \"curral\", \"temperatura\": 38.6, \"peso_kg\": null}'),
(61,NULL,NULL,'2026-02-09 14:26:54',39.20,NULL,'{\"bovino_id\": 6, \"brinco\": \"BR15088\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:26:54\", \"local\": \"sala_ordenha\", \"temperatura\": 39.2, \"peso_kg\": null}'),
(62,NULL,NULL,'2026-02-09 14:27:00',NULL,NULL,'{\"bovino_id\": 20, \"brinco\": \"BR10252\", \"tipo_evento\": \"temperatura alta\", \"data_evento\": \"2026-02-09 14:27:00\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": null}'),
(63,NULL,NULL,'2026-02-09 14:27:06',NULL,NULL,'{\"bovino_id\": 1, \"brinco\": \"BR12258\", \"tipo_evento\": \"vacina\\u00e7\\u00e3o\", \"data_evento\": \"2026-02-09 14:27:06\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(64,NULL,NULL,'2026-02-09 14:27:11',38.20,NULL,'{\"bovino_id\": 18, \"brinco\": \"BR19248\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:27:11\", \"local\": \"sala_ordenha\", \"temperatura\": 38.2, \"peso_kg\": null}'),
(65,NULL,NULL,'2026-02-09 14:27:13',NULL,NULL,'{\"bovino_id\": 17, \"brinco\": \"BR16147\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:27:13\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": 324.3}'),
(66,NULL,NULL,'2026-02-09 14:27:16',NULL,NULL,'{\"bovino_id\": 2, \"brinco\": \"BR17481\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:27:16\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(67,NULL,NULL,'2026-02-09 14:27:24',38.50,NULL,'{\"bovino_id\": 6, \"brinco\": \"BR13632\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:27:24\", \"local\": \"cocho_principal\", \"temperatura\": 38.5, \"peso_kg\": null}'),
(68,NULL,NULL,'2026-02-09 14:27:30',NULL,NULL,'{\"bovino_id\": 7, \"brinco\": \"BR11397\", \"tipo_evento\": \"vacina\\u00e7\\u00e3o\", \"data_evento\": \"2026-02-09 14:27:30\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": null}'),
(69,NULL,NULL,'2026-02-09 14:27:35',NULL,NULL,'{\"bovino_id\": 12, \"brinco\": \"BR17158\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:27:35\", \"local\": \"sala_ordenha\", \"temperatura\": null, \"peso_kg\": null}'),
(70,NULL,NULL,'2026-02-09 14:27:41',38.20,NULL,'{\"bovino_id\": 4, \"brinco\": \"BR12385\", \"tipo_evento\": \"temperatura alta\", \"data_evento\": \"2026-02-09 14:27:41\", \"local\": \"sala_ordenha\", \"temperatura\": 38.2, \"peso_kg\": null}'),
(71,NULL,NULL,'2026-02-09 14:27:48',NULL,NULL,'{\"bovino_id\": 2, \"brinco\": \"BR12310\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:27:48\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(72,NULL,NULL,'2026-02-09 14:27:51',NULL,NULL,'{\"bovino_id\": 12, \"brinco\": \"BR17902\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:27:51\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(73,NULL,NULL,'2026-02-09 14:27:57',NULL,NULL,'{\"bovino_id\": 5, \"brinco\": \"BR15209\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:27:57\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(74,NULL,NULL,'2026-02-09 14:28:01',NULL,NULL,'{\"bovino_id\": 2, \"brinco\": \"BR16313\", \"tipo_evento\": \"saiu da ordenha\", \"data_evento\": \"2026-02-09 14:28:01\", \"local\": \"cocho_principal\", \"temperatura\": null, \"peso_kg\": 217.6}'),
(75,NULL,NULL,'2026-02-09 14:28:07',NULL,NULL,'{\"bovino_id\": 18, \"brinco\": \"BR19815\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:28:07\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": null}'),
(76,NULL,NULL,'2026-02-09 14:28:11',NULL,NULL,'{\"bovino_id\": 20, \"brinco\": \"BR14432\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:28:11\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(77,NULL,NULL,'2026-02-09 14:28:15',NULL,NULL,'{\"bovino_id\": 14, \"brinco\": \"BR17059\", \"tipo_evento\": \"temperatura alta\", \"data_evento\": \"2026-02-09 14:28:15\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": 309.6}'),
(78,NULL,NULL,'2026-02-09 14:28:17',NULL,NULL,'{\"bovino_id\": 14, \"brinco\": \"BR17206\", \"tipo_evento\": \"vacina\\u00e7\\u00e3o\", \"data_evento\": \"2026-02-09 14:28:17\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(79,NULL,NULL,'2026-02-09 14:28:23',NULL,NULL,'{\"bovino_id\": 3, \"brinco\": \"BR10062\", \"tipo_evento\": \"temperatura alta\", \"data_evento\": \"2026-02-09 14:28:23\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": 286.9}'),
(80,NULL,NULL,'2026-02-09 14:28:25',39.10,NULL,'{\"bovino_id\": 13, \"brinco\": \"BR18696\", \"tipo_evento\": \"temperatura alta\", \"data_evento\": \"2026-02-09 14:28:25\", \"local\": \"curral\", \"temperatura\": 39.1, \"peso_kg\": null}'),
(81,NULL,NULL,'2026-02-09 14:28:28',NULL,NULL,'{\"bovino_id\": 8, \"brinco\": \"BR14469\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:28:28\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(82,NULL,NULL,'2026-02-09 14:28:34',38.10,NULL,'{\"bovino_id\": 18, \"brinco\": \"BR17633\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:28:34\", \"local\": \"pastagem\", \"temperatura\": 38.1, \"peso_kg\": null}'),
(83,NULL,NULL,'2026-02-09 14:28:42',NULL,NULL,'{\"bovino_id\": 18, \"brinco\": \"BR15067\", \"tipo_evento\": \"pesagem\", \"data_evento\": \"2026-02-09 14:28:42\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": null}'),
(84,NULL,NULL,'2026-02-09 14:28:45',NULL,NULL,'{\"bovino_id\": 19, \"brinco\": \"BR12666\", \"tipo_evento\": \"foi ao pasto\", \"data_evento\": \"2026-02-09 14:28:45\", \"local\": \"curral\", \"temperatura\": null, \"peso_kg\": null}'),
(85,NULL,NULL,'2026-02-09 14:28:52',NULL,NULL,'{\"bovino_id\": 7, \"brinco\": \"BR19764\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:28:52\", \"local\": \"bebedouro_norte\", \"temperatura\": null, \"peso_kg\": 387.5}'),
(86,NULL,NULL,'2026-02-09 14:28:57',NULL,NULL,'{\"bovino_id\": 20, \"brinco\": \"BR13132\", \"tipo_evento\": \"pesagem\", \"data_evento\": \"2026-02-09 14:28:57\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(87,NULL,NULL,'2026-02-09 14:29:05',38.80,NULL,'{\"bovino_id\": 5, \"brinco\": \"BR15373\", \"tipo_evento\": \"detectado em cio\", \"data_evento\": \"2026-02-09 14:29:05\", \"local\": \"curral\", \"temperatura\": 38.8, \"peso_kg\": null}'),
(88,NULL,NULL,'2026-02-09 14:29:07',39.00,NULL,'{\"bovino_id\": 3, \"brinco\": \"BR12827\", \"tipo_evento\": \"bebeu agua\", \"data_evento\": \"2026-02-09 14:29:07\", \"local\": \"cocho_principal\", \"temperatura\": 39.0, \"peso_kg\": null}'),
(89,NULL,NULL,'2026-02-09 14:29:12',NULL,NULL,'{\"bovino_id\": 5, \"brinco\": \"BR15354\", \"tipo_evento\": \"alimentou-se\", \"data_evento\": \"2026-02-09 14:29:12\", \"local\": \"pastagem\", \"temperatura\": null, \"peso_kg\": null}'),
(90,NULL,NULL,'2026-02-09 14:29:16',38.20,NULL,'{\"bovino_id\": 13, \"brinco\": \"BR15258\", \"tipo_evento\": \"entrou na ordenha\", \"data_evento\": \"2026-02-09 14:29:16\", \"local\": \"cocho_principal\", \"temperatura\": 38.2, \"peso_kg\": 240.8}'),
(92,1,2,'2026-02-09 11:47:00',28.50,65.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 11:47:00\", \"temperatura\": 28.5, \"umidade\": 65}'),
(93,1,2,'2026-02-09 15:46:09',26.00,51.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:46:09\", \"temperatura\": 26.0, \"umidade\": 51}'),
(94,1,2,'2026-02-09 15:46:26',31.10,60.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:46:26\", \"temperatura\": 31.1, \"umidade\": 60}'),
(95,1,2,'2026-02-09 15:46:33',29.00,80.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:46:33\", \"temperatura\": 29.0, \"umidade\": 80}'),
(96,1,2,'2026-02-09 15:46:45',29.40,74.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:46:45\", \"temperatura\": 29.4, \"umidade\": 74}'),
(97,1,2,'2026-02-09 15:46:53',27.40,59.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:46:53\", \"temperatura\": 27.4, \"umidade\": 59}'),
(98,1,2,'2026-02-09 15:47:00',28.90,72.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:47:00\", \"temperatura\": 28.9, \"umidade\": 72}'),
(99,1,2,'2026-02-09 15:47:46',29.90,72.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:47:46\", \"temperatura\": 29.9, \"umidade\": 72}'),
(100,1,2,'2026-02-09 15:48:03',28.30,63.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:48:03\", \"temperatura\": 28.3, \"umidade\": 63}'),
(101,1,2,'2026-02-09 15:48:09',25.60,67.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:48:09\", \"temperatura\": 25.6, \"umidade\": 67}'),
(102,1,2,'2026-02-09 15:48:23',28.30,75.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:48:23\", \"temperatura\": 28.3, \"umidade\": 75}'),
(103,1,2,'2026-02-09 15:48:37',27.70,79.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:48:37\", \"temperatura\": 27.7, \"umidade\": 79}'),
(104,1,2,'2026-02-09 15:48:44',27.90,51.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:48:44\", \"temperatura\": 27.9, \"umidade\": 51}'),
(105,1,2,'2026-02-09 15:48:57',26.40,56.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:48:57\", \"temperatura\": 26.4, \"umidade\": 56}'),
(106,1,2,'2026-02-09 15:49:03',25.10,54.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:49:03\", \"temperatura\": 25.1, \"umidade\": 54}'),
(107,1,2,'2026-02-09 15:49:27',27.50,68.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:49:27\", \"temperatura\": 27.5, \"umidade\": 68}'),
(108,1,2,'2026-02-09 15:50:06',30.10,73.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:50:06\", \"temperatura\": 30.1, \"umidade\": 73}'),
(109,1,2,'2026-02-09 15:50:19',26.70,70.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:50:19\", \"temperatura\": 26.7, \"umidade\": 70}'),
(110,1,2,'2026-02-09 15:50:40',29.80,52.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:50:40\", \"temperatura\": 29.8, \"umidade\": 52}'),
(111,1,2,'2026-02-09 15:51:02',29.60,64.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:51:02\", \"temperatura\": 29.6, \"umidade\": 64}'),
(112,1,2,'2026-02-09 15:51:32',31.00,50.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:51:32\", \"temperatura\": 31.0, \"umidade\": 50}'),
(113,1,2,'2026-02-09 15:51:46',25.60,78.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:51:46\", \"temperatura\": 25.6, \"umidade\": 78}'),
(114,1,2,'2026-02-09 15:52:07',27.80,52.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:52:07\", \"temperatura\": 27.8, \"umidade\": 52}'),
(115,1,2,'2026-02-09 15:52:23',25.80,65.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:52:23\", \"temperatura\": 25.8, \"umidade\": 65}'),
(116,1,2,'2026-02-09 15:52:48',31.10,70.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:52:48\", \"temperatura\": 31.1, \"umidade\": 70}'),
(117,1,2,'2026-02-09 15:53:18',30.40,62.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:53:18\", \"temperatura\": 30.4, \"umidade\": 62}'),
(118,1,2,'2026-02-09 15:53:51',28.80,58.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:53:51\", \"temperatura\": 28.8, \"umidade\": 58}'),
(119,1,2,'2026-02-09 15:54:19',30.10,61.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:54:19\", \"temperatura\": 30.1, \"umidade\": 61}'),
(120,1,2,'2026-02-09 15:54:52',27.20,58.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:54:52\", \"temperatura\": 27.2, \"umidade\": 58}'),
(121,1,2,'2026-02-09 15:55:01',26.90,51.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:55:01\", \"temperatura\": 26.9, \"umidade\": 51}'),
(122,1,2,'2026-02-09 15:55:09',31.20,50.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:55:09\", \"temperatura\": 31.2, \"umidade\": 50}'),
(123,1,2,'2026-02-09 15:55:52',25.60,74.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:55:52\", \"temperatura\": 25.6, \"umidade\": 74}'),
(124,1,2,'2026-02-09 15:56:09',25.00,69.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:56:09\", \"temperatura\": 25.0, \"umidade\": 69}'),
(125,1,2,'2026-02-09 15:56:16',29.10,70.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:56:16\", \"temperatura\": 29.1, \"umidade\": 70}'),
(126,1,2,'2026-02-09 15:56:28',30.80,53.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:56:28\", \"temperatura\": 30.8, \"umidade\": 53}'),
(127,1,2,'2026-02-09 15:57:10',27.80,51.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:57:10\", \"temperatura\": 27.8, \"umidade\": 51}'),
(128,1,2,'2026-02-09 15:57:17',27.30,66.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:57:17\", \"temperatura\": 27.3, \"umidade\": 66}'),
(129,1,2,'2026-02-09 15:57:22',32.00,57.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:57:22\", \"temperatura\": 32.0, \"umidade\": 57}'),
(130,1,2,'2026-02-09 15:57:35',26.20,80.00,'{\"site_id\": 1, \"location_id\": 2, \"event_time\": \"2026-02-09 15:57:35\", \"temperatura\": 26.2, \"umidade\": 80}'),
(131,1,2,'2026-02-23 18:39:55',32.00,78.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(132,2,6,'2026-02-23 18:40:39',26.60,66.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(133,2,6,'2026-02-23 18:40:44',27.50,74.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(134,3,6,'2026-02-23 18:40:55',25.30,62.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(135,1,6,'2026-02-23 18:41:49',30.40,76.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(136,3,3,'2026-02-23 18:42:31',27.90,72.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(137,2,3,'2026-02-23 18:42:42',29.90,62.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(138,3,6,'2026-02-23 18:42:47',27.00,73.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(139,2,2,'2026-02-23 18:43:01',29.80,80.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(140,2,3,'2026-02-23 18:43:17',25.60,62.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(141,1,2,'2026-02-23 18:43:38',28.30,50.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(142,1,6,'2026-02-23 18:43:57',31.00,58.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(143,3,3,'2026-02-23 18:44:04',25.00,73.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(144,3,2,'2026-02-23 18:44:20',27.40,73.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(145,3,2,'2026-02-23 18:44:35',25.40,61.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(146,2,2,'2026-02-23 18:44:45',26.30,57.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(147,1,6,'2026-02-23 18:45:09',28.00,73.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(148,3,2,'2026-02-23 18:45:13',27.40,75.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(149,1,2,'2026-02-23 18:45:40',31.60,63.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(150,3,3,'2026-02-23 18:46:12',25.40,50.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(151,2,3,'2026-02-23 18:46:25',26.30,72.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(152,3,3,'2026-02-23 18:46:33',29.00,50.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(153,3,3,'2026-02-23 18:46:51',30.40,56.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(154,1,3,'2026-02-23 18:47:19',25.30,72.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(155,1,2,'2026-02-23 18:47:33',29.10,54.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(156,1,3,'2026-02-23 18:47:40',27.00,64.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(157,1,6,'2026-02-23 18:47:48',31.60,75.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(158,2,6,'2026-02-23 18:48:12',29.10,60.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(159,3,3,'2026-02-23 18:48:28',31.60,68.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(160,3,3,'2026-02-23 18:48:35',27.80,67.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(161,2,2,'2026-02-23 18:49:00',27.20,62.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(162,1,6,'2026-02-23 18:49:14',25.30,63.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(163,1,6,'2026-02-23 18:49:21',26.20,58.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(164,3,6,'2026-02-23 18:49:31',31.50,67.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(165,1,6,'2026-02-23 18:49:37',28.70,61.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(166,2,6,'2026-02-23 18:49:52',31.00,58.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(167,1,3,'2026-02-23 18:49:57',30.80,74.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(168,1,6,'2026-02-23 18:50:30',26.00,53.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(169,1,2,'2026-02-23 18:50:39',30.40,64.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(170,1,6,'2026-02-23 18:50:57',26.10,70.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(171,1,3,'2026-02-23 18:51:10',29.30,61.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(172,2,3,'2026-02-23 18:51:20',28.30,68.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(173,2,6,'2026-02-23 18:51:45',28.30,68.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(174,3,2,'2026-02-23 18:51:48',26.50,64.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(175,3,2,'2026-02-23 18:52:01',30.50,73.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(176,3,6,'2026-02-23 18:52:06',30.40,61.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(177,1,6,'2026-02-23 18:52:43',31.90,51.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(178,3,3,'2026-02-23 18:53:03',25.60,68.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(179,3,6,'2026-02-23 18:53:17',31.80,75.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(180,1,6,'2026-02-23 18:53:46',27.20,74.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(181,3,3,'2026-02-23 18:54:01',31.80,66.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(182,2,2,'2026-02-23 18:54:17',31.20,74.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(183,3,3,'2026-02-23 18:54:19',26.30,74.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(184,1,2,'2026-02-23 18:54:29',32.00,77.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(185,1,6,'2026-02-23 18:54:44',26.90,67.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(186,2,6,'2026-02-23 18:54:46',25.60,62.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(187,3,2,'2026-02-23 18:54:53',27.80,53.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(188,1,2,'2026-02-23 18:55:14',25.90,58.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(189,2,2,'2026-02-23 18:55:43',28.90,54.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(190,1,3,'2026-02-23 18:55:54',26.70,67.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(191,3,3,'2026-02-23 18:55:58',31.70,55.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(192,3,2,'2026-02-23 18:56:26',30.10,75.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(193,2,2,'2026-02-23 18:56:29',31.20,61.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(194,2,2,'2026-02-23 18:56:32',25.80,59.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(195,2,2,'2026-02-23 18:56:36',31.10,80.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(196,1,6,'2026-02-23 18:56:40',26.40,54.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(197,2,3,'2026-02-23 18:57:02',29.80,80.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(198,3,3,'2026-02-23 18:57:21',31.60,60.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(199,3,6,'2026-02-23 18:57:24',26.30,57.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(200,3,3,'2026-02-23 18:57:29',28.10,63.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(201,1,6,'2026-02-23 18:57:44',26.30,77.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(202,1,2,'2026-02-23 18:57:46',26.80,71.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(203,3,2,'2026-02-23 18:57:52',31.10,60.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(204,3,6,'2026-02-23 18:58:07',30.50,70.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(205,2,6,'2026-02-23 18:58:40',31.50,70.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(206,1,3,'2026-02-23 18:58:47',27.00,79.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(207,1,6,'2026-02-23 18:58:56',29.30,80.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(208,3,2,'2026-02-23 18:59:13',26.50,65.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(209,3,2,'2026-02-23 18:59:20',27.80,66.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(210,1,3,'2026-02-23 18:59:48',28.60,72.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(211,1,2,'2026-02-23 18:59:55',29.00,78.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(212,1,6,'2026-02-23 18:59:58',28.00,69.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(213,2,6,'2026-02-23 19:00:07',30.40,51.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(214,3,3,'2026-02-23 19:00:32',30.90,78.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(215,3,6,'2026-02-23 19:00:38',27.50,59.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(216,1,3,'2026-02-23 19:00:40',31.60,59.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(217,1,2,'2026-02-23 19:00:46',29.20,62.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(218,1,2,'2026-02-23 19:01:23',28.00,71.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(219,2,2,'2026-02-23 19:01:45',31.50,51.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(220,1,6,'2026-02-23 19:01:47',30.70,69.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(221,3,3,'2026-02-23 19:01:57',27.40,50.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(222,3,6,'2026-02-23 19:02:08',27.60,50.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(223,1,2,'2026-02-23 19:02:34',28.10,57.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(224,2,3,'2026-02-23 19:02:41',25.00,63.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(225,1,3,'2026-02-23 19:02:59',25.10,64.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(226,3,2,'2026-02-23 19:03:19',28.10,52.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(227,1,6,'2026-02-23 19:03:42',28.60,80.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(228,3,2,'2026-02-23 19:03:48',29.00,70.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(229,3,3,'2026-02-23 19:03:55',28.10,69.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(230,1,3,'2026-02-23 19:03:59',26.80,53.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(231,3,2,'2026-02-23 19:04:03',29.80,53.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(232,3,6,'2026-02-23 19:04:28',26.00,59.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(233,2,3,'2026-02-23 19:05:14',25.60,71.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(234,1,3,'2026-02-23 19:05:21',31.50,74.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(235,2,6,'2026-02-23 19:05:43',29.10,69.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(236,3,6,'2026-02-23 19:05:46',27.70,61.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(237,2,2,'2026-02-23 19:05:53',29.90,59.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(238,1,3,'2026-02-23 19:06:01',31.90,79.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(239,3,3,'2026-02-23 19:06:11',29.10,56.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(240,1,3,'2026-02-23 19:06:15',30.40,80.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(241,1,6,'2026-02-23 19:06:37',29.20,73.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(242,1,2,'2026-02-23 19:07:09',28.60,69.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(243,3,2,'2026-02-23 19:07:41',30.40,60.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(244,1,6,'2026-02-23 19:09:18',28.00,56.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(245,1,6,'2026-02-23 19:09:27',25.30,58.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(246,3,6,'2026-02-23 19:09:34',28.40,79.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(247,3,6,'2026-02-23 19:09:41',26.20,65.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(248,3,6,'2026-02-23 19:10:13',26.40,57.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(249,3,6,'2026-02-23 19:10:31',27.10,65.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(250,3,3,'2026-02-23 19:10:59',29.30,55.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(251,2,3,'2026-02-23 19:11:39',25.50,68.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(252,1,6,'2026-02-23 19:12:02',25.40,66.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(253,3,6,'2026-02-23 19:12:05',27.70,77.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(254,1,3,'2026-02-23 19:12:13',28.00,52.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(255,2,6,'2026-02-23 19:12:20',26.10,63.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(256,2,3,'2026-02-23 19:12:34',29.40,59.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(257,1,6,'2026-02-23 19:12:54',27.60,51.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(258,3,3,'2026-02-23 19:13:00',28.50,55.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(259,1,3,'2026-02-23 19:13:05',25.50,53.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(260,3,6,'2026-02-23 19:13:46',28.00,73.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(261,2,6,'2026-02-23 19:14:03',26.80,50.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(262,3,2,'2026-02-23 19:14:10',27.60,56.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(263,2,6,'2026-02-23 19:14:12',27.10,75.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(264,2,3,'2026-02-23 19:14:19',31.60,60.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(265,3,6,'2026-02-23 19:14:26',28.90,70.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(266,2,3,'2026-02-23 19:14:42',25.10,67.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(267,3,2,'2026-02-23 19:19:06',30.80,76.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(268,3,3,'2026-02-23 19:19:21',26.30,56.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(269,2,3,'2026-02-23 19:19:27',31.80,67.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(270,3,2,'2026-03-16 11:13:36',28.90,77.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(271,2,6,'2026-03-16 11:13:58',25.50,61.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(272,1,6,'2026-03-16 11:14:20',25.20,68.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(273,1,2,'2026-03-16 11:14:30',27.60,78.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(274,3,2,'2026-03-16 11:14:37',29.00,69.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(275,3,6,'2026-03-16 11:14:56',29.10,59.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(276,1,3,'2026-03-16 11:15:07',26.70,72.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(277,2,6,'2026-03-16 11:15:12',28.60,69.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(278,1,6,'2026-03-16 11:15:33',26.00,52.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(279,2,2,'2026-03-16 11:15:41',26.70,53.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(280,2,3,'2026-03-16 11:16:54',26.90,54.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(281,3,3,'2026-03-16 11:17:01',30.70,67.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(282,3,2,'2026-03-16 11:17:37',29.00,77.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(283,1,6,'2026-03-16 11:17:49',28.60,69.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(284,1,6,'2026-03-16 11:18:26',27.00,70.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(285,2,3,'2026-03-16 11:18:49',28.10,75.00,'{\"obs\": \"Leitura di\\u00e1ria\"}'),
(286,2,3,'2026-03-16 11:18:54',26.30,65.00,'{\"obs\": \"Sensor ambiente curral\"}'),
(287,1,2,'2026-03-16 11:19:07',25.70,67.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}'),
(288,3,3,'2026-03-16 11:19:11',31.40,52.00,'{\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}');
/*!40000 ALTER TABLE `environment_samples` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `events_raw`
--

LOCK TABLES `events_raw` WRITE;
/*!40000 ALTER TABLE `events_raw` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `events_raw` VALUES
(1,'2026-02-23 11:20:00',1,'2',2,1,2,'pesagem','{\"cattle_id\": 1, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"pesagem\", \"event_time\": \"2026-02-23 11:20:00\", \"peso_kg\": 450.5, \"obs\": \"Teste manual de pesagem\"}'),
(2,'2026-02-23 10:25:00',2,'3',2,1,2,'pesagem','{\"event_time\": \"2026-02-23 10:25:00\", \"cattle_id\": 2, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"pesagem\", \"peso_kg\": 480, \"obs\": \"pesagem realizada automaticamente\"}'),
(3,'2026-02-23 18:35:54',8,NULL,NULL,NULL,3,'other','{\"cattle_id\": 8, \"weight_date\": \"2026-02-23 15:35:54\", \"weight\": 248.6, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(4,'2026-02-23 15:35:57',15,'3',1,1,6,'vacinação','{\"cattle_id\": 15, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 15:35:57\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(5,'2026-02-23 18:39:47',14,'3',4,1,2,'vacinação','{\"cattle_id\": 14, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:39:47\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(6,'2026-02-23 18:39:55',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:39:55\", \"temperature\": 32.0, \"humidity\": 78, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(7,'2026-02-23 18:40:00',3,'2',1,3,6,'saida_curral','{\"cattle_id\": 3, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:40:00\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(8,'2026-02-23 18:40:05',3,NULL,NULL,NULL,2,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:40:05\", \"weight\": 363.0, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(9,'2026-02-23 18:40:11',2,NULL,NULL,NULL,2,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-02-23 18:40:11\", \"weight\": 421.2, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(10,'2026-02-23 18:40:14',6,NULL,NULL,NULL,3,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:40:14\", \"weight\": 449.9, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(11,'2026-02-23 18:40:18',13,'3',1,2,2,'vacinação','{\"cattle_id\": 13, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:40:18\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(12,'2026-02-23 18:40:25',9,'1',2,1,2,'saida_curral','{\"cattle_id\": 9, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:40:25\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(13,'2026-02-23 18:40:32',14,NULL,NULL,NULL,3,'other','{\"cattle_id\": 14, \"weight_date\": \"2026-02-23 18:40:32\", \"weight\": 324.8, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(14,'2026-02-23 18:40:39',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:40:39\", \"temperature\": 26.6, \"humidity\": 66, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(15,'2026-02-23 18:40:44',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:40:44\", \"temperature\": 27.5, \"humidity\": 74, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(16,'2026-02-23 18:40:47',2,NULL,NULL,NULL,2,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-02-23 18:40:47\", \"weight\": 213.6, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(17,'2026-02-23 18:40:55',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:40:55\", \"temperature\": 25.3, \"humidity\": 62, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(18,'2026-02-23 18:41:00',19,NULL,NULL,NULL,6,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 18:41:00\", \"weight\": 247.4, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(19,'2026-02-23 18:41:06',3,NULL,NULL,NULL,6,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:41:06\", \"weight\": 244.8, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(20,'2026-02-23 18:41:11',20,'2',3,1,2,'entrada_curral','{\"cattle_id\": 20, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:41:11\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(21,'2026-02-23 18:41:18',9,NULL,NULL,NULL,6,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:41:18\", \"weight\": 385.3, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(22,'2026-02-23 18:41:25',6,'3',2,3,6,'vacinação','{\"cattle_id\": 6, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:41:25\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(23,'2026-02-23 18:41:28',9,NULL,NULL,NULL,3,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:41:28\", \"weight\": 403.8, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(24,'2026-02-23 18:41:36',12,NULL,NULL,NULL,6,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-02-23 18:41:36\", \"weight\": 437.8, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(25,'2026-02-23 18:41:40',13,NULL,NULL,NULL,2,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 18:41:40\", \"weight\": 218.3, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(26,'2026-02-23 18:41:47',15,NULL,NULL,NULL,3,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 18:41:47\", \"weight\": 253.8, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(27,'2026-02-23 18:41:49',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:41:49\", \"temperature\": 30.4, \"humidity\": 76, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(28,'2026-02-23 18:41:55',19,'1',2,1,3,'vacinação','{\"cattle_id\": 19, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:41:55\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(29,'2026-02-23 18:42:00',7,'3',4,3,2,'saida_curral','{\"cattle_id\": 7, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:42:00\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(30,'2026-02-23 18:42:07',4,'3',4,2,3,'saida_curral','{\"cattle_id\": 4, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:42:07\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(31,'2026-02-23 18:42:13',16,NULL,NULL,NULL,3,'other','{\"cattle_id\": 16, \"weight_date\": \"2026-02-23 18:42:13\", \"weight\": 269.3, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(32,'2026-02-23 18:42:17',14,NULL,NULL,NULL,6,'other','{\"cattle_id\": 14, \"weight_date\": \"2026-02-23 18:42:17\", \"weight\": 289.0, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(33,'2026-02-23 18:42:19',6,NULL,NULL,NULL,2,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:42:19\", \"weight\": 400.3, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(34,'2026-02-23 18:42:23',19,NULL,NULL,NULL,3,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 18:42:23\", \"weight\": 374.7, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(35,'2026-02-23 18:42:31',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:42:31\", \"temperature\": 27.9, \"humidity\": 72, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(36,'2026-02-23 18:42:38',10,NULL,NULL,NULL,6,'other','{\"cattle_id\": 10, \"weight_date\": \"2026-02-23 18:42:38\", \"weight\": 292.5, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(37,'2026-02-23 18:42:42',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:42:42\", \"temperature\": 29.9, \"humidity\": 62, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(38,'2026-02-23 18:42:47',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:42:47\", \"temperature\": 27.0, \"humidity\": 73, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(39,'2026-02-23 18:42:53',20,NULL,NULL,NULL,2,'other','{\"cattle_id\": 20, \"weight_date\": \"2026-02-23 18:42:53\", \"weight\": 357.1, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(40,'2026-02-23 18:42:58',5,'3',4,2,3,'saida_curral','{\"cattle_id\": 5, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:42:58\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(41,'2026-02-23 18:43:01',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:43:01\", \"temperature\": 29.8, \"humidity\": 80, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(42,'2026-02-23 18:43:07',5,'1',4,3,6,'entrada_curral','{\"cattle_id\": 5, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:43:07\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(43,'2026-02-23 18:43:11',17,'1',4,3,2,'saida_curral','{\"cattle_id\": 17, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:43:11\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(44,'2026-02-23 18:43:17',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:43:17\", \"temperature\": 25.6, \"humidity\": 62, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(45,'2026-02-23 18:43:21',5,NULL,NULL,NULL,3,'other','{\"cattle_id\": 5, \"weight_date\": \"2026-02-23 18:43:21\", \"weight\": 254.6, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(46,'2026-02-23 18:43:27',19,NULL,NULL,NULL,3,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 18:43:27\", \"weight\": 379.5, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(47,'2026-02-23 18:43:32',11,'2',4,2,6,'saida_curral','{\"cattle_id\": 11, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:43:32\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(48,'2026-02-23 18:43:38',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:43:38\", \"temperature\": 28.3, \"humidity\": 50, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(49,'2026-02-23 18:43:41',17,'2',4,3,6,'entrada_curral','{\"cattle_id\": 17, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:43:41\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(50,'2026-02-23 18:43:48',7,'3',2,1,3,'saida_curral','{\"cattle_id\": 7, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:43:48\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(51,'2026-02-23 18:43:50',10,'2',1,1,2,'saida_curral','{\"cattle_id\": 10, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:43:50\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(52,'2026-02-23 18:43:55',19,NULL,NULL,NULL,2,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 18:43:55\", \"weight\": 213.8, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(53,'2026-02-23 18:43:57',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:43:57\", \"temperature\": 31.0, \"humidity\": 58, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(54,'2026-02-23 18:44:01',6,'1',3,3,6,'vacinação','{\"cattle_id\": 6, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:44:01\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(55,'2026-02-23 18:44:04',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:44:04\", \"temperature\": 25.0, \"humidity\": 73, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(56,'2026-02-23 18:44:10',7,NULL,NULL,NULL,2,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-02-23 18:44:10\", \"weight\": 239.9, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(57,'2026-02-23 18:44:12',5,NULL,NULL,NULL,6,'other','{\"cattle_id\": 5, \"weight_date\": \"2026-02-23 18:44:12\", \"weight\": 360.8, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(58,'2026-02-23 18:44:20',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:44:20\", \"temperature\": 27.4, \"humidity\": 73, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(59,'2026-02-23 18:44:24',3,'1',3,2,6,'entrada_curral','{\"cattle_id\": 3, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:44:24\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(60,'2026-02-23 18:44:28',7,'1',1,2,2,'entrada_curral','{\"cattle_id\": 7, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:44:28\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(61,'2026-02-23 18:44:35',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:44:35\", \"temperature\": 25.4, \"humidity\": 61, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(62,'2026-02-23 18:44:41',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:44:41\", \"weight\": 374.2, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(63,'2026-02-23 18:44:45',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:44:45\", \"temperature\": 26.3, \"humidity\": 57, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(64,'2026-02-23 18:44:52',9,NULL,NULL,NULL,6,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:44:52\", \"weight\": 235.7, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(65,'2026-02-23 18:44:58',8,'2',1,3,3,'vacinação','{\"cattle_id\": 8, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:44:58\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(66,'2026-02-23 18:45:02',1,NULL,NULL,NULL,2,'other','{\"cattle_id\": 1, \"weight_date\": \"2026-02-23 18:45:02\", \"weight\": 393.3, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(67,'2026-02-23 18:45:09',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:45:09\", \"temperature\": 28.0, \"humidity\": 73, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(68,'2026-02-23 18:45:13',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:45:13\", \"temperature\": 27.4, \"humidity\": 75, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(69,'2026-02-23 18:45:20',6,NULL,NULL,NULL,2,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:45:20\", \"weight\": 442.9, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(70,'2026-02-23 18:45:23',7,NULL,NULL,NULL,3,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-02-23 18:45:23\", \"weight\": 245.4, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(71,'2026-02-23 18:45:27',3,NULL,NULL,NULL,2,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:45:27\", \"weight\": 228.4, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(72,'2026-02-23 18:45:34',20,'3',1,2,3,'saida_curral','{\"cattle_id\": 20, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:45:34\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(73,'2026-02-23 18:45:40',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:45:40\", \"temperature\": 31.6, \"humidity\": 63, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(74,'2026-02-23 18:45:44',18,NULL,NULL,NULL,3,'other','{\"cattle_id\": 18, \"weight_date\": \"2026-02-23 18:45:44\", \"weight\": 300.6, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(75,'2026-02-23 18:45:49',9,NULL,NULL,NULL,6,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:45:49\", \"weight\": 371.2, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(76,'2026-02-23 18:45:52',10,'3',1,1,2,'saida_curral','{\"cattle_id\": 10, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:45:52\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(77,'2026-02-23 18:45:59',3,NULL,NULL,NULL,6,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:45:59\", \"weight\": 257.6, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(78,'2026-02-23 18:46:05',10,'2',2,3,3,'vacinação','{\"cattle_id\": 10, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:46:05\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(79,'2026-02-23 18:46:12',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:46:12\", \"temperature\": 25.4, \"humidity\": 50, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(80,'2026-02-23 18:46:20',3,'1',3,3,6,'vacinação','{\"cattle_id\": 3, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:46:20\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(81,'2026-02-23 18:46:25',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:46:25\", \"temperature\": 26.3, \"humidity\": 72, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(82,'2026-02-23 18:46:30',19,'1',1,1,3,'saida_curral','{\"cattle_id\": 19, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:46:30\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(83,'2026-02-23 18:46:33',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:46:33\", \"temperature\": 29.0, \"humidity\": 50, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(84,'2026-02-23 18:46:40',10,'3',3,3,6,'saida_curral','{\"cattle_id\": 10, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:46:40\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(85,'2026-02-23 18:46:45',5,NULL,NULL,NULL,6,'other','{\"cattle_id\": 5, \"weight_date\": \"2026-02-23 18:46:45\", \"weight\": 432.8, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(86,'2026-02-23 18:46:51',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:46:51\", \"temperature\": 30.4, \"humidity\": 56, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(87,'2026-02-23 18:46:53',4,NULL,NULL,NULL,2,'other','{\"cattle_id\": 4, \"weight_date\": \"2026-02-23 18:46:53\", \"weight\": 377.1, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(88,'2026-02-23 18:46:58',12,'2',1,3,6,'vacinação','{\"cattle_id\": 12, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:46:58\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(89,'2026-02-23 18:47:05',3,'3',3,2,6,'saida_curral','{\"cattle_id\": 3, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:47:05\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(90,'2026-02-23 18:47:10',3,NULL,NULL,NULL,6,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:47:10\", \"weight\": 367.4, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(91,'2026-02-23 18:47:13',9,NULL,NULL,NULL,6,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:47:13\", \"weight\": 416.2, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(92,'2026-02-23 18:47:19',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:47:19\", \"temperature\": 25.3, \"humidity\": 72, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(93,'2026-02-23 18:47:23',10,'1',4,1,3,'saida_curral','{\"cattle_id\": 10, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:47:23\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(94,'2026-02-23 18:47:28',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:47:28\", \"weight\": 203.6, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(95,'2026-02-23 18:47:33',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:47:33\", \"temperature\": 29.1, \"humidity\": 54, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(96,'2026-02-23 18:47:40',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:47:40\", \"temperature\": 27.0, \"humidity\": 64, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(97,'2026-02-23 18:47:48',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:47:48\", \"temperature\": 31.6, \"humidity\": 75, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(98,'2026-02-23 18:47:52',6,'2',4,3,6,'entrada_curral','{\"cattle_id\": 6, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:47:52\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(99,'2026-02-23 18:47:58',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:47:58\", \"weight\": 441.7, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(100,'2026-02-23 18:48:02',16,NULL,NULL,NULL,6,'other','{\"cattle_id\": 16, \"weight_date\": \"2026-02-23 18:48:02\", \"weight\": 321.5, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(101,'2026-02-23 18:48:04',3,NULL,NULL,NULL,6,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:48:04\", \"weight\": 222.8, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(102,'2026-02-23 18:48:12',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:48:12\", \"temperature\": 29.1, \"humidity\": 60, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(103,'2026-02-23 18:48:17',2,'1',3,3,2,'saida_curral','{\"cattle_id\": 2, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:48:17\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(104,'2026-02-23 18:48:23',18,NULL,NULL,NULL,2,'other','{\"cattle_id\": 18, \"weight_date\": \"2026-02-23 18:48:23\", \"weight\": 281.1, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(105,'2026-02-23 18:48:28',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:48:28\", \"temperature\": 31.6, \"humidity\": 68, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(106,'2026-02-23 18:48:35',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:48:35\", \"temperature\": 27.8, \"humidity\": 67, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(107,'2026-02-23 18:48:37',12,NULL,NULL,NULL,2,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-02-23 18:48:37\", \"weight\": 377.6, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(108,'2026-02-23 18:48:45',14,NULL,NULL,NULL,2,'other','{\"cattle_id\": 14, \"weight_date\": \"2026-02-23 18:48:45\", \"weight\": 407.5, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(109,'2026-02-23 18:48:48',4,NULL,NULL,NULL,2,'other','{\"cattle_id\": 4, \"weight_date\": \"2026-02-23 18:48:48\", \"weight\": 221.9, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(110,'2026-02-23 18:48:51',19,'2',1,2,2,'saida_curral','{\"cattle_id\": 19, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:48:51\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(111,'2026-02-23 18:48:53',18,NULL,NULL,NULL,2,'other','{\"cattle_id\": 18, \"weight_date\": \"2026-02-23 18:48:53\", \"weight\": 304.6, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(112,'2026-02-23 18:49:00',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:49:00\", \"temperature\": 27.2, \"humidity\": 62, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(113,'2026-02-23 18:49:08',14,NULL,NULL,NULL,3,'other','{\"cattle_id\": 14, \"weight_date\": \"2026-02-23 18:49:08\", \"weight\": 270.3, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(114,'2026-02-23 18:49:14',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:49:14\", \"temperature\": 25.3, \"humidity\": 63, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(115,'2026-02-23 18:49:21',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:49:21\", \"temperature\": 26.2, \"humidity\": 58, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(116,'2026-02-23 18:49:24',12,NULL,NULL,NULL,2,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-02-23 18:49:24\", \"weight\": 339.3, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(117,'2026-02-23 18:49:31',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:49:31\", \"temperature\": 31.5, \"humidity\": 67, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(118,'2026-02-23 18:49:37',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:49:37\", \"temperature\": 28.7, \"humidity\": 61, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(119,'2026-02-23 18:49:40',2,'1',3,2,6,'saida_curral','{\"cattle_id\": 2, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:49:40\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(120,'2026-02-23 18:49:47',5,NULL,NULL,NULL,2,'other','{\"cattle_id\": 5, \"weight_date\": \"2026-02-23 18:49:47\", \"weight\": 445.0, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(121,'2026-02-23 18:49:52',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:49:52\", \"temperature\": 31.0, \"humidity\": 58, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(122,'2026-02-23 18:49:57',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:49:57\", \"temperature\": 30.8, \"humidity\": 74, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(123,'2026-02-23 18:50:04',1,'2',1,1,6,'vacinação','{\"cattle_id\": 1, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:50:04\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(124,'2026-02-23 18:50:09',8,'1',2,3,2,'entrada_curral','{\"cattle_id\": 8, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:50:09\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(125,'2026-02-23 18:50:14',5,'2',3,2,2,'vacinação','{\"cattle_id\": 5, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:50:14\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(126,'2026-02-23 18:50:21',13,NULL,NULL,NULL,6,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 18:50:21\", \"weight\": 287.1, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(127,'2026-02-23 18:50:24',16,NULL,NULL,NULL,6,'other','{\"cattle_id\": 16, \"weight_date\": \"2026-02-23 18:50:24\", \"weight\": 326.6, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(128,'2026-02-23 18:50:30',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:50:30\", \"temperature\": 26.0, \"humidity\": 53, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(129,'2026-02-23 18:50:33',6,'1',2,1,2,'vacinação','{\"cattle_id\": 6, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:50:33\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(130,'2026-02-23 18:50:39',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:50:39\", \"temperature\": 30.4, \"humidity\": 64, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(131,'2026-02-23 18:50:42',13,NULL,NULL,NULL,2,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 18:50:42\", \"weight\": 351.0, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(132,'2026-02-23 18:50:48',8,'3',2,2,6,'saida_curral','{\"cattle_id\": 8, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:50:48\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(133,'2026-02-23 18:50:51',11,'2',3,2,6,'saida_curral','{\"cattle_id\": 11, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:50:51\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(134,'2026-02-23 18:50:57',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:50:57\", \"temperature\": 26.1, \"humidity\": 70, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(135,'2026-02-23 18:51:03',8,NULL,NULL,NULL,2,'other','{\"cattle_id\": 8, \"weight_date\": \"2026-02-23 18:51:03\", \"weight\": 355.2, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(136,'2026-02-23 18:51:10',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:51:10\", \"temperature\": 29.3, \"humidity\": 61, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(137,'2026-02-23 18:51:15',12,'1',4,3,2,'vacinação','{\"cattle_id\": 12, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:51:15\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(138,'2026-02-23 18:51:18',2,'1',2,3,6,'vacinação','{\"cattle_id\": 2, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:51:18\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(139,'2026-02-23 18:51:20',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:51:20\", \"temperature\": 28.3, \"humidity\": 68, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(140,'2026-02-23 18:51:24',6,NULL,NULL,NULL,2,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:51:24\", \"weight\": 225.4, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(141,'2026-02-23 18:51:30',16,NULL,NULL,NULL,6,'other','{\"cattle_id\": 16, \"weight_date\": \"2026-02-23 18:51:30\", \"weight\": 294.2, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(142,'2026-02-23 18:51:32',17,'3',1,1,6,'vacinação','{\"cattle_id\": 17, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:51:32\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(143,'2026-02-23 18:51:38',12,'3',2,3,2,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:51:38\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(144,'2026-02-23 18:51:45',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:51:45\", \"temperature\": 28.3, \"humidity\": 68, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(145,'2026-02-23 18:51:48',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:51:48\", \"temperature\": 26.5, \"humidity\": 64, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(146,'2026-02-23 18:51:55',8,NULL,NULL,NULL,3,'other','{\"cattle_id\": 8, \"weight_date\": \"2026-02-23 18:51:55\", \"weight\": 421.7, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(147,'2026-02-23 18:51:57',14,'2',3,3,2,'vacinação','{\"cattle_id\": 14, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:51:57\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(148,'2026-02-23 18:52:01',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:52:01\", \"temperature\": 30.5, \"humidity\": 73, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(149,'2026-02-23 18:52:06',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:52:06\", \"temperature\": 30.4, \"humidity\": 61, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(150,'2026-02-23 18:52:12',10,NULL,NULL,NULL,6,'other','{\"cattle_id\": 10, \"weight_date\": \"2026-02-23 18:52:12\", \"weight\": 251.2, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(151,'2026-02-23 18:52:16',11,'3',3,3,3,'entrada_curral','{\"cattle_id\": 11, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:52:16\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(152,'2026-02-23 18:52:24',7,'2',3,3,2,'entrada_curral','{\"cattle_id\": 7, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:52:24\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(153,'2026-02-23 18:52:30',6,'3',3,3,6,'vacinação','{\"cattle_id\": 6, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:52:30\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(154,'2026-02-23 18:52:34',4,NULL,NULL,NULL,3,'other','{\"cattle_id\": 4, \"weight_date\": \"2026-02-23 18:52:34\", \"weight\": 429.1, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(155,'2026-02-23 18:52:39',16,NULL,NULL,NULL,6,'other','{\"cattle_id\": 16, \"weight_date\": \"2026-02-23 18:52:39\", \"weight\": 217.1, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(156,'2026-02-23 18:52:43',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:52:43\", \"temperature\": 31.9, \"humidity\": 51, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(157,'2026-02-23 18:52:50',6,'2',3,2,6,'saida_curral','{\"cattle_id\": 6, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:52:50\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(158,'2026-02-23 18:52:55',9,NULL,NULL,NULL,6,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:52:55\", \"weight\": 408.1, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(159,'2026-02-23 18:53:03',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:53:03\", \"temperature\": 25.6, \"humidity\": 68, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(160,'2026-02-23 18:53:09',7,NULL,NULL,NULL,3,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-02-23 18:53:09\", \"weight\": 410.8, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(161,'2026-02-23 18:53:14',20,'2',4,1,2,'entrada_curral','{\"cattle_id\": 20, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:53:14\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(162,'2026-02-23 18:53:17',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:53:17\", \"temperature\": 31.8, \"humidity\": 75, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(163,'2026-02-23 18:53:19',20,NULL,NULL,NULL,3,'other','{\"cattle_id\": 20, \"weight_date\": \"2026-02-23 18:53:19\", \"weight\": 217.0, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(164,'2026-02-23 18:53:23',13,'1',2,2,3,'saida_curral','{\"cattle_id\": 13, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:53:23\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(165,'2026-02-23 18:53:26',12,'2',3,1,6,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:53:26\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(166,'2026-02-23 18:53:30',11,NULL,NULL,NULL,6,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-02-23 18:53:30\", \"weight\": 231.3, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(167,'2026-02-23 18:53:34',5,'3',3,3,2,'saida_curral','{\"cattle_id\": 5, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:53:34\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(168,'2026-02-23 18:53:40',13,NULL,NULL,NULL,6,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 18:53:40\", \"weight\": 203.5, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(169,'2026-02-23 18:53:46',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:53:46\", \"temperature\": 27.2, \"humidity\": 74, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(170,'2026-02-23 18:53:52',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:53:52\", \"weight\": 400.0, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(171,'2026-02-23 18:53:55',8,'1',4,2,2,'entrada_curral','{\"cattle_id\": 8, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:53:55\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(172,'2026-02-23 18:53:58',2,'1',1,2,6,'saida_curral','{\"cattle_id\": 2, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:53:58\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(173,'2026-02-23 18:54:01',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:54:01\", \"temperature\": 31.8, \"humidity\": 66, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(174,'2026-02-23 18:54:07',20,NULL,NULL,NULL,3,'other','{\"cattle_id\": 20, \"weight_date\": \"2026-02-23 18:54:07\", \"weight\": 345.1, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(175,'2026-02-23 18:54:11',6,'1',4,3,6,'entrada_curral','{\"cattle_id\": 6, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:54:11\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(176,'2026-02-23 18:54:17',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:54:17\", \"temperature\": 31.2, \"humidity\": 74, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(177,'2026-02-23 18:54:19',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:54:19\", \"temperature\": 26.3, \"humidity\": 74, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(178,'2026-02-23 18:54:25',3,NULL,NULL,NULL,6,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:54:25\", \"weight\": 261.3, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(179,'2026-02-23 18:54:29',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:54:29\", \"temperature\": 32.0, \"humidity\": 77, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(180,'2026-02-23 18:54:37',15,'2',1,2,3,'vacinação','{\"cattle_id\": 15, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:54:37\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(181,'2026-02-23 18:54:40',11,'2',4,2,2,'saida_curral','{\"cattle_id\": 11, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:54:40\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(182,'2026-02-23 18:54:44',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:54:44\", \"temperature\": 26.9, \"humidity\": 67, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(183,'2026-02-23 18:54:46',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:54:46\", \"temperature\": 25.6, \"humidity\": 62, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(184,'2026-02-23 18:54:50',12,'2',2,1,3,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:54:50\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(185,'2026-02-23 18:54:53',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:54:53\", \"temperature\": 27.8, \"humidity\": 53, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(186,'2026-02-23 18:54:58',19,'3',3,3,2,'saida_curral','{\"cattle_id\": 19, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:54:58\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(187,'2026-02-23 18:55:02',1,NULL,NULL,NULL,2,'other','{\"cattle_id\": 1, \"weight_date\": \"2026-02-23 18:55:02\", \"weight\": 352.9, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(188,'2026-02-23 18:55:07',11,'3',1,1,2,'entrada_curral','{\"cattle_id\": 11, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:55:07\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(189,'2026-02-23 18:55:14',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:55:14\", \"temperature\": 25.9, \"humidity\": 58, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(190,'2026-02-23 18:55:22',18,'3',2,3,6,'vacinação','{\"cattle_id\": 18, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:55:22\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(191,'2026-02-23 18:55:28',9,NULL,NULL,NULL,2,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:55:28\", \"weight\": 357.6, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(192,'2026-02-23 18:55:34',9,NULL,NULL,NULL,2,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 18:55:34\", \"weight\": 336.7, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(193,'2026-02-23 18:55:39',3,NULL,NULL,NULL,6,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 18:55:39\", \"weight\": 427.8, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(194,'2026-02-23 18:55:43',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:55:43\", \"temperature\": 28.9, \"humidity\": 54, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(195,'2026-02-23 18:55:47',16,'2',1,1,2,'vacinação','{\"cattle_id\": 16, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:55:47\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(196,'2026-02-23 18:55:54',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:55:54\", \"temperature\": 26.7, \"humidity\": 67, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(197,'2026-02-23 18:55:58',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:55:58\", \"temperature\": 31.7, \"humidity\": 55, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(198,'2026-02-23 18:56:02',19,NULL,NULL,NULL,3,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 18:56:02\", \"weight\": 433.2, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(199,'2026-02-23 18:56:09',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 18:56:09\", \"weight\": 340.5, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(200,'2026-02-23 18:56:14',13,NULL,NULL,NULL,2,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 18:56:14\", \"weight\": 282.9, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(201,'2026-02-23 18:56:19',4,NULL,NULL,NULL,2,'other','{\"cattle_id\": 4, \"weight_date\": \"2026-02-23 18:56:19\", \"weight\": 448.9, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(202,'2026-02-23 18:56:26',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:56:26\", \"temperature\": 30.1, \"humidity\": 75, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(203,'2026-02-23 18:56:29',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:56:29\", \"temperature\": 31.2, \"humidity\": 61, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(204,'2026-02-23 18:56:32',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:56:32\", \"temperature\": 25.8, \"humidity\": 59, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(205,'2026-02-23 18:56:36',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:56:36\", \"temperature\": 31.1, \"humidity\": 80, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(206,'2026-02-23 18:56:40',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:56:40\", \"temperature\": 26.4, \"humidity\": 54, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(207,'2026-02-23 18:56:42',14,'3',4,1,6,'saida_curral','{\"cattle_id\": 14, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:56:42\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(208,'2026-02-23 18:56:44',14,'2',3,1,6,'vacinação','{\"cattle_id\": 14, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:56:44\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(209,'2026-02-23 18:56:48',13,NULL,NULL,NULL,6,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 18:56:48\", \"weight\": 407.8, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(210,'2026-02-23 18:56:50',11,NULL,NULL,NULL,3,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-02-23 18:56:50\", \"weight\": 291.4, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(211,'2026-02-23 18:56:56',11,NULL,NULL,NULL,2,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-02-23 18:56:56\", \"weight\": 243.5, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(212,'2026-02-23 18:57:02',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:57:02\", \"temperature\": 29.8, \"humidity\": 80, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(213,'2026-02-23 18:57:05',19,NULL,NULL,NULL,6,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 18:57:05\", \"weight\": 337.6, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(214,'2026-02-23 18:57:08',12,'2',1,1,3,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:57:08\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(215,'2026-02-23 18:57:12',4,NULL,NULL,NULL,6,'other','{\"cattle_id\": 4, \"weight_date\": \"2026-02-23 18:57:12\", \"weight\": 236.6, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(216,'2026-02-23 18:57:18',16,'3',4,3,2,'vacinação','{\"cattle_id\": 16, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:57:18\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(217,'2026-02-23 18:57:21',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:57:21\", \"temperature\": 31.6, \"humidity\": 60, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(218,'2026-02-23 18:57:24',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:57:24\", \"temperature\": 26.3, \"humidity\": 57, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(219,'2026-02-23 18:57:29',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:57:29\", \"temperature\": 28.1, \"humidity\": 63, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(220,'2026-02-23 18:57:31',11,'2',1,1,6,'vacinação','{\"cattle_id\": 11, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:57:31\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(221,'2026-02-23 18:57:34',19,'3',4,2,6,'vacinação','{\"cattle_id\": 19, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:57:34\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(222,'2026-02-23 18:57:40',20,NULL,NULL,NULL,6,'other','{\"cattle_id\": 20, \"weight_date\": \"2026-02-23 18:57:40\", \"weight\": 418.1, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(223,'2026-02-23 18:57:44',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:57:44\", \"temperature\": 26.3, \"humidity\": 77, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(224,'2026-02-23 18:57:46',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:57:46\", \"temperature\": 26.8, \"humidity\": 71, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(225,'2026-02-23 18:57:49',2,'2',4,3,6,'vacinação','{\"cattle_id\": 2, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:57:49\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(226,'2026-02-23 18:57:52',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:57:52\", \"temperature\": 31.1, \"humidity\": 60, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(227,'2026-02-23 18:57:54',7,NULL,NULL,NULL,3,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-02-23 18:57:54\", \"weight\": 356.2, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(228,'2026-02-23 18:57:58',16,'1',4,1,6,'saida_curral','{\"cattle_id\": 16, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:57:58\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(229,'2026-02-23 18:58:01',3,'3',3,3,6,'entrada_curral','{\"cattle_id\": 3, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:58:01\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(230,'2026-02-23 18:58:07',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:58:07\", \"temperature\": 30.5, \"humidity\": 70, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(231,'2026-02-23 18:58:10',5,'2',2,3,6,'vacinação','{\"cattle_id\": 5, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:58:10\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(232,'2026-02-23 18:58:13',12,'1',1,1,3,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:58:13\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(233,'2026-02-23 18:58:20',8,'1',1,3,3,'entrada_curral','{\"cattle_id\": 8, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 18:58:20\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(234,'2026-02-23 18:58:27',11,NULL,NULL,NULL,3,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-02-23 18:58:27\", \"weight\": 285.7, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(235,'2026-02-23 18:58:32',4,'1',4,3,6,'saida_curral','{\"cattle_id\": 4, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:58:32\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(236,'2026-02-23 18:58:37',12,'1',2,1,6,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:58:37\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(237,'2026-02-23 18:58:40',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:58:40\", \"temperature\": 31.5, \"humidity\": 70, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(238,'2026-02-23 18:58:47',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:58:47\", \"temperature\": 27.0, \"humidity\": 79, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(239,'2026-02-23 18:58:52',18,NULL,NULL,NULL,6,'other','{\"cattle_id\": 18, \"weight_date\": \"2026-02-23 18:58:52\", \"weight\": 367.7, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(240,'2026-02-23 18:58:56',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:58:56\", \"temperature\": 29.3, \"humidity\": 80, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(241,'2026-02-23 18:59:04',15,NULL,NULL,NULL,2,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 18:59:04\", \"weight\": 352.4, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(242,'2026-02-23 18:59:08',1,'2',1,2,2,'vacinação','{\"cattle_id\": 1, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:59:08\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(243,'2026-02-23 18:59:13',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:59:13\", \"temperature\": 26.5, \"humidity\": 65, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(244,'2026-02-23 18:59:20',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:59:20\", \"temperature\": 27.8, \"humidity\": 66, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(245,'2026-02-23 18:59:25',18,'2',3,2,2,'vacinação','{\"cattle_id\": 18, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 18:59:25\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(246,'2026-02-23 18:59:32',14,NULL,NULL,NULL,2,'other','{\"cattle_id\": 14, \"weight_date\": \"2026-02-23 18:59:32\", \"weight\": 250.4, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(247,'2026-02-23 18:59:40',2,'2',1,2,6,'saida_curral','{\"cattle_id\": 2, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 18:59:40\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(248,'2026-02-23 18:59:48',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 18:59:48\", \"temperature\": 28.6, \"humidity\": 72, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(249,'2026-02-23 18:59:55',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 18:59:55\", \"temperature\": 29.0, \"humidity\": 78, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(250,'2026-02-23 18:59:58',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 18:59:58\", \"temperature\": 28.0, \"humidity\": 69, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(251,'2026-02-23 19:00:02',7,'2',3,2,3,'vacinação','{\"cattle_id\": 7, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:00:02\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(252,'2026-02-23 19:00:04',6,NULL,NULL,NULL,3,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:00:04\", \"weight\": 306.0, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(253,'2026-02-23 19:00:07',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:00:07\", \"temperature\": 30.4, \"humidity\": 51, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(254,'2026-02-23 19:00:11',15,'2',2,3,3,'vacinação','{\"cattle_id\": 15, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:00:11\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(255,'2026-02-23 19:00:18',6,NULL,NULL,NULL,3,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:00:18\", \"weight\": 414.6, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(256,'2026-02-23 19:00:25',12,'2',4,1,2,'vacinação','{\"cattle_id\": 12, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:00:25\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(257,'2026-02-23 19:00:32',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:00:32\", \"temperature\": 30.9, \"humidity\": 78, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(258,'2026-02-23 19:00:35',9,NULL,NULL,NULL,2,'other','{\"cattle_id\": 9, \"weight_date\": \"2026-02-23 19:00:35\", \"weight\": 229.9, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(259,'2026-02-23 19:00:38',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:00:38\", \"temperature\": 27.5, \"humidity\": 59, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(260,'2026-02-23 19:00:40',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:00:40\", \"temperature\": 31.6, \"humidity\": 59, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(261,'2026-02-23 19:00:43',7,NULL,NULL,NULL,3,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-02-23 19:00:43\", \"weight\": 390.7, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(262,'2026-02-23 19:00:46',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:00:46\", \"temperature\": 29.2, \"humidity\": 62, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(263,'2026-02-23 19:00:50',9,'1',2,2,2,'saida_curral','{\"cattle_id\": 9, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:00:50\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(264,'2026-02-23 19:00:54',15,NULL,NULL,NULL,6,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:00:54\", \"weight\": 375.4, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(265,'2026-02-23 19:00:57',19,NULL,NULL,NULL,2,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 19:00:57\", \"weight\": 239.0, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(266,'2026-02-23 19:01:02',5,'2',2,2,2,'vacinação','{\"cattle_id\": 5, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:01:02\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(267,'2026-02-23 19:01:06',3,NULL,NULL,NULL,3,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 19:01:06\", \"weight\": 371.2, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(268,'2026-02-23 19:01:09',15,NULL,NULL,NULL,6,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:01:09\", \"weight\": 343.5, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(269,'2026-02-23 19:01:13',12,NULL,NULL,NULL,6,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-02-23 19:01:13\", \"weight\": 320.8, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(270,'2026-02-23 19:01:21',13,NULL,NULL,NULL,6,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 19:01:21\", \"weight\": 283.5, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(271,'2026-02-23 19:01:23',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:01:23\", \"temperature\": 28.0, \"humidity\": 71, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(272,'2026-02-23 19:01:28',1,'1',2,1,2,'entrada_curral','{\"cattle_id\": 1, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:01:28\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(273,'2026-02-23 19:01:36',6,'2',1,3,2,'saida_curral','{\"cattle_id\": 6, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:01:36\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(274,'2026-02-23 19:01:42',2,NULL,NULL,NULL,2,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-02-23 19:01:42\", \"weight\": 231.2, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(275,'2026-02-23 19:01:45',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:01:45\", \"temperature\": 31.5, \"humidity\": 51, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(276,'2026-02-23 19:01:47',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:01:47\", \"temperature\": 30.7, \"humidity\": 69, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(277,'2026-02-23 19:01:52',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:01:52\", \"weight\": 400.8, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(278,'2026-02-23 19:01:57',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:01:57\", \"temperature\": 27.4, \"humidity\": 50, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(279,'2026-02-23 19:02:03',2,'3',2,2,2,'vacinação','{\"cattle_id\": 2, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:02:03\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(280,'2026-02-23 19:02:08',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:02:08\", \"temperature\": 27.6, \"humidity\": 50, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(281,'2026-02-23 19:02:11',15,NULL,NULL,NULL,6,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:02:11\", \"weight\": 284.4, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(282,'2026-02-23 19:02:16',11,'1',3,3,6,'entrada_curral','{\"cattle_id\": 11, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:02:16\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(283,'2026-02-23 19:02:21',20,NULL,NULL,NULL,6,'other','{\"cattle_id\": 20, \"weight_date\": \"2026-02-23 19:02:21\", \"weight\": 407.9, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(284,'2026-02-23 19:02:29',19,NULL,NULL,NULL,6,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 19:02:29\", \"weight\": 288.1, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(285,'2026-02-23 19:02:34',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:02:34\", \"temperature\": 28.1, \"humidity\": 57, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(286,'2026-02-23 19:02:41',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:02:41\", \"temperature\": 25.0, \"humidity\": 63, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(287,'2026-02-23 19:02:46',17,'2',2,1,3,'vacinação','{\"cattle_id\": 17, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:02:46\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(288,'2026-02-23 19:02:53',11,'2',3,1,6,'saida_curral','{\"cattle_id\": 11, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:02:53\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(289,'2026-02-23 19:02:59',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:02:59\", \"temperature\": 25.1, \"humidity\": 64, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(290,'2026-02-23 19:03:02',3,NULL,NULL,NULL,2,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 19:03:02\", \"weight\": 317.4, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(291,'2026-02-23 19:03:04',17,'2',3,2,6,'entrada_curral','{\"cattle_id\": 17, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:03:04\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(292,'2026-02-23 19:03:09',12,NULL,NULL,NULL,2,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-02-23 19:03:09\", \"weight\": 293.7, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(293,'2026-02-23 19:03:13',1,NULL,NULL,NULL,6,'other','{\"cattle_id\": 1, \"weight_date\": \"2026-02-23 19:03:13\", \"weight\": 232.9, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(294,'2026-02-23 19:03:17',19,NULL,NULL,NULL,2,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 19:03:17\", \"weight\": 380.1, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(295,'2026-02-23 19:03:19',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:03:19\", \"temperature\": 28.1, \"humidity\": 52, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(296,'2026-02-23 19:03:27',20,'1',3,1,6,'vacinação','{\"cattle_id\": 20, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:03:27\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(297,'2026-02-23 19:03:32',13,NULL,NULL,NULL,3,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 19:03:32\", \"weight\": 237.7, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(298,'2026-02-23 19:03:38',12,'2',2,3,2,'vacinação','{\"cattle_id\": 12, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:03:38\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(299,'2026-02-23 19:03:42',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:03:42\", \"temperature\": 28.6, \"humidity\": 80, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(300,'2026-02-23 19:03:45',17,'1',1,2,2,'saida_curral','{\"cattle_id\": 17, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:03:45\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(301,'2026-02-23 19:03:48',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:03:48\", \"temperature\": 29.0, \"humidity\": 70, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(302,'2026-02-23 19:03:55',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:03:55\", \"temperature\": 28.1, \"humidity\": 69, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(303,'2026-02-23 19:03:59',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:03:59\", \"temperature\": 26.8, \"humidity\": 53, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(304,'2026-02-23 19:04:03',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:04:03\", \"temperature\": 29.8, \"humidity\": 53, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(305,'2026-02-23 19:04:08',11,NULL,NULL,NULL,3,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-02-23 19:04:08\", \"weight\": 259.9, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(306,'2026-02-23 19:04:15',15,NULL,NULL,NULL,3,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:04:15\", \"weight\": 250.4, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(307,'2026-02-23 19:04:20',5,'1',3,1,3,'saida_curral','{\"cattle_id\": 5, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:04:20\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(308,'2026-02-23 19:04:28',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:04:28\", \"temperature\": 26.0, \"humidity\": 59, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(309,'2026-02-23 19:04:31',3,'3',1,3,3,'entrada_curral','{\"cattle_id\": 3, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:04:31\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(310,'2026-02-23 19:04:36',20,'3',2,2,2,'vacinação','{\"cattle_id\": 20, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:04:36\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(311,'2026-02-23 19:04:39',5,NULL,NULL,NULL,2,'other','{\"cattle_id\": 5, \"weight_date\": \"2026-02-23 19:04:39\", \"weight\": 419.8, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(312,'2026-02-23 19:04:45',20,'1',3,1,6,'vacinação','{\"cattle_id\": 20, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:04:45\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(313,'2026-02-23 19:04:49',10,NULL,NULL,NULL,3,'other','{\"cattle_id\": 10, \"weight_date\": \"2026-02-23 19:04:49\", \"weight\": 213.4, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(314,'2026-02-23 19:04:57',13,'2',1,2,6,'vacinação','{\"cattle_id\": 13, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:04:57\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(315,'2026-02-23 19:04:59',10,'2',3,1,6,'vacinação','{\"cattle_id\": 10, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:04:59\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(316,'2026-02-23 19:05:02',12,'1',4,3,3,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:05:02\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(317,'2026-02-23 19:05:06',7,NULL,NULL,NULL,2,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-02-23 19:05:06\", \"weight\": 203.0, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(318,'2026-02-23 19:05:09',15,NULL,NULL,NULL,3,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:05:09\", \"weight\": 383.1, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(319,'2026-02-23 19:05:14',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:05:14\", \"temperature\": 25.6, \"humidity\": 71, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(320,'2026-02-23 19:05:21',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:05:21\", \"temperature\": 31.5, \"humidity\": 74, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(321,'2026-02-23 19:05:28',10,NULL,NULL,NULL,6,'other','{\"cattle_id\": 10, \"weight_date\": \"2026-02-23 19:05:28\", \"weight\": 229.6, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(322,'2026-02-23 19:05:36',19,'1',3,1,2,'vacinação','{\"cattle_id\": 19, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:05:36\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(323,'2026-02-23 19:05:43',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:05:43\", \"temperature\": 29.1, \"humidity\": 69, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(324,'2026-02-23 19:05:46',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:05:46\", \"temperature\": 27.7, \"humidity\": 61, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(325,'2026-02-23 19:05:53',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:05:53\", \"temperature\": 29.9, \"humidity\": 59, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(326,'2026-02-23 19:06:01',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:06:01\", \"temperature\": 31.9, \"humidity\": 79, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(327,'2026-02-23 19:06:04',7,NULL,NULL,NULL,3,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-02-23 19:06:04\", \"weight\": 418.4, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(328,'2026-02-23 19:06:08',15,NULL,NULL,NULL,6,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:06:08\", \"weight\": 213.9, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(329,'2026-02-23 19:06:11',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:06:11\", \"temperature\": 29.1, \"humidity\": 56, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(330,'2026-02-23 19:06:15',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:06:15\", \"temperature\": 30.4, \"humidity\": 80, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(331,'2026-02-23 19:06:21',13,NULL,NULL,NULL,3,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 19:06:21\", \"weight\": 375.8, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(332,'2026-02-23 19:06:23',3,NULL,NULL,NULL,3,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 19:06:23\", \"weight\": 439.6, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(333,'2026-02-23 19:06:30',9,'3',4,3,2,'entrada_curral','{\"cattle_id\": 9, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:06:30\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(334,'2026-02-23 19:06:37',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:06:37\", \"temperature\": 29.2, \"humidity\": 73, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(335,'2026-02-23 19:06:41',19,NULL,NULL,NULL,6,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 19:06:41\", \"weight\": 270.6, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(336,'2026-02-23 19:06:46',3,'2',4,2,2,'vacinação','{\"cattle_id\": 3, \"device_id\": \"2\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:06:46\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(337,'2026-02-23 19:06:51',14,NULL,NULL,NULL,6,'other','{\"cattle_id\": 14, \"weight_date\": \"2026-02-23 19:06:51\", \"weight\": 268.2, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(338,'2026-02-23 19:06:54',11,'2',1,2,6,'saida_curral','{\"cattle_id\": 11, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:06:54\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(339,'2026-02-23 19:06:58',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:06:58\", \"weight\": 376.3, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(340,'2026-02-23 19:07:06',15,NULL,NULL,NULL,2,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:07:06\", \"weight\": 420.3, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(341,'2026-02-23 19:07:09',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:07:09\", \"temperature\": 28.6, \"humidity\": 69, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(342,'2026-02-23 19:07:13',9,'2',2,2,3,'saida_curral','{\"cattle_id\": 9, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:07:13\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(343,'2026-02-23 19:07:17',17,NULL,NULL,NULL,2,'other','{\"cattle_id\": 17, \"weight_date\": \"2026-02-23 19:07:17\", \"weight\": 233.7, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(344,'2026-02-23 19:07:23',8,NULL,NULL,NULL,3,'other','{\"cattle_id\": 8, \"weight_date\": \"2026-02-23 19:07:23\", \"weight\": 379.6, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(345,'2026-02-23 19:07:26',11,NULL,NULL,NULL,2,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-02-23 19:07:26\", \"weight\": 363.5, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(346,'2026-02-23 19:07:33',7,'1',3,2,2,'saida_curral','{\"cattle_id\": 7, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:07:33\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(347,'2026-02-23 19:07:38',11,NULL,NULL,NULL,2,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-02-23 19:07:38\", \"weight\": 271.8, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(348,'2026-02-23 19:07:41',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:07:41\", \"temperature\": 30.4, \"humidity\": 60, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(349,'2026-02-23 19:07:43',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:07:43\", \"weight\": 248.4, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(350,'2026-02-23 19:07:50',10,'3',2,1,3,'saida_curral','{\"cattle_id\": 10, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:07:50\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(351,'2026-02-23 19:07:57',14,'1',2,3,6,'saida_curral','{\"cattle_id\": 14, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:07:57\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(352,'2026-02-23 19:08:04',6,NULL,NULL,NULL,2,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:08:04\", \"weight\": 287.7, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(353,'2026-02-23 19:08:10',20,'3',2,3,2,'saida_curral','{\"cattle_id\": 20, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:08:10\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(354,'2026-02-23 19:08:13',8,NULL,NULL,NULL,6,'other','{\"cattle_id\": 8, \"weight_date\": \"2026-02-23 19:08:13\", \"weight\": 206.6, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(355,'2026-02-23 19:08:18',12,'3',2,2,2,'entrada_curral','{\"cattle_id\": 12, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:08:18\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(356,'2026-02-23 19:08:25',13,NULL,NULL,NULL,2,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 19:08:25\", \"weight\": 416.1, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(357,'2026-02-23 19:08:29',6,NULL,NULL,NULL,2,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:08:29\", \"weight\": 383.3, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(358,'2026-02-23 19:08:36',18,'2',1,2,2,'entrada_curral','{\"cattle_id\": 18, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:08:36\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(359,'2026-02-23 19:08:44',1,'1',1,2,3,'entrada_curral','{\"cattle_id\": 1, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:08:44\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(360,'2026-02-23 19:08:50',19,'3',1,3,3,'entrada_curral','{\"cattle_id\": 19, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:08:50\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(361,'2026-02-23 19:08:53',15,'3',4,2,2,'entrada_curral','{\"cattle_id\": 15, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:08:53\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(362,'2026-02-23 19:08:57',13,'3',1,3,6,'vacinação','{\"cattle_id\": 13, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:08:57\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(363,'2026-02-23 19:09:03',6,NULL,NULL,NULL,3,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:09:03\", \"weight\": 234.5, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(364,'2026-02-23 19:09:11',18,'1',3,2,6,'entrada_curral','{\"cattle_id\": 18, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:09:11\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(365,'2026-02-23 19:09:18',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:09:18\", \"temperature\": 28.0, \"humidity\": 56, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(366,'2026-02-23 19:09:23',18,'3',1,2,6,'entrada_curral','{\"cattle_id\": 18, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:09:23\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(367,'2026-02-23 19:09:27',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:09:27\", \"temperature\": 25.3, \"humidity\": 58, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(368,'2026-02-23 19:09:34',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:09:34\", \"temperature\": 28.4, \"humidity\": 79, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(369,'2026-02-23 19:09:41',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:09:41\", \"temperature\": 26.2, \"humidity\": 65, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(370,'2026-02-23 19:09:48',10,'1',2,2,6,'entrada_curral','{\"cattle_id\": 10, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:09:48\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(371,'2026-02-23 19:09:51',13,'1',3,3,3,'entrada_curral','{\"cattle_id\": 13, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:09:51\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(372,'2026-02-23 19:09:53',17,'1',4,2,6,'entrada_curral','{\"cattle_id\": 17, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:09:53\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(373,'2026-02-23 19:09:59',10,NULL,NULL,NULL,2,'other','{\"cattle_id\": 10, \"weight_date\": \"2026-02-23 19:09:59\", \"weight\": 346.7, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(374,'2026-02-23 19:10:06',5,'1',1,2,6,'vacinação','{\"cattle_id\": 5, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:10:06\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(375,'2026-02-23 19:10:13',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:10:13\", \"temperature\": 26.4, \"humidity\": 57, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(376,'2026-02-23 19:10:21',2,'2',1,2,6,'vacinação','{\"cattle_id\": 2, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:10:21\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(377,'2026-02-23 19:10:24',20,'3',2,1,2,'saida_curral','{\"cattle_id\": 20, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:10:24\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(378,'2026-02-23 19:10:31',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:10:31\", \"temperature\": 27.1, \"humidity\": 65, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(379,'2026-02-23 19:10:34',5,NULL,NULL,NULL,2,'other','{\"cattle_id\": 5, \"weight_date\": \"2026-02-23 19:10:34\", \"weight\": 304.4, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(380,'2026-02-23 19:10:38',3,NULL,NULL,NULL,3,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-02-23 19:10:38\", \"weight\": 325.4, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(381,'2026-02-23 19:10:40',16,'2',2,1,3,'saida_curral','{\"cattle_id\": 16, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:10:40\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(382,'2026-02-23 19:10:48',16,NULL,NULL,NULL,2,'other','{\"cattle_id\": 16, \"weight_date\": \"2026-02-23 19:10:48\", \"weight\": 209.3, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(383,'2026-02-23 19:10:51',5,'1',4,2,3,'saida_curral','{\"cattle_id\": 5, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:10:51\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(384,'2026-02-23 19:10:59',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:10:59\", \"temperature\": 29.3, \"humidity\": 55, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(385,'2026-02-23 19:11:02',6,'1',4,2,2,'vacinação','{\"cattle_id\": 6, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:11:02\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(386,'2026-02-23 19:11:05',12,'3',3,1,3,'saida_curral','{\"cattle_id\": 12, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:11:05\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(387,'2026-02-23 19:11:09',15,NULL,NULL,NULL,3,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:11:09\", \"weight\": 379.5, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(388,'2026-02-23 19:11:15',3,'1',4,1,6,'entrada_curral','{\"cattle_id\": 3, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:11:15\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(389,'2026-02-23 19:11:21',1,'1',4,1,6,'entrada_curral','{\"cattle_id\": 1, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:11:21\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(390,'2026-02-23 19:11:29',15,NULL,NULL,NULL,2,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:11:29\", \"weight\": 372.3, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(391,'2026-02-23 19:11:35',5,NULL,NULL,NULL,3,'other','{\"cattle_id\": 5, \"weight_date\": \"2026-02-23 19:11:35\", \"weight\": 392.5, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(392,'2026-02-23 19:11:39',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:11:39\", \"temperature\": 25.5, \"humidity\": 68, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(393,'2026-02-23 19:11:44',7,'3',4,3,3,'vacinação','{\"cattle_id\": 7, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:11:44\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(394,'2026-02-23 19:11:50',16,'3',2,1,3,'saida_curral','{\"cattle_id\": 16, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:11:50\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(395,'2026-02-23 19:11:56',10,'2',2,3,6,'vacinação','{\"cattle_id\": 10, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:11:56\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(396,'2026-02-23 19:12:02',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:12:02\", \"temperature\": 25.4, \"humidity\": 66, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(397,'2026-02-23 19:12:05',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:12:05\", \"temperature\": 27.7, \"humidity\": 77, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(398,'2026-02-23 19:12:11',13,NULL,NULL,NULL,2,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 19:12:11\", \"weight\": 207.5, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(399,'2026-02-23 19:12:13',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:12:13\", \"temperature\": 28.0, \"humidity\": 52, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(400,'2026-02-23 19:12:20',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:12:20\", \"temperature\": 26.1, \"humidity\": 63, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(401,'2026-02-23 19:12:28',2,NULL,NULL,NULL,3,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-02-23 19:12:28\", \"weight\": 316.3, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(402,'2026-02-23 19:12:31',15,NULL,NULL,NULL,3,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-02-23 19:12:31\", \"weight\": 216.5, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(403,'2026-02-23 19:12:34',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:12:34\", \"temperature\": 29.4, \"humidity\": 59, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(404,'2026-02-23 19:12:40',3,'3',1,2,3,'vacinação','{\"cattle_id\": 3, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-02-23 19:12:40\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(405,'2026-02-23 19:12:46',6,NULL,NULL,NULL,6,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:12:46\", \"weight\": 229.2, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(406,'2026-02-23 19:12:52',11,'2',2,2,6,'entrada_curral','{\"cattle_id\": 11, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:12:52\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(407,'2026-02-23 19:12:54',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:12:54\", \"temperature\": 27.6, \"humidity\": 51, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(408,'2026-02-23 19:13:00',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:13:00\", \"temperature\": 28.5, \"humidity\": 55, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(409,'2026-02-23 19:13:05',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:13:05\", \"temperature\": 25.5, \"humidity\": 53, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(410,'2026-02-23 19:13:13',18,NULL,NULL,NULL,2,'other','{\"cattle_id\": 18, \"weight_date\": \"2026-02-23 19:13:13\", \"weight\": 266.1, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(411,'2026-02-23 19:13:20',16,'1',3,1,6,'entrada_curral','{\"cattle_id\": 16, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:13:20\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(412,'2026-02-23 19:13:25',19,NULL,NULL,NULL,6,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 19:13:25\", \"weight\": 293.9, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(413,'2026-02-23 19:13:31',6,'3',2,1,2,'entrada_curral','{\"cattle_id\": 6, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:13:31\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(414,'2026-02-23 19:13:37',13,NULL,NULL,NULL,6,'other','{\"cattle_id\": 13, \"weight_date\": \"2026-02-23 19:13:37\", \"weight\": 336.7, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(415,'2026-02-23 19:13:41',17,NULL,NULL,NULL,6,'other','{\"cattle_id\": 17, \"weight_date\": \"2026-02-23 19:13:41\", \"weight\": 265.4, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(416,'2026-02-23 19:13:46',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:13:46\", \"temperature\": 28.0, \"humidity\": 73, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(417,'2026-02-23 19:13:49',18,NULL,NULL,NULL,6,'other','{\"cattle_id\": 18, \"weight_date\": \"2026-02-23 19:13:49\", \"weight\": 231.0, \"location_id\": 6, \"notes\": \"Pesagem de rotina\"}'),
(418,'2026-02-23 19:13:57',1,'3',3,1,6,'saida_curral','{\"cattle_id\": 1, \"device_id\": \"3\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:13:57\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(419,'2026-02-23 19:14:03',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:14:03\", \"temperature\": 26.8, \"humidity\": 50, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(420,'2026-02-23 19:14:10',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:14:10\", \"temperature\": 27.6, \"humidity\": 56, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(421,'2026-02-23 19:14:12',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:14:12\", \"temperature\": 27.1, \"humidity\": 75, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(422,'2026-02-23 19:14:19',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:14:19\", \"temperature\": 31.6, \"humidity\": 60, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(423,'2026-02-23 19:14:26',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-02-23 19:14:26\", \"temperature\": 28.9, \"humidity\": 70, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(424,'2026-02-23 19:14:33',6,NULL,NULL,NULL,3,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-02-23 19:14:33\", \"weight\": 316.3, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(425,'2026-02-23 19:14:36',11,'1',3,1,6,'entrada_curral','{\"cattle_id\": 11, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-02-23 19:14:36\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(426,'2026-02-23 19:14:42',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:14:42\", \"temperature\": 25.1, \"humidity\": 67, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(427,'2026-02-23 19:19:06',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-02-23 19:19:06\", \"temperature\": 30.8, \"humidity\": 76, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(428,'2026-02-23 19:19:12',8,NULL,NULL,NULL,3,'other','{\"cattle_id\": 8, \"weight_date\": \"2026-02-23 19:19:12\", \"weight\": 272.3, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(429,'2026-02-23 19:19:18',19,NULL,NULL,NULL,3,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-02-23 19:19:18\", \"weight\": 344.1, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(430,'2026-02-23 19:19:21',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:19:21\", \"temperature\": 26.3, \"humidity\": 56, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(431,'2026-02-23 19:19:27',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-02-23 19:19:27\", \"temperature\": 31.8, \"humidity\": 67, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(432,'2026-02-23 19:19:32',8,'2',3,2,6,'saida_curral','{\"cattle_id\": 8, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-02-23 19:19:32\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(433,'2026-03-16 14:13:36',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-03-16 11:13:36\", \"temperature\": 28.9, \"humidity\": 77, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(434,'2026-03-16 14:13:40',20,NULL,NULL,NULL,2,'other','{\"cattle_id\": 20, \"weight_date\": \"2026-03-16 11:13:40\", \"weight\": 279.5, \"location_id\": 2, \"notes\": \"Pesagem de rotina\"}'),
(435,'2026-03-16 11:13:44',3,'1',1,3,6,'entrada_curral','{\"cattle_id\": 3, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:13:44\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(436,'2026-03-16 14:13:51',6,NULL,NULL,NULL,2,'other','{\"cattle_id\": 6, \"weight_date\": \"2026-03-16 11:13:51\", \"weight\": 314.7, \"location_id\": 2, \"notes\": \"Pesagem manual\"}'),
(437,'2026-03-16 14:13:58',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-03-16 11:13:58\", \"temperature\": 25.5, \"humidity\": 61, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(438,'2026-03-16 11:14:05',9,'1',4,1,2,'vacinação','{\"cattle_id\": 9, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:14:05\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(439,'2026-03-16 14:14:11',11,NULL,NULL,NULL,3,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-03-16 11:14:11\", \"weight\": 419.7, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(440,'2026-03-16 11:14:18',9,'3',1,3,3,'entrada_curral','{\"cattle_id\": 9, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:14:18\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(441,'2026-03-16 14:14:20',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-03-16 11:14:20\", \"temperature\": 25.2, \"humidity\": 68, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(442,'2026-03-16 11:14:24',8,'2',3,2,6,'entrada_curral','{\"cattle_id\": 8, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:14:24\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(443,'2026-03-16 14:14:30',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-03-16 11:14:30\", \"temperature\": 27.6, \"humidity\": 78, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(444,'2026-03-16 14:14:37',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-03-16 11:14:37\", \"temperature\": 29.0, \"humidity\": 69, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(445,'2026-03-16 11:14:44',2,'2',3,3,3,'vacinação','{\"cattle_id\": 2, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:14:44\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(446,'2026-03-16 11:14:47',18,'1',1,3,6,'saida_curral','{\"cattle_id\": 18, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:14:47\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(447,'2026-03-16 14:14:54',11,NULL,NULL,NULL,3,'other','{\"cattle_id\": 11, \"weight_date\": \"2026-03-16 11:14:54\", \"weight\": 342.6, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(448,'2026-03-16 14:14:56',NULL,NULL,NULL,3,6,'other','{\"site_id\": 3, \"location_id\": 6, \"sample_time\": \"2026-03-16 11:14:56\", \"temperature\": 29.1, \"humidity\": 59, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(449,'2026-03-16 14:15:00',2,NULL,NULL,NULL,2,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-03-16 11:15:00\", \"weight\": 386.5, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(450,'2026-03-16 14:15:04',16,NULL,NULL,NULL,3,'other','{\"cattle_id\": 16, \"weight_date\": \"2026-03-16 11:15:04\", \"weight\": 292.8, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(451,'2026-03-16 14:15:07',NULL,NULL,NULL,1,3,'other','{\"site_id\": 1, \"location_id\": 3, \"sample_time\": \"2026-03-16 11:15:07\", \"temperature\": 26.7, \"humidity\": 72, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(452,'2026-03-16 14:15:12',NULL,NULL,NULL,2,6,'other','{\"site_id\": 2, \"location_id\": 6, \"sample_time\": \"2026-03-16 11:15:12\", \"temperature\": 28.6, \"humidity\": 69, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(453,'2026-03-16 14:15:20',15,NULL,NULL,NULL,2,'other','{\"cattle_id\": 15, \"weight_date\": \"2026-03-16 11:15:20\", \"weight\": 212.9, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(454,'2026-03-16 11:15:24',5,'1',1,2,2,'saida_curral','{\"cattle_id\": 5, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:15:24\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(455,'2026-03-16 11:15:27',1,'3',4,1,3,'vacinação','{\"cattle_id\": 1, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:15:27\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(456,'2026-03-16 14:15:33',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-03-16 11:15:33\", \"temperature\": 26.0, \"humidity\": 52, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(457,'2026-03-16 11:15:37',3,'2',1,1,2,'saida_curral','{\"cattle_id\": 3, \"device_id\": \"2\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:15:37\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(458,'2026-03-16 14:15:41',NULL,NULL,NULL,2,2,'other','{\"site_id\": 2, \"location_id\": 2, \"sample_time\": \"2026-03-16 11:15:41\", \"temperature\": 26.7, \"humidity\": 53, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(459,'2026-03-16 11:15:47',8,'1',1,2,6,'entrada_curral','{\"cattle_id\": 8, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:15:47\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(460,'2026-03-16 11:15:52',19,'3',2,3,2,'vacinação','{\"cattle_id\": 19, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:15:52\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(461,'2026-03-16 14:15:56',2,NULL,NULL,NULL,6,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-03-16 11:15:56\", \"weight\": 221.3, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(462,'2026-03-16 14:16:01',7,NULL,NULL,NULL,6,'other','{\"cattle_id\": 7, \"weight_date\": \"2026-03-16 11:16:01\", \"weight\": 281.7, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(463,'2026-03-16 11:16:04',18,'3',1,1,2,'saida_curral','{\"cattle_id\": 18, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:16:04\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(464,'2026-03-16 11:16:10',10,'3',1,1,6,'entrada_curral','{\"cattle_id\": 10, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:16:10\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(465,'2026-03-16 11:16:14',16,'1',3,3,3,'saida_curral','{\"cattle_id\": 16, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:16:14\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(466,'2026-03-16 11:16:19',7,'3',4,2,3,'entrada_curral','{\"cattle_id\": 7, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:16:19\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(467,'2026-03-16 11:16:27',14,'2',2,1,6,'vacinação','{\"cattle_id\": 14, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:16:27\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(468,'2026-03-16 14:16:34',4,NULL,NULL,NULL,3,'other','{\"cattle_id\": 4, \"weight_date\": \"2026-03-16 11:16:34\", \"weight\": 437.3, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(469,'2026-03-16 11:16:39',9,'3',2,3,6,'entrada_curral','{\"cattle_id\": 9, \"device_id\": \"3\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:16:39\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(470,'2026-03-16 14:16:45',18,NULL,NULL,NULL,2,'other','{\"cattle_id\": 18, \"weight_date\": \"2026-03-16 11:16:45\", \"weight\": 212.4, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(471,'2026-03-16 11:16:48',15,'1',2,3,3,'vacinação','{\"cattle_id\": 15, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:16:48\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(472,'2026-03-16 14:16:54',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-03-16 11:16:54\", \"temperature\": 26.9, \"humidity\": 54, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(473,'2026-03-16 11:16:59',9,'2',2,3,3,'saida_curral','{\"cattle_id\": 9, \"device_id\": \"2\", \"operator_id\": 2, \"site_id\": 3, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:16:59\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(474,'2026-03-16 14:17:01',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-03-16 11:17:01\", \"temperature\": 30.7, \"humidity\": 67, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(475,'2026-03-16 14:17:03',20,NULL,NULL,NULL,6,'other','{\"cattle_id\": 20, \"weight_date\": \"2026-03-16 11:17:03\", \"weight\": 248.2, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(476,'2026-03-16 14:17:09',4,NULL,NULL,NULL,2,'other','{\"cattle_id\": 4, \"weight_date\": \"2026-03-16 11:17:09\", \"weight\": 273.8, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(477,'2026-03-16 11:17:15',9,'1',2,1,3,'saida_curral','{\"cattle_id\": 9, \"device_id\": \"1\", \"operator_id\": 2, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:17:15\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(478,'2026-03-16 14:17:21',12,NULL,NULL,NULL,3,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-03-16 11:17:21\", \"weight\": 413.4, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(479,'2026-03-16 11:17:24',19,'3',4,2,6,'vacinação','{\"cattle_id\": 19, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:17:24\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(480,'2026-03-16 14:17:31',12,NULL,NULL,NULL,3,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-03-16 11:17:31\", \"weight\": 312.1, \"location_id\": 3, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(481,'2026-03-16 14:17:37',NULL,NULL,NULL,3,2,'other','{\"site_id\": 3, \"location_id\": 2, \"sample_time\": \"2026-03-16 11:17:37\", \"temperature\": 29.0, \"humidity\": 77, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(482,'2026-03-16 11:17:42',8,'1',1,3,6,'vacinação','{\"cattle_id\": 8, \"device_id\": \"1\", \"operator_id\": 1, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:17:42\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(483,'2026-03-16 14:17:49',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-03-16 11:17:49\", \"temperature\": 28.6, \"humidity\": 69, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(484,'2026-03-16 14:17:54',2,NULL,NULL,NULL,6,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-03-16 11:17:54\", \"weight\": 433.5, \"location_id\": 6, \"notes\": \"Pesagem manual\"}'),
(485,'2026-03-16 11:17:58',8,'1',3,2,6,'entrada_curral','{\"cattle_id\": 8, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:17:58\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(486,'2026-03-16 11:18:02',13,'3',4,1,3,'entrada_curral','{\"cattle_id\": 13, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 3, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:18:02\", \"other_data\": {\"obs\": \"animal entrou\"}}'),
(487,'2026-03-16 11:18:07',10,'1',3,2,2,'saida_curral','{\"cattle_id\": 10, \"device_id\": \"1\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:18:07\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(488,'2026-03-16 14:18:14',12,NULL,NULL,NULL,3,'other','{\"cattle_id\": 12, \"weight_date\": \"2026-03-16 11:18:14\", \"weight\": 272.8, \"location_id\": 3, \"notes\": \"Pesagem de rotina\"}'),
(489,'2026-03-16 11:18:19',9,'2',3,2,2,'vacinação','{\"cattle_id\": 9, \"device_id\": \"2\", \"operator_id\": 3, \"site_id\": 2, \"location_id\": 2, \"event_type\": \"vacina\\u00e7\\u00e3o\", \"event_time\": \"2026-03-16 11:18:19\", \"other_data\": {\"obs\": \"vacina\\u00e7\\u00e3o realizada\"}}'),
(490,'2026-03-16 14:18:23',19,NULL,NULL,NULL,3,'other','{\"cattle_id\": 19, \"weight_date\": \"2026-03-16 11:18:23\", \"weight\": 308.3, \"location_id\": 3, \"notes\": \"Pesagem manual\"}'),
(491,'2026-03-16 14:18:26',NULL,NULL,NULL,1,6,'other','{\"site_id\": 1, \"location_id\": 6, \"sample_time\": \"2026-03-16 11:18:26\", \"temperature\": 27.0, \"humidity\": 70, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(492,'2026-03-16 11:18:31',3,'1',4,2,6,'saida_curral','{\"cattle_id\": 3, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 2, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:18:31\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(493,'2026-03-16 14:18:37',3,NULL,NULL,NULL,6,'other','{\"cattle_id\": 3, \"weight_date\": \"2026-03-16 11:18:37\", \"weight\": 443.2, \"location_id\": 6, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(494,'2026-03-16 11:18:44',13,'3',4,1,2,'saida_curral','{\"cattle_id\": 13, \"device_id\": \"3\", \"operator_id\": 4, \"site_id\": 1, \"location_id\": 2, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:18:44\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(495,'2026-03-16 14:18:49',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-03-16 11:18:49\", \"temperature\": 28.1, \"humidity\": 75, \"other_data\": {\"obs\": \"Leitura di\\u00e1ria\"}}'),
(496,'2026-03-16 14:18:54',NULL,NULL,NULL,2,3,'other','{\"site_id\": 2, \"location_id\": 3, \"sample_time\": \"2026-03-16 11:18:54\", \"temperature\": 26.3, \"humidity\": 65, \"other_data\": {\"obs\": \"Sensor ambiente curral\"}}'),
(497,'2026-03-16 14:19:01',2,NULL,NULL,NULL,2,'other','{\"cattle_id\": 2, \"weight_date\": \"2026-03-16 11:19:01\", \"weight\": 227.7, \"location_id\": 2, \"notes\": \"Pesagem autom\\u00e1tica\"}'),
(498,'2026-03-16 14:19:07',NULL,NULL,NULL,1,2,'other','{\"site_id\": 1, \"location_id\": 2, \"sample_time\": \"2026-03-16 11:19:07\", \"temperature\": 25.7, \"humidity\": 67, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(499,'2026-03-16 14:19:11',NULL,NULL,NULL,3,3,'other','{\"site_id\": 3, \"location_id\": 3, \"sample_time\": \"2026-03-16 11:19:11\", \"temperature\": 31.4, \"humidity\": 52, \"other_data\": {\"obs\": \"Coleta autom\\u00e1tica esta\\u00e7\\u00e3o meteo\"}}'),
(500,'2026-03-16 11:19:16',5,'3',1,1,6,'saida_curral','{\"cattle_id\": 5, \"device_id\": \"3\", \"operator_id\": 1, \"site_id\": 1, \"location_id\": 6, \"event_type\": \"saida_curral\", \"event_time\": \"2026-03-16 11:19:16\", \"other_data\": {\"obs\": \"animal saiu\"}}'),
(501,'2026-03-16 11:19:21',12,'1',4,3,6,'entrada_curral','{\"cattle_id\": 12, \"device_id\": \"1\", \"operator_id\": 4, \"site_id\": 3, \"location_id\": 6, \"event_type\": \"entrada_curral\", \"event_time\": \"2026-03-16 11:19:21\", \"other_data\": {\"obs\": \"animal entrou\"}}');
/*!40000 ALTER TABLE `events_raw` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `locations` VALUES
(2,NULL,1,'Curral Norte - Setor 2',NULL),
(3,'LOCAL001',2,'Fazenda Pasto Norte','water_point'),
(6,'LOCAL002',3,'Fazenda Celeiro Norte','shed');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `lots`
--

LOCK TABLES `lots` WRITE;
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `operators` VALUES
(1,'Leonid','admin'),
(2,'Rayane','vet'),
(3,'Osny','worker'),
(4,'Alex','viewer');
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES
(1,'SITE001','Fazenda Curral Norte','corral'),
(2,'SITE002','Fazenda Pasto Norte','pasture'),
(3,'SITE003','Fazenda Celeiro Norte','barn');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `system_logs`
--

LOCK TABLES `system_logs` WRITE;
/*!40000 ALTER TABLE `system_logs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `system_logs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-03-16 19:36:00
