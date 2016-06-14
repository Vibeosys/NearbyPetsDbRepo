ALTER TABLE `nearby_pets_db`.`posted_ad` 
ADD INDEX `FkCategoryPostedAdsCategoryId_idx` (`CategoryId` ASC)  COMMENT '';
ALTER TABLE `nearby_pets_db`.`posted_ad` 
ADD CONSTRAINT `FkUserPostedAdUserId`
  FOREIGN KEY (`UserId`)
  REFERENCES `nearby_pets_db`.`user` (`UserId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FkCategoryPostedAdsCategoryId`
  FOREIGN KEY (`CategoryId`)
  REFERENCES `nearby_pets_db`.`category` (`CategoryId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `nearby_pets_db`.`posted_ad` 
ADD COLUMN `AddressType` INT(1) NOT NULL COMMENT '' AFTER `CategoryId`;

