# Sistema de Biblioteca

## Descrição

Este projeto é um sistema simples para gestão de bibliotecas, desenvolvido com Python (Flask) no backend e HTML, CSS e JavaScript no frontend. O sistema permite:

- Gerir livros, incluindo adição, pesquisa, edição e remoção.
- Gerir utilizadores, com registo e eliminação.
- Controlar empréstimos de livros.

Os dados são armazenados numa base de dados SQL, e a comunicação entre o frontend e o backend é feita via rotas RESTful.

---

## Funcionalidades Principais

- **Gestão de Livros**: 
  - Adicionar novos livros com título, autor e quantidade.
  - Atualizar a quantidade de exemplares.
  - Remover livros do sistema.
  - Pesquisar livros por título ou autor.

- **Gestão de Utilizadores**: 
  - Registar novos utilizadores com nome e email.
  - Remover utilizadores.

- **Empréstimos**: 
  - Realizar empréstimos.
  - Registar devoluções.

---

## Como Executar o Sistema

### Requisitos

Certifique-se de que tem os seguintes componentes instalados:

- Python 3.8+
- Flask (instalado via pip)
- Navegador web atualizado

### Configuração e Execução

1. **Backend**:
   - Abra o terminal e navegue até à pasta onde o ficheiro `app.py` está localizado:

     ```bash
     cd caminho/para/o/diretorio/library_backend
     ```
   - Execute o servidor Flask:

     ```bash
     python app.py
     ```

   - O servidor estará disponível no endereço:

     ```plaintext
     http://127.0.0.1:5000
     ```

2. **Frontend**:
   - Abra o ficheiro `index.html` localizado na pasta do frontend diretamente no navegador para interagir com o sistema.

---

## Estrutura do Projeto

```plaintext
library/
├── backend/
│   ├── app.py          # Configuração e inicialização do servidor Flask
│   ├── models.py       # Definições dos modelos da base de dados
│   ├── routes.py       # Rotas RESTful para os recursos
│   └── library.sql     # Esquema e dados iniciais da base de dados
├── frontend/
│   ├── index.html      # Página principal do frontend
│   ├── styles.css      # Estilos CSS
│   ├── scripts.js      # Lógica do JavaScript
└── README.md           # Documentação do projeto
```

---

## Rotas RESTful Disponíveis

### Livros

- `GET /books` - Lista todos os livros.
- `GET /search?query=<termo>` - Pesquisa livros por título ou autor.
- `POST /add_book` - Adiciona um novo livro.
- `PUT /update_book_quantity/<book_id>` - Atualiza a quantidade de um livro.
- `DELETE /delete_book/<book_id>` - Remove um livro.

### Utilizadores

- `GET /users` - Lista todos os utilizadores.
- `POST /add_user` - Regista um novo utilizador.
- `DELETE /delete_user/<user_id>` - Remove um utilizador.

### Empréstimos

- `POST /borrow` - Regista um novo empréstimo.
- `PUT /return` - Regista a devolução de um livro.
- `GET /loans` - Lista todos os empréstimos pendentes.

---

## Licença

Este projeto é de uso educacional. Consulte os autores para mais informações.

---

## Autores

- Veaceslav Corotnean - 202427015@uatla.pt
- Renato Almeida - 202427065@uatla.pt
- Beatriz Cansado - 202327095@uatla.pt