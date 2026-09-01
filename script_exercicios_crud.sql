USE biblioteca; 

-- SELECT * FROM tipo_usuario;
-- SELECT * FROM armario;
-- SELECT * FROM categoria;
-- SELECT * FROM editora;
-- SELECT * FROM autor;
-- SELECT * FROM espaco;
-- SELECT * FROM usuario;
-- SELECT * FROM livro;
-- SELECT * FROM livro_autor;
-- SELECT * FROM emprestimo;
-- SELECT * FROM reserva_livro;
-- SELECT * FROM reserva_espaco;


-- CREATE - INSERT - INSERIR NOVO REGISTRO (ESPACO)
INSERT INTO espaco (nome, capacidade, localizacao, status) VALUES
('Sala de Estudos 1', 6, '1º andar', 'Disponível');

INSERT INTO livro(isbn, titulo, ano_publicacao,id_categoria,id_editora)
	VALUES ('544531080869', 'Éramos Seis', '2026', '5', '4');

-- READ - SELECT - CONSULTAR REGISTROS JÁ CADASTRADOS 
SELECT * FROM livro
WHERE ano_publicacao > 2000 AND ano_publicacao < 2025;

-- UPDATE - UPDATE - EDITAR UM REGISTRO JÁ CADASTRADO 
UPDATE livro 
SET titulo = 'Codigo Limpo'
WHERE id_livro = '2';

-- DELETE - DELETE - EXCLUIR UM REGISTRO JÁ CADASTRADO
DELETE FROM livro 
WHERE id_livro = '6';


-- EXEMPLO DE INTEGRIDADE E SEGURANÇA 
DELETE FROM livro; 
-- Cuidado! Pode apagar tudo 

-- CRIAR NOVA COLUNA NO BANCO DE DADOS 
ALTER TABLE armario 
ADD COLUMN status_novo BOOLEAN;
 
SELECT * FROM armario 
WHERE status_novo = 0;

-- AO INVÉS DE USAR DELETE E PERDER OS DADOS DO ARMÁRIO 
-- USAREMOS DELEÇÃO LÓGICA - ATIVO INATIVO / 1 OU 0 / 
UPDATE armario 
SET status_novo = '1'
WHERE id_armario > '1';

-- exercicio: inative o usuario 'Ana Santos'
select id_usuario, nome, status from usuario;

UPDATE usuario 
SET status = '0'
WHERE id_usuario = 4;



-- ------------------------------------------
-- Exercícios de CRUD
-- ------------------------------------------

-- 1- Cadastre na tabela tipo_usuario um novo tipo com a descrição: ● Visitante
SELECT * FROM tipo_usuario;
INSERT INTO tipo_usuario (descricao) VALUES ('Visitante');

-- 2- Cadastre na tabela armario um novo armário com os seguintes dados:
-- Número: A06 e ● Status: Disponível
SELECT * FROM armario;
INSERT INTO armario (numero, status, status_novo) VALUES ('A06', 'Disponível','1');

-- 3- Cadastre na tabela categoria a seguinte categoria: Desenvolvimento Web
SELECT * FROM categoria;
INSERT INTO categoria(nome) VALUES ('Desenvolvimento Web');

-- 4- Cadastre na tabela editora a seguinte editora: ● Casa do Código
SELECT * FROM editora;
INSERT INTO editora (nome) VALUES ('Casa do Código');

-- 5- Cadastre na tabela autor o seguinte autor: ● Martin Fowler
SELECT * FROM autor;
INSERT INTO autor (nome) VALUES ('Martin Fowler');

-- 6- Cadastre na tabela espaco um novo espaço com os seguintes dados:
-- ● Nome: Sala de Estudos 3
-- ● Capacidade: 12
-- ● Localização: 2º andar
-- ● Status: Disponível

SELECT * FROM espaco;
INSERT INTO espaco (nome, capacidade, localizacao, status) VALUES ('Sala de Estudos 3', '12', '2º andar', 'Disponivel');

-- 7-Cadastre na tabela usuario um novo usuário com os seguintes dados:
-- ● Nome: Fernanda Lima
-- ● E-mail: fernanda.lima@email.com
-- ● Senha: 123456
-- ● Telefone: 31999990006
-- ● Tipo de usuário: utilize um id_tipo_usuario existente
-- ● Armário: nenhum

SELECT * FROM usuario;
INSERT INTO usuario (nome, email, senha, telefone, id_tipo_usuario, id_armario, status) 
	VALUES ('Fernanda Lima', 'fernanda.lima@email.com', '123456', '31999990006', '4',null,'1');


-- 8-Cadastre na tabela livro um novo livro com os seguintes dados:
-- ● ISBN: 9788550800653
-- ● Título: Engenharia de Software
-- ● Ano de publicação: 2019
-- ● Categoria: utilize um id_categoria existente
-- ● Editora: utilize um id_editora existente

