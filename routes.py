from flask import Blueprint, jsonify, request
from models import db, Book, Loan, User

# Criar um Blueprint para agrupar as rotas
app_routes = Blueprint('app_routes', __name__)

@app_routes.route('/books', methods=['GET'])
def get_books():
    try:
        books = Book.query.all()
        books_list = [
            {
                'id': book.id,
                'title': book.title,
                'author': book.author,
                'quantity': book.quantity,  # Inclui quantidade
                'available': book.available,
            }
            for book in books
        ]
        return jsonify(books_list)
    except Exception as e:
        print(f"Erro ao buscar livros: {e}")
        return jsonify({"message": "Erro ao buscar livros"}), 500

@app_routes.route('/search', methods=['GET'])
def search_books():
    query = request.args.get('query', '')  # Obtém o termo de pesquisa da URL
    print(f"Pesquisa recebida: {query}")  # Loga a pesquisa recebida no terminal

    books = Book.query.filter(
        (Book.title.ilike(f"%{query}%")) | (Book.author.ilike(f"%{query}%"))
    ).all()
    print(f"Livros encontrados: {books}")  # Loga os livros encontrados no terminal

    if not books:
        return jsonify({"message": "Nenhum livro encontrado com o termo pesquisado"}), 404

    # Retorna os livros encontrados em formato JSON
    return jsonify([
        {
            "id": book.id,
            "title": book.title,
            "author": book.author,
            "available": book.available
        } for book in books
    ])

@app_routes.route('/borrow', methods=['POST'])
def borrow_book():
    data = request.json
    user_id = data.get("user_id")
    book_id = data.get("book_id")
    book = Book.query.get(book_id)

    if not book or not book.available:
        return jsonify({"message": "Este livro não está disponível para empréstimo"}), 400

    loan = Loan(user_id=user_id, book_id=book_id, returned=False)
    book.available = False
    db.session.add(loan)
    db.session.commit()

    return jsonify({"message": "Livro emprestado com sucesso!"})

@app_routes.route('/return', methods=['PUT'])
def return_book():
    data = request.json
    loan_id = data.get("loan_id")

    # Validar o ID do empréstimo
    loan = Loan.query.get(loan_id)

    if not loan:
        return jsonify({"message": "ID do empréstimo inválido"}), 400

    if loan.returned:
        return jsonify({"message": "O livro já foi devolvido"}), 400

    # Atualizar o status do empréstimo e do livro
    loan.returned = True
    book = Book.query.get(loan.book_id)
    if book:
        book.available = True  # Marca o livro como disponível novamente

    db.session.commit()

    return jsonify({"message": "Livro devolvido com sucesso!"})

@app_routes.route('/users', methods=['GET'])
def get_users():
    try:
        users = User.query.all()
        users_list = [{'id': user.id, 'name': user.name, 'email': user.email} for user in users]
        return jsonify(users_list)
    except Exception as e:
        print(f"Erro ao buscar utilizadores: {e}")
        return jsonify({"message": "Erro ao buscar utilizadores"}), 500
        
@app_routes.route('/loans', methods=['GET'])
def get_loans():
    loans = Loan.query.filter_by(returned=False).all()
    loans_data = [
        {
            "id": loan.id,
            "user": {
                "id": loan.user_id,
            },
            "book": {
                "id": loan.book_id,
                "title": loan.book.title,
            },
        }
        for loan in loans
    ]
    return jsonify(loans_data)
    
@app_routes.route('/add_user', methods=['POST'])
def add_user():
    data = request.json
    name = data.get("name")
    email = data.get("email")

    if not name or not email:
        return jsonify({"message": "Nome e email são obrigatórios"}), 400

    new_user = User(name=name, email=email)
    db.session.add(new_user)
    db.session.commit()
    return jsonify({"message": "Utilizador adicionado com sucesso!"}), 201


@app_routes.route('/add_book', methods=['POST'])
def add_book():
    try:
        data = request.json
        title = data.get("title")
        author = data.get("author")
        quantity = data.get("quantity", 1)

        if not title or not author or quantity <= 0:
            return jsonify({"message": "Título, autor e quantidade válida são obrigatórios"}), 400

        # Verificar se o livro já existe
        existing_book = Book.query.filter_by(title=title, author=author).first()

        if existing_book:
            # Incrementa a quantidade
            existing_book.quantity += int(quantity)
            db.session.commit()
            return jsonify({"message": f"{quantity} cópias adicionadas ao livro '{title}' já existente."}), 200
        else:
            # Adiciona novo livro
            new_book = Book(title=title, author=author, quantity=int(quantity), available=True)
            db.session.add(new_book)
            db.session.commit()
            return jsonify({"message": f"Livro '{title}' adicionado com sucesso!"}), 201
    except Exception as e:
        print(f"Erro ao adicionar livro: {e}")
        return jsonify({"message": f"Erro ao processar solicitação: {e}"}), 500

@app_routes.route('/test_connection', methods=['GET'])
def test_connection():
    try:
        books = Book.query.all()
        return jsonify({"message": "Conexão bem-sucedida!"}), 200
    except Exception as e:
        return jsonify({"message": f"Erro ao conectar ao banco: {e}"}), 500

@app_routes.route('/delete_user/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    user = User.query.get(user_id)

    if not user:
        return jsonify({"message": "Utilizador não encontrado"}), 404

    try:
        db.session.delete(user)
        db.session.commit()
        return jsonify({"message": "Utilizador apagado com sucesso!"}), 200
    except Exception as e:
        print(f"Erro ao apagar utilizador: {e}")
        return jsonify({"message": "Erro ao apagar utilizador"}), 500

@app_routes.route('/delete_book/<int:book_id>', methods=['DELETE'])
def delete_book(book_id):
    book = Book.query.get(book_id)

    if not book:
        return jsonify({"message": "Livro não encontrado"}), 404

    try:
        db.session.delete(book)
        db.session.commit()
        return jsonify({"message": "Livro apagado com sucesso!"}), 200
    except Exception as e:
        print(f"Erro ao apagar livro: {e}")
        return jsonify({"message": "Erro ao apagar livro"}), 500

@app_routes.route('/update_book_quantity/<int:book_id>', methods=['PUT'])
def update_book_quantity(book_id):
    data = request.json
    new_quantity = data.get("quantity")

    if new_quantity is None or new_quantity < 0:
        return jsonify({"message": "Quantidade inválida"}), 400

    book = Book.query.get(book_id)

    if not book:
        return jsonify({"message": "Livro não encontrado"}), 404

    try:
        book.quantity = new_quantity
        db.session.commit()
        return jsonify({"message": f"Quantidade do livro '{book.title}' atualizada para {new_quantity}!"}), 200
    except Exception as e:
        print(f"Erro ao atualizar quantidade do livro: {e}")
        return jsonify({"message": "Erro ao atualizar quantidade do livro"}), 500

