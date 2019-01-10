-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `Student_Number` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Birth_Date` VARCHAR(45) NULL,
  `Sex` ENUM("M", "F") NULL,
  `Trajectory_id` INT(11) NOT NULL,
  PRIMARY KEY (`Student_Number`),
  UNIQUE INDEX `Trajectory_id_UNIQUE` (`Trajectory_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course_of_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course_of_student` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Student_id` INT(11) NOT NULL,
  `Course_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Course_of_student_1_idx` (`Student_id` ASC) VISIBLE,
  UNIQUE INDEX `Student_id_UNIQUE` (`Student_id` ASC) VISIBLE,
  UNIQUE INDEX `Course_id_UNIQUE` (`Course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_of_student_1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `mydb`.`Students` (`Student_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Trajectories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trajectories` (
  `Tr_id` INT(11) NOT NULL,
  `Trajectory` VARCHAR(45) NULL,
  CONSTRAINT `fk_Trajectories_1`
    FOREIGN KEY (`Tr_id`)
    REFERENCES `mydb`.`Students` (`Trajectory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Courses` (
  `ID` INT NOT NULL,
  `Course` VARCHAR(45) NULL,
  `Credits` INT(10) NULL,
  CONSTRAINT `FK1`
    FOREIGN KEY (`ID`)
    REFERENCES `mydb`.`Course_of_student` (`Course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
