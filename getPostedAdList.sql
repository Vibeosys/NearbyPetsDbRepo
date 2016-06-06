CREATE DEFINER=`root`@`%` PROCEDURE `getPostedAdList`(IN requestedLat float, 
IN requestedLong float,
IN sortChoice varchar(20),
IN sortOption varchar(10),
IN pageNumber int)
BEGIN

declare maxDistance int;
declare pageSize int;
declare lowerPageLimit int;
declare upperPageLimit int;
declare initQuery varchar(5000);
declare midQuery varchar(500);
declare laterQuery varchar(500);

select cast(ConfigValue as signed) into maxDistance from config_settings where ConfigKey = 'AdSearchDistanceInKM';
select cast(ConfigValue as signed) into pageSize from config_settings where ConfigKey = 'ClassifiedAdPageSize';
-- select maxDistance;
IF pageNumber = 1 THEN
	set lowerPageLimit = 0, upperPageLimit = pageSize;
else
	set lowerPageLimit = (pageNumber - 1) * pageSize, upperPageLimit = pageNumber * pageSize;
END IF;    

if sortChoice = "PostedDate" and sortOption = "DESC" then
select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance FROM posted_ad HAVING Distance <  maxDistance
Order by PostedDate DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortChoice = "PostedDate" and sortOption = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance FROM posted_ad HAVING Distance <  maxDistance
Order by PostedDate ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortChoice = "Price" and sortOption = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance FROM posted_ad HAVING Distance <  maxDistance
Order by Price DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortChoice = "Price" and sortOption = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance FROM posted_ad HAVING Distance <  maxDistance
Order by Price ASC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortChoice = "Distance" and sortOption = "DESC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance FROM posted_ad HAVING Distance <  maxDistance
Order by Distance DESC
LIMIT lowerPageLimit , upperPageLimit;

elseif sortChoice = "Distance" and sortOption = "ASC" then

select AdId,AdTitle,Description,DisplayImgUrl,PostedDate,Price,( 6371 * acos( cos( radians(requestedLat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude ) - radians(requestedLong) ) + sin( radians(requestedLat) ) * sin( radians( Latitude ) ) ) ) AS Distance FROM posted_ad HAVING Distance <  maxDistance
Order by Distance ASC
LIMIT lowerPageLimit , upperPageLimit;

end if;

END