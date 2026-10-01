-- Dados fictícios iniciais do CINE 2000
INSERT INTO categorias(nome,descricao) VALUES
('Ação','Filmes de ação'),('Comédia','Filmes de comédia'),
('Drama','Filmes dramáticos'),('Ficção','Ficção científica e fantasia'),
('Terror','Filmes de terror');

INSERT INTO clientes(nome,email,telefone,data_cadastro,ativo) VALUES
('Carlos Mendes','carlos.mendes@example.com','(31) 90000-0001','2002-03-10',TRUE),
('Marina Alves','marina.alves@example.com','(31) 90000-0002','2002-04-18',TRUE),
('Rafael Souza','rafael.souza@example.com','(31) 90000-0003','2003-01-22',TRUE);