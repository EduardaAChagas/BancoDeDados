
-- Cursos
Insert Into Curso(codigo, nome)
Values("202101","Matematica");

Insert Into Curso(codigo, nome)
Values("202102","Psicologia");

Insert Into Curso(codigo, nome)
Values("202103","Farmácia");

-- Módulos
Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("011","Primeiro Módulo: iniciante","202101");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("012","Segundo Módulo: intermediário","202101");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("013","Terceiro Módulo: avançado","202101");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("021","Primeiro Módulo: iniciante","202102");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("022","Segundo Módulo: intermediário","202102");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("023","Terceiro Módulo: avançado","202102");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("031","Primeiro Módulo: iniciante","202103");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("032","Segundo Módulo: intermediário","202103");

Insert Into Modulo(codigo, descricao, Curso_codigo)
Values("033","Terceiro Módulo: avançado","202103");

-- Empregados

Insert Into Empregado(CPF,RG,email,telefone,datadeAdmissao,nome,CEP,numeroCasa, complemento, senha, sexo, idade)
Values("12345678910","152847586","rosangela@live.com","983215226",'2013-03-23',"Rosangela Peres","65000500","14","Bloco 3", "rosa123", "F",52);

Insert Into Empregado(CPF,RG,email,telefone,datadeAdmissao,nome,CEP,numeroCasa, complemento, senha, sexo, idade)
Values("456315875","45125684","alberto@live.com","984523545",'2011-08-02',"Alberto de Almeida","65000500","52"," ", "beto321","M",34);

Insert Into Empregado(CPF,RG,email,telefone,datadeAdmissao,nome,CEP,numeroCasa, complemento, senha, sexo, idade)
Values("45823654145","6542879610","gilberto@live.com","982354565",'2005-10-25',"Gilberto Mendes","65000500","48","Alameda Verde", "gil321berto","M",41);

Insert Into Empregado(CPF,RG,email,telefone,datadeAdmissao,nome,CEP,numeroCasa, complemento, senha, sexo, idade)
Values("54479577320","5478571145","pamela@hotmail.com","985623452",'2019-06-13',"Pamela Araujo","65000500","4001","Posto Santa Cruz", "pam2403","F",28);

-- Professores

Insert Into Professor(Empregado_CPF,matricula,formacao)
Values("54479577320","32266491","Mestrado em Matematica");

Insert Into Professor(Empregado_CPF,matricula,formacao)
Values("456315875","43258123","Pós-Graduação em Psicopedagogia");

Insert Into Professor(Empregado_CPF,matricula,formacao)
Values("12345678910","56221583","Graduação em Enfermagem e Farmácia");

-- Turmas
Insert Into Turma(codigo,conteudoProgramatico,valor,cargaHoraria,dataTermino,dataInicio,Professor_Empregado_CPF,Professor_matricula,Modulo_codigo)
Values("202103032","Noções de Sutura",2000,100,'2021-06-03','2021-03-05',"12345678910","56221583","032");

Insert Into Turma(codigo,conteudoProgramatico,valor,cargaHoraria,dataTermino,dataInicio,Professor_Empregado_CPF,Professor_matricula,Modulo_codigo)
Values("202101012","Álgebra Linear",5000,150,'2021-06-03','2021-03-05',"54479577320","32266491","012");

Insert Into Turma(codigo,conteudoProgramatico,valor,cargaHoraria,dataTermino,dataInicio,Professor_Empregado_CPF,Professor_matricula,Modulo_codigo)
Values("202101023","Finalizando o Curso: TCC","4000",100,'2021-06-03','2021-03-05',"456315875","43258123","023");

-- Alunos

Insert Into Aluno(matricula,RG,CPF,Nome,senha,email,CEP,numeroCasa,complemento, idade, sexo)
Values("202154658","45646856","04534583222","Paulo Victor Serra","pvserra","pv@live.com","65000500","325"," ",21,'M');

Insert Into Aluno(matricula,RG,CPF,Nome,senha,email,CEP,numeroCasa,complemento,idade, sexo)
Values("202154525","32464323","55732674225","Ana Paula Lima","aplima","ap@live.com","65000500","96"," ",19,'F');

Insert Into Aluno(matricula,RG,CPF,Nome,senha,email,CEP,numeroCasa,complemento,idade, sexo)
Values("202158563","54548522","54236985214","Mateus Carvalho Araujo","mcaraujo","mc@live.com","65000500","575"," ",20,'M');

Insert Into Aluno(matricula,RG,CPF,Nome,senha,email,CEP,numeroCasa,complemento,idade, sexo)
Values("202185678","78696655","24523612388","Bianca Sousa Oliveira","bsoliveira","bs@live.com","65000500","58"," ",17,'F');

Insert Into Aluno(matricula,RG,CPF,Nome,senha,email,CEP,numeroCasa,complemento,idade, sexo)
Values("202121532","51213622","02132452216","Saulo Diniz Pereira","sdpereira","sd@live.com","65000500","12"," ",21,'M');

Insert Into Aluno(matricula,RG,CPF,Nome,senha,email,CEP,numeroCasa,complemento,idade, sexo)
Values("202152132","45121252","23011028794","Marcela Pinto Paiva","mppaiva","mp@live.com","65000500","65"," ",20,'F');

-- Matriculas
Insert Into Matricula(Turma_codigo,Aluno_matricula,dataMatricula,dataPagamento,valorPago)
Values("202103032","202152132",'2021-03-05','2021-03-05',"2000");

Insert Into Matricula(Turma_codigo,Aluno_matricula,dataMatricula,dataPagamento,valorPago)
Values("202103032","202185678",'2021-03-05','2021-03-05',"2000");

Insert Into Matricula(Turma_codigo,Aluno_matricula,dataMatricula,dataPagamento,valorPago)
Values("202101023","202121532",'2021-03-05','2021-03-05',"4000");

Insert Into Matricula(Turma_codigo,Aluno_matricula,dataMatricula,dataPagamento,valorPago)
Values("202101023","202158563",'2021-03-05','2021-03-05',"4000");

Insert Into Matricula(Turma_codigo,Aluno_matricula,dataMatricula,dataPagamento,valorPago)
Values("202101023","202154658",'2021-03-05','2021-03-05',"5000");

Insert Into Matricula(Turma_codigo,Aluno_matricula,dataMatricula,dataPagamento,valorPago)
Values("202101023","202154525",'2021-03-05','2021-03-05',"5000");

-- Aluno Turma

Insert Into aluno_turma(Turma_codigo,Aluno_matricula,notas)
Values("202103032","202152132","7.5");

Insert Into aluno_turma(Turma_codigo,Aluno_matricula,notas)
Values("202103032","202185678","8.6");

Insert Into aluno_turma(Turma_codigo,Aluno_matricula,notas)
Values("202101023","202121532","10.0");

Insert Into aluno_turma(Turma_codigo,Aluno_matricula,notas)
Values("202101023","202158563","2.3");

Insert Into aluno_turma(Turma_codigo,Aluno_matricula,notas)
Values("202101023","202154658","7.2");

Insert Into aluno_turma(Turma_codigo,Aluno_matricula,notas)
Values("202101023","202154525","9.7");

SELECT nome FROM aluno;
