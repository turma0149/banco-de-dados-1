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
	VALUES ('Caderno','Papelaria','50.00','2');

-- ---------------------------------------------------

CREATE DATABASE ex04_escola;
USE ex04_escola;

CREATE TABLE curso(
	id_curso     INT   AUTO_INCREMENT    PRIMARY KEY, 
    nome         VARCHAR (100),
    categoria    VARCHAR (50)
);

CREATE TABLE aluno(
	id_aluno    INT   AUTO_INCREMENT  PRIMARY KEY,
    nome        VARCHAR (100),
    email       VARCHAR(100),
    data_nasc   DATE,
    id_curso    INT,
    FOREIGN KEY (id_curso) REFERENCES curso (id_aluno)
);
    
INSERT INTO curso(nome,categoria) 
	VALUES('ADS', 'Tecnologia');
    
INSERT INTO curso(nome,categoria)
   VALUES('Medicina', 'Saúde');
    
SELECT * FROM curso;

 INSERT INTO aluno(nome,email,data_nasc,id_curso)
	VALUES ('Maria Silva', 'ms@email.com','1984/11/25','1');
    
INSERT INTO aluno(nome,email,data_nasc,id_curso)
	VALUES ('João Ferreira', 'jf@email.com','2005/02/22','1');
    
SELECT * FROM ALUNO;

    
-- ---------------------------------------------------

CREATE DATABASE ex05_faculdade;
USE ex05_faculdade;

CREATE TABLE professor(
	id_professor      INT   AUTO_INCREMENT    PRIMARY KEY, 
    nome              VARCHAR(100),
    especialidade     VARCHAR(80)
);

CREATE TABLE curso(
	id_curso    	  INT   AUTO_INCREMENT  PRIMARY KEY,
    nome  		      VARCHAR(100),
    carga_horaria     INT,
    id_professor      INT,
    FOREIGN KEY (id_professor) REFERENCES professor (id_professor)
);

CREATE TABLE aluno(
	id_aluno    INT   AUTO_INCREMENT  PRIMARY KEY,
	nome              VARCHAR(100),
    email             VARCHAR(80),
    id_curso          INT,
    FOREIGN KEY (id_curso) REFERENCES curso (id_curso)
);

    
INSERT INTO professor(nome,especialidade) 
	VALUES('Aristóteles', 'Tecnologia');
    
INSERT INTO professor(nome,especialidade) 
	VALUES('Reinaldo', 'Teologia');
    

SELECT * FROM professor;

INSERT INTO curso (nome,carga_horaria)
	VALUES('ADS', '180');
    
INSERT INTO curso(nome,carga_horaria)
   VALUES('Medicina', '260');   


SELECT * FROM curso;







    
