--------------------------
--------Pojeto-SQL--------
--------------------------

CREATE TABLE Alunos (
	id_aluno SERIAL PRIMARY KEY,
	nome text,
	cpf varchar(14),
	idade numeric,
	endereço text,
	RA varchar(10)
);

CREATE TABLE Telefone(
	id_telfone SERIAL PRIMARY KEY,
	id_aluno int,
	CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
	telefone varchar(10)
);

CREATE TABLE Email(
	id_email SERIAL PRIMARY KEY,
	id_aluno int,
	CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
	email varchar(50)
);

CREATE TABLE Departamento(
	id_departamento SERIAL PRIMARY KEY,
	area_atuacao text
);

CREATE TABLE Cursos(
	id_curso SERIAL PRIMARY KEY,
	id_departamento int,
	CONSTRAINT fk_departamento FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento),
	cursos text
);

CREATE TABLE Grade(
	id_grade SERIAL PRIMARY KEY,
	id_curso int,
	CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso),
	disciplina text
);

CREATE TABLE Matrícula(
	id_matricula SERIAL PRIMARY KEY,
	id_aluno int,
	id_curso int,
	CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
	CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso),
	status text
);

CREATE TABLE Aluno_Grade(
	id_AG SERIAL PRIMARY KEY,
	id_aluno int,
	id_grade int,
	CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
	CONSTRAINT fk_grade FOREIGN KEY (id_grade) REFERENCES Grade (id_grade)
);

INSERT INTO Alunos (id_aluno,nome,cpf,idade,endereço,RA) VALUES
(1,'Rodrigo Junior','000.000.000-00',16,'Rua 00, 000, Bairro 1','2023000001'),
(2,'João Silva','111.111.111-11',15,'Rua 01, 100, Bairro 2','2023000002'),
(3,'Maria Gomez','222.222.222-22',16,'Rua 02, 200, Bairro 3','2023000003'),
(4,'José Andrade','333.333.333-33',17,'Rua 03, 300, Bairro 4','2023000004'),
(5,'Bruno Silveira','444.444.444-44',17,'Rua 04, 400, Bairro 5','2023000005'),
(6,'Ana Cabral','555.555.555-55',16,'Rua 05, 500, Bairro 6','2023000006'),
(7,'Lucia Silva','666.666.666-66',15,'Rua 06, 600, Bairro 7','2023000007'),
(8,'Antonio Mange','777.777.777-77',15,'Rua 07, 700, Bairro 8','2023000008'),
(9,'Nicolas Silva','888.888.888-88',16,'Rua 08, 800, Bairro 9','2023000009'),
(10,'Sandra Fourlan','999.999.999-99',17,'Rua 09, 900, Bairro 0','2023000000');

INSERT INTO Telefone (id_aluno,telefone) VALUES
(1,'98765-4321'),
(2,'97654-3210'),
(3,'96543-2109'),
(4,'95432-1098'),
(5,'94321-0987'),
(6,'93210-9876'),
(7,'92109-8765'),
(8,'91098-7654'),
(9,'90987-6543'),
(10,'90876-5432');

INSERT INTO Email (id_aluno,email) VALUES
(1,'contato@exemplo.com'),
(2,'usuario@provedor.com'),
(3,'nome.sobrenome@email.com'),
(4,'fulano.sicrano@email.com'),
(5,'seuemail@email.com'),
(6,'email@email.com'),
(7,'meuemail@email.com'),
(8,'seunome@email.com'),
(9,'email@email.com'),
(10,'contato@email.com.br');

INSERT INTO Departamento (id_departamento,area_atuacao) VALUES
(1,'Saúde'),
(2,'Tecnologia'),
(3,'Engenharia'),
(4,'Humanas');
 
INSERT INTO Cursos (id_departamento,id_curso,cursos) VALUES
(1,1,'Enfermagem'),
(1,2,'Psicologia'),
(1,3,'Fisioterapia'),
(2,4,'ADS'),
(2,5,'Ciência de dados'),
(2,6,'Jogos Digitais'),
(3,7,'Engenharia Elétrica'),
(3,8,'Engenharia Mecânica'),
(3,9,'Engenharia Mecatrônica'),
(4,10,'Direito'),
(4,11,'Design'),
(4,12,'Administração');

INSERT INTO Grade (id_grade,id_curso,disciplina) VALUES
(1,1,'Anatomia e Fisiologia Humana'),
(2,3,'Farmacologia'),
(3,2,'Saúde Pública'),
(4,6,'Programação'),
(5,5,'Redes de Computadores'),
(6,4,'Segurança da Informação'),
(7,8,'Mecânica dos Fluidos'),
(8,9,'Engenharia de Materiais'),
(9,7,'Engenharia de Controle'),
(10,11,'Computação Gráfica Aplicada ao Design'),
(11,12,'Logística'),
(12,10,'Artigos e Leis');

INSERT INTO Matrícula (id_aluno,id_curso,status) VALUES
(1,2,'Desistente'),
(2,4,'Ativo'),
(3,5,'Desistente'),
(4,2,'Formado'),
(5,1,'Formado'),
(6,4,'Ativo'),
(7,8,'Desistente'),
(8,11,'Ativo'),
(9,12,'Ativo'),
(10,7,'Formado');

INSERT INTO Aluno_Grade (id_aluno,id_grade) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);




-------------------------------------------------
-------------------------------------------------
-------------------------------------------------

DELETE FROM Grade

--1--
--Só não mostra o curso e a disciplina

SELECT nome,cpf,idade,endereço,ra,telefone,email,status FROM Alunos 
INNER JOIN Telefone USING (id_aluno) INNER JOIN Email USING (id_aluno) 
INNER JOIN Matrícula USING (id_aluno)
WHERE ra = '2023000001' OR nome = 'Rodrigo Junior'

--2--

SELECT Cursos FROM Departamento INNER JOIN Cursos USING (id_departamento)
WHERE id_departamento = 2

--3--

SELECT disciplina FROM Cursos INNER JOIN Grade USING (id_curso)
WHERE cursos = 'Jogos Digitais'

--4--
--Não consegui fazer.

--5--
--Não consegui fazer.

--6--
--Não consegui fazer.

--7--
SELECT nome FROM Alunos INNER JOIN Matrícula USING (id_aluno)
WHERE status = 'Formado'

--8--
SELECT nome FROM Alunos INNER JOIN Matrícula USING (id_aluno)
WHERE status = 'Ativo'

--9--
--Não consegui fazer.

--10--
--Não consegui fazer.