CREATE DEFINER=`root`@`%` PROCEDURE `getCategoryWisePostedAdList`(IN requestedCategoryId int,
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
    CAST(ConfigValue AS SIGNED)
INTO maxDistance FROM
    config_settings
WHERE
    ConfigKey = 'AdSearchDistanceInKM';
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

END