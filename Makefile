PYTHON = py

# --- ALVOS PRINCIPAIS ---

help:
	@echo "Comandos disponíveis:"
	@echo " anote-isso"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

# --- GERENCIAMENTO DE DEPENDÊNCIAS ---

install: venv/Scripts/activate
	@echo "Instalando dependências do back-end..."
	./venv/Scripts/pip install -r backend/requirements.txt

venv/Scripts/activate: backend/requirements.txt
	@echo "Criando ambiente virtual (venv)..."
	$(PYTHON) -m venv venv

# --- EXECUÇÃO DO PROJETO ---

run_backend:
	@echo "Iniciando o servidor back-end em http://127.0.0.1:5000..."
	./venv/Scripts/python backend/app.py

run_frontend:
	@echo "Iniciando o servidor front-end em http://127.0.0.1:5500..."
	@echo "Abra seu navegador e acesse o endereço acima."
	$(PYTHON) -m http.server 5500 --directory frontend

# --- LIMPEZA ---

clean:
	@echo "Limpando arquivos gerados..."
	@if exist venv ( rd /s /q venv )
	@del /s /q /f *.pyc
	@del /s /q /f *~
	@if exist __pycache__ ( rd /s /q __pycache__ )
	@if exist .cache ( rd /s /q .cache )

.PHONY: help install run_backend run_frontend clean