// Pega as referências dos elementos HTML
const conselhoTexto = document.getElementById('conselho-texto');
const gerarConselhoBtn = document.getElementById('gerar-conselho-btn');

// Aqui a Função assíncrona para buscar o conselho na API que está usando Python
async function buscarConselho() {
    try {
        // Mostra uma mensagem de carregamento para o usuário
        conselhoTexto.textContent = 'Buscando um bom conselho...';

        // Faz a requisição GET para o endpoint do nosso back-end
        const response = await fetch('http://127.0.0.1:5000/api/conselho');

        // Converte a resposta escolhida para o formato JSON
        const data = await response.json();

        // Atualiza o parágrafo com o conselho recebido do back-end
        conselhoTexto.textContent = data.conselho;

    } catch (error) {
        // Em caso de erro na comunicação, exibe uma mensagem referente ao erro
        conselhoTexto.textContent = 'Não foi possível buscar um conselho. Tente novamente mais tarde.';
        console.error('Erro ao buscar conselho:', error);
    }
}

// Adiciona um "ouvinte de evento" ao botão. Quando o botão for clicado, a função buscarConselho será chamada.
gerarConselhoBtn.addEventListener('click', buscarConselho);