-- CONSULTAS (RELATÓRIOS)

CREATE DATABASE ex06_consultas;
USE ex06_consultas;

CREATE TABLE produto(
	id_produto   INT  AUTO_INCREMENT  PRIMARY KEY, 
    nome         VARCHAR(50),
    qtd_estoque  INT,
    valor        DECIMAL(9,2)
);

CREATE TABLE pedido (
	id_pedido   INT  AUTO_INCREMENT  PRIMARY KEY, 
    id_produto  INT,
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

INSERT INTO produto(nome, qtd_estoque,valor) 
	VALUE ('pirulitinho', '100','2.50'); 

INSERT INTO produto(nome, qtd_estoque,valor) 
	VALUE ('chocolatinho', '50','6.50');

INSERT INTO produto(nome, qtd_estoque,valor) 
	VALUE ('salgadinho', '20','10.50');
    
INSERT INTO produto(nome, qtd_estoque,valor) 
	VALUE ('danoninho', '35','12.50');

INSERT INTO produto(nome, qtd_estoque,valor) 
	VALUE ('revistinha', '10','15.50');
    
INSERT INTO PEDIDO (id_produto) VALUES ('5');
INSERT INTO PEDIDO (id_produto) VALUES ('4');
INSERT INTO PEDIDO (id_produto) VALUES ('2');
INSERT INTO PEDIDO (id_produto) VALUES ('3');

 -- Mostrar todas as colunas e todos os dados
SELECT * FROM PEDIDO;
 
 
 -- Mostrar todas as colunas e todos os dados
SELECT * FROM produto;

-- Mostrar algumas colunas 
SELECT nome,valor FROM produto;

-- Criar apelidos (alias)
 SELECT nome AS 'produto', valor FROM produto;
 
 -- Filtros  (>, <, >=, <=, <>)
 SELECT nome, qtd_estoque FROM produto
 WHERE qtd_estoque > 50;
 
 SELECT nome, qtd_estoque FROM produto
 WHERE qtd_estoque <= 50;
 
 SELECT nome, qtd_estoque FROM produto
 WHERE valor <= '3.00';
 
 SELECT nome, qtd_estoque FROM produto
 WHERE valor <> '2.50';
 
 -- FILTROS PODEM USAR AND e OR 
 SELECT nome, qtd_estoque FROM produto
 WHERE qtd_estoque > 30 AND qtd_estoque <= 50;
 
 SELECT nome, qtd_estoque, valor FROM produto
 WHERE qtd_estoque > 20 AND valor < 12.50; 
 
 SELECT nome, qtd_estoque, valor FROM produto
 WHERE qtd_estoque > 20 OR valor < 12.50; 
 
 -- Filtrar textos 
SELECT * FROM produto
WHERE nome = 'salgadinho'; -- exatamente igual

SELECT * FROM produto
WHERE nome LIKE 'salgadinho'; -- exatamente igual

SELECT * FROM produto
WHERE nome LIKE '%a'; -- termina com o nha
 
SELECT * FROM produto
WHERE nome LIKE 'cho%'; -- começa com cho

SELECT * FROM produto
WHERE nome LIKE '%no%'; -- não interessa a posição início ou fim
 
-- FUNÇÕES 
SELECT COUNT(*) FROM produto
WHERE valor < 5.00;

SELECT AVG(valor) FROM produto;
SELECT MAX(qtd_estoque) FROM produto;
SELECT MIN(qtd_estoque) FROM produto;
SELECT MIN(valor) FROM produto; 
 
-- ORDERNAR 
SELECT * FROM produto 
	WHERE qtd_estoque <= 50 
	ORDER BY nome ASC;

SELECT * FROM produto 
	WHERE qtd_estoque <= 50 
	ORDER BY nome DESC;


-- Unir tabelas para retornar dados de duas ou mais 
SELECT pr.nome, pr.valor
FROM produto AS pr INNER JOIN pedido AS pe
    on (pr.id_produto = pe.id_produto)
    
    
  
















