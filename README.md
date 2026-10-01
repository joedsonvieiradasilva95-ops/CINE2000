# 🎬 CINE 2000

Projeto Integrador — Banco de Dados.

## Sistema
Locadora fictícia de filmes ambientada nos anos 2000.

## Estado atual
- Catálogo: **174 filmes**
- Clientes fictícios: **80**
- Exemplares: **160**
- PostgreSQL/Supabase: scripts preparados
- SQL: consultas de negócio preparadas
- Site: catálogo, filtros e cadastro de cliente

## Estrutura
- `index.html` — interface
- `css/` — visual
- `js/` — comportamento e futura integração Supabase
- `data/` — dados locais de demonstração
- `sql/schema_supabase.sql` — criação das tabelas
- `sql/seed_supabase.sql` — carga inicial
- `sql/queries.sql` — consultas
- `sql/rls_supabase.sql` — políticas de leitura
- `docs/SUPABASE.md` — guia de configuração

## Próximo passo
Criar o projeto no Supabase e executar os scripts SQL. Depois conectar o catálogo e o formulário de clientes ao PostgreSQL.
## Dados disponíveis no site
- 174 filmes fictícios/representados no catálogo
- 80 clientes fictícios
- 160 exemplares
- Busca e filtros por título, categoria e ano
- Consulta de clientes por nome/e-mail/telefone e status
- Paginação do catálogo e da lista de clientes
