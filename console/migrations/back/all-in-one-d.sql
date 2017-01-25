CREATE DATABASE  IF NOT EXISTS `cmgdemoblog` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `cmgdemoblog`;
-- MySQL dump 10.13  Distrib 5.6.24, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: cmgdemoblog
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.14.04.1

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
  `siteId` bigint(20) NOT NULL,
  `bannerId` bigint(20) DEFAULT NULL,
  `textureId` bigint(20) DEFAULT NULL,
  `videoId` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_unicode_ci,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `htmlOptions` mediumtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_block_1` (`siteId`),
  KEY `fk_cmg_block_2` (`bannerId`),
  KEY `fk_cmg_block_3` (`textureId`),
  KEY `fk_cmg_block_4` (`videoId`),
  KEY `fk_cmg_block_5` (`templateId`),
  KEY `fk_cmg_block_6` (`createdBy`),
  KEY `fk_cmg_block_7` (`modifiedBy`),
  CONSTRAINT `fk_cmg_block_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`),
  CONSTRAINT `fk_cmg_block_2` FOREIGN KEY (`bannerId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_block_3` FOREIGN KEY (`textureId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_block_4` FOREIGN KEY (`videoId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_block_5` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`),
  CONSTRAINT `fk_cmg_block_6` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_block_7` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_block`
--

LOCK TABLES `cmg_cms_block` WRITE;
/*!40000 ALTER TABLE `cmg_cms_block` DISABLE KEYS */;
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_block_1` (`blockId`),
  CONSTRAINT `fk_cmg_model_block_1` FOREIGN KEY (`blockId`) REFERENCES `cmg_cms_block` (`id`)
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
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `seoName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seoRobot` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewCount` bigint(20) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_content_1` (`bannerId`),
  KEY `fk_cmg_model_content_2` (`videoId`),
  KEY `fk_cmg_model_content_3` (`templateId`),
  CONSTRAINT `fk_cmg_model_content_1` FOREIGN KEY (`bannerId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_model_content_2` FOREIGN KEY (`videoId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_model_content_3` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_model_content`
--

LOCK TABLES `cmg_cms_model_content` WRITE;
/*!40000 ALTER TABLE `cmg_cms_model_content` DISABLE KEYS */;
INSERT INTO `cmg_cms_model_content` VALUES (1,NULL,NULL,NULL,1,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'home page',NULL,NULL,0,'',NULL),(2,NULL,NULL,NULL,2,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'login page',NULL,NULL,0,'',NULL),(3,NULL,NULL,NULL,3,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'register page',NULL,NULL,0,'',NULL),(4,NULL,NULL,NULL,4,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'confirm account page',NULL,NULL,0,'',NULL),(5,NULL,NULL,NULL,5,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'activate account page',NULL,NULL,0,'',NULL),(6,NULL,NULL,NULL,6,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'forgot password page',NULL,NULL,0,'',NULL),(7,NULL,NULL,NULL,7,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'reset password page',NULL,NULL,0,'',NULL),(8,NULL,NULL,1,8,'page','<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'about us page',NULL,NULL,0,'<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>',NULL),(9,NULL,NULL,1,9,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'terms page',NULL,NULL,0,'<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>',NULL),(10,NULL,NULL,1,10,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'privacy page',NULL,NULL,0,'<p>Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It\'s also called placeholder (or filler) text. It\'s a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero</p>',NULL),(11,NULL,NULL,2,11,'page','','2014-10-01 00:00:00','2014-10-01 00:00:00','2014-10-01 00:00:00',NULL,'blog page',NULL,NULL,0,'',NULL);
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
  `siteId` bigint(20) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `visibility` smallint(6) NOT NULL DEFAULT '0',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_page_1` (`parentId`),
  KEY `fk_cmg_page_2` (`siteId`),
  KEY `fk_cmg_page_3` (`createdBy`),
  KEY `fk_cmg_page_4` (`modifiedBy`),
  CONSTRAINT `fk_cmg_page_1` FOREIGN KEY (`parentId`) REFERENCES `cmg_cms_page` (`id`),
  CONSTRAINT `fk_cmg_page_2` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`),
  CONSTRAINT `fk_cmg_page_3` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_page_4` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_page`
--

LOCK TABLES `cmg_cms_page` WRITE;
/*!40000 ALTER TABLE `cmg_cms_page` DISABLE KEYS */;
INSERT INTO `cmg_cms_page` VALUES (1,NULL,1,1,1,'Home','home','page',500,10,NULL,0,0,0),(2,NULL,1,1,1,'Login','login','page',500,10,NULL,0,0,0),(3,NULL,1,1,1,'Register','register','page',500,10,NULL,0,0,0),(4,NULL,1,1,1,'Confirm Account','confirm-account','page',500,10,NULL,0,0,0),(5,NULL,1,1,1,'Activate Account','activate-account','page',500,10,NULL,0,0,0),(6,NULL,1,1,1,'Forgot Password','forgot-password','page',500,10,NULL,0,0,0),(7,NULL,1,1,1,'Reset Password','reset-password','page',500,10,NULL,0,0,0),(8,NULL,1,1,1,'About Us','about-us','page',500,10,NULL,0,0,0),(9,NULL,1,1,1,'Terms','terms','page',500,10,NULL,0,0,0),(10,NULL,1,1,1,'Privacy','privacy','page',500,10,NULL,0,0,0),(11,NULL,1,1,1,'Blog','blog','page',500,10,NULL,0,0,0);
/*!40000 ALTER TABLE `cmg_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_cms_page_attribute`
--

DROP TABLE IF EXISTS `cmg_cms_page_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_cms_page_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pageId` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `valueType` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_page_attribute_1` (`pageId`),
  CONSTRAINT `fk_cmg_page_attribute_1` FOREIGN KEY (`pageId`) REFERENCES `cmg_cms_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_cms_page_attribute`
--

LOCK TABLES `cmg_cms_page_attribute` WRITE;
/*!40000 ALTER TABLE `cmg_cms_page_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_cms_page_attribute` ENABLE KEYS */;
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
  `cityId` bigint(20) DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(8,4) DEFAULT '0.0000',
  `longitude` decimal(8,4) DEFAULT '0.0000',
  `zoomLevel` smallint(6) DEFAULT '5',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_address_1` (`countryId`),
  KEY `fk_cmg_address_2` (`provinceId`),
  KEY `fk_cmg_address_3` (`cityId`),
  CONSTRAINT `fk_cmg_address_1` FOREIGN KEY (`countryId`) REFERENCES `cmg_core_country` (`id`),
  CONSTRAINT `fk_cmg_address_2` FOREIGN KEY (`provinceId`) REFERENCES `cmg_core_province` (`id`),
  CONSTRAINT `fk_cmg_address_3` FOREIGN KEY (`cityId`) REFERENCES `cmg_core_city` (`id`)
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
  `siteId` bigint(20) NOT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `rootId` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `lValue` smallint(6) NOT NULL DEFAULT '1',
  `rValue` smallint(6) NOT NULL DEFAULT '2',
  `htmlOptions` mediumtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_category_1` (`siteId`),
  KEY `fk_cmg_category_2` (`parentId`),
  KEY `fk_cmg_category_3` (`rootId`),
  CONSTRAINT `fk_cmg_category_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`),
  CONSTRAINT `fk_cmg_category_2` FOREIGN KEY (`parentId`) REFERENCES `cmg_core_category` (`id`),
  CONSTRAINT `fk_cmg_category_3` FOREIGN KEY (`rootId`) REFERENCES `cmg_core_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_category`
