CREATE DATABASE ex01_filmes;

USE ex01_filmes;

CREATE TABLE filme(
	id_filme   INT AUTO_INCREMENT  PRIMARY KEY,
    titulo     VARCHAR(100),
    genero     VARCHAR(50),
    ano        VARCHAR(4),
    visto      BOOLEAN 
);

INSERT INTO filme (titulo,genero,ano,visto) 
	VALUES('Titanic', 'Drama', '1997', '0');

INSERT INTO filme (titulo,genero,ano,visto)
	VALUES('A lagoa azul', 'Drama', '1898', '1');
    
SELECT * FROM filme;

    
-- ------------------------------------------------ 

CREATE DATABASE ex02_jogos;

USE ex02_jogos; 

CREATE TABLE jogo(
	id_jogo      INT  AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(100),
    plataforma   VARCHAR(50),
    genero       VARCHAR(50),
    preco        DECIMAL(4,2) -- Exemplo: R$ 1234.00
);

INSERT INTO jogo (nome,plataforma,genero,preco) 
	VALUES ('Uncharted 4', 'Playstation', 'Ação', '70.00');
    
INSERT INTO jogo (nome,plataforma,genero,preco) 
	VALUES ('Redemption', 'Playstation', 'Ação', '218.00');

SELECT * FROM jogo;
-- ---------------------------------------------------

CREATE DATABASE ex03_produtos;

USE ex03_produtos;

CREATE TABLE produto(
	id_produto   INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(100), 
    categoria    VARCHAR(50),
    preco        DECIMAL(6,2), -- Exemplo: R$ 123456.00
    quantidade   INT 
);

INSERT INTO produto (nome,categoria,preco,quantidade)
	VALUES ('Bacon','Alimento','5.00','200');
    
INSERT INTO produto (nome,categoria,preco,quantidade)
	VALUES ('Caderno','Papelaria','50.00','2')

