# CINE 2000 — Configuração do Supabase

## 1. Criar projeto
No Supabase, crie um novo projeto PostgreSQL.

## 2. Criar as tabelas
Abra o **SQL Editor** e execute:

1. `sql/schema_supabase.sql`
2. `sql/seed_supabase.sql`

## 3. Conferir
O banco deverá conter:
- categorias
- clientes
- filmes
- exemplares
- locacoes
- item_locacao

A carga inicial contém 174 filmes, 80 clientes fictícios e 160 exemplares fictícios.

## 4. Segurança
Depois da carga, execute `sql/rls_supabase.sql`.

## 5. Conexão do site
Copie `js/supabase-config.example.js` para `js/supabase-config.js` e coloque a URL e a chave pública do projeto.

**Nunca coloque a `service_role` key no JavaScript do navegador.**
