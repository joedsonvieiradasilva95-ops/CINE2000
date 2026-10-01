-- CINE 2000 | CONSULTAS DE NEGÓCIO
-- Consultas iniciais sem JOINs.

-- 01. Quantos filmes existem?
SELECT COUNT(*) AS total_filmes FROM filmes;

-- 02. Quantos clientes estão ativos?
SELECT COUNT(*) AS clientes_ativos
FROM clientes
WHERE ativo = TRUE;

-- 03. Quantos exemplares existem por situação?
SELECT situacao, COUNT(*) AS total
FROM exemplares
GROUP BY situacao;

-- 04. Quantos filmes existem por categoria?
SELECT id_categoria, COUNT(*) AS total
FROM filmes
GROUP BY id_categoria;

-- 05. Quais filmes são da década de 2000?
SELECT titulo, ano_lancamento
FROM filmes
WHERE ano_lancamento BETWEEN 2000 AND 2000
ORDER BY titulo;

-- 06. Quais filmes são anteriores a 1990?
SELECT titulo, ano_lancamento
FROM filmes
WHERE ano_lancamento < 1990
ORDER BY ano_lancamento;

-- 07. Quais clientes estão inativos?
SELECT id_cliente, nome, email
FROM clientes
WHERE ativo = FALSE
ORDER BY nome;

-- 08. Quantos exemplares são VHS?
SELECT COUNT(*) AS total_vhs
FROM exemplares
WHERE tipo_midia = 'VHS';

-- 09. Quantos exemplares são DVD?
SELECT COUNT(*) AS total_dvd
FROM exemplares
WHERE tipo_midia = 'DVD';

-- 10. Quais filmes têm duração acima de 120 minutos?
SELECT titulo, duracao
FROM filmes
WHERE duracao > 120
ORDER BY duracao DESC;

-- 11. Quais filmes começam com "O"?
SELECT titulo
FROM filmes
WHERE titulo ILIKE 'O%'
ORDER BY titulo;

-- 12. Quantos clientes foram cadastrados por ano?
SELECT EXTRACT(YEAR FROM data_cadastro) AS ano, COUNT(*) AS total
FROM clientes
GROUP BY EXTRACT(YEAR FROM data_cadastro)
ORDER BY ano;
