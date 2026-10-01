// CINE 2000 | CONFIGURAÇÃO DO SUPABASE
// NÃO coloque a chave service_role no navegador.
// Na próxima etapa, substitua os dois valores abaixo pelas credenciais
// públicas do seu projeto Supabase.

const SUPABASE_URL = "COLE_AQUI_A_URL_DO_SEU_PROJETO";
const SUPABASE_ANON_KEY = "COLE_AQUI_A_ANON_KEY";

const supabaseClient = window.supabase.createClient(
  SUPABASE_URL,
  SUPABASE_ANON_KEY
);
