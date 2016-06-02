CREATE DATABASE  IF NOT EXISTS `nearby_pets_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nearby_pets_db`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 104.155.27.238    Database: nearby_pets_db
-- ------------------------------------------------------
-- Server version	5.6.29-google-log

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
-- Table structure for table `ad_types`
--

DROP TABLE IF EXISTS `ad_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_types` (
  `AdTypeId` int(1) NOT NULL,
  `AdTypeDesc` varchar(20) DEFAULT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`AdTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_types`
--

LOCK TABLES `ad_types` WRITE;
/*!40000 ALTER TABLE `ad_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryId` int(2) NOT NULL,
  `CategoryDesc` varchar(15) NOT NULL,
  `CategoryImageUrl` text,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_settings`
--

DROP TABLE IF EXISTS `config_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_settings` (
  `ConfigKey` varchar(30) NOT NULL,
  `ConfigValue` text NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`ConfigKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_settings`
--

LOCK TABLES `config_settings` WRITE;
/*!40000 ALTER TABLE `config_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_ads`
--

DROP TABLE IF EXISTS `favorite_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_ads` (
  `UserId` varchar(50) NOT NULL,
  `AdId` varchar(50) NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`UserId`,`AdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_ads`
--

LOCK TABLES `favorite_ads` WRITE;
/*!40000 ALTER TABLE `favorite_ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posted_ad`
--

DROP TABLE IF EXISTS `posted_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posted_ad` (
  `AdId` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `AdTitle` varchar(30) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Address` text NOT NULL,
  `DisplayAddress` text NOT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Price` decimal(7,2) DEFAULT NULL,
  `AdTypeId` int(1) DEFAULT '0',
  `StatusId` int(1) DEFAULT '0',
  `AdViews` int(8) DEFAULT '0',
  `Active` bit(1) DEFAULT NULL,
  `PostedDate` datetime NOT NULL,
  PRIMARY KEY (`AdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posted_ad`
--

LOCK TABLES `posted_ad` WRITE;
/*!40000 ALTER TABLE `posted_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `posted_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posted_ad_images`
--

DROP TABLE IF EXISTS `posted_ad_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posted_ad_images` (
  `ImageId` varchar(50) NOT NULL,
  `ImageUrl` text NOT NULL,
  `AdId` varchar(50) DEFAULT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`ImageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posted_ad_images`
--

LOCK TABLES `posted_ad_images` WRITE;
/*!40000 ALTER TABLE `posted_ad_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `posted_ad_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `RoleId` int(1) NOT NULL,
  `Role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Customer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `StatusId` int(1) NOT NULL,
  `StatusDesc` varchar(15) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`StatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` varchar(50) NOT NULL,
  `UserEmail` varchar(50) DEFAULT NULL,
  `Pwd` varchar(30) DEFAULT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `LoginSource` int(1) NOT NULL,
  `FbApiToken` varchar(100) DEFAULT NULL,
  `PhotoUrl` text,
  `CreatedDate` datetime NOT NULL,
  `RoleId` int(1) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('250f21a6-148a-44f9-a22b-c824b7fe825e','abc@gmail.com','abc@123','abc','xyz','1234567890',1,NULL,NULL,'2016-06-02 18:12:23',1,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nearby_pets_db'
--

--
-- Dumping routines for database 'nearby_pets_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-02 20:45:04
