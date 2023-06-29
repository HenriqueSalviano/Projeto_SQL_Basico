
-- Criando um banco de dados
CREATE DATABASE hashtag;

-- Selecionando o banco de dados que irei trabalhar
USE hashtag;

-- Criando uma tabela
CREATE TABLE Vendas (ID_venda INT,
    Curso VARCHAR(100),
    Aluno VARCHAR(100),
    Estado VARCHAR(100),
    Valor DECIMAL(10,2) );


-- Incluir dados na Tabela
INSERT INTO Vendas(ID_venda,Curso,Aluno,Estado,Valor)
VALUES
(1,'Excel','João','SP', 100), -- Linha 1
(2,'VBA','Lucas','RJ', 50), -- Linha 2
(3,'Excel','Pedro','PE', 100), -- Linha 3
(4,'VBA','Amanda','BA', 50), -- Linha 4
(5,'VBA','Amanda','BA', 50), -- Linha 5
(6,'Power BI','Rita','RS', 80), -- Linha 6
(7,'Excel','Julia','RJ', 100), -- Linha 7
(8,'Power BI','Caio','SP', 80), -- Linha 8
(9,'Power BI','Lara','MG', 80), -- Linha 9
(10,'Excel','Rogério','AC', 100); -- Linha 10

-- Selecionar todos os dados da tabela
SELECT * FROM `vendas`;

-- Selecionar 5 primeiras linhas da tabela
SELECT * FROM `vendas` LIMIT 5;

-- Selecionar apenas as colunas Alunos, Curso e Valor 
SELECT Aluno, Curso, Valor FROM Vendas;

-- Ordernar os dados de uma tabela em ordem crescente/alfabetica
 SELECT * FROM `vendas` ORDER BY Aluno; -- Na ordem alfabetica dos AlunoS
 SELECT * FROM `vendas` ORDER BY Estado; -- Na ordem alfabetica dos Estados
 SELECT * FROM `vendas` ORDER BY Curso; -- Na ordem alfabetica dos Cursos
 SELECT * FROM `vendas` ORDER BY Valor; -- Na ordem crescente dos Valores

-- Filtrar dados da tabela

SELECT * FROM vendas WHERE Estado = 'SP'; -- Apenas as linhas com Alunos de SP

SELECT * FROM vendas WHERE Valor > 50; -- Apenas as linhas com Valores maiores que 50


-- Altearar valores dentro da tabela
SELECT * FROM vendas; 

-- Mudar o curso do ID 1 para Power BI 
UPDATE Vendas SET Curso = 'Power BI'  WHERE ID_venda = 1

-- Mudar o valor para 110 de quem faz curso Power BI no estado de SP
UPDATE Vendas SET Valor = 110 WHERE Curso = 'Power BI' and Estado = 'SP'; 

-- Mudar o valor para 90 de quem faz curso VBA 
UPDATE Vendas SET Valor = 90  WHERE Curso = 'VBA'-- Mudar o curso do ID 8 para Excel





-- CONTAR COUNT

-- Conta o numero de ID_venda presente em cada Estado
SELECT Estado, COUNT(*) AS 'Quantidade de ID_venda' FROM vendas GROUP BY Estado;

-- Conta o numero de ID_venda presente em cada Curso
SELECT Curso, COUNT(*) AS 'Quantidade de ID_venda' FROM vendas GROUP BY Curso;


-- SOMA SUM

-- Soma todos as linhas da  coluna Valor
SELECT SUM(valor) AS 'Total' FROM vendas;

-- Soma dos valores dos cursos em cada estado
SELECT Estado, SUM(valor) AS 'Soma dos Valores'  FROM vendas GROUP BY Estado;

-- Soma dos valores dos cursos em cada Curso
SELECT Curso, SUM(valor) AS 'Soma dos Valores'  FROM vendas GROUP BY Curso;



-- Média AVG

-- Média de todas as linhas da coluna Valor
SELECT AVG(valor) AS 'Total' FROM vendas;

-- Média dos valores dos cursos em cada estado
SELECT Estado, AVG(valor) AS 'Média dos Valores'  FROM vendas GROUP BY Estado;

-- Média dos valores dos cursos em cada Curso
SELECT Curso, AVG(valor) AS 'Média dos Valores'  FROM vendas GROUP BY Curso;







-- Criando uma nova coluna
Alter table vendas add custo REAL;

-- GERAR VALORES ALEATORIOS

-- Atribuindo valores aleatorios a coluna custo  

-- RAND([ seed ]) gerar valores entre 0 e 1
-- CEILING retorna o menor valor inteiro que é maior ou igual a um número.
UPDATE Vendas SET custo = CEILING(RAND(10)*100);




-- OPERAÇÕES MATEMATICAS COM COLUNAS

Alter table vendas add teste REAL;
UPDATE Vendas SET teste = (Valor + custo); -- Somando colunas Valor e custo
UPDATE Vendas SET teste = (Valor - custo); -- Subtraindo colunas Valor e custo
UPDATE Vendas SET teste = (Valor * custo); -- Porduto das colunas Valor e custo

UPDATE Vendas SET teste = (Valor/custo); -- Divizão das colunas Valor e custo

UPDATE Vendas SET teste = Power(Valor,2) ; -- Eleva a coluna Valor ao quadrado

UPDATE Vendas SET teste = sqrt(Power(Valor - custo,2)); -- Subtraindo colunas Valor e custo em modulo

SELECT * FROM vendas;






-- Excluir 

DELETE FROM vendas WHERE ID_venda IS NULL; -- Exclui todas as linhas com ID_venda = NULL 

DELETE FROM vendas WHERE ID_venda = 9; -- Exclui linha ID_venda = 9

ALTER TABLE vendas DROP custo; -- Excluir coluna 

DROP TABLE vendas; -- Excluir tabela




