-- MySQL Script generated by MySQL Workbench
-- Thu Sep 15 13:25:20 2022
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`stats_and_resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stats_and_resources` (
  `id` INT NOT NULL,
  `year` DATE NULL,
  `lvl` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`players` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `resources_id` INT NOT NULL,
  PRIMARY KEY (`id`, `resources_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`areas` (
  `id` INT NOT NULL,
  `players_id` INT NOT NULL,
  `players_resources_id` INT NOT NULL,
  PRIMARY KEY (`id`, `players_id`, `players_resources_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`buildings` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `price` DECIMAL NULL,
  `cost` DOUBLE NULL,
  `cost_type` VARCHAR(45) NULL,
  `areas_id` INT NOT NULL,
  `areas_players_id` INT NOT NULL,
  `areas_players_resources_id` INT NOT NULL,
  PRIMARY KEY (`id`, `areas_id`, `areas_players_id`, `areas_players_resources_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`workers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`workers` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `speed` FLOAT NULL,
  `lvl` DECIMAL NULL,
  `price` DECIMAL NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`areas_out_of_area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`areas_out_of_area` (
  `id` INT NOT NULL,
  `location` POINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`warriors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`warriors` (
  `id` INT NOT NULL,
  `typed` VARCHAR(45) NULL,
  `health` DECIMAL NULL,
  `speed` FLOAT NOT NULL,
  `strength` DECIMAL NULL,
  `cost` DECIMAL NULL,
  `price` DECIMAL NULL,
  `current_location` POINT NULL,
  `areas_out_of_area_id` INT NOT NULL,
  PRIMARY KEY (`id`, `areas_out_of_area_id`, `speed`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`workers_has_buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`workers_has_buildings` (
  `workers_id` INT NOT NULL,
  `buildings_id` INT NOT NULL,
  `buildings_areas_id` INT NOT NULL,
  `buildings_areas_players_id` INT NOT NULL,
  `buildings_areas_players_resources_id` INT NOT NULL,
  PRIMARY KEY (`workers_id`, `buildings_id`, `buildings_areas_id`, `buildings_areas_players_id`, `buildings_areas_players_resources_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`buildings_has_warriors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`buildings_has_warriors` (
  `buildings_id` INT NOT NULL,
  `buildings_areas_id` INT NOT NULL,
  `buildings_areas_players_id` INT NOT NULL,
  `buildings_areas_players_resources_id` INT NOT NULL,
  `warriors_id` INT NOT NULL,
  PRIMARY KEY (`buildings_id`, `buildings_areas_id`, `buildings_areas_players_id`, `buildings_areas_players_resources_id`, `warriors_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enemies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enemies` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `health` DECIMAL NULL,
  `speed` FLOAT NULL,
  `strength` DECIMAL NULL,
  `current_locaztion` POINT NULL,
  `warriors_id` INT NOT NULL,
  `warriors_areas_of_stay_id` INT NOT NULL,
  PRIMARY KEY (`id`, `warriors_id`, `warriors_areas_of_stay_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`resources_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`resources_types` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `unlock_year` DATE NULL,
  `usage_description` LONGTEXT NULL,
  `count` INT NULL,
  `resources_id` INT NOT NULL,
  PRIMARY KEY (`id`, `resources_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
