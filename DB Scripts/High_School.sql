-- MySQL Script generated by MySQL Workbench
-- 05/15/16 03:26:50
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema High_School
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema High_School
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `High_School` DEFAULT CHARACTER SET utf8 ;
USE `High_School` ;

-- -----------------------------------------------------
-- Table `High_School`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `High_School`.`Student` (
  `registrationNumber` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `dateOfBirth` DATE NULL,
  PRIMARY KEY (`registrationNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `High_School`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `High_School`.`Teacher` (
  `idTeacher` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `dateOfBirth` DATE NULL,
  PRIMARY KEY (`idTeacher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `High_School`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `High_School`.`Course` (
  `idCourse` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `hoursForWeek` INT NULL,
  `year` INT NULL,
  PRIMARY KEY (`idCourse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `High_School`.`Course_has_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `High_School`.`Course_has_Student` (
  `Course_idCourse` INT NOT NULL,
  `Student_registrationNumber` INT NOT NULL,
  `firstPartial` DECIMAL NULL,
  `secondPartial` DECIMAL NULL,
  `thirdPartial` DECIMAL NULL,
  `final` DECIMAL NULL,
  PRIMARY KEY (`Course_idCourse`, `Student_registrationNumber`),
  INDEX `fk_Course_has_Student_Student1_idx` (`Student_registrationNumber` ASC),
  INDEX `fk_Course_has_Student_Course_idx` (`Course_idCourse` ASC),
  CONSTRAINT `fk_Course_has_Student_Course`
    FOREIGN KEY (`Course_idCourse`)
    REFERENCES `High_School`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Student_Student1`
    FOREIGN KEY (`Student_registrationNumber`)
    REFERENCES `High_School`.`Student` (`registrationNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `High_School`.`Course_has_Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `High_School`.`Course_has_Teacher` (
  `Course_idCourse` INT NOT NULL,
  `Teacher_idTeacher` INT NOT NULL,
  PRIMARY KEY (`Course_idCourse`, `Teacher_idTeacher`),
  INDEX `fk_Course_has_Teacher_Teacher1_idx` (`Teacher_idTeacher` ASC),
  INDEX `fk_Course_has_Teacher_Course1_idx` (`Course_idCourse` ASC),
  CONSTRAINT `fk_Course_has_Teacher_Course1`
    FOREIGN KEY (`Course_idCourse`)
    REFERENCES `High_School`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Teacher_Teacher1`
    FOREIGN KEY (`Teacher_idTeacher`)
    REFERENCES `High_School`.`Teacher` (`idTeacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `High_School`.`Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `High_School`.`Schedule` (
  `idSchedule` INT NOT NULL,
  `day` VARCHAR(45) NULL,
  `startTime` VARCHAR(45) NULL,
  `finishTime` VARCHAR(45) NULL,
  `dayNumber` INT NULL,
  PRIMARY KEY (`idSchedule`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `High_School`.`Course_has_Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `High_School`.`Course_has_Schedule` (
  `Course_idCourse` INT NOT NULL,
  `Schedule_idSchedule` INT NOT NULL,
  PRIMARY KEY (`Course_idCourse`, `Schedule_idSchedule`),
  INDEX `fk_Course_has_Schedule_Schedule1_idx` (`Schedule_idSchedule` ASC),
  INDEX `fk_Course_has_Schedule_Course1_idx` (`Course_idCourse` ASC),
  CONSTRAINT `fk_Course_has_Schedule_Course1`
    FOREIGN KEY (`Course_idCourse`)
    REFERENCES `High_School`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Schedule_Schedule1`
    FOREIGN KEY (`Schedule_idSchedule`)
    REFERENCES `High_School`.`Schedule` (`idSchedule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `High_School`.`Student`
-- -----------------------------------------------------
START TRANSACTION;
USE `High_School`;
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (1, 'Cynthia', 'Andrada', '1987-08-20');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (2, 'Leonardo', 'Piergentili', '1993-09-16');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (3, 'Antonela', 'Piergentili', '1993-09-16');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (4, 'Fernanda', 'Valverde', '1986-05-19');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (5, 'Ailin', 'Almaza', '1986-12-08');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (6, 'Marianela', 'Piergentili', '1986-11-19');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (7, 'Matias', 'Sanhueza', '1986-08-04');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (8, 'Nataly', 'Silva', '1986-05-29');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (9, 'Gaston', 'Quiroga', '1987-04-05');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (10, 'Raul', 'Rodriguez', '1982-06-09');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (11, 'Jesus', 'Mendez', '1983-10-16');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (12, 'Noelia', 'Ceballos', '1979-08-21');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (13, 'Julieta', 'Suarez', '1985-08-22');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (14, 'Romina', 'Lobos', '1986-01-28');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (15, 'Daniela', 'Bonini', '1986-06-03');
INSERT INTO `High_School`.`Student` (`registrationNumber`, `firstName`, `lastName`, `dateOfBirth`) VALUES (16, 'Claudia', 'Carreras', '1981-07-13');

COMMIT;


-- -----------------------------------------------------
-- Data for table `High_School`.`Teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `High_School`;
INSERT INTO `High_School`.`Teacher` (`idTeacher`, `firstName`, `lastName`, `dateOfBirth`) VALUES (1, 'Aida', 'Villarruel', '1956-04-19');
INSERT INTO `High_School`.`Teacher` (`idTeacher`, `firstName`, `lastName`, `dateOfBirth`) VALUES (2, 'Maria Esther', 'Gabaldon', '1940-03-02');
INSERT INTO `High_School`.`Teacher` (`idTeacher`, `firstName`, `lastName`, `dateOfBirth`) VALUES (3, 'Raul', 'Piergentili', '1954-07-31');

COMMIT;


-- -----------------------------------------------------
-- Data for table `High_School`.`Course`
-- -----------------------------------------------------
START TRANSACTION;
USE `High_School`;
INSERT INTO `High_School`.`Course` (`idCourse`, `name`, `hoursForWeek`, `year`) VALUES (1, 'Maths', 5, 2016);
INSERT INTO `High_School`.`Course` (`idCourse`, `name`, `hoursForWeek`, `year`) VALUES (2, 'OOP', 4, 2016);
INSERT INTO `High_School`.`Course` (`idCourse`, `name`, `hoursForWeek`, `year`) VALUES (3, 'Logics', 2, 2016);

COMMIT;


-- -----------------------------------------------------
-- Data for table `High_School`.`Course_has_Student`
-- -----------------------------------------------------
START TRANSACTION;
USE `High_School`;
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 1, 4, 10, 9, 8);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 4, 5, 4, 5, 5);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 8, 2, 10, NULL, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 16, 2, 4, 4, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 7, 6, 3, 7, 6);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 13, 9, 9, 10, 9);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 9, 10, 6, 8, 6);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 11, 1, NULL, NULL, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 3, 7, 6, 6, 6);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (1, 2, 8, 7, 4, 6);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 1, 10, 9, 8, 9);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 16, 9, 2, 4, 5);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 4, 2, 2, 4, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 15, 2, 1, NULL, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 14, 7, 7, 6, 5);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 8, 7, 7, 6, 2);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 5, 1, 5, 9, 8);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 10, 4, 4, 4, 2);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 12, 9, 8, 10, 9);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (2, 7, 7, 6, 7, 5);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 1, 1, NULL, NULL, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 2, 4, 6, 4, 6);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 3, 9, 9, 4, 7);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 4, 2, 4, 2, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 6, 8, 8, 6, 7);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 7, 9, 2, 2, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 15, 7, 4, 6, 2);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 14, 4, 5, 8, 6);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 13, 2, 1, NULL, NULL);
INSERT INTO `High_School`.`Course_has_Student` (`Course_idCourse`, `Student_registrationNumber`, `firstPartial`, `secondPartial`, `thirdPartial`, `final`) VALUES (3, 11, 3, 7, 6, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `High_School`.`Course_has_Teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `High_School`;
INSERT INTO `High_School`.`Course_has_Teacher` (`Course_idCourse`, `Teacher_idTeacher`) VALUES (1, 1);
INSERT INTO `High_School`.`Course_has_Teacher` (`Course_idCourse`, `Teacher_idTeacher`) VALUES (1, 3);
INSERT INTO `High_School`.`Course_has_Teacher` (`Course_idCourse`, `Teacher_idTeacher`) VALUES (2, 3);
INSERT INTO `High_School`.`Course_has_Teacher` (`Course_idCourse`, `Teacher_idTeacher`) VALUES (3, 3);
INSERT INTO `High_School`.`Course_has_Teacher` (`Course_idCourse`, `Teacher_idTeacher`) VALUES (3, 2);
INSERT INTO `High_School`.`Course_has_Teacher` (`Course_idCourse`, `Teacher_idTeacher`) VALUES (2, 2);
INSERT INTO `High_School`.`Course_has_Teacher` (`Course_idCourse`, `Teacher_idTeacher`) VALUES (3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `High_School`.`Schedule`
-- -----------------------------------------------------
START TRANSACTION;
USE `High_School`;
INSERT INTO `High_School`.`Schedule` (`idSchedule`, `day`, `startTime`, `finishTime`, `dayNumber`) VALUES (1, 'Monday', '14:00:00', '16:00:00', 1);
INSERT INTO `High_School`.`Schedule` (`idSchedule`, `day`, `startTime`, `finishTime`, `dayNumber`) VALUES (2, 'Monday', '16:00:00', '18:00:00', 1);
INSERT INTO `High_School`.`Schedule` (`idSchedule`, `day`, `startTime`, `finishTime`, `dayNumber`) VALUES (3, 'Tuesday', '14:00:00', '15:00:00', 2);
INSERT INTO `High_School`.`Schedule` (`idSchedule`, `day`, `startTime`, `finishTime`, `dayNumber`) VALUES (4, 'Tuestay', '15:00:00', '17:00:00', 2);
INSERT INTO `High_School`.`Schedule` (`idSchedule`, `day`, `startTime`, `finishTime`, `dayNumber`) VALUES (5, 'Wednesday', '16:00:00', '18:00:00', 3);
INSERT INTO `High_School`.`Schedule` (`idSchedule`, `day`, `startTime`, `finishTime`, `dayNumber`) VALUES (6, 'Thursday', '14:00:00', '16:00:00', 4);
INSERT INTO `High_School`.`Schedule` (`idSchedule`, `day`, `startTime`, `finishTime`, `dayNumber`) VALUES (7, 'Friday', '15:00:00', '17:00:00', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `High_School`.`Course_has_Schedule`
-- -----------------------------------------------------
START TRANSACTION;
USE `High_School`;
INSERT INTO `High_School`.`Course_has_Schedule` (`Course_idCourse`, `Schedule_idSchedule`) VALUES (1, 1);
INSERT INTO `High_School`.`Course_has_Schedule` (`Course_idCourse`, `Schedule_idSchedule`) VALUES (1, 3);
INSERT INTO `High_School`.`Course_has_Schedule` (`Course_idCourse`, `Schedule_idSchedule`) VALUES (1, 5);
INSERT INTO `High_School`.`Course_has_Schedule` (`Course_idCourse`, `Schedule_idSchedule`) VALUES (2, 2);
INSERT INTO `High_School`.`Course_has_Schedule` (`Course_idCourse`, `Schedule_idSchedule`) VALUES (2, 6);
INSERT INTO `High_School`.`Course_has_Schedule` (`Course_idCourse`, `Schedule_idSchedule`) VALUES (3, 4);
INSERT INTO `High_School`.`Course_has_Schedule` (`Course_idCourse`, `Schedule_idSchedule`) VALUES (3, 7);

COMMIT;

