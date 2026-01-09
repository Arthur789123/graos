async function getProdutos() {
    const rota = "http://localhost:3001/produtos"
    const req = await fetch(rota)
    const res = await req.json()
    console.log(res)
    const resultados = document.getElementById('resultados')
    res.forEach(element => {
        resultados.innerHTML += `
        <div class="card">
            <img class="img" src="${element.thumbnail}">
            <h2 class="h2">${element.nome}</h2>
            <p>Data de validade: ${element.validade.slice(0, 10)}</p>
            <div>
                 <p class="preco">R$ ${element.preco}</p>
            </div>  
            <button class="button">Adicionar ao carrinho</button>
        </div>
        `
    });
}

getProdutos()   