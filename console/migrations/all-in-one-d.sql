CREATE DATABASE  IF NOT EXISTS `cmgdemoblog` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `cmgdemoblog`;

-- MySQL dump 10.13  Distrib 5.6.24, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: cmgdemoblog
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `cmg_cms_block`
--

DROP TABLE IF EXISTS `cmg_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_cms_block` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bannerId` bigint(20) DEFAULT NULL,
  `textureId` bigint(20) DEFAULT NULL,
  `videoId` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htmlOptions` text COLLATE utf8_unicode_ci,
  `backgroundClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textureClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cms_block_1` (`bannerId`),
  KEY `fk_cms_block_2` (`textureId`),
  KEY `fk_cms_block_3` (`videoId`),
  KEY `fk_cms_block_4` (`templateId`),
  KEY `fk_cms_block_5` (`createdBy`),
  KEY `fk_cms_block_6` (`modifiedBy`),
  CONSTRAINT `fk_cms_block_1` FOREIGN KEY (`bannerId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cms_block_2` FOREIGN KEY (`textureId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cms_block_3` FOREIGN KEY (`videoId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cms_block_4` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`),
  CONSTRAINT `fk_cms_block_5` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cms_block_6` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_block`
--

LOCK TABLES `cmg_cms_block` WRITE;
/*!40000 ALTER TABLE `cmg_cms_block` DISABLE KEYS */;
INSERT INTO `cmg_cms_block` VALUES (1,NULL,NULL,NULL,NULL,1,1,'main','main','The main block used on top of all system pages.','','','','','2015-11-06 14:55:42','2015-11-06 14:55:42');
/*!40000 ALTER TABLE `cmg_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_cms_model_block`
--

DROP TABLE IF EXISTS `cmg_cms_model_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_cms_model_block` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blockId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cms_model_block_1` (`blockId`),
  CONSTRAINT `fk_cms_model_block_1` FOREIGN KEY (`blockId`) REFERENCES `cmg_cms_block` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_model_block`
--

LOCK TABLES `cmg_cms_model_block` WRITE;
/*!40000 ALTER TABLE `cmg_cms_model_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_cms_model_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_cms_model_content`
--

DROP TABLE IF EXISTS `cmg_cms_model_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_cms_model_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bannerId` bigint(20) DEFAULT NULL,
  `videoId` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `seoName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seoRobot` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cms_model_content_1` (`bannerId`),
  KEY `fk_cms_model_content_2` (`videoId`),
  KEY `fk_cms_model_content_3` (`templateId`),
  CONSTRAINT `fk_cms_model_content_1` FOREIGN KEY (`bannerId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cms_model_content_2` FOREIGN KEY (`videoId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cms_model_content_3` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_model_content`
--

LOCK TABLES `cmg_cms_model_content` WRITE;
/*!40000 ALTER TABLE `cmg_cms_model_content` DISABLE KEYS */;
INSERT INTO `cmg_cms_model_content` VALUES (1,NULL,NULL,NULL,1,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'home page',NULL,NULL),(2,NULL,NULL,NULL,2,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'login page',NULL,NULL),(3,NULL,NULL,NULL,3,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'register page',NULL,NULL),(4,NULL,NULL,NULL,4,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'confirm account page',NULL,NULL),(5,NULL,NULL,NULL,5,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'activate account page',NULL,NULL),(6,NULL,NULL,NULL,6,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'forgot password page',NULL,NULL),(7,NULL,NULL,NULL,7,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'reset password page',NULL,NULL),(8,NULL,NULL,1,8,'page','<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>','<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'about us page',NULL,NULL),(9,NULL,NULL,1,9,'page','','<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'terms page',NULL,NULL),(10,NULL,NULL,1,10,'page','','<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'privacy page',NULL,NULL),(11,NULL,NULL,2,11,'page','','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'blog page',NULL,NULL);
/*!40000 ALTER TABLE `cmg_cms_model_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_cms_page`
--

DROP TABLE IF EXISTS `cmg_cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_cms_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `visibility` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cms_page_1` (`parentId`),
  KEY `fk_cms_page_2` (`createdBy`),
  KEY `fk_cms_page_3` (`modifiedBy`),
  CONSTRAINT `fk_cms_page_1` FOREIGN KEY (`parentId`) REFERENCES `cmg_cms_page` (`id`),
  CONSTRAINT `fk_cms_page_2` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cms_page_3` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_page`
--

LOCK TABLES `cmg_cms_page` WRITE;
/*!40000 ALTER TABLE `cmg_cms_page` DISABLE KEYS */;
INSERT INTO `cmg_cms_page` VALUES (1,NULL,1,1,'Home','home','page',5,5),(2,NULL,1,1,'Login','login','page',5,5),(3,NULL,1,1,'Register','register','page',5,5),(4,NULL,1,1,'Confirm Account','confirm-account','page',5,5),(5,NULL,1,1,'Activate Account','activate-account','page',5,5),(6,NULL,1,1,'Forgot Password','forgot-password','page',5,5),(7,NULL,1,1,'Reset Password','reset-password','page',5,5),(8,NULL,1,1,'About Us','about-us','page',5,5),(9,NULL,1,1,'Terms','terms','page',5,5),(10,NULL,1,1,'Privacy','privacy','page',5,5),(11,NULL,1,1,'Blog','blog','page',5,5);
/*!40000 ALTER TABLE `cmg_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_activity`
--

DROP TABLE IF EXISTS `cmg_core_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `notifierId` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `consumed` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime NOT NULL,
  `scheduledAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activity_1` (`userId`),
  KEY `fk_activity_2` (`notifierId`),
  KEY `fk_activity_3` (`templateId`),
  CONSTRAINT `fk_activity_1` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_activity_2` FOREIGN KEY (`notifierId`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_activity_3` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_activity`
--

LOCK TABLES `cmg_core_activity` WRITE;
/*!40000 ALTER TABLE `cmg_core_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_address`
--

DROP TABLE IF EXISTS `cmg_core_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `countryId` bigint(20) NOT NULL,
  `provinceId` bigint(20) NOT NULL,
  `line1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_1` (`countryId`),
  KEY `fk_address_2` (`provinceId`),
  CONSTRAINT `fk_address_1` FOREIGN KEY (`countryId`) REFERENCES `cmg_core_country` (`id`),
  CONSTRAINT `fk_address_2` FOREIGN KEY (`provinceId`) REFERENCES `cmg_core_province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_address`
--

LOCK TABLES `cmg_core_address` WRITE;
/*!40000 ALTER TABLE `cmg_core_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_category`
--

DROP TABLE IF EXISTS `cmg_core_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatarId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_1` (`avatarId`),
  KEY `fk_category_2` (`parentId`),
  CONSTRAINT `fk_category_1` FOREIGN KEY (`avatarId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_category_2` FOREIGN KEY (`parentId`) REFERENCES `cmg_core_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_category`
--

LOCK TABLES `cmg_core_category` WRITE;
/*!40000 ALTER TABLE `cmg_core_category` DISABLE KEYS */;
INSERT INTO `cmg_core_category` VALUES (1,NULL,NULL,'gender',NULL,'gender','combo',NULL);
/*!40000 ALTER TABLE `cmg_core_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_country`
--

DROP TABLE IF EXISTS `cmg_core_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_country`
--

LOCK TABLES `cmg_core_country` WRITE;
/*!40000 ALTER TABLE `cmg_core_country` DISABLE KEYS */;
INSERT INTO `cmg_core_country` VALUES (1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BA','Bosnia and Herzegovina'),(29,'BW','Botswana'),(30,'BV','Bouvet Island'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'BN','Brunei Darussalam'),(34,'BG','Bulgaria'),(35,'BF','Burkina Faso'),(36,'BI','Burundi'),(37,'KH','Cambodia'),(38,'CM','Cameroon'),(39,'CA','Canada'),(40,'CV','Cape Verde'),(41,'KY','Cayman Islands'),(42,'CF','Central African Republic'),(43,'TD','Chad'),(44,'CL','Chile'),(45,'CN','China'),(46,'CX','Christmas Island'),(47,'CC','Cocos (Keeling) Islands'),(48,'CO','Colombia'),(49,'KM','Comoros'),(50,'CG','Congo'),(51,'CD','Congo, The Democratic Republic of the'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CY','Cyprus'),(57,'CZ','Czech Republic'),(58,'DK','Denmark'),(59,'DJ','Djibouti'),(60,'DM','Dominica'),(61,'DO','Dominican Republic'),(62,'EC','Ecuador'),(63,'EG','Egypt'),(64,'SV','El Salvador'),(65,'GQ','Equatorial Guinea'),(66,'ER','Eritrea'),(67,'EE','Estonia'),(68,'ET','Ethiopia'),(69,'FK','Falkland Islands (Malvinas)'),(70,'FO','Faroe Islands'),(71,'FJ','Fiji'),(72,'FI','Finland'),(73,'FR','France'),(74,'GF','French Guiana'),(75,'PF','French Polynesia'),(76,'TF','French Southern Territories'),(77,'GA','Gabon'),(78,'GM','Gambia'),(79,'GE','Georgia'),(80,'DE','Germany'),(81,'GH','Ghana'),(82,'GI','Gibraltar'),(83,'GR','Greece'),(84,'GL','Greenland'),(85,'GD','Grenada'),(86,'GP','Guadeloupe'),(87,'GU','Guam'),(88,'GT','Guatemala'),(89,'GG','Guernsey'),(90,'GN','Guinea'),(91,'GW','Guinea-Bissau'),(92,'GY','Guyana'),(93,'HT','Haiti'),(94,'HM','Heard Island and McDonald Islands'),(95,'VA','Holy See (Vatican City State)'),(96,'HN','Honduras'),(97,'HK','Hong Kong'),(98,'HU','Hungary'),(99,'IS','Iceland'),(100,'IN','India'),(101,'ID','Indonesia'),(102,'IR','Iran, Islamic Republic of'),(103,'IQ','Iraq'),(104,'IE','Ireland'),(105,'IM','Isle of Man'),(106,'IL','Israel'),(107,'IT','Italy'),(108,'JM','Jamaica'),(109,'JP','Japan'),(110,'JE','Jersey'),(111,'JO','Jordan'),(112,'KZ','Kazakhstan'),(113,'KE','Kenya'),(114,'KI','Kiribati'),(115,'KP','Korea, Democratic People&#39;s Republic of'),(116,'KR','Korea, Republic of'),(117,'KW','Kuwait'),(118,'KG','Kyrgyzstan'),(119,'LA','Lao People&#39;s Democratic Republic'),(120,'LV','Latvia'),(121,'LB','Lebanon'),(122,'LS','Lesotho'),(123,'LR','Liberia'),(124,'LY','Libyan Arab Jamahiriya'),(125,'LI','Liechtenstein'),(126,'LT','Lithuania'),(127,'LU','Luxembourg'),(128,'MO','Macao'),(129,'MK','Macedonia'),(130,'MG','Madagascar'),(131,'MW','Malawi'),(132,'MY','Malaysia'),(133,'MV','Maldives'),(134,'ML','Mali'),(135,'MT','Malta'),(136,'MH','Marshall Islands'),(137,'MQ','Martinique'),(138,'MR','Mauritania'),(139,'MU','Mauritius'),(140,'YT','Mayotte'),(141,'MX','Mexico'),(142,'FM','Micronesia, Federated States of'),(143,'MD','Moldova, Republic of'),(144,'MC','Monaco'),(145,'MN','Mongolia'),(146,'ME','Montenegro'),(147,'MS','Montserrat'),(148,'MA','Morocco'),(149,'MZ','Mozambique'),(150,'MM','Myanmar'),(151,'NA','Namibia'),(152,'NR','Nauru'),(153,'NP','Nepal'),(154,'NL','Netherlands'),(155,'AN','Netherlands Antilles'),(156,'NC','New Caledonia'),(157,'NZ','New Zealand'),(158,'NI','Nicaragua'),(159,'NE','Niger'),(160,'NG','Nigeria'),(161,'NU','Niue'),(162,'NF','Norfolk Island'),(163,'MP','Northern Mariana Islands'),(164,'NO','Norway'),(165,'OM','Oman'),(166,'PK','Pakistan'),(167,'PW','Palau'),(168,'PS','Palestinian Territory, Occupied'),(169,'PA','Panama'),(170,'PG','Papua New Guinea'),(171,'PY','Paraguay'),(172,'PE','Peru'),(173,'PH','Philippines'),(174,'PN','Pitcairn'),(175,'PL','Poland'),(176,'PT','Portugal'),(177,'PR','Puerto Rico'),(178,'QA','Qatar'),(179,'RE','Réunion'),(180,'RO','Romania'),(181,'RU','Russian Federation'),(182,'RW','Rwanda'),(183,'BL','Saint Barthlemy'),(184,'SH','Saint Helena'),(185,'KN','Saint Kitts and Nevis'),(186,'LC','Saint Lucia'),(187,'MF','Saint Martin'),(188,'PM','Saint Pierre and Miquelon'),(189,'VC','Saint Vincent and the Grenadines'),(190,'WS','Samoa'),(191,'SM','San Marino'),(192,'ST','Sao Tome and Principe'),(193,'SA','Saudi Arabia'),(194,'SN','Senegal'),(195,'RS','Serbia'),(196,'SC','Seychelles'),(197,'SL','Sierra Leone'),(198,'SG','Singapore'),(199,'SK','Slovakia'),(200,'SI','Slovenia'),(201,'SB','Solomon Islands'),(202,'SO','Somalia'),(203,'ZA','South Africa'),(204,'GS','South Georgia and the South Sandwich Islands'),(205,'ES','Spain'),(206,'LK','Sri Lanka'),(207,'SD','Sudan'),(208,'SR','Suriname'),(209,'SJ','Svalbard and Jan Mayen'),(210,'SZ','Swaziland'),(211,'SE','Sweden'),(212,'CH','Switzerland'),(213,'SY','Syrian Arab Republic'),(214,'TW','Taiwan'),(215,'TJ','Tajikistan'),(216,'TZ','Tanzania, United Republic of'),(217,'TH','Thailand'),(218,'TL','Timor-Leste'),(219,'TG','Togo'),(220,'TK','Tokelau'),(221,'TO','Tonga'),(222,'TT','Trinidad and Tobago'),(223,'TN','Tunisia'),(224,'TR','Turkey'),(225,'TM','Turkmenistan'),(226,'TC','Turks and Caicos Islands'),(227,'TV','Tuvalu'),(228,'UG','Uganda'),(229,'UA','Ukraine'),(230,'AE','United Arab Emirates'),(231,'GB','United Kingdom'),(232,'US','United States'),(233,'UM','United States Minor Outlying Islands'),(234,'UY','Uruguay'),(235,'UZ','Uzbekistan'),(236,'VU','Vanuatu'),(237,'VE','Venezuela, Bolivarian Republic of'),(238,'VN','Viet Nam'),(239,'VG','Virgin Islands, British'),(240,'VI','Virgin Islands, U.S.'),(241,'WF','Wallis and Futuna'),(242,'EH','Western Sahara'),(243,'YE','Yemen'),(244,'ZM','Zambia'),(245,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `cmg_core_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_file`
--

DROP TABLE IF EXISTS `cmg_core_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `directory` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `visibility` smallint(6) NOT NULL DEFAULT '0',
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_1` (`createdBy`),
  KEY `fk_file_2` (`modifiedBy`),
  CONSTRAINT `fk_file_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_file_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_file`
--

LOCK TABLES `cmg_core_file` WRITE;
/*!40000 ALTER TABLE `cmg_core_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_gallery`
--

DROP TABLE IF EXISTS `cmg_core_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gallery_1` (`createdBy`),
  KEY `fk_gallery_2` (`modifiedBy`),
  CONSTRAINT `fk_gallery_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_gallery_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_gallery`
--

LOCK TABLES `cmg_core_gallery` WRITE;
/*!40000 ALTER TABLE `cmg_core_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_locale`
--

DROP TABLE IF EXISTS `cmg_core_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_locale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_locale`
--

LOCK TABLES `cmg_core_locale` WRITE;
/*!40000 ALTER TABLE `cmg_core_locale` DISABLE KEYS */;
INSERT INTO `cmg_core_locale` VALUES (1,'en_US','English US');
/*!40000 ALTER TABLE `cmg_core_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_address`
--

DROP TABLE IF EXISTS `cmg_core_model_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addressId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_model_address_1` (`addressId`),
  CONSTRAINT `fk_model_address_1` FOREIGN KEY (`addressId`) REFERENCES `cmg_core_address` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_address`
--

LOCK TABLES `cmg_core_model_address` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_category`
--

DROP TABLE IF EXISTS `cmg_core_model_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_category_1` (`categoryId`),
  CONSTRAINT `fk_model_category_1` FOREIGN KEY (`categoryId`) REFERENCES `cmg_core_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_category`
--

LOCK TABLES `cmg_core_model_category` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_comment`
--

DROP TABLE IF EXISTS `cmg_core_model_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) DEFAULT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `replyParentId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_comment_1` (`createdBy`),
  KEY `fk_model_comment_2` (`modifiedBy`),
  KEY `fk_model_comment_3` (`replyParentId`),
  CONSTRAINT `fk_model_comment_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_model_comment_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_model_comment_3` FOREIGN KEY (`replyParentId`) REFERENCES `cmg_core_model_comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_comment`
--

LOCK TABLES `cmg_core_model_comment` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_file`
--

DROP TABLE IF EXISTS `cmg_core_model_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_model_file_1` (`fileId`),
  CONSTRAINT `fk_model_file_1` FOREIGN KEY (`fileId`) REFERENCES `cmg_core_file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_file`
--

LOCK TABLES `cmg_core_model_file` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_message`
--

DROP TABLE IF EXISTS `cmg_core_model_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `localeId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_message_1` (`localeId`),
  CONSTRAINT `fk_model_message_1` FOREIGN KEY (`localeId`) REFERENCES `cmg_core_locale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_message`
--

LOCK TABLES `cmg_core_model_message` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_meta`
--

DROP TABLE IF EXISTS `cmg_core_model_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default',
  `fieldType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fieldMeta` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_meta`
--

LOCK TABLES `cmg_core_model_meta` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_meta` DISABLE KEYS */;
INSERT INTO `cmg_core_model_meta` VALUES (1,1,'site','locale message','0','','core','text',NULL),(2,1,'site','language','en-US','','core','text',NULL),(3,1,'site','charset','UTF-8','','core','text',NULL),(4,1,'site','site title','CMG Demo','','core','text',NULL),(5,1,'site','site name','CMSGears','','core','text',NULL),(6,1,'site','site url','http://demo.cmsgears.com/templates/blog/','','core','text',NULL),(7,1,'site','admin url','http://demo.cmsgears.com/templates/blog/admin/','','core','text',NULL),(8,1,'site','smtp','0','','email','text',NULL),(9,1,'site','smtp username','','','email','text',NULL),(10,1,'site','smtp password','','','email','password',NULL),(11,1,'site','smtp host','','','email','text',NULL),(12,1,'site','smtp port','587','','email','text',NULL),(13,1,'site','smtp encryption','tls','','email','text',NULL),(14,1,'site','debug','1','','email','text',NULL),(15,1,'site','sender name','Admin','','email','text',NULL),(16,1,'site','sender email','demoadmin@cmsgears.com','','email','text',NULL),(17,1,'site','contact name','Contact Us','','email','text',NULL),(18,1,'site','contact email','democontact@cmsgears.com','','email','text',NULL),(19,1,'site','info name','Info','','email','text',NULL),(20,1,'site','info email','demoinfo@cmsgears.com','','email','text',NULL),(21,1,'site','theme','basic','','frontend','text',NULL),(22,1,'site','theme version','1','','frontend','text',NULL),(23,1,'site','theme','basic','','admin','text',NULL),(24,1,'site','theme version','1','','admin','text',NULL);
/*!40000 ALTER TABLE `cmg_core_model_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_tag`
--

DROP TABLE IF EXISTS `cmg_core_model_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tagId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_tag_1` (`tagId`),
  CONSTRAINT `fk_model_tag_1` FOREIGN KEY (`tagId`) REFERENCES `cmg_core_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_tag`
--

LOCK TABLES `cmg_core_model_tag` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_newsletter`
--

DROP TABLE IF EXISTS `cmg_core_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_newsletter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `lastSentAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_newsletter_1` (`createdBy`),
  KEY `fk_newsletter_2` (`modifiedBy`),
  CONSTRAINT `fk_newsletter_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_newsletter_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_newsletter`
--

LOCK TABLES `cmg_core_newsletter` WRITE;
/*!40000 ALTER TABLE `cmg_core_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_newsletter_list`
--

DROP TABLE IF EXISTS `cmg_core_newsletter_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_newsletter_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `newsletterId` bigint(20) NOT NULL,
  `memberId` bigint(20) NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_newsletter_list_1` (`newsletterId`),
  KEY `fk_newsletter_list_2` (`memberId`),
  CONSTRAINT `fk_newsletter_list_1` FOREIGN KEY (`newsletterId`) REFERENCES `cmg_core_newsletter` (`id`),
  CONSTRAINT `fk_newsletter_list_2` FOREIGN KEY (`memberId`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_newsletter_list`
--

LOCK TABLES `cmg_core_newsletter_list` WRITE;
/*!40000 ALTER TABLE `cmg_core_newsletter_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_newsletter_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_newsletter_member`
--

DROP TABLE IF EXISTS `cmg_core_newsletter_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_newsletter_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_newsletter_member`
--

LOCK TABLES `cmg_core_newsletter_member` WRITE;
/*!40000 ALTER TABLE `cmg_core_newsletter_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_newsletter_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_object`
--

DROP TABLE IF EXISTS `cmg_core_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_object` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_object_1` (`createdBy`),
  KEY `fk_object_2` (`modifiedBy`),
  KEY `fk_object_3` (`templateId`),
  CONSTRAINT `fk_object_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_object_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_object_3` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_object`
--

LOCK TABLES `cmg_core_object` WRITE;
/*!40000 ALTER TABLE `cmg_core_object` DISABLE KEYS */;
INSERT INTO `cmg_core_object` VALUES (1,1,1,NULL,'main','Main Menu. It can be used for site header and footer.','menu','{\"pages\":[\"1\",\"8\",\"9\",\"10\",\"11\"]}','2014-10-11 14:22:54','2014-10-11 14:22:54');
/*!40000 ALTER TABLE `cmg_core_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_option`
--

DROP TABLE IF EXISTS `cmg_core_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryId` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_option_1` (`categoryId`),
  CONSTRAINT `fk_option_1` FOREIGN KEY (`categoryId`) REFERENCES `cmg_core_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_option`
--

LOCK TABLES `cmg_core_option` WRITE;
/*!40000 ALTER TABLE `cmg_core_option` DISABLE KEYS */;
INSERT INTO `cmg_core_option` VALUES (1,1,'Male','Male',NULL,NULL),(2,1,'Female','Female',NULL,NULL),(3,1,'Other','Other',NULL,NULL);
/*!40000 ALTER TABLE `cmg_core_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_permission`
--

DROP TABLE IF EXISTS `cmg_core_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permission_1` (`createdBy`),
  KEY `fk_permission_2` (`modifiedBy`),
  CONSTRAINT `fk_permission_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_permission_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1552 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_permission`
--

LOCK TABLES `cmg_core_permission` WRITE;
/*!40000 ALTER TABLE `cmg_core_permission` DISABLE KEYS */;
INSERT INTO `cmg_core_permission` VALUES (1,1,1,'Admin','admin','The permission admin is to distinguish between admin and site user. It is a must have permission for admins.','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(2,1,1,'User','user','The permission user is to distinguish between admin and site user. It is a must have permission for users.','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(3,1,1,'Core','core','The permission core is to manage settings, drop downs, galleries and newsletters from admin.','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(4,1,1,'Identity','identity','The permission identity is to manage users from admin.','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(5,1,1,'Identity RBAC','identity-rbac','The permission identity-rbac is to manage roles and permissions from admin.','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(1001,1,1,'CMS','cms','The permission cms is to manage templates, pages, menus, sidebars and widgets from admin.','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(1551,1,1,'Form','form','The permission form is to manage forms from admin.','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54');
/*!40000 ALTER TABLE `cmg_core_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_province`
--

DROP TABLE IF EXISTS `cmg_core_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `countryId` bigint(20) DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_province_1` (`countryId`),
  CONSTRAINT `fk_province_1` FOREIGN KEY (`countryId`) REFERENCES `cmg_core_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3990 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_province`
--

LOCK TABLES `cmg_core_province` WRITE;
/*!40000 ALTER TABLE `cmg_core_province` DISABLE KEYS */;
INSERT INTO `cmg_core_province` VALUES (1,1,'AF-01','Badakhshan'),(2,1,'AF-02','Badghis'),(3,1,'AF-03','Baghlan'),(4,1,'AF-30','Balkh'),(5,1,'AF-05','Bamian'),(6,1,'AF-06','Farah'),(7,1,'AF-07','Faryab'),(8,1,'AF-08','Ghazni'),(9,1,'AF-09','Ghowr'),(10,1,'AF-10','Helmand'),(11,1,'AF-11','Herat'),(12,1,'AF-31','Jowzjan'),(13,1,'AF-13','Kabol'),(14,1,'AF-23','Kandahar'),(15,1,'AF-14','Kapisa'),(16,1,'AF-37','Khowst'),(17,1,'AF-15','Konar'),(18,1,'AF-24','Kondoz'),(19,1,'AF-16','Laghman'),(20,1,'AF-17','Lowgar'),(21,1,'AF-18','Nangarhar'),(22,1,'AF-19','Nimruz'),(23,1,'AF-38','Nurestan'),(24,1,'AF-20','Oruzgan'),(25,1,'AF-21','Paktia'),(26,1,'AF-29','Paktika'),(27,1,'AF-22','Parvan'),(28,1,'AF-32','Samangan'),(29,1,'AF-33','Sar-e Pol'),(30,1,'AF-26','Takhar'),(31,1,'AF-27','Vardak'),(32,1,'AF-28','Zabol'),(33,3,'AL-40','Berat'),(34,3,'AL-41','Diber'),(35,3,'AL-42','Durres'),(36,3,'AL-43','Elbasan'),(37,3,'AL-44','Fier'),(38,3,'AL-45','Gjirokaster'),(39,3,'AL-46','Korce'),(40,3,'AL-47','Kukes'),(41,3,'AL-48','Lezhe'),(42,3,'AL-49','Shkoder'),(43,3,'AL-50','Tirane'),(44,3,'AL-51','Vlore'),(45,4,'DZ-34','Adrar'),(46,4,'DZ-35','Ain Defla'),(47,4,'DZ-36','Ain Temouchent'),(48,4,'DZ-01','Alger'),(49,4,'DZ-37','Annaba'),(50,4,'DZ-03','Batna'),(51,4,'DZ-38','Bechar'),(52,4,'DZ-18','Bejaia'),(53,4,'DZ-19','Biskra'),(54,4,'DZ-20','Blida'),(55,4,'DZ-39','Bordj Bou Arreridj'),(56,4,'DZ-21','Bouira'),(57,4,'DZ-40','Boumerdes'),(58,4,'DZ-41','Chlef'),(59,4,'DZ-04','Constantine'),(60,4,'DZ-22','Djelfa'),(61,4,'DZ-42','El Bayadh'),(62,4,'DZ-43','El Oued'),(63,4,'DZ-44','El Tarf'),(64,4,'DZ-45','Ghardaia'),(65,4,'DZ-23','Guelma'),(66,4,'DZ-46','Illizi'),(67,4,'DZ-24','Jijel'),(68,4,'DZ-47','Khenchela'),(69,4,'DZ-25','Laghouat'),(70,4,'DZ-26','Mascara'),(71,4,'DZ-06','Medea'),(72,4,'DZ-48','Mila'),(73,4,'DZ-07','Mostaganem'),(74,4,'DZ-49','Naama'),(75,4,'DZ-09','Oran'),(76,4,'DZ-50','Ouargla'),(77,4,'DZ-29','Oum el Bouaghi'),(78,4,'DZ-51','Relizane'),(79,4,'DZ-10','Saida'),(80,4,'DZ-12','Setif'),(81,4,'DZ-30','Sidi Bel Abbes'),(82,4,'DZ-31','Skikda'),(83,4,'DZ-52','Souk Ahras'),(84,4,'DZ-53','Tamanghasset'),(85,4,'DZ-33','Tebessa'),(86,4,'DZ-13','Tiaret'),(87,4,'DZ-54','Tindouf'),(88,4,'DZ-55','Tipaza'),(89,4,'DZ-56','Tissemsilt'),(90,4,'DZ-14','Tizi Ouzou'),(91,4,'DZ-15','Tlemcen'),(92,6,'AD-07','Andorra la Vella'),(93,6,'AD-02','Canillo'),(94,6,'AD-03','Encamp'),(95,6,'AD-08','Escaldes-Engordany'),(96,6,'AD-04','La Massana'),(97,6,'AD-05','Ordino'),(98,6,'AD-06','Sant Julia de Loria'),(99,7,'AO-19','Bengo'),(100,7,'AO-01','Benguela'),(101,7,'AO-02','Bie'),(102,7,'AO-03','Cabinda'),(103,7,'AO-04','Cuando Cubango'),(104,7,'AO-05','Cuanza Norte'),(105,7,'AO-06','Cuanza Sul'),(106,7,'AO-07','Cunene'),(107,7,'AO-08','Huambo'),(108,7,'AO-09','Huila'),(109,7,'AO-20','Luanda'),(110,7,'AO-17','Lunda Norte'),(111,7,'AO-18','Lunda Sul'),(112,7,'AO-12','Malanje'),(113,7,'AO-14','Moxico'),(114,7,'AO-15','Uige'),(115,7,'AO-16','Zaire'),(116,10,'AG-01','Barbuda'),(117,10,'AG-03','Saint George'),(118,10,'AG-04','Saint John'),(119,10,'AG-05','Saint Mary'),(120,10,'AG-06','Saint Paul'),(121,10,'AG-07','Saint Peter'),(122,10,'AG-08','Saint Philip'),(123,11,'AR-01','Buenos Aires'),(124,11,'AR-02','Catamarca'),(125,11,'AR-03','Chaco'),(126,11,'AR-04','Chubut'),(127,11,'AR-05','Cordoba'),(128,11,'AR-06','Corrientes'),(129,11,'AR-07','Distrito Federal'),(130,11,'AR-08','Entre Rios'),(131,11,'AR-09','Formosa'),(132,11,'AR-10','Jujuy'),(133,11,'AR-11','La Pampa'),(134,11,'AR-12','La Rioja'),(135,11,'AR-13','Mendoza'),(136,11,'AR-14','Misiones'),(137,11,'AR-15','Neuquen'),(138,11,'AR-16','Rio Negro'),(139,11,'AR-17','Salta'),(140,11,'AR-18','San Juan'),(141,11,'AR-19','San Luis'),(142,11,'AR-20','Santa Cruz'),(143,11,'AR-21','Santa Fe'),(144,11,'AR-22','Santiago del Estero'),(145,11,'AR-23','Tierra del Fuego'),(146,11,'AR-24','Tucuman'),(147,12,'AM-01','Aragatsotn'),(148,12,'AM-02','Ararat'),(149,12,'AM-03','Armavir'),(150,12,'AM-06','Lorri'),(151,12,'AM-07','Shirak'),(152,12,'AM-09','Tavush'),(153,12,'AM-11','Yerevan'),(154,14,'AU-01','Australian Capital Territory'),(155,14,'AU-02','New South Wales'),(156,14,'AU-03','Northern Territory'),(157,14,'AU-04','Queensland'),(158,14,'AU-05','South Australia'),(159,14,'AU-06','Tasmania'),(160,14,'AU-07','Victoria'),(161,14,'AU-08','Western Australia'),(162,15,'AT-01','Burgenland'),(163,15,'AT-02','Karnten'),(164,15,'AT-03','Niederosterreich'),(165,15,'AT-04','Oberosterreich'),(166,15,'AT-05','Salzburg'),(167,15,'AT-06','Steiermark'),(168,15,'AT-07','Tirol'),(169,15,'AT-08','Vorarlberg'),(170,15,'AT-09','Wien'),(171,16,'AZ-01','Abseron'),(172,16,'AZ-02','Agcabadi'),(173,16,'AZ-03','Agdam'),(174,16,'AZ-04','Agdas'),(175,16,'AZ-05','Agstafa'),(176,16,'AZ-06','Agsu'),(177,16,'AZ-07','Ali Bayramli'),(178,16,'AZ-08','Astara'),(179,16,'AZ-09','Baki'),(180,16,'AZ-10','Balakan'),(181,16,'AZ-11','Barda'),(182,16,'AZ-12','Beylaqan'),(183,16,'AZ-13','Bilasuvar'),(184,16,'AZ-14','Cabrayil'),(185,16,'AZ-15','Calilabad'),(186,16,'AZ-16','Daskasan'),(187,16,'AZ-17','Davaci'),(188,16,'AZ-18','Fuzuli'),(189,16,'AZ-19','Gadabay'),(190,16,'AZ-20','Ganca'),(191,16,'AZ-21','Goranboy'),(192,16,'AZ-22','Goycay'),(193,16,'AZ-23','Haciqabul'),(194,16,'AZ-24','Imisli'),(195,16,'AZ-25','Ismayilli'),(196,16,'AZ-26','Kalbacar'),(197,16,'AZ-27','Kurdamir'),(198,16,'AZ-28','Lacin'),(199,16,'AZ-29','Lankaran'),(200,16,'AZ-31','Lerik'),(201,16,'AZ-32','Masalli'),(202,16,'AZ-33','Mingacevir'),(203,16,'AZ-34','Naftalan'),(204,16,'AZ-35','Naxcivan'),(205,16,'AZ-36','Neftcala'),(206,16,'AZ-37','Oguz'),(207,16,'AZ-38','Qabala'),(208,16,'AZ-39','Qax'),(209,16,'AZ-40','Qazax'),(210,16,'AZ-41','Qobustan'),(211,16,'AZ-42','Quba'),(212,16,'AZ-43','Qubadli'),(213,16,'AZ-44','Qusar'),(214,16,'AZ-45','Saatli'),(215,16,'AZ-46','Sabirabad'),(216,16,'AZ-47','Saki'),(217,16,'AZ-49','Salyan'),(218,16,'AZ-50','Samaxi'),(219,16,'AZ-51','Samkir'),(220,16,'AZ-52','Samux'),(221,16,'AZ-53','Siyazan'),(222,16,'AZ-54','Sumqayit'),(223,16,'AZ-55','Susa'),(224,16,'AZ-57','Tartar'),(225,16,'AZ-58','Tovuz'),(226,16,'AZ-59','Ucar'),(227,16,'AZ-60','Xacmaz'),(228,16,'AZ-61','Xankandi'),(229,16,'AZ-62','Xanlar'),(230,16,'AZ-63','Xizi'),(231,16,'AZ-64','Xocali'),(232,16,'AZ-65','Xocavand'),(233,16,'AZ-66','Yardimli'),(234,16,'AZ-67','Yevlax'),(235,16,'AZ-69','Zangilan'),(236,16,'AZ-70','Zaqatala'),(237,16,'AZ-71','Zardab'),(238,17,'BS-24','Acklins and Crooked Islands'),(239,17,'BS-05','Bimini'),(240,17,'BS-06','Cat Island'),(241,17,'BS-10','Exuma'),(242,17,'BS-25','Freeport'),(243,17,'BS-26','Fresh Creek'),(244,17,'BS-28','Green Turtle Cay'),(245,17,'BS-22','Harbour Island'),(246,17,'BS-29','High Rock'),(247,17,'BS-13','Inagua'),(248,17,'BS-30','Kemps Bay'),(249,17,'BS-15','Long Island'),(250,17,'BS-31','Marsh Harbour'),(251,17,'BS-16','Mayaguana'),(252,17,'BS-23','New Providence'),(253,17,'BS-32','Nichollstown and Berry Islands'),(254,17,'BS-18','Ragged Island'),(255,17,'BS-33','Rock Sound'),(256,17,'BS-35','San Salvador and Rum Cay'),(257,17,'BS-34','Sandy Point'),(258,18,'BH-01','Al Hadd'),(259,18,'BH-02','Al Manamah'),(260,18,'BH-08','Al Mintaqah al Gharbiyah'),(261,18,'BH-11','Al Mintaqah al Wusta'),(262,18,'BH-10','Al Mintaqah ash Shamaliyah'),(263,18,'BH-03','Al Muharraq'),(264,18,'BH-13','Ar Rifa'),(265,18,'BH-05','Jidd Hafs'),(266,18,'BH-12','Madinat'),(267,18,'BH-14','Madinat Hamad'),(268,18,'BH-09','Mintaqat Juzur Hawar'),(269,18,'BH-06','Sitrah'),(270,19,'BD-22','Bagerhat'),(271,19,'BD-04','Bandarban'),(272,19,'BD-25','Barguna'),(273,19,'BD-01','Barisal'),(274,19,'BD-23','Bhola'),(275,19,'BD-24','Bogra'),(276,19,'BD-26','Brahmanbaria'),(277,19,'BD-27','Chandpur'),(278,19,'BD-28','Chapai Nawabganj'),(279,19,'BD-29','Chattagram'),(280,19,'BD-30','Chuadanga'),(281,19,'BD-05','Comilla'),(282,19,'BD-32','Dhaka'),(283,19,'BD-33','Dinajpur'),(284,19,'BD-34','Faridpur'),(285,19,'BD-35','Feni'),(286,19,'BD-36','Gaibandha'),(287,19,'BD-37','Gazipur'),(288,19,'BD-38','Gopalganj'),(289,19,'BD-39','Habiganj'),(290,19,'BD-40','Jaipurhat'),(291,19,'BD-41','Jamalpur'),(292,19,'BD-42','Jessore'),(293,19,'BD-43','Jhalakati'),(294,19,'BD-44','Jhenaidah'),(295,19,'BD-45','Khagrachari'),(296,19,'BD-46','Khulna'),(297,19,'BD-47','Kishorganj'),(298,19,'BD-48','Kurigram'),(299,19,'BD-49','Kushtia'),(300,19,'BD-50','Laksmipur'),(301,19,'BD-51','Lalmonirhat'),(302,19,'BD-52','Madaripur'),(303,19,'BD-53','Magura'),(304,19,'BD-54','Manikganj'),(305,19,'BD-55','Meherpur'),(306,19,'BD-56','Moulavibazar'),(307,19,'BD-57','Munshiganj'),(308,19,'BD-12','Mymensingh'),(309,19,'BD-58','Naogaon'),(310,19,'BD-59','Narail'),(311,19,'BD-60','Narayanganj'),(312,19,'BD-61','Narsingdi'),(313,19,'BD-62','Nator'),(314,19,'BD-63','Netrakona'),(315,19,'BD-64','Nilphamari'),(316,19,'BD-13','Noakhali'),(317,19,'BD-65','Pabna'),(318,19,'BD-66','Panchagar'),(319,19,'BD-67','Parbattya Chattagram'),(320,19,'BD-15','Patuakhali'),(321,19,'BD-68','Pirojpur'),(322,19,'BD-69','Rajbari'),(323,19,'BD-70','Rajshahi'),(324,19,'BD-71','Rangpur'),(325,19,'BD-72','Satkhira'),(326,19,'BD-73','Shariyatpur'),(327,19,'BD-74','Sherpur'),(328,19,'BD-75','Sirajganj'),(329,19,'BD-76','Sunamganj'),(330,19,'BD-77','Sylhet'),(331,19,'BD-78','Tangail'),(332,19,'BD-79','Thakurgaon'),(333,20,'BB-01','Christ Church'),(334,20,'BB-02','Saint Andrew'),(335,20,'BB-03','Saint George'),(336,20,'BB-04','Saint James'),(337,20,'BB-05','Saint John'),(338,20,'BB-06','Saint Joseph'),(339,20,'BB-07','Saint Lucy'),(340,20,'BB-08','Saint Michael'),(341,20,'BB-09','Saint Peter'),(342,20,'BB-10','Saint Philip'),(343,20,'BB-11','Saint Thomas'),(344,21,'BY-04','Minsk'),(345,22,'BE-01','Antwerpen'),(346,22,'BE-02','Brabant'),(347,22,'BE-10','Brabant Wallon'),(348,22,'BE-11','Brussels Hoofdstedelijk Gewest'),(349,22,'BE-03','Hainaut'),(350,22,'BE-04','Liege'),(351,22,'BE-05','Limburg'),(352,22,'BE-06','Luxembourg'),(353,22,'BE-07','Namur'),(354,22,'BE-08','Oost-Vlaanderen'),(355,22,'BE-12','Vlaams-Brabant'),(356,22,'BE-09','West-Vlaanderen'),(357,23,'BZ-01','Belize'),(358,23,'BZ-02','Cayo'),(359,23,'BZ-03','Corozal'),(360,23,'BZ-04','Orange Walk'),(361,23,'BZ-05','Stann Creek'),(362,23,'BZ-06','Toledo'),(363,24,'BJ-01','Atakora'),(364,24,'BJ-02','Atlantique'),(365,24,'BJ-03','Borgou'),(366,24,'BJ-04','Mono'),(367,24,'BJ-05','Oueme'),(368,24,'BJ-06','Zou'),(369,25,'BM-01','Devonshire'),(370,25,'BM-02','Hamilton'),(371,25,'BM-04','Paget'),(372,25,'BM-05','Pembroke'),(373,25,'BM-06','Saint George'),(374,25,'BM-08','Sandys'),(375,25,'BM-09','Smiths'),(376,25,'BM-10','Southampton'),(377,25,'BM-11','Warwick'),(378,26,'BT-05','Bumthang'),(379,26,'BT-06','Chhukha'),(380,26,'BT-07','Chirang'),(381,26,'BT-08','Daga'),(382,26,'BT-09','Geylegphug'),(383,26,'BT-10','Ha'),(384,26,'BT-11','Lhuntshi'),(385,26,'BT-12','Mongar'),(386,26,'BT-13','Paro'),(387,26,'BT-14','Pemagatsel'),(388,26,'BT-15','Punakha'),(389,26,'BT-16','Samchi'),(390,26,'BT-17','Samdrup'),(391,26,'BT-18','Shemgang'),(392,26,'BT-19','Tashigang'),(393,26,'BT-20','Thimphu'),(394,26,'BT-21','Tongsa'),(395,26,'BT-22','Wangdi Phodrang'),(396,27,'BO-01','Chuquisaca'),(397,27,'BO-02','Cochabamba'),(398,27,'BO-03','El Beni'),(399,27,'BO-04','La Paz'),(400,27,'BO-05','Oruro'),(401,27,'BO-06','Pando'),(402,27,'BO-07','Potosi'),(403,27,'BO-08','Santa Cruz'),(404,27,'BO-09','Tarija'),(405,28,'BA-01','Federation of Bosnia and Herzegovina'),(406,28,'BA-02','Republika Srpska'),(407,29,'BW-01','Central'),(408,29,'BW-02','Chobe'),(409,29,'BW-03','Ghanzi'),(410,29,'BW-04','Kgalagadi'),(411,29,'BW-05','Kgatleng'),(412,29,'BW-06','Kweneng'),(413,29,'BW-07','Ngamiland'),(414,29,'BW-08','North-East'),(415,29,'BW-09','South-East'),(416,29,'BW-10','Southern'),(417,31,'BR-01','Acre'),(418,31,'BR-02','Alagoas'),(419,31,'BR-03','Amapa'),(420,31,'BR-04','Amazonas'),(421,31,'BR-05','Bahia'),(422,31,'BR-06','Ceara'),(423,31,'BR-07','Distrito Federal'),(424,31,'BR-08','Espirito Santo'),(425,31,'BR-29','Goias'),(426,31,'BR-13','Maranhao'),(427,31,'BR-14','Mato Grosso'),(428,31,'BR-11','Mato Grosso do Sul'),(429,31,'BR-15','Minas Gerais'),(430,31,'BR-16','Para'),(431,31,'BR-17','Paraiba'),(432,31,'BR-18','Parana'),(433,31,'BR-30','Pernambuco'),(434,31,'BR-20','Piaui'),(435,31,'BR-21','Rio de Janeiro'),(436,31,'BR-22','Rio Grande do Norte'),(437,31,'BR-23','Rio Grande do Sul'),(438,31,'BR-24','Rondonia'),(439,31,'BR-25','Roraima'),(440,31,'BR-26','Santa Catarina'),(441,31,'BR-27','Sao Paulo'),(442,31,'BR-28','Sergipe'),(443,31,'BR-31','Tocantins'),(444,33,'BN-07','Alibori'),(445,33,'BN-08','Belait'),(446,33,'BN-09','Brunei and Muara'),(447,33,'BN-11','Collines'),(448,33,'BN-13','Donga'),(449,33,'BN-12','Kouffo'),(450,33,'BN-14','Littoral'),(451,33,'BN-16','Oueme'),(452,33,'BN-17','Plateau'),(453,33,'BN-10','Temburong'),(454,33,'BN-15','Tutong'),(455,33,'BN-18','Zou'),(456,34,'BG-38','Blagoevgrad'),(457,34,'BG-39','Burgas'),(458,34,'BG-40','Dobrich'),(459,34,'BG-41','Gabrovo'),(460,34,'BG-42','Grad Sofiya'),(461,34,'BG-43','Khaskovo'),(462,34,'BG-44','Kurdzhali'),(463,34,'BG-45','Kyustendil'),(464,34,'BG-46','Lovech'),(465,34,'BG-33','Mikhaylovgrad'),(466,34,'BG-47','Montana'),(467,34,'BG-48','Pazardzhik'),(468,34,'BG-49','Pernik'),(469,34,'BG-50','Pleven'),(470,34,'BG-51','Plovdiv'),(471,34,'BG-52','Razgrad'),(472,34,'BG-53','Ruse'),(473,34,'BG-54','Shumen'),(474,34,'BG-55','Silistra'),(475,34,'BG-56','Sliven'),(476,34,'BG-57','Smolyan'),(477,34,'BG-58','Sofiya'),(478,34,'BG-59','Stara Zagora'),(479,34,'BG-60','Turgovishte'),(480,34,'BG-61','Varna'),(481,34,'BG-62','Veliko Turnovo'),(482,34,'BG-63','Vidin'),(483,34,'BG-64','Vratsa'),(484,34,'BG-65','Yambol'),(485,35,'BF-45','Bale'),(486,35,'BF-15','Bam'),(487,35,'BF-46','Banwa'),(488,35,'BF-47','Bazega'),(489,35,'BF-48','Bougouriba'),(490,35,'BF-49','Boulgou'),(491,35,'BF-19','Boulkiemde'),(492,35,'BF-20','Ganzourgou'),(493,35,'BF-21','Gnagna'),(494,35,'BF-50','Gourma'),(495,35,'BF-51','Houet'),(496,35,'BF-52','Ioba'),(497,35,'BF-53','Kadiogo'),(498,35,'BF-54','Kenedougou'),(499,35,'BF-55','Komoe'),(500,35,'BF-56','Komondjari'),(501,35,'BF-57','Kompienga'),(502,35,'BF-58','Kossi'),(503,35,'BF-59','Koulpelogo'),(504,35,'BF-28','Kouritenga'),(505,35,'BF-60','Kourweogo'),(506,35,'BF-61','Leraba'),(507,35,'BF-62','Loroum'),(508,35,'BF-63','Mouhoun'),(509,35,'BF-64','Namentenga'),(510,35,'BF-65','Naouri'),(511,35,'BF-66','Nayala'),(512,35,'BF-67','Noumbiel'),(513,35,'BF-68','Oubritenga'),(514,35,'BF-33','Oudalan'),(515,35,'BF-34','Passore'),(516,35,'BF-69','Poni'),(517,35,'BF-36','Sanguie'),(518,35,'BF-70','Sanmatenga'),(519,35,'BF-71','Seno'),(520,35,'BF-72','Sissili'),(521,35,'BF-40','Soum'),(522,35,'BF-73','Sourou'),(523,35,'BF-42','Tapoa'),(524,35,'BF-74','Tuy'),(525,35,'BF-75','Yagha'),(526,35,'BF-76','Yatenga'),(527,35,'BF-77','Ziro'),(528,35,'BF-78','Zondoma'),(529,35,'BF-44','Zoundweogo'),(530,36,'BI-09','Bubanza'),(531,36,'BI-02','Bujumbura'),(532,36,'BI-10','Bururi'),(533,36,'BI-11','Cankuzo'),(534,36,'BI-12','Cibitoke'),(535,36,'BI-13','Gitega'),(536,36,'BI-14','Karuzi'),(537,36,'BI-15','Kayanza'),(538,36,'BI-16','Kirundo'),(539,36,'BI-17','Makamba'),(540,36,'BI-22','Muramvya'),(541,36,'BI-18','Muyinga'),(542,36,'BI-23','Mwaro'),(543,36,'BI-19','Ngozi'),(544,36,'BI-20','Rutana'),(545,36,'BI-21','Ruyigi'),(546,37,'KH-29','Batdambang'),(547,37,'KH-02','Kampong Cham'),(548,37,'KH-03','Kampong Chhnang'),(549,37,'KH-04','Kampong Spoe'),(550,37,'KH-05','Kampong Thum'),(551,37,'KH-06','Kampot'),(552,37,'KH-07','Kandal'),(553,37,'KH-08','Kaoh Kong'),(554,37,'KH-09','Kracheh'),(555,37,'KH-10','Mondol Kiri'),(556,37,'KH-30','Pailin'),(557,37,'KH-11','Phnum Penh'),(558,37,'KH-12','Pouthisat'),(559,37,'KH-13','Preah Vihear'),(560,37,'KH-14','Prey Veng'),(561,37,'KH-15','Rotanokiri'),(562,37,'KH-16','Siemreab-Otdar Meanchey'),(563,37,'KH-17','Stoeng Treng'),(564,37,'KH-18','Svay Rieng'),(565,37,'KH-19','Takev'),(566,38,'CM-10','Adamaoua'),(567,38,'CM-11','Centre'),(568,38,'CM-04','Est'),(569,38,'CM-12','Extreme-Nord'),(570,38,'CM-05','Littoral'),(571,38,'CM-13','Nord'),(572,38,'CM-07','Nord-Ouest'),(573,38,'CM-08','Ouest'),(574,38,'CM-14','Sud'),(575,38,'CM-09','Sud-Ouest'),(576,39,'CA-01','Alberta'),(577,39,'CA-02','British Columbia'),(578,39,'CA-03','Manitoba'),(579,39,'CA-04','New Brunswick'),(580,39,'CA-05','Newfoundland and Labrador'),(581,39,'CA-13','Northwest Territories'),(582,39,'CA-07','Nova Scotia'),(583,39,'CA-14','Nunavut'),(584,39,'CA-08','Ontario'),(585,39,'CA-09','Prince Edward Island'),(586,39,'CA-10','Quebec'),(587,39,'CA-11','Saskatchewan'),(588,39,'CA-12','Yukon Territory'),(589,40,'CV-01','Boa Vista'),(590,40,'CV-02','Brava'),(591,40,'CV-04','Maio'),(592,40,'CV-13','Mosteiros'),(593,40,'CV-05','Paul'),(594,40,'CV-14','Praia'),(595,40,'CV-07','Ribeira Grande'),(596,40,'CV-08','Sal'),(597,40,'CV-15','Santa Catarina'),(598,40,'CV-16','Santa Cruz'),(599,40,'CV-17','Sao Domingos'),(600,40,'CV-18','Sao Filipe'),(601,40,'CV-19','Sao Miguel'),(602,40,'CV-10','Sao Nicolau'),(603,40,'CV-11','Sao Vicente'),(604,40,'CV-20','Tarrafal'),(605,41,'KY-01','Creek'),(606,41,'KY-02','Eastern'),(607,41,'KY-03','Midland'),(608,41,'KY-04','South Town'),(609,41,'KY-05','Spot Bay'),(610,41,'KY-06','Stake Bay'),(611,41,'KY-07','West End'),(612,41,'KY-08','Western'),(613,42,'CF-01','Bamingui-Bangoran'),(614,42,'CF-18','Bangui'),(615,42,'CF-02','Basse-Kotto'),(616,42,'CF-05','Haut-Mbomou'),(617,42,'CF-03','Haute-Kotto'),(618,42,'CF-06','Kemo'),(619,42,'CF-07','Lobaye'),(620,42,'CF-04','Mambere-Kadei'),(621,42,'CF-08','Mbomou'),(622,42,'CF-15','Nana-Grebizi'),(623,42,'CF-09','Nana-Mambere'),(624,42,'CF-17','Ombella-Mpoko'),(625,42,'CF-11','Ouaka'),(626,42,'CF-12','Ouham'),(627,42,'CF-13','Ouham-Pende'),(628,42,'CF-16','Sangha-Mbaere'),(629,42,'CF-14','Vakaga'),(630,43,'TD-01','Batha'),(631,43,'TD-02','Biltine'),(632,43,'TD-03','Borkou-Ennedi-Tibesti'),(633,43,'TD-04','Chari-Baguirmi'),(634,43,'TD-05','Guera'),(635,43,'TD-06','Kanem'),(636,43,'TD-07','Lac'),(637,43,'TD-08','Logone Occidental'),(638,43,'TD-09','Logone Oriental'),(639,43,'TD-10','Mayo-Kebbi'),(640,43,'TD-11','Moyen-Chari'),(641,43,'TD-12','Ouaddai'),(642,43,'TD-13','Salamat'),(643,43,'TD-14','Tandjile'),(644,44,'CL-02','Aisen del General Carlos Ibanez del Campo'),(645,44,'CL-03','Antofagasta'),(646,44,'CL-04','Araucania'),(647,44,'CL-05','Atacama'),(648,44,'CL-06','Bio-Bio'),(649,44,'CL-07','Coquimbo'),(650,44,'CL-09','Los Lagos'),(651,44,'CL-10','Magallanes y de la Antartica Chilena'),(652,44,'CL-11','Maule'),(653,44,'CL-12','Region Metropolitana'),(654,44,'CL-13','Tarapaca'),(655,44,'CL-01','Valparaiso'),(656,45,'CN-01','Anhui'),(657,45,'CN-22','Beijing'),(658,45,'CN-33','Chongqing'),(659,45,'CN-07','Fujian'),(660,45,'CN-15','Gansu'),(661,45,'CN-30','Guangdong'),(662,45,'CN-16','Guangxi'),(663,45,'CN-18','Guizhou'),(664,45,'CN-31','Hainan'),(665,45,'CN-10','Hebei'),(666,45,'CN-08','Heilongjiang'),(667,45,'CN-09','Henan'),(668,45,'CN-12','Hubei'),(669,45,'CN-11','Hunan'),(670,45,'CN-04','Jiangsu'),(671,45,'CN-03','Jiangxi'),(672,45,'CN-05','Jilin'),(673,45,'CN-19','Liaoning'),(674,45,'CN-20','Nei Mongol'),(675,45,'CN-21','Ningxia'),(676,45,'CN-06','Qinghai'),(677,45,'CN-26','Shaanxi'),(678,45,'CN-25','Shandong'),(679,45,'CN-23','Shanghai'),(680,45,'CN-24','Shanxi'),(681,45,'CN-32','Sichuan'),(682,45,'CN-28','Tianjin'),(683,45,'CN-13','Xinjiang'),(684,45,'CN-14','Xizang'),(685,45,'CN-29','Yunnan'),(686,45,'CN-02','Zhejiang'),(687,48,'CO-01','Amazonas'),(688,48,'CO-02','Antioquia'),(689,48,'CO-03','Arauca'),(690,48,'CO-04','Atlantico'),(691,48,'CO-35','Bolivar'),(692,48,'CO-36','Boyaca'),(693,48,'CO-37','Caldas'),(694,48,'CO-08','Caqueta'),(695,48,'CO-32','Casanare'),(696,48,'CO-09','Cauca'),(697,48,'CO-10','Cesar'),(698,48,'CO-11','Choco'),(699,48,'CO-12','Cordoba'),(700,48,'CO-33','Cundinamarca'),(701,48,'CO-34','Distrito Especial'),(702,48,'CO-15','Guainia'),(703,48,'CO-14','Guaviare'),(704,48,'CO-16','Huila'),(705,48,'CO-17','La Guajira'),(706,48,'CO-38','Magdalena'),(707,48,'CO-19','Meta'),(708,48,'CO-20','Narino'),(709,48,'CO-21','Norte de Santander'),(710,48,'CO-22','Putumayo'),(711,48,'CO-23','Quindio'),(712,48,'CO-24','Risaralda'),(713,48,'CO-25','San Andres y Providencia'),(714,48,'CO-26','Santander'),(715,48,'CO-27','Sucre'),(716,48,'CO-28','Tolima'),(717,48,'CO-29','Valle del Cauca'),(718,48,'CO-30','Vaupes'),(719,48,'CO-31','Vichada'),(720,49,'KM-01','Anjouan'),(721,49,'KM-02','Grande Comore'),(722,49,'KM-03','Moheli'),(723,50,'CG-01','Bouenza'),(724,50,'CG-12','Brazzaville'),(725,50,'CG-03','Cuvette'),(726,50,'CG-04','Kouilou'),(727,50,'CG-05','Lekoumou'),(728,50,'CG-06','Likouala'),(729,50,'CG-07','Niari'),(730,50,'CG-08','Plateaux'),(731,50,'CG-11','Pool'),(732,50,'CG-10','Sangha'),(733,51,'CD-01','Bandundu'),(734,51,'CD-08','Bas-Congo'),(735,51,'CD-02','Equateur'),(736,51,'CD-03','Kasai-Occidental'),(737,51,'CD-04','Kasai-Oriental'),(738,51,'CD-05','Katanga'),(739,51,'CD-06','Kinshasa'),(740,51,'CD-07','Kivu'),(741,51,'CD-10','Maniema'),(742,51,'CD-11','Nord-Kivu'),(743,51,'CD-09','Orientale'),(744,51,'CD-12','Sud-Kivu'),(745,53,'CR-01','Alajuela'),(746,53,'CR-02','Cartago'),(747,53,'CR-03','Guanacaste'),(748,53,'CR-04','Heredia'),(749,53,'CR-06','Limon'),(750,53,'CR-07','Puntarenas'),(751,53,'CR-08','San Jose'),(752,54,'HR-01','Bjelovarsko-Bilogorska'),(753,54,'HR-02','Brodsko-Posavska'),(754,54,'HR-03','Dubrovacko-Neretvanska'),(755,54,'HR-21','Grad Zagreb'),(756,54,'HR-04','Istarska'),(757,54,'HR-05','Karlovacka'),(758,54,'HR-06','Koprivnicko-Krizevacka'),(759,54,'HR-07','Krapinsko-Zagorska'),(760,54,'HR-08','Licko-Senjska'),(761,54,'HR-09','Medimurska'),(762,54,'HR-10','Osjecko-Baranjska'),(763,54,'HR-11','Pozesko-Slavonska'),(764,54,'HR-12','Primorsko-Goranska'),(765,54,'HR-13','Sibensko-Kninska'),(766,54,'HR-14','Sisacko-Moslavacka'),(767,54,'HR-15','Splitsko-Dalmatinska'),(768,54,'HR-16','Varazdinska'),(769,54,'HR-17','Viroviticko-Podravska'),(770,54,'HR-18','Vukovarsko-Srijemska'),(771,54,'HR-19','Zadarska'),(772,54,'HR-20','Zagrebacka'),(773,55,'CU-05','Camaguey'),(774,55,'CU-07','Ciego de Avila'),(775,55,'CU-08','Cienfuegos'),(776,55,'CU-02','Ciudad de la Habana'),(777,55,'CU-09','Granma'),(778,55,'CU-10','Guantanamo'),(779,55,'CU-12','Holguin'),(780,55,'CU-04','Isla de la Juventud'),(781,55,'CU-11','La Habana'),(782,55,'CU-13','Las Tunas'),(783,55,'CU-03','Matanzas'),(784,55,'CU-01','Pinar del Rio'),(785,55,'CU-14','Sancti Spiritus'),(786,55,'CU-15','Santiago de Cuba'),(787,55,'CU-16','Villa Clara'),(788,56,'CY-01','Famagusta'),(789,56,'CY-02','Kyrenia'),(790,56,'CY-03','Larnaca'),(791,56,'CY-05','Limassol'),(792,56,'CY-04','Nicosia'),(793,56,'CY-06','Paphos'),(794,57,'CZ-03','Blansko'),(795,57,'CZ-04','Breclav'),(796,57,'CZ-52','Hlavni Mesto Praha'),(797,57,'CZ-20','Hradec Kralove'),(798,57,'CZ-21','Jablonec nad Nisou'),(799,57,'CZ-23','Jiein'),(800,57,'CZ-24','Jihlava'),(801,57,'CZ-79','Jihocesky Kraj'),(802,57,'CZ-78','Jihomoravsky Kraj'),(803,57,'CZ-81','Karlovarsky Kraj'),(804,57,'CZ-30','Kolin'),(805,57,'CZ-82','Kralovehradecky Kraj'),(806,57,'CZ-33','Liberec'),(807,57,'CZ-83','Liberecky Kraj'),(808,57,'CZ-36','Melnik'),(809,57,'CZ-37','Mlada Boleslav'),(810,57,'CZ-85','Moravskoslezsky Kraj'),(811,57,'CZ-39','Nachod'),(812,57,'CZ-41','Nymburk'),(813,57,'CZ-84','Olomoucky Kraj'),(814,57,'CZ-45','Pardubice'),(815,57,'CZ-86','Pardubicky Kraj'),(816,57,'CZ-87','Plzensky Kraj'),(817,57,'CZ-61','Semily'),(818,57,'CZ-88','Stredocesky Kraj'),(819,57,'CZ-70','Trutnov'),(820,57,'CZ-89','Ustecky Kraj'),(821,57,'CZ-80','Vysocina'),(822,57,'CZ-90','Zlinsky Kraj'),(823,58,'DK-01','Arhus'),(824,58,'DK-02','Bornholm'),(825,58,'DK-03','Frederiksborg'),(826,58,'DK-04','Fyn'),(827,58,'DK-05','Kobenhavn'),(828,58,'DK-07','Nordjylland'),(829,58,'DK-08','Ribe'),(830,58,'DK-09','Ringkobing'),(831,58,'DK-10','Roskilde'),(832,58,'DK-11','Sonderjylland'),(833,58,'DK-06','Staden Kobenhavn'),(834,58,'DK-12','Storstrom'),(835,58,'DK-13','Vejle'),(836,58,'DK-14','Vestsjalland'),(837,58,'DK-15','Viborg'),(838,59,'DJ-02','Dikhil'),(839,59,'DJ-03','Djibouti'),(840,59,'DJ-04','Obock'),(841,59,'DJ-05','Tadjoura'),(842,60,'DM-02','Saint Andrew'),(843,60,'DM-03','Saint David'),(844,60,'DM-04','Saint George'),(845,60,'DM-05','Saint John'),(846,60,'DM-06','Saint Joseph'),(847,60,'DM-07','Saint Luke'),(848,60,'DM-08','Saint Mark'),(849,60,'DM-09','Saint Patrick'),(850,60,'DM-10','Saint Paul'),(851,60,'DM-11','Saint Peter'),(852,61,'DO-01','Azua'),(853,61,'DO-02','Baoruco'),(854,61,'DO-03','Barahona'),(855,61,'DO-04','Dajabon'),(856,61,'DO-05','Distrito Nacional'),(857,61,'DO-06','Duarte'),(858,61,'DO-28','El Seibo'),(859,61,'DO-11','Elias Pina'),(860,61,'DO-08','Espaillat'),(861,61,'DO-29','Hato Mayor'),(862,61,'DO-09','Independencia'),(863,61,'DO-10','La Altagracia'),(864,61,'DO-12','La Romana'),(865,61,'DO-30','La Vega'),(866,61,'DO-14','Maria Trinidad Sanchez'),(867,61,'DO-31','Monsenor Nouel'),(868,61,'DO-15','Monte Cristi'),(869,61,'DO-32','Monte Plata'),(870,61,'DO-16','Pedernales'),(871,61,'DO-17','Peravia'),(872,61,'DO-18','Puerto Plata'),(873,61,'DO-19','Salcedo'),(874,61,'DO-20','Samana'),(875,61,'DO-33','San Cristobal'),(876,61,'DO-23','San Juan'),(877,61,'DO-24','San Pedro De Macoris'),(878,61,'DO-21','Sanchez Ramirez'),(879,61,'DO-25','Santiago'),(880,61,'DO-26','Santiago Rodriguez'),(881,61,'DO-27','Valverde'),(882,62,'EC-02','Azuay'),(883,62,'EC-03','Bolivar'),(884,62,'EC-04','Canar'),(885,62,'EC-05','Carchi'),(886,62,'EC-06','Chimborazo'),(887,62,'EC-07','Cotopaxi'),(888,62,'EC-08','El Oro'),(889,62,'EC-09','Esmeraldas'),(890,62,'EC-01','Galapagos'),(891,62,'EC-10','Guayas'),(892,62,'EC-11','Imbabura'),(893,62,'EC-12','Loja'),(894,62,'EC-13','Los Rios'),(895,62,'EC-14','Manabi'),(896,62,'EC-15','Morona-Santiago'),(897,62,'EC-23','Napo'),(898,62,'EC-24','Orellana'),(899,62,'EC-17','Pastaza'),(900,62,'EC-18','Pichincha'),(901,62,'EC-22','Sucumbios'),(902,62,'EC-19','Tungurahua'),(903,62,'EC-20','Zamora-Chinchipe'),(904,63,'EG-01','Ad Daqahliyah'),(905,63,'EG-02','Al Bahr al Ahmar'),(906,63,'EG-03','Al Buhayrah'),(907,63,'EG-04','Al Fayyum'),(908,63,'EG-05','Al Gharbiyah'),(909,63,'EG-06','Al Iskandariyah'),(910,63,'EG-08','Al Jizah'),(911,63,'EG-09','Al Minufiyah'),(912,63,'EG-10','Al Minya'),(913,63,'EG-11','Al Qahirah'),(914,63,'EG-12','Al Qalyubiyah'),(915,63,'EG-13','Al Wadi al Jadid'),(916,63,'EG-15','As Suways'),(917,63,'EG-14','Ash Sharqiyah'),(918,63,'EG-16','Aswan'),(919,63,'EG-17','Asyut'),(920,63,'EG-18','Bani Suwayf'),(921,63,'EG-20','Dumyat'),(922,63,'EG-21','Kafr ash Shaykh'),(923,63,'EG-22','Matruh'),(924,63,'EG-23','Qina'),(925,63,'EG-24','Suhaj'),(926,64,'SV-01','Ahuachapan'),(927,64,'SV-02','Cabanas'),(928,64,'SV-03','Chalatenango'),(929,64,'SV-04','Cuscatlan'),(930,64,'SV-05','La Libertad'),(931,64,'SV-06','La Paz'),(932,64,'SV-07','La Union'),(933,64,'SV-08','Morazan'),(934,64,'SV-09','San Miguel'),(935,64,'SV-10','San Salvador'),(936,64,'SV-12','San Vicente'),(937,64,'SV-11','Santa Ana'),(938,64,'SV-13','Sonsonate'),(939,64,'SV-14','Usulutan'),(940,65,'GQ-03','Annobon'),(941,65,'GQ-04','Bioko Norte'),(942,65,'GQ-05','Bioko Sur'),(943,65,'GQ-06','Centro Sur'),(944,65,'GQ-07','Kie-Ntem'),(945,65,'GQ-08','Litoral'),(946,65,'GQ-09','Wele-Nzas'),(947,67,'EE-01','Harjumaa'),(948,67,'EE-02','Hiiumaa'),(949,67,'EE-03','Ida-Virumaa'),(950,67,'EE-04','Jarvamaa'),(951,67,'EE-05','Jogevamaa'),(952,67,'EE-06','Kohtla-Jarve'),(953,67,'EE-08','Laane-Virumaa'),(954,67,'EE-07','Laanemaa'),(955,67,'EE-09','Narva'),(956,67,'EE-10','Parnu'),(957,67,'EE-11','Parnumaa'),(958,67,'EE-12','Polvamaa'),(959,67,'EE-13','Raplamaa'),(960,67,'EE-14','Saaremaa'),(961,67,'EE-15','Sillamae'),(962,67,'EE-16','Tallinn'),(963,67,'EE-17','Tartu'),(964,67,'EE-18','Tartumaa'),(965,67,'EE-19','Valgamaa'),(966,67,'EE-20','Viljandimaa'),(967,67,'EE-21','Vorumaa'),(968,68,'ET-10','Addis Abeba'),(969,68,'ET-44','Adis Abeba'),(970,68,'ET-14','Afar'),(971,68,'ET-46','Amara'),(972,68,'ET-02','Amhara'),(973,68,'ET-13','Benishangul'),(974,68,'ET-47','Binshangul Gumuz'),(975,68,'ET-48','Dire Dawa'),(976,68,'ET-49','Gambela Hizboch'),(977,68,'ET-08','Gambella'),(978,68,'ET-50','Hareri Hizb'),(979,68,'ET-51','Oromiya'),(980,68,'ET-07','Somali'),(981,68,'ET-11','Southern'),(982,68,'ET-52','Sumale'),(983,68,'ET-12','Tigray'),(984,68,'ET-54','YeDebub Biheroch Bihereseboch na Hizboch'),(985,71,'FJ-01','Central'),(986,71,'FJ-02','Eastern'),(987,71,'FJ-03','Northern'),(988,71,'FJ-04','Rotuma'),(989,71,'FJ-05','Western'),(990,72,'FI-14','Eastern Finland'),(991,72,'FI-06','Lapland'),(992,72,'FI-08','Oulu'),(993,72,'FI-13','Southern Finland'),(994,72,'FI-15','Western Finland'),(995,73,'FR-C1','Alsace'),(996,73,'FR-97','Aquitaine'),(997,73,'FR-98','Auvergne'),(998,73,'FR-99','Basse-Normandie'),(999,73,'FR-A1','Bourgogne'),(1000,73,'FR-A2','Bretagne'),(1001,73,'FR-A3','Centre'),(1002,73,'FR-A4','Champagne-Ardenne'),(1003,73,'FR-A5','Corse'),(1004,73,'FR-A6','Franche-Comte'),(1005,73,'FR-A7','Haute-Normandie'),(1006,73,'FR-A8','Ile-de-France'),(1007,73,'FR-A9','Languedoc-Roussillon'),(1008,73,'FR-B1','Limousin'),(1009,73,'FR-B2','Lorraine'),(1010,73,'FR-B3','Midi-Pyrenees'),(1011,73,'FR-B4','Nord-Pas-de-Calais'),(1012,73,'FR-B5','Pays de la Loire'),(1013,73,'FR-B6','Picardie'),(1014,73,'FR-B7','Poitou-Charentes'),(1015,73,'FR-B9','Rhone-Alpes'),(1016,77,'GA-01','Estuaire'),(1017,77,'GA-02','Haut-Ogooue'),(1018,77,'GA-03','Moyen-Ogooue'),(1019,77,'GA-04','Ngounie'),(1020,77,'GA-05','Nyanga'),(1021,77,'GA-06','Ogooue-Ivindo'),(1022,77,'GA-07','Ogooue-Lolo'),(1023,77,'GA-08','Ogooue-Maritime'),(1024,77,'GA-09','Woleu-Ntem'),(1025,78,'GM-01','Banjul'),(1026,78,'GM-02','Lower River'),(1027,78,'GM-03','MacCarthy Island'),(1028,78,'GM-07','North Bank'),(1029,78,'GM-04','Upper River'),(1030,78,'GM-05','Western'),(1031,79,'GE-01','Abashis Raioni'),(1032,79,'GE-02','Abkhazia'),(1033,79,'GE-03','Adigenis Raioni'),(1034,79,'GE-04','Ajaria'),(1035,79,'GE-05','Akhalgoris Raioni'),(1036,79,'GE-08','Akhmetis Raioni'),(1037,79,'GE-09','Ambrolauris Raioni'),(1038,79,'GE-10','Aspindzis Raioni'),(1039,79,'GE-12','Bolnisis Raioni'),(1040,79,'GE-13','Borjomis Raioni'),(1041,79,'GE-18','Dmanisis Raioni'),(1042,79,'GE-20','Gardabanis Raioni'),(1043,79,'GE-21','Gori'),(1044,79,'GE-22','Goris Raioni'),(1045,79,'GE-23','Gurjaanis Raioni'),(1046,79,'GE-24','Javis Raioni'),(1047,79,'GE-26','Kaspis Raioni'),(1048,79,'GE-27','Kharagaulis Raioni'),(1049,79,'GE-28','Khashuris Raioni'),(1050,79,'GE-29','Khobis Raioni'),(1051,79,'GE-30','Khonis Raioni'),(1052,79,'GE-32','Lagodekhis Raioni'),(1053,79,'GE-34','Lentekhis Raioni'),(1054,79,'GE-35','Marneulis Raioni'),(1055,79,'GE-36','Martvilis Raioni'),(1056,79,'GE-37','Mestiis Raioni'),(1057,79,'GE-39','Ninotsmindis Raioni'),(1058,79,'GE-40','Onis Raioni'),(1059,79,'GE-43','Qazbegis Raioni'),(1060,79,'GE-44','Qvarlis Raioni'),(1061,79,'GE-47','Sagarejos Raioni'),(1062,79,'GE-48','Samtrediis Raioni'),(1063,79,'GE-49','Senakis Raioni'),(1064,79,'GE-50','Sighnaghis Raioni'),(1065,79,'GE-56','Tqibuli'),(1066,79,'GE-58','Tsalenjikhis Raioni'),(1067,79,'GE-59','Tsalkis Raioni'),(1068,79,'GE-60','Tsqaltubo'),(1069,79,'GE-61','Vanis Raioni'),(1070,79,'GE-63','Zugdidi'),(1071,79,'GE-64','Zugdidis Raioni'),(1072,80,'DE-01','Baden-WÃ¼rttemberg'),(1073,80,'DE-02','Bayern'),(1074,80,'DE-16','Berlin'),(1075,80,'DE-11','Brandenburg'),(1076,80,'DE-03','Bremen'),(1077,80,'DE-04','Hamburg'),(1078,80,'DE-05','Hessen'),(1079,80,'DE-12','Mecklenburg-Vorpommern'),(1080,80,'DE-06','Niedersachsen'),(1081,80,'DE-07','Nordrhein-Westfalen'),(1082,80,'DE-08','Rheinland-Pfalz'),(1083,80,'DE-09','Saarland'),(1084,80,'DE-13','Sachsen'),(1085,80,'DE-14','Sachsen-Anhalt'),(1086,80,'DE-10','Schleswig-Holstein'),(1087,80,'DE-15','Thuringen'),(1088,81,'GH-02','Ashanti'),(1089,81,'GH-03','Brong-Ahafo'),(1090,81,'GH-04','Central'),(1091,81,'GH-05','Eastern'),(1092,81,'GH-01','Greater Accra'),(1093,81,'GH-06','Northern'),(1094,81,'GH-10','Upper East'),(1095,81,'GH-11','Upper West'),(1096,81,'GH-08','Volta'),(1097,81,'GH-09','Western'),(1098,83,'GR-31','Aitolia kai Akarnania'),(1099,83,'GR-38','Akhaia'),(1100,83,'GR-36','Argolis'),(1101,83,'GR-41','Arkadhia'),(1102,83,'GR-20','Arta'),(1103,83,'GR-35','Attiki'),(1104,83,'GR-47','Dhodhekanisos'),(1105,83,'GR-04','Drama'),(1106,83,'GR-30','Evritania'),(1107,83,'GR-01','Evros'),(1108,83,'GR-34','Evvoia'),(1109,83,'GR-08','Florina'),(1110,83,'GR-32','Fokis'),(1111,83,'GR-29','Fthiotis'),(1112,83,'GR-10','Grevena'),(1113,83,'GR-39','Ilia'),(1114,83,'GR-12','Imathia'),(1115,83,'GR-17','Ioannina'),(1116,83,'GR-45','Iraklion'),(1117,83,'GR-23','Kardhitsa'),(1118,83,'GR-09','Kastoria'),(1119,83,'GR-14','Kavala'),(1120,83,'GR-27','Kefallinia'),(1121,83,'GR-25','Kerkira'),(1122,83,'GR-15','Khalkidhiki'),(1123,83,'GR-43','Khania'),(1124,83,'GR-50','Khios'),(1125,83,'GR-49','Kikladhes'),(1126,83,'GR-06','Kilkis'),(1127,83,'GR-37','Korinthia'),(1128,83,'GR-11','Kozani'),(1129,83,'GR-42','Lakonia'),(1130,83,'GR-21','Larisa'),(1131,83,'GR-46','Lasithi'),(1132,83,'GR-51','Lesvos'),(1133,83,'GR-26','Levkas'),(1134,83,'GR-24','Magnisia'),(1135,83,'GR-40','Messinia'),(1136,83,'GR-07','Pella'),(1137,83,'GR-16','Pieria'),(1138,83,'GR-19','Preveza'),(1139,83,'GR-44','Rethimni'),(1140,83,'GR-02','Rodhopi'),(1141,83,'GR-48','Samos'),(1142,83,'GR-05','Serrai'),(1143,83,'GR-18','Thesprotia'),(1144,83,'GR-13','Thessaloniki'),(1145,83,'GR-22','Trikala'),(1146,83,'GR-33','Voiotia'),(1147,83,'GR-03','Xanthi'),(1148,83,'GR-28','Zakinthos'),(1149,84,'GL-01','Nordgronland'),(1150,84,'GL-02','Ostgronland'),(1151,84,'GL-03','Vestgronland'),(1152,85,'GD-01','Saint Andrew'),(1153,85,'GD-02','Saint David'),(1154,85,'GD-03','Saint George'),(1155,85,'GD-04','Saint John'),(1156,85,'GD-05','Saint Mark'),(1157,85,'GD-06','Saint Patrick'),(1158,88,'GT-01','Alta Verapaz'),(1159,88,'GT-02','Baja Verapaz'),(1160,88,'GT-03','Chimaltenango'),(1161,88,'GT-04','Chiquimula'),(1162,88,'GT-05','El Progreso'),(1163,88,'GT-06','Escuintla'),(1164,88,'GT-07','Guatemala'),(1165,88,'GT-08','Huehuetenango'),(1166,88,'GT-09','Izabal'),(1167,88,'GT-10','Jalapa'),(1168,88,'GT-11','Jutiapa'),(1169,88,'GT-12','Peten'),(1170,88,'GT-13','Quetzaltenango'),(1171,88,'GT-14','Quiche'),(1172,88,'GT-15','Retalhuleu'),(1173,88,'GT-16','Sacatepequez'),(1174,88,'GT-17','San Marcos'),(1175,88,'GT-18','Santa Rosa'),(1176,88,'GT-19','Solola'),(1177,88,'GT-20','Suchitepequez'),(1178,88,'GT-21','Totonicapan'),(1179,88,'GT-22','Zacapa'),(1180,90,'GN-01','Beyla'),(1181,90,'GN-02','Boffa'),(1182,90,'GN-03','Boke'),(1183,90,'GN-04','Conakry'),(1184,90,'GN-30','Coyah'),(1185,90,'GN-05','Dabola'),(1186,90,'GN-06','Dalaba'),(1187,90,'GN-07','Dinguiraye'),(1188,90,'GN-31','Dubreka'),(1189,90,'GN-09','Faranah'),(1190,90,'GN-10','Forecariah'),(1191,90,'GN-11','Fria'),(1192,90,'GN-12','Gaoual'),(1193,90,'GN-13','Gueckedou'),(1194,90,'GN-32','Kankan'),(1195,90,'GN-15','Kerouane'),(1196,90,'GN-16','Kindia'),(1197,90,'GN-17','Kissidougou'),(1198,90,'GN-33','Koubia'),(1199,90,'GN-18','Koundara'),(1200,90,'GN-19','Kouroussa'),(1201,90,'GN-34','Labe'),(1202,90,'GN-35','Lelouma'),(1203,90,'GN-36','Lola'),(1204,90,'GN-21','Macenta'),(1205,90,'GN-22','Mali'),(1206,90,'GN-23','Mamou'),(1207,90,'GN-37','Mandiana'),(1208,90,'GN-38','Nzerekore'),(1209,90,'GN-25','Pita'),(1210,90,'GN-39','Siguiri'),(1211,90,'GN-27','Telimele'),(1212,90,'GN-28','Tougue'),(1213,90,'GN-29','Yomou'),(1214,91,'GW-01','Bafata'),(1215,91,'GW-12','Biombo'),(1216,91,'GW-11','Bissau'),(1217,91,'GW-05','Bolama'),(1218,91,'GW-06','Cacheu'),(1219,91,'GW-10','Gabu'),(1220,91,'GW-04','Oio'),(1221,91,'GW-02','Quinara'),(1222,91,'GW-07','Tombali'),(1223,92,'GY-10','Barima-Waini'),(1224,92,'GY-11','Cuyuni-Mazaruni'),(1225,92,'GY-12','Demerara-Mahaica'),(1226,92,'GY-13','East Berbice-Corentyne'),(1227,92,'GY-14','Essequibo Islands-West Demerara'),(1228,92,'GY-15','Mahaica-Berbice'),(1229,92,'GY-16','Pomeroon-Supenaam'),(1230,92,'GY-17','Potaro-Siparuni'),(1231,92,'GY-18','Upper Demerara-Berbice'),(1232,92,'GY-19','Upper Takutu-Upper Essequibo'),(1233,93,'HT-06','Artibonite'),(1234,93,'HT-07','Centre'),(1235,93,'HT-09','Nord'),(1236,93,'HT-10','Nord-Est'),(1237,93,'HT-03','Nord-Ouest'),(1238,93,'HT-11','Ouest'),(1239,93,'HT-12','Sud'),(1240,93,'HT-13','Sud-Est'),(1241,96,'HN-01','Atlantida'),(1242,96,'HN-02','Choluteca'),(1243,96,'HN-03','Colon'),(1244,96,'HN-04','Comayagua'),(1245,96,'HN-05','Copan'),(1246,96,'HN-06','Cortes'),(1247,96,'HN-07','El Paraiso'),(1248,96,'HN-08','Francisco Morazan'),(1249,96,'HN-09','Gracias a Dios'),(1250,96,'HN-10','Intibuca'),(1251,96,'HN-11','Islas de la Bahia'),(1252,96,'HN-12','La Paz'),(1253,96,'HN-13','Lempira'),(1254,96,'HN-14','Ocotepeque'),(1255,96,'HN-15','Olancho'),(1256,96,'HN-16','Santa Barbara'),(1257,96,'HN-17','Valle'),(1258,96,'HN-18','Yoro'),(1259,98,'HU-01','Bacs-Kiskun'),(1260,98,'HU-02','Baranya'),(1261,98,'HU-03','Bekes'),(1262,98,'HU-26','Bekescsaba'),(1263,98,'HU-04','Borsod-Abauj-Zemplen'),(1264,98,'HU-05','Budapest'),(1265,98,'HU-06','Csongrad'),(1266,98,'HU-07','Debrecen'),(1267,98,'HU-27','Dunaujvaros'),(1268,98,'HU-28','Eger'),(1269,98,'HU-08','Fejer'),(1270,98,'HU-25','Gyor'),(1271,98,'HU-09','Gyor-Moson-Sopron'),(1272,98,'HU-10','Hajdu-Bihar'),(1273,98,'HU-11','Heves'),(1274,98,'HU-29','Hodmezovasarhely'),(1275,98,'HU-20','Jasz-Nagykun-Szolnok'),(1276,98,'HU-30','Kaposvar'),(1277,98,'HU-31','Kecskemet'),(1278,98,'HU-12','Komarom-Esztergom'),(1279,98,'HU-13','Miskolc'),(1280,98,'HU-32','Nagykanizsa'),(1281,98,'HU-14','Nograd'),(1282,98,'HU-33','Nyiregyhaza'),(1283,98,'HU-15','Pecs'),(1284,98,'HU-16','Pest'),(1285,98,'HU-17','Somogy'),(1286,98,'HU-34','Sopron'),(1287,98,'HU-18','Szabolcs-Szatmar-Bereg'),(1288,98,'HU-19','Szeged'),(1289,98,'HU-35','Szekesfehervar'),(1290,98,'HU-36','Szolnok'),(1291,98,'HU-37','Szombathely'),(1292,98,'HU-38','Tatabanya'),(1293,98,'HU-21','Tolna'),(1294,98,'HU-22','Vas'),(1295,98,'HU-23','Veszprem'),(1296,98,'HU-24','Zala'),(1297,98,'HU-40','Zalaegerszeg'),(1298,99,'IS-01','Akranes'),(1299,99,'IS-02','Akureyri'),(1300,99,'IS-03','Arnessysla'),(1301,99,'IS-04','Austur-Bardastrandarsysla'),(1302,99,'IS-05','Austur-Hunavatnssysla'),(1303,99,'IS-06','Austur-Skaftafellssysla'),(1304,99,'IS-07','Borgarfjardarsysla'),(1305,99,'IS-08','Dalasysla'),(1306,99,'IS-09','Eyjafjardarsysla'),(1307,99,'IS-10','Gullbringusysla'),(1308,99,'IS-11','Hafnarfjordur'),(1309,99,'IS-12','Husavik'),(1310,99,'IS-13','Isafjordur'),(1311,99,'IS-14','Keflavik'),(1312,99,'IS-15','Kjosarsysla'),(1313,99,'IS-16','Kopavogur'),(1314,99,'IS-17','Myrasysla'),(1315,99,'IS-18','Neskaupstadur'),(1316,99,'IS-19','Nordur-Isafjardarsysla'),(1317,99,'IS-20','Nordur-Mulasysla'),(1318,99,'IS-21','Nordur-Tingeyjarsysla'),(1319,99,'IS-22','Olafsfjordur'),(1320,99,'IS-23','Rangarvallasysla'),(1321,99,'IS-24','Reykjavik'),(1322,99,'IS-25','Saudarkrokur'),(1323,99,'IS-26','Seydisfjordur'),(1324,99,'IS-27','Siglufjordur'),(1325,99,'IS-28','Skagafjardarsysla'),(1326,99,'IS-29','Snafellsnes- og Hnappadalssysla'),(1327,99,'IS-30','Strandasysla'),(1328,99,'IS-31','Sudur-Mulasysla'),(1329,99,'IS-32','Sudur-Tingeyjarsysla'),(1330,99,'IS-33','Vestmannaeyjar'),(1331,99,'IS-34','Vestur-Bardastrandarsysla'),(1332,99,'IS-35','Vestur-Hunavatnssysla'),(1333,99,'IS-36','Vestur-Isafjardarsysla'),(1334,99,'IS-37','Vestur-Skaftafellssysla'),(1335,100,'IN-01','Andaman and Nicobar Islands'),(1336,100,'IN-02','Andhra Pradesh'),(1337,100,'IN-30','Arunachal Pradesh'),(1338,100,'IN-03','Assam'),(1339,100,'IN-34','Bihar'),(1340,100,'IN-05','Chandigarh'),(1341,100,'IN-37','Chhattisgarh'),(1342,100,'IN-06','Dadra and Nagar Haveli'),(1343,100,'IN-32','Daman and Diu'),(1344,100,'IN-07','Delhi'),(1345,100,'IN-33','Goa'),(1346,100,'IN-09','Gujarat'),(1347,100,'IN-10','Haryana'),(1348,100,'IN-11','Himachal Pradesh'),(1349,100,'IN-12','Jammu and Kashmir'),(1350,100,'IN-38','Jharkhand'),(1351,100,'IN-19','Karnataka'),(1352,100,'IN-13','Kerala'),(1353,100,'IN-14','Lakshadweep'),(1354,100,'IN-35','Madhya Pradesh'),(1355,100,'IN-16','Maharashtra'),(1356,100,'IN-17','Manipur'),(1357,100,'IN-18','Meghalaya'),(1358,100,'IN-31','Mizoram'),(1359,100,'IN-20','Nagaland'),(1360,100,'IN-21','Orissa'),(1361,100,'IN-22','Pondicherry'),(1362,100,'IN-23','Punjab'),(1363,100,'IN-24','Rajasthan'),(1364,100,'IN-29','Sikkim'),(1365,100,'IN-25','Tamil Nadu'),(1366,100,'IN-26','Tripura'),(1367,100,'IN-36','Uttar Pradesh'),(1368,100,'IN-39','Uttaranchal'),(1369,100,'IN-28','West Bengal'),(1370,101,'ID-01','Aceh'),(1371,101,'ID-02','Bali'),(1372,101,'ID-33','Banten'),(1373,101,'ID-03','Bengkulu'),(1374,101,'ID-34','Gorontalo'),(1375,101,'ID-04','Jakarta Raya'),(1376,101,'ID-05','Jambi'),(1377,101,'ID-30','Jawa Barat'),(1378,101,'ID-07','Jawa Tengah'),(1379,101,'ID-08','Jawa Timur'),(1380,101,'ID-11','Kalimantan Barat'),(1381,101,'ID-12','Kalimantan Selatan'),(1382,101,'ID-13','Kalimantan Tengah'),(1383,101,'ID-14','Kalimantan Timur'),(1384,101,'ID-35','Kepulauan Bangka Belitung'),(1385,101,'ID-15','Lampung'),(1386,101,'ID-28','Maluku'),(1387,101,'ID-29','Maluku Utara'),(1388,101,'ID-17','Nusa Tenggara Barat'),(1389,101,'ID-18','Nusa Tenggara Timur'),(1390,101,'ID-09','Papua'),(1391,101,'ID-19','Riau'),(1392,101,'ID-20','Sulawesi Selatan'),(1393,101,'ID-21','Sulawesi Tengah'),(1394,101,'ID-22','Sulawesi Tenggara'),(1395,101,'ID-31','Sulawesi Utara'),(1396,101,'ID-24','Sumatera Barat'),(1397,101,'ID-32','Sumatera Selatan'),(1398,101,'ID-26','Sumatera Utara'),(1399,101,'ID-10','Yogyakarta'),(1400,102,'IR-32','Ardabil'),(1401,102,'IR-01','Azarbayjan-e Bakhtari'),(1402,102,'IR-02','Azarbayjan-e Khavari'),(1403,102,'IR-13','Bakhtaran'),(1404,102,'IR-22','Bushehr'),(1405,102,'IR-03','Chahar Mahall va Bakhtiari'),(1406,102,'IR-28','Esfahan'),(1407,102,'IR-07','Fars'),(1408,102,'IR-08','Gilan'),(1409,102,'IR-37','Golestan'),(1410,102,'IR-09','Hamadan'),(1411,102,'IR-11','Hormozgan'),(1412,102,'IR-10','Ilam'),(1413,102,'IR-29','Kerman'),(1414,102,'IR-30','Khorasan'),(1415,102,'IR-15','Khuzestan'),(1416,102,'IR-05','Kohkiluyeh va Buyer Ahmadi'),(1417,102,'IR-16','Kordestan'),(1418,102,'IR-23','Lorestan'),(1419,102,'IR-34','Markazi'),(1420,102,'IR-35','Mazandaran'),(1421,102,'IR-38','Qazvin'),(1422,102,'IR-39','Qom'),(1423,102,'IR-25','Semnan'),(1424,102,'IR-04','Sistan va Baluchestan'),(1425,102,'IR-26','Tehran'),(1426,102,'IR-31','Yazd'),(1427,102,'IR-36','Zanjan'),(1428,103,'IQ-01','Al Anbar'),(1429,103,'IQ-02','Al Basrah'),(1430,103,'IQ-03','Al Muthanna'),(1431,103,'IQ-04','Al Qadisiyah'),(1432,103,'IQ-17','An Najaf'),(1433,103,'IQ-11','Arbil'),(1434,103,'IQ-05','As Sulaymaniyah'),(1435,103,'IQ-06','Babil'),(1436,103,'IQ-07','Baghdad'),(1437,103,'IQ-08','Dahuk'),(1438,103,'IQ-09','Dhi Qar'),(1439,103,'IQ-10','Diyala'),(1440,103,'IQ-14','Maysan'),(1441,103,'IQ-15','Ninawa'),(1442,103,'IQ-18','Salah ad Din'),(1443,103,'IQ-16','Wasit'),(1444,104,'IE-01','Carlow'),(1445,104,'IE-02','Cavan'),(1446,104,'IE-03','Clare'),(1447,104,'IE-04','Cork'),(1448,104,'IE-06','Donegal'),(1449,104,'IE-07','Dublin'),(1450,104,'IE-10','Galway'),(1451,104,'IE-11','Kerry'),(1452,104,'IE-12','Kildare'),(1453,104,'IE-13','Kilkenny'),(1454,104,'IE-15','Laois'),(1455,104,'IE-14','Leitrim'),(1456,104,'IE-16','Limerick'),(1457,104,'IE-18','Longford'),(1458,104,'IE-19','Louth'),(1459,104,'IE-20','Mayo'),(1460,104,'IE-21','Meath'),(1461,104,'IE-22','Monaghan'),(1462,104,'IE-23','Offaly'),(1463,104,'IE-24','Roscommon'),(1464,104,'IE-25','Sligo'),(1465,104,'IE-26','Tipperary'),(1466,104,'IE-27','Waterford'),(1467,104,'IE-29','Westmeath'),(1468,104,'IE-30','Wexford'),(1469,104,'IE-31','Wicklow'),(1470,106,'IL-01','HaDarom'),(1471,106,'IL-02','HaMerkaz'),(1472,106,'IL-03','HaZafon'),(1473,106,'IL-04','Hefa'),(1474,106,'IL-05','Tel Aviv'),(1475,106,'IL-06','Yerushalayim'),(1476,107,'IT-01','Abruzzi'),(1477,107,'IT-02','Basilicata'),(1478,107,'IT-03','Calabria'),(1479,107,'IT-04','Campania'),(1480,107,'IT-05','Emilia-Romagna'),(1481,107,'IT-06','Friuli-Venezia Giulia'),(1482,107,'IT-07','Lazio'),(1483,107,'IT-08','Liguria'),(1484,107,'IT-09','Lombardia'),(1485,107,'IT-10','Marche'),(1486,107,'IT-11','Molise'),(1487,107,'IT-12','Piemonte'),(1488,107,'IT-13','Puglia'),(1489,107,'IT-14','Sardegna'),(1490,107,'IT-15','Sicilia'),(1491,107,'IT-16','Toscana'),(1492,107,'IT-17','Trentino-Alto Adige'),(1493,107,'IT-18','Umbria'),(1494,107,'IT-20','Veneto'),(1495,108,'JM-01','Clarendon'),(1496,108,'JM-02','Hanover'),(1497,108,'JM-17','Kingston'),(1498,108,'JM-04','Manchester'),(1499,108,'JM-07','Portland'),(1500,108,'JM-08','Saint Andrew'),(1501,108,'JM-09','Saint Ann'),(1502,108,'JM-10','Saint Catherine'),(1503,108,'JM-11','Saint Elizabeth'),(1504,108,'JM-12','Saint James'),(1505,108,'JM-13','Saint Mary'),(1506,108,'JM-14','Saint Thomas'),(1507,108,'JM-15','Trelawny'),(1508,108,'JM-16','Westmoreland'),(1509,109,'JP-01','Aichi'),(1510,109,'JP-02','Akita'),(1511,109,'JP-03','Aomori'),(1512,109,'JP-04','Chiba'),(1513,109,'JP-05','Ehime'),(1514,109,'JP-06','Fukui'),(1515,109,'JP-07','Fukuoka'),(1516,109,'JP-08','Fukushima'),(1517,109,'JP-09','Gifu'),(1518,109,'JP-10','Gumma'),(1519,109,'JP-11','Hiroshima'),(1520,109,'JP-12','Hokkaido'),(1521,109,'JP-13','Hyogo'),(1522,109,'JP-14','Ibaraki'),(1523,109,'JP-15','Ishikawa'),(1524,109,'JP-16','Iwate'),(1525,109,'JP-17','Kagawa'),(1526,109,'JP-18','Kagoshima'),(1527,109,'JP-19','Kanagawa'),(1528,109,'JP-20','Kochi'),(1529,109,'JP-21','Kumamoto'),(1530,109,'JP-22','Kyoto'),(1531,109,'JP-23','Mie'),(1532,109,'JP-24','Miyagi'),(1533,109,'JP-25','Miyazaki'),(1534,109,'JP-26','Nagano'),(1535,109,'JP-27','Nagasaki'),(1536,109,'JP-28','Nara'),(1537,109,'JP-29','Niigata'),(1538,109,'JP-30','Oita'),(1539,109,'JP-31','Okayama'),(1540,109,'JP-47','Okinawa'),(1541,109,'JP-32','Osaka'),(1542,109,'JP-33','Saga'),(1543,109,'JP-34','Saitama'),(1544,109,'JP-35','Shiga'),(1545,109,'JP-36','Shimane'),(1546,109,'JP-37','Shizuoka'),(1547,109,'JP-38','Tochigi'),(1548,109,'JP-39','Tokushima'),(1549,109,'JP-40','Tokyo'),(1550,109,'JP-41','Tottori'),(1551,109,'JP-42','Toyama'),(1552,109,'JP-43','Wakayama'),(1553,109,'JP-44','Yamagata'),(1554,109,'JP-45','Yamaguchi'),(1555,109,'JP-46','Yamanashi'),(1556,111,'JO-09','Al Karak'),(1557,111,'JO-10','Al Mafraq'),(1558,111,'JO-16','Amman'),(1559,111,'JO-12','At Tafilah'),(1560,111,'JO-13','Az Zarqa'),(1561,111,'JO-14','Irbid'),(1562,111,'JO-07','Ma'),(1563,112,'KZ-01','Almaty'),(1564,112,'KZ-02','Almaty City'),(1565,112,'KZ-03','Aqmola'),(1566,112,'KZ-05','Astana'),(1567,112,'KZ-06','Atyrau'),(1568,112,'KZ-08','Bayqonyr'),(1569,112,'KZ-15','East Kazakhstan'),(1570,112,'KZ-09','Mangghystau'),(1571,112,'KZ-16','North Kazakhstan'),(1572,112,'KZ-11','Pavlodar'),(1573,112,'KZ-12','Qaraghandy'),(1574,112,'KZ-13','Qostanay'),(1575,112,'KZ-14','Qyzylorda'),(1576,112,'KZ-10','South Kazakhstan'),(1577,112,'KZ-07','West Kazakhstan'),(1578,112,'KZ-17','Zhambyl'),(1579,113,'KE-01','Central'),(1580,113,'KE-02','Coast'),(1581,113,'KE-03','Eastern'),(1582,113,'KE-05','Nairobi Area'),(1583,113,'KE-06','North-Eastern'),(1584,113,'KE-07','Nyanza'),(1585,113,'KE-08','Rift Valley'),(1586,113,'KE-09','Western'),(1587,114,'KI-01','Gilbert Islands'),(1588,114,'KI-02','Line Islands'),(1589,114,'KI-03','Phoenix Islands'),(1590,115,'KP-01','Chagang-do'),(1591,115,'KP-17','Hamgyong-bukto'),(1592,115,'KP-03','Hamgyong-namdo'),(1593,115,'KP-07','Hwanghae-bukto'),(1594,115,'KP-06','Hwanghae-namdo'),(1595,115,'KP-08','Kaesong-si'),(1596,115,'KP-09','Kangwon-do'),(1597,115,'KP-18','Najin Sonbong-si'),(1598,115,'KP-13','Yanggang-do'),(1599,116,'KR-01','Cheju-do'),(1600,116,'KR-03','Cholla-bukto'),(1601,116,'KR-16','Cholla-namdo'),(1602,116,'KR-06','Kangwon-do'),(1603,116,'KR-18','Kwangju-jikhalsi'),(1604,116,'KR-13','Kyonggi-do'),(1605,116,'KR-14','Kyongsang-bukto'),(1606,116,'KR-20','Kyongsang-namdo'),(1607,116,'KR-10','Pusan-jikhalsi'),(1608,116,'KR-15','Taegu-jikhalsi'),(1609,116,'KR-19','Taejon-jikhalsi'),(1610,116,'KR-21','Ulsan-gwangyoksi'),(1611,117,'KW-01','Al Ahmadi'),(1612,117,'KW-05','Al Jahra'),(1613,117,'KW-02','Al Kuwayt'),(1614,117,'KW-03','Hawalli'),(1615,118,'KG-09','Batken'),(1616,118,'KG-01','Bishkek'),(1617,118,'KG-02','Chuy'),(1618,118,'KG-03','Jalal-Abad'),(1619,118,'KG-04','Naryn'),(1620,118,'KG-08','Osh'),(1621,118,'KG-06','Talas'),(1622,118,'KG-07','Ysyk-Kol'),(1623,119,'LA-01','Attapu'),(1624,119,'LA-02','Champasak'),(1625,119,'LA-03','Houaphan'),(1626,119,'LA-04','Khammouan'),(1627,119,'LA-05','Louang Namtha'),(1628,119,'LA-17','Louangphrabang'),(1629,119,'LA-07','Oudomxai'),(1630,119,'LA-08','Phongsali'),(1631,119,'LA-09','Saravan'),(1632,119,'LA-10','Savannakhet'),(1633,119,'LA-11','Vientiane'),(1634,119,'LA-13','Xaignabouri'),(1635,119,'LA-14','Xiangkhoang'),(1636,120,'LV-01','Aizkraukles'),(1637,120,'LV-02','Aluksnes'),(1638,120,'LV-03','Balvu'),(1639,120,'LV-04','Bauskas'),(1640,120,'LV-06','Daugavpils'),(1641,120,'LV-08','Dobeles'),(1642,120,'LV-09','Gulbenes'),(1643,120,'LV-11','Jelgava'),(1644,120,'LV-12','Jelgavas'),(1645,120,'LV-13','Jurmala'),(1646,120,'LV-15','Kuldigas'),(1647,120,'LV-18','Limbazu'),(1648,120,'LV-19','Ludzas'),(1649,120,'LV-20','Madonas'),(1650,120,'LV-21','Ogres'),(1651,120,'LV-22','Preilu'),(1652,120,'LV-25','Riga'),(1653,120,'LV-26','Rigas'),(1654,120,'LV-27','Saldus'),(1655,120,'LV-28','Talsu'),(1656,120,'LV-29','Tukuma'),(1657,120,'LV-30','Valkas'),(1658,120,'LV-31','Valmieras'),(1659,120,'LV-32','Ventspils'),(1660,121,'LB-01','Beqaa'),(1661,121,'LB-04','Beyrouth'),(1662,121,'LB-03','Liban-Nord'),(1663,121,'LB-06','Liban-Sud'),(1664,121,'LB-05','Mont-Liban'),(1665,121,'LB-07','Nabatiye'),(1666,122,'LS-10','Berea'),(1667,122,'LS-11','Butha-Buthe'),(1668,122,'LS-12','Leribe'),(1669,122,'LS-13','Mafeteng'),(1670,122,'LS-14','Maseru'),(1671,122,'LS-15','Mohales Hoek'),(1672,122,'LS-16','Mokhotlong'),(1673,122,'LS-17','Qachas Nek'),(1674,122,'LS-18','Quthing'),(1675,122,'LS-19','Thaba-Tseka'),(1676,123,'LR-01','Bong'),(1677,123,'LR-11','Grand Bassa'),(1678,123,'LR-04','Grand Cape Mount'),(1679,123,'LR-02','Grand Jide'),(1680,123,'LR-05','Lofa'),(1681,123,'LR-06','Maryland'),(1682,123,'LR-07','Monrovia'),(1683,123,'LR-14','Montserrado'),(1684,123,'LR-09','Nimba'),(1685,123,'LR-10','Sino'),(1686,124,'LY-47','Ajdabiya'),(1687,124,'LY-03','Al'),(1688,124,'LY-48','Al Fatih'),(1689,124,'LY-49','Al Jabal al Akhdar'),(1690,124,'LY-05','Al Jufrah'),(1691,124,'LY-50','Al Khums'),(1692,124,'LY-08','Al Kufrah'),(1693,124,'LY-51','An Nuqat al Khams'),(1694,124,'LY-52','Awbari'),(1695,124,'LY-53','Az Zawiyah'),(1696,124,'LY-54','Banghazi'),(1697,124,'LY-55','Darnah'),(1698,124,'LY-56','Ghadamis'),(1699,124,'LY-57','Gharyan'),(1700,124,'LY-58','Misratah'),(1701,124,'LY-30','Murzuq'),(1702,124,'LY-34','Sabha'),(1703,124,'LY-59','Sawfajjin'),(1704,124,'LY-60','Surt'),(1705,124,'LY-61','Tarabulus'),(1706,124,'LY-41','Tarhunah'),(1707,124,'LY-42','Tubruq'),(1708,124,'LY-62','Yafran'),(1709,124,'LY-45','Zlitan'),(1710,125,'LI-01','Balzers'),(1711,125,'LI-02','Eschen'),(1712,125,'LI-03','Gamprin'),(1713,125,'LI-04','Mauren'),(1714,125,'LI-05','Planken'),(1715,125,'LI-06','Ruggell'),(1716,125,'LI-07','Schaan'),(1717,125,'LI-08','Schellenberg'),(1718,125,'LI-09','Triesen'),(1719,125,'LI-10','Triesenberg'),(1720,125,'LI-11','Vaduz'),(1721,126,'LT-56','Alytaus Apskritis'),(1722,126,'LT-57','Kauno Apskritis'),(1723,126,'LT-58','Klaipedos Apskritis'),(1724,126,'LT-59','Marijampoles Apskritis'),(1725,126,'LT-60','Panevezio Apskritis'),(1726,126,'LT-61','Siauliu Apskritis'),(1727,126,'LT-62','Taurages Apskritis'),(1728,126,'LT-63','Telsiu Apskritis'),(1729,126,'LT-64','Utenos Apskritis'),(1730,126,'LT-65','Vilniaus Apskritis'),(1731,127,'LU-01','Diekirch'),(1732,127,'LU-02','Grevenmacher'),(1733,127,'LU-03','Luxembourg'),(1734,128,'MO-01','Ilhas'),(1735,128,'MO-02','Macau'),(1736,129,'MK-01','Aracinovo'),(1737,129,'MK-02','Bac'),(1738,129,'MK-03','Belcista'),(1739,129,'MK-04','Berovo'),(1740,129,'MK-05','Bistrica'),(1741,129,'MK-06','Bitola'),(1742,129,'MK-07','Blatec'),(1743,129,'MK-08','Bogdanci'),(1744,129,'MK-09','Bogomila'),(1745,129,'MK-10','Bogovinje'),(1746,129,'MK-11','Bosilovo'),(1747,129,'MK-12','Brvenica'),(1748,129,'MK-13','Cair'),(1749,129,'MK-14','Capari'),(1750,129,'MK-15','Caska'),(1751,129,'MK-16','Cegrane'),(1752,129,'MK-17','Centar'),(1753,129,'MK-18','Centar Zupa'),(1754,129,'MK-19','Cesinovo'),(1755,129,'MK-20','Cucer-Sandevo'),(1756,129,'MK-21','Debar'),(1757,129,'MK-22','Delcevo'),(1758,129,'MK-23','Delogozdi'),(1759,129,'MK-24','Demir Hisar'),(1760,129,'MK-25','Demir Kapija'),(1761,129,'MK-26','Dobrusevo'),(1762,129,'MK-27','Dolna Banjica'),(1763,129,'MK-28','Dolneni'),(1764,129,'MK-29','Dorce Petrov'),(1765,129,'MK-30','Drugovo'),(1766,129,'MK-31','Dzepciste'),(1767,129,'MK-32','Gazi Baba'),(1768,129,'MK-33','Gevgelija'),(1769,129,'MK-34','Gostivar'),(1770,129,'MK-35','Gradsko'),(1771,129,'MK-36','Ilinden'),(1772,129,'MK-37','Izvor'),(1773,129,'MK-38','Jegunovce'),(1774,129,'MK-39','Kamenjane'),(1775,129,'MK-40','Karbinci'),(1776,129,'MK-41','Karpos'),(1777,129,'MK-42','Kavadarci'),(1778,129,'MK-43','Kicevo'),(1779,129,'MK-44','Kisela Voda'),(1780,129,'MK-45','Klecevce'),(1781,129,'MK-46','Kocani'),(1782,129,'MK-47','Konce'),(1783,129,'MK-48','Kondovo'),(1784,129,'MK-49','Konopiste'),(1785,129,'MK-50','Kosel'),(1786,129,'MK-51','Kratovo'),(1787,129,'MK-52','Kriva Palanka'),(1788,129,'MK-53','Krivogastani'),(1789,129,'MK-54','Krusevo'),(1790,129,'MK-55','Kuklis'),(1791,129,'MK-56','Kukurecani'),(1792,129,'MK-57','Kumanovo'),(1793,129,'MK-58','Labunista'),(1794,129,'MK-59','Lipkovo'),(1795,129,'MK-60','Lozovo'),(1796,129,'MK-61','Lukovo'),(1797,129,'MK-62','Makedonska Kamenica'),(1798,129,'MK-63','Makedonski Brod'),(1799,129,'MK-64','Mavrovi Anovi'),(1800,129,'MK-65','Meseista'),(1801,129,'MK-66','Miravci'),(1802,129,'MK-67','Mogila'),(1803,129,'MK-68','Murtino'),(1804,129,'MK-69','Negotino'),(1805,129,'MK-70','Negotino-Polosko'),(1806,129,'MK-71','Novaci'),(1807,129,'MK-72','Novo Selo'),(1808,129,'MK-73','Oblesevo'),(1809,129,'MK-74','Ohrid'),(1810,129,'MK-75','Orasac'),(1811,129,'MK-76','Orizari'),(1812,129,'MK-77','Oslomej'),(1813,129,'MK-78','Pehcevo'),(1814,129,'MK-79','Petrovec'),(1815,129,'MK-80','Plasnica'),(1816,129,'MK-81','Podares'),(1817,129,'MK-82','Prilep'),(1818,129,'MK-83','Probistip'),(1819,129,'MK-84','Radovis'),(1820,129,'MK-85','Rankovce'),(1821,129,'MK-86','Resen'),(1822,129,'MK-87','Rosoman'),(1823,129,'MK-88','Rostusa'),(1824,129,'MK-89','Samokov'),(1825,129,'MK-90','Saraj'),(1826,129,'MK-91','Sipkovica'),(1827,129,'MK-92','Sopiste'),(1828,129,'MK-93','Sopotnica'),(1829,129,'MK-94','Srbinovo'),(1830,129,'MK-96','Star Dojran'),(1831,129,'MK-95','Staravina'),(1832,129,'MK-97','Staro Nagoricane'),(1833,129,'MK-98','Stip'),(1834,129,'MK-99','Struga'),(1835,129,'MK-A1','Strumica'),(1836,129,'MK-A2','Studenicani'),(1837,129,'MK-A3','Suto Orizari'),(1838,129,'MK-A4','Sveti Nikole'),(1839,129,'MK-A5','Tearce'),(1840,129,'MK-A6','Tetovo'),(1841,129,'MK-A7','Topolcani'),(1842,129,'MK-A8','Valandovo'),(1843,129,'MK-A9','Vasilevo'),(1844,129,'MK-B1','Veles'),(1845,129,'MK-B2','Velesta'),(1846,129,'MK-B3','Vevcani'),(1847,129,'MK-B4','Vinica'),(1848,129,'MK-B5','Vitoliste'),(1849,129,'MK-B6','Vranestica'),(1850,129,'MK-B7','Vrapciste'),(1851,129,'MK-B8','Vratnica'),(1852,129,'MK-B9','Vrutok'),(1853,129,'MK-C1','Zajas'),(1854,129,'MK-C2','Zelenikovo'),(1855,129,'MK-C3','Zelino'),(1856,129,'MK-C4','Zitose'),(1857,129,'MK-C5','Zletovo'),(1858,129,'MK-C6','Zrnovci'),(1859,130,'MG-05','Antananarivo'),(1860,130,'MG-01','Antsiranana'),(1861,130,'MG-02','Fianarantsoa'),(1862,130,'MG-03','Mahajanga'),(1863,130,'MG-04','Toamasina'),(1864,130,'MG-06','Toliara'),(1865,131,'MW-26','Balaka'),(1866,131,'MW-24','Blantyre'),(1867,131,'MW-02','Chikwawa'),(1868,131,'MW-03','Chiradzulu'),(1869,131,'MW-04','Chitipa'),(1870,131,'MW-06','Dedza'),(1871,131,'MW-07','Dowa'),(1872,131,'MW-08','Karonga'),(1873,131,'MW-09','Kasungu'),(1874,131,'MW-27','Likoma'),(1875,131,'MW-11','Lilongwe'),(1876,131,'MW-28','Machinga'),(1877,131,'MW-12','Mangochi'),(1878,131,'MW-13','Mchinji'),(1879,131,'MW-29','Mulanje'),(1880,131,'MW-25','Mwanza'),(1881,131,'MW-15','Mzimba'),(1882,131,'MW-17','Nkhata Bay'),(1883,131,'MW-18','Nkhotakota'),(1884,131,'MW-19','Nsanje'),(1885,131,'MW-16','Ntcheu'),(1886,131,'MW-20','Ntchisi'),(1887,131,'MW-30','Phalombe'),(1888,131,'MW-21','Rumphi'),(1889,131,'MW-22','Salima'),(1890,131,'MW-05','Thyolo'),(1891,131,'MW-23','Zomba'),(1892,132,'MY-01','Johor'),(1893,132,'MY-02','Kedah'),(1894,132,'MY-03','Kelantan'),(1895,132,'MY-15','Labuan'),(1896,132,'MY-04','Melaka'),(1897,132,'MY-05','Negeri Sembilan'),(1898,132,'MY-06','Pahang'),(1899,132,'MY-07','Perak'),(1900,132,'MY-08','Perlis'),(1901,132,'MY-09','Pulau Pinang'),(1902,132,'MY-16','Sabah'),(1903,132,'MY-11','Sarawak'),(1904,132,'MY-12','Selangor'),(1905,132,'MY-13','Terengganu'),(1906,132,'MY-14','Wilayah Persekutuan'),(1907,133,'MV-02','Aliff'),(1908,133,'MV-20','Baa'),(1909,133,'MV-17','Daalu'),(1910,133,'MV-14','Faafu'),(1911,133,'MV-27','Gaafu Aliff'),(1912,133,'MV-28','Gaafu Daalu'),(1913,133,'MV-07','Haa Aliff'),(1914,133,'MV-23','Haa Daalu'),(1915,133,'MV-26','Kaafu'),(1916,133,'MV-05','Laamu'),(1917,133,'MV-03','Laviyani'),(1918,133,'MV-12','Meemu'),(1919,133,'MV-29','Naviyani'),(1920,133,'MV-25','Noonu'),(1921,133,'MV-13','Raa'),(1922,133,'MV-01','Seenu'),(1923,133,'MV-24','Shaviyani'),(1924,133,'MV-08','Thaa'),(1925,133,'MV-04','Waavu'),(1926,134,'ML-01','Bamako'),(1927,134,'ML-09','Gao'),(1928,134,'ML-03','Kayes'),(1929,134,'ML-10','Kidal'),(1930,134,'ML-07','Koulikoro'),(1931,134,'ML-04','Mopti'),(1932,134,'ML-05','Segou'),(1933,134,'ML-06','Sikasso'),(1934,134,'ML-08','Tombouctou'),(1935,138,'MR-07','Adrar'),(1936,138,'MR-03','Assaba'),(1937,138,'MR-05','Brakna'),(1938,138,'MR-08','Dakhlet Nouadhibou'),(1939,138,'MR-04','Gorgol'),(1940,138,'MR-10','Guidimaka'),(1941,138,'MR-01','Hodh Ech Chargui'),(1942,138,'MR-02','Hodh El Gharbi'),(1943,138,'MR-12','Inchiri'),(1944,138,'MR-09','Tagant'),(1945,138,'MR-11','Tiris Zemmour'),(1946,138,'MR-06','Trarza'),(1947,139,'MU-21','Agalega Islands'),(1948,139,'MU-12','Black River'),(1949,139,'MU-22','Cargados Carajos'),(1950,139,'MU-13','Flacq'),(1951,139,'MU-14','Grand Port'),(1952,139,'MU-15','Moka'),(1953,139,'MU-16','Pamplemousses'),(1954,139,'MU-17','Plaines Wilhems'),(1955,139,'MU-18','Port Louis'),(1956,139,'MU-19','Riviere du Rempart'),(1957,139,'MU-23','Rodrigues'),(1958,139,'MU-20','Savanne'),(1959,141,'MX-01','Aguascalientes'),(1960,141,'MX-02','Baja California'),(1961,141,'MX-03','Baja California Sur'),(1962,141,'MX-04','Campeche'),(1963,141,'MX-05','Chiapas'),(1964,141,'MX-06','Chihuahua'),(1965,141,'MX-07','Coahuila de Zaragoza'),(1966,141,'MX-08','Colima'),(1967,141,'MX-09','Distrito Federal'),(1968,141,'MX-10','Durango'),(1969,141,'MX-11','Guanajuato'),(1970,141,'MX-12','Guerrero'),(1971,141,'MX-13','Hidalgo'),(1972,141,'MX-14','Jalisco'),(1973,141,'MX-15','Mexico'),(1974,141,'MX-16','Michoacan de Ocampo'),(1975,141,'MX-17','Morelos'),(1976,141,'MX-18','Nayarit'),(1977,141,'MX-19','Nuevo Leon'),(1978,141,'MX-20','Oaxaca'),(1979,141,'MX-21','Puebla'),(1980,141,'MX-22','Queretaro de Arteaga'),(1981,141,'MX-23','Quintana Roo'),(1982,141,'MX-24','San Luis Potosi'),(1983,141,'MX-25','Sinaloa'),(1984,141,'MX-26','Sonora'),(1985,141,'MX-27','Tabasco'),(1986,141,'MX-28','Tamaulipas'),(1987,141,'MX-29','Tlaxcala'),(1988,141,'MX-30','Veracruz-Llave'),(1989,141,'MX-31','Yucatan'),(1990,141,'MX-32','Zacatecas'),(1991,142,'FM-03','Chuuk'),(1992,142,'FM-01','Kosrae'),(1993,142,'FM-02','Pohnpei'),(1994,142,'FM-04','Yap'),(1995,143,'MD-46','Balti'),(1996,143,'MD-47','Cahul'),(1997,143,'MD-48','Chisinau'),(1998,143,'MD-50','Edinet'),(1999,143,'MD-51','Gagauzia'),(2000,143,'MD-52','Lapusna'),(2001,143,'MD-53','Orhei'),(2002,143,'MD-54','Soroca'),(2003,143,'MD-49','Stinga Nistrului'),(2004,143,'MD-55','Tighina'),(2005,143,'MD-56','Ungheni'),(2006,144,'MC-01','La Condamine'),(2007,144,'MC-02','Monaco'),(2008,144,'MC-03','Monte-Carlo'),(2009,145,'MN-01','Arhangay'),(2010,145,'MN-03','Bayan-Olgiy'),(2011,145,'MN-02','Bayanhongor'),(2012,145,'MN-21','Bulgan'),(2013,145,'MN-05','Darhan'),(2014,145,'MN-23','Darhan Uul'),(2015,145,'MN-06','Dornod'),(2016,145,'MN-07','Dornogovi'),(2017,145,'MN-08','Dundgovi'),(2018,145,'MN-09','Dzavhan'),(2019,145,'MN-22','Erdenet'),(2020,145,'MN-10','Govi-Altay'),(2021,145,'MN-24','Govi-Sumber'),(2022,145,'MN-11','Hentiy'),(2023,145,'MN-12','Hovd'),(2024,145,'MN-13','Hovsgol'),(2025,145,'MN-14','Omnogovi'),(2026,145,'MN-25','Orhon'),(2027,145,'MN-15','Ovorhangay'),(2028,145,'MN-16','Selenge'),(2029,145,'MN-17','Suhbaatar'),(2030,145,'MN-18','Tov'),(2031,145,'MN-20','Ulaanbaatar'),(2032,145,'MN-19','Uvs'),(2033,147,'MS-01','Saint Anthony'),(2034,147,'MS-02','Saint Georges'),(2035,147,'MS-03','Saint Peter'),(2036,148,'MA-01','Agadir'),(2037,148,'MA-02','Al Hoceima'),(2038,148,'MA-03','Azilal'),(2039,148,'MA-04','Ben Slimane'),(2040,148,'MA-05','Beni Mellal'),(2041,148,'MA-06','Boulemane'),(2042,148,'MA-07','Casablanca'),(2043,148,'MA-08','Chaouen'),(2044,148,'MA-09','El Jadida'),(2045,148,'MA-10','El Kelaa des Srarhna'),(2046,148,'MA-11','Er Rachidia'),(2047,148,'MA-12','Essaouira'),(2048,148,'MA-13','Fes'),(2049,148,'MA-14','Figuig'),(2050,148,'MA-33','Guelmim'),(2051,148,'MA-34','Ifrane'),(2052,148,'MA-15','Kenitra'),(2053,148,'MA-16','Khemisset'),(2054,148,'MA-17','Khenifra'),(2055,148,'MA-18','Khouribga'),(2056,148,'MA-35','Laayoune'),(2057,148,'MA-41','Larache'),(2058,148,'MA-19','Marrakech'),(2059,148,'MA-20','Meknes'),(2060,148,'MA-21','Nador'),(2061,148,'MA-22','Ouarzazate'),(2062,148,'MA-23','Oujda'),(2063,148,'MA-24','Rabat-Sale'),(2064,148,'MA-25','Safi'),(2065,148,'MA-26','Settat'),(2066,148,'MA-38','Sidi Kacem'),(2067,148,'MA-36','Tan-Tan'),(2068,148,'MA-27','Tanger'),(2069,148,'MA-37','Taounate'),(2070,148,'MA-39','Taroudannt'),(2071,148,'MA-29','Tata'),(2072,148,'MA-30','Taza'),(2073,148,'MA-40','Tetouan'),(2074,148,'MA-32','Tiznit'),(2075,149,'MZ-01','Cabo Delgado'),(2076,149,'MZ-02','Gaza'),(2077,149,'MZ-03','Inhambane'),(2078,149,'MZ-10','Manica'),(2079,149,'MZ-04','Maputo'),(2080,149,'MZ-06','Nampula'),(2081,149,'MZ-07','Niassa'),(2082,149,'MZ-05','Sofala'),(2083,149,'MZ-08','Tete'),(2084,149,'MZ-09','Zambezia'),(2085,150,'MM-02','Chin State'),(2086,150,'MM-03','Irrawaddy'),(2087,150,'MM-04','Kachin State'),(2088,150,'MM-05','Karan State'),(2089,150,'MM-06','Kayah State'),(2090,150,'MM-07','Magwe'),(2091,150,'MM-08','Mandalay'),(2092,150,'MM-13','Mon State'),(2093,150,'MM-09','Pegu'),(2094,150,'MM-01','Rakhine State'),(2095,150,'MM-14','Rangoon'),(2096,150,'MM-10','Sagaing'),(2097,150,'MM-11','Shan State'),(2098,150,'MM-12','Tenasserim'),(2099,150,'MM-17','Yangon'),(2100,151,'NA-01','Bethanien'),(2101,151,'NA-03','Boesmanland'),(2102,151,'NA-28','Caprivi'),(2103,151,'NA-02','Caprivi Oos'),(2104,151,'NA-22','Damaraland'),(2105,151,'NA-29','Erongo'),(2106,151,'NA-04','Gobabis'),(2107,151,'NA-05','Grootfontein'),(2108,151,'NA-30','Hardap'),(2109,151,'NA-23','Hereroland Oos'),(2110,151,'NA-24','Hereroland Wes'),(2111,151,'NA-06','Kaokoland'),(2112,151,'NA-31','Karas'),(2113,151,'NA-20','Karasburg'),(2114,151,'NA-07','Karibib'),(2115,151,'NA-25','Kavango'),(2116,151,'NA-08','Keetmanshoop'),(2117,151,'NA-32','Kunene'),(2118,151,'NA-09','Luderitz'),(2119,151,'NA-10','Maltahohe'),(2120,151,'NA-26','Mariental'),(2121,151,'NA-27','Namaland'),(2122,151,'NA-33','Ohangwena'),(2123,151,'NA-11','Okahandja'),(2124,151,'NA-34','Okavango'),(2125,151,'NA-35','Omaheke'),(2126,151,'NA-12','Omaruru'),(2127,151,'NA-36','Omusati'),(2128,151,'NA-37','Oshana'),(2129,151,'NA-38','Oshikoto'),(2130,151,'NA-13','Otjiwarongo'),(2131,151,'NA-39','Otjozondjupa'),(2132,151,'NA-14','Outjo'),(2133,151,'NA-15','Owambo'),(2134,151,'NA-16','Rehoboth'),(2135,151,'NA-17','Swakopmund'),(2136,151,'NA-18','Tsumeb'),(2137,151,'NA-21','Windhoek'),(2138,152,'NR-01','Aiwo'),(2139,152,'NR-02','Anabar'),(2140,152,'NR-03','Anetan'),(2141,152,'NR-04','Anibare'),(2142,152,'NR-05','Baiti'),(2143,152,'NR-06','Boe'),(2144,152,'NR-07','Buada'),(2145,152,'NR-08','Denigomodu'),(2146,152,'NR-09','Ewa'),(2147,152,'NR-10','Ijuw'),(2148,152,'NR-11','Meneng'),(2149,152,'NR-12','Nibok'),(2150,152,'NR-13','Uaboe'),(2151,152,'NR-14','Yaren'),(2152,153,'NP-01','Bagmati'),(2153,153,'NP-02','Bheri'),(2154,153,'NP-03','Dhawalagiri'),(2155,153,'NP-04','Gandaki'),(2156,153,'NP-05','Janakpur'),(2157,153,'NP-06','Karnali'),(2158,153,'NP-07','Kosi'),(2159,153,'NP-08','Lumbini'),(2160,153,'NP-09','Mahakali'),(2161,153,'NP-10','Mechi'),(2162,153,'NP-11','Narayani'),(2163,153,'NP-12','Rapti'),(2164,153,'NP-13','Sagarmatha'),(2165,153,'NP-14','Seti'),(2166,154,'NL-01','Drenthe'),(2167,154,'NL-12','Dronten'),(2168,154,'NL-16','Flevoland'),(2169,154,'NL-02','Friesland'),(2170,154,'NL-03','Gelderland'),(2171,154,'NL-04','Groningen'),(2172,154,'NL-14','Lelystad'),(2173,154,'NL-05','Limburg'),(2174,154,'NL-06','Noord-Brabant'),(2175,154,'NL-07','Noord-Holland'),(2176,154,'NL-08','Overijssel'),(2177,154,'NL-09','Utrecht'),(2178,154,'NL-10','Zeeland'),(2179,154,'NL-11','Zuid-Holland'),(2180,154,'NL-13','Zuidelijke IJsselmeerpolders'),(2181,157,'NZ-01','Akaroa'),(2182,157,'NZ-03','Amuri'),(2183,157,'NZ-04','Ashburton'),(2184,157,'NZ-07','Bay of Islands'),(2185,157,'NZ-08','Bruce'),(2186,157,'NZ-09','Buller'),(2187,157,'NZ-10','Chatham Islands'),(2188,157,'NZ-11','Cheviot'),(2189,157,'NZ-12','Clifton'),(2190,157,'NZ-13','Clutha'),(2191,157,'NZ-14','Cook'),(2192,157,'NZ-16','Dannevirke'),(2193,157,'NZ-17','Egmont'),(2194,157,'NZ-18','Eketahuna'),(2195,157,'NZ-19','Ellesmere'),(2196,157,'NZ-20','Eltham'),(2197,157,'NZ-21','Eyre'),(2198,157,'NZ-22','Featherston'),(2199,157,'NZ-24','Franklin'),(2200,157,'NZ-26','Golden Bay'),(2201,157,'NZ-27','Great Barrier Island'),(2202,157,'NZ-28','Grey'),(2203,157,'NZ-29','Hauraki Plains'),(2204,157,'NZ-30','Hawera'),(2205,157,'NZ-32','Heathcote'),(2206,157,'NZ-D9','Hikurangi'),(2207,157,'NZ-33','Hobson'),(2208,157,'NZ-34','Hokianga'),(2209,157,'NZ-35','Horowhenua'),(2210,157,'NZ-D4','Hurunui'),(2211,157,'NZ-36','Hutt'),(2212,157,'NZ-37','Inangahua'),(2213,157,'NZ-38','Inglewood'),(2214,157,'NZ-39','Kaikoura'),(2215,157,'NZ-40','Kairanga'),(2216,157,'NZ-41','Kiwitea'),(2217,157,'NZ-43','Lake'),(2218,157,'NZ-45','Mackenzie'),(2219,157,'NZ-46','Malvern'),(2220,157,'NZ-E1','Manaia'),(2221,157,'NZ-47','Manawatu'),(2222,157,'NZ-48','Mangonui'),(2223,157,'NZ-49','Maniototo'),(2224,157,'NZ-50','Marlborough'),(2225,157,'NZ-51','Masterton'),(2226,157,'NZ-52','Matamata'),(2227,157,'NZ-53','Mount Herbert'),(2228,157,'NZ-54','Ohinemuri'),(2229,157,'NZ-55','Opotiki'),(2230,157,'NZ-56','Oroua'),(2231,157,'NZ-57','Otamatea'),(2232,157,'NZ-58','Otorohanga'),(2233,157,'NZ-59','Oxford'),(2234,157,'NZ-60','Pahiatua'),(2235,157,'NZ-61','Paparua'),(2236,157,'NZ-63','Patea'),(2237,157,'NZ-65','Piako'),(2238,157,'NZ-66','Pohangina'),(2239,157,'NZ-67','Raglan'),(2240,157,'NZ-68','Rangiora'),(2241,157,'NZ-69','Rangitikei'),(2242,157,'NZ-70','Rodney'),(2243,157,'NZ-71','Rotorua'),(2244,157,'NZ-E2','Runanga'),(2245,157,'NZ-E3','Saint Kilda'),(2246,157,'NZ-D5','Silverpeaks'),(2247,157,'NZ-72','Southland'),(2248,157,'NZ-73','Stewart Island'),(2249,157,'NZ-74','Stratford'),(2250,157,'NZ-D6','Strathallan'),(2251,157,'NZ-76','Taranaki'),(2252,157,'NZ-77','Taumarunui'),(2253,157,'NZ-78','Taupo'),(2254,157,'NZ-79','Tauranga'),(2255,157,'NZ-E4','Thames-Coromandel'),(2256,157,'NZ-81','Tuapeka'),(2257,157,'NZ-82','Vincent'),(2258,157,'NZ-83','Waiapu'),(2259,157,'NZ-D8','Waiheke'),(2260,157,'NZ-84','Waihemo'),(2261,157,'NZ-85','Waikato'),(2262,157,'NZ-86','Waikohu'),(2263,157,'NZ-88','Waimairi'),(2264,157,'NZ-89','Waimarino'),(2265,157,'NZ-90','Waimate'),(2266,157,'NZ-91','Waimate West'),(2267,157,'NZ-92','Waimea'),(2268,157,'NZ-93','Waipa'),(2269,157,'NZ-95','Waipawa'),(2270,157,'NZ-96','Waipukurau'),(2271,157,'NZ-97','Wairarapa South'),(2272,157,'NZ-98','Wairewa'),(2273,157,'NZ-99','Wairoa'),(2274,157,'NZ-A4','Waitaki'),(2275,157,'NZ-A6','Waitomo'),(2276,157,'NZ-A8','Waitotara'),(2277,157,'NZ-E6','Wallace'),(2278,157,'NZ-B2','Wanganui'),(2279,157,'NZ-E5','Waverley'),(2280,157,'NZ-B3','Westland'),(2281,157,'NZ-B4','Whakatane'),(2282,157,'NZ-A1','Whangarei'),(2283,157,'NZ-A2','Whangaroa'),(2284,157,'NZ-A3','Woodville'),(2285,158,'NI-01','Boaco'),(2286,158,'NI-02','Carazo'),(2287,158,'NI-03','Chinandega'),(2288,158,'NI-04','Chontales'),(2289,158,'NI-05','Esteli'),(2290,158,'NI-06','Granada'),(2291,158,'NI-07','Jinotega'),(2292,158,'NI-08','Leon'),(2293,158,'NI-09','Madriz'),(2294,158,'NI-10','Managua'),(2295,158,'NI-11','Masaya'),(2296,158,'NI-12','Matagalpa'),(2297,158,'NI-13','Nueva Segovia'),(2298,158,'NI-14','Rio San Juan'),(2299,158,'NI-15','Rivas'),(2300,158,'NI-16','Zelaya'),(2301,159,'NE-01','Agadez'),(2302,159,'NE-02','Diffa'),(2303,159,'NE-03','Dosso'),(2304,159,'NE-04','Maradi'),(2305,159,'NE-05','Niamey'),(2306,159,'NE-06','Tahoua'),(2307,159,'NE-07','Zinder'),(2308,160,'NG-45','Abia'),(2309,160,'NG-11','Abuja Capital Territory'),(2310,160,'NG-35','Adamawa'),(2311,160,'NG-21','Akwa Ibom'),(2312,160,'NG-25','Anambra'),(2313,160,'NG-46','Bauchi'),(2314,160,'NG-52','Bayelsa'),(2315,160,'NG-26','Benue'),(2316,160,'NG-27','Borno'),(2317,160,'NG-22','Cross River'),(2318,160,'NG-36','Delta'),(2319,160,'NG-53','Ebonyi'),(2320,160,'NG-37','Edo'),(2321,160,'NG-54','Ekiti'),(2322,160,'NG-47','Enugu'),(2323,160,'NG-55','Gombe'),(2324,160,'NG-28','Imo'),(2325,160,'NG-39','Jigawa'),(2326,160,'NG-23','Kaduna'),(2327,160,'NG-29','Kano'),(2328,160,'NG-24','Katsina'),(2329,160,'NG-40','Kebbi'),(2330,160,'NG-41','Kogi'),(2331,160,'NG-30','Kwara'),(2332,160,'NG-05','Lagos'),(2333,160,'NG-56','Nassarawa'),(2334,160,'NG-31','Niger'),(2335,160,'NG-16','Ogun'),(2336,160,'NG-48','Ondo'),(2337,160,'NG-42','Osun'),(2338,160,'NG-32','Oyo'),(2339,160,'NG-49','Plateau'),(2340,160,'NG-50','Rivers'),(2341,160,'NG-51','Sokoto'),(2342,160,'NG-43','Taraba'),(2343,160,'NG-44','Yobe'),(2344,160,'NG-57','Zamfara'),(2345,164,'NO-01','Akershus'),(2346,164,'NO-02','Aust-Agder'),(2347,164,'NO-04','Buskerud'),(2348,164,'NO-05','Finnmark'),(2349,164,'NO-06','Hedmark'),(2350,164,'NO-07','Hordaland'),(2351,164,'NO-08','More og Romsdal'),(2352,164,'NO-10','Nord-Trondelag'),(2353,164,'NO-09','Nordland'),(2354,164,'NO-11','Oppland'),(2355,164,'NO-12','Oslo'),(2356,164,'NO-13','Ostfold'),(2357,164,'NO-14','Rogaland'),(2358,164,'NO-15','Sogn og Fjordane'),(2359,164,'NO-16','Sor-Trondelag'),(2360,164,'NO-17','Telemark'),(2361,164,'NO-18','Troms'),(2362,164,'NO-19','Vest-Agder'),(2363,164,'NO-20','Vestfold'),(2364,165,'OM-01','Ad Dakhiliyah'),(2365,165,'OM-02','Al Batinah'),(2366,165,'OM-03','Al Wusta'),(2367,165,'OM-04','Ash Sharqiyah'),(2368,165,'OM-05','Az Zahirah'),(2369,165,'OM-06','Masqat'),(2370,165,'OM-07','Musandam'),(2371,165,'OM-08','Zufar'),(2372,166,'PK-06','Azad Kashmir'),(2373,166,'PK-02','Balochistan'),(2374,166,'PK-01','Federally Administered Tribal Areas'),(2375,166,'PK-08','Islamabad'),(2376,166,'PK-03','North-West Frontier'),(2377,166,'PK-07','Northern Areas'),(2378,166,'PK-04','Punjab'),(2379,166,'PK-05','Sindh'),(2380,169,'PA-01','Bocas del Toro'),(2381,169,'PA-02','Chiriqui'),(2382,169,'PA-03','Cocle'),(2383,169,'PA-04','Colon'),(2384,169,'PA-05','Darien'),(2385,169,'PA-06','Herrera'),(2386,169,'PA-07','Los Santos'),(2387,169,'PA-08','Panama'),(2388,169,'PA-09','San Blas'),(2389,169,'PA-10','Veraguas'),(2390,170,'PG-01','Central'),(2391,170,'PG-08','Chimbu'),(2392,170,'PG-10','East New Britain'),(2393,170,'PG-11','East Sepik'),(2394,170,'PG-09','Eastern Highlands'),(2395,170,'PG-19','Enga'),(2396,170,'PG-02','Gulf'),(2397,170,'PG-12','Madang'),(2398,170,'PG-13','Manus'),(2399,170,'PG-03','Milne Bay'),(2400,170,'PG-14','Morobe'),(2401,170,'PG-20','National Capital'),(2402,170,'PG-15','New Ireland'),(2403,170,'PG-07','North Solomons'),(2404,170,'PG-04','Northern'),(2405,170,'PG-18','Sandaun'),(2406,170,'PG-05','Southern Highlands'),(2407,170,'PG-17','West New Britain'),(2408,170,'PG-06','Western'),(2409,170,'PG-16','Western Highlands'),(2410,171,'PY-23','Alto Paraguay'),(2411,171,'PY-01','Alto Parana'),(2412,171,'PY-02','Amambay'),(2413,171,'PY-03','Boqueron'),(2414,171,'PY-04','Caaguazu'),(2415,171,'PY-05','Caazapa'),(2416,171,'PY-19','Canindeyu'),(2417,171,'PY-06','Central'),(2418,171,'PY-20','Chaco'),(2419,171,'PY-07','Concepcion'),(2420,171,'PY-08','Cordillera'),(2421,171,'PY-10','Guaira'),(2422,171,'PY-11','Itapua'),(2423,171,'PY-12','Misiones'),(2424,171,'PY-13','Neembucu'),(2425,171,'PY-21','Nueva Asuncion'),(2426,171,'PY-15','Paraguari'),(2427,171,'PY-16','Presidente Hayes'),(2428,171,'PY-17','San Pedro'),(2429,172,'PE-01','Amazonas'),(2430,172,'PE-02','Ancash'),(2431,172,'PE-03','Apurimac'),(2432,172,'PE-04','Arequipa'),(2433,172,'PE-05','Ayacucho'),(2434,172,'PE-06','Cajamarca'),(2435,172,'PE-07','Callao'),(2436,172,'PE-08','Cusco'),(2437,172,'PE-09','Huancavelica'),(2438,172,'PE-10','Huanuco'),(2439,172,'PE-11','Ica'),(2440,172,'PE-12','Junin'),(2441,172,'PE-13','La Libertad'),(2442,172,'PE-14','Lambayeque'),(2443,172,'PE-15','Lima'),(2444,172,'PE-16','Loreto'),(2445,172,'PE-17','Madre de Dios'),(2446,172,'PE-18','Moquegua'),(2447,172,'PE-19','Pasco'),(2448,172,'PE-20','Piura'),(2449,172,'PE-21','Puno'),(2450,172,'PE-22','San Martin'),(2451,172,'PE-23','Tacna'),(2452,172,'PE-24','Tumbes'),(2453,172,'PE-25','Ucayali'),(2454,173,'PH-01','Abra'),(2455,173,'PH-02','Agusan del Norte'),(2456,173,'PH-03','Agusan del Sur'),(2457,173,'PH-04','Aklan'),(2458,173,'PH-05','Albay'),(2459,173,'PH-A1','Angeles'),(2460,173,'PH-06','Antique'),(2461,173,'PH-G8','Aurora'),(2462,173,'PH-A2','Bacolod'),(2463,173,'PH-A3','Bago'),(2464,173,'PH-A4','Baguio'),(2465,173,'PH-A5','Bais'),(2466,173,'PH-22','Basilan'),(2467,173,'PH-A6','Basilan City'),(2468,173,'PH-07','Bataan'),(2469,173,'PH-08','Batanes'),(2470,173,'PH-09','Batangas'),(2471,173,'PH-A7','Batangas City'),(2472,173,'PH-10','Benguet'),(2473,173,'PH-11','Bohol'),(2474,173,'PH-12','Bukidnon'),(2475,173,'PH-13','Bulacan'),(2476,173,'PH-A8','Butuan'),(2477,173,'PH-A9','Cabanatuan'),(2478,173,'PH-B1','Cadiz'),(2479,173,'PH-14','Cagayan'),(2480,173,'PH-B2','Cagayan de Oro'),(2481,173,'PH-B3','Calbayog'),(2482,173,'PH-B4','Caloocan'),(2483,173,'PH-15','Camarines Norte'),(2484,173,'PH-16','Camarines Sur'),(2485,173,'PH-17','Camiguin'),(2486,173,'PH-B5','Canlaon'),(2487,173,'PH-18','Capiz'),(2488,173,'PH-19','Catanduanes'),(2489,173,'PH-20','Cavite'),(2490,173,'PH-B6','Cavite City'),(2491,173,'PH-21','Cebu'),(2492,173,'PH-B7','Cebu City'),(2493,173,'PH-B8','Cotabato'),(2494,173,'PH-B9','Dagupan'),(2495,173,'PH-C1','Danao'),(2496,173,'PH-C2','Dapitan'),(2497,173,'PH-24','Davao'),(2498,173,'PH-C3','Davao City'),(2499,173,'PH-25','Davao del Sur'),(2500,173,'PH-26','Davao Oriental'),(2501,173,'PH-C4','Dipolog'),(2502,173,'PH-C5','Dumaguete'),(2503,173,'PH-23','Eastern Samar'),(2504,173,'PH-C6','General Santos'),(2505,173,'PH-C7','Gingoog'),(2506,173,'PH-27','Ifugao'),(2507,173,'PH-C8','Iligan'),(2508,173,'PH-28','Ilocos Norte'),(2509,173,'PH-29','Ilocos Sur'),(2510,173,'PH-30','Iloilo'),(2511,173,'PH-C9','Iloilo City'),(2512,173,'PH-D1','Iriga'),(2513,173,'PH-31','Isabela'),(2514,173,'PH-32','Kalinga-Apayao'),(2515,173,'PH-D2','La Carlota'),(2516,173,'PH-36','La Union'),(2517,173,'PH-33','Laguna'),(2518,173,'PH-34','Lanao del Norte'),(2519,173,'PH-35','Lanao del Sur'),(2520,173,'PH-D3','Laoag'),(2521,173,'PH-D4','Lapu-Lapu'),(2522,173,'PH-D5','Legaspi'),(2523,173,'PH-37','Leyte'),(2524,173,'PH-D6','Lipa'),(2525,173,'PH-D7','Lucena'),(2526,173,'PH-56','Maguindanao'),(2527,173,'PH-D8','Mandaue'),(2528,173,'PH-D9','Manila'),(2529,173,'PH-E1','Marawi'),(2530,173,'PH-38','Marinduque'),(2531,173,'PH-39','Masbate'),(2532,173,'PH-40','Mindoro Occidental'),(2533,173,'PH-41','Mindoro Oriental'),(2534,173,'PH-42','Misamis Occidental'),(2535,173,'PH-43','Misamis Oriental'),(2536,173,'PH-44','Mountain'),(2537,173,'PH-E2','Naga'),(2538,173,'PH-H3','Negros Occidental'),(2539,173,'PH-46','Negros Oriental'),(2540,173,'PH-57','North Cotabato'),(2541,173,'PH-67','Northern Samar'),(2542,173,'PH-47','Nueva Ecija'),(2543,173,'PH-48','Nueva Vizcaya'),(2544,173,'PH-E3','Olongapo'),(2545,173,'PH-E4','Ormoc'),(2546,173,'PH-E5','Oroquieta'),(2547,173,'PH-E6','Ozamis'),(2548,173,'PH-E7','Pagadian'),(2549,173,'PH-49','Palawan'),(2550,173,'PH-E8','Palayan'),(2551,173,'PH-50','Pampanga'),(2552,173,'PH-51','Pangasinan'),(2553,173,'PH-E9','Pasay'),(2554,173,'PH-F1','Puerto Princesa'),(2555,173,'PH-H2','Quezon'),(2556,173,'PH-F2','Quezon City'),(2557,173,'PH-68','Quirino'),(2558,173,'PH-53','Rizal'),(2559,173,'PH-54','Romblon'),(2560,173,'PH-F3','Roxas'),(2561,173,'PH-55','Samar'),(2562,173,'PH-F4','San Carlos'),(2563,173,'PH-F6','San Jose'),(2564,173,'PH-F7','San Pablo'),(2565,173,'PH-F8','Silay'),(2566,173,'PH-69','Siquijor'),(2567,173,'PH-58','Sorsogon'),(2568,173,'PH-70','South Cotabato'),(2569,173,'PH-59','Southern Leyte'),(2570,173,'PH-71','Sultan Kudarat'),(2571,173,'PH-60','Sulu'),(2572,173,'PH-F9','Surigao'),(2573,173,'PH-61','Surigao del Norte'),(2574,173,'PH-62','Surigao del Sur'),(2575,173,'PH-G1','Tacloban'),(2576,173,'PH-G2','Tagaytay'),(2577,173,'PH-G3','Tagbilaran'),(2578,173,'PH-G4','Tangub'),(2579,173,'PH-63','Tarlac'),(2580,173,'PH-72','Tawitawi'),(2581,173,'PH-G5','Toledo'),(2582,173,'PH-G6','Trece Martires'),(2583,173,'PH-64','Zambales'),(2584,173,'PH-G7','Zamboanga'),(2585,173,'PH-65','Zamboanga del Norte'),(2586,173,'PH-66','Zamboanga del Sur'),(2587,175,'PL-23','Biala Podlaska'),(2588,175,'PL-24','Bialystok'),(2589,175,'PL-25','Bielsko'),(2590,175,'PL-26','Bydgoszcz'),(2591,175,'PL-27','Chelm'),(2592,175,'PL-28','Ciechanow'),(2593,175,'PL-29','Czestochowa'),(2594,175,'PL-72','Dolnoslaskie'),(2595,175,'PL-30','Elblag'),(2596,175,'PL-31','Gdansk'),(2597,175,'PL-32','Gorzow'),(2598,175,'PL-33','Jelenia Gora'),(2599,175,'PL-34','Kalisz'),(2600,175,'PL-35','Katowice'),(2601,175,'PL-36','Kielce'),(2602,175,'PL-37','Konin'),(2603,175,'PL-38','Koszalin'),(2604,175,'PL-39','Krakow'),(2605,175,'PL-40','Krosno'),(2606,175,'PL-73','Kujawsko-Pomorskie'),(2607,175,'PL-41','Legnica'),(2608,175,'PL-42','Leszno'),(2609,175,'PL-43','Lodz'),(2610,175,'PL-74','Lodzkie'),(2611,175,'PL-44','Lomza'),(2612,175,'PL-75','Lubelskie'),(2613,175,'PL-45','Lublin'),(2614,175,'PL-76','Lubuskie'),(2615,175,'PL-77','Malopolskie'),(2616,175,'PL-78','Mazowieckie'),(2617,175,'PL-46','Nowy Sacz'),(2618,175,'PL-47','Olsztyn'),(2619,175,'PL-48','Opole'),(2620,175,'PL-79','Opolskie'),(2621,175,'PL-49','Ostroleka'),(2622,175,'PL-50','Pila'),(2623,175,'PL-51','Piotrkow'),(2624,175,'PL-52','Plock'),(2625,175,'PL-80','Podkarpackie'),(2626,175,'PL-81','Podlaskie'),(2627,175,'PL-82','Pomorskie'),(2628,175,'PL-53','Poznan'),(2629,175,'PL-54','Przemysl'),(2630,175,'PL-55','Radom'),(2631,175,'PL-56','Rzeszow'),(2632,175,'PL-57','Siedlce'),(2633,175,'PL-58','Sieradz'),(2634,175,'PL-59','Skierniewice'),(2635,175,'PL-83','Slaskie'),(2636,175,'PL-60','Slupsk'),(2637,175,'PL-61','Suwalki'),(2638,175,'PL-84','Swietokrzyskie'),(2639,175,'PL-62','Szczecin'),(2640,175,'PL-63','Tarnobrzeg'),(2641,175,'PL-64','Tarnow'),(2642,175,'PL-65','Torun'),(2643,175,'PL-66','Walbrzych'),(2644,175,'PL-85','Warminsko-Mazurskie'),(2645,175,'PL-67','Warszawa'),(2646,175,'PL-86','Wielkopolskie'),(2647,175,'PL-68','Wloclawek'),(2648,175,'PL-69','Wroclaw'),(2649,175,'PL-87','Zachodniopomorskie'),(2650,175,'PL-70','Zamosc'),(2651,175,'PL-71','Zielona Gora'),(2652,176,'PT-02','Aveiro'),(2653,176,'PT-23','Azores'),(2654,176,'PT-03','Beja'),(2655,176,'PT-04','Braga'),(2656,176,'PT-05','Braganca'),(2657,176,'PT-06','Castelo Branco'),(2658,176,'PT-07','Coimbra'),(2659,176,'PT-08','Evora'),(2660,176,'PT-09','Faro'),(2661,176,'PT-11','Guarda'),(2662,176,'PT-13','Leiria'),(2663,176,'PT-14','Lisboa'),(2664,176,'PT-10','Madeira'),(2665,176,'PT-16','Portalegre'),(2666,176,'PT-17','Porto'),(2667,176,'PT-18','Santarem'),(2668,176,'PT-19','Setubal'),(2669,176,'PT-20','Viana do Castelo'),(2670,176,'PT-21','Vila Real'),(2671,176,'PT-22','Viseu'),(2672,178,'QA-01','Ad Dawhah'),(2673,178,'QA-02','Al Ghuwariyah'),(2674,178,'QA-03','Al Jumaliyah'),(2675,178,'QA-04','Al Khawr'),(2676,178,'QA-10','Al Wakrah'),(2677,178,'QA-06','Ar Rayyan'),(2678,178,'QA-11','Jariyan al Batnah'),(2679,178,'QA-08','Madinat ach Shamal'),(2680,178,'QA-09','Umm Salal'),(2681,180,'RO-01','Alba'),(2682,180,'RO-02','Arad'),(2683,180,'RO-03','Arges'),(2684,180,'RO-04','Bacau'),(2685,180,'RO-05','Bihor'),(2686,180,'RO-06','Bistrita-Nasaud'),(2687,180,'RO-07','Botosani'),(2688,180,'RO-08','Braila'),(2689,180,'RO-09','Brasov'),(2690,180,'RO-10','Bucuresti'),(2691,180,'RO-11','Buzau'),(2692,180,'RO-41','Calarasi'),(2693,180,'RO-12','Caras-Severin'),(2694,180,'RO-13','Cluj'),(2695,180,'RO-14','Constanta'),(2696,180,'RO-15','Covasna'),(2697,180,'RO-16','Dambovita'),(2698,180,'RO-17','Dolj'),(2699,180,'RO-18','Galati'),(2700,180,'RO-42','Giurgiu'),(2701,180,'RO-19','Gorj'),(2702,180,'RO-20','Harghita'),(2703,180,'RO-21','Hunedoara'),(2704,180,'RO-22','Ialomita'),(2705,180,'RO-23','Iasi'),(2706,180,'RO-43','Ilfov'),(2707,180,'RO-25','Maramures'),(2708,180,'RO-26','Mehedinti'),(2709,180,'RO-27','Mures'),(2710,180,'RO-28','Neamt'),(2711,180,'RO-29','Olt'),(2712,180,'RO-30','Prahova'),(2713,180,'RO-31','Salaj'),(2714,180,'RO-32','Satu Mare'),(2715,180,'RO-33','Sibiu'),(2716,180,'RO-34','Suceava'),(2717,180,'RO-35','Teleorman'),(2718,180,'RO-36','Timis'),(2719,180,'RO-37','Tulcea'),(2720,180,'RO-39','Valcea'),(2721,180,'RO-38','Vaslui'),(2722,180,'RO-40','Vrancea'),(2723,181,'RU-01','Adygeya, Republic of'),(2724,181,'RU-02','Aginsky Buryatsky AO'),(2725,181,'RU-04','Altaisky krai'),(2726,181,'RU-05','Amur'),(2727,181,'RU-08','Bashkortostan'),(2728,181,'RU-09','Belgorod'),(2729,181,'RU-10','Bryansk'),(2730,181,'RU-11','Buryat'),(2731,181,'RU-12','Chechnya'),(2732,181,'RU-13','Chelyabinsk'),(2733,181,'RU-14','Chita'),(2734,181,'RU-15','Chukot'),(2735,181,'RU-16','Chuvashia'),(2736,181,'RU-17','Dagestan'),(2737,181,'RU-18','Evenk'),(2738,181,'RU-03','Gorno-Altay'),(2739,181,'RU-19','Ingush'),(2740,181,'RU-20','Irkutsk'),(2741,181,'RU-21','Ivanovo'),(2742,181,'RU-22','Kabardin-Balkar'),(2743,181,'RU-23','Kaliningrad'),(2744,181,'RU-24','Kalmyk'),(2745,181,'RU-25','Kaluga'),(2746,181,'RU-26','Kamchatka'),(2747,181,'RU-27','Karachay-Cherkess'),(2748,181,'RU-28','Karelia'),(2749,181,'RU-29','Kemerovo'),(2750,181,'RU-30','Khabarovsk'),(2751,181,'RU-31','Khakass'),(2752,181,'RU-32','Khanty-Mansiy'),(2753,181,'RU-33','Kirov'),(2754,181,'RU-34','Komi'),(2755,181,'RU-35','Komi-Permyak'),(2756,181,'RU-36','Koryak'),(2757,181,'RU-37','Kostroma'),(2758,181,'RU-38','Krasnodar'),(2759,181,'RU-39','Krasnoyarsk'),(2760,181,'RU-40','Kurgan'),(2761,181,'RU-41','Kursk'),(2762,181,'RU-42','Leningrad'),(2763,181,'RU-43','Lipetsk'),(2764,181,'RU-44','Magadan'),(2765,181,'RU-45','Mariy-El'),(2766,181,'RU-46','Mordovia'),(2767,181,'RU-48','Moscow City'),(2768,181,'RU-47','Moskva'),(2769,181,'RU-49','Murmansk'),(2770,181,'RU-50','Nenets'),(2771,181,'RU-51','Nizhegorod'),(2772,181,'RU-68','North Ossetia'),(2773,181,'RU-52','Novgorod'),(2774,181,'RU-53','Novosibirsk'),(2775,181,'RU-54','Omsk'),(2776,181,'RU-56','Orel'),(2777,181,'RU-55','Orenburg'),(2778,181,'RU-57','Penza'),(2779,181,'RU-60','Pskov'),(2780,181,'RU-61','Rostov'),(2781,181,'RU-66','Saint Petersburg City'),(2782,181,'RU-63','Sakha'),(2783,181,'RU-64','Sakhalin'),(2784,181,'RU-65','Samara'),(2785,181,'RU-67','Saratov'),(2786,181,'RU-69','Smolensk'),(2787,181,'RU-71','Sverdlovsk'),(2788,181,'RU-72','Tambovskaya oblast'),(2789,181,'RU-73','Tatarstan'),(2790,181,'RU-74','Taymyr'),(2791,181,'RU-75','Tomsk'),(2792,181,'RU-76','Tula'),(2793,181,'RU-79','Tuva'),(2794,181,'RU-80','Udmurt'),(2795,181,'RU-82','Ust-Orda Buryat'),(2796,181,'RU-83','Vladimir'),(2797,181,'RU-84','Volgograd'),(2798,181,'RU-85','Vologda'),(2799,181,'RU-86','Voronezh'),(2800,181,'RU-87','Yamal-Nenets'),(2801,181,'RU-89','Yevrey'),(2802,182,'RW-01','Butare'),(2803,182,'RW-02','Byumba'),(2804,182,'RW-03','Cyangugu'),(2805,182,'RW-04','Gikongoro'),(2806,182,'RW-05','Gisenyi'),(2807,182,'RW-06','Gitarama'),(2808,182,'RW-07','Kibungo'),(2809,182,'RW-08','Kibuye'),(2810,182,'RW-09','Kigali'),(2811,182,'RW-10','Ruhengeri'),(2812,184,'SH-01','Ascension'),(2813,184,'SH-02','Saint Helena'),(2814,184,'SH-03','Tristan da Cunha'),(2815,185,'KN-01','Christ Church Nichola Town'),(2816,185,'KN-02','Saint Anne Sandy Point'),(2817,185,'KN-03','Saint George Basseterre'),(2818,185,'KN-04','Saint George Gingerland'),(2819,185,'KN-05','Saint James Windward'),(2820,185,'KN-06','Saint John Capisterre'),(2821,185,'KN-07','Saint John Figtree'),(2822,185,'KN-08','Saint Mary Cayon'),(2823,185,'KN-09','Saint Paul Capisterre'),(2824,185,'KN-10','Saint Paul Charlestown'),(2825,185,'KN-11','Saint Peter Basseterre'),(2826,185,'KN-12','Saint Thomas Lowland'),(2827,185,'KN-13','Saint Thomas Middle Island'),(2828,185,'KN-15','Trinity Palmetto Point'),(2829,186,'LC-01','Anse-la-Raye'),(2830,186,'LC-03','Castries'),(2831,186,'LC-04','Choiseul'),(2832,186,'LC-02','Dauphin'),(2833,186,'LC-05','Dennery'),(2834,186,'LC-06','Gros-Islet'),(2835,186,'LC-07','Laborie'),(2836,186,'LC-08','Micoud'),(2837,186,'LC-11','Praslin'),(2838,186,'LC-09','Soufriere'),(2839,186,'LC-10','Vieux-Fort'),(2840,189,'VC-01','Charlotte'),(2841,189,'VC-06','Grenadines'),(2842,189,'VC-02','Saint Andrew'),(2843,189,'VC-03','Saint David'),(2844,189,'VC-04','Saint George'),(2845,189,'VC-05','Saint Patrick'),(2846,190,'WS-02','Aiga-i-le-Tai'),(2847,190,'WS-03','Atua'),(2848,190,'WS-04','Fa'),(2849,190,'WS-05','Gaga'),(2850,190,'WS-07','Gagaifomauga'),(2851,190,'WS-08','Palauli'),(2852,190,'WS-09','Satupa'),(2853,190,'WS-10','Tuamasaga'),(2854,190,'WS-06','Va'),(2855,190,'WS-11','Vaisigano'),(2856,191,'SM-01','Acquaviva'),(2857,191,'SM-06','Borgo Maggiore'),(2858,191,'SM-02','Chiesanuova'),(2859,191,'SM-03','Domagnano'),(2860,191,'SM-04','Faetano'),(2861,191,'SM-05','Fiorentino'),(2862,191,'SM-08','Monte Giardino'),(2863,191,'SM-07','San Marino'),(2864,191,'SM-09','Serravalle'),(2865,192,'ST-01','Principe'),(2866,192,'ST-02','Sao Tome'),(2867,193,'SA-02','Al Bahah'),(2868,193,'SA-15','Al Hudud ash Shamaliyah'),(2869,193,'SA-03','Al Jawf'),(2870,193,'SA-05','Al Madinah'),(2871,193,'SA-08','Al Qasim'),(2872,193,'SA-09','Al Qurayyat'),(2873,193,'SA-10','Ar Riyad'),(2874,193,'SA-06','Ash Sharqiyah'),(2875,193,'SA-17','Jizan'),(2876,193,'SA-14','Makkah'),(2877,193,'SA-16','Najran'),(2878,193,'SA-19','Tabuk'),(2879,194,'SN-01','Dakar'),(2880,194,'SN-03','Diourbel'),(2881,194,'SN-09','Fatick'),(2882,194,'SN-10','Kaolack'),(2883,194,'SN-11','Kolda'),(2884,194,'SN-08','Louga'),(2885,194,'SN-04','Saint-Louis'),(2886,194,'SN-05','Tambacounda'),(2887,194,'SN-07','Thies'),(2888,194,'SN-12','Ziguinchor'),(2889,196,'SC-01','Anse aux Pins'),(2890,196,'SC-02','Anse Boileau'),(2891,196,'SC-03','Anse Etoile'),(2892,196,'SC-04','Anse Louis'),(2893,196,'SC-05','Anse Royale'),(2894,196,'SC-06','Baie Lazare'),(2895,196,'SC-07','Baie Sainte Anne'),(2896,196,'SC-08','Beau Vallon'),(2897,196,'SC-09','Bel Air'),(2898,196,'SC-10','Bel Ombre'),(2899,196,'SC-11','Cascade'),(2900,196,'SC-12','Glacis'),(2901,196,'SC-15','La Digue'),(2902,196,'SC-16','La Riviere Anglaise'),(2903,196,'SC-17','Mont Buxton'),(2904,196,'SC-18','Mont Fleuri'),(2905,196,'SC-19','Plaisance'),(2906,196,'SC-20','Pointe La Rue'),(2907,196,'SC-21','Port Glaud'),(2908,196,'SC-22','Saint Louis'),(2909,196,'SC-23','Takamaka'),(2910,197,'SL-01','Eastern'),(2911,197,'SL-02','Northern'),(2912,197,'SL-03','Southern'),(2913,197,'SL-04','Western Area'),(2914,199,'SK-01','Banska Bystrica'),(2915,199,'SK-02','Bratislava'),(2916,199,'SK-03','Kosice'),(2917,199,'SK-04','Nitra'),(2918,199,'SK-05','Presov'),(2919,199,'SK-06','Trencin'),(2920,199,'SK-07','Trnava'),(2921,199,'SK-08','Zilina'),(2922,200,'SI-01','Ajdovscina'),(2923,200,'SI-02','Beltinci'),(2924,200,'SI-03','Bled'),(2925,200,'SI-04','Bohinj'),(2926,200,'SI-05','Borovnica'),(2927,200,'SI-06','Bovec'),(2928,200,'SI-07','Brda'),(2929,200,'SI-08','Brezice'),(2930,200,'SI-09','Brezovica'),(2931,200,'SI-11','Celje'),(2932,200,'SI-12','Cerklje na Gorenjskem'),(2933,200,'SI-13','Cerknica'),(2934,200,'SI-14','Cerkno'),(2935,200,'SI-15','Crensovci'),(2936,200,'SI-16','Crna na Koroskem'),(2937,200,'SI-17','Crnomelj'),(2938,200,'SI-19','Divaca'),(2939,200,'SI-20','Dobrepolje'),(2940,200,'SI-G4','Dobrova-Horjul-Polhov Gradec'),(2941,200,'SI-22','Dol pri Ljubljani'),(2942,200,'SI-G7','Domzale'),(2943,200,'SI-24','Dornava'),(2944,200,'SI-25','Dravograd'),(2945,200,'SI-26','Duplek'),(2946,200,'SI-27','Gorenja Vas-Poljane'),(2947,200,'SI-28','Gorisnica'),(2948,200,'SI-29','Gornja Radgona'),(2949,200,'SI-30','Gornji Grad'),(2950,200,'SI-31','Gornji Petrovci'),(2951,200,'SI-32','Grosuplje'),(2952,200,'SI-34','Hrastnik'),(2953,200,'SI-35','Hrpelje-Kozina'),(2954,200,'SI-36','Idrija'),(2955,200,'SI-37','Ig'),(2956,200,'SI-38','Ilirska Bistrica'),(2957,200,'SI-39','Ivancna Gorica'),(2958,200,'SI-40','Izola-Isola'),(2959,200,'SI-H4','Jesenice'),(2960,200,'SI-42','Jursinci'),(2961,200,'SI-H6','Kamnik'),(2962,200,'SI-44','Kanal'),(2963,200,'SI-45','Kidricevo'),(2964,200,'SI-46','Kobarid'),(2965,200,'SI-47','Kobilje'),(2966,200,'SI-H7','Kocevje'),(2967,200,'SI-49','Komen'),(2968,200,'SI-50','Koper-Capodistria'),(2969,200,'SI-51','Kozje'),(2970,200,'SI-52','Kranj'),(2971,200,'SI-53','Kranjska Gora'),(2972,200,'SI-54','Krsko'),(2973,200,'SI-55','Kungota'),(2974,200,'SI-I2','Kuzma'),(2975,200,'SI-57','Lasko'),(2976,200,'SI-I3','Lenart'),(2977,200,'SI-I5','Litija'),(2978,200,'SI-61','Ljubljana'),(2979,200,'SI-62','Ljubno'),(2980,200,'SI-I6','Ljutomer'),(2981,200,'SI-64','Logatec'),(2982,200,'SI-I7','Loska Dolina'),(2983,200,'SI-66','Loski Potok'),(2984,200,'SI-I9','Luce'),(2985,200,'SI-68','Lukovica'),(2986,200,'SI-J1','Majsperk'),(2987,200,'SI-J2','Maribor'),(2988,200,'SI-71','Medvode'),(2989,200,'SI-72','Menges'),(2990,200,'SI-73','Metlika'),(2991,200,'SI-74','Mezica'),(2992,200,'SI-J5','Miren-Kostanjevica'),(2993,200,'SI-76','Mislinja'),(2994,200,'SI-77','Moravce'),(2995,200,'SI-78','Moravske Toplice'),(2996,200,'SI-79','Mozirje'),(2997,200,'SI-80','Murska Sobota'),(2998,200,'SI-81','Muta'),(2999,200,'SI-82','Naklo'),(3000,200,'SI-83','Nazarje'),(3001,200,'SI-84','Nova Gorica'),(3002,200,'SI-J7','Novo Mesto'),(3003,200,'SI-86','Odranci'),(3004,200,'SI-87','Ormoz'),(3005,200,'SI-88','Osilnica'),(3006,200,'SI-89','Pesnica'),(3007,200,'SI-J9','Piran'),(3008,200,'SI-91','Pivka'),(3009,200,'SI-92','Podcetrtek'),(3010,200,'SI-94','Postojna'),(3011,200,'SI-K5','Preddvor'),(3012,200,'SI-K7','Ptuj'),(3013,200,'SI-97','Puconci'),(3014,200,'SI-98','Racam'),(3015,200,'SI-99','Radece'),(3016,200,'SI-A1','Radenci'),(3017,200,'SI-A2','Radlje ob Dravi'),(3018,200,'SI-A3','Radovljica'),(3019,200,'SI-L1','Ribnica'),(3020,200,'SI-A7','Rogaska Slatina'),(3021,200,'SI-A6','Rogasovci'),(3022,200,'SI-A8','Rogatec'),(3023,200,'SI-L3','Ruse'),(3024,200,'SI-B1','Semic'),(3025,200,'SI-B2','Sencur'),(3026,200,'SI-B3','Sentilj'),(3027,200,'SI-B4','Sentjernej'),(3028,200,'SI-L7','Sentjur pri Celju'),(3029,200,'SI-B6','Sevnica'),(3030,200,'SI-B7','Sezana'),(3031,200,'SI-B8','Skocjan'),(3032,200,'SI-B9','Skofja Loka'),(3033,200,'SI-C1','Skofljica'),(3034,200,'SI-C2','Slovenj Gradec'),(3035,200,'SI-L8','Slovenska Bistrica'),(3036,200,'SI-C4','Slovenske Konjice'),(3037,200,'SI-C5','Smarje pri Jelsah'),(3038,200,'SI-C6','Smartno ob Paki'),(3039,200,'SI-C7','Sostanj'),(3040,200,'SI-C8','Starse'),(3041,200,'SI-C9','Store'),(3042,200,'SI-D1','Sveti Jurij'),(3043,200,'SI-D2','Tolmin'),(3044,200,'SI-D3','Trbovlje'),(3045,200,'SI-D4','Trebnje'),(3046,200,'SI-D5','Trzic'),(3047,200,'SI-D6','Turnisce'),(3048,200,'SI-D7','Velenje'),(3049,200,'SI-D8','Velike Lasce'),(3050,200,'SI-N2','Videm'),(3051,200,'SI-E1','Vipava'),(3052,200,'SI-E2','Vitanje'),(3053,200,'SI-E3','Vodice'),(3054,200,'SI-N3','Vojnik'),(3055,200,'SI-E5','Vrhnika'),(3056,200,'SI-E6','Vuzenica'),(3057,200,'SI-E7','Zagorje ob Savi'),(3058,200,'SI-N5','Zalec'),(3059,200,'SI-E9','Zavrc'),(3060,200,'SI-F1','Zelezniki'),(3061,200,'SI-F2','Ziri'),(3062,200,'SI-F3','Zrece'),(3063,201,'SB-05','Central'),(3064,201,'SB-06','Guadalcanal'),(3065,201,'SB-07','Isabel'),(3066,201,'SB-08','Makira'),(3067,201,'SB-03','Malaita'),(3068,201,'SB-09','Temotu'),(3069,201,'SB-04','Western'),(3070,202,'SO-01','Bakool'),(3071,202,'SO-02','Banaadir'),(3072,202,'SO-03','Bari'),(3073,202,'SO-04','Bay'),(3074,202,'SO-05','Galguduud'),(3075,202,'SO-06','Gedo'),(3076,202,'SO-07','Hiiraan'),(3077,202,'SO-08','Jubbada Dhexe'),(3078,202,'SO-09','Jubbada Hoose'),(3079,202,'SO-10','Mudug'),(3080,202,'SO-11','Nugaal'),(3081,202,'SO-12','Sanaag'),(3082,202,'SO-13','Shabeellaha Dhexe'),(3083,202,'SO-14','Shabeellaha Hoose'),(3084,202,'SO-15','Togdheer'),(3085,202,'SO-16','Woqooyi Galbeed'),(3086,203,'ZA-05','Eastern Cape'),(3087,203,'ZA-03','Free State'),(3088,203,'ZA-06','Gauteng'),(3089,203,'ZA-02','KwaZulu-Natal'),(3090,203,'ZA-09','Limpopo'),(3091,203,'ZA-07','Mpumalanga'),(3092,203,'ZA-10','North-West'),(3093,203,'ZA-08','Northern Cape'),(3094,203,'ZA-11','Western Cape'),(3095,205,'ES-51','Andalucia'),(3096,205,'ES-52','Aragon'),(3097,205,'ES-34','Asturias'),(3098,205,'ES-53','Canarias'),(3099,205,'ES-39','Cantabria'),(3100,205,'ES-55','Castilla y Leon'),(3101,205,'ES-54','Castilla-La Mancha'),(3102,205,'ES-56','Catalonia'),(3103,205,'ES-60','Comunidad Valenciana'),(3104,205,'ES-57','Extremadura'),(3105,205,'ES-58','Galicia'),(3106,205,'ES-07','Islas Baleares'),(3107,205,'ES-27','La Rioja'),(3108,205,'ES-29','Madrid'),(3109,205,'ES-31','Murcia'),(3110,205,'ES-32','Navarra'),(3111,205,'ES-59','Pais Vasco'),(3112,206,'LK-01','Amparai'),(3113,206,'LK-02','Anuradhapura'),(3114,206,'LK-03','Badulla'),(3115,206,'LK-04','Batticaloa'),(3116,206,'LK-23','Colombo'),(3117,206,'LK-06','Galle'),(3118,206,'LK-24','Gampaha'),(3119,206,'LK-07','Hambantota'),(3120,206,'LK-25','Jaffna'),(3121,206,'LK-09','Kalutara'),(3122,206,'LK-10','Kandy'),(3123,206,'LK-11','Kegalla'),(3124,206,'LK-12','Kurunegala'),(3125,206,'LK-26','Mannar'),(3126,206,'LK-14','Matale'),(3127,206,'LK-15','Matara'),(3128,206,'LK-16','Moneragala'),(3129,206,'LK-27','Mullaittivu'),(3130,206,'LK-17','Nuwara Eliya'),(3131,206,'LK-18','Polonnaruwa'),(3132,206,'LK-19','Puttalam'),(3133,206,'LK-20','Ratnapura'),(3134,206,'LK-21','Trincomalee'),(3135,206,'LK-28','Vavuniya'),(3136,207,'SD-29','Al Khartum'),(3137,207,'SD-27','Al Wusta'),(3138,207,'SD-30','Ash Shamaliyah'),(3139,207,'SD-31','Ash Sharqiyah'),(3140,207,'SD-32','Bahr al Ghazal'),(3141,207,'SD-33','Darfur'),(3142,207,'SD-34','Kurdufan'),(3143,208,'SR-10','Brokopondo'),(3144,208,'SR-11','Commewijne'),(3145,208,'SR-12','Coronie'),(3146,208,'SR-13','Marowijne'),(3147,208,'SR-14','Nickerie'),(3148,208,'SR-15','Para'),(3149,208,'SR-16','Paramaribo'),(3150,208,'SR-17','Saramacca'),(3151,208,'SR-18','Sipaliwini'),(3152,208,'SR-19','Wanica'),(3153,210,'SZ-01','Hhohho'),(3154,210,'SZ-02','Lubombo'),(3155,210,'SZ-03','Manzini'),(3156,210,'SZ-05','Praslin'),(3157,210,'SZ-04','Shiselweni'),(3158,211,'SE-01','Alvsborgs Lan'),(3159,211,'SE-02','Blekinge Lan'),(3160,211,'SE-10','Dalarnas Lan'),(3161,211,'SE-03','Gavleborgs Lan'),(3162,211,'SE-04','Goteborgs och Bohus Lan'),(3163,211,'SE-05','Gotlands Lan'),(3164,211,'SE-06','Hallands Lan'),(3165,211,'SE-07','Jamtlands Lan'),(3166,211,'SE-08','Jonkopings Lan'),(3167,211,'SE-09','Kalmar Lan'),(3168,211,'SE-11','Kristianstads Lan'),(3169,211,'SE-12','Kronobergs Lan'),(3170,211,'SE-13','Malmohus Lan'),(3171,211,'SE-14','Norrbottens Lan'),(3172,211,'SE-15','Orebro Lan'),(3173,211,'SE-16','Ostergotlands Lan'),(3174,211,'SE-27','Skane Lan'),(3175,211,'SE-17','Skaraborgs Lan'),(3176,211,'SE-18','Sodermanlands Lan'),(3177,211,'SE-26','Stockholms Lan'),(3178,211,'SE-21','Uppsala Lan'),(3179,211,'SE-22','Varmlands Lan'),(3180,211,'SE-23','Vasterbottens Lan'),(3181,211,'SE-24','Vasternorrlands Lan'),(3182,211,'SE-25','Vastmanlands Lan'),(3183,211,'SE-28','Vastra Gotaland'),(3184,212,'CH-01','Aargau'),(3185,212,'CH-02','Ausser-Rhoden'),(3186,212,'CH-03','Basel-Landschaft'),(3187,212,'CH-04','Basel-Stadt'),(3188,212,'CH-05','Bern'),(3189,212,'CH-06','Fribourg'),(3190,212,'CH-07','Geneve'),(3191,212,'CH-08','Glarus'),(3192,212,'CH-09','Graubunden'),(3193,212,'CH-10','Inner-Rhoden'),(3194,212,'CH-26','Jura'),(3195,212,'CH-11','Luzern'),(3196,212,'CH-12','Neuchatel'),(3197,212,'CH-13','Nidwalden'),(3198,212,'CH-14','Obwalden'),(3199,212,'CH-15','Sankt Gallen'),(3200,212,'CH-16','Schaffhausen'),(3201,212,'CH-17','Schwyz'),(3202,212,'CH-18','Solothurn'),(3203,212,'CH-19','Thurgau'),(3204,212,'CH-20','Ticino'),(3205,212,'CH-21','Uri'),(3206,212,'CH-22','Valais'),(3207,212,'CH-23','Vaud'),(3208,212,'CH-24','Zug'),(3209,212,'CH-25','Zurich'),(3210,213,'SY-01','Al Hasakah'),(3211,213,'SY-02','Al Ladhiqiyah'),(3212,213,'SY-03','Al Qunaytirah'),(3213,213,'SY-04','Ar Raqqah'),(3214,213,'SY-06','Dar'),(3215,213,'SY-07','Dayr az Zawr'),(3216,213,'SY-13','Dimashq'),(3217,213,'SY-09','Halab'),(3218,213,'SY-10','Hamah'),(3219,213,'SY-11','Hims'),(3220,213,'SY-12','Idlib'),(3221,213,'SY-08','Rif Dimashq'),(3222,213,'SY-14','Tartus'),(3223,214,'TW-01','Fu-chien'),(3224,214,'TW-02','Kao-hsiung'),(3225,215,'TJ-02','Khatlon'),(3226,215,'TJ-01','Kuhistoni Badakhshon'),(3227,215,'TJ-03','Sughd'),(3228,216,'TZ-01','Arusha'),(3229,216,'TZ-23','Dar es Salaam'),(3230,216,'TZ-03','Dodoma'),(3231,216,'TZ-04','Iringa'),(3232,216,'TZ-19','Kagera'),(3233,216,'TZ-05','Kigoma'),(3234,216,'TZ-06','Kilimanjaro'),(3235,216,'TZ-07','Lindi'),(3236,216,'TZ-08','Mara'),(3237,216,'TZ-09','Mbeya'),(3238,216,'TZ-10','Morogoro'),(3239,216,'TZ-11','Mtwara'),(3240,216,'TZ-12','Mwanza'),(3241,216,'TZ-13','Pemba North'),(3242,216,'TZ-20','Pemba South'),(3243,216,'TZ-02','Pwani'),(3244,216,'TZ-24','Rukwa'),(3245,216,'TZ-14','Ruvuma'),(3246,216,'TZ-15','Shinyanga'),(3247,216,'TZ-16','Singida'),(3248,216,'TZ-17','Tabora'),(3249,216,'TZ-18','Tanga'),(3250,216,'TZ-21','Zanzibar Central'),(3251,216,'TZ-22','Zanzibar North'),(3252,216,'TZ-25','Zanzibar Urban'),(3253,217,'TH-35','Ang Thong'),(3254,217,'TH-28','Buriram'),(3255,217,'TH-44','Chachoengsao'),(3256,217,'TH-32','Chai Nat'),(3257,217,'TH-26','Chaiyaphum'),(3258,217,'TH-48','Chanthaburi'),(3259,217,'TH-02','Chiang Mai'),(3260,217,'TH-03','Chiang Rai'),(3261,217,'TH-46','Chon Buri'),(3262,217,'TH-58','Chumphon'),(3263,217,'TH-23','Kalasin'),(3264,217,'TH-11','Kamphaeng Phet'),(3265,217,'TH-50','Kanchanaburi'),(3266,217,'TH-22','Khon Kaen'),(3267,217,'TH-63','Krabi'),(3268,217,'TH-40','Krung Thep'),(3269,217,'TH-06','Lampang'),(3270,217,'TH-05','Lamphun'),(3271,217,'TH-18','Loei'),(3272,217,'TH-34','Lop Buri'),(3273,217,'TH-01','Mae Hong Son'),(3274,217,'TH-24','Maha Sarakham'),(3275,217,'TH-78','Mukdahan'),(3276,217,'TH-43','Nakhon Nayok'),(3277,217,'TH-53','Nakhon Pathom'),(3278,217,'TH-21','Nakhon Phanom'),(3279,217,'TH-27','Nakhon Ratchasima'),(3280,217,'TH-16','Nakhon Sawan'),(3281,217,'TH-64','Nakhon Si Thammarat'),(3282,217,'TH-04','Nan'),(3283,217,'TH-31','Narathiwat'),(3284,217,'TH-17','Nong Khai'),(3285,217,'TH-38','Nonthaburi'),(3286,217,'TH-39','Pathum Thani'),(3287,217,'TH-69','Pattani'),(3288,217,'TH-61','Phangnga'),(3289,217,'TH-66','Phatthalung'),(3290,217,'TH-41','Phayao'),(3291,217,'TH-14','Phetchabun'),(3292,217,'TH-56','Phetchaburi'),(3293,217,'TH-13','Phichit'),(3294,217,'TH-12','Phitsanulok'),(3295,217,'TH-36','Phra Nakhon Si Ayutthaya'),(3296,217,'TH-07','Phrae'),(3297,217,'TH-62','Phuket'),(3298,217,'TH-45','Prachin Buri'),(3299,217,'TH-57','Prachuap Khiri Khan'),(3300,217,'TH-59','Ranong'),(3301,217,'TH-52','Ratchaburi'),(3302,217,'TH-47','Rayong'),(3303,217,'TH-25','Roi Et'),(3304,217,'TH-20','Sakon Nakhon'),(3305,217,'TH-42','Samut Prakan'),(3306,217,'TH-55','Samut Sakhon'),(3307,217,'TH-54','Samut Songkhram'),(3308,217,'TH-37','Saraburi'),(3309,217,'TH-67','Satun'),(3310,217,'TH-33','Sing Buri'),(3311,217,'TH-30','Sisaket'),(3312,217,'TH-68','Songkhla'),(3313,217,'TH-09','Sukhothai'),(3314,217,'TH-51','Suphan Buri'),(3315,217,'TH-60','Surat Thani'),(3316,217,'TH-29','Surin'),(3317,217,'TH-08','Tak'),(3318,217,'TH-65','Trang'),(3319,217,'TH-49','Trat'),(3320,217,'TH-75','Ubon Ratchathani'),(3321,217,'TH-76','Udon Thani'),(3322,217,'TH-15','Uthai Thani'),(3323,217,'TH-10','Uttaradit'),(3324,217,'TH-70','Yala'),(3325,217,'TH-72','Yasothon'),(3326,219,'TG-01','Amlame'),(3327,219,'TG-02','Aneho'),(3328,219,'TG-03','Atakpame'),(3329,219,'TG-15','Badou'),(3330,219,'TG-04','Bafilo'),(3331,219,'TG-05','Bassar'),(3332,219,'TG-06','Dapaong'),(3333,219,'TG-07','Kante'),(3334,219,'TG-08','Klouto'),(3335,219,'TG-14','Kpagouda'),(3336,219,'TG-09','Lama-Kara'),(3337,219,'TG-10','Lome'),(3338,219,'TG-11','Mango'),(3339,219,'TG-12','Niamtougou'),(3340,219,'TG-13','Notse'),(3341,219,'TG-16','Sotouboua'),(3342,219,'TG-17','Tabligbo'),(3343,219,'TG-19','Tchamba'),(3344,219,'TG-20','Tchaoudjo'),(3345,219,'TG-18','Tsevie'),(3346,219,'TG-21','Vogan'),(3347,221,'TO-01','Ha'),(3348,221,'TO-02','Tongatapu'),(3349,221,'TO-03','Vava'),(3350,222,'TT-01','Arima'),(3351,222,'TT-02','Caroni'),(3352,222,'TT-03','Mayaro'),(3353,222,'TT-04','Nariva'),(3354,222,'TT-05','Port-of-Spain'),(3355,222,'TT-06','Saint Andrew'),(3356,222,'TT-07','Saint David'),(3357,222,'TT-08','Saint George'),(3358,222,'TT-09','Saint Patrick'),(3359,222,'TT-10','San Fernando'),(3360,222,'TT-11','Tobago'),(3361,222,'TT-12','Victoria'),(3362,223,'TN-15','Al Mahdiyah'),(3363,223,'TN-16','Al Munastir'),(3364,223,'TN-02','Al Qasrayn'),(3365,223,'TN-03','Al Qayrawan'),(3366,223,'TN-38','Ariana'),(3367,223,'TN-17','Bajah'),(3368,223,'TN-18','Banzart'),(3369,223,'TN-27','Bin'),(3370,223,'TN-06','Jundubah'),(3371,223,'TN-14','Kef'),(3372,223,'TN-28','Madanin'),(3373,223,'TN-39','Manouba'),(3374,223,'TN-19','Nabul'),(3375,223,'TN-29','Qabis'),(3376,223,'TN-10','Qafsah'),(3377,223,'TN-31','Qibili'),(3378,223,'TN-32','Safaqis'),(3379,223,'TN-33','Sidi Bu Zayd'),(3380,223,'TN-22','Silyanah'),(3381,223,'TN-23','Susah'),(3382,223,'TN-34','Tatawin'),(3383,223,'TN-35','Tawzar'),(3384,223,'TN-36','Tunis'),(3385,223,'TN-37','Zaghwan'),(3386,224,'TR-81','Adana'),(3387,224,'TR-02','Adiyaman'),(3388,224,'TR-03','Afyon'),(3389,224,'TR-04','Agri'),(3390,224,'TR-75','Aksaray'),(3391,224,'TR-05','Amasya'),(3392,224,'TR-68','Ankara'),(3393,224,'TR-07','Antalya'),(3394,224,'TR-86','Ardahan'),(3395,224,'TR-08','Artvin'),(3396,224,'TR-09','Aydin'),(3397,224,'TR-10','Balikesir'),(3398,224,'TR-87','Bartin'),(3399,224,'TR-76','Batman'),(3400,224,'TR-77','Bayburt'),(3401,224,'TR-11','Bilecik'),(3402,224,'TR-12','Bingol'),(3403,224,'TR-13','Bitlis'),(3404,224,'TR-14','Bolu'),(3405,224,'TR-15','Burdur'),(3406,224,'TR-16','Bursa'),(3407,224,'TR-17','Canakkale'),(3408,224,'TR-82','Cankiri'),(3409,224,'TR-19','Corum'),(3410,224,'TR-20','Denizli'),(3411,224,'TR-21','Diyarbakir'),(3412,224,'TR-93','Duzce'),(3413,224,'TR-22','Edirne'),(3414,224,'TR-23','Elazig'),(3415,224,'TR-24','Erzincan'),(3416,224,'TR-25','Erzurum'),(3417,224,'TR-26','Eskisehir'),(3418,224,'TR-83','Gaziantep'),(3419,224,'TR-28','Giresun'),(3420,224,'TR-69','Gumushane'),(3421,224,'TR-70','Hakkari'),(3422,224,'TR-31','Hatay'),(3423,224,'TR-32','Icel / Mersin'),(3424,224,'TR-88','Igdir'),(3425,224,'TR-33','Isparta'),(3426,224,'TR-34','Istanbul'),(3427,224,'TR-35','Izmir'),(3428,224,'TR-46','Kahramanmaras'),(3429,224,'TR-89','Karabuk'),(3430,224,'TR-78','Karaman'),(3431,224,'TR-84','Kars'),(3432,224,'TR-37','Kastamonu'),(3433,224,'TR-38','Kayseri'),(3434,224,'TR-90','Kilis'),(3435,224,'TR-79','Kirikkale'),(3436,224,'TR-39','Kirklareli'),(3437,224,'TR-40','Kirsehir'),(3438,224,'TR-41','Kocaeli'),(3439,224,'TR-71','Konya'),(3440,224,'TR-43','Kutahya'),(3441,224,'TR-44','Malatya'),(3442,224,'TR-45','Manisa'),(3443,224,'TR-72','Mardin'),(3444,224,'TR-48','Mugla'),(3445,224,'TR-49','Mus'),(3446,224,'TR-50','Nevsehir'),(3447,224,'TR-73','Nigde'),(3448,224,'TR-52','Ordu'),(3449,224,'TR-91','Osmaniye'),(3450,224,'TR-53','Rize'),(3451,224,'TR-54','Sakarya'),(3452,224,'TR-55','Samsun'),(3453,224,'TR-63','Sanliurfa'),(3454,224,'TR-74','Siirt'),(3455,224,'TR-57','Sinop'),(3456,224,'TR-80','Sirnak'),(3457,224,'TR-58','Sivas'),(3458,224,'TR-59','Tekirdag'),(3459,224,'TR-60','Tokat'),(3460,224,'TR-61','Trabzon'),(3461,224,'TR-62','Tunceli'),(3462,224,'TR-64','Usak'),(3463,224,'TR-65','Van'),(3464,224,'TR-92','Yalova'),(3465,224,'TR-66','Yozgat'),(3466,224,'TR-85','Zonguldak'),(3467,225,'TM-01','Ahal'),(3468,225,'TM-02','Balkan'),(3469,225,'TM-03','Dashoguz'),(3470,225,'TM-04','Lebap'),(3471,225,'TM-05','Mary'),(3472,228,'UG-65','Adjumani'),(3473,228,'UG-77','Arua'),(3474,228,'UG-66','Bugiri'),(3475,228,'UG-67','Busia'),(3476,228,'UG-05','Busoga'),(3477,228,'UG-18','Central'),(3478,228,'UG-20','Eastern'),(3479,228,'UG-78','Iganga'),(3480,228,'UG-79','Kabarole'),(3481,228,'UG-80','Kaberamaido'),(3482,228,'UG-37','Kampala'),(3483,228,'UG-81','Kamwenge'),(3484,228,'UG-82','Kanungu'),(3485,228,'UG-08','Karamoja'),(3486,228,'UG-69','Katakwi'),(3487,228,'UG-83','Kayunga'),(3488,228,'UG-84','Kitgum'),(3489,228,'UG-85','Kyenjojo'),(3490,228,'UG-86','Mayuge'),(3491,228,'UG-87','Mbale'),(3492,228,'UG-88','Moroto'),(3493,228,'UG-89','Mpigi'),(3494,228,'UG-90','Mukono'),(3495,228,'UG-91','Nakapiripirit'),(3496,228,'UG-73','Nakasongola'),(3497,228,'UG-21','Nile'),(3498,228,'UG-22','North Buganda'),(3499,228,'UG-23','Northern'),(3500,228,'UG-92','Pader'),(3501,228,'UG-93','Rukungiri'),(3502,228,'UG-74','Sembabule'),(3503,228,'UG-94','Sironko'),(3504,228,'UG-95','Soroti'),(3505,228,'UG-12','South Buganda'),(3506,228,'UG-24','Southern'),(3507,228,'UG-96','Wakiso'),(3508,228,'UG-25','Western'),(3509,228,'UG-97','Yumbe'),(3510,229,'UA-11','Krym'),(3511,229,'UA-12','Kyyiv'),(3512,230,'AE-01','Abu Dhabi'),(3513,230,'AE-02','Ajman'),(3514,230,'AE-03','Dubai'),(3515,230,'AE-04','Fujairah'),(3516,230,'AE-05','Ras Al Khaimah'),(3517,230,'AE-06','Sharjah'),(3518,230,'AE-07','Umm Al Quwain'),(3519,231,'GB-T5','Aberdeen City'),(3520,231,'GB-T6','Aberdeenshire'),(3521,231,'GB-T7','Angus'),(3522,231,'GB-Q6','Antrim'),(3523,231,'GB-Q7','Ards'),(3524,231,'GB-T8','Argyll and Bute'),(3525,231,'GB-Q8','Armagh'),(3526,231,'GB-01','Avon'),(3527,231,'GB-Q9','Ballymena'),(3528,231,'GB-R1','Ballymoney'),(3529,231,'GB-R2','Banbridge'),(3530,231,'GB-A1','Barking and Dagenham'),(3531,231,'GB-A2','Barnet'),(3532,231,'GB-A3','Barnsley'),(3533,231,'GB-A4','Bath and North East Somerset'),(3534,231,'GB-A5','Bedfordshire'),(3535,231,'GB-R3','Belfast'),(3536,231,'GB-03','Berkshire'),(3537,231,'GB-A6','Bexley'),(3538,231,'GB-A7','Birmingham'),(3539,231,'GB-A8','Blackburn with Darwen'),(3540,231,'GB-A9','Blackpool'),(3541,231,'GB-X2','Blaenau Gwent'),(3542,231,'GB-B1','Bolton'),(3543,231,'GB-B2','Bournemouth'),(3544,231,'GB-B3','Bracknell Forest'),(3545,231,'GB-B4','Bradford'),(3546,231,'GB-B5','Brent'),(3547,231,'GB-X3','Bridgend'),(3548,231,'GB-B6','Brighton and Hove'),(3549,231,'GB-B7','Bristol, City of'),(3550,231,'GB-B8','Bromley'),(3551,231,'GB-B9','Buckinghamshire'),(3552,231,'GB-C1','Bury'),(3553,231,'GB-X4','Caerphilly'),(3554,231,'GB-C2','Calderdale'),(3555,231,'GB-C3','Cambridgeshire'),(3556,231,'GB-C4','Camden'),(3557,231,'GB-X5','Cardiff'),(3558,231,'GB-X7','Carmarthenshire'),(3559,231,'GB-R4','Carrickfergus'),(3560,231,'GB-R5','Castlereagh'),(3561,231,'GB-79','Central'),(3562,231,'GB-X6','Ceredigion'),(3563,231,'GB-C5','Cheshire'),(3564,231,'GB-U1','Clackmannanshire'),(3565,231,'GB-07','Cleveland'),(3566,231,'GB-90','Clwyd'),(3567,231,'GB-R6','Coleraine'),(3568,231,'GB-X8','Conwy'),(3569,231,'GB-R7','Cookstown'),(3570,231,'GB-C6','Cornwall'),(3571,231,'GB-C7','Coventry'),(3572,231,'GB-R8','Craigavon'),(3573,231,'GB-C8','Croydon'),(3574,231,'GB-C9','Cumbria'),(3575,231,'GB-D1','Darlington'),(3576,231,'GB-X9','Denbighshire'),(3577,231,'GB-D2','Derby'),(3578,231,'GB-D3','Derbyshire'),(3579,231,'GB-S6','Derry'),(3580,231,'GB-D4','Devon'),(3581,231,'GB-D5','Doncaster'),(3582,231,'GB-D6','Dorset'),(3583,231,'GB-R9','Down'),(3584,231,'GB-D7','Dudley'),(3585,231,'GB-U2','Dumfries and Galloway'),(3586,231,'GB-U3','Dundee City'),(3587,231,'GB-S1','Dungannon'),(3588,231,'GB-D8','Durham'),(3589,231,'GB-91','Dyfed'),(3590,231,'GB-D9','Ealing'),(3591,231,'GB-U4','East Ayrshire'),(3592,231,'GB-U5','East Dunbartonshire'),(3593,231,'GB-U6','East Lothian'),(3594,231,'GB-U7','East Renfrewshire'),(3595,231,'GB-E1','East Riding of Yorkshire'),(3596,231,'GB-E2','East Sussex'),(3597,231,'GB-U8','Edinburgh, City of'),(3598,231,'GB-W8','Eilean Siar'),(3599,231,'GB-E3','Enfield'),(3600,231,'GB-E4','Essex'),(3601,231,'GB-U9','Falkirk'),(3602,231,'GB-S2','Fermanagh'),(3603,231,'GB-V1','Fife'),(3604,231,'GB-Y1','Flintshire'),(3605,231,'GB-E5','Gateshead'),(3606,231,'GB-V2','Glasgow City'),(3607,231,'GB-E6','Gloucestershire'),(3608,231,'GB-82','Grampian'),(3609,231,'GB-17','Greater London'),(3610,231,'GB-18','Greater Manchester'),(3611,231,'GB-E7','Greenwich'),(3612,231,'GB-92','Gwent'),(3613,231,'GB-Y2','Gwynedd'),(3614,231,'GB-E8','Hackney'),(3615,231,'GB-E9','Halton'),(3616,231,'GB-F1','Hammersmith and Fulham'),(3617,231,'GB-F2','Hampshire'),(3618,231,'GB-F3','Haringey'),(3619,231,'GB-F4','Harrow'),(3620,231,'GB-F5','Hartlepool'),(3621,231,'GB-F6','Havering'),(3622,231,'GB-20','Hereford and Worcester'),(3623,231,'GB-F7','Herefordshire'),(3624,231,'GB-F8','Hertford'),(3625,231,'GB-V3','Highland'),(3626,231,'GB-F9','Hillingdon'),(3627,231,'GB-G1','Hounslow'),(3628,231,'GB-22','Humberside'),(3629,231,'GB-V4','Inverclyde'),(3630,231,'GB-X1','Isle of Anglesey'),(3631,231,'GB-G2','Isle of Wight'),(3632,231,'GB-G3','Islington'),(3633,231,'GB-G4','Kensington and Chelsea'),(3634,231,'GB-G5','Kent'),(3635,231,'GB-G6','Kingston upon Hull, City of'),(3636,231,'GB-G7','Kingston upon Thames'),(3637,231,'GB-G8','Kirklees'),(3638,231,'GB-G9','Knowsley'),(3639,231,'GB-H1','Lambeth'),(3640,231,'GB-H2','Lancashire'),(3641,231,'GB-S3','Larne'),(3642,231,'GB-H3','Leeds'),(3643,231,'GB-H4','Leicester'),(3644,231,'GB-H5','Leicestershire'),(3645,231,'GB-H6','Lewisham'),(3646,231,'GB-S4','Limavady'),(3647,231,'GB-H7','Lincolnshire'),(3648,231,'GB-S5','Lisburn'),(3649,231,'GB-H8','Liverpool'),(3650,231,'GB-H9','London, City of'),(3651,231,'GB-84','Lothian'),(3652,231,'GB-I1','Luton'),(3653,231,'GB-S7','Magherafelt'),(3654,231,'GB-I2','Manchester'),(3655,231,'GB-I3','Medway'),(3656,231,'GB-28','Merseyside'),(3657,231,'GB-Y3','Merthyr Tydfil'),(3658,231,'GB-I4','Merton'),(3659,231,'GB-94','Mid Glamorgan'),(3660,231,'GB-I5','Middlesbrough'),(3661,231,'GB-V5','Midlothian'),(3662,231,'GB-I6','Milton Keynes'),(3663,231,'GB-Y4','Monmouthshire'),(3664,231,'GB-V6','Moray'),(3665,231,'GB-S8','Moyle'),(3666,231,'GB-Y5','Neath Port Talbot'),(3667,231,'GB-I7','Newcastle upon Tyne'),(3668,231,'GB-I8','Newham'),(3669,231,'GB-Y6','Newport'),(3670,231,'GB-S9','Newry and Mourne'),(3671,231,'GB-T1','Newtownabbey'),(3672,231,'GB-I9','Norfolk'),(3673,231,'GB-V7','North Ayrshire'),(3674,231,'GB-T2','North Down'),(3675,231,'GB-J2','North East Lincolnshire'),(3676,231,'GB-V8','North Lanarkshire'),(3677,231,'GB-J3','North Lincolnshire'),(3678,231,'GB-J4','North Somerset'),(3679,231,'GB-J5','North Tyneside'),(3680,231,'GB-J7','North Yorkshire'),(3681,231,'GB-J1','Northamptonshire'),(3682,231,'GB-J6','Northumberland'),(3683,231,'GB-J8','Nottingham'),(3684,231,'GB-J9','Nottinghamshire'),(3685,231,'GB-K1','Oldham'),(3686,231,'GB-T3','Omagh'),(3687,231,'GB-V9','Orkney'),(3688,231,'GB-K2','Oxfordshire'),(3689,231,'GB-Y7','Pembrokeshire'),(3690,231,'GB-W1','Perth and Kinross'),(3691,231,'GB-K3','Peterborough'),(3692,231,'GB-K4','Plymouth'),(3693,231,'GB-K5','Poole'),(3694,231,'GB-K6','Portsmouth'),(3695,231,'GB-Y8','Powys'),(3696,231,'GB-K7','Reading'),(3697,231,'GB-K8','Redbridge'),(3698,231,'GB-K9','Redcar and Cleveland'),(3699,231,'GB-W2','Renfrewshire'),(3700,231,'GB-Y9','Rhondda Cynon Taff'),(3701,231,'GB-L1','Richmond upon Thames'),(3702,231,'GB-L2','Rochdale'),(3703,231,'GB-L3','Rotherham'),(3704,231,'GB-L4','Rutland'),(3705,231,'GB-L5','Salford'),(3706,231,'GB-L7','Sandwell'),(3707,231,'GB-T9','Scottish Borders, The'),(3708,231,'GB-L8','Sefton'),(3709,231,'GB-L9','Sheffield'),(3710,231,'GB-W3','Shetland Islands'),(3711,231,'GB-L6','Shropshire'),(3712,231,'GB-M1','Slough'),(3713,231,'GB-M2','Solihull'),(3714,231,'GB-M3','Somerset'),(3715,231,'GB-W4','South Ayrshire'),(3716,231,'GB-96','South Glamorgan'),(3717,231,'GB-M6','South Gloucestershire'),(3718,231,'GB-W5','South Lanarkshire'),(3719,231,'GB-M7','South Tyneside'),(3720,231,'GB-37','South Yorkshire'),(3721,231,'GB-M4','Southampton'),(3722,231,'GB-M5','Southend-on-Sea'),(3723,231,'GB-M8','Southwark'),(3724,231,'GB-N1','St. Helens'),(3725,231,'GB-M9','Staffordshire'),(3726,231,'GB-W6','Stirling'),(3727,231,'GB-N2','Stockport'),(3728,231,'GB-N3','Stockton-on-Tees'),(3729,231,'GB-N4','Stoke-on-Trent'),(3730,231,'GB-T4','Strabane'),(3731,231,'GB-87','Strathclyde'),(3732,231,'GB-N5','Suffolk'),(3733,231,'GB-N6','Sunderland'),(3734,231,'GB-N7','Surrey'),(3735,231,'GB-N8','Sutton'),(3736,231,'GB-Z1','Swansea'),(3737,231,'GB-N9','Swindon'),(3738,231,'GB-O1','Tameside'),(3739,231,'GB-88','Tayside'),(3740,231,'GB-O2','Telford and Wrekin'),(3741,231,'GB-O3','Thurrock'),(3742,231,'GB-O4','Torbay'),(3743,231,'GB-Z2','Torfaen'),(3744,231,'GB-O5','Tower Hamlets'),(3745,231,'GB-O6','Trafford'),(3746,231,'GB-41','Tyne and Wear'),(3747,231,'GB-Z3','Vale of Glamorgan, The'),(3748,231,'GB-O7','Wakefield'),(3749,231,'GB-O8','Walsall'),(3750,231,'GB-O9','Waltham Forest'),(3751,231,'GB-P1','Wandsworth'),(3752,231,'GB-P2','Warrington'),(3753,231,'GB-P3','Warwickshire'),(3754,231,'GB-P4','West Berkshire'),(3755,231,'GB-W7','West Dunbartonshire'),(3756,231,'GB-97','West Glamorgan'),(3757,231,'GB-W9','West Lothian'),(3758,231,'GB-43','West Midlands'),(3759,231,'GB-P6','West Sussex'),(3760,231,'GB-45','West Yorkshire'),(3761,231,'GB-P5','Westminster'),(3762,231,'GB-P7','Wigan'),(3763,231,'GB-P8','Wiltshire'),(3764,231,'GB-P9','Windsor and Maidenhead'),(3765,231,'GB-Q1','Wirral'),(3766,231,'GB-Q2','Wokingham'),(3767,231,'GB-Q3','Wolverhampton'),(3768,231,'GB-Q4','Worcestershire'),(3769,231,'GB-Z4','Wrexham'),(3770,231,'GB-Q5','York'),(3771,232,'US-AL','Alabama'),(3772,232,'US-AK','Alaska'),(3773,232,'US-AS','American Samoa'),(3774,232,'US-AZ','Arizona'),(3775,232,'US-AR','Arkansas'),(3776,232,'US-AA','Armed Forces Americas'),(3777,232,'US-AE','Armed Forces Europe, Middle East, & Canada'),(3778,232,'US-AP','Armed Forces Pacific'),(3779,232,'US-CA','California'),(3780,232,'US-CO','Colorado'),(3781,232,'US-CT','Connecticut'),(3782,232,'US-DE','Delaware'),(3783,232,'US-DC','District of Columbia'),(3784,232,'US-FM','Federated States of Micronesia'),(3785,232,'US-FL','Florida'),(3786,232,'US-GA','Georgia'),(3787,232,'US-GU','Guam'),(3788,232,'US-HI','Hawaii'),(3789,232,'US-ID','Idaho'),(3790,232,'US-IL','Illinois'),(3791,232,'US-IN','Indiana'),(3792,232,'US-IA','Iowa'),(3793,232,'US-KS','Kansas'),(3794,232,'US-KY','Kentucky'),(3795,232,'US-LA','Louisiana'),(3796,232,'US-ME','Maine'),(3797,232,'US-MH','Marshall Islands'),(3798,232,'US-MD','Maryland'),(3799,232,'US-MA','Massachusetts'),(3800,232,'US-MI','Michigan'),(3801,232,'US-MN','Minnesota'),(3802,232,'US-MS','Mississippi'),(3803,232,'US-MO','Missouri'),(3804,232,'US-MT','Montana'),(3805,232,'US-NE','Nebraska'),(3806,232,'US-NV','Nevada'),(3807,232,'US-NH','New Hampshire'),(3808,232,'US-NJ','New Jersey'),(3809,232,'US-NM','New Mexico'),(3810,232,'US-NY','New York'),(3811,232,'US-NC','North Carolina'),(3812,232,'US-ND','North Dakota'),(3813,232,'US-MP','Northern Mariana Islands'),(3814,232,'US-OH','Ohio'),(3815,232,'US-OK','Oklahoma'),(3816,232,'US-OR','Oregon'),(3817,232,'US-PW','Palau'),(3818,232,'US-PA','Pennsylvania'),(3819,232,'US-PR','Puerto Rico'),(3820,232,'US-RI','Rhode Island'),(3821,232,'US-SC','South Carolina'),(3822,232,'US-SD','South Dakota'),(3823,232,'US-TN','Tennessee'),(3824,232,'US-TX','Texas'),(3825,232,'US-UT','Utah'),(3826,232,'US-VT','Vermont'),(3827,232,'US-VI','Virgin Islands'),(3828,232,'US-VA','Virginia'),(3829,232,'US-WA','Washington'),(3830,232,'US-WV','West Virginia'),(3831,232,'US-WI','Wisconsin'),(3832,232,'US-WY','Wyoming'),(3833,234,'UY-01','Artigas'),(3834,234,'UY-02','Canelones'),(3835,234,'UY-03','Cerro Largo'),(3836,234,'UY-04','Colonia'),(3837,234,'UY-05','Durazno'),(3838,234,'UY-06','Flores'),(3839,234,'UY-07','Florida'),(3840,234,'UY-08','Lavalleja'),(3841,234,'UY-09','Maldonado'),(3842,234,'UY-10','Montevideo'),(3843,234,'UY-11','Paysandu'),(3844,234,'UY-12','Rio Negro'),(3845,234,'UY-13','Rivera'),(3846,234,'UY-14','Rocha'),(3847,234,'UY-15','Salto'),(3848,234,'UY-16','San Jose'),(3849,234,'UY-17','Soriano'),(3850,234,'UY-18','Tacuarembo'),(3851,234,'UY-19','Treinta y Tres'),(3852,235,'UZ-01','Andijon'),(3853,235,'UZ-02','Bukhoro'),(3854,235,'UZ-03','Farghona'),(3855,235,'UZ-04','Jizzakh'),(3856,235,'UZ-05','Khorazm'),(3857,235,'UZ-06','Namangan'),(3858,235,'UZ-07','Nawoiy'),(3859,235,'UZ-08','Qashqadaryo'),(3860,235,'UZ-09','Qoraqalpoghiston'),(3861,235,'UZ-10','Samarqand'),(3862,235,'UZ-11','Sirdaryo'),(3863,235,'UZ-12','Surkhondaryo'),(3864,235,'UZ-13','Toshkent'),(3865,236,'VU-05','Ambrym'),(3866,236,'VU-06','Aoba'),(3867,236,'VU-08','Efate'),(3868,236,'VU-09','Epi'),(3869,236,'VU-10','Malakula'),(3870,236,'VU-16','Malampa'),(3871,236,'VU-11','Paama'),(3872,236,'VU-17','Penama'),(3873,236,'VU-12','Pentecote'),(3874,236,'VU-13','Sanma'),(3875,236,'VU-18','Shefa'),(3876,236,'VU-14','Shepherd'),(3877,236,'VU-15','Tafea'),(3878,236,'VU-07','Torba'),(3879,237,'VE-01','Amazonas'),(3880,237,'VE-02','Anzoategui'),(3881,237,'VE-03','Apure'),(3882,237,'VE-04','Aragua'),(3883,237,'VE-05','Barinas'),(3884,237,'VE-06','Bolivar'),(3885,237,'VE-07','Carabobo'),(3886,237,'VE-08','Cojedes'),(3887,237,'VE-09','Delta Amacuro'),(3888,237,'VE-24','Dependencias Federales'),(3889,237,'VE-25','Distrito Federal'),(3890,237,'VE-11','Falcon'),(3891,237,'VE-12','Guarico'),(3892,237,'VE-13','Lara'),(3893,237,'VE-14','Merida'),(3894,237,'VE-15','Miranda'),(3895,237,'VE-16','Monagas'),(3896,237,'VE-17','Nueva Esparta'),(3897,237,'VE-18','Portuguesa'),(3898,237,'VE-19','Sucre'),(3899,237,'VE-20','Tachira'),(3900,237,'VE-21','Trujillo'),(3901,237,'VE-26','Vargas'),(3902,237,'VE-22','Yaracuy'),(3903,237,'VE-23','Zulia'),(3904,238,'VN-43','An Giang'),(3905,238,'VN-53','Ba Ria-Vung Tau'),(3906,238,'VN-02','Bac Thai'),(3907,238,'VN-03','Ben Tre'),(3908,238,'VN-54','Binh Dinh'),(3909,238,'VN-55','Binh Thuan'),(3910,238,'VN-56','Can Tho'),(3911,238,'VN-05','Cao Bang'),(3912,238,'VN-44','Dac Lac'),(3913,238,'VN-45','Dong Nai'),(3914,238,'VN-46','Dong Thap'),(3915,238,'VN-57','Gia Lai'),(3916,238,'VN-11','Ha Bac'),(3917,238,'VN-58','Ha Giang'),(3918,238,'VN-51','Ha Noi'),(3919,238,'VN-59','Ha Tay'),(3920,238,'VN-60','Ha Tinh'),(3921,238,'VN-12','Hai Hung'),(3922,238,'VN-13','Hai Phong'),(3923,238,'VN-52','Ho Chi Minh'),(3924,238,'VN-61','Hoa Binh'),(3925,238,'VN-62','Khanh Hoa'),(3926,238,'VN-47','Kien Giang'),(3927,238,'VN-63','Kon Tum'),(3928,238,'VN-22','Lai Chau'),(3929,238,'VN-23','Lam Dong'),(3930,238,'VN-39','Lang Son'),(3931,238,'VN-64','Lao Cai'),(3932,238,'VN-24','Long An'),(3933,238,'VN-48','Minh Hai'),(3934,238,'VN-65','Nam Ha'),(3935,238,'VN-66','Nghe An'),(3936,238,'VN-67','Ninh Binh'),(3937,238,'VN-68','Ninh Thuan'),(3938,238,'VN-69','Phu Yen'),(3939,238,'VN-70','Quang Binh'),(3940,238,'VN-29','Quang Nam-Da Nang'),(3941,238,'VN-71','Quang Ngai'),(3942,238,'VN-30','Quang Ninh'),(3943,238,'VN-72','Quang Tri'),(3944,238,'VN-73','Soc Trang'),(3945,238,'VN-32','Son La'),(3946,238,'VN-49','Song Be'),(3947,238,'VN-33','Tay Ninh'),(3948,238,'VN-35','Thai Binh'),(3949,238,'VN-34','Thanh Hoa'),(3950,238,'VN-74','Thua Thien'),(3951,238,'VN-37','Tien Giang'),(3952,238,'VN-75','Tra Vinh'),(3953,238,'VN-76','Tuyen Quang'),(3954,238,'VN-77','Vinh Long'),(3955,238,'VN-50','Vinh Phu'),(3956,238,'VN-78','Yen Bai'),(3957,243,'YE-01','Abyan'),(3958,243,'YE-08','Al Hudaydah'),(3959,243,'YE-21','Al Jawf'),(3960,243,'YE-03','Al Mahrah'),(3961,243,'YE-10','Al Mahwit'),(3962,243,'YE-11','Dhamar'),(3963,243,'YE-04','Hadramawt'),(3964,243,'YE-22','Hajjah'),(3965,243,'YE-23','Ibb'),(3966,243,'YE-24','Lahij'),(3967,243,'YE-15','Sa'),(3968,243,'YE-16','San'),(3969,243,'YE-05','Shabwah'),(3970,243,'YE-25','Ta'),(3971,244,'ZM-02','Central'),(3972,244,'ZM-08','Copperbelt'),(3973,244,'ZM-03','Eastern'),(3974,244,'ZM-04','Luapula'),(3975,244,'ZM-09','Lusaka'),(3976,244,'ZM-06','North-Western'),(3977,244,'ZM-05','Northern'),(3978,244,'ZM-07','Southern'),(3979,244,'ZM-01','Western'),(3980,245,'ZW-09','Bulawayo'),(3981,245,'ZW-10','Harare'),(3982,245,'ZW-01','Manicaland'),(3983,245,'ZW-03','Mashonaland Central'),(3984,245,'ZW-04','Mashonaland East'),(3985,245,'ZW-05','Mashonaland West'),(3986,245,'ZW-08','Masvingo'),(3987,245,'ZW-06','Matabeleland North'),(3988,245,'ZW-07','Matabeleland South'),(3989,245,'ZW-02','Midlands');
/*!40000 ALTER TABLE `cmg_core_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_role`
--

DROP TABLE IF EXISTS `cmg_core_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homeUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_1` (`createdBy`),
  KEY `fk_role_2` (`modifiedBy`),
  CONSTRAINT `fk_role_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_role_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1552 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_role`
--

LOCK TABLES `cmg_core_role` WRITE;
/*!40000 ALTER TABLE `cmg_core_role` DISABLE KEYS */;
INSERT INTO `cmg_core_role` VALUES (1,1,1,'Super Admin','super-admin','The Super Admin have all the permisisons to perform operations on the admin site and website.','dashboard','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(2,1,1,'Admin','admin','The Admin have all the permisisons to perform operations on the admin site and website except RBAC module.','dashboard','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(3,1,1,'User','user','The role User is limited to website users.',NULL,'system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(4,1,1,'User Manager','user-manager','The role User Manager is limited to manage site users from admin.','dashboard','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(1001,1,1,'CMS Manager','cms-manager','The role CMS Manager is limited to manage cms from admin.','dashboard','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(1551,1,1,'Form Manager','form-manager','The role Form Manager is limited to manage forms from admin.','dashboard','system',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54');
/*!40000 ALTER TABLE `cmg_core_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_role_permission`
--

DROP TABLE IF EXISTS `cmg_core_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_role_permission` (
  `roleId` bigint(20) NOT NULL,
  `permissionId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `fk_role_permission_1` (`roleId`),
  KEY `fk_role_permission_2` (`permissionId`),
  CONSTRAINT `fk_role_permission_1` FOREIGN KEY (`roleId`) REFERENCES `cmg_core_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_role_permission_2` FOREIGN KEY (`permissionId`) REFERENCES `cmg_core_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_role_permission`
--

LOCK TABLES `cmg_core_role_permission` WRITE;
/*!40000 ALTER TABLE `cmg_core_role_permission` DISABLE KEYS */;
INSERT INTO `cmg_core_role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,1001),(1,1551),(2,1),(2,2),(2,3),(2,1001),(2,1551),(3,2),(4,1),(4,2),(4,4),(1001,1001),(1551,1551);
/*!40000 ALTER TABLE `cmg_core_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_site`
--

DROP TABLE IF EXISTS `cmg_core_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_site`
--

LOCK TABLES `cmg_core_site` WRITE;
/*!40000 ALTER TABLE `cmg_core_site` DISABLE KEYS */;
INSERT INTO `cmg_core_site` VALUES (1,'main');
/*!40000 ALTER TABLE `cmg_core_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_site_member`
--

DROP TABLE IF EXISTS `cmg_core_site_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_site_member` (
  `siteId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`siteId`,`userId`),
  KEY `fk_site_member_1` (`siteId`),
  KEY `fk_site_member_2` (`userId`),
  KEY `fk_site_member_3` (`roleId`),
  CONSTRAINT `fk_site_member_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_site_member_2` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_site_member_3` FOREIGN KEY (`roleId`) REFERENCES `cmg_core_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_site_member`
--

LOCK TABLES `cmg_core_site_member` WRITE;
/*!40000 ALTER TABLE `cmg_core_site_member` DISABLE KEYS */;
INSERT INTO `cmg_core_site_member` VALUES (1,1,1,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(1,2,2,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(1,3,3,'2014-10-11 14:22:54','2014-10-11 14:22:54');
/*!40000 ALTER TABLE `cmg_core_site_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_tag`
--

DROP TABLE IF EXISTS `cmg_core_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_tag`
--

LOCK TABLES `cmg_core_tag` WRITE;
/*!40000 ALTER TABLE `cmg_core_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_template`
--

DROP TABLE IF EXISTS `cmg_core_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `layout` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminView` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frontendView` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_template`
--

LOCK TABLES `cmg_core_template` WRITE;
/*!40000 ALTER TABLE `cmg_core_template` DISABLE KEYS */;
INSERT INTO `cmg_core_template` VALUES (1,'simple','Simple layout for pages and posts.','page','simple','@themes/blog/views/templates/page',NULL,'simple',NULL),(2,'blog','Blog layout to view all blog posts or filters(category, author).','page','blog','@themes/blog/views/templates/page',NULL,'blog',NULL),(3,'text','It can be used to display simple key values for a widget.','widget',NULL,'@themes/blog/views/templates/widget','text-admin',NULL,NULL),(4,'form','It can be used to display form.','form','form','@themes/blog/views/templates/form',NULL,'form',NULL);
/*!40000 ALTER TABLE `cmg_core_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_user`
--

DROP TABLE IF EXISTS `cmg_core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `localeId` bigint(20) DEFAULT NULL,
  `genderId` bigint(20) DEFAULT NULL,
  `avatarId` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordHash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verifyToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resetToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registeredAt` datetime DEFAULT NULL,
  `lastLoginAt` datetime DEFAULT NULL,
  `lastActivityAt` datetime DEFAULT NULL,
  `authKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessTokenCreatedAt` datetime DEFAULT NULL,
  `accessTokenAccessedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_1` (`localeId`),
  KEY `fk_user_2` (`genderId`),
  KEY `fk_user_3` (`avatarId`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`localeId`) REFERENCES `cmg_core_locale` (`id`),
  CONSTRAINT `fk_user_2` FOREIGN KEY (`genderId`) REFERENCES `cmg_core_option` (`id`),
  CONSTRAINT `fk_user_3` FOREIGN KEY (`avatarId`) REFERENCES `cmg_core_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_user`
--

LOCK TABLES `cmg_core_user` WRITE;
/*!40000 ALTER TABLE `cmg_core_user` DISABLE KEYS */;
INSERT INTO `cmg_core_user` VALUES (1,NULL,NULL,NULL,500,'demomaster@cmsgears.com','demomaster','$2y$13$Ut5b2RskRpGA9Q0nKSO6Xe65eaBHdx/q8InO8Ln6Lt3HzOK4ECz8W','demo','master',NULL,NULL,NULL,NULL,'2014-10-11 14:22:54','2015-11-06 09:21:02',NULL,'JuL37UBqGpjnA7kaPiRnlsiWRwbRvXx7',NULL,NULL,NULL),(2,NULL,NULL,NULL,500,'demoadmin@cmsgears.com','demoadmin','$2y$13$Ut5b2RskRpGA9Q0nKSO6Xe65eaBHdx/q8InO8Ln6Lt3HzOK4ECz8W','demo','admin',NULL,NULL,NULL,NULL,'2014-10-11 14:22:54','2014-10-10 08:03:19',NULL,'SQ1LLCWEPva4IKuQklILLGDpmUTGzq8E',NULL,NULL,NULL),(3,NULL,NULL,NULL,500,'demouser@cmsgears.com','demouser','$2y$13$Ut5b2RskRpGA9Q0nKSO6Xe65eaBHdx/q8InO8Ln6Lt3HzOK4ECz8W','demo','user',NULL,NULL,NULL,NULL,'2014-10-11 14:22:54','2014-10-10 08:03:19',NULL,'-jG5ExHS0Y39ucSxHhl3PZ4xmPsfvQFC',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cmg_core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_form`
--

DROP TABLE IF EXISTS `cmg_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `templateId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `successMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jsonStorage` tinyint(1) DEFAULT '0',
  `captcha` tinyint(1) DEFAULT '0',
  `visibility` tinyint(1) DEFAULT '0',
  `userMail` tinyint(1) DEFAULT '0',
  `adminMail` tinyint(1) DEFAULT '0',
  `options` mediumtext COLLATE utf8_unicode_ci,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_1` (`templateId`),
  KEY `fk_form_2` (`createdBy`),
  KEY `fk_form_3` (`modifiedBy`),
  CONSTRAINT `fk_form_1` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`),
  CONSTRAINT `fk_form_2` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_form_3` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_form`
--

LOCK TABLES `cmg_form` WRITE;
/*!40000 ALTER TABLE `cmg_form` DISABLE KEYS */;
INSERT INTO `cmg_form` VALUES (1,4,1,1,'Contact Us','contact-us','contact form','Thanks for contacting us. We will contact you within next 48 hrs.',1,1,0,0,1,NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(2,4,1,1,'Feedback','feedback','feedback form','Thanks for providing your valuable feedback.',0,1,1,0,1,NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54');
/*!40000 ALTER TABLE `cmg_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_form_field`
--

DROP TABLE IF EXISTS `cmg_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_form_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formId` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `validators` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci,
  `meta` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_1` (`formId`),
  CONSTRAINT `fk_form_field_1` FOREIGN KEY (`formId`) REFERENCES `cmg_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_form_field`
--

LOCK TABLES `cmg_form_field` WRITE;
/*!40000 ALTER TABLE `cmg_form_field` DISABLE KEYS */;
INSERT INTO `cmg_form_field` VALUES (1,1,'name',NULL,1,'required','{\"placeholder\":\"Name\"}',NULL),(2,1,'email',NULL,1,'required,email','{\"placeholder\":\"Email\"}',NULL),(3,1,'subject',NULL,1,'required','{\"placeholder\":\"Subject\"}',NULL),(4,1,'message',NULL,5,NULL,'{\"placeholder\":\"Message\"}',NULL),(5,2,'name',NULL,1,'required','{\"placeholder\":\"Name\"}',NULL),(6,2,'email',NULL,1,'required,email','{\"placeholder\":\"Email\"}',NULL),(7,2,'rating',NULL,25,'required','{\"placeholder\":\"Subject\"}',NULL),(8,2,'message',NULL,5,NULL,'{\"placeholder\":\"Message\"}',NULL);
/*!40000 ALTER TABLE `cmg_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_form_submit`
--

DROP TABLE IF EXISTS `cmg_form_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_form_submit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formId` bigint(20) NOT NULL,
  `jsonStorage` tinyint(1) DEFAULT '0',
  `submittedBy` bigint(20) DEFAULT NULL,
  `submittedAt` datetime DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_form_submit_1` (`formId`),
  KEY `fk_form_submit_2` (`submittedBy`),
  CONSTRAINT `fk_form_submit_1` FOREIGN KEY (`formId`) REFERENCES `cmg_form` (`id`),
  CONSTRAINT `fk_form_submit_2` FOREIGN KEY (`submittedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_form_submit`
--

LOCK TABLES `cmg_form_submit` WRITE;
/*!40000 ALTER TABLE `cmg_form_submit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_form_submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_form_submit_field`
--

DROP TABLE IF EXISTS `cmg_form_submit_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_form_submit_field` (
  `formSubmitId` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `fk_form_submit_field_1` (`formSubmitId`),
  CONSTRAINT `fk_form_submit_field_1` FOREIGN KEY (`formSubmitId`) REFERENCES `cmg_form_submit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_form_submit_field`
--

LOCK TABLES `cmg_form_submit_field` WRITE;
/*!40000 ALTER TABLE `cmg_form_submit_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_form_submit_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-06 14:56:21