ALTER TABLE `nearby_pets_db`.`favorite_ads` 
ADD INDEX `FkFavoritePosetedAdId_idx` (`AdId` ASC)  COMMENT '';
ALTER TABLE `nearby_pets_db`.`favorite_ads` 
ADD CONSTRAINT `FkFavoriteUserId`
  FOREIGN KEY (`UserId`)
  REFERENCES `nearby_pets_db`.`user` (`UserId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FkFavoritePostedAdAdId`
  FOREIGN KEY (`AdId`)
  REFERENCES `nearby_pets_db`.`posted_ad` (`AdId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;