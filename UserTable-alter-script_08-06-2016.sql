ALTER TABLE `nearby_pets_db`.`user` 
ADD INDEX `FkRoleUserRoleId_idx` (`RoleId` ASC)  COMMENT '';
ALTER TABLE `nearby_pets_db`.`user` 
ADD CONSTRAINT `FkRoleUserRoleId`
  FOREIGN KEY (`RoleId`)
  REFERENCES `nearby_pets_db`.`role` (`RoleId`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `nearby_pets_db`.`user` 
ADD COLUMN `RadiusInKm` DOUBLE NOT NULL DEFAULT 0 COMMENT '' AFTER `Active`;

