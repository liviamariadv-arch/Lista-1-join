drop database db_escola_join;
CREATE DATABASE DB_ESCOLA_JOIN;
USE DB_ESCOLA_JOIN;

CREATE TABLE Alunos (
    cod INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (cod, nome, cidade) VALUES
(1, 'Carlos', 'Sorocaba'),
(2, 'Beatriz', 'Itu'),
(3, 'Lucas', 'Votorantim'),
(4, 'Livia', 'Sorocaba'),
(5, 'Lorena', 'Indaiatuba'),
(6, 'Clara', 'Rio de Jnaeiro'),
(7, 'Pedro', 'Praia Grande'),
(8, 'Isabel', 'Itu'),
(9, 'Luiz', 'Londrina'),
(10, 'Tais', 'Tatuape');

-- Criando a tabela Matriculas
CREATE TABLE Matriculas (
    cod INT PRIMARY KEY,
    valor DECIMAL(10, 2),
    data DATE,
    cod_aluno INT,
    FOREIGN KEY (cod_aluno) REFERENCES Alunos(cod)
);

-- Inserindo dados na tabela Matriculas
INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(1, 180.00, '2023-10-10', 1),
(2, 250.00, '2023-10-11', 2),
(3, 400.00, '2023-10-12', 1),
(4, 200.00, '2023-10-13',3),
(5, 500.00, '2023-10-14', 4),
(6, 800.00, '2023-10-15', 5),
(7, 700.00, '2023-10-16', 6),
(8, 400.00, '2023-10-17', 7),
(9, 200.00, '2023-10-18', 8),
(10, 100.00, '2023-10-19', 9);

select
    alu.nome as nome_alunos,
    alu.cidade as cidade_alunos,
    mat.valor as valor_matricula
from alunos alu
inner join matriculas mat
    on alu.cod = mat.cod_aluno;
    
    select
     alu.nome as nome_alunos,
    alu.cidade as cidade_alunos,
    mat.valor as valor_matricula
	from alunos alu
	left join matriculas mat
    on alu.cod = mat.cod_aluno
    where mat.cod_aluno is null;
    
  select
     alu.nome as nome_alunos,
    alu.cidade as cidade_alunos,
    mat.valor as valor_matricula,
    mat.data as data_matricula
	from alunos alu
	left join matriculas mat
    on alu.cod = mat.cod_aluno
    where mat.cod_aluno is null
    order by alu.cod, mat.cod;
    
	select
    alu.nome as nome_aluno,
    mat.valor as valor_matricula
from alunos as alu
inner join matriculas as mat
    on alu.cod = mat.cod_aluno
where mat.valor > 200;

	select
alu.nome as nome_aluno,
    mat.valor as valor_matricula
from alunos as alu
inner join matriculas as mat
    on alu.cod = mat.cod_aluno;

select
    alu.nome as nome_aluno,
    mat.data as data_matricula,
    mat.valor as valor_matricula
from alunos as alu
inner join matriculas as mat
    on alu.cod = mat.cod_aluno
where mat.data >= '2023-10-01'
  and mat.data < '2023-11-01'
order by mat.data;