--

LOCK TABLES `cmg_core_category` WRITE;
/*!40000 ALTER TABLE `cmg_core_category` DISABLE KEYS */;
INSERT INTO `cmg_core_category` VALUES (1,1,NULL,NULL,'Gender','gender',NULL,'combo',NULL,0,1,2,NULL,NULL);
/*!40000 ALTER TABLE `cmg_core_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_city`
--

DROP TABLE IF EXISTS `cmg_core_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `countryId` bigint(20) NOT NULL,
  `provinceId` bigint(20) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_city_1` (`countryId`),
  KEY `fk_cmg_city_2` (`provinceId`),
  CONSTRAINT `fk_cmg_city_1` FOREIGN KEY (`countryId`) REFERENCES `cmg_core_country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cmg_city_2` FOREIGN KEY (`provinceId`) REFERENCES `cmg_core_province` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_city`
--

LOCK TABLES `cmg_core_city` WRITE;
/*!40000 ALTER TABLE `cmg_core_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_country`
--

DROP TABLE IF EXISTS `cmg_core_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_country`
--

LOCK TABLES `cmg_core_country` WRITE;
/*!40000 ALTER TABLE `cmg_core_country` DISABLE KEYS */;
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
  `title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `directory` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `size` float(8,2) NOT NULL DEFAULT '0.00',
  `visibility` smallint(6) NOT NULL DEFAULT '0',
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_file_1` (`createdBy`),
  KEY `fk_cmg_file_2` (`modifiedBy`),
  CONSTRAINT `fk_cmg_file_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_file_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
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
-- Table structure for table `cmg_core_form`
--

DROP TABLE IF EXISTS `cmg_core_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteId` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `successMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `captcha` tinyint(1) DEFAULT '0',
  `visibility` smallint(6) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `userMail` tinyint(1) DEFAULT '0',
  `adminMail` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `htmlOptions` mediumtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_form_1` (`siteId`),
  KEY `fk_cmg_form_2` (`templateId`),
  KEY `fk_cmg_form_3` (`createdBy`),
  KEY `fk_cmg_form_4` (`modifiedBy`),
  CONSTRAINT `fk_cmg_form_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`),
  CONSTRAINT `fk_cmg_form_2` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`),
  CONSTRAINT `fk_cmg_form_3` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_form_4` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_form`
--

