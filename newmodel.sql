-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mymodeldb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mymodeldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mymodeldb` DEFAULT CHARACTER SET utf8 ;
USE `mymodeldb` ;

-- -----------------------------------------------------
-- Table `mymodeldb`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymodeldb`.`languages` (
  `language_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymodeldb`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymodeldb`.`movies` (
  `movie_id` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `industry` VARCHAR(45) NULL,
  `release_year` YEAR NULL,
  `imdb_rating` DECIMAL(3,1) NULL,
  `studio` VARCHAR(45) NULL,
  `language_id` TINYINT UNSIGNED NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `fk_movies_languages1_idx` (`language_id` ASC),
  CONSTRAINT `fk_movies_languages1`
    FOREIGN KEY (`language_id`)
    REFERENCES `mymodeldb`.`languages` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mymodeldb`.`financials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymodeldb`.`financials` (
  `movie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `budget` DECIMAL(10,2) NULL,
  `revenue` DECIMAL(10,2) NULL,
  `unit` ENUM("Units", "Thousands", "Millions", "Billions") NULL,
  `currency` CHAR(3) NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymodeldb`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymodeldb`.`actors` (
  `actor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `birth_year` YEAR(4) NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mymodeldb`.`movie_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymodeldb`.`movie_actor` (
  `movie_id` INT UNSIGNED NOT NULL,
  `actor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`, `actor_id`),
  INDEX `fk_movie_actor_movies1_idx` (`movie_id` ASC),
  INDEX `fk_movie_actor_actors_idx` (`actor_id` ASC),
  CONSTRAINT `fk_movie_actor_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `mymodeldb`.`movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_actor_actors`
    FOREIGN KEY (`actor_id`)
    REFERENCES `mymodeldb`.`actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
