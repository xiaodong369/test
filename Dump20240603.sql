-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 10.192.5.72    Database: xcharge
-- ------------------------------------------------------
-- Server version	5.7.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_pk` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `house_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`address_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_box`
--

DROP TABLE IF EXISTS `charge_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_box` (
  `charge_box_pk` int(11) NOT NULL AUTO_INCREMENT,
  `charge_box_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `endpoint_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocpp_protocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Accepted',
  `charge_point_vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charge_point_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charge_point_serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charge_box_serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fw_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fw_update_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fw_update_timestamp` timestamp(6) NULL DEFAULT NULL,
  `iccid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imsi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meter_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meter_serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diagnostics_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diagnostics_timestamp` timestamp(6) NULL DEFAULT NULL,
  `last_heartbeat_timestamp` timestamp(6) NULL DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `location_latitude` decimal(11,8) DEFAULT NULL,
  `location_longitude` decimal(11,8) DEFAULT NULL,
  `address_pk` int(11) DEFAULT NULL,
  `admin_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_connector_status_after_transaction_msg` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`charge_box_pk`),
  UNIQUE KEY `chargeBoxId_UNIQUE` (`charge_box_id`),
  KEY `chargebox_op_ep_idx` (`ocpp_protocol`,`endpoint_address`),
  KEY `FK_charge_box_address_apk` (`address_pk`),
  CONSTRAINT `FK_charge_box_address_apk` FOREIGN KEY (`address_pk`) REFERENCES `address` (`address_pk`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_box`
--

LOCK TABLES `charge_box` WRITE;
/*!40000 ALTER TABLE `charge_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_profile`
--

DROP TABLE IF EXISTS `charging_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_profile` (
  `charging_profile_pk` int(11) NOT NULL AUTO_INCREMENT,
  `stack_level` int(11) NOT NULL,
  `charging_profile_purpose` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `charging_profile_kind` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recurrency_kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid_from` timestamp(6) NULL DEFAULT NULL,
  `valid_to` timestamp(6) NULL DEFAULT NULL,
  `duration_in_seconds` int(11) DEFAULT NULL,
  `start_schedule` timestamp(6) NULL DEFAULT NULL,
  `charging_rate_unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min_charging_rate` decimal(15,1) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`charging_profile_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_profile`
--

LOCK TABLES `charging_profile` WRITE;
/*!40000 ALTER TABLE `charging_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `charging_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_schedule_period`
--

DROP TABLE IF EXISTS `charging_schedule_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_schedule_period` (
  `charging_profile_pk` int(11) NOT NULL,
  `start_period_in_seconds` int(11) NOT NULL,
  `power_limit_in_amperes` decimal(15,1) NOT NULL,
  `number_phases` int(11) DEFAULT NULL,
  UNIQUE KEY `UQ_charging_schedule_period` (`charging_profile_pk`,`start_period_in_seconds`),
  CONSTRAINT `FK_charging_schedule_period_charging_profile_pk` FOREIGN KEY (`charging_profile_pk`) REFERENCES `charging_profile` (`charging_profile_pk`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_schedule_period`
--

LOCK TABLES `charging_schedule_period` WRITE;
/*!40000 ALTER TABLE `charging_schedule_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `charging_schedule_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector` (
  `connector_pk` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `charge_box_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connector_id` int(11) NOT NULL,
  PRIMARY KEY (`connector_pk`),
  UNIQUE KEY `connector_pk_UNIQUE` (`connector_pk`),
  UNIQUE KEY `connector_cbid_cid_UNIQUE` (`charge_box_id`,`connector_id`),
  CONSTRAINT `FK_connector_charge_box_cbid` FOREIGN KEY (`charge_box_id`) REFERENCES `charge_box` (`charge_box_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector`
--

LOCK TABLES `connector` WRITE;
/*!40000 ALTER TABLE `connector` DISABLE KEYS */;
/*!40000 ALTER TABLE `connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector_charging_profile`
--

DROP TABLE IF EXISTS `connector_charging_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_charging_profile` (
  `connector_pk` int(11) unsigned NOT NULL,
  `charging_profile_pk` int(11) NOT NULL,
  UNIQUE KEY `UQ_connector_charging_profile` (`connector_pk`,`charging_profile_pk`),
  KEY `FK_connector_charging_profile_charging_profile_pk` (`charging_profile_pk`),
  CONSTRAINT `FK_connector_charging_profile_charging_profile_pk` FOREIGN KEY (`charging_profile_pk`) REFERENCES `charging_profile` (`charging_profile_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_connector_charging_profile_connector_pk` FOREIGN KEY (`connector_pk`) REFERENCES `connector` (`connector_pk`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector_charging_profile`
--

LOCK TABLES `connector_charging_profile` WRITE;
/*!40000 ALTER TABLE `connector_charging_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `connector_charging_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector_meter_value`
--

DROP TABLE IF EXISTS `connector_meter_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_meter_value` (
  `connector_pk` int(11) unsigned NOT NULL,
  `transaction_pk` int(10) unsigned DEFAULT NULL,
  `value_timestamp` timestamp(6) NULL DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `reading_context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `measurand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `FK_cm_pk_idx` (`connector_pk`),
  KEY `FK_tid_cm_idx` (`transaction_pk`),
  KEY `cmv_value_timestamp_idx` (`value_timestamp`),
  CONSTRAINT `FK_pk_cm` FOREIGN KEY (`connector_pk`) REFERENCES `connector` (`connector_pk`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_tid_cm` FOREIGN KEY (`transaction_pk`) REFERENCES `transaction_start` (`transaction_pk`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector_meter_value`
--

LOCK TABLES `connector_meter_value` WRITE;
/*!40000 ALTER TABLE `connector_meter_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `connector_meter_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector_status`
--

DROP TABLE IF EXISTS `connector_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector_status` (
  `connector_pk` int(11) unsigned NOT NULL,
  `status_timestamp` timestamp(6) NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_error_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `FK_cs_pk_idx` (`connector_pk`),
  KEY `connector_status_cpk_st_idx` (`connector_pk`,`status_timestamp`),
  CONSTRAINT `FK_cs_pk` FOREIGN KEY (`connector_pk`) REFERENCES `connector` (`connector_pk`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector_status`
--

LOCK TABLES `connector_status` WRITE;
/*!40000 ALTER TABLE `connector_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `connector_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocpp_tag`
--

DROP TABLE IF EXISTS `ocpp_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocpp_tag` (
  `ocpp_tag_pk` int(11) NOT NULL AUTO_INCREMENT,
  `id_tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_date` timestamp(6) NULL DEFAULT NULL,
  `max_active_transaction_count` int(11) NOT NULL DEFAULT '1',
  `note` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ocpp_tag_pk`),
  UNIQUE KEY `idTag_UNIQUE` (`id_tag`),
  KEY `user_expiryDate_idx` (`expiry_date`),
  KEY `FK_ocpp_tag_parent_id_tag` (`parent_id_tag`),
  CONSTRAINT `FK_ocpp_tag_parent_id_tag` FOREIGN KEY (`parent_id_tag`) REFERENCES `ocpp_tag` (`id_tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocpp_tag`
--

LOCK TABLES `ocpp_tag` WRITE;
/*!40000 ALTER TABLE `ocpp_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocpp_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ocpp_tag_activity`
--

DROP TABLE IF EXISTS `ocpp_tag_activity`;
/*!50001 DROP VIEW IF EXISTS `ocpp_tag_activity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ocpp_tag_activity` AS SELECT 
 1 AS `ocpp_tag_pk`,
 1 AS `id_tag`,
 1 AS `parent_id_tag`,
 1 AS `expiry_date`,
 1 AS `max_active_transaction_count`,
 1 AS `note`,
 1 AS `active_transaction_count`,
 1 AS `in_transaction`,
 1 AS `blocked`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connector_pk` int(11) unsigned NOT NULL,
  `transaction_pk` int(10) unsigned DEFAULT NULL,
  `id_tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `expiry_datetime` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`reservation_pk`),
  UNIQUE KEY `reservation_pk_UNIQUE` (`reservation_pk`),
  UNIQUE KEY `transaction_pk_UNIQUE` (`transaction_pk`),
  KEY `FK_idTag_r_idx` (`id_tag`),
  KEY `reservation_start_idx` (`start_datetime`),
  KEY `reservation_expiry_idx` (`expiry_datetime`),
  KEY `reservation_status_idx` (`status`),
  KEY `FK_connector_pk_reserv_idx` (`connector_pk`),
  CONSTRAINT `FK_connector_pk_reserv` FOREIGN KEY (`connector_pk`) REFERENCES `connector` (`connector_pk`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_reservation_ocpp_tag_id_tag` FOREIGN KEY (`id_tag`) REFERENCES `ocpp_tag` (`id_tag`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaction_pk_r` FOREIGN KEY (`transaction_pk`) REFERENCES `transaction_start` (`transaction_pk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `script` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` VALUES (1,'0.6.6','inital','SQL','V0_6_6__inital.sql',-1139003720,'sunyoung','2024-06-03 06:29:10',788,1),(2,'0.6.7','update','SQL','V0_6_7__update.sql',-1516276887,'sunyoung','2024-06-03 06:29:10',239,1),(3,'0.6.8','update','SQL','V0_6_8__update.sql',1153526272,'sunyoung','2024-06-03 06:29:10',82,1),(4,'0.6.9','update','SQL','V0_6_9__update.sql',684651776,'sunyoung','2024-06-03 06:29:10',114,1),(5,'0.7.0','update','SQL','V0_7_0__update.sql',-1304612786,'sunyoung','2024-06-03 06:29:11',247,1),(6,'0.7.1','update','SQL','V0_7_1__update.sql',2010441416,'sunyoung','2024-06-03 06:29:11',45,1),(7,'0.7.2','update','SQL','V0_7_2__update.sql',1942726372,'sunyoung','2024-06-03 06:29:11',61,1),(8,'0.7.3','update','SQL','V0_7_3__update.sql',-914877656,'sunyoung','2024-06-03 06:29:11',58,1),(9,'0.7.6','update','SQL','V0_7_6__update.sql',1847569673,'sunyoung','2024-06-03 06:29:11',161,1),(10,'0.7.7','update','SQL','V0_7_7__update.sql',-1987713944,'sunyoung','2024-06-03 06:29:12',1063,1),(11,'0.7.8','update','SQL','V0_7_8__update.sql',1734849553,'sunyoung','2024-06-03 06:29:13',76,1),(12,'0.7.9','update','SQL','V0_7_9__update.sql',-1187991930,'sunyoung','2024-06-03 06:29:13',524,1),(13,'0.8.0','update','SQL','V0_8_0__update.sql',-463816886,'sunyoung','2024-06-03 06:29:14',324,1),(14,'0.8.1','update','SQL','V0_8_1__update.sql',1213582250,'sunyoung','2024-06-03 06:29:15',1117,1),(15,'0.8.2','update','SQL','V0_8_2__update.sql',-1417404311,'sunyoung','2024-06-03 06:29:15',44,1),(16,'0.8.4','update','SQL','V0_8_4__update.sql',-1620751535,'sunyoung','2024-06-03 06:29:15',548,1),(17,'0.8.5','update','SQL','V0_8_5__update.sql',-1961223140,'sunyoung','2024-06-03 06:29:16',401,1),(18,'0.8.6','update','SQL','V0_8_6__update.sql',-599908031,'sunyoung','2024-06-03 06:29:17',1207,1),(19,'0.8.7','update','SQL','V0_8_7__update.sql',817528938,'sunyoung','2024-06-03 06:29:17',62,1),(20,'0.8.8','update','SQL','V0_8_8__update.sql',-1218381409,'sunyoung','2024-06-03 06:29:18',103,1),(21,'0.8.9','update','SQL','V0_8_9__update.sql',467917572,'sunyoung','2024-06-03 06:29:18',46,1),(22,'0.9.0','update','SQL','V0_9_0__update.sql',-156261502,'sunyoung','2024-06-03 06:29:18',333,1),(23,'0.9.1','update','SQL','V0_9_1__update.sql',554940430,'sunyoung','2024-06-03 06:29:18',49,1),(24,'0.9.2','update','SQL','V0_9_2__update.sql',-1162599634,'sunyoung','2024-06-03 06:29:18',139,1),(25,'0.9.3','update','SQL','V0_9_3__update.sql',967813954,'sunyoung','2024-06-03 06:29:19',65,1),(26,'0.9.4','update','SQL','V0_9_4__update.sql',1698316188,'sunyoung','2024-06-03 06:29:19',31,1),(27,'0.9.5','update','SQL','V0_9_5__update.sql',-1980845887,'sunyoung','2024-06-03 06:29:19',68,1),(28,'0.9.6','update','SQL','V0_9_6__update.sql',-619431009,'sunyoung','2024-06-03 06:29:19',634,1),(29,'0.9.7','update','SQL','V0_9_7__update.sql',-1352017997,'sunyoung','2024-06-03 06:29:20',153,1),(30,'0.9.8','update','SQL','V0_9_8__update.sql',1465629204,'sunyoung','2024-06-03 06:29:20',458,1),(31,'0.9.9','update','SQL','V0_9_9__update.sql',1154327139,'sunyoung','2024-06-03 06:29:21',186,1),(32,'1.0.0','update','SQL','V1_0_0__update.sql',-589444344,'sunyoung','2024-06-03 06:29:21',48,1),(33,'1.0.1','update','SQL','V1_0_1__update.sql',-1119099309,'sunyoung','2024-06-03 06:29:21',88,1),(34,'1.0.2','update','SQL','V1_0_2__update.sql',1724842041,'sunyoung','2024-06-03 06:29:21',84,1);
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `app_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `heartbeat_interval_in_seconds` int(11) DEFAULT NULL,
  `hours_to_expire` int(11) DEFAULT NULL,
  `mail_enabled` tinyint(1) DEFAULT '0',
  `mail_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_protocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'smtp',
  `mail_port` int(11) DEFAULT '25',
  `mail_recipients` text COLLATE utf8_unicode_ci COMMENT 'comma separated list of email addresses',
  `notification_features` text COLLATE utf8_unicode_ci COMMENT 'comma separated list',
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `settings_id_UNIQUE` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('U3RlY2tkb3NlblZlcndhbHR1bmc=',14400,1,0,NULL,NULL,NULL,NULL,'smtp',25,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!50001 DROP VIEW IF EXISTS `transaction`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transaction` AS SELECT 
 1 AS `transaction_pk`,
 1 AS `connector_pk`,
 1 AS `id_tag`,
 1 AS `start_event_timestamp`,
 1 AS `start_timestamp`,
 1 AS `start_value`,
 1 AS `stop_event_actor`,
 1 AS `stop_event_timestamp`,
 1 AS `stop_timestamp`,
 1 AS `stop_value`,
 1 AS `stop_reason`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transaction_start`
--

DROP TABLE IF EXISTS `transaction_start`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_start` (
  `transaction_pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `connector_pk` int(11) unsigned NOT NULL,
  `id_tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_timestamp` timestamp(6) NULL DEFAULT NULL,
  `start_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`transaction_pk`),
  UNIQUE KEY `transaction_pk_UNIQUE` (`transaction_pk`),
  KEY `idTag_idx` (`id_tag`),
  KEY `connector_pk_idx` (`connector_pk`),
  KEY `transaction_start_idx` (`start_timestamp`),
  CONSTRAINT `FK_connector_pk_t` FOREIGN KEY (`connector_pk`) REFERENCES `connector` (`connector_pk`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_transaction_ocpp_tag_id_tag` FOREIGN KEY (`id_tag`) REFERENCES `ocpp_tag` (`id_tag`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_start`
--

LOCK TABLES `transaction_start` WRITE;
/*!40000 ALTER TABLE `transaction_start` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_start` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_stop`
--

DROP TABLE IF EXISTS `transaction_stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_stop` (
  `transaction_pk` int(10) unsigned NOT NULL,
  `event_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `event_actor` enum('station','manual') COLLATE utf8_unicode_ci DEFAULT NULL,
  `stop_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `stop_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stop_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`transaction_pk`,`event_timestamp`),
  CONSTRAINT `FK_transaction_stop_transaction_pk` FOREIGN KEY (`transaction_pk`) REFERENCES `transaction_start` (`transaction_pk`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_stop`
--

LOCK TABLES `transaction_stop` WRITE;
/*!40000 ALTER TABLE `transaction_stop` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_stop_failed`
--

DROP TABLE IF EXISTS `transaction_stop_failed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_stop_failed` (
  `transaction_pk` int(11) DEFAULT NULL,
  `event_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `event_actor` enum('station','manual') COLLATE utf8_unicode_ci DEFAULT NULL,
  `stop_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `stop_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stop_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fail_reason` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_stop_failed`
--

LOCK TABLES `transaction_stop_failed` WRITE;
/*!40000 ALTER TABLE `transaction_stop_failed` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_stop_failed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_pk` int(11) NOT NULL AUTO_INCREMENT,
  `ocpp_tag_pk` int(11) DEFAULT NULL,
  `address_pk` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `sex` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`user_pk`),
  KEY `FK_user_ocpp_tag_otpk` (`ocpp_tag_pk`),
  KEY `FK_user_address_apk` (`address_pk`),
  CONSTRAINT `FK_user_address_apk` FOREIGN KEY (`address_pk`) REFERENCES `address` (`address_pk`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_ocpp_tag_otpk` FOREIGN KEY (`ocpp_tag_pk`) REFERENCES `ocpp_tag` (`ocpp_tag_pk`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ocpp_tag_activity`
--

/*!50001 DROP VIEW IF EXISTS `ocpp_tag_activity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sunyoung`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ocpp_tag_activity` AS select `xcharge`.`ocpp_tag`.`ocpp_tag_pk` AS `ocpp_tag_pk`,`xcharge`.`ocpp_tag`.`id_tag` AS `id_tag`,`xcharge`.`ocpp_tag`.`parent_id_tag` AS `parent_id_tag`,`xcharge`.`ocpp_tag`.`expiry_date` AS `expiry_date`,`xcharge`.`ocpp_tag`.`max_active_transaction_count` AS `max_active_transaction_count`,`xcharge`.`ocpp_tag`.`note` AS `note`,coalesce(`tx_activity`.`active_transaction_count`,0) AS `active_transaction_count`,(case when (`tx_activity`.`active_transaction_count` > 0) then TRUE else FALSE end) AS `in_transaction`,(case when (`xcharge`.`ocpp_tag`.`max_active_transaction_count` = 0) then TRUE else FALSE end) AS `blocked` from (`xcharge`.`ocpp_tag` left join (select `transaction`.`id_tag` AS `id_tag`,count(`transaction`.`id_tag`) AS `active_transaction_count` from `xcharge`.`transaction` where (isnull(`transaction`.`stop_timestamp`) and isnull(`transaction`.`stop_value`)) group by `transaction`.`id_tag`) `tx_activity` on((`xcharge`.`ocpp_tag`.`id_tag` = `tx_activity`.`id_tag`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transaction`
--

/*!50001 DROP VIEW IF EXISTS `transaction`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sunyoung`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `transaction` AS select `tx1`.`transaction_pk` AS `transaction_pk`,`tx1`.`connector_pk` AS `connector_pk`,`tx1`.`id_tag` AS `id_tag`,`tx1`.`event_timestamp` AS `start_event_timestamp`,`tx1`.`start_timestamp` AS `start_timestamp`,`tx1`.`start_value` AS `start_value`,`tx2`.`event_actor` AS `stop_event_actor`,`tx2`.`event_timestamp` AS `stop_event_timestamp`,`tx2`.`stop_timestamp` AS `stop_timestamp`,`tx2`.`stop_value` AS `stop_value`,`tx2`.`stop_reason` AS `stop_reason` from (`xcharge`.`transaction_start` `tx1` left join (select `s1`.`transaction_pk` AS `transaction_pk`,`s1`.`event_timestamp` AS `event_timestamp`,`s1`.`event_actor` AS `event_actor`,`s1`.`stop_timestamp` AS `stop_timestamp`,`s1`.`stop_value` AS `stop_value`,`s1`.`stop_reason` AS `stop_reason` from `xcharge`.`transaction_stop` `s1` where (`s1`.`event_timestamp` = (select max(`s2`.`event_timestamp`) from `xcharge`.`transaction_stop` `s2` where (`s1`.`transaction_pk` = `s2`.`transaction_pk`))) group by `s1`.`transaction_pk`,`s1`.`event_timestamp`) `tx2` on((`tx1`.`transaction_pk` = `tx2`.`transaction_pk`))) */;
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

-- Dump completed on 2024-06-03 14:47:21