LOCK TABLES `cmg_core_form` WRITE;
/*!40000 ALTER TABLE `cmg_core_form` DISABLE KEYS */;
INSERT INTO `cmg_core_form` VALUES (1,1,NULL,1,1,'Config Core','config-core','system','Core configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(2,1,NULL,1,1,'Config Mail','config-mail','system','Mail configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(3,1,NULL,1,1,'Config Backend','config-backend','system','Backend site configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(4,1,NULL,1,1,'Config Site','config-frontend','system','Frontend site configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(5,1,NULL,1,1,'Config CMS','config-cms','system','CMS configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(6,1,NULL,1,1,'Config File','config-file','system','File Manager configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(7,1,NULL,1,1,'Config Twitter Meta','config-twitter-meta','system','Twitter meta configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(8,1,NULL,1,1,'Config Facebook Meta','config-facebook-meta','system','Facebook meta configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(9,1,NULL,1,1,'Config Facebook','config-facebook','system','Facebook configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(10,1,NULL,1,1,'Config Google','config-google','system','Google configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(11,1,NULL,1,1,'Config Twitter','config-twitter','system','Twitter configuration form.','All configurations saved successfully.',0,10,1,0,0,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(12,1,1,1,1,'Contact Us','contact-us','site','contact form','Contrary to popular belief, Lorem Ipsum is not simply random text.',1,0,1,0,1,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL),(13,1,1,1,1,'Feedback','feedback','site','feedback form','Thanks for providing your valuable feedback.',1,0,1,0,1,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cmg_core_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_form_field`
--

DROP TABLE IF EXISTS `cmg_core_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_form_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formId` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(6) DEFAULT '0',
  `compress` tinyint(1) DEFAULT '0',
  `validators` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` smallint(6) DEFAULT '0',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htmlOptions` mediumtext COLLATE utf8_unicode_ci,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_form_field_1` (`formId`),
  CONSTRAINT `fk_cmg_form_field_1` FOREIGN KEY (`formId`) REFERENCES `cmg_core_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_form_field`
--

LOCK TABLES `cmg_core_form_field` WRITE;
/*!40000 ALTER TABLE `cmg_core_form_field` DISABLE KEYS */;
INSERT INTO `cmg_core_form_field` VALUES (1,1,'locale_message','Locale Message',40,0,'required',0,NULL,'{\"title\":\"Check for i18n support.\"}',NULL,NULL),(2,1,'language','Language',0,0,'required',0,NULL,'{\"title\":\"Language used on html tag.\",\"placeholder\":\"Language\"}',NULL,NULL),(3,1,'locale','Locale',0,0,'required',0,NULL,'{\"title\":\"Site default locale.\",\"placeholder\":\"Locale\"}',NULL,NULL),(4,1,'charset','Charset',0,0,'required',0,NULL,'{\"title\":\"Charset used on html head meta.\",\"placeholder\":\"Charset\"}',NULL,NULL),(5,1,'site_title','Site Title',0,0,'required',0,NULL,'{\"title\":\"Site title used in forming page title.\",\"placeholder\":\"Site Title\"}',NULL,NULL),(6,1,'site_name','Site Name',0,0,'required',0,NULL,'{\"title\":\"Site name used on footers etc.\",\"placeholder\":\"Site Name\"}',NULL,NULL),(7,1,'site_url','Frontend URL',0,0,'required',0,NULL,'{\"title\":\"Frontend URL\",\"placeholder\":\"Frontend URL\"}',NULL,NULL),(8,1,'admin_url','Backend URL',0,0,'required',0,NULL,'{\"title\":\"Backend URL\",\"placeholder\":\"Backend URL\"}',NULL,NULL),(9,1,'registration','Registration',40,0,'required',0,NULL,'{\"title\":\"Check whether site registration is allowed.\"}',NULL,NULL),(10,1,'change_email','Change Email',40,0,'required',0,NULL,'{\"title\":\"Check whether email change is allowed for user profile.\"}',NULL,NULL),(11,1,'change_username','Change Username',40,0,'required',0,NULL,'{\"title\":\"Check whether username change is allowed for user profile.\"}',NULL,NULL),(12,1,'date_format','Date Format',0,0,'required',0,NULL,'{\"title\":\"Date format used by the formatter.\",\"placeholder\":\"Date Format\"}',NULL,NULL),(13,1,'time_format','Time Format',0,0,'required',0,NULL,'{\"title\":\"Time format used by the formatter.\",\"placeholder\":\"Time Format\"}',NULL,NULL),(14,1,'timezone','Timezone',0,0,'required',0,NULL,'{\"title\":\"Time format used by the formatter.\",\"placeholder\":\"Time Format\"}',NULL,NULL),(15,2,'smtp','SMTP',40,0,'required',0,NULL,'{\"title\":\"Check whether SMTP is required.\"}',NULL,NULL),(16,2,'smtp_username','SMTP Username',0,0,NULL,0,NULL,'{\"title\":\"SMTP username.\",\"placeholder\":\"SMTP Username\"}',NULL,NULL),(17,2,'smtp_password','SMTP Password',10,0,NULL,0,NULL,'{\"title\":\"SMTP password.\",\"placeholder\":\"SMTP Password\"}',NULL,NULL),(18,2,'smtp_host','SMTP Host',0,0,NULL,0,NULL,'{\"title\":\"SMTP host.\",\"placeholder\":\"SMTP Host\"}',NULL,NULL),(19,2,'smtp_port','SMTP Port',0,0,NULL,0,NULL,'{\"title\":\"SMTP port.\",\"placeholder\":\"SMTP Port\"}',NULL,NULL),(20,2,'smtp_encryption','SMTP Encryption',0,0,NULL,0,NULL,'{\"title\":\"SMTP encryption.\",\"placeholder\":\"SMTP Encryption\"}',NULL,NULL),(21,2,'debug','SMTP Debug',40,0,'required',0,NULL,'{\"title\":\"Check whether SMTP debug is required.\"}',NULL,NULL),(22,2,'sender_name','Sender Name',0,0,'required',0,NULL,'{\"title\":\"Sender name.\",\"placeholder\":\"Sender Name\"}',NULL,NULL),(23,2,'sender_email','Sender Email',0,0,'required',0,NULL,'{\"title\":\"Sender email.\",\"placeholder\":\"Sender Email\"}',NULL,NULL),(24,2,'contact_name','Contact Name',0,0,'required',0,NULL,'{\"title\":\"Contact name.\",\"placeholder\":\"Contact Name\"}',NULL,NULL),(25,2,'contact_email','Contact Email',0,0,'required',0,NULL,'{\"title\":\"Contact email.\",\"placeholder\":\"Contact Email\"}',NULL,NULL),(26,2,'info_name','Info Name',0,0,'required',0,NULL,'{\"title\":\"Info name.\",\"placeholder\":\"Info Name\"}',NULL,NULL),(27,2,'info_email','Info Email',0,0,'required',0,NULL,'{\"title\":\"Info email.\",\"placeholder\":\"Info Email\"}',NULL,NULL),(28,5,'page_comment','Page Comment',40,0,'required',0,NULL,'{\"title\":\"Enable/disable comments on pages.\"}',NULL,NULL),(29,5,'post_comment','Post Comment',40,0,'required',0,NULL,'{\"title\":\"Enable/disable comments on posts.\"}',NULL,NULL),(30,6,'image_extensions','Image Extensions',0,0,'required',0,NULL,'{\"title\":\"Image Extensions.\",\"placeholder\":\"Image Extensions\"}',NULL,NULL),(31,6,'video_extensions','Video Extensions',0,0,'required',0,NULL,'{\"title\":\"Video Extensions.\",\"placeholder\":\"Video Extensions\"}',NULL,NULL),(32,6,'audio_extensions','Audio Extensions',0,0,'required',0,NULL,'{\"title\":\"Audio Extensions.\",\"placeholder\":\"Audio Extensions\"}',NULL,NULL),(33,6,'document_extensions','Document Extensions',0,0,'required',0,NULL,'{\"title\":\"Document Extensions.\",\"placeholder\":\"Document Extensions\"}',NULL,NULL),(34,6,'compressed_extensions','Compressed Extensions',0,0,'required',0,NULL,'{\"title\":\"Compressed Extensions.\",\"placeholder\":\"Compressed Extensions\"}',NULL,NULL),(35,6,'generate_name','Generate Name',40,0,'required',0,NULL,'{\"title\":\"Generate Name.\"}',NULL,NULL),(36,6,'pretty_name','Pretty Name',40,0,'required',0,NULL,'{\"title\":\"Pretty Name.\"}',NULL,NULL),(37,6,'max_size','Max Size',0,0,'required',0,NULL,'{\"title\":\"Max Size.\",\"placeholder\":\"Max Size\"}',NULL,NULL),(38,6,'generate_thumb','Generate Thumb',40,0,'required',0,NULL,'{\"title\":\"Generate Thumb.\"}',NULL,NULL),(39,6,'thumb_width','Thumb Width',0,0,'required',0,NULL,'{\"title\":\"Thumb Width.\",\"placeholder\":\"Thumb Width\"}',NULL,NULL),(40,6,'thumb_height','Thumb Height',0,0,'required',0,NULL,'{\"title\":\"Thumb Height.\",\"placeholder\":\"Thumb Height\"}',NULL,NULL),(41,6,'uploads_directory','Uploads Directory',0,0,NULL,0,NULL,'{\"title\":\"Uploads Directory.\",\"placeholder\":\"Uploads Directory\"}',NULL,NULL),(42,6,'uploads_url','Uploads URL',0,0,'required',0,NULL,'{\"title\":\"Uploads URL.\",\"placeholder\":\"Uploads URL\"}',NULL,NULL),(43,7,'active','Active',40,0,'required',0,NULL,'{\"title\":\"activate or de-activate.\"}',NULL,NULL),(44,7,'page','Page',40,0,'required',0,NULL,'{\"title\":\"enable or disabled for all pages.\"}',NULL,NULL),(45,7,'post','Post',40,0,'required',0,NULL,'{\"title\":\"enable or disabled for all posts.\"}',NULL,NULL),(46,7,'card','Card',80,0,'required',0,NULL,'{\"title\":\"Card types\",\"items\":[\"summary\",\"summary_large_image\",\"photo\",\"gallery\",\"product\",\"app\",\"player\"]}',NULL,NULL),(47,7,'site','Site',0,0,NULL,0,NULL,'{\"title\":\"@username for the website used in the card footer\",\"placeholder\":\"@username\"}',NULL,NULL),(48,7,'creator','Creator',0,0,NULL,0,NULL,'{\"title\":\"@username for the content creator / author.\",\"placeholder\":\"@username\"}',NULL,NULL),(49,8,'active','Active',40,0,'required',0,NULL,'{\"title\":\"activate or de-activate.\"}',NULL,NULL),(50,8,'page','Page',40,0,'required',0,NULL,'{\"title\":\"enable or disabled for all pages.\"}',NULL,NULL),(51,8,'post','Post',40,0,'required',0,NULL,'{\"title\":\"enable or disabled for all posts.\"}',NULL,NULL),(52,8,'app_id','Application Id',0,0,'required',0,NULL,'{\"title\":\"fb app id\",\"placeholder\":\"fb app id\"}',NULL,NULL),(53,8,'author','Author',0,0,NULL,0,NULL,'{\"title\":\"author\",\"placeholder\":\"author\"}',NULL,NULL),(54,8,'publisher','Publisher',0,0,NULL,0,NULL,'{\"title\":\"publisher\",\"placeholder\":\"publisher\"}',NULL,NULL),(55,9,'active','Active',40,0,'required',0,NULL,'{\"title\":\"Check whether Facebook Login is active.\"}',NULL,NULL),(56,9,'app_id','Application Id',0,0,'required',0,NULL,'{\"title\":\"Application Id.\",\"placeholder\":\"Application Id\"}',NULL,NULL),(57,9,'app_secret','Application Secret',10,0,'required',0,NULL,'{\"title\":\"Application Secret.\",\"placeholder\":\"Application Secret\"}',NULL,NULL),(58,9,'redirect_uri','Redirect URI',0,0,'required',0,NULL,'{\"title\":\"Redirect URI.\",\"placeholder\":\"Redirect URI\"}',NULL,NULL),(59,10,'active','Active',40,0,'required',0,NULL,'{\"title\":\"Check whether Google Login is active.\"}',NULL,NULL),(60,10,'app_id','Application Id',0,0,'required',0,NULL,'{\"title\":\"Application Id.\",\"placeholder\":\"Application Id\"}',NULL,NULL),(61,10,'app_secret','Application Secret',10,0,'required',0,NULL,'{\"title\":\"Application Secret.\",\"placeholder\":\"Application Secret\"}',NULL,NULL),(62,10,'redirect_uri','Redirect URI',0,0,'required',0,NULL,'{\"title\":\"Redirect URI.\",\"placeholder\":\"Redirect URI\"}',NULL,NULL),(63,11,'active','Active',40,0,'required',0,NULL,'{\"title\":\"Check whether Google Login is active.\"}',NULL,NULL),(64,11,'api_key','API Id',0,0,'required',0,NULL,'{\"title\":\"API Key.\",\"placeholder\":\"API Key\"}',NULL,NULL),(65,11,'api_secret','API Secret',10,0,'required',0,NULL,'{\"title\":\"API Secret.\",\"placeholder\":\"API Secret\"}',NULL,NULL),(66,11,'redirect_uri','Redirect URI',0,0,'required',0,NULL,'{\"title\":\"Redirect URI.\",\"placeholder\":\"Redirect URI\"}',NULL,NULL),(67,12,'name','Name',0,0,'required',0,NULL,'{\"placeholder\":\"Name\"}',NULL,NULL),(68,12,'email','Email',0,0,'required,email',0,NULL,'{\"placeholder\":\"Email\"}',NULL,NULL),(69,12,'subject','Subject',0,0,'required',0,NULL,'{\"placeholder\":\"Subject\"}',NULL,NULL),(70,12,'message','Message',10,0,NULL,0,NULL,'{\"placeholder\":\"Message\"}',NULL,NULL),(71,13,'name','Name',0,0,'required',0,NULL,'{\"placeholder\":\"Name\"}',NULL,NULL),(72,13,'email','Email',0,0,'required,email',0,NULL,'{\"placeholder\":\"Email\"}',NULL,NULL),(73,13,'message','Message',10,0,NULL,0,NULL,'{\"placeholder\":\"Message\"}',NULL,NULL),(74,13,'rating','Rating',90,0,'required',0,NULL,'{\"placeholder\":\"Rating\"}',NULL,NULL);
/*!40000 ALTER TABLE `cmg_core_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_gallery`
--

DROP TABLE IF EXISTS `cmg_core_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteId` bigint(20) DEFAULT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_gallery_1` (`siteId`),
  KEY `fk_cmg_gallery_2` (`templateId`),
  KEY `fk_cmg_gallery_3` (`createdBy`),
  KEY `fk_cmg_gallery_4` (`modifiedBy`),
  CONSTRAINT `fk_cmg_gallery_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`),
  CONSTRAINT `fk_cmg_gallery_2` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`),
  CONSTRAINT `fk_cmg_gallery_3` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_gallery_4` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
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
-- Table structure for table `cmg_core_model_activity`
--

DROP TABLE IF EXISTS `cmg_core_model_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_activity_1` (`userId`),
  CONSTRAINT `fk_cmg_model_activity_1` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_activity`
--

LOCK TABLES `cmg_core_model_activity` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_activity` ENABLE KEYS */;
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
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_address_1` (`addressId`),
  CONSTRAINT `fk_cmg_model_address_1` FOREIGN KEY (`addressId`) REFERENCES `cmg_core_address` (`id`) ON DELETE CASCADE
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
-- Table structure for table `cmg_core_model_attribute`
--

DROP TABLE IF EXISTS `cmg_core_model_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `valueType` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_attribute`
--

LOCK TABLES `cmg_core_model_attribute` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_attribute` DISABLE KEYS */;
INSERT INTO `cmg_core_model_attribute` VALUES (1,1,'site','locale_message','Locale Message','core','flag','0'),(2,1,'site','language','Language','core','text','en-US'),(3,1,'site','locale','Locale','core','text','en_US'),(4,1,'site','charset','Charset','core','text','UTF-8'),(5,1,'site','site_title','Site Title','core','text','CMSGears Demo'),(6,1,'site','site_name','Site Name','core','text','CMSGears'),(7,1,'site','site_url','Site Url','core','text','http://demo.cmsgears.com/template/blog/'),(8,1,'site','admin_url','Admin Url','core','text','http://demo.cmsgears.com/template/blog/admin/'),(9,1,'site','registration','Registration','core','flag','1'),(10,1,'site','change_email','Change Email','core','flag','1'),(11,1,'site','change_username','Change Username','core','flag','1'),(12,1,'site','date_format','Date Format','core','text','yyyy-MM-dd'),(13,1,'site','time_format','Time Format','core','text','HH:mm:ss'),(14,1,'site','timezone','Timezone','core','text','UTC+0'),(15,1,'site','smtp','SMTP','mail','flag','0'),(16,1,'site','smtp_username','SMTP Username','mail','text',''),(17,1,'site','smtp_password','SMTP Password','mail','text',''),(18,1,'site','smtp_host','SMTP Host','mail','text',''),(19,1,'site','smtp_port','SMTP Port','mail','text','587'),(20,1,'site','smtp_encryption','SMTP Encryption','mail','text','tls'),(21,1,'site','debug','Debug','mail','flag','1'),(22,1,'site','sender_name','Sender Name','mail','text','Admin'),(23,1,'site','sender_email','Sender Email','mail','text','demoadmin@cmsgears.com'),(24,1,'site','contact_name','Contact Name','mail','text','Contact Us'),(25,1,'site','contact_email','Contact Email','mail','text','democontact@cmsgears.com'),(26,1,'site','info_name','Info Name','mail','text','Info'),(27,1,'site','info_email','Info Email','mail','text','demoinfo@cmsgears.com'),(28,1,'site','page_comment','Page Comment','cms','flag','0'),(29,1,'site','post_comment','Post Comment','cms','flag','1'),(30,1,'site','image_extensions','Image Extensions','file','text','png,jpg,jpeg,gif'),(31,1,'site','video_extensions','Video Extensions','file','text','mp4,flv,ogv,avi'),(32,1,'site','audio_extensions','Audio Extensions','file','text','mp3,m4a,wav'),(33,1,'site','document_extensions','Document Extensions','file','text','pdf,doc,docx,xls,xlsx,txt'),(34,1,'site','compressed_extensions','Compressed Extensions','file','text','rar,zip'),(35,1,'site','generate_name','Generate Name','file','flag','1'),(36,1,'site','pretty_name','Pretty Name','file','flag','0'),(37,1,'site','max_size','Max Size','file','text','5'),(38,1,'site','generate_thumb','Generate Thumb','file','flag','1'),(39,1,'site','thumb_width','Thumb Width','file','text','120'),(40,1,'site','thumb_height','Thumb Height','file','text','120'),(41,1,'site','uploads_directory','Uploads Directory','file','text',NULL),(42,1,'site','uploads_url','Uploads URL','file','text','http://localhost/cmgdemoblog/uploads/'),(43,1,'site','active','Active','twitter-meta','flag','1'),(44,1,'site','page','Page','twitter-meta','flag','1'),(45,1,'site','post','Post','twitter-meta','flag','1'),(46,1,'site','card','Card','twitter-meta','text','summary_large_image'),(47,1,'site','site','Site','twitter-meta','text',NULL),(48,1,'site','creator','Creator','twitter-meta','text',NULL),(49,1,'site','active','Active','facebook-meta','flag','1'),(50,1,'site','page','Page','facebook-meta','flag','1'),(51,1,'site','post','Post','facebook-meta','flag','1'),(52,1,'site','app_id','App Id','facebook-meta','text',NULL),(53,1,'site','author','Author','facebook-meta','text',NULL),(54,1,'site','publisher','Publisher','facebook-meta','text',NULL),(55,1,'site','active','Active','facebook','flag','1'),(56,1,'site','app_id','App Id','facebook','text',''),(57,1,'site','app_secret','App Secret','facebook','text',''),(58,1,'site','redirect_uri','Redirect URI','facebook','text','/sns/facebook/authorise'),(59,1,'site','active','Actrive','google','flag','1'),(60,1,'site','app_id','App Id','google','text',''),(61,1,'site','app_secret','App Secret','google','text',''),(62,1,'site','redirect_uri','Redirect URI','google','text','/sns/google/authorise'),(63,1,'site','active','Active','twitter','flag','1'),(64,1,'site','api_key','API Key','twitter','text',''),(65,1,'site','api_secret','API Secret','twitter','text',''),(66,1,'site','redirect_uri','Redirect URI','twitter','text','/sns/twitter/authorise');
/*!40000 ALTER TABLE `cmg_core_model_attribute` ENABLE KEYS */;
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
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_category_1` (`categoryId`),
  CONSTRAINT `fk_cmg_model_category_1` FOREIGN KEY (`categoryId`) REFERENCES `cmg_core_category` (`id`) ON DELETE CASCADE
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
  `baseId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatarUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `websiteUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `rating` smallint(6) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_comment_1` (`createdBy`),
  KEY `fk_cmg_model_comment_2` (`modifiedBy`),
  KEY `fk_cmg_model_comment_3` (`baseId`),
  CONSTRAINT `fk_cmg_model_comment_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_model_comment_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_model_comment_3` FOREIGN KEY (`baseId`) REFERENCES `cmg_core_model_comment` (`id`)
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_file_1` (`fileId`),
  CONSTRAINT `fk_cmg_model_file_1` FOREIGN KEY (`fileId`) REFERENCES `cmg_core_file` (`id`) ON DELETE CASCADE
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
-- Table structure for table `cmg_core_model_form`
--

DROP TABLE IF EXISTS `cmg_core_model_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_form_1` (`formId`),
  CONSTRAINT `fk_cmg_model_form_1` FOREIGN KEY (`formId`) REFERENCES `cmg_core_form` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_form`
--

LOCK TABLES `cmg_core_model_form` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_gallery`
--

DROP TABLE IF EXISTS `cmg_core_model_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `galleryId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_gallery_1` (`galleryId`),
  CONSTRAINT `fk_cmg_model_gallery_1` FOREIGN KEY (`galleryId`) REFERENCES `cmg_core_gallery` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_gallery`
--

LOCK TABLES `cmg_core_model_gallery` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_hierarchy`
--

DROP TABLE IF EXISTS `cmg_core_model_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_hierarchy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL,
  `childId` bigint(20) DEFAULT NULL,
  `rootId` bigint(20) DEFAULT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lValue` smallint(6) NOT NULL DEFAULT '1',
  `rValue` smallint(6) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_hierarchy`
--

LOCK TABLES `cmg_core_model_hierarchy` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_model_message`
--

DROP TABLE IF EXISTS `cmg_core_model_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `localeId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_message_1` (`localeId`),
  CONSTRAINT `fk_cmg_model_message_1` FOREIGN KEY (`localeId`) REFERENCES `cmg_core_locale` (`id`) ON DELETE CASCADE
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
-- Table structure for table `cmg_core_model_option`
--

DROP TABLE IF EXISTS `cmg_core_model_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_model_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `optionId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_option_1` (`optionId`),
  CONSTRAINT `fk_cmg_model_option_1` FOREIGN KEY (`optionId`) REFERENCES `cmg_core_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_model_option`
--

LOCK TABLES `cmg_core_model_option` WRITE;
/*!40000 ALTER TABLE `cmg_core_model_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_core_model_option` ENABLE KEYS */;
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
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_tag_1` (`tagId`),
  CONSTRAINT `fk_cmg_model_tag_1` FOREIGN KEY (`tagId`) REFERENCES `cmg_core_tag` (`id`) ON DELETE CASCADE
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
-- Table structure for table `cmg_core_object`
--

DROP TABLE IF EXISTS `cmg_core_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_object` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteId` bigint(20) NOT NULL,
  `templateId` bigint(20) DEFAULT NULL,
  `avatarId` bigint(20) DEFAULT NULL,
  `bannerId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `htmlOptions` mediumtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_object_1` (`siteId`),
  KEY `fk_cmg_object_2` (`templateId`),
  KEY `fk_cmg_object_3` (`avatarId`),
  KEY `fk_cmg_object_4` (`bannerId`),
  KEY `fk_cmg_object_5` (`createdBy`),
  KEY `fk_cmg_object_6` (`modifiedBy`),
  CONSTRAINT `fk_cmg_object_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`),
  CONSTRAINT `fk_cmg_object_2` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`),
  CONSTRAINT `fk_cmg_object_3` FOREIGN KEY (`avatarId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_object_4` FOREIGN KEY (`bannerId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_object_5` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_object_6` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_object`
--

LOCK TABLES `cmg_core_object` WRITE;
/*!40000 ALTER TABLE `cmg_core_object` DISABLE KEYS */;
INSERT INTO `cmg_core_object` VALUES (1,1,NULL,NULL,NULL,1,1,'Main','main',NULL,'menu','Main Menu used on site header.',1,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,'{\"links\":{\"4\":{\"link\":\"1\",\"pageId\":\"2\",\"htmlOptions\":\"{\\\"id\\\":\\\"btn-login\\\"}\",\"icon\":\"\",\"order\":\"0\",\"type\":\"page\",\"name\":\"Login\"},\"3\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"2\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"0\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"1\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"5\":{\"link\":\"1\",\"pageId\":\"3\",\"htmlOptions\":\"{\\\"id\\\":\\\"btn-register\\\"}\",\"icon\":\"\",\"order\":\"1\",\"type\":\"page\",\"name\":\"Sign Up\"}}}',NULL),(2,1,NULL,NULL,NULL,1,1,'Secondary','secondary',NULL,'menu','Secondary Menu used on sidebar.',1,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,'{\"links\":{\"0\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"3\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"4\":{\"link\":\"1\",\"pageId\":\"1\",\"htmlOptions\":\"\",\"icon\":\"\",\"order\":\"0\",\"type\":\"page\",\"name\":\"Home\"},\"1\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"2\":{\"address\":\"\",\"label\":\"\",\"htmlOptions\":\"\",\"private\":\"0\",\"relative\":\"0\",\"icon\":\"\",\"order\":\"0\",\"type\":\"link\"},\"5\":{\"link\":\"1\",\"pageId\":\"8\",\"htmlOptions\":\"\",\"icon\":\"\",\"order\":\"1\",\"type\":\"page\",\"name\":\"About Us\"},\"6\":{\"link\":\"1\",\"pageId\":\"9\",\"htmlOptions\":\"\",\"icon\":\"\",\"order\":\"2\",\"type\":\"page\",\"name\":\"Terms\"},\"7\":{\"link\":\"1\",\"pageId\":\"10\",\"htmlOptions\":\"\",\"icon\":\"\",\"order\":\"3\",\"type\":\"page\",\"name\":\"Privacy\"},\"8\":{\"link\":\"1\",\"pageId\":\"11\",\"htmlOptions\":\"\",\"icon\":\"\",\"order\":\"4\",\"type\":\"page\",\"name\":\"Blog\"}}}',NULL),(3,1,5,NULL,NULL,1,1,'Follow Us','follow-us',NULL,'widget','Social links on main menu',1,'2014-10-11 14:22:54','2014-10-11 14:22:54',NULL,'{\"classPath\":\"\",\"data\":{\"facebook\":\"http:\\/\\/www.facebook.com\",\"twitter\":\"http:\\/\\/www.twitter.com\",\"youtube\":\"http:\\/\\/www.youtube.com\",\"instagram\":\"http:\\/\\/www.instagram.com\"}}',NULL);
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
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htmlOptions` mediumtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_option_1` (`categoryId`),
  CONSTRAINT `fk_cmg_option_1` FOREIGN KEY (`categoryId`) REFERENCES `cmg_core_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_option`
--

LOCK TABLES `cmg_core_option` WRITE;
/*!40000 ALTER TABLE `cmg_core_option` DISABLE KEYS */;
INSERT INTO `cmg_core_option` VALUES (1,1,'Male','Male',NULL,NULL,NULL),(2,1,'Female','Female',NULL,NULL,NULL),(3,1,'Other','Other',NULL,NULL,NULL);
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
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_permission_1` (`createdBy`),
  KEY `fk_cmg_permission_2` (`modifiedBy`),
  CONSTRAINT `fk_cmg_permission_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_permission_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_permission`
--

LOCK TABLES `cmg_core_permission` WRITE;
/*!40000 ALTER TABLE `cmg_core_permission` DISABLE KEYS */;
INSERT INTO `cmg_core_permission` VALUES (1,1,1,'Admin','admin','system',NULL,'The permission admin is to distinguish between admin and site user. It is a must have permission for admins.','2014-10-11 14:22:54','2014-10-11 14:22:54'),(2,1,1,'User','user','system',NULL,'The permission user is to distinguish between admin and site user. It is a must have permission for users.','2014-10-11 14:22:54','2014-10-11 14:22:54'),(3,1,1,'Core','core','system',NULL,'The permission core is to manage settings, drop downs, world countries, galleries and newsletters from admin.','2014-10-11 14:22:54','2014-10-11 14:22:54'),(4,1,1,'Identity','identity','system',NULL,'The permission identity is to manage users from admin.','2014-10-11 14:22:54','2014-10-11 14:22:54'),(5,1,1,'RBAC','rbac','system',NULL,'The permission rbac is to manage roles and permissions from admin.','2014-10-11 14:22:54','2014-10-11 14:22:54'),(6,1,1,'CMS','cms','system',NULL,'The permission cms is to manage templates, pages, menus, sidebars and widgets from admin.','2014-10-11 14:22:54','2014-10-11 14:22:54'),(7,1,1,'Form','form','system',NULL,'The permission form is to manage forms from admin.','2014-10-11 14:22:54','2014-10-11 14:22:54');
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
  `countryId` bigint(20) NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_province_1` (`countryId`),
  CONSTRAINT `fk_cmg_province_1` FOREIGN KEY (`countryId`) REFERENCES `cmg_core_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_province`
--

LOCK TABLES `cmg_core_province` WRITE;
/*!40000 ALTER TABLE `cmg_core_province` DISABLE KEYS */;
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
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homeUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_role_1` (`createdBy`),
  KEY `fk_cmg_role_2` (`modifiedBy`),
  CONSTRAINT `fk_cmg_role_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_role_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_role`
--

LOCK TABLES `cmg_core_role` WRITE;
/*!40000 ALTER TABLE `cmg_core_role` DISABLE KEYS */;
INSERT INTO `cmg_core_role` VALUES (1,1,1,'Super Admin','super-admin','system',NULL,'The Super Admin have all the permisisons to perform operations on the admin site and website.','dashboard','2014-10-11 14:22:54','2014-10-11 14:22:54'),(2,1,1,'Admin','admin','system',NULL,'The Admin have all the permisisons to perform operations on the admin site and website except RBAC module.','dashboard','2014-10-11 14:22:54','2014-10-11 14:22:54'),(3,1,1,'User','user','system',NULL,'The role User is limited to website users.',NULL,'2014-10-11 14:22:54','2014-10-11 14:22:54'),(4,1,1,'User Manager','user-manager','system',NULL,'The role User Manager is limited to manage site users from admin.','dashboard','2014-10-11 14:22:54','2014-10-11 14:22:54'),(5,1,1,'CMS Manager','cms-manager','system',NULL,'The role CMS Manager is limited to manage cms from admin.','dashboard','2014-10-11 14:22:54','2014-10-11 14:22:54'),(6,1,1,'Form Manager','form-manager','system',NULL,'The role Form Manager is limited to manage forms from admin.','dashboard','2014-10-11 14:22:54','2014-10-11 14:22:54');
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
  KEY `fk_cmg_role_permission_1` (`roleId`),
  KEY `fk_cmg_role_permission_2` (`permissionId`),
  CONSTRAINT `fk_cmg_role_permission_1` FOREIGN KEY (`roleId`) REFERENCES `cmg_core_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cmg_role_permission_2` FOREIGN KEY (`permissionId`) REFERENCES `cmg_core_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_role_permission`
--

LOCK TABLES `cmg_core_role_permission` WRITE;
/*!40000 ALTER TABLE `cmg_core_role_permission` DISABLE KEYS */;
INSERT INTO `cmg_core_role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,1),(2,2),(2,3),(2,6),(2,7),(3,2),(4,1),(4,2),(4,4),(5,1),(5,2),(5,6),(6,1),(6,2),(6,7);
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
  `avatarId` bigint(20) DEFAULT NULL,
  `bannerId` bigint(20) DEFAULT NULL,
  `themeId` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cmg_site_1` (`avatarId`),
  KEY `fk_cmg_site_2` (`bannerId`),
  KEY `fk_cmg_site_3` (`themeId`),
  CONSTRAINT `fk_cmg_site_1` FOREIGN KEY (`avatarId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_site_2` FOREIGN KEY (`bannerId`) REFERENCES `cmg_core_file` (`id`),
  CONSTRAINT `fk_cmg_site_3` FOREIGN KEY (`themeId`) REFERENCES `cmg_core_theme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_site`
--

LOCK TABLES `cmg_core_site` WRITE;
/*!40000 ALTER TABLE `cmg_core_site` DISABLE KEYS */;
INSERT INTO `cmg_core_site` VALUES (1,NULL,NULL,1,'main','main',0,1);
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
  KEY `fk_cmg_site_member_1` (`siteId`),
  KEY `fk_cmg_site_member_2` (`userId`),
  KEY `fk_cmg_site_member_3` (`roleId`),
  CONSTRAINT `fk_cmg_site_member_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cmg_site_member_2` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cmg_site_member_3` FOREIGN KEY (`roleId`) REFERENCES `cmg_core_role` (`id`)
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
  `siteId` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_tag_1` (`siteId`),
  CONSTRAINT `fk_cmg_tag_1` FOREIGN KEY (`siteId`) REFERENCES `cmg_core_site` (`id`)
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
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renderer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileRender` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `layoutGroup` tinyint(1) NOT NULL DEFAULT '0',
  `viewPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_template_1` (`createdBy`),
  KEY `fk_cmg_template_2` (`modifiedBy`),
  CONSTRAINT `fk_cmg_template_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_template_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_template`
--

LOCK TABLES `cmg_core_template` WRITE;
/*!40000 ALTER TABLE `cmg_core_template` DISABLE KEYS */;
INSERT INTO `cmg_core_template` VALUES (1,1,1,'Page','page',NULL,'page','Page layout for pages.','default',1,'page/simple',0,'views/templates/page/simple','2016-01-01 17:04:54','2016-01-01 17:06:22',NULL,NULL),(2,1,1,'Blog','blog',NULL,'page','Blog layout to view all blog posts or filters(category, author).','default',1,'page/blog',0,'views/templates/page/blog','2016-01-01 17:04:54','2016-01-01 17:06:22',NULL,NULL),(3,1,1,'Post','post',NULL,'post','Post layout for posts.','default',1,'post/simple',1,'views/templates/post/simple','2016-01-01 17:04:54','2016-01-01 17:06:22',NULL,NULL),(4,1,1,'Form','form',NULL,'form','It can be used to display public forms.','default',1,'form/simple',0,'views/templates/form/simple','2016-01-01 17:04:54','2016-01-01 17:06:22',NULL,NULL),(5,1,1,'Text Social','text-social',NULL,'widget','It can be used to display key values for social links.','default',1,NULL,0,'views/templates/widget/text/social','2016-01-01 17:04:54','2016-01-01 17:06:22',NULL,NULL);
/*!40000 ALTER TABLE `cmg_core_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_core_theme`
--

DROP TABLE IF EXISTS `cmg_core_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_core_theme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renderer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basePath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_theme_1` (`createdBy`),
  KEY `fk_cmg_theme_2` (`modifiedBy`),
  CONSTRAINT `fk_cmg_theme_1` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_theme_2` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_theme`
--

LOCK TABLES `cmg_core_theme` WRITE;
/*!40000 ALTER TABLE `cmg_core_theme` DISABLE KEYS */;
INSERT INTO `cmg_core_theme` VALUES (1,1,1,'Blog','blog','Blog Theme.',NULL,'@themes/blog','2016-01-01 17:04:54','2016-01-01 17:06:22',NULL);
/*!40000 ALTER TABLE `cmg_core_theme` ENABLE KEYS */;
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
  `avatarUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `websiteUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verifyToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resetToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registeredAt` datetime DEFAULT NULL,
  `lastLoginAt` datetime DEFAULT NULL,
  `lastActivityAt` datetime DEFAULT NULL,
  `authKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessTokenCreatedAt` datetime DEFAULT NULL,
  `accessTokenAccessedAt` datetime DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_user_1` (`localeId`),
  KEY `fk_cmg_user_2` (`genderId`),
  KEY `fk_cmg_user_3` (`avatarId`),
  CONSTRAINT `fk_cmg_user_1` FOREIGN KEY (`localeId`) REFERENCES `cmg_core_locale` (`id`),
  CONSTRAINT `fk_cmg_user_2` FOREIGN KEY (`genderId`) REFERENCES `cmg_core_option` (`id`),
  CONSTRAINT `fk_cmg_user_3` FOREIGN KEY (`avatarId`) REFERENCES `cmg_core_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_core_user`
--

LOCK TABLES `cmg_core_user` WRITE;
/*!40000 ALTER TABLE `cmg_core_user` DISABLE KEYS */;
INSERT INTO `cmg_core_user` VALUES (1,NULL,NULL,NULL,18000,'demomaster@cmsgears.com','demomaster','$2y$13$Ut5b2RskRpGA9Q0nKSO6Xe65eaBHdx/q8InO8Ln6Lt3HzOK4ECz8W','demo','master',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-11 14:22:54','2014-10-10 08:03:19',NULL,'JuL37UBqGpjnA7kaPiRnlsiWRwbRvXx7',NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,18000,'demoadmin@cmsgears.com','demoadmin','$2y$13$Ut5b2RskRpGA9Q0nKSO6Xe65eaBHdx/q8InO8Ln6Lt3HzOK4ECz8W','demo','admin',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-11 14:22:54','2014-10-10 08:03:19',NULL,'SQ1LLCWEPva4IKuQklILLGDpmUTGzq8E',NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,18000,'demouser@cmsgears.com','demouser','$2y$13$Ut5b2RskRpGA9Q0nKSO6Xe65eaBHdx/q8InO8Ln6Lt3HzOK4ECz8W','demo','user',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-11 14:22:54','2014-10-10 08:03:19',NULL,'-jG5ExHS0Y39ucSxHhl3PZ4xmPsfvQFC',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cmg_core_user` ENABLE KEYS */;
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
  `submittedBy` bigint(20) DEFAULT NULL,
  `submittedAt` datetime DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_form_submit_1` (`formId`),
  KEY `fk_cmg_form_submit_2` (`submittedBy`),
  CONSTRAINT `fk_cmg_form_submit_1` FOREIGN KEY (`formId`) REFERENCES `cmg_core_form` (`id`),
  CONSTRAINT `fk_cmg_form_submit_2` FOREIGN KEY (`submittedBy`) REFERENCES `cmg_core_user` (`id`)
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formSubmitId` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_form_submit_field_1` (`formSubmitId`),
  CONSTRAINT `fk_cmg_form_submit_field_1` FOREIGN KEY (`formSubmitId`) REFERENCES `cmg_form_submit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_form_submit_field`
--

LOCK TABLES `cmg_form_submit_field` WRITE;
/*!40000 ALTER TABLE `cmg_form_submit_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_form_submit_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_newsletter`
--

DROP TABLE IF EXISTS `cmg_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_newsletter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `templateId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `lastSentAt` datetime DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_newsletter_1` (`templateId`),
  KEY `fk_cmg_newsletter_2` (`createdBy`),
  KEY `fk_cmg_newsletter_3` (`modifiedBy`),
  CONSTRAINT `fk_cmg_newsletter_1` FOREIGN KEY (`templateId`) REFERENCES `cmg_core_template` (`id`),
  CONSTRAINT `fk_cmg_newsletter_2` FOREIGN KEY (`createdBy`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_newsletter_3` FOREIGN KEY (`modifiedBy`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_newsletter`
--

LOCK TABLES `cmg_newsletter` WRITE;
/*!40000 ALTER TABLE `cmg_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_newsletter_list`
--

DROP TABLE IF EXISTS `cmg_newsletter_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_newsletter_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `newsletterId` bigint(20) NOT NULL,
  `memberId` bigint(20) NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_newsletter_list_1` (`newsletterId`),
  KEY `fk_cmg_newsletter_list_2` (`memberId`),
  CONSTRAINT `fk_cmg_newsletter_list_1` FOREIGN KEY (`newsletterId`) REFERENCES `cmg_newsletter` (`id`),
  CONSTRAINT `fk_cmg_newsletter_list_2` FOREIGN KEY (`memberId`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_newsletter_list`
--

LOCK TABLES `cmg_newsletter_list` WRITE;
/*!40000 ALTER TABLE `cmg_newsletter_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_newsletter_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_newsletter_member`
--

DROP TABLE IF EXISTS `cmg_newsletter_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_newsletter_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_newsletter_member`
--

LOCK TABLES `cmg_newsletter_member` WRITE;
/*!40000 ALTER TABLE `cmg_newsletter_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_newsletter_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_notify_event`
--

DROP TABLE IF EXISTS `cmg_notify_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_notify_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `preReminderCount` smallint(6) DEFAULT NULL,
  `preReminderInterval` smallint(6) DEFAULT NULL,
  `postReminderCount` smallint(6) DEFAULT NULL,
  `postReminderInterval` smallint(6) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `scheduledAt` datetime DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_event_1` (`userId`),
  CONSTRAINT `fk_cmg_event_1` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_notify_event`
--

LOCK TABLES `cmg_notify_event` WRITE;
/*!40000 ALTER TABLE `cmg_notify_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_notify_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_notify_model_event`
--

DROP TABLE IF EXISTS `cmg_notify_model_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_notify_model_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_event_1` (`eventId`),
  CONSTRAINT `fk_cmg_model_event_1` FOREIGN KEY (`eventId`) REFERENCES `cmg_notify_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_notify_model_event`
--

LOCK TABLES `cmg_notify_model_event` WRITE;
/*!40000 ALTER TABLE `cmg_notify_model_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_notify_model_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_notify_model_notification`
--

DROP TABLE IF EXISTS `cmg_notify_model_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_notify_model_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `createdBy` bigint(20) NOT NULL,
  `modifiedBy` bigint(20) DEFAULT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `follow` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumed` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_notification_1` (`userId`),
  CONSTRAINT `fk_cmg_model_notification_1` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_notify_model_notification`
--

LOCK TABLES `cmg_notify_model_notification` WRITE;
/*!40000 ALTER TABLE `cmg_notify_model_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_notify_model_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_notify_model_reminder`
--

DROP TABLE IF EXISTS `cmg_notify_model_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_notify_model_reminder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `eventId` bigint(20) NOT NULL,
  `parentId` bigint(20) NOT NULL,
  `parentType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_model_reminder_1` (`userId`),
  KEY `fk_cmg_model_reminder_2` (`eventId`),
  CONSTRAINT `fk_cmg_model_reminder_1` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`),
  CONSTRAINT `fk_cmg_model_reminder_2` FOREIGN KEY (`eventId`) REFERENCES `cmg_notify_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_notify_model_reminder`
--

LOCK TABLES `cmg_notify_model_reminder` WRITE;
/*!40000 ALTER TABLE `cmg_notify_model_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_notify_model_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmg_sns_profile`
--

DROP TABLE IF EXISTS `cmg_sns_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmg_sns_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `snsId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_cmg_sns_profile_1` (`userId`),
  CONSTRAINT `fk_cmg_sns_profile_1` FOREIGN KEY (`userId`) REFERENCES `cmg_core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmg_sns_profile`
--

LOCK TABLES `cmg_sns_profile` WRITE;
/*!40000 ALTER TABLE `cmg_sns_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmg_sns_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-08 10:38:48
