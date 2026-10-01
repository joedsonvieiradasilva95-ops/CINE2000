-- CINE 2000 | SUPABASE / POSTGRESQL
-- Execute este arquivo no SQL Editor do Supabase.
-- Projeto acadêmico: sem JOIN, VIEW, FUNCTION ou TRIGGER.

CREATE TABLE IF NOT EXISTS categorias (
    id_categoria BIGSERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente BIGSERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS filmes (
    id_filme BIGSERIAL PRIMARY KEY,
    titulo VARCHAR(180) NOT NULL,
    ano_lancamento INTEGER NOT NULL CHECK (ano_lancamento <= 2000),
    duracao INTEGER,
    classificacao VARCHAR(20),
    id_categoria BIGINT NOT NULL REFERENCES categorias(id_categoria)
);

CREATE TABLE IF NOT EXISTS exemplares (
    id_exemplar BIGSERIAL PRIMARY KEY,
    id_filme BIGINT NOT NULL REFERENCES filmes(id_filme),
    codigo_exemplar VARCHAR(30) NOT NULL UNIQUE,
    tipo_midia VARCHAR(10) NOT NULL CHECK (tipo_midia IN ('VHS','DVD')),
    situacao VARCHAR(20) NOT NULL DEFAULT 'DISPONIVEL'
);

CREATE TABLE IF NOT EXISTS locacoes (
    id_locacao BIGSERIAL PRIMARY KEY,
    id_cliente BIGINT NOT NULL REFERENCES clientes(id_cliente),
    data_locacao DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'ATIVA'
);

CREATE TABLE IF NOT EXISTS item_locacao (
    id_item_locacao BIGSERIAL PRIMARY KEY,
    id_locacao BIGINT NOT NULL REFERENCES locacoes(id_locacao),
    id_exemplar BIGINT NOT NULL REFERENCES exemplares(id_exemplar),
    UNIQUE (id_locacao, id_exemplar)
);
