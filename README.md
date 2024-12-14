# Sistema de Biblioteca

Este projeto é um sistema de biblioteca simples que permite gerenciar livros, usuários e empréstimos.

## Recursos

- Gerenciamento de **Livros**:
  - Adicionar novos livros com título, autor e quantidade.
  - Atualizar a quantidade de exemplares de um livro.
  - Excluir livros do sistema.
  - Emprestar e devolver livros.
  - Pesquisa de livros por título ou autor.

- Gerenciamento de **Usuários**:
  - Adicionar novos usuários com nome e email.
  - Excluir usuários existentes.
  - Pesquisa de usuários por nome.

- **Empréstimos**:
  - Realizar empréstimos de livros a usuários.
  - Registrar devoluções de livros.
  - Pesquisa de empréstimos por informações do livro ou usuário.

## Tecnologias Utilizadas

- Backend: **Flask**
- Banco de Dados: **MySQL**
- Frontend: **HTML, CSS e JavaScript**
- Biblioteca de estilos: **CSS customizado com flexbox e grid**

---

## Configuração do Banco de Dados

1. Crie um banco de dados MySQL chamado `library`:
   ```sql
   CREATE DATABASE library;
   ```

2. Importe o esquema inicial para configurar as tabelas:
   ```bash
   mysql -u seu_usuario -p library < schema.sql
   ```
   **Nota**: Substitua `seu_usuario` pelo nome do usuário do MySQL.

3. Configure a string de conexão no arquivo de configuração (`config.py` ou similar):
   ```python
   SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://usuario:senha@localhost/library'
   ```
   **Nota**: Substitua `usuario` e `senha` pelas credenciais do seu banco de dados.

---

## Como Rodar o Projeto

### Pré-requisitos

- Python 3.10+
- MySQL 5.7+
- Pipenv ou virtualenv

### Passos

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. Instale as dependências:
   ```bash
   pip install -r requirements.txt
   ```

3. Configure o banco de dados conforme descrito acima.

4. Inicie o servidor:
   ```bash
   flask run
   ```

5. Acesse o sistema no navegador:
   ```plaintext
   http://127.0.0.1:5000
   ```

---

## Comandos Úteis

- Rodar o servidor Flask:
  ```bash
  flask run
  ```

- Gerar a base de dados com Flask-Migrate:
  ```bash
  flask db init
  flask db migrate -m "Inicial"
  flask db upgrade
  ```

- População inicial de dados:
  ```bash
  python populate_database.py
  ```

---

## Estrutura de Pastas

```plaintext
library/
├── backend/
│   ├── routes.py       # Rotas da API
│   ├── models.py       # Modelos do banco de dados
│   ├── app.py          # Configuração do servidor Flask
│   └── ...
├── frontend/
│   ├── index.html      # Página principal do frontend
│   ├── styles.css      # Estilos CSS
│   ├── scripts.js      # Lógica do JavaScript
│   └── ...
└── README.md           # Documentação do projeto
```

---

## Licença

Este projeto é de uso educacional e está protegido por direitos autorais. Entre em contato com os autores para mais informações.

---

## Autores

- Veaceslav Corotnean - 202427015@uatla.pt
- Renato Almeida - 202427065@uatla.pt
- Beatriz Cansado - 202327095@uatla.pt
