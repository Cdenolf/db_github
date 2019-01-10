-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Movies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Movies` ;
USE `Movies` ;

-- -----------------------------------------------------
-- Table `Movies`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Movies` (
  `M_ID` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Genre` ENUM("Drama", "Comedy", "SciFi", "Action") NULL,
  `Date` DATE NULL,
  `Score` ENUM("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10") NULL,
  `Comments` VARCHAR(200) NULL,
  PRIMARY KEY (`M_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`Directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Directors` (
  `Director_id` INT NOT NULL AUTO_INCREMENT,
  `Director_name` VARCHAR(45) NULL,
  `Movie_id` INT NULL,
  PRIMARY KEY (`Director_id`),
  UNIQUE INDEX `Movie_id_UNIQUE` (`Movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_Directors_1`
    FOREIGN KEY (`Movie_id`)
    REFERENCES `Movies`.`Movies` (`M_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`Actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Actors` (
  `idActors` INT NOT NULL,
  `Actor_name` VARCHAR(45) NULL,
  `Movie_id` INT NULL,
  PRIMARY KEY (`idActors`),
  UNIQUE INDEX `Movie_id_UNIQUE` (`Movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_Actors_1`
    FOREIGN KEY (`Movie_id`)
    REFERENCES `Movies`.`Movies` (`M_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Movies`.`Movies`
-- -----------------------------------------------------
START TRANSACTION;
USE `Movies`;
INSERT INTO `Movies`.`Movies` (`M_ID`, `Title`, `Genre`, `Date`, `Score`, `Comments`) VALUES (1, 'LOTR', 'Action', '2001-10-10', '10', 'Best movie');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Movies`.`Directors`
-- -----------------------------------------------------
START TRANSACTION;
USE `Movies`;
INSERT INTO `Movies`.`Directors` (`Director_id`, `Director_name`, `Movie_id`) VALUES (1, 'Peter Jackson', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Movies`.`Actors`
-- -----------------------------------------------------
START TRANSACTION;
USE `Movies`;
INSERT INTO `Movies`.`Actors` (`idActors`, `Actor_name`, `Movie_id`) VALUES (1, 'Sean Astin', 1);

COMMIT;

