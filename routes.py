from app import app, db
from flask import request, jsonify
from models import Book, User, Loan
from datetime import date

# Endpoint para listar livros
@app.route('/books', methods=['GET'])
def get_books():
    books = Book.query.all()
    return jsonify([{
        "id": book.id,
        "title": book.title,
        "author": book.author,
        "available": book.available
    } for book in books])

# Endpoint para registrar um empréstimo
@app.route('/borrow', methods=['POST'])
def borrow_book():
    data = request.json
    loan = Loan(
        user_id=data['user_id'],
        book_id=data['book_id'],
        loan_date=date.today()
    )
    # Atualizar disponibilidade do livro
    book = Book.query.get(data['book_id'])
    if book and book.available:
        book.available = False
        db.session.add(loan)
        db.session.commit()
        return jsonify({"message": "Book borrowed successfully!"}), 201
    return jsonify({"error": "Book not available"}), 400

# Endpoint para registrar a devolução
@app.route('/return', methods=['PUT'])
def return_book():
    data = request.json
    loan = Loan.query.get(data['loan_id'])
    if loan:
        book = Book.query.get(loan.book_id)
        book.available = True
        loan.return_date = date.today()
        db.session.commit()
        return jsonify({"message": "Book returned successfully!"}), 200
    return jsonify({"error": "Loan not found"}), 404
    
@app.route('/recommendations', methods=['GET'])
def recommendations():
    user_id = request.args.get('user_id')  # Pega o ID do usuário nos parâmetros da URL
    if not user_id:
        return jsonify({"error": "User ID is required"}), 400

    # Busca os empréstimos do usuário
    loans = Loan.query.filter_by(user_id=user_id).all()
    borrowed_books = [loan.book_id for loan in loans]  # IDs dos livros já emprestados pelo usuário

    # Busca livros que o usuário ainda não leu e estão disponíveis
    recommended_books = Book.query.filter(~Book.id.in_(borrowed_books), Book.available == True).all()

    # Retorna a lista de recomendações
    return jsonify([{
        "id": book.id,
        "title": book.title,
        "author": book.author
    } for book in recommended_books])

@app.route('/history', methods=['GET'])
def history():
    user_id = request.args.get('user_id')  # Pega o ID do usuário nos parâmetros da URL
    if not user_id:
        return jsonify({"error": "User ID is required"}), 400

    # Busca os empréstimos do usuário
    loans = Loan.query.filter_by(user_id=user_id).all()

    if not loans:
        return jsonify({"message": "No loans found for this user."}), 404

    # Retorna o histórico de empréstimos
    return jsonify([{
        "loan_id": loan.id,
        "book_id": loan.book_id,
        "book_title": Book.query.get(loan.book_id).title,
        "loan_date": loan.loan_date,
        "return_date": loan.return_date
    } for loan in loans])

@app.route('/search', methods=['GET'])
def search():
    query = request.args.get('query')  # Pega o termo de busca nos parâmetros da URL
    if not query:
        return jsonify({"error": "Search query is required"}), 400

    # Busca livros pelo título ou autor que contenham o termo
    books = Book.query.filter(
        (Book.title.ilike(f"%{query}%")) | (Book.author.ilike(f"%{query}%"))
    ).all()

    if not books:
        return jsonify({"message": "No books found matching the query"}), 404

    # Retorna os resultados encontrados
    return jsonify([{
        "id": book.id,
        "title": book.title,
        "author": book.author,
        "available": book.available
    } for book in books])

@app.route('/reports', methods=['GET'])
def reports():
    # Total de empréstimos realizados
    total_loans = Loan.query.count()

    # Livros mais emprestados
    popular_books = db.session.query(
        Book.title, db.func.count(Loan.book_id).label("loan_count")
    ).join(Loan, Loan.book_id == Book.id).group_by(Book.title).order_by(db.desc("loan_count")).limit(5).all()

    # Retornar relatório
    return jsonify({
        "total_loans": total_loans,
        "popular_books": [{"title": book[0], "loan_count": book[1]} for book in popular_books]
    })
