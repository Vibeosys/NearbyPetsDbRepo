ALTER TABLE `nearby_pets_db`.`posted_ad` 
ADD COLUMN `DisplayImgUrl` TEXT NULL COMMENT '' AFTER `PostedDate`;

ALTER TABLE `nearby_pets_db`.`posted_ad` 
ADD COLUMN `CategoryId` INT(2) NOT NULL COMMENT '' AFTER `DisplayImgUrl`;
