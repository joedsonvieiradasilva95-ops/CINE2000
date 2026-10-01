// Próxima etapa: substituir a origem local JSON pelo Supabase.
// Este arquivo é um modelo para o código que vamos ativar depois de você
// criar o projeto Supabase e fornecer a URL + chave pública.

async function carregarFilmesDoSupabase() {
  const { data, error } = await supabaseClient
    .from('filmes')
    .select('id_filme, titulo, ano_lancamento, duracao, classificacao, id_categoria')
    .order('titulo');

  if (error) throw error;
  return data;
}

async function cadastrarClienteNoSupabase(cliente) {
  const { data, error } = await supabaseClient
    .from('clientes')
    .insert([cliente])
    .select();

  if (error) throw error;
  return data;
}