SELECT * FROM livro;
INSERT INTO livro (isbn, titulo, ano_publicacao, id_categoria, id_editora) 
	VALUES ('9788550800653','Engenharia de Software','2019','3','1');	
    
    
-- 9 - Faça uma consulta que apresente todos os dados de todos os usuários cadastrados.
SELECT * FROM usuario;

-- 10 - Faça uma consulta que apresente somente as seguintes informações dos usuários:
-- ● nome;
-- ● e-mail;
-- ● telefone.

SELECT nome, email, telefone FROM usuario;

-- 11- Faça uma consulta que apresente somente o usuário cujo id_usuario seja igual a 3
SELECT * FROM usuario 
WHERE id_usuario = 3;

-- 12 - Faça uma consulta que apresente o livro cujo ISBN seja: 9788535910663
SELECT * FROM livro
WHERE ISBN = '9788535910663';

-- 13- Faça uma consulta que apresente todos os livros cujo id_categoria seja igual a 2.
SELECT * FROM livro
WHERE id_categoria = 2;

-- 14 - Faça uma consulta que apresente somente os empréstimos cujo status seja: Emprestado
SELECT * FROM livro;
SELECT * FROM emprestimo;

SELECT * 
FROM livro INNER JOIN emprestimo 
ON (livro.id_livro = emprestimo.id_livro)
WHERE emprestimo.status LIKE 'Emprestado' ;

-- 15- Faça uma consulta que apresente somente as reservas de livros cujo status seja:Ativa 
SELECT * 
FROM livro INNER JOIN reserva_livro 
ON (livro.id_livro = reserva_livro.id_livro)
WHERE reserva_livro.status LIKE 'Ativa';

-- 16 - Faça uma consulta que apresente somente os espaços cujo status seja: Disponível
SELECT * FROM espaco
WHERE status LIKE 'Disponivel';

-- 17 -  Altere o telefone do usuário cujo id_usuario seja igual a 1 para: 31988887777
SELECT * FROM usuario;

UPDATE usuario
SET telefone = '31988887777'
WHERE id_usuario = '1';

-- 18 Altere os seguintes dados do usuário cujo id_usuario seja igual a 2:
-- E-mail: maria.souza@biblioteca.com
-- Telefone: 31988886666
SELECT * FROM usuario;

UPDATE usuario
SET email = 'maria.souza@biblioteca.com',
    telefone = '31988886666'
WHERE id_usuario = 2;

-- 19 - Altere o status do armário cujo id_armario seja igual a 4 para: Ocupado
SELECT * FROM armario;

UPDATE armario
SET status = 'Ocupado'
WHERE id_armario = 4;

-- 20 - Altere o nome da categoria: Banco de Dados para: Banco de Dados e SQL
SELECT * FROM categoria;

UPDATE categoria
SET nome = 'Banco de Dados e SQL'
WHERE id_categoria = 'Banco de dados';

-- 21- Altere o espaço cujo id_espaco seja igual a 3. Novos dados:
-- Capacidade: 25
-- Status: Ocupado

SELECT * FROM espaco;

UPDATE espaco
SET capacidade = '25',
    status = 'Ocupado'
WHERE id_espaco = '3';

-- 22- O empréstimo cujo id_emprestimo seja igual a 4 foi devolvido. Atualize:
-- Data de devolução: 2026-08-27
-- Status: Devolvido

SELECT * FROM emprestimo;

UPDATE emprestimo
SET data_devolucao = '2026-08-27'
WHERE id_emprestimo = '4';


-- 23- Altere o status da reserva de livro cujo id_reserva_livro seja igual a 1 para: Cancelada

SELECT * FROM reserva_livro;

UPDATE reserva_livro
SET status = 'Cancelada'
WHERE id_reserva_livro = '1';

-- 24- Altere o status da reserva de espaço cujo id_reserva_espaco seja igual a 5 de: Pendente para: Confirmada

SELECT * FROM reserva_espaco;

UPDATE reserva_livro
SET status = 'Confirmada'
WHERE id_reserva_livro = '5';

-- 25 - Excluir uma categoria
SELECT * FROM categoria;
INSERT INTO categoria (nome) VALUES ('Categoria Teste');
DELETE FROM categoria WHERE id_categoria = 7;


-- 26- Excluir um autor
SELECT * FROM autor;
INSERT INTO autor (nome) VALUES ('Autor Teste');
DELETE FROM autor WHERE id_autor = 2;


-- 27- Excluir um espaço
SELECT * FROM espaco;
INSERT INTO espaco (nome, capacidade, localizacao, status)
VALUES ('Sala Temporária', 5, 'Térreo', 'Disponível');

DELETE FROM espaco WHERE id_espaco = 8;

-- 28- Excluir um tipo_usuario
SELECT * FROM tipo_usuario;
DELETE FROM tipo_usuario
WHERE id_tipo_usuario = 1;

-