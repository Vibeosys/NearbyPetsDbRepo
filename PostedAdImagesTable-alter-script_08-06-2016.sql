ALTER TABLE `nearby_pets_db`.`posted_ad_images` 
ADD INDEX `FkPostedAdImageAdId_idx` (`AdId` ASC)  COMMENT '';
ALTER TABLE `nearby_pets_db`.`posted_ad_images` 
ADD CONSTRAINT `FkPostedAdImageAdId`
  FOREIGN KEY (`AdId`)
  REFERENCES `nearby_pets_db`.`posted_ad` (`AdId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
