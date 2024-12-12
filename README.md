# Sistema de Biblioteca

## Descrição
Este é um sistema simples de gerenciamento de bibliotecas desenvolvido em Flask, permitindo:
- Listar livros disponíveis.
- Realizar e devolver empréstimos.
- Consultar o histórico de empréstimos de um usuário.
- Obter recomendações de livros para usuários.
- Buscar livros pelo título ou autor.
- Gerar relatórios de empréstimos e livros mais populares.

## Requisitos
Antes de iniciar, certifique-se de que você possui os seguintes itens instalados:
- **Python 3.7+**
- **Flask**
- **Flask-SQLAlchemy**
- **MySQL** (com MySQL Workbench, opcional)

### Instale as Dependências
1. Use o gerenciador de pacotes `pip` para instalar as dependências do projeto:
   pip install flask flask-sqlalchemy pymysql
   Certifique-se de que o banco de dados MySQL está configurado e rodando.

### Configuração do Banco de Dados
Crie um banco de dados MySQL chamado `library`:
   CREATE DATABASE library;

Configure as tabelas com o seguinte esquema:
   CREATE TABLE books (
       id INT AUTO_INCREMENT PRIMARY KEY,
       title VARCHAR(255),
       author VARCHAR(255),
       available BOOLEAN
   );

   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(255),
       email VARCHAR(255)
   );

   CREATE TABLE loans (
       id INT AUTO_INCREMENT PRIMARY KEY,
       user_id INT,
       book_id INT,
       loan_date DATE,
       return_date DATE
   );

## Como Executar
Clone este repositório:
   git clone <link-do-repositorio>
   cd library_backend

Inicie o servidor Flask:
   python app.py

O servidor estará disponível em http://127.0.0.1:5000/.

Use ferramentas como Postman ou navegador para testar os endpoints.

## Endpoints
1. Listar Livros
   URL: /books
   Método: GET
   Descrição: Lista todos os livros da biblioteca.

2. Realizar Empréstimo
   URL: /borrow
   Método: POST
   Body (JSON):
   {
       "user_id": 1,
       "book_id": 2
   }
   Descrição: Realiza um empréstimo de um livro para um usuário.

3. Devolver Livro
   URL: /return
   Método: PUT
   Body (JSON):
   {
       "loan_id": 1
   }
   Descrição: Processa a devolução de um livro.

4. Recomendações de Livros
   URL: /recommendations
   Método: GET
   Parâmetros:
   user_id: ID do usuário (obrigatório).
   Descrição: Retorna recomendações de livros que o usuário ainda não leu.

5. Histórico de Empréstimos
   URL: /history
   Método: GET
   Parâmetros:
   user_id: ID do usuário (obrigatório).
   Descrição: Retorna o histórico de empréstimos de um usuário.

6. Busca Avançada
   URL: /search
   Método: GET
   Parâmetros:
   query: Termo para buscar no título ou autor (obrigatório).
   Descrição: Busca livros pelo título ou autor.

7. Relatórios
   URL: /reports
   Método: GET
   Descrição: Gera relatórios com estatísticas sobre os empréstimos e os livros mais populares.

## Autor
Veaceslav Corotnean - 202427015@uatla.pt
Renato Almeida - 202427065@uatla.pt
Beatriz Cansado - 202327095@uatla.pt
