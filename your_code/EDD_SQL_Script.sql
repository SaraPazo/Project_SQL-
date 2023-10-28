-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema SQL_videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SQL_videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SQL_videoclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `SQL_videoclub` ;

-- -----------------------------------------------------
-- Table `SQL_videoclub`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_videoclub`.`actor` (
  `Actor_id` INT NOT NULL,
  `Name_complete` TEXT NULL DEFAULT NULL,
  `Date` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `SQL_videoclub`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_videoclub`.`category` (
  `category_id` INT NOT NULL,
  `Category` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `SQL_videoclub`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_videoclub`.`language` (
  `language_id` INT NOT NULL,
  `Language` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `SQL_videoclub`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_videoclub`.`film` (
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` INT NULL DEFAULT NULL,
  `rating` INT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `language_id_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `language_id`
    FOREIGN KEY (`language_id`)
    REFERENCES `SQL_videoclub`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `SQL_videoclub`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_videoclub`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `film_id`
    FOREIGN KEY (`film_id`)
    REFERENCES `SQL_videoclub`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `SQL_videoclub`.`old_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_videoclub`.`old_hdd` (
  `old_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `Name_complete` TEXT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `Actor_id` INT NULL DEFAULT NULL,
  `film_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`old_id`),
  INDEX `film_id_idx` (`film_id` ASC) VISIBLE,
  INDEX `Actor_id_idx` (`Actor_id` ASC) VISIBLE,
  INDEX `category_id_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `film_id`
    FOREIGN KEY (`film_id`)
    REFERENCES `SQL_videoclub`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Actor_id`
    FOREIGN KEY (`Actor_id`)
    REFERENCES `SQL_videoclub`.`actor` (`Actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `SQL_videoclub`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `SQL_videoclub`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_videoclub`.`rental` (
  `rental_id` INT NOT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `staff_id` INT NULL DEFAULT NULL,
  `Days_rent` INT NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `inventory_id_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `inventory_id`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `SQL_videoclub`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
