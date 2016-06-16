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

-- Dump completed on 2016-06-16 11:56:01
