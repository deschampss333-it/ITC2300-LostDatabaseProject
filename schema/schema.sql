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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `clientID` INT NOT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`clientID`),
  UNIQUE INDEX `clientID_UNIQUE` (`clientID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`guides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`guides` (
  `guideID` INT NOT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `zip` VARCHAR(45) NULL DEFAULT NULL,
  `hireDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`guideID`),
  UNIQUE INDEX `guideID_UNIQUE` (`guideID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locations` (
  `locationID` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`locationID`),
  UNIQUE INDEX `locationID_UNIQUE` (`locationID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`tours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tours` (
  `tourID` INT NOT NULL,
  `tourName` VARCHAR(45) NOT NULL,
  `lengthHours` INT NULL DEFAULT NULL,
  `fee` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`tourID`),
  UNIQUE INDEX `tourID_UNIQUE` (`tourID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`outings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`outings` (
  `outingID` INT NOT NULL,
  `outingDateTime` DATETIME NULL DEFAULT NULL,
  `Tours_tourID` INT NOT NULL,
  `Guides_guideID` INT NOT NULL,
  PRIMARY KEY (`outingID`, `Guides_guideID`),
  UNIQUE INDEX `outingID_UNIQUE` (`outingID` ASC) VISIBLE,
  INDEX `fk_Outing_Tours1_idx` (`Tours_tourID` ASC) VISIBLE,
  INDEX `fk_Outings_Guides1_idx` (`Guides_guideID` ASC) VISIBLE,
  CONSTRAINT `fk_Outing_Tours1`
    FOREIGN KEY (`Tours_tourID`)
    REFERENCES `mydb`.`tours` (`tourID`),
  CONSTRAINT `fk_Outings_Guides1`
    FOREIGN KEY (`Guides_guideID`)
    REFERENCES `mydb`.`guides` (`guideID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`outingsclients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`outingsclients` (
  `Outing_outingID` INT NOT NULL,
  `Client_clientID` INT NOT NULL,
  PRIMARY KEY (`Outing_outingID`, `Client_clientID`),
  INDEX `fk_Outing_has_Client_Client1_idx` (`Client_clientID` ASC) VISIBLE,
  INDEX `fk_Outing_has_Client_Outing1_idx` (`Outing_outingID` ASC) VISIBLE,
  CONSTRAINT `fk_Outing_has_Client_Client1`
    FOREIGN KEY (`Client_clientID`)
    REFERENCES `mydb`.`clients` (`clientID`),
  CONSTRAINT `fk_Outing_has_Client_Outing1`
    FOREIGN KEY (`Outing_outingID`)
    REFERENCES `mydb`.`outings` (`outingID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`qualifiedguides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`qualifiedguides` (
  `Tours_tourID` INT NOT NULL,
  `Guides_guideID` INT NOT NULL,
  `qualifiedDate` DATE NOT NULL,
  PRIMARY KEY (`Tours_tourID`, `Guides_guideID`),
  INDEX `fk_Tours_has_Guides_Guides1_idx` (`Guides_guideID` ASC) VISIBLE,
  INDEX `fk_Tours_has_Guides_Tours_idx` (`Tours_tourID` ASC) VISIBLE,
  CONSTRAINT `fk_Tours_has_Guides_Guides1`
    FOREIGN KEY (`Guides_guideID`)
    REFERENCES `mydb`.`guides` (`guideID`),
  CONSTRAINT `fk_Tours_has_Guides_Tours`
    FOREIGN KEY (`Tours_tourID`)
    REFERENCES `mydb`.`tours` (`tourID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`tourslocations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tourslocations` (
  `Tours_tourID` INT NOT NULL,
  `Location_locationID` INT NOT NULL,
  `sequence` INT NOT NULL,
  PRIMARY KEY (`Tours_tourID`, `Location_locationID`, `sequence`),
  INDEX `fk_Tours_has_Location_Location1_idx` (`Location_locationID` ASC) VISIBLE,
  INDEX `fk_Tours_has_Location_Tours1_idx` (`Tours_tourID` ASC) VISIBLE,
  CONSTRAINT `fk_Tours_has_Location_Location1`
    FOREIGN KEY (`Location_locationID`)
    REFERENCES `mydb`.`locations` (`locationID`),
  CONSTRAINT `fk_Tours_has_Location_Tours1`
    FOREIGN KEY (`Tours_tourID`)
    REFERENCES `mydb`.`tours` (`tourID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view3` (`tourName` INT, `guideID` INT, `lastName` INT, `firstName` INT, `qualifiedDate` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view4`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view4` (`guideID` INT, `lastName` INT, `firstName` INT, `qualifiedTours` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view5`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view5` (`clientID` INT, `lastName` INT, `firstName` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view2` (`outingID` INT, `outingDateTime` INT, `tourName` INT, `clientCount` INT);

-- -----------------------------------------------------
-- View `mydb`.`view3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view3`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view3` AS
SELECT t.tourName, g.guideID, g.lastName, g.firstName, qg.qualifiedDate
FROM Tours t
JOIN QualifiedGuides qg ON qg.Tours_tourID = t.tourID
JOIN Guides g ON g.guideID = qg.Guides_guideID
WHERE t.tourName = 'Basic'
ORDER BY qg.qualifiedDate DESC, g.lastName;

/* Guides qualified for basic */;

-- -----------------------------------------------------
-- View `mydb`.`view4`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view4`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view4` AS
SELECT g.guideID, g.lastName, g.firstName, COUNT(qg.Tours_tourID) AS qualifiedTours
FROM Guides g
LEFT JOIN QualifiedGuides qg ON qg.Guides_guideID = g.guideID
GROUP BY g.guideID, g.lastName, g.firstName
ORDER BY qualifiedTours DESC, g.lastName, g.firstName;
/*Number of tours guides are qualified for */;

-- -----------------------------------------------------
-- View `mydb`.`view5`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view5`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view5` AS
SELECT c.clientID, c.lastName, c.firstName
FROM Clients c
LEFT JOIN OutingsClients oc ON oc.Client_clientID = c.clientID
WHERE oc.Client_clientID IS NULL
ORDER BY c.lastName, c.firstName;

/* Clients who have not booked anything */;

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;
SELECT o.outingID,
       o.outingDateTime,
       t.tourName,
       CONCAT(g.firstName, ' ', g.lastName) AS guideName
FROM Outings o
JOIN Tours t  ON t.tourID = o.Tours_tourID
JOIN Guides g ON g.guideID = o.Guides_guideID
WHERE o.outingDateTime > '2009-09-01'
ORDER BY o.outingDateTime;
/* List of the outings scheduled after September with tour name and guide */;

-- -----------------------------------------------------
-- View `mydb`.`view2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view2`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view2` AS
SELECT o.outingID, o.outingDateTime, t.tourName,
       COUNT(oc.Client_clientID) AS clientCount
FROM Outings o
JOIN Tours t ON t.tourID = o.Tours_tourID
LEFT JOIN OutingsClients oc ON oc.Outing_outingID = o.outingID
GROUP BY o.outingID, o.outingDateTime, t.tourName
ORDER BY clientCount DESC, o.outingDateTime;
/*Number of clients scheduled to go on individual outings */;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
