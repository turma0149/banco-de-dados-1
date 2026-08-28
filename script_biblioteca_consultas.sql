-- ============================================================
-- PROJETO: BIBLIOTECA SENAC
-- BANCO DE DADOS: MySQL
-- ============================================================


-- ============================================================
-- CRIAÇÃO E USO DO BANCO DE DADOS
-- ============================================================

CREATE DATABASE biblioteca;
USE biblioteca;

-- ============================================================
-- CRIAÇÃO DAS TABELAS
-- ============================================================

CREATE TABLE tipo_usuario (
    id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE armario (
    id_armario INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE espaco (
    id_espaco INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INT NOT NULL,
    localizacao VARCHAR(150),
    status VARCHAR(20) NOT NULL
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    senha VARCHAR(14) NOT NULL,
    telefone VARCHAR(20),
    id_tipo_usuario INT NOT NULL,
    id_armario INT UNIQUE,

    FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario),
    FOREIGN KEY (id_armario) REFERENCES armario(id_armario)
);

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(200) NOT NULL,
    ano_publicacao INT,
    id_categoria INT NOT NULL,
    id_editora INT NOT NULL,

    FOREIGN KEY (id_categoria) 
        REFERENCES categoria(id_categoria),

    FOREIGN KEY (id_editora)  
        REFERENCES editora(id_editora)
);


CREATE TABLE livro_autor (
    id_livro_autor INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,

    FOREIGN KEY (id_livro) 
        REFERENCES livro(id_livro),

    FOREIGN KEY (id_autor) 
        REFERENCES autor(id_autor)
);


CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(30) NOT NULL,

    FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id_usuario),

    FOREIGN KEY (id_livro) 
        REFERENCES livro(id_livro)
);


CREATE TABLE reserva_livro (
    id_reserva_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_reserva DATE NOT NULL,
    status VARCHAR(30) NOT NULL,

    FOREIGN KEY (id_usuario)  
        REFERENCES usuario(id_usuario),

    FOREIGN KEY (id_livro) 
        REFERENCES livro(id_livro)
);


CREATE TABLE reserva_espaco (
    id_reserva_espaco INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_espaco INT NOT NULL,
    data_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    status VARCHAR(30) NOT NULL,

    FOREIGN KEY (id_usuario)  
        REFERENCES usuario(id_usuario),

    FOREIGN KEY (id_espaco)  
        REFERENCES espaco(id_espaco)
);



-- ============================================================
-- REGISTROS PARA CADA TABELA
-- ============================================================

INSERT INTO tipo_usuario (descricao) VALUES
('Aluno'),
('Professor'),
('Funcionário'),
('Pesquisador'),
('Comunidade Externa');


INSERT INTO armario (numero, status) VALUES
('A01', 'Ocupado'),
('A02', 'Ocupado'),
('A03', 'Ocupado'),
('A04', 'Disponível'),
('A05', 'Disponível');


INSERT INTO categoria (nome) VALUES
('Ficção'),
('Tecnologia'),
('Administração'),
('Banco de Dados'),
('Literatura Brasileira');


INSERT INTO editora (nome) VALUES
('Saraiva'),
('Novatec'),
('Alta Books'),
('Companhia das Letras'),
('Pearson');


INSERT INTO autor (nome) VALUES
('Machado de Assis'),
('Robert C. Martin'),
('Eric Freeman'),
('Elmasri Ramez'),
('Clarice Lispector');


INSERT INTO espaco 
(nome, capacidade, localizacao, status) VALUES
('Sala de Estudos 1', 6, '1º andar', 'Disponível'),
('Sala de Estudos 2', 8, '1º andar', 'Disponível'),
('Sala Multimídia', 20, '2º andar', 'Disponível'),
('Sala de Reuniões', 10, '2º andar', 'Ocupado'),
('Laboratório de Pesquisa', 15, '3º andar', 'Disponível');

INSERT INTO usuario
(nome, email, senha, telefone, id_tipo_usuario, id_armario) VALUES
('João Silva', 'joao.silva@email.com', '123456', '31999990001', 1, 1),
('Maria Souza', 'maria.souza@email.com', '123456', '31999990002', 2, 2),
('Carlos Oliveira', 'carlos.oliveira@email.com', '123456', '31999990003', 3, 3),
('Ana Santos', 'ana.santos@email.com', '123456', '31999990004', 1, 5),
('Pedro Almeida', 'pedro.almeida@email.com', '123456', '31999990005', 4, 4);


INSERT INTO livro 
(isbn, titulo, ano_publicacao, id_categoria, id_editora) VALUES
('9788535910663', 'Dom Casmurro', 1899, 5, 4),
('9788576082675', 'Código Limpo', 2009, 2, 3),
('9788576080869', 'Use a Cabeça! Padrões de Projetos', 2007, 2, 2),
('9788579360855', 'Sistemas de Banco de Dados', 2011, 4, 5),
('9788532508126', 'A Hora da Estrela', 1977, 5, 4);


