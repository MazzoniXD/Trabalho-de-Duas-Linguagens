from flask import Flask, jsonify
from flask_cors import CORS # Aqui faz a importação do CORS
import random

# Aqui cria a aplicação Flask
app = Flask(__name__)
CORS(app) # Habilita o CORS para a aplicação, permitindo que o front-end faça requisições

# A lista de conselhos que pretende escolher
conselhos = [
    "Estude Python todos os dias.",
    "Aprender JavaScript é fundamental para o desenvolvimento web.",
    "Beba água, faz bem para saúde.",
    "Tire um tempo para descansar, melhor do que fazer algo cansado.",
    "Nunca pare de aprender, isso vai ser recompensado.",
    "Dividir um problema grande em problemas menores é a melhor abordagem.",
    "Peça ajuda quando precisar."
]

# Cria uma "rota" ou "endpoint" para a nossa API
@app.route("/api/conselho", methods=['GET'])
def get_conselho():
    # Aqui será escolhido um conselho aleatório da lista criada a cima no código
    conselho_aleatorio = random.choice(conselhos)
    # Nisso vai retornar o conselho em formato JSON
    return jsonify(conselho=conselho_aleatorio)

# Vai ficar rodando o servidor quando o script é executado
if __name__ == "__main__":
    app.run(debug=True, port=5000)