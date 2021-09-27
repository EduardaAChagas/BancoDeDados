-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `alocado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alocado` (
  `cpfaloc` VARCHAR(15) NOT NULL,
  `prjaloc` VARCHAR(45) NOT NULL,
  `horas` VARCHAR(45) NULL,
  PRIMARY KEY (`cpfaloc`, `prjaloc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto` (
  `nomeprj` VARCHAR(15) NOT NULL,
  `numproj` INT NOT NULL,
  `deptoprj` VARCHAR(45) NULL,
  `alocado_cpfaloc` VARCHAR(15) NOT NULL,
  `alocado_prjaloc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numproj`),
  INDEX `fk_projeto_alocado_idx` (`alocado_cpfaloc` ASC, `alocado_prjaloc` ASC) VISIBLE,
  CONSTRAINT `fk_projeto_alocado`
    FOREIGN KEY (`alocado_cpfaloc` , `alocado_prjaloc`)
    REFERENCES `alocado` (`cpfaloc` , `prjaloc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
