let DATA={filmes:[],clientes:[],exemplares:[]};
let moviePage=1, clientPage=1;
const MOVIES_PER_PAGE=24, CLIENTS_PER_PAGE=20;

const esc=s=>String(s).replace(/[&<>"']/g,m=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"}[m]));

async function loadData(){
  try{
    const r=await fetch("data/catalogo.json");
    DATA=await r.json();
    updateStats();
    fillFilters();
    renderMovies();
    renderClients();
  }catch(e){
    document.getElementById("movies").innerHTML="<p class='muted'>Não foi possível carregar o catálogo. Abra o projeto por um servidor local ou pelo GitHub Pages.</p>";
  }
}

function updateStats(){
  document.getElementById("movieCount").textContent=DATA.filmes.length;
  document.getElementById("clientCount").textContent=DATA.clientes.length;
  document.getElementById("clientDirectoryCount").textContent=DATA.clientes.length;
  document.getElementById("statMovies").textContent=DATA.filmes.length;
  document.getElementById("statCopies").textContent=DATA.exemplares.length;
  document.getElementById("statClients").textContent=DATA.clientes.length;
}

function fillFilters(){
  const c=[...new Set(DATA.filmes.map(x=>x.categoria))].sort();
  const y=[...new Set(DATA.filmes.map(x=>x.ano_lancamento))].sort((a,b)=>b-a);
  document.getElementById("category").innerHTML='<option value="">Todas as categorias</option>'+c.map(x=>`<option>${esc(x)}</option>`).join("");
  document.getElementById("year").innerHTML='<option value="">Todos os anos</option>'+y.map(x=>`<option>${x}</option>`).join("");
}

function getFilteredMovies(){
  const q=document.getElementById("search").value.toLowerCase().trim();
  const c=document.getElementById("category").value;
  const y=document.getElementById("year").value;
  return DATA.filmes.filter(m=>
    (!q||m.titulo.toLowerCase().includes(q)) &&
    (!c||m.categoria===c) &&
    (!y||String(m.ano_lancamento)===y)
  );
}

function renderMovies(){
  const list=getFilteredMovies();
  const totalPages=Math.max(1,Math.ceil(list.length/MOVIES_PER_PAGE));
  moviePage=Math.min(moviePage,totalPages);
  const start=(moviePage-1)*MOVIES_PER_PAGE;
  const page=list.slice(start,start+MOVIES_PER_PAGE);
  const co=["c1","c2","c3","c4"];
  document.getElementById("movies").innerHTML=page.map((m,i)=>`
    <article class="movie-card">
      <div class="cover ${co[i%4]}"><span>${esc(m.categoria).toUpperCase()}</span><b>${String(m.ano_lancamento).slice(-2)}</b></div>
      <div class="movie-info">
        <h3>${esc(m.titulo)}</h3>
        <p>${m.ano_lancamento} • ${m.duracao} min • ${esc(m.classificacao)}</p>
        <span class="tag">CATÁLOGO</span>
      </div>
    </article>`).join("");
  document.getElementById("empty").classList.toggle("hidden",list.length!==0);
  document.getElementById("moviePageInfo").textContent=`Página ${moviePage} de ${totalPages} • ${list.length} títulos`;
  document.getElementById("moviePrev").disabled=moviePage<=1;
  document.getElementById("movieNext").disabled=moviePage>=totalPages;
}

function getFilteredClients(){
  const q=document.getElementById("clientSearch").value.toLowerCase().trim();
  const status=document.getElementById("clientStatus").value;
  return DATA.clientes.filter(c=>
    (!q||c.nome.toLowerCase().includes(q)||c.email.toLowerCase().includes(q)||String(c.telefone).includes(q)) &&
    (!status||String(c.ativo)===status)
  );
}

function renderClients(){
  const list=getFilteredClients();
  const totalPages=Math.max(1,Math.ceil(list.length/CLIENTS_PER_PAGE));
  clientPage=Math.min(clientPage,totalPages);
  const start=(clientPage-1)*CLIENTS_PER_PAGE;
  const page=list.slice(start,start+CLIENTS_PER_PAGE);

  document.getElementById("clientsList").innerHTML=page.map(c=>`
    <article class="client-row">
      <div class="client-avatar">${esc(c.nome.split(" ").map(n=>n[0]).slice(0,2).join(""))}</div>
      <div class="client-main"><strong>${esc(c.nome)}</strong><span>${esc(c.email)}</span></div>
      <div class="client-meta"><span>${esc(c.telefone)}</span><small>${esc(c.data_cadastro)}</small></div>
      <span class="client-status ${c.ativo?"active":"inactive"}">${c.ativo?"ATIVO":"INATIVO"}</span>
    </article>`).join("");

  document.getElementById("clientPageInfo").textContent=`Página ${clientPage} de ${totalPages} • ${list.length} clientes`;
  document.getElementById("clientPrev").disabled=clientPage<=1;
  document.getElementById("clientNext").disabled=clientPage>=totalPages;
}

["search","category","year"].forEach(id=>document.getElementById(id).addEventListener("input",()=>{
  moviePage=1; renderMovies();
}));

document.getElementById("moviePrev").addEventListener("click",()=>{moviePage--;renderMovies();});
document.getElementById("movieNext").addEventListener("click",()=>{moviePage++;renderMovies();});

["clientSearch","clientStatus"].forEach(id=>document.getElementById(id).addEventListener("input",()=>{
  clientPage=1; renderClients();
}));

document.getElementById("clientPrev").addEventListener("click",()=>{clientPage--;renderClients();});
document.getElementById("clientNext").addEventListener("click",()=>{clientPage++;renderClients();});

document.getElementById("menu").addEventListener("click",()=>document.getElementById("nav").classList.toggle("open"));

document.getElementById("clientForm").addEventListener("submit",e=>{
  e.preventDefault();
  const n=document.getElementById("clientName").value.trim();
  const email=document.getElementById("clientEmail").value.trim();
  const phone=document.getElementById("clientPhone").value.trim();
  const date=document.getElementById("clientDate").value;
  if(DATA.clientes.some(c=>c.email.toLowerCase()===email.toLowerCase())){
    document.getElementById("formMessage").textContent="Este e-mail já está cadastrado.";
    return;
  }
  const nextId=Math.max(...DATA.clientes.map(c=>Number(c.id_cliente)),0)+1;
  DATA.clientes.push({id_cliente:nextId,nome:n,email,telefone:phone,data_cadastro:date,ativo:true});
  updateStats(); renderClients();
  document.getElementById("formMessage").textContent=`Cliente "${n}" cadastrado nesta sessão.`;
  e.target.reset();
});

loadData();
