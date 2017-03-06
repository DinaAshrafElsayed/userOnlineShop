-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema onlineShopping
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `onlineShopping` ;

-- -----------------------------------------------------
-- Schema onlineShopping
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `onlineShopping` DEFAULT CHARACTER SET utf8 ;
USE `onlineShopping` ;

-- -----------------------------------------------------
-- Table `onlineShopping`.`creditCard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`creditCard` (
  `number` bigint NOT NULL,
  `expireDate` VARCHAR(45) NULL,
  `balance` DOUBLE NULL DEFAULT 1000,
  PRIMARY KEY (`number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineShopping`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`User` (
  `email` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `birthDate` date NULL,
  `password` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `imageurl` VARCHAR(1024) NULL,
  `type` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `creditCard_number` bigint NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_User_creditCard1_idx` (`creditCard_number` ASC),
  CONSTRAINT `fk_User_creditCard1`
    FOREIGN KEY (`creditCard_number`)
    REFERENCES `onlineShopping`.`creditCard` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineShopping`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`orders` (
  `date` DATE NULL,
  `status` INT NULL DEFAULT 0,
  `id` INT NOT NULL AUTO_INCREMENT,
  `User_email` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`, `User_email`),
  INDEX `fk_order_User1_idx` (`User_email` ASC),
  CONSTRAINT `fk_order_User1`
    FOREIGN KEY (`User_email`)
    REFERENCES `onlineShopping`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineShopping`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `imageUrl` VARCHAR(1024) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `discount` DOUBLE NULL,
  `categoryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `productName_UNIQUE` (`productName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineShopping`.`productReviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`productReviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(255) NULL,
  `User_email` VARCHAR(25) NOT NULL,
  `products_product_id` INT NOT NULL,
  PRIMARY KEY (`id`, `User_email`, `products_product_id`),
  INDEX `fk_productReviews_User1_idx` (`User_email` ASC),
  INDEX `fk_productReviews_products1_idx` (`products_product_id` ASC),
  CONSTRAINT `fk_productReviews_User1`
    FOREIGN KEY (`User_email`)
    REFERENCES `onlineShopping`.`User` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productReviews_products1`
    FOREIGN KEY (`products_product_id`)
    REFERENCES `onlineShopping`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineShopping`.`rechargeCards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`rechargeCards` (
  `number` INT NOT NULL,
  `value` INT NULL,
  `status` VARCHAR(10) NULL,
  PRIMARY KEY (`number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineShopping`.`orderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`orderDetails` (
  `products_product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`products_product_id`, `order_id`),
  INDEX `fk_products_has_order_order1_idx` (`order_id` ASC),
  INDEX `fk_products_has_order_products1_idx` (`products_product_id` ASC),
  CONSTRAINT `fk_products_has_order_products1`
    FOREIGN KEY (`products_product_id`)
    REFERENCES `onlineShopping`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `onlineShopping`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `onlineShopping`.`productImages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineShopping`.`productImages` (
  `imageUrl` VARCHAR(800) NOT NULL,
  `products_product_id` INT NOT NULL,
  INDEX `fk_productImages_products1_idx` (`products_product_id` ASC),
  PRIMARY KEY (`imageUrl`, `products_product_id`),
  CONSTRAINT `fk_productImages_products1`
    FOREIGN KEY (`products_product_id`)
    REFERENCES `onlineShopping`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
