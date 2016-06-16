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
INSERT INTO `ad_types` VALUES (0,'None',''),(1,'For Sale',''),(2,'For Adoption',''),(3,'Lost/Found','');
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
  `CategoryDesc` varchar(30) NOT NULL,
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
INSERT INTO `category` VALUES (1,'Birds','https://storage.googleapis.com/nearby-categories/birds.jpg',''),(2,'Cats','https://storage.googleapis.com/nearby-categories/cats.jpg',''),(3,'Dogs','https://storage.googleapis.com/nearby-categories/dogs.jpg',''),(4,'Fish And Aquarium','https://storage.googleapis.com/nearby-categories/fish-and-aquarium.jpg',''),(5,'Goats And Sheep','https://storage.googleapis.com/nearby-categories/goats-and-sheeps.jpg',''),(6,'Horses And Donkeys','https://storage.googleapis.com/nearby-categories/horses-and-donkeys.jpg',''),(7,'Poultry','https://storage.googleapis.com/nearby-categories/poultry.jpg',''),(8,'Rodents','https://storage.googleapis.com/nearby-categories/rodents.jpg',''),(9,'Reptiles','https://storage.googleapis.com/nearby-categories/reptiles.jpg',''),(10,'Accessories','https://storage.googleapis.com/nearby-categories/accessories.jpg',''),(11,'Food','https://storage.googleapis.com/nearby-categories/food.jpg',''),(12,'Services','https://storage.googleapis.com/nearby-categories/services.jpg',''),(13,'Lost And Found','https://storage.googleapis.com/nearby-categories/lost-and-found.jpg','');
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
INSERT INTO `config_settings` VALUES ('ClassifiedAdPageSize','10',''),('FacebookAdPageSize','5','');
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
  PRIMARY KEY (`UserId`,`AdId`),
  KEY `FkFavoriteAdId_idx` (`AdId`),
  KEY `FkFavoritePosetedAdId_idx` (`AdId`),
  CONSTRAINT `FkFavoritePostedAdAdId` FOREIGN KEY (`AdId`) REFERENCES `posted_ad` (`AdId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkFavoriteUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_ads`
--

LOCK TABLES `favorite_ads` WRITE;
/*!40000 ALTER TABLE `favorite_ads` DISABLE KEYS */;
INSERT INTO `favorite_ads` VALUES ('123C6C38-786A-5CD8-E13E-F5002CAC7305','9CF5F341-A2FB-BD34-0B9C-EDEF172A7CA5','2016-06-15 13:16:32',''),('123C6C38-786A-5CD8-E13E-F5002CAC7305','F616478A-9658-EA82-7EAF-A8C364D1D985','2016-06-15 12:52:15',''),('169FBFA0-250E-D746-5886-232AA46E7F32','08E4B4BF-7C3C-9660-ABE5-10F28F7B05A8','2016-06-14 17:10:35',''),('169FBFA0-250E-D746-5886-232AA46E7F32','42E06DE7-8CE8-7649-786E-549998E27606','2016-06-14 17:06:55',''),('169FBFA0-250E-D746-5886-232AA46E7F32','659456F4-DAD9-970A-2733-F5576338D830','2016-06-13 13:49:32',''),('169FBFA0-250E-D746-5886-232AA46E7F32','67C90B88-9AF5-FC3A-07D7-565882988FC2','2016-06-15 11:08:42',''),('169FBFA0-250E-D746-5886-232AA46E7F32','9A050999-2EC3-F1D2-2A06-11A16DE1CED3','2016-06-11 05:44:36',''),('169FBFA0-250E-D746-5886-232AA46E7F32','9F7EF6CC-28FD-3C9B-68E9-4C194B88005B','2016-06-15 11:09:38',''),('250f21a6-148a-44f9-a22b-c824b7fe825e','164367A7-5169-3236-E1A6-0167EEFF081A','2016-06-11 10:13:25',''),('250f21a6-148a-44f9-a22b-c824b7fe825e','e418a856-842c-4559-aa8f-504d1113a17e','2016-06-11 11:46:00',''),('2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0','164367A7-5169-3236-E1A6-0167EEFF081A','2016-06-11 18:51:25',''),('2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0','78D4C110-0099-9E7E-C60B-F9D97308403B','2016-06-11 18:51:19',''),('41F1DBDC-50A9-C87A-96E1-1322EE8F1B41','68A98DA8-AD12-0B51-55A3-6B403CF88D73','2016-06-10 14:44:07',''),('41F1DBDC-50A9-C87A-96E1-1322EE8F1B41','CBCDAD11-8907-AD40-1695-ABEDD29335BE','2016-06-10 14:44:04',''),('41F1DBDC-50A9-C87A-96E1-1322EE8F1B41','D48ED7F3-460E-B6D6-9E0A-439B6B469E5D','2016-06-10 14:44:36',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','28997CD0-199F-BED5-096F-42E3BC222C28','2016-06-10 14:21:55',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','369C1E01-84B2-5FA7-B597-A3E234698C86','2016-06-10 14:01:30',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','68A98DA8-AD12-0B51-55A3-6B403CF88D73','2016-06-15 08:28:26',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','7442717D-350F-5018-A32E-A9DDC353D7BB','2016-06-15 08:28:22',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','9BB6D5F2-15D6-4B8E-CF8A-226AB9DDE6AA','2016-06-09 16:36:32',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','9C28F681-D6BC-09CC-129C-DD455760DAD3','2016-06-10 14:02:46',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','A554DED6-14B5-CE4B-AEE4-413963070614','2016-06-10 06:43:50',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','CA0C1DD1-4FBE-F7CA-D189-0F20B868296A','2016-06-10 14:01:27',''),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','DD8A0C4E-136B-0562-D738-1980CD5975F9','2016-06-10 07:01:36',''),('6758F128-E8C6-AD4E-8377-4C70255DD9C9','2B388EAC-0233-AD90-AA38-4F61F63E9F62','2016-06-15 06:15:08',''),('6758F128-E8C6-AD4E-8377-4C70255DD9C9','4D6C2362-FDD4-E8C0-EC92-D48709429371','2016-06-15 06:14:43',''),('6758F128-E8C6-AD4E-8377-4C70255DD9C9','4F1BF183-6436-9D62-D241-7C3CB3D26379','2016-06-15 06:16:13',''),('98888C11-9B2A-1A3A-1DB5-AAAD220714AD','7442717D-350F-5018-A32E-A9DDC353D7BB','2016-06-11 11:14:02',''),('98888C11-9B2A-1A3A-1DB5-AAAD220714AD','7d2cdec6-640e-40bf-ba06-d390db6fa16d','2016-06-11 11:39:40','');
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
  `DisplayImgUrl` text,
  `CategoryId` int(2) NOT NULL,
  `AddressType` int(1) NOT NULL,
  PRIMARY KEY (`AdId`),
  KEY `FkUserPostedAdUserId_idx` (`UserId`),
  KEY `FkCategoryPostedAdsCategoryId_idx` (`CategoryId`),
  CONSTRAINT `FkCategoryPostedAdsCategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkUserPostedAdUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posted_ad`
--

LOCK TABLES `posted_ad` WRITE;
/*!40000 ALTER TABLE `posted_ad` DISABLE KEYS */;
INSERT INTO `posted_ad` VALUES ('0154c009-d510-448e-a38c-fde27e9b4f87','123C6C38-786A-5CD8-E13E-F5002CAC7305','Hen for adoption 1','Hen giving lot of eggs in a day is now available f','Aradhana Garden Restaurant, Alandi Road, Alandi, Pune, Maharashtra 412105','Alandi road',18.6750241,73.8239086,6322.34,2,0,4,'','2016-06-03 12:28:17',NULL,7,0),('0254813E-D389-A519-2CDC-1E1951B441A8','123C6C38-786A-5CD8-E13E-F5002CAC7305','test55','test55','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494184,73.7893328,25.00,1,0,1,'','2016-06-13 13:28:10','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:02:07.419.JPG',2,0),('0586CF30-54F4-A4DF-6801-9EBD7C113EC5','123C6C38-786A-5CD8-E13E-F5002CAC7305','cat5','vcvfdgggf','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494184,73.7893328,12.00,1,0,3,'','2016-06-13 13:29:27','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:03:24.098.JPG',2,0),('0690E8A4-72E3-DCC8-0139-B91979B154C3','123C6C38-786A-5CD8-E13E-F5002CAC7305','test123','abcd','Pune','Pune',18.5493943,73.7892884,5.00,0,0,1,'','2016-06-10 11:01:22',NULL,1,0),('08E4B4BF-7C3C-9660-ABE5-10F28F7B05A8','169FBFA0-250E-D746-5886-232AA46E7F32','test','hswllw','Myrtiotissis, Germasogeia 4041, Cyprus','Myrtiotissis, Germasogeia 4041, Cyprus',34.7026311,33.0855445,949.00,1,0,12,'','2016-06-14 17:08:54','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-14%2020:08:19.606.JPG',2,2),('09ea7ebb-fbb6-4e00-b6a8-0f4079c43fbe','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Fish sale 3','Sale of fish and aquarium','Minus 18 Degrees, Shop No. 273/5, Opp. Green Park Hotel, Baner Road, Baner, Pune, Maharashtra 411045','Minus 18 Degrees, Shop No. 273/5, Opp. Green Park Hotel, Baner Road, Baner, Pune, Maharashtra 411045',18.552986,73.8031839,1000.00,0,2,5,'','2016-06-04 12:28:17',NULL,4,0),('0e0c0f15-7b0a-4f91-b0fa-91538d29663f','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Pet rodents','The biology and behaviour of many pet rodents is s','Church of Saint Lazarus, Larnaca, Cyprus','Church of Saint Lazarus, Larnaca, Cyprus',34.9114292,33.5649596,25.79,2,1,1,'','2016-05-18 12:28:17',NULL,8,0),('136E28B1-D9CE-6871-A6DF-A45709B17922','740F6BA8-BD56-5132-18FB-D578C38099C1','dog for play 12','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,3,'','2016-06-06 12:54:18',NULL,2,0),('164367A7-5169-3236-E1A6-0167EEFF081A','123C6C38-786A-5CD8-E13E-F5002CAC7305','Test 1234','Test 1234','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.54942,73.7893128,6654.00,2,0,24,'','2016-06-10 13:35:20','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2019:07:27.036.JPG',5,0),('23B9AE89-7F0E-3989-C256-A55BD491B6C7','123C6C38-786A-5CD8-E13E-F5002CAC7305','shri','shri','Pune','S.NO -135 Pune',18.549785,73.78959,12.00,2,0,13,'','2016-06-08 13:05:46','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:35:28.949.JPG',2,0),('263f8440-deb7-4d15-8ac0-d8385878a617','F0D88605-89DF-83C3-5DEA-52B2EF43F054','Found lost sheep 4','Sheep and goat found, got it from near the river','454/5, Mitramandal Chowk, Near Sarasbaug, Parvati Darshan, Pune, Maharashtra 411009','Parvati, Pune',18.4973573,73.8539415,950.20,3,0,0,'','2016-06-05 12:28:17',NULL,5,0),('28997CD0-199F-BED5-096F-42E3BC222C28','123C6C38-786A-5CD8-E13E-F5002CAC7305','puh','pug','Pune','Pune',18.549785,73.78959,12.00,0,0,6,'','2016-06-08 13:39:43','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:08:14.338.JPG',3,0),('2b14724d-1ac3-4ffa-bf62-3a5293d16c46','123C6C38-786A-5CD8-E13E-F5002CAC7305','Goats for sale','SALES ARE BEING HELD EVERY SATURDAY AT 11AM BEFORE','Paphos Archaeological Park, Paphos, Cyprus','Cyprus',34.7597647,32.3384593,99.99,2,0,8,'','2016-06-07 12:28:17',NULL,5,0),('2B388EAC-0233-AD90-AA38-4F61F63E9F62','123C6C38-786A-5CD8-E13E-F5002CAC7305','test','trest image dasdfghkkhfddghhg fuijffhugghygt','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493828,73.7892941,12.00,1,0,9,'','2016-06-13 11:06:11','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:40:19.734.JPG',1,0),('2E026CE6-5841-580B-C276-6E573B53300E','123C6C38-786A-5CD8-E13E-F5002CAC7305','with out img','no image','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5493943,73.7892884,80.00,0,0,0,'','2016-06-10 10:54:38',NULL,2,0),('302877bc-055a-424b-8138-2c83579cb9fe','123C6C38-786A-5CD8-E13E-F5002CAC7305','Sale of cats 5','Sale of Cats is not so easy, but i am selling as i','Shop No. 8, Baner - Pashan Link Rd, Pashan, Pune, Maharashtra 411021','Pashan, Pune',18.5518356,73.7929076,535.50,0,0,0,'','2016-06-02 12:28:17',NULL,2,0),('30993B59-A5E4-E3E2-F66F-253E92F3204D','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing image','images are here','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494144,73.7893336,123.00,1,0,0,'','2016-06-13 13:11:59','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:45:32.022.JPG',2,0),('323EAF4D-5066-7472-83CA-0FD40FA83598','2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0','garos','garos polemitkiotis','Demetsanas, Kato Polemidia, Cyprus','Kato Polemidia',34.6896015,33.0005025,0.10,1,0,9,'','2016-06-11 21:16:36','http://nearby-ads.storage.googleapis.com/2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0/2016-06-12%2000:16:24.479.JPG',6,0),('369C1E01-84B2-5FA7-B597-A3E234698C86','123C6C38-786A-5CD8-E13E-F5002CAC7305','ramesh','abcdefg','Pune','Pune',18.5493943,73.7892884,20.00,0,0,2,'','2016-06-10 11:06:00',NULL,1,0),('37AD2047-BFC6-BDCD-89ED-FDB8B45236EE','123C6C38-786A-5CD8-E13E-F5002CAC7305','test455%555','rfyyyfghuytyiuytytyygyyhhhbhklouhjjju','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493811,73.7893388,12.00,1,0,1,'','2016-06-13 07:37:59','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:11:16.833.JPG',1,0),('3A534B29-EA87-C616-C0F8-627CB48EC6AF','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,2,'','2016-06-06 13:21:24',NULL,2,0),('42E06DE7-8CE8-7649-786E-549998E27606','FC89D95E-BA78-FEE4-C3FD-CA8999593BC2','three image','ttgggggg','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494374,73.7893074,45.00,1,0,11,'','2016-06-13 13:56:21','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:25:30.482.JPG',1,0),('43D14AAD-A1D3-3B82-4E31-B023DB37062F','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,0,'','2016-06-06 14:02:45',NULL,2,0),('452bb7f6-1bee-4915-b45a-703eeb734ef1','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Cat for adoption 7','I have a cat which needs to be adopted','Naivedyam Restaurant, Akurdi, Pimpri-Chinchwad, Maharashtra 411019','Pimpri Chinchwad',18.6490201,73.7867398,150.55,2,0,2,'','2016-06-05 12:28:17',NULL,2,0),('46757BB0-F591-14CE-8A68-E4FF31CC5286','123C6C38-786A-5CD8-E13E-F5002CAC7305','ramesh','abcdefg','Pune','Pune',18.5493943,73.7892884,20.00,0,0,2,'','2016-06-10 11:06:28',NULL,1,0),('468443ED-BA16-15DD-CB8D-59CCA97A3E3E','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,2,'','2016-06-06 14:10:23',NULL,2,0),('46F8FEE5-B010-1251-2C6F-DEA027D77EFD','740F6BA8-BD56-5132-18FB-D578C38099C1','Parret','He can talk like humen.','Church of Saint Lazarus, Larnaca, Cyprus','Mexico',NULL,NULL,200.00,2,0,0,'','2016-06-08 10:25:44','http://nearby-ads.storage.googleapis.com/740F6BA8-BD56-5132-18FB-D578C38099C1/ABCd.JPG',8,0),('48E3B44B-801A-B129-B5A4-BE8387956F63','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,9,'','2016-06-06 13:23:33',NULL,2,0),('4D358638-8486-C675-492F-123CCE944822','123C6C38-786A-5CD8-E13E-F5002CAC7305','fffffhhgfhgfgfgg','jgfjffgggggg yjjggjyfgygyy hghjygghhh','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493822,73.7892769,25.00,2,0,4,'','2016-06-13 09:50:21','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:19:25.393.JPG',2,0),('4D6C2362-FDD4-E8C0-EC92-D48709429371','6758F128-E8C6-AD4E-8377-4C70255DD9C9','hsvvs','ysgsvs s shsjsisihsvddvshwuw. hshshw','S.NO -135, Pashan, Pune, Maharashtra 411021, India','Pune',18.5494123,73.789241,1235.00,2,0,9,'','2016-06-14 12:41:10','http://nearby-ads.storage.googleapis.com/6758F128-E8C6-AD4E-8377-4C70255DD9C9/2016-06-14%2018:10:37.856.JPG',2,1),('4F1BF183-6436-9D62-D241-7C3CB3D26379','123C6C38-786A-5CD8-E13E-F5002CAC7305','test123','abcd','Pune','Pune',18.5493943,73.7892884,5.00,0,0,0,'','2016-06-10 11:01:42',NULL,1,0),('5452C529-3468-028B-664C-5D6340147895','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing images','testing 123','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494195,73.7893165,12.00,1,0,0,'','2016-06-13 06:34:55','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:08:23.611.JPG',1,0),('5457CCE1-C6E8-232F-65EA-FE48AF05F90D','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing images','testing images demo fghhdssfjhfdfh htdfjjgfbnn hff','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493588,73.7893198,12.00,0,0,0,'','2016-06-13 10:55:27','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:29:14.853.JPG',1,0),('577B211A-37ED-4C7A-41A0-F1DAF0CB4317','2231B674-951F-F9C2-9327-0AFA933CF482','test','djdjdjd','Spyrou Kyprianou Ave, Limassol, Cyprus','Spyrou Kyprianou Ave, Limassol, Cyprus',34.6976272,33.0316658,555.00,3,2,2,'','2016-06-15 13:54:09','http://nearby-ads.storage.googleapis.com/2231B674-951F-F9C2-9327-0AFA933CF482/2016-06-15%2016:53:41.457.JPG',1,2),('5CF24DF7-6DB0-0A30-E92C-07C69D4C73AE','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,0,'','2016-06-06 13:12:23',NULL,2,0),('5D3A007E-AF42-84BF-3D6F-DB21DFD9A9FA','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,1,'','2016-06-06 13:11:29',NULL,2,0),('5E30DCA1-ED60-C9FF-1A29-CEEB1D504B86','123C6C38-786A-5CD8-E13E-F5002CAC7305','test','adfghjjh','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493651,73.7892653,45.00,1,0,0,'','2016-06-15 13:30:27','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-15%2019:00:09.702.JPG',1,2),('61DA586B-68FB-2D9D-7044-2EE7A7622372','123C6C38-786A-5CD8-E13E-F5002CAC7305','with image','images','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5493943,73.7892884,25.00,2,0,0,'','2016-06-10 11:08:09','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:38.251.JPG',1,0),('626AB880-0FBD-E69C-DCBC-0E39142D1F00','123C6C38-786A-5CD8-E13E-F5002CAC7305','fish','testing','Pune','S.NO -135 Pune',18.549785,73.78959,15.00,1,0,18,'','2016-06-08 13:44:04','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:13:18.730.JPG',4,0),('63973C3D-5FEC-DB19-5274-1E775CC1F63B','169FBFA0-250E-D746-5886-232AA46E7F32','goat1','test','Myrtiotissis, Germasogeia 4041, Cyprus','Myrtiotissis, Germasogeia 4041, Cyprus',34.7063264,33.0872157,545.00,1,0,0,'','2016-06-11 15:33:26',NULL,5,0),('659456F4-DAD9-970A-2733-F5576338D830','123C6C38-786A-5CD8-E13E-F5002CAC7305','ahgt','sfkjffyy','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493824,73.7892806,12.00,1,0,5,'','2016-06-13 13:43:24','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:17:05.550.JPG',2,0),('67C90B88-9AF5-FC3A-07D7-565882988FC2','5BFB9E2C-74FB-A7DA-2837-91B9F959611B','My Testing Advertising for Pet','This is a testing website, and needs to be tested ','4, Baner - Pashan Link Rd, Pashan, Pune, Maharashtra 411021, India','4, Baner - Pashan Link Rd, Pashan, Pune, Maharashtra 411021, India',18.5501947,73.7909911,146.00,3,0,19,'','2016-06-15 08:27:08','http://nearby-ads.storage.googleapis.com/5BFB9E2C-74FB-A7DA-2837-91B9F959611B/2016-06-15%2013:55:13.931.JPG',3,2),('67EBEFEA-9CA3-BB90-53F6-9942A85CB0E0','123C6C38-786A-5CD8-E13E-F5002CAC7305','testffhvgh','fgyyggggg gghgv GB GHG bhhfvghhgvvhvvb','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493295,73.7893383,58.00,1,0,0,'','2016-06-13 09:41:37','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:10:19.283.JPG',1,0),('68A98DA8-AD12-0B51-55A3-6B403CF88D73','123C6C38-786A-5CD8-E13E-F5002CAC7305','mouse','mouse chrck','Pune','Pune',18.5493943,73.7892884,25.00,2,0,0,'','2016-06-10 11:33:29','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2017:02:34.790.JPG',1,0),('6AAA7BB4-A927-CA8B-D825-C7CE052572CB','123C6C38-786A-5CD8-E13E-F5002CAC7305','testtttttttttyyyygg','fffgygghfggggghhhhgghguhggyghggggjgfgghghhhhgggvhh','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494133,73.789287,25.00,1,0,4,'','2016-06-13 06:56:03','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:24:34.333.JPG',1,0),('6eed7bef-688e-4dbe-a8e6-868eb442a2ea','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Parakeet as a Pet','Parakeets love to be stroked and held and want to ','Tombs Of the Kings, Paphos, Cyprus','Paphos, Cyprus',34.7754451,32.3356273,38.99,2,0,2,'','2016-05-07 03:09:17',NULL,1,0),('6fd6379a-6877-4656-9d0f-ddea61bc7526','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Food for pets','Pedigree helps pets to stay fit. Check this out','Pune Nagar Road, Kalyani Nagar, Pune, Maharashtra 411014','Shaniwar Peth, Pune, Maharashtra 411030',18.5195583,73.8531921,479.15,2,0,1,'','2016-05-09 12:28:17',NULL,12,0),('70616359-D5EE-B44C-DECF-728AE86BC52D','123C6C38-786A-5CD8-E13E-F5002CAC7305','tom','nice','Pune','S.NO -135 Pune',18.549785,73.78959,12.00,2,0,2,'','2016-06-08 13:00:06','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:29:12.901.JPG',2,0),('71319b62-d269-4c48-9ed9-60213c560f00','123C6C38-786A-5CD8-E13E-F5002CAC7305','Leopard Gecko','Leopard geckos are fantastic for beginning pet par','Nyati County, NIBM Annexe, South Pune Mohamadwadi, Pune, Maharashtra 411060','Nyati County, NIBM Annexe, South Pune Mohamadwadi, Pune, Maharashtra 411060',18.4953457,73.8935228,200.00,2,0,2,'','2016-05-07 04:10:00',NULL,9,0),('727A3F96-4C04-BEC1-F95E-C0E09E4058BA','123C6C38-786A-5CD8-E13E-F5002CAC7305','fyyfgh','','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493451,73.7893155,12.00,1,0,3,'','2016-06-13 11:35:44',NULL,6,0),('741F0A11-D390-7617-5A26-76328ECD2D0E','6E01BC52-16EA-4B42-1F5E-798B1827970A','Test phone number','abcd','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493659,73.7892654,457.00,1,0,4,'','2016-06-13 06:32:27','http://nearby-ads.storage.googleapis.com/6E01BC52-16EA-4B42-1F5E-798B1827970A/2016-06-13%2012:01:10.690.JPG',3,0),('741F0EF0-305C-C12E-584D-2FEEF3DB6928','169FBFA0-250E-D746-5886-232AA46E7F32','hffg','hdd','Myrtiotissis, Germasogeia 4041, Cyprus','Myrtiotissis, Germasogeia 4041, Cyprus',34.7026349,33.0855014,55.00,1,3,2,'','2016-06-13 19:53:54','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2022:52:44.008.JPG',2,0),('7442717D-350F-5018-A32E-A9DDC353D7BB','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing3','testing','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5494046,73.7892865,12.00,1,0,7,'','2016-06-10 13:17:13','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:48:34.870.JPG',10,0),('7458D827-6632-E8DA-C877-907BC9B98F85','2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0','poulw ti gieneka mou','fina tritzefali!!','Demetsanas, Kato Polemidia, Cyprus','Kato Polemidia',34.6897054,33.0004428,0.10,2,2,0,'','2016-06-12 09:29:56',NULL,9,0),('757DF946-8FFD-26A1-52D1-C610D509A508','169FBFA0-250E-D746-5886-232AA46E7F32','goat1','test','Myrtiotissis, Germasogeia 4041, Cyprus','Myrtiotissis, Germasogeia 4041, Cyprus',34.7063264,33.0872157,80.00,1,0,3,'','2016-06-11 15:37:43','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-11%2018:36:01.057.JPG',5,0),('78D4C110-0099-9E7E-C60B-F9D97308403B','5BFB9E2C-74FB-A7DA-2837-91B9F959611B','Temp Advertise','check this new ad','S.NO -135, Pashan, Pune, Maharashtra 411021, India','Pune',18.5493995,73.7893238,124.00,3,0,7,'','2016-06-11 13:14:35',NULL,6,0),('78E1F051-1322-9BC4-1A74-E5A6108026E7','123C6C38-786A-5CD8-E13E-F5002CAC7305','mouse','mouse chrck','Pune','Pune',18.5493943,73.7892884,25.00,2,0,1,'','2016-06-10 11:33:06','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2017:02:34.790.JPG',1,0),('7d2cdec6-640e-40bf-ba06-d390db6fa16d','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Lost cat with grey hair','Cat lost, if you can help me find her, will give s','Pune Nagar Road, Kalyani Nagar, Pune, Maharashtra 411014','Aga Khan Palace',18.5249162,73.8629672,9001.11,2,0,2,'','2016-05-04 12:28:17',NULL,13,0),('9041263F-6BD3-ECAB-267E-DC52FD2D0E4E','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Hi test','anndnjfkfm','S.NO -135, Pashan, Pune, Maharashtra 411021, India','Pune',18.5494546,73.7893169,125.00,2,1,0,'','2016-06-15 05:15:58','http://nearby-ads.storage.googleapis.com/6758F128-E8C6-AD4E-8377-4C70255DD9C9/2016-06-15%2010:45:23.697.JPG',1,1),('9195D893-AE58-4F45-AEA1-78F764E1C9BE','250f21a6-148a-44f9-a22b-c824b7fe825e','dog for play 12','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,0,'','2016-06-06 12:50:18',NULL,2,0),('91B9BAEC-36E7-0C4B-D1FF-0D4BCCA55E86','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing1234577655','tesedfhggffffggfffggfghyfggfcggfcgfxvgfdgfdvgfdfdd','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.549377,73.7893023,45.00,1,0,1,'','2016-06-13 06:49:38','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:18:27.832.JPG',1,0),('92ac0698-014a-4f2f-86fe-a6ac5b25140d','123C6C38-786A-5CD8-E13E-F5002CAC7305','Beautiful snakes','Snakes are popular pet reptiles. They can be easy ','Chandani Chowk, Bavdhan, Pune, Maharashtra 411021','Chandani Chowk, Bavdhan, Pune, Maharashtra 411021',18.525216,73.862967,479.15,2,0,0,'','2016-05-09 12:28:17',NULL,9,0),('93C9A297-B76A-8665-AABC-8E530D00EE5A','123C6C38-786A-5CD8-E13E-F5002CAC7305','two image ','ttttfdggffdfg','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494184,73.7893328,12.00,1,0,3,'','2016-06-13 13:31:13','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:04:51.946.JPG',1,0),('96CA5B27-A7D4-182F-4B72-49E78C487561','123C6C38-786A-5CD8-E13E-F5002CAC7305','cat testing for images','demo. text ggddfhjhff fddfhjufdcbnjtdvbhffvjyffhbj','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.549366,73.7892663,50.00,1,0,4,'','2016-06-13 09:48:56','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:17:44.637.JPG',2,0),('9A050999-2EC3-F1D2-2A06-11A16DE1CED3','FC89D95E-BA78-FEE4-C3FD-CA8999593BC2','testing4','testing4','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5493943,73.7892884,12.00,0,0,8,'','2016-06-10 13:32:55',NULL,1,0),('9BB6D5F2-15D6-4B8E-CF8A-226AB9DDE6AA','123C6C38-786A-5CD8-E13E-F5002CAC7305','my pug','good','Pune','S.NO -135 Pune',18.549785,73.78959,12.00,2,0,8,'','2016-06-08 13:29:32','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:58:22.379.JPG',2,0),('9C28F681-D6BC-09CC-129C-DD455760DAD3','123C6C38-786A-5CD8-E13E-F5002CAC7305','bunny','hey he is great','Pune','Pune',18.549785,73.78959,12.00,1,0,18,'','2016-06-08 13:57:33','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:26:30.021.JPG',3,0),('9CF5F341-A2FB-BD34-0B9C-EDEF172A7CA5','169FBFA0-250E-D746-5886-232AA46E7F32','hhd','gsf','Filotimou, Limassol, Cyprus','Limassol',34.6970912,33.0326915,222.00,1,0,3,'','2016-06-15 11:07:50','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2014:07:39.554.JPG',1,1),('9F7EF6CC-28FD-3C9B-68E9-4C194B88005B','FC89D95E-BA78-FEE4-C3FD-CA8999593BC2','test','ghhhhhhhh','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493566,73.7893316,12.00,1,0,7,'','2016-06-13 13:55:08','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:24:04.812.JPG',1,0),('A3998FD7-5237-32EC-B042-62BB1044B6C8','2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0','poulw ti gieneka mou','fina tritzefali!!','Demetsanas, Kato Polemidia, Cyprus','Kato Polemidia',34.6897054,33.0004428,0.10,2,0,15,'','2016-06-12 09:30:57','http://nearby-ads.storage.googleapis.com/2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0/2016-06-12%2012:26:43.294.JPG',9,0),('A4D6CF8A-F343-1116-9D11-E622D3ED44DB','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing a for images','iyyfguff hyhjuyfvh jyfgjitfhih uyrefklohfffgj uyft','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494053,73.7892835,12.00,1,0,0,'','2016-06-13 07:43:30',NULL,1,0),('A554DED6-14B5-CE4B-AEE4-413963070614','5BFB9E2C-74FB-A7DA-2837-91B9F959611B','Rodent for Sale','Check this rodent, this very friendly animal','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.549441,73.7893249,150.00,1,1,0,'','2016-06-09 15:45:47','http://nearby-ads.storage.googleapis.com/5BFB9E2C-74FB-A7DA-2837-91B9F959611B/2016-06-09%2021:20:22.806.JPG',8,0),('AC5749B8-26E2-5E05-3918-FE7E51FEF36A','FC89D95E-BA78-FEE4-C3FD-CA8999593BC2','3 images','hfxgccmcgjxgdkchkc','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493796,73.7893214,450.00,2,3,2,'','2016-06-13 14:01:35','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:30:55.469.JPG',3,0),('AEBD498E-A88D-1119-76A6-2DA31E57261B','123C6C38-786A-5CD8-E13E-F5002CAC7305','test1244','dfgdfg','4, Baner - Pashan Link Rd, Pashan, Pune, Maharashtra 411021, India','4, Baner - Pashan Link Rd, Pashan, Pune, Maharashtra 411021, India',18.5501947,73.7909911,45.00,1,0,3,'','2016-06-15 13:32:00','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-15%2019:01:40.127.JPG',2,2),('AEDFA59F-827C-A09A-C994-9C3B7D42AC60','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,1,'','2016-06-06 13:00:16',NULL,2,0),('AF30FA5F-FB87-E51D-82D2-9A69439E168E','6758F128-E8C6-AD4E-8377-4C70255DD9C9','abcd','bbbb','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493348,73.7893257,125.00,2,0,0,'','2016-06-14 12:31:57',NULL,1,1),('B29B9F78-1AF1-4219-2AFE-35450EF7CF5C','123C6C38-786A-5CD8-E13E-F5002CAC7305','test45','test','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493743,73.7892955,12.00,1,0,5,'','2016-06-13 11:53:52','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2017:27:05.421.JPG',7,0),('B2F51B69-FFE9-2E6A-3A39-BCFFAB35064B','123C6C38-786A-5CD8-E13E-F5002CAC7305','second ad','testing text','S.NO -135, Pashan, Pune, Maharashtra 411021, India','Pune',18.5494144,73.7893336,58.00,1,0,3,'','2016-06-13 13:13:05','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:46:58.547.JPG',3,0),('b6c6f36c-2087-4b7d-94ce-6ac052a9dac9','123C6C38-786A-5CD8-E13E-F5002CAC7305','Sheep goats for sale','We currently have 3 male kids for sale. Videos are','Kyrenia Castle, Küpdemir Sokak, Girne','Kyrenia Castle, Küpdemir Sokak, Girne',35.3487408,33.3228854,120.00,2,0,3,'','2016-06-07 04:10:00',NULL,5,0),('B8482618-06D0-3AC9-07DF-46F7A7537E42','123C6C38-786A-5CD8-E13E-F5002CAC7305','with image','images','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5493943,73.7892884,25.00,2,0,0,'','2016-06-10 11:07:33','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:38.251.JPG',1,0),('bb491d53-46a1-4b46-ab1f-29d3f9d03afa','123C6C38-786A-5CD8-E13E-F5002CAC7305','True Chews® Chicken Jerky Fill','High levels of protein and natural ingredients for','EsselWorld, Global Pagoda Road, Gorai Island, Borivali West, Mumbai, Maharashtra 400091','Borivali, Mumbai',18.9633342,72.8614459,200.00,2,0,3,'','2016-05-21 04:10:00',NULL,3,0),('BDCBA727-ED24-E22A-381E-D6AA94C707FD','FC89D95E-BA78-FEE4-C3FD-CA8999593BC2','ggffgh','ggghhg','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494045,73.7893175,48.00,1,3,2,'','2016-06-13 14:02:30','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:31:50.090.JPG',1,0),('C0B04C17-079B-5E9F-A295-05A982357FE6','123C6C38-786A-5CD8-E13E-F5002CAC7305','test5','test5','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494184,73.7893328,58.00,1,0,0,'','2016-06-13 13:26:58','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:01:17.135.JPG',3,0),('C15D652B-2004-6AB4-EDAB-46189B61C120','169FBFA0-250E-D746-5886-232AA46E7F32','fafafag','ydysysys','Filotimou, Limassol, Cyprus','Filotimou, Limassol, Cyprus',34.6970636,33.0326644,545.00,1,3,0,'','2016-06-15 13:12:14','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2016:11:33.866.JPG',1,2),('c76b81ee-70fc-4f53-8d99-d183d7844361','123C6C38-786A-5CD8-E13E-F5002CAC7305','Dog for Sale 9','Selling pet is good idea, so thought of sharing th','Ground Floor,Commercial Complex, Baner Pashan Link Road, Orange County, Near Balaji chowk, Pune, Maharashtra 411008','Baner, Pune',18.543983,73.790434,2000.10,0,0,0,'','2016-06-04 12:28:17',NULL,3,0),('CA0C1DD1-4FBE-F7CA-D189-0F20B868296A','123C6C38-786A-5CD8-E13E-F5002CAC7305','image list','super image','Pune','Pune',18.5493943,73.7892884,11.00,1,0,0,'','2016-06-10 10:53:52','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:22:51.728.JPG',1,0),('CBCDAD11-8907-AD40-1695-ABEDD29335BE','123C6C38-786A-5CD8-E13E-F5002CAC7305','test12','testing','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5494012,73.7893072,12.00,1,0,6,'','2016-06-10 12:55:29','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:22:56.118.JPG',1,0),('CC5DBC4F-9A6A-FC26-D2D1-5FF5EA961C9E','169FBFA0-250E-D746-5886-232AA46E7F32','lala','lele','Germasogeia','Germasogeia',34.702632,33.0855472,6464.00,1,2,0,'','2016-06-11 11:30:59',NULL,4,0),('D48ED7F3-460E-B6D6-9E0A-439B6B469E5D','123C6C38-786A-5CD8-E13E-F5002CAC7305','shrinivas','shri','Pune','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5493839,73.7893161,12.00,0,0,3,'','2016-06-10 12:47:07','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:19:29.690.JPG',1,0),('D6CC11E8-8B60-BE3F-1EFE-167FCD08A4D3','41F1DBDC-50A9-C87A-96E1-1322EE8F1B41','Horse Test','Test Test for horses','Pune','Pune',18.5493943,73.7892884,663.00,2,2,0,'','2016-06-10 14:46:47','http://nearby-ads.storage.googleapis.com/41F1DBDC-50A9-C87A-96E1-1322EE8F1B41/2016-06-10%2020:15:07.227.JPG',6,0),('D8DA40C3-2393-41B3-17B6-C52ACE0BB0BA','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing333','test','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493824,73.7892806,12.00,1,0,1,'','2016-06-13 13:41:20','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:15:21.165.JPG',2,0),('d8f525ed-593c-4b0e-b877-f725543c3161','123C6C38-786A-5CD8-E13E-F5002CAC7305','The Burro and Mule','The word “donkey” in the United States often refer','Kolossi Castle, Λεωφόρος Αρχιεπισκόπου Μακαρίου Γ, Cyprus','Cyprus',34.6651248,32.864042,479.15,2,0,3,'','2016-05-30 12:28:17',NULL,6,0),('DBA9C859-83A7-902C-1FAF-0DC583A9F981','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,0,'','2016-06-06 14:09:27',NULL,2,0),('DC98DF8B-A9D3-7BDB-3978-F611B04931D4','123C6C38-786A-5CD8-E13E-F5002CAC7305','abcd','adfgggh','','',18.5493664,73.7892659,58.00,1,0,1,'','2016-06-15 13:17:42',NULL,1,2),('DD695023-4557-5CCE-D7F2-5A035F528E28','2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0','fsfgf','gbvxx','Demetsanas, Kato Polemidia, Cyprus','Demetsanas, Kato Polemidia, Cyprus',34.689619,33.0005135,6555.00,1,0,2,'','2016-06-11 18:55:25','http://nearby-ads.storage.googleapis.com/2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0/2016-06-11%2021:54:10.210.JPG',7,0),('DD8A0C4E-136B-0562-D738-1980CD5975F9','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,0,7,'','2016-06-06 14:13:22','http://nearby-ads.storage.googleapis.com/00235904-531B-653A-6F09-67FCF4BB7D5F/new.png',2,0),('E28F1C88-A4A5-8C84-37BD-E631147DE2EC','6758F128-E8C6-AD4E-8377-4C70255DD9C9','abcd','bbbb','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5493348,73.7893257,125.00,2,0,2,'','2016-06-14 12:39:14',NULL,1,1),('e418a856-842c-4559-aa8f-504d1113a17e','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Parakeet as a Pet','Parakeets love to be stroked and held and want to ','Tombs Of the Kings, Paphos, Cyprus','Paphos, Cyprus',34.7754451,32.3356273,38.99,2,3,3,'','2016-05-07 03:09:17',NULL,1,0),('E99D314D-9BBD-C702-29BF-49D85E8A94A6','5BFB9E2C-74FB-A7DA-2837-91B9F959611B','Test Accessories Ad without im','Test Ad without image','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India','S.NO -135 ,Pashan ,Pune, Maharashtra 411021 ,India',18.5494032,73.7893014,221.00,1,0,5,'','2016-06-11 11:55:39',NULL,10,0),('eaa813c6-7334-4000-bcfb-2341c14bb9b9','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Marineland® 75G Aquarium Majes','Marineland rectangular aquariums deliver style, ve','Gateway Of India Mumbai, Mumbai, Maharashtra','Gateway Of India Mumbai, Mumbai, Maharashtra',18.921971,72.7646138,425.79,2,0,1,'','2016-05-18 12:28:17',NULL,4,0),('f1153db9-618c-4c1d-85ef-9f9a9e1a2fe5','F0D88605-89DF-83C3-5DEA-52B2EF43F054','Puppy for sale 10','Sale Sale Sale, A good puppy for sale','Fountain Family Restaurant, 364/65, Call-9766422035, Shivajinagar, Pune, Maharashtra 411005','Fountain Family Restaurant, 364/65, Call-9766422035, Shivajinagar, Pune, Maharashtra 411005',18.5266243,73.8522386,350.00,1,0,1,'','2016-06-05 12:28:17',NULL,4,0),('f20ec66a-ff8d-4fba-be8e-167b4135ce7f','6758F128-E8C6-AD4E-8377-4C70255DD9C9','Blue Parakeet','Parakeets love to be stroked and held and want to ','Hinjawadi Near Balewadi Sports Complex, Pashan Exit, Pune Banglore Highway Pashan Exit, Baner, Pune, Maharashtra 411045','Hinjawadi Near Balewadi Sports Complex, Pashan Exit, Pune Banglore Highway Pashan Exit, Baner, Pune, Maharashtra 411045',18.4994711,73.8066619,19.99,2,0,3,'','2016-05-04 12:28:17',NULL,1,0),('F616478A-9658-EA82-7EAF-A8C364D1D985','169FBFA0-250E-D746-5886-232AA46E7F32','rrrr','ighh','Filotimou, Limassol, Cyprus','Filotimou, Limassol, Cyprus',34.6970912,33.0326915,555.00,1,3,1,'','2016-06-15 11:05:31','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2014:04:51.621.JPG',4,2),('F62699B8-4AFD-5E60-0516-605E76DBB35E','123C6C38-786A-5CD8-E13E-F5002CAC7305','testing a for images','iyyfguff hyhjuyfvh jyfgjitfhih uyrefklohfffgj uyft','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494053,73.7892835,12.00,1,0,2,'','2016-06-13 07:44:37','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:16:31.762.JPG',1,0),('F9520717-814B-ACAB-275F-8C05FA70229B','123C6C38-786A-5CD8-E13E-F5002CAC7305','two images','testimg','S.NO -135, Pashan, Pune, Maharashtra 411021, India','S.NO -135, Pashan, Pune, Maharashtra 411021, India',18.5494245,73.7893372,58.00,1,0,1,'','2016-06-13 13:15:25','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:49:45.577.JPG',2,0),('FB55C672-324F-E7E7-B24E-452DCDAB05D4','123C6C38-786A-5CD8-E13E-F5002CAC7305','Tom','nice ','Pune','S.NO -135 Pune',18.549785,73.78959,45.00,2,0,1,'','2016-06-08 12:57:56','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:27:31.331.JPG',2,0),('FC006DC5-70BD-4D9F-E5E0-C8E99C0D5CB5','169FBFA0-250E-D746-5886-232AA46E7F32','fish9','fish fish','Myrtiotissis, Germasogeia 4041, Cyprus','Myrtiotissis, Germasogeia 4041, Cyprus',34.7026917,33.0854884,100.00,1,0,2,'','2016-06-13 13:51:19','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2016:50:30.747.JPG',4,0),('FEC3B8CC-522F-8124-9671-633A265A27EE','00235904-531B-653A-6F09-67FCF4BB7D5F','dog for play 13','Sweet','mexico,us','Mexico',765462.34,-765378.76,200.00,2,3,1,'','2016-06-06 12:57:53',NULL,2,0);
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
  PRIMARY KEY (`ImageId`),
  KEY `FkPostedAdImageAdId_idx` (`AdId`),
  CONSTRAINT `FkPostedAdImageAdId` FOREIGN KEY (`AdId`) REFERENCES `posted_ad` (`AdId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posted_ad_images`
--

LOCK TABLES `posted_ad_images` WRITE;
/*!40000 ALTER TABLE `posted_ad_images` DISABLE KEYS */;
INSERT INTO `posted_ad_images` VALUES ('02B98D5C-9F70-8982-E72D-CDA307C70FFE','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:45:47.667.JPG','30993B59-A5E4-E3E2-F66F-253E92F3204D',''),('08AA8C84-C7F1-9076-9ED1-6BF0638596E8','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:01:17.135.JPG','C0B04C17-079B-5E9F-A295-05A982357FE6',''),('094F9DAD-735B-AEE8-118A-83BD9F762402','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:01:22.292.JPG','C0B04C17-079B-5E9F-A295-05A982357FE6',''),('0DE15069-55FC-C26D-3AF7-D5CFC5C7CF60','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:19:25.393.JPG','4D358638-8486-C675-492F-123CCE944822',''),('11F27668-DD09-AF7B-C701-26C7FCBD3821','http://nearby-ads.storage.googleapis.com/2231B674-951F-F9C2-9327-0AFA933CF482/2016-06-15%2016:53:41.457.JPG','577B211A-37ED-4C7A-41A0-F1DAF0CB4317',''),('14FB407E-6905-77A3-1E3C-9467631D3A7B','http://nearby-ads.storage.googleapis.com/5BFB9E2C-74FB-A7DA-2837-91B9F959611B/2016-06-09%2021:20:22.806.JPG','A554DED6-14B5-CE4B-AEE4-413963070614',''),('17E21003-5A84-A60F-FE6E-ABB62C4C1D82','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:31:50.090.JPG','BDCBA727-ED24-E22A-381E-D6AA94C707FD',''),('1820698A-F495-C387-11BE-EE511D329256','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:22:56.118.JPG','CBCDAD11-8907-AD40-1695-ABEDD29335BE',''),('193FD4FF-6D6F-6169-EA64-141CDEC5B58F','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2016:11:49.870.JPG','C15D652B-2004-6AB4-EDAB-46189B61C120',''),('1A1D709D-BAAC-B331-C9B0-4FAFA684DA3B','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:02:07.419.JPG','0254813E-D389-A519-2CDC-1E1951B441A8',''),('20DD9D6F-62DA-0C15-17C2-A29A468765C2','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2022:52:44.008.JPG','741F0EF0-305C-C12E-584D-2FEEF3DB6928',''),('216D46B2-EEF6-153E-DCEB-4F6752D4CF0E','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2014:04:51.621.JPG','F616478A-9658-EA82-7EAF-A8C364D1D985',''),('2206D0A8-3BE9-D4ED-4E9B-B8EDF1EA3333','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2017:28:12.849.JPG','B29B9F78-1AF1-4219-2AFE-35450EF7CF5C',''),('22D72E6A-143E-7B66-F33A-DECE06C007B4','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2022:52:52.787.JPG','741F0EF0-305C-C12E-584D-2FEEF3DB6928',''),('23BEFCEA-467F-FF5D-6079-65CDBD2E95B8','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2017:02:34.790.JPG','78E1F051-1322-9BC4-1A74-E5A6108026E7',''),('23FCF0FC-8784-9EEE-1E5A-E77FF8BD6F5B','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-14%2020:08:19.606.JPG','08E4B4BF-7C3C-9660-ABE5-10F28F7B05A8',''),('2408BCF8-22B4-4CA3-75B5-C39973A9A7B7','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:35:34.404.JPG','23B9AE89-7F0E-3989-C256-A55BD491B6C7',''),('2560ECA5-0527-6315-1E71-531AD2E77026','http://nearby-ads.storage.googleapis.com/2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0/2016-06-12%2012:26:43.294.JPG','A3998FD7-5237-32EC-B042-62BB1044B6C8',''),('259DC340-25FE-89BC-EAE2-B5D83A7C4883','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:58:27.836.JPG','9BB6D5F2-15D6-4B8E-CF8A-226AB9DDE6AA',''),('2829F948-9D50-28FA-8B2E-5477B48F8A04','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-15%2019:01:40.127.JPG','AEBD498E-A88D-1119-76A6-2DA31E57261B',''),('298238DF-5348-23DA-C944-6F541C27F11F','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2019:07:27.036.JPG','164367A7-5169-3236-E1A6-0167EEFF081A',''),('2BCC7A4A-3727-FDC9-FA83-7E64DA40F714','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2016:50:44.499.JPG','FC006DC5-70BD-4D9F-E5E0-C8E99C0D5CB5',''),('2CEFE52A-B9E2-ED77-85E8-2010DEC94BF1','http://nearby-ads.storage.googleapis.com/5BFB9E2C-74FB-A7DA-2837-91B9F959611B/2016-06-15%2013:55:37.586.JPG','67C90B88-9AF5-FC3A-07D7-565882988FC2',''),('2E94799D-7639-133F-AD30-49235B5A20ED','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:19:29.690.JPG','D48ED7F3-460E-B6D6-9E0A-439B6B469E5D',''),('2F5FF357-1277-314C-2288-4630D328DC98','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:17:05.550.JPG','659456F4-DAD9-970A-2733-F5576338D830',''),('303A5CD3-18B0-929E-1098-F872A5425A7A','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:15:21.165.JPG','D8DA40C3-2393-41B3-17B6-C52ACE0BB0BA',''),('328ADEE4-F1EB-58D7-C7E0-E553751AD0A3','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:01:29.428.JPG','C0B04C17-079B-5E9F-A295-05A982357FE6',''),('32A7A686-585F-72AB-DC9A-C584684D2D9D','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:29:19.124.JPG','70616359-D5EE-B44C-DECF-728AE86BC52D',''),('3447B577-585C-16D1-C40E-5DE20AB6C5E3','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:48:34.870.JPG','7442717D-350F-5018-A32E-A9DDC353D7BB',''),('34F92B75-E814-26AA-64FB-73A90E45F652','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:49:05.145.JPG','7442717D-350F-5018-A32E-A9DDC353D7BB',''),('386DC747-F277-987D-AC25-D07B94811389','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:24:41.259.JPG','6AAA7BB4-A927-CA8B-D825-C7CE052572CB',''),('387DBD4E-6604-4E84-B770-8954903FEBB0','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:08:31.135.JPG','5452C529-3468-028B-664C-5D6340147895',''),('3CAAA2D3-1507-0C2D-EA3E-27CF9E4BC4FF','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:04:51.946.JPG','93C9A297-B76A-8665-AABC-8E530D00EE5A',''),('3D554EF3-7414-BCE2-CE19-BF27C9E8EB20','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:24:35.074.JPG','9F7EF6CC-28FD-3C9B-68E9-4C194B88005B',''),('3F8FF6AE-CB8A-BA3D-B7D6-18DAB5082624','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:27:45.909.JPG','FB55C672-324F-E7E7-B24E-452DCDAB05D4',''),('3FC9C500-B4FF-3AD4-CE7B-712D6B8C5096','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:29:25.105.JPG','5457CCE1-C6E8-232F-65EA-FE48AF05F90D',''),('40871E13-6B73-A919-0781-B9C1FFE3CE2B','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:49:45.577.JPG','F9520717-814B-ACAB-275F-8C05FA70229B',''),('43B8F482-1406-586A-EA1E-72E3D2215E43','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:03:24.098.JPG','0586CF30-54F4-A4DF-6801-9EBD7C113EC5',''),('4666A0DD-3F99-8317-860A-1A2763C08F07','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:26:42.722.JPG','9C28F681-D6BC-09CC-129C-DD455760DAD3',''),('49E0AD21-59F9-B170-558E-CDACE09D0B0C','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:03:56.670.JPG','0586CF30-54F4-A4DF-6801-9EBD7C113EC5',''),('4ADE6E9B-1468-9917-357D-D652503A8DFB','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:15:47.963.JPG','D8DA40C3-2393-41B3-17B6-C52ACE0BB0BA',''),('4BF44512-B8FA-47C1-29D7-2F3B57941A2C','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2017:27:57.563.JPG','B29B9F78-1AF1-4219-2AFE-35450EF7CF5C',''),('4C8AF790-1091-6E70-3710-074310096F4F','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:49:53.810.JPG','F9520717-814B-ACAB-275F-8C05FA70229B',''),('4DAAAA95-7C21-4804-59ED-33889606478C','http://nearby-ads.storage.googleapis.com/6E01BC52-16EA-4B42-1F5E-798B1827970A/2016-06-13%2012:01:10.690.JPG','741F0A11-D390-7617-5A26-76328ECD2D0E',''),('4E5E76F5-052B-A59E-D1C0-6938344048B1','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:23:15.421.JPG','CBCDAD11-8907-AD40-1695-ABEDD29335BE',''),('4E76F0E8-3CE4-2F72-AE5D-9AE429174545','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:29:24.619.JPG','70616359-D5EE-B44C-DECF-728AE86BC52D',''),('4EEFAD8C-392D-AC1A-830D-8A3F2CDF0935','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:47:17.403.JPG','B2F51B69-FFE9-2E6A-3A39-BCFFAB35064B',''),('58021A8C-E617-BE0E-B6B3-C644AA374B47','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:22:51.728.JPG','CA0C1DD1-4FBE-F7CA-D189-0F20B868296A',''),('5CA0754E-E3A1-C64B-62FE-666125298987','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:11:16.833.JPG','37AD2047-BFC6-BDCD-89ED-FDB8B45236EE',''),('5F2689AC-5A53-CE13-4AA8-31C20E0ED8EE','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:46:09.157.JPG','30993B59-A5E4-E3E2-F66F-253E92F3204D',''),('5F88482E-B877-0436-1107-B852AD0C7E68','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:08:23.611.JPG','5452C529-3468-028B-664C-5D6340147895',''),('60D452F5-642E-2A47-B325-C820FFFC4FAB','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:24:04.812.JPG','9F7EF6CC-28FD-3C9B-68E9-4C194B88005B',''),('61B114C0-63FB-6B9F-D729-27FE13C4C197','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2022:53:23.176.JPG','741F0EF0-305C-C12E-584D-2FEEF3DB6928',''),('65C25C0A-A28E-8458-28FC-F080EA19ED4F','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2016:11:33.866.JPG','C15D652B-2004-6AB4-EDAB-46189B61C120',''),('67212EAF-80BB-FF0B-FEEB-27FFAC43A86C','http://nearby-ads.storage.googleapis.com/41F1DBDC-50A9-C87A-96E1-1322EE8F1B41/2016-06-10%2020:15:07.227.JPG','D6CC11E8-8B60-BE3F-1EFE-167FCD08A4D3',''),('6E1DBB78-2E6D-4A54-5B7D-2D7F77853A1D','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:35:28.949.JPG','23B9AE89-7F0E-3989-C256-A55BD491B6C7',''),('6FA91C23-C2D9-BED1-5347-ABE692ACE781','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:38.251.JPG','61DA586B-68FB-2D9D-7044-2EE7A7622372',''),('7551E9CB-1694-9B6C-E1CF-244A3BB259AF','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:30:55.469.JPG','AC5749B8-26E2-5E05-3918-FE7E51FEF36A',''),('76B9DD12-CB5D-24E3-81BA-538BD9210DC4','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:16:31.762.JPG','F62699B8-4AFD-5E60-0516-605E76DBB35E',''),('76FC819B-DB80-E0D2-AE73-8E64B21A418F','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:25:57.357.JPG','42E06DE7-8CE8-7649-786E-549998E27606',''),('79BDBFD3-542C-396B-D53F-109F29329C6C','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:23:10.633.JPG','CA0C1DD1-4FBE-F7CA-D189-0F20B868296A',''),('7BAD41FA-2CC1-9B15-97DE-8ABE4598478C','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:17:53.787.JPG','96CA5B27-A7D4-182F-4B72-49E78C487561',''),('7D10EE82-1EDC-D717-C2B6-F94A84D9F4B5','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:11:31.315.JPG','37AD2047-BFC6-BDCD-89ED-FDB8B45236EE',''),('7D32ED7F-BD45-0408-6BED-787656EE6DD4','http://nearby-ads.storage.googleapis.com/740F6BA8-BD56-5132-18FB-D578C38099C1/ABC.JPG','46F8FEE5-B010-1251-2C6F-DEA027D77EFD',''),('7F326C5C-3F8A-3C7D-35A8-BD5878A5BDD5','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:17:44.637.JPG','96CA5B27-A7D4-182F-4B72-49E78C487561',''),('81519AB3-E3D4-A347-379B-F1D293626316','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:05:09.680.JPG','93C9A297-B76A-8665-AABC-8E530D00EE5A',''),('822EB506-EC47-358B-542B-402B48D6F4D3','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:18:02.183.JPG','96CA5B27-A7D4-182F-4B72-49E78C487561',''),('82AFBEC2-9C15-73A7-0E6E-3C1B3CEB6873','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:19:32.709.JPG','4D358638-8486-C675-492F-123CCE944822',''),('8342428F-0161-44F8-AE8F-D25EA656CEBD','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-14%2020:08:26.954.JPG','08E4B4BF-7C3C-9660-ABE5-10F28F7B05A8',''),('8458425C-8B13-C01D-9845-CD3979DEFC1A','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:29:35.918.JPG','5457CCE1-C6E8-232F-65EA-FE48AF05F90D',''),('86174B1C-0C92-6D70-980A-DEA34E9C7FD3','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-14%2020:08:34.000.JPG','08E4B4BF-7C3C-9660-ABE5-10F28F7B05A8',''),('86AC4A9C-096E-A354-E655-907E19DA318A','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:13:18.730.JPG','626AB880-0FBD-E69C-DCBC-0E39142D1F00',''),('8A401FD7-A8D1-7999-FB34-64F740B77E87','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:23:17.016.JPG','CA0C1DD1-4FBE-F7CA-D189-0F20B868296A',''),('8ACC593B-3813-C4BD-F401-CD4755B8B803','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2014:05:00.975.JPG','F616478A-9658-EA82-7EAF-A8C364D1D985',''),('8AEE5ED2-179F-717C-BD7E-5CFCB84EAFBB','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:32:01.867.JPG','BDCBA727-ED24-E22A-381E-D6AA94C707FD',''),('8B121464-5709-674E-9612-4176571EE627','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:08:36.374.JPG','5452C529-3468-028B-664C-5D6340147895',''),('8C7100CC-8E14-640C-3ACC-8D6A1FF176B7','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:29:12.901.JPG','70616359-D5EE-B44C-DECF-728AE86BC52D',''),('8D34478E-118D-A368-7C37-C4BB72EC6E21','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:18:27.832.JPG','91B9BAEC-36E7-0C4B-D1FF-0D4BCCA55E86',''),('8DB91907-B7BA-19D5-998A-7E679808AA98','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:13:31.430.JPG','626AB880-0FBD-E69C-DCBC-0E39142D1F00',''),('8E04AC20-D22F-790F-D48C-DAA3123A2415','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2019:07:35.528.JPG','164367A7-5169-3236-E1A6-0167EEFF081A',''),('8F90F41A-5724-9BEE-A096-5151F07E993C','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:23:02.526.JPG','CBCDAD11-8907-AD40-1695-ABEDD29335BE',''),('93F62261-0127-F893-3627-CFF00FA62B0B','http://nearby-ads.storage.googleapis.com/6758F128-E8C6-AD4E-8377-4C70255DD9C9/2016-06-14%2018:10:37.856.JPG','4D6C2362-FDD4-E8C0-EC92-D48709429371',''),('94673417-E08C-917C-D235-18D1F36101D9','http://nearby-ads.storage.googleapis.com/2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0/2016-06-11%2021:54:10.210.JPG','DD695023-4557-5CCE-D7F2-5A035F528E28',''),('9593C2C7-1E62-1051-0B86-772FCF7C5A1D','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:19:38.006.JPG','4D358638-8486-C675-492F-123CCE944822',''),('96AEA1C0-CFC8-CE93-685B-23C9610BC214','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:40:19.734.JPG','2B388EAC-0233-AD90-AA38-4F61F63E9F62',''),('9904D415-CFF6-9E48-0490-3EAF7C6903EC','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:13:24.280.JPG','626AB880-0FBD-E69C-DCBC-0E39142D1F00',''),('9915EB6E-940E-07BA-6571-789D743D5978','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2017:02:34.790.JPG','68A98DA8-AD12-0B51-55A3-6B403CF88D73',''),('99BB90F7-F20A-1AF7-CD74-002F4C51D855','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:27:31.496.JPG','FB55C672-324F-E7E7-B24E-452DCDAB05D4',''),('9F9C7D97-2E5D-DE52-4F31-F076A881B8C0','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:25:30.482.JPG','42E06DE7-8CE8-7649-786E-549998E27606',''),('A1434988-7960-F5F3-9456-8FDEB8C86AFF','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2016:50:53.565.JPG','FC006DC5-70BD-4D9F-E5E0-C8E99C0D5CB5',''),('A170DCD0-A9AD-9414-A3D9-2BE1FFAF4344','http://nearby-ads.storage.googleapis.com/6758F128-E8C6-AD4E-8377-4C70255DD9C9/2016-06-15%2010:45:31.838.JPG','9041263F-6BD3-ECAB-267E-DC52FD2D0E4E',''),('A23D8916-AD80-96D5-3F01-88E1A33F7EB3','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:31:03.646.JPG','AC5749B8-26E2-5E05-3918-FE7E51FEF36A',''),('A560B542-8A87-4B43-2CB6-05845CF40385','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:08:14.338.JPG','28997CD0-199F-BED5-096F-42E3BC222C28',''),('A6650AB7-E34A-682E-8836-FDBFC3F7D7B7','http://nearby-ads.storage.googleapis.com/6758F128-E8C6-AD4E-8377-4C70255DD9C9/2016-06-15%2010:45:23.697.JPG','9041263F-6BD3-ECAB-267E-DC52FD2D0E4E',''),('A781AB32-DE9B-5D7A-6039-029B2ECF53AC','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:46.977.JPG','B8482618-06D0-3AC9-07DF-46F7A7537E42',''),('A7A62AF7-CC9D-0808-D673-9E5C984509F2','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2016:11:58.514.JPG','C15D652B-2004-6AB4-EDAB-46189B61C120',''),('A7BD56CA-4EEF-E04A-F08B-1013799A1CD7','http://nearby-ads.storage.googleapis.com/740F6BA8-BD56-5132-18FB-D578C38099C1/ABCd.JPG','46F8FEE5-B010-1251-2C6F-DEA027D77EFD',''),('A8DA6558-9FF5-A483-B8F9-55AEC1A2A872','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:25:46.176.JPG','42E06DE7-8CE8-7649-786E-549998E27606',''),('A96CD713-3D69-5389-F630-ECA42BA9E36A','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2014:05:07.202.JPG','F616478A-9658-EA82-7EAF-A8C364D1D985',''),('AABA1125-511B-2247-9FB6-34A14A8EFC42','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:53.420.JPG','B8482618-06D0-3AC9-07DF-46F7A7537E42',''),('ADDD1807-17C7-51A5-FEA7-76A5341F5C9F','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:19:35.817.JPG','D48ED7F3-460E-B6D6-9E0A-439B6B469E5D',''),('B02AEFC9-9ECF-FAD1-598A-50951AA4D6AD','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:46.977.JPG','61DA586B-68FB-2D9D-7044-2EE7A7622372',''),('B4DE015A-B6F8-747C-3C88-ED7D0756513E','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:29:14.853.JPG','5457CCE1-C6E8-232F-65EA-FE48AF05F90D',''),('B6BA6418-708F-4920-DCC2-0689D1E522B4','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:24:59.650.JPG','6AAA7BB4-A927-CA8B-D825-C7CE052572CB',''),('B7E7DFB8-5CBC-1434-8FCF-64D5D876F548','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:31:00.512.JPG','AC5749B8-26E2-5E05-3918-FE7E51FEF36A',''),('BAB6C27A-9941-F185-DA07-DBB71C0D2A40','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:26:30.021.JPG','9C28F681-D6BC-09CC-129C-DD455760DAD3',''),('BC3D3BD7-8177-358A-1FC1-A72E5F976BB5','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:18:34.352.JPG','91B9BAEC-36E7-0C4B-D1FF-0D4BCCA55E86',''),('BC64D1B0-4F2E-9870-75EE-3F7594C41114','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:38.251.JPG','B8482618-06D0-3AC9-07DF-46F7A7537E42',''),('BCE86CCF-B60D-C4C7-E543-5928C698E8B5','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:27:31.331.JPG','FB55C672-324F-E7E7-B24E-452DCDAB05D4',''),('BE0678D9-0858-FEDB-3860-836614EB2CFF','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:35:39.879.JPG','23B9AE89-7F0E-3989-C256-A55BD491B6C7',''),('BF99CAB2-5658-AC8F-EC7E-D3D5F7502A11','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:40:33.736.JPG','2B388EAC-0233-AD90-AA38-4F61F63E9F62',''),('C23A879E-B706-A933-8E61-3F907C59D462','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:05:34.387.JPG','93C9A297-B76A-8665-AABC-8E530D00EE5A',''),('C269C18E-4EC0-FF4F-5904-F8E226FE69A0','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2019:26:36.388.JPG','9C28F681-D6BC-09CC-129C-DD455760DAD3',''),('C33F6840-AFDC-2EC6-4A22-4DE43CDCA0D1','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2016:40:24.107.JPG','2B388EAC-0233-AD90-AA38-4F61F63E9F62',''),('C3E2BB49-336C-C1D2-DD3F-3C3FEE55D439','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:10:19.283.JPG','67EBEFEA-9CA3-BB90-53F6-9942A85CB0E0',''),('C42AD0FB-33B1-834A-09A7-DE3D9C59466D','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:02:22.600.JPG','0254813E-D389-A519-2CDC-1E1951B441A8',''),('C46F3EB0-0189-FBDD-B635-3BDF5AE7500F','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-11%2018:36:01.057.JPG','757DF946-8FFD-26A1-52D1-C610D509A508',''),('C4EC5E6A-43E4-7BFC-1E7D-5BB30AD7D4AB','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:47:27.872.JPG','B2F51B69-FFE9-2E6A-3A39-BCFFAB35064B',''),('C5141690-5968-184C-7B09-92A16FFECB2B','http://nearby-ads.storage.googleapis.com/5BFB9E2C-74FB-A7DA-2837-91B9F959611B/2016-06-15%2013:55:13.931.JPG','67C90B88-9AF5-FC3A-07D7-565882988FC2',''),('C6452DC6-121B-1987-9FBA-2EA2F690414C','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-15%2014:07:39.554.JPG','9CF5F341-A2FB-BD34-0B9C-EDEF172A7CA5',''),('CC719EA7-B60E-DF94-64E2-279407FC9A76','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:19:44.257.JPG','D48ED7F3-460E-B6D6-9E0A-439B6B469E5D',''),('D3786DB2-E40F-4561-9D15-8194EEBA47B5','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2018:49:32.368.JPG','7442717D-350F-5018-A32E-A9DDC353D7BB',''),('D557AD5A-C5A7-AE94-FBB1-CF3F2ED591BD','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2016:36:53.420.JPG','61DA586B-68FB-2D9D-7044-2EE7A7622372',''),('D988BCF7-FDEC-00CA-5384-97532D6B71DF','http://nearby-ads.storage.googleapis.com/2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0/2016-06-12%2000:16:24.479.JPG','323EAF4D-5066-7472-83CA-0FD40FA83598',''),('DBDA7EE4-F6C3-4CB5-520B-7E05D2E8192F','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-10%2019:08:11.791.JPG','164367A7-5169-3236-E1A6-0167EEFF081A',''),('DC1850CC-068A-7717-C59F-C765AAFCA068','http://nearby-ads.storage.googleapis.com/169FBFA0-250E-D746-5886-232AA46E7F32/2016-06-13%2016:50:30.747.JPG','FC006DC5-70BD-4D9F-E5E0-C8E99C0D5CB5',''),('DC52D6CA-916E-951E-F3CE-AB4BB9C6A6D1','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-15%2019:00:09.702.JPG','5E30DCA1-ED60-C9FF-1A29-CEEB1D504B86',''),('E18FA9CC-D999-D465-8D46-870DC71B19ED','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:10:43.303.JPG','67EBEFEA-9CA3-BB90-53F6-9942A85CB0E0',''),('E1CEB5BD-AACC-9527-46E1-9F9B784FB5C1','http://nearby-ads.storage.googleapis.com/6758F128-E8C6-AD4E-8377-4C70255DD9C9/2016-06-14%2018:10:44.969.JPG','4D6C2362-FDD4-E8C0-EC92-D48709429371',''),('E207394C-DF0C-AFBA-84A8-1B14E548A51F','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2017:27:05.421.JPG','B29B9F78-1AF1-4219-2AFE-35450EF7CF5C',''),('E26CEB86-634D-888A-1666-2033BAF3141D','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:18:40.698.JPG','91B9BAEC-36E7-0C4B-D1FF-0D4BCCA55E86',''),('E28C766F-04EE-99DC-6589-EA3BE317EEE4','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:45:32.022.JPG','30993B59-A5E4-E3E2-F66F-253E92F3204D',''),('E40AE9E8-B407-273A-5CF3-540499127DE9','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:58:32.641.JPG','9BB6D5F2-15D6-4B8E-CF8A-226AB9DDE6AA',''),('E56C5A8F-6203-9C80-8DC9-54D612E1EB14','http://nearby-ads.storage.googleapis.com/FC89D95E-BA78-FEE4-C3FD-CA8999593BC2/2016-06-13%2019:32:10.815.JPG','BDCBA727-ED24-E22A-381E-D6AA94C707FD',''),('E5F98489-63E6-87C8-BC46-788C1112603F','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:17:44.742.JPG','659456F4-DAD9-970A-2733-F5576338D830',''),('E84DBF55-0605-A0AD-533B-96001D4DFCB4','http://nearby-ads.storage.googleapis.com/6758F128-E8C6-AD4E-8377-4C70255DD9C9/2016-06-15%2010:45:26.759.JPG','9041263F-6BD3-ECAB-267E-DC52FD2D0E4E',''),('E8B7C801-9D0D-F54F-932E-0869F2314EBE','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:16:43.954.JPG','F62699B8-4AFD-5E60-0516-605E76DBB35E',''),('E94255A8-A096-B64C-9391-CBBC8644347E','http://nearby-ads.storage.googleapis.com/5BFB9E2C-74FB-A7DA-2837-91B9F959611B/2016-06-15%2013:55:18.106.JPG','67C90B88-9AF5-FC3A-07D7-565882988FC2',''),('E9C6CE6C-C931-31F2-F298-04C0382AFC87','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:46:58.547.JPG','B2F51B69-FFE9-2E6A-3A39-BCFFAB35064B',''),('EC264139-C834-C5E2-D12C-865B66EBAD01','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2018:45:52.044.JPG','30993B59-A5E4-E3E2-F66F-253E92F3204D',''),('ED548499-7041-ADEE-3B3E-43A098660621','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:58:22.379.JPG','9BB6D5F2-15D6-4B8E-CF8A-226AB9DDE6AA',''),('EFB95EBA-56FE-9EA9-45EE-6B0924D0B6CD','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:11:37.639.JPG','37AD2047-BFC6-BDCD-89ED-FDB8B45236EE',''),('F214C94A-FBFB-DA26-3FD7-98A89E2B733B','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:02:38.116.JPG','0254813E-D389-A519-2CDC-1E1951B441A8',''),('F31D60E8-A5C3-1120-68C2-083021E37B65','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2019:03:40.630.JPG','0586CF30-54F4-A4DF-6801-9EBD7C113EC5',''),('F5D724DA-A33E-4418-4A5B-85850F4E492A','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2012:24:34.333.JPG','6AAA7BB4-A927-CA8B-D825-C7CE052572CB',''),('FBCE8473-C6CE-F59B-9184-F78EEBE2F899','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2015:10:29.269.JPG','67EBEFEA-9CA3-BB90-53F6-9942A85CB0E0',''),('FCF6AF0D-5586-6AFD-D203-0860F1B504AF','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-08%2018:27:38.036.JPG','FB55C672-324F-E7E7-B24E-452DCDAB05D4',''),('FFD1AA8F-0D57-E44C-45F9-1E5C8F51E424','http://nearby-ads.storage.googleapis.com/123C6C38-786A-5CD8-E13E-F5002CAC7305/2016-06-13%2013:16:50.235.JPG','F62699B8-4AFD-5E60-0516-605E76DBB35E','');
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
INSERT INTO `status` VALUES (0,'None',''),(1,'Sold Out',''),(2,'Disabled',''),(3,'Hidden','');
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
  `RadiusInKm` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserId`),
  KEY `FkRoleUserRoleId_idx` (`RoleId`),
  CONSTRAINT `FkRoleUserRoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('00235904-531B-653A-6F09-67FCF4BB7D5F','ad@zx.com','1234567897','ganesh','abcdef','7878986523',1,NULL,NULL,'2016-06-03 13:42:42',2,'',10000),('05BE373B-F882-384C-02E3-80B77FF3875E','aaa@gmail.com','7878986865','abcde','abcde','7878986523',1,NULL,NULL,'2016-06-03 14:23:31',2,'',10000),('123C6C38-786A-5CD8-E13E-F5002CAC7305','shrinivas@vibeosys.com','abcd','shrinivas Sh','ShJ Sh','787555410',1,'EAAYYM4V6M78BANJHZBK0TiomwpB2U5UMvQIlzgSG5HZCReX3Min40DN1nMxgBiESEIxloUTZAdAxDpkaY9pvVE1MZAmppZBXAva',NULL,'2016-06-04 12:28:17',2,'',10000),('169FBFA0-250E-D746-5886-232AA46E7F32','aaa@aaa.com','12345','andronikos','hshsa','7878986523',1,NULL,NULL,'2016-06-11 05:30:01',2,'',1000000),('216B926C-6B1A-3ECC-B0E8-69A2277EC733','dddf@gmajil.com','1233456789','ffr33ifff','rrcfgg','7878986523',1,NULL,NULL,'2016-06-08 06:07:29',2,'',10000),('2231B674-951F-F9C2-9327-0AFA933CF482','anthony.077@gmail.com','Please77','Antonis','Lambrou','99840584',1,NULL,NULL,'2016-06-15 13:44:01',2,'',10000),('250f21a6-148a-44f9-a22b-c824b7fe825e','niteen@vibeosys.com','xyz.123','Niteen','Vir','7875888662',1,NULL,NULL,'2016-06-02 18:12:23',1,'',6000),('2A9D4622-583E-B166-6251-DF813E82CA64','fdhdg@dfg.xom','Abcd1234','dfhgd','dhhfdh','7878986523',1,NULL,NULL,'2016-06-12 15:28:16',2,'',10000),('2BCBCEC4-C136-1264-9728-204566FC5AE7','abcd@gmail.com','7878787878','abcd','abcd','7878986123',1,NULL,NULL,'2016-06-03 14:19:53',2,'',10000),('2EE72D49-F8DB-BDF8-0FAA-C10FD17AE2C0','fanos_omo@hotmail.com',NULL,'Fanos','Hadjicostis',NULL,2,'EAAYYM4V6M78BAPGwg7btdGPwRVpUyZBm2KGKEPh9ZAObxPnUOcfZBWB2DhbV6PtKvSZBOh3Ax5jyHJLvVfu0DIJS8NEK6lwxXdN',NULL,'2016-06-11 18:50:05',2,'',10000),('31A556DE-3B79-1E51-E420-AF1A8B3F15E2','xyz@gmail.com','123','rony','jam','1234567890',1,'',NULL,'2016-06-11 08:28:04',2,'',10000),('3778F099-2CE2-79EB-F3FA-A662B588613F','shrini@vibeosys.com','shrini','shrini','shri','1234567890',1,NULL,NULL,'2016-06-09 06:11:28',2,'',10000),('41F1DBDC-50A9-C87A-96E1-1322EE8F1B41','anand.kulkarni123@gmail.com',NULL,'Anand','Kulkarni',NULL,2,'EAAYYM4V6M78BAMUoEuvazNfudCpUfRQqUYx0M8wFLjERGm2pZA1VZBgulPqv10Kxa5ste5eUhWXcjNC0Up6KUVwTnxmmJIwZC2t',NULL,'2016-06-07 14:24:43',2,'',10000),('5BFB9E2C-74FB-A7DA-2837-91B9F959611B','test@test1.com','qwerty','jshsh','sjjss','64464',1,NULL,NULL,'2016-06-08 17:25:05',2,'',110),('6758F128-E8C6-AD4E-8377-4C70255DD9C9','akshay@vibeosys.com','','Shri','Shri','8745123545',2,'EAAYYM4V6M78BAFFnttlAt0brLmRNsRKK7d8AGAwXnq5ZCNywv9GaGOebY6o0WtCFbNgfkw8dvcgVwHcO6Xni1TKp2Lfxf92FsQr',NULL,'2016-06-04 13:30:32',2,'',4240),('6A803643-8060-CC8C-248F-D0206FFDA144','ramesh@vibeosys.com','ramesh','ramesh','abcdef','1234567890',1,NULL,NULL,'2016-06-08 14:43:42',2,'',10000),('6E01BC52-16EA-4B42-1F5E-798B1827970A','cbz@gmail.com','cbz@123','cbz','honda','7878986523',1,NULL,NULL,'2016-06-13 06:30:38',2,'',10000),('707CD643-140C-DABA-CD81-AE42C5B917B3','vijay@vibeosys.com','878452365','vijay','chohan','7878986523',1,NULL,NULL,'2016-06-08 14:39:00',2,'',10000),('73E44F49-6050-1637-60E0-C85EC03C4134','test123@vibeosys.com','test123','test123','lastname','123456789',1,NULL,NULL,'2016-06-09 06:02:11',2,'',10000),('740F6BA8-BD56-5132-18FB-D578C38099C1','ad@ad.com','1234567891','ganesh','ganesh','7878986523',1,NULL,NULL,'2016-06-03 13:44:49',2,'',10000),('7B84F01F-F471-EC3A-AB10-A81EF900BB08','maria@gmail.com','jam123','maria','cary','1234567890',1,'',NULL,'2016-06-08 10:23:09',2,'',10000),('82AE62F5-1902-4049-E252-7A720434DA0F','fdhdgh@dfg.xom','Abcd1234','dfhgd','dhhfdh','7878986523',1,NULL,NULL,'2016-06-12 15:30:36',2,'',10000),('91AD47DA-1AAF-C238-DB07-F99BB8B61D12','hshrinivas@rediffmail.com','','shrinivas','SH','7878986523',2,NULL,NULL,'2016-06-08 11:56:51',2,'',10000),('98888C11-9B2A-1A3A-1DB5-AAAD220714AD','virniteen@gmail.com',NULL,'Niteen','Veer',NULL,2,'EAAYYM4V6M78BACoqhcZBZAGwuSzbIbakrytjvo0gsIkFd5skuT1gl4bPnDJVOFyy20teYyuACTvSVXZAQE98Ar98IN7qgCZCaaS',NULL,'2016-06-11 11:13:36',2,'',10000),('A29F6B8B-DB6B-F2DA-E274-4283E8B586B5','aa@gmail.com','9898989898','an','gsgs','7878986523',1,NULL,NULL,'2016-06-04 11:50:16',2,'',10000),('A2E4E959-0E18-73AF-EB9A-6BA135035429','dfhfh@duffle.drgt','Abcd1234','gfh','fghnf','7878986523',1,NULL,NULL,'2016-06-12 16:58:29',2,'',10000),('a79da675-7ab6-4c78-b879-50cb8a431c37','diworx@gmail.com','12345','Andronikos','Papanicolaou','',1,'EAAYYM4V6M78BANWnwygg5l1kERMUrm3ZCpZAC9uaPayaepYjeM86VcaBTDxIvDKjuLGGXvheQqoGWactYKEUnEMZB8ZB0U3T65X',NULL,'2016-06-03 13:18:13',1,'',10000),('AC5A8DFE-FD9A-B935-E8DA-35465F1966A0','raj@gmail.com','8989456523','raj','raj','7878986523',1,NULL,NULL,'2016-06-07 06:00:33',2,'',10000),('B4A32150-8734-A312-471F-3CE05644A8C8','ram@vibeosys.com','ram123','Ram','Test','1234567890',1,NULL,NULL,'2016-06-08 14:50:03',2,'',10000),('B4ADA70A-FABD-BA61-D333-ED7EED6C16F4','shri@vibeosys.com','1234567890','shri','shri','7878986523',1,NULL,NULL,'2016-06-08 14:34:53',2,'',10000),('BA4C3F89-166F-6680-D41D-FDC6EA991668','asdfgh@cde.com','zxcvbnm','lalo','bhuro','7539514268',1,NULL,NULL,'2016-06-09 06:15:05',2,'',10000),('CF14BB0C-D027-D05C-0269-55937B47CB3F','sdf@fight.com','Abcd1234','thrt','rthrth','36374587',1,NULL,NULL,'2016-06-11 09:50:45',2,'',10000),('D6C2A7AE-53BE-1965-AC87-02EA65AF6CDD','shrinivasSHJ@vibeosys.com','shrinivas','shrinivas','Stest','4422335566',1,NULL,NULL,'2016-06-15 07:45:55',2,'',10000),('E5A32EB8-93EE-BB23-E10A-3D7C40073D5D','rony007@gmail.com','jam123','rony','jam','1234567890',1,'',NULL,'2016-06-07 11:01:45',2,'',10000),('F0D88605-89DF-83C3-5DEA-52B2EF43F054','ganesh@gmail.com','1234567891','Ganesh','Ganesh','7878986523',1,NULL,NULL,'2016-06-03 13:32:25',2,'',10000),('FC89D95E-BA78-FEE4-C3FD-CA8999593BC2','vijay@vibeosys.com','vvvv','Vijay','deshpande','1255634525',1,NULL,NULL,'2016-06-09 05:53:58',2,'',10000);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'nearby_pets_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `getCategoryAdList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getCategoryAdList`()
BEGIN

select category.CategoryId, 
CategoryDesc, 
CategoryImageUrl, 
count(posted_ad.AdId) as ProductCount 
from category left outer join posted_ad
on category.CategoryId = posted_ad.CategoryId and posted_ad.StatusId = 0
group by category.CategoryId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategoryWisePostedAdList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getCategoryWisePostedAdList`(IN requestedCategoryId int,
IN requestedUserId varchar(40),
IN searchText varchar(20),
IN requestedLat float, 
IN requestedLong float,
IN sortChoice varchar(20),
IN sortOption varchar(10),
IN pageNumber int)
BEGIN

declare maxDistance int;
declare pageSize int;
declare lowerPageLimit int;
declare upperPageLimit int;
declare searchQuery varchar(40);

SELECT 
    RadiusInKm
INTO maxDistance FROM
    user
WHERE
    UserId = requestedUserId;
SELECT 
    CAST(ConfigValue AS SIGNED)
INTO pageSize FROM
    config_settings
WHERE
    ConfigKey = 'ClassifiedAdPageSize';
-- select maxDistance;
IF pageNumber = 1 THEN
	set lowerPageLimit = 0, upperPageLimit = pageSize;
else
	set lowerPageLimit = (pageNumber - 1) * pageSize;
    set upperPageLimit = pageSize;
END IF;    

set searchQuery = CONCAT("%",searchText,"%");

if sortOption = "PostedDate" and sortChoice = "DESC" then
select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0 and categoryId = requestedCategoryId 
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "PostedDate" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0  and categoryId = requestedCategoryId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0  and categoryId = requestedCategoryId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance
FROM posted_ad 
where StatusId = 0 and categoryId = requestedCategoryId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance
FROM posted_ad 
where StatusId = 0 and categoryId = requestedCategoryId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0 and categoryId = requestedCategoryId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance ASC
LIMIT lowerPageLimit , upperPageLimit;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPostedAdList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getPostedAdList`(IN requestedLat float, 
IN requestedUserId varchar(40),
IN requestedLong float,
IN sortChoice varchar(20),
IN sortOption varchar(10),
IN pageNumber int,
IN searchText varchar(40))
BEGIN

declare maxDistance int;
declare pageSize int;
declare lowerPageLimit int;
declare upperPageLimit int;
declare searchQuery varchar(40);


SELECT 
    RadiusInKm
INTO maxDistance FROM
    user
WHERE
    UserId = requestedUserId;
SELECT 
    CAST(ConfigValue AS SIGNED)
INTO pageSize FROM
    config_settings
WHERE
    ConfigKey = 'ClassifiedAdPageSize';
-- select maxDistance;
IF pageNumber = 1 THEN
	set lowerPageLimit = 0, upperPageLimit = pageSize;
else
	set lowerPageLimit = (pageNumber - 1) * pageSize;
    set upperPageLimit = pageSize;
END IF;    

set searchQuery = CONCAT("%",searchText,"%");

if sortOption = "PostedDate" and sortChoice = "DESC" then
select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "PostedDate" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance
FROM posted_ad 
where StatusId = 0
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance
FROM posted_ad 
where StatusId = 0
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where StatusId = 0
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance ASC
LIMIT lowerPageLimit , upperPageLimit;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSavedAdList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getSavedAdList`(IN requestedLat float, 
IN requestedLong float,
IN sortChoice varchar(20),
IN sortOption varchar(10),
IN pageNumber int,
IN requestedUserId varchar(50),
IN searchText varchar(40))
BEGIN

declare maxDistance int;
declare pageSize int;
declare lowerPageLimit int;
declare upperPageLimit int;
declare searchQuery varchar(40);


    set maxDistance = 10000;
SELECT 
    CAST(ConfigValue AS SIGNED)
INTO pageSize FROM
    config_settings
WHERE
    ConfigKey = 'ClassifiedAdPageSize';
-- select maxDistance;
IF pageNumber = 1 THEN
	set lowerPageLimit = 0, upperPageLimit = pageSize;
else
	set lowerPageLimit = (pageNumber - 1) * pageSize;
    set upperPageLimit = pageSize;
END IF;    

set searchQuery = CONCAT("%",searchText,"%");


if sortOption = "PostedDate" and sortChoice = "DESC" then
select 
posted_ad.AdId,
AdTitle,
Description,
DisplayImgUrl,
PostedDate,
Price,
StatusId,
( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad inner join favorite_ads on posted_ad.AdId = favorite_ads.AdId 
Where favorite_ads.UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "PostedDate" and sortChoice = "ASC" then
select 
posted_ad.AdId,
AdTitle,
Description,
DisplayImgUrl,
PostedDate,
Price,
StatusId,
( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad inner join favorite_ads on posted_ad.AdId = favorite_ads.AdId 
Where favorite_ads.UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "DESC" then
select 
posted_ad.AdId,
AdTitle,
Description,
DisplayImgUrl,
PostedDate,
Price,
StatusId,
( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad inner join favorite_ads on posted_ad.AdId = favorite_ads.AdId 
Where favorite_ads.UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "ASC" then
select 
posted_ad.AdId,
AdTitle,
Description,
DisplayImgUrl,
PostedDate,
Price,
StatusId,
( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad inner join favorite_ads on posted_ad.AdId = favorite_ads.AdId 
Where favorite_ads.UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "DESC" then
select 
posted_ad.AdId,
AdTitle,
Description,
DisplayImgUrl,
PostedDate,
Price,
StatusId,
( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad inner join favorite_ads on posted_ad.AdId = favorite_ads.AdId 
Where favorite_ads.UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "ASC" then
select 
posted_ad.AdId,
AdTitle,
Description,
DisplayImgUrl,
PostedDate,
Price,
StatusId,
( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad inner join favorite_ads on posted_ad.AdId = favorite_ads.AdId 
Where favorite_ads.UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance ASC
LIMIT lowerPageLimit , upperPageLimit;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserPostedAdList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getUserPostedAdList`(IN requestedUserId varchar(50),
IN requestedLat float, 
IN requestedLong float,
IN sortChoice varchar(20),
IN sortOption varchar(10),
IN pageNumber int,
IN searchText varchar(20))
BEGIN

declare maxDistance int;
declare pageSize int;
declare lowerPageLimit int;
declare upperPageLimit int;
declare searchQuery varchar(40);


        set maxDistance = 10000;
SELECT 
    CAST(ConfigValue AS SIGNED)
INTO pageSize FROM
    config_settings
WHERE
    ConfigKey = 'ClassifiedAdPageSize';
-- select maxDistance;
IF pageNumber = 1 THEN
	set lowerPageLimit = 0, upperPageLimit = pageSize;
else
	set lowerPageLimit = (pageNumber - 1) * pageSize;
    set upperPageLimit = pageSize;
END IF;    

set searchQuery = CONCAT("%",searchText,"%");

if sortOption = "PostedDate" and sortChoice = "DESC" then
select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "PostedDate" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by PostedDate ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Price" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance
FROM posted_ad 
where UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Price ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance
FROM posted_ad 
where UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortOption = "Distance" and sortChoice = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance 
FROM posted_ad 
where UserId = requestedUserId
and (AdTitle Like searchQuery or Description Like searchQuery)
HAVING Distance <  maxDistance
Order by Distance ASC
LIMIT lowerPageLimit , upperPageLimit;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-16 12:00:29
