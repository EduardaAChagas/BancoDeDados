-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cursosprofissionalizantes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cursosprofissionalizantes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cursosprofissionalizantes` DEFAULT CHARACTER SET utf8 ;
USE `cursosprofissionalizantes` ;

-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Curso` (
  `codigoCurso` CHAR(10) NOT NULL,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Modulo` (
  `codigoModulo` CHAR(10) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `Curso_codigoCurso` CHAR(10) NOT NULL,
  PRIMARY KEY (`codigoModulo`, `Curso_codigoCurso`),
  INDEX `fk_Modulo_Curso1_idx` (`Curso_codigoCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Modulo_Curso1`
    FOREIGN KEY (`Curso_codigoCurso`)
    REFERENCES `cursosprofissionalizantes`.`Curso` (`codigoCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Empregado` (
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
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Professor` (
  `Empregado_CPF` CHAR(11) NOT NULL,
  `matricula` VARCHAR(45) NOT NULL,
  `formacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Empregado_CPF`, `matricula`),
  CONSTRAINT `fk_Professor_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `cursosprofissionalizantes`.`Empregado` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Turma` (
  `Modulo_codigoModulo` CHAR(10) NOT NULL,
  `Modulo_Curso_codigoCurso` CHAR(10) NOT NULL,
  `codigoTurma` VARCHAR(45) NOT NULL,
  `conteudoProgramatico` VARCHAR(45) NULL,
  `valor` DOUBLE NOT NULL,
  `cargaHoraria` VARCHAR(45) NULL,
  `dataTermino` DATE NULL,
  `dataInicio` DATE NOT NULL,
  `Turmacol` VARCHAR(45) NULL,
  `Professor_Empregado_CPF` CHAR(11) NOT NULL,
  `Professor_matricula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigoTurma`, `Professor_Empregado_CPF`, `Professor_matricula`),
  INDEX `fk_Turma_Professor1_idx` (`Professor_Empregado_CPF` ASC, `Professor_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_Modulo1`
    FOREIGN KEY (`Modulo_codigoModulo` , `Modulo_Curso_codigoCurso`)
    REFERENCES `cursosprofissionalizantes`.`Modulo` (`codigoModulo` , `Curso_codigoCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Professor1`
    FOREIGN KEY (`Professor_Empregado_CPF` , `Professor_matricula`)
    REFERENCES `cursosprofissionalizantes`.`Professor` (`Empregado_CPF` , `matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Aluno` (
  `matriculaAluno` VARCHAR(45) NOT NULL,
  `RG` VARCHAR(45) NULL,
  `CPF` CHAR(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `CEP` CHAR(8) NOT NULL,
  `numeroCasa` VARCHAR(10) NULL,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`matriculaAluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Matricula` (
  `Turma_codigoTurma` VARCHAR(45) NOT NULL,
  `Aluno_matriculaAluno` VARCHAR(45) NOT NULL,
  `dataMatricula` DATE NOT NULL,
  `dataPagamento` DATE NOT NULL,
  `valorPago` DOUBLE NOT NULL,
  INDEX `fk_Matricula_Turma1_idx` (`Turma_codigoTurma` ASC) VISIBLE,
  PRIMARY KEY (`Aluno_matriculaAluno`),
  CONSTRAINT `fk_Matricula_Turma1`
    FOREIGN KEY (`Turma_codigoTurma`)
    REFERENCES `cursosprofissionalizantes`.`Turma` (`codigoTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Aluno1`
    FOREIGN KEY (`Aluno_matriculaAluno`)
    REFERENCES `cursosprofissionalizantes`.`Aluno` (`matriculaAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursosprofissionalizantes`.`Aluno_has_Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cursosprofissionalizantes`.`Aluno_has_Turma` (
  `Aluno_matriculaAluno` VARCHAR(45) NOT NULL,
  `Turma_codigoTurma` VARCHAR(45) NOT NULL,
  `notas` FLOAT NULL,
  PRIMARY KEY (`Aluno_matriculaAluno`, `Turma_codigoTurma`),
  INDEX `fk_Aluno_has_Turma_Turma1_idx` (`Turma_codigoTurma` ASC) VISIBLE,
  INDEX `fk_Aluno_has_Turma_Aluno1_idx` (`Aluno_matriculaAluno` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_has_Turma_Aluno1`
    FOREIGN KEY (`Aluno_matriculaAluno`)
    REFERENCES `cursosprofissionalizantes`.`Aluno` (`matriculaAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Turma_Turma1`
    FOREIGN KEY (`Turma_codigoTurma`)
    REFERENCES `cursosprofissionalizantes`.`Turma` (`codigoTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
