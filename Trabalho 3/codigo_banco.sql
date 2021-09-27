-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cursosprofissionalizantes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Curso` (
  `codigo` CHAR(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo` (
  `codigo` CHAR(10) NOT NULL,
  `descricao` TEXT NULL,
  `Curso_codigo` CHAR(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Modulo_Curso1_idx` (`Curso_codigo` ASC),
  CONSTRAINT `fk_Modulo_Curso1`
    FOREIGN KEY (`Curso_codigo`)
    REFERENCES `Curso` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Empregado` (
  `CPF` CHAR(11) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` CHAR(9) NULL,
  `dataDeAdmissao` DATE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `CEP` CHAR(8) NOT NULL,
  `numeroCasa` VARCHAR(10) NULL,
  `complemento` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NOT NULL,
  `sexo` ENUM("F", "M") NULL,
  `idade` INT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Professor` (
  `Empregado_CPF` CHAR(11) NOT NULL,
  `matricula` VARCHAR(45) NOT NULL,
  `formacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Empregado_CPF`, `matricula`),
  CONSTRAINT `fk_Professor_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `Empregado` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Turma` (
  `codigo` VARCHAR(45) NOT NULL,
  `conteudoProgramatico` VARCHAR(45) NULL,
  `valor` DOUBLE NOT NULL,
  `cargaHoraria` INT NULL,
  `dataTermino` DATE NULL,
  `dataInicio` DATE NOT NULL,
  `Professor_Empregado_CPF` CHAR(11) NOT NULL,
  `Professor_matricula` VARCHAR(45) NOT NULL,
  `Modulo_codigo` CHAR(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Turma_Professor1_idx` (`Professor_Empregado_CPF` ASC, `Professor_matricula` ASC),
  INDEX `fk_Turma_Modulo1_idx` (`Modulo_codigo` ASC),
  CONSTRAINT `fk_Turma_Professor1`
    FOREIGN KEY (`Professor_Empregado_CPF` , `Professor_matricula`)
    REFERENCES `Professor` (`Empregado_CPF` , `matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Modulo1`
    FOREIGN KEY (`Modulo_codigo`)
    REFERENCES `Modulo` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aluno` (
  `matricula` VARCHAR(45) NOT NULL,
  `RG` VARCHAR(45) NULL,
  `CPF` CHAR(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `CEP` CHAR(8) NOT NULL,
  `numeroCasa` VARCHAR(10) NULL,
  `complemento` VARCHAR(45) NULL,
  `idadel` INT NOT NULL,
  `sexo` ENUM("M", "F") NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Matricula` (
  `Turma_codigo` VARCHAR(45) NOT NULL,
  `Aluno_matricula` VARCHAR(45) NOT NULL,
  `dataMatricula` DATE NOT NULL,
  `dataPagamento` DATE NOT NULL,
  `valorPago` DOUBLE NOT NULL,
  PRIMARY KEY (`Turma_codigo`, `Aluno_matricula`),
  INDEX `fk_Matricula_Aluno1_idx` (`Aluno_matricula` ASC),
  INDEX `fk_Matricula_Turma1_idx` (`Turma_codigo` ASC),
  CONSTRAINT `fk_Matricula_Aluno1`
    FOREIGN KEY (`Aluno_matricula`)
    REFERENCES `Aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Turma1`
    FOREIGN KEY (`Turma_codigo`)
    REFERENCES `Turma` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aluno_Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aluno_Turma` (
  `Turma_codigo` VARCHAR(45) NOT NULL,
  `Aluno_matricula` VARCHAR(45) NOT NULL,
  `notas` FLOAT NULL,
  PRIMARY KEY (`Turma_codigo`, `Aluno_matricula`),
  INDEX `fk_Aluno_Turma_Aluno1_idx` (`Aluno_matricula` ASC),
  INDEX `fk_Aluno_Turma_Turma1_idx` (`Turma_codigo` ASC),
  CONSTRAINT `fk_Aluno_Turma_Aluno1`
    FOREIGN KEY (`Aluno_matricula`)
    REFERENCES `Aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_Turma_Turma1`
    FOREIGN KEY (`Turma_codigo`)
    REFERENCES `Turma` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
