-- CINE 2000 | Estrutura inicial
-- Sem JOINs, VIEWs, FUNCTIONs ou TRIGGERs.

CREATE TABLE categorias (
 id_categoria BIGSERIAL PRIMARY KEY,
 nome VARCHAR(80) NOT NULL UNIQUE,
 descricao VARCHAR(255)
);

CREATE TABLE clientes (
 id_cliente BIGSERIAL PRIMARY KEY,
 nome VARCHAR(120) NOT NULL,
 email VARCHAR(150) UNIQUE,
 telefone VARCHAR(20),
 data_cadastro DATE NOT NULL,
 ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE filmes (
 id_filme BIGSERIAL PRIMARY KEY,
 titulo VARCHAR(180) NOT NULL,
 ano_lancamento INTEGER NOT NULL,
 duracao INTEGER,
 classificacao VARCHAR(20),
 id_categoria BIGINT NOT NULL REFERENCES categorias(id_categoria)
);

CREATE TABLE exemplares (
 id_exemplar BIGSERIAL PRIMARY KEY,
 id_filme BIGINT NOT NULL REFERENCES filmes(id_filme),
 codigo_exemplar VARCHAR(30) NOT NULL UNIQUE,
 tipo_midia VARCHAR(10) NOT NULL,
 situacao VARCHAR(20) NOT NULL DEFAULT 'DISPONIVEL'
);

CREATE TABLE locacoes (
 id_locacao BIGSERIAL PRIMARY KEY,
 id_cliente BIGINT NOT NULL REFERENCES clientes(id_cliente),
 data_locacao DATE NOT NULL,
 data_prevista_devolucao DATE NOT NULL,
 data_devolucao DATE,
 status VARCHAR(20) NOT NULL DEFAULT 'ATIVA'
);

CREATE TABLE item_locacao (
 id_item_locacao BIGSERIAL PRIMARY KEY,
 id_locacao BIGINT NOT NULL REFERENCES locacoes(id_locacao),
 id_exemplar BIGINT NOT NULL REFERENCES exemplares(id_exemplar),
 UNIQUE (id_locacao,id_exemplar)
);