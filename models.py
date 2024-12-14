from flask_sqlalchemy import SQLAlchemy

# Instância do SQLAlchemy
db = SQLAlchemy()

# Modelo de Utilizador
class User(db.Model):
    __tablename__ = 'users'  # Certifique-se de que está 'users'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(255), nullable=False)

# Modelo de Livro
class Book(db.Model):
    __tablename__ = 'books'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255), nullable=False)
    author = db.Column(db.String(255), nullable=False)
    quantity = db.Column(db.Integer, nullable=False, default=1)  # Quantidade
    available = db.Column(db.Boolean, nullable=False, default=True)

# Modelo de Empréstimo
class Loan(db.Model):
    __tablename__ = 'loans'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)  # Certifique-se de que é 'users'
    book_id = db.Column(db.Integer, db.ForeignKey('books.id'), nullable=False)  # Deve referenciar 'books'
    loan_date = db.Column(db.Date, nullable=False, default=db.func.current_date())
    return_date = db.Column(db.Date, nullable=True)
    returned = db.Column(db.Boolean, nullable=False, default=False)
    
    # Relacionamento com Livro
    book = db.relationship('Book', backref='loans', lazy=True)

# Especificando o que será exportado
__all__ = ["User", "Book", "Loan", "db"]
