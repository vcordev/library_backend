from flask import Flask
from flask_sqlalchemy import SQLAlchemy

# Inicializa o app Flask
app = Flask(__name__)

# Configuração do Banco de Dados MySQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:admin@localhost/library'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Inicializa o SQLAlchemy
db = SQLAlchemy(app)

# Importa as rotas
from routes import *

# Inicia o servidor
if __name__ == '__main__':
    app.run(debug=True)
