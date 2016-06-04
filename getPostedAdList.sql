CREATE DEFINER=`root`@`%` PROCEDURE `getPostedAdList`(IN requestedLat float, IN requestedLong float)
BEGIN

declare maxDistance int;

select cast(ConfigValue as signed) into maxDistance from config_settings where ConfigKey = 'AdSearchDistanceInKM';

-- select maxDistance;

SELECT  
AdId,
AdTitle,
Description,
Price,
( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS distance 
FROM posted_ad 
HAVING distance <  maxDistance
ORDER BY distance LIMIT 0 , 20;

END