-- CINE 2000 | RLS SUPABASE
-- Execute depois de criar e carregar as tabelas.
-- Primeiro habilitamos RLS. A política de leitura pública será usada para catálogo.
-- Operações de escrita do cliente serão configuradas na próxima etapa, com atenção à segurança.

ALTER TABLE categorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;
ALTER TABLE filmes ENABLE ROW LEVEL SECURITY;
ALTER TABLE exemplares ENABLE ROW LEVEL SECURITY;
ALTER TABLE locacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE item_locacao ENABLE ROW LEVEL SECURITY;

CREATE POLICY "catalogo_categorias_leitura"
ON categorias FOR SELECT
TO anon
USING (true);

CREATE POLICY "catalogo_filmes_leitura"
ON filmes FOR SELECT
TO anon
USING (true);

CREATE POLICY "catalogo_exemplares_leitura"
ON exemplares FOR SELECT
TO anon
USING (true);