INSERT INTO livro_autor 
(id_livro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO emprestimo
(id_usuario, id_livro, data_emprestimo, data_prevista_devolucao, data_devolucao, status) VALUES
(1, 1, '2026-08-01', '2026-08-08', '2026-08-07', 'Devolvido'),
(2, 2, '2026-08-05', '2026-08-12', '2026-08-12', 'Devolvido'),
(3, 3, '2026-08-10', '2026-08-17', NULL, 'Atrasado'),
(4, 4, '2026-08-15', '2026-08-29', NULL, 'Emprestado'),
(5, 5, '2026-08-20', '2026-09-03', NULL, 'Emprestado');


INSERT INTO reserva_livro
(id_usuario, id_livro, data_reserva, status) VALUES 
(1, 3, '2026-08-18', 'Ativa'),
(2, 4, '2026-08-19', 'Ativa'),
(3, 5, '2026-08-20', 'Atendida'),
(4, 2, '2026-08-21', 'Cancelada'),
(5, 1, '2026-08-22', 'Ativa');


INSERT INTO reserva_espaco
(id_usuario, id_espaco, data_reserva, hora_inicio, hora_fim, status) VALUES
(1, 1, '2026-08-26', '09:00:00', '10:00:00', 'Confirmada'),
(2, 2, '2026-08-26', '10:00:00', '11:30:00', 'Confirmada'),
(3, 3, '2026-08-27', '14:00:00', '16:00:00', 'Confirmada'),
(4, 4, '2026-08-28', '18:00:00', '19:00:00', 'Confirmada'),
(5, 5, '2026-08-29', '08:00:00', '10:00:00', 'Pendente');



-- ============================================================
-- CONSULTAS PARA TESTAR O BANCO
-- ============================================================

SELECT * FROM tipo_usuario;
SELECT * FROM armario;
SELECT * FROM categoria;
SELECT * FROM editora;
SELECT * FROM autor;
SELECT * FROM espaco;
SELECT * FROM usuario;
SELECT * FROM livro;
SELECT * FROM livro_autor;
SELECT * FROM emprestimo;
SELECT * FROM reserva_livro;
SELECT * FROM reserva_espaco;

-- Exercício da biblioteca 
-- 1) Faça uma consulta que exiba todos os dados de todos os livros cadastrados na tabela livro.
SELECT * FROM livro; 

-- 2) Faça uma consulta que exiba apenas o título, ISBN e ano de publicação dos livros.
SELECT titulo, ISBN, ano_publicacao FROM livro; 

-- 3) Faça uma consulta que mostre apenas os livros cujo ano de publicação 
-- seja maior que 2000.
SELECT titulo, ano_publicacao FROM livro
WHERE ano_publicacao > 2000;

-- 4) Faça uma consulta que mostre os livros publicados entre os anos de 2000 e 2020.
SELECT titulo, ano_publicacao FROM livro
WHERE ano_publicacao >= 2000 AND ano_publicacao <=2020;

-- 5) Faça uma consulta que localize todos os usuários cujo nome comece com a letra "M".
SELECT * FROM usuario
WHERE nome LIKE 'M%';

-- 6) Faça uma consulta que exiba os usuários cujo tipo de usuário seja 1 ou 2, 
-- utilizando o operador IN.
SELECT * FROM usuario 
WHERE id_tipo_usuario IN (1,2);
       
-- 7) Faça uma consulta que mostre todos os empréstimos que ainda não possuem
-- data de devolução registrada.
SELECT * FROM emprestimo
WHERE data_devolucao IS NULL;

-- 8) Faça uma consulta que exiba todos os livros cadastrados, 
-- ordenando pelo título em ordem alfabética crescente.
SELECT * FROM livro
ORDER BY titulo ASC;

-- 9) Faça uma consulta que mostre somente os 3 primeiros livros 
-- cadastrados no banco de dados.
SELECT * FROM livro
LIMIT 3;


-- 10) Faça uma consulta que informe a quantidade de livros existentes 
-- em cada categoria, utilizando COUNT() e GROUP BY.
SELECT livro.id_categoria, categoria.nome, COUNT(*) AS quantidade_livros
FROM livro INNER JOIN categoria 
	 ON (livro.id_categoria = categoria.id_categoria)
GROUP BY livro.id_categoria;

-- 11) Faça uma consulta utilizando INNER JOIN entre as 
-- tabelas livro e categoria que apresente o título do livro
-- e o nome de sua categoria.
SELECT *
FROM livro INNER JOIN categoria 
    ON (livro.id_categoria = categoria.id_categoria);
    
-- 12) Faça uma consulta utilizando INNER JOIN entre as tabelas 
-- livro e editora que apresente o título do livro, 
-- o ano de publicação e o nome da editora.
SELECT livro.titulo, livro.ano_publicacao, editora.nome AS 'editora'
FROM livro INNER JOIN editora 
    ON (livro.id_editora = editora.id_editora);

-- 13) Faça uma consulta utilizando INNER JOIN entre as tabelas 
-- emprestimo e usuario que apresente o nome do usuário, a data do empréstimo, 
-- a data prevista de devolução e o status do empréstimo.
SELECT u.nome, e.data_emprestimo, e.data_prevista_devolucao, e.status
FROM emprestimo AS e INNER JOIN usuario as u
    ON (e.id_usuario = u.id_usuario);

-- 14) Faça uma consulta utilizando INNER JOIN entre as
--  tabelas reserva_espaco e espaco que apresente o nome do espaço,
-- a data da reserva, a hora de início, a hora de fim e o status da reserva.
SELECT e.nome, r.data_reserva,r.hora_inicio,r.hora_fim,r.status
FROM reserva_espaco  AS r INNER JOIN espaco as e
    ON (r.id_espaco = e.id_espaco);

