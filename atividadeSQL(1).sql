
-- a) Criar Tabela Projeto

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

-- b) Mostre o nome dos empregados do departamento cujo nome é “Ensino” e que ganham menos que 3000,00.

SELECT a.NOME FROM EMPREGADO a, DEPARTAMENTO b
WHERE b.NOMDEPTO LIKE "Ensino" and a.SALARIO < 3000;

-- c) Busque o nome e o CPF dos funcionários que são gerentes.

SELECT a.NOME, a.CPF FROM EMPREGADO a, DEPARTAMENTO b
WHERE a.CPF = b.CPFGERENTE;

-- d) Obtenha o nome e o CPF dos empregados do sexo feminino cujos salários sejam maiores que 4000,00 e que trabalhem no projeto chamado “Genoma”.

SELECT a.NOME, a.CPF FROM EMPREGADO a, PROJETO b, ALOCADO c
WHERE a.SEXO = "F" and c.CPFALOC = a.CPF and c.PRJALOC = b.NUMPROJ and b.NOMEPRJ = "Genoma" and a.SALARIO>4000;

-- e) Liste o nome dos projetos dos departamentos gerenciados por mulheres que recebem mais que 5000,00.

SELECT a.NOMEPROJ FROM PROJETO a, DEPARTAMENTO b, GERENCIOU c, EMPREGADO d
WHERE d.SEXO = "F" and d.CPF = c.CPFCHEFE and c.DEPTOGER = b.DEPTO and b.DEPTO = a.DEPTOPROJ;

-- f) Encontre a quantidade de projetos por cada departamento.

SELECT COUNT(a.NUMPROJ) AS "Quantidade de projetos" FROM PROJETO a, DEPARTAMENTO b
WHERE a.DEPTOPRJ = DEPTO;
