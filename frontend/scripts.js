// Alternar entre secções
function showSection(sectionId) {
    const sections = document.querySelectorAll('main section');
    sections.forEach(section => section.classList.add('hidden'));

    const targetSection = document.getElementById(sectionId);
    if (targetSection) targetSection.classList.remove('hidden');
}

// Carregar dados ao carregar a página
document.addEventListener("DOMContentLoaded", () => {
    fetchBooks();
    fetchUsers();
    fetchLoans();
    showSection('books-section'); // Mostra Livros por padrão
});

// Função de pesquisa para Livros
function searchBooks() {
    const query = document.getElementById("search-books-input").value.trim().toLowerCase();
    const allBooks = document.querySelectorAll("#books-container .book");
    allBooks.forEach(book => {
        const title = book.querySelector("h3").textContent.toLowerCase();
        book.style.display = title.includes(query) ? "block" : "none";
    });
}

// Função de pesquisa para Utilizadores
function searchUsers() {
    const query = document.getElementById("search-users-input").value.trim().toLowerCase();
    const allUsers = document.querySelectorAll("#users-container .user");
    allUsers.forEach(user => {
        const name = user.querySelector("h3").textContent.toLowerCase();
        user.style.display = name.includes(query) ? "block" : "none";
    });
}

// Função de pesquisa para Empréstimos
function searchLoans() {
    const query = document.getElementById("search-loans-input").value.trim().toLowerCase();
    const allLoans = document.querySelectorAll("#loans-container .loan-item");
    allLoans.forEach(loan => {
        const loanText = loan.textContent.toLowerCase();
        loan.style.display = loanText.includes(query) ? "block" : "none";
    });
}

// Buscar livros disponíveis
async function fetchBooks() {
    try {
        const response = await fetch("http://127.0.0.1:5000/books");
        const books = await response.json();

        const booksContainer = document.getElementById("books-container");
        booksContainer.innerHTML = books.map(book => `
            <div class="book card">
                <h3>${book.title}</h3>
                <p>Autor: ${book.author}</p>
                <p>Quantidade Disponível: ${book.quantity}</p>
                <p>ID: ${book.id}</p>
                <div>
                    <button class="emprestar-btn" onclick="borrowBook(${book.id})">Emprestar</button>
                    <button class="apagar-btn" onclick="deleteBook(${book.id})">Apagar</button>
                    <button class="atualizar-btn" onclick="updateBookQuantity(${book.id}, ${book.quantity})">Atualizar Quantidade</button>
                </div>
            </div>
        `).join('');
    } catch (error) {
        console.error("Erro ao buscar livros:", error);
        alert("Não foi possível carregar os livros. Verifique a API.");
    }
}

// Apagar um livro
async function deleteBook(bookId) {
    if (!confirm("Tem a certeza que deseja apagar este livro?")) return;

    try {
        const response = await fetch(`http://127.0.0.1:5000/delete_book/${bookId}`, { method: "DELETE" });
        const result = await response.json();
        alert(result.message);

        if (response.ok) fetchBooks(); // Atualiza a lista após exclusão
    } catch (error) {
        console.error("Erro ao apagar livro:", error);
        alert("Erro ao apagar livro. Verifique a API.");
    }
}

// Atualizar quantidade de livros
async function updateBookQuantity(bookId, currentQuantity) {
    const newQuantity = prompt(`Digite a nova quantidade para o livro (Atual: ${currentQuantity}):`);

    if (newQuantity === null || newQuantity === "" || isNaN(newQuantity) || newQuantity < 0) {
        alert("Quantidade inválida!");
        return;
    }

    try {
        const response = await fetch(`http://127.0.0.1:5000/update_book_quantity/${bookId}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ quantity: parseInt(newQuantity, 10) }),
        });

        const result = await response.json();
        alert(result.message);

        if (response.ok) fetchBooks(); // Atualiza a lista após alteração
    } catch (error) {
        console.error("Erro ao atualizar quantidade:", error);
        alert("Erro ao atualizar quantidade. Verifique a API.");
    }
}

// Buscar utilizadores
async function fetchUsers() {
    try {
        const response = await fetch("http://127.0.0.1:5000/users");
        const users = await response.json();

        const usersContainer = document.getElementById("users-container");
        usersContainer.innerHTML = users.map(user => `
            <div class="user card">
                <h3>${user.name}</h3>
                <p>Email: ${user.email}</p>
                <p>ID: ${user.id}</p>
                <button class="apagar-btn" onclick="deleteUser(${user.id})">Apagar</button>
            </div>
        `).join('');
    } catch (error) {
        console.error("Erro ao buscar utilizadores:", error);
        alert("Não foi possível carregar os utilizadores. Verifique a API.");
    }
}

// Apagar um utilizador
async function deleteUser(userId) {
    if (!confirm("Tem a certeza que deseja apagar este utilizador?")) return;

    try {
        const response = await fetch(`http://127.0.0.1:5000/delete_user/${userId}`, { method: "DELETE" });
        const result = await response.json();
        alert(result.message);

        if (response.ok) fetchUsers(); // Atualiza a lista após exclusão
    } catch (error) {
        console.error("Erro ao apagar utilizador:", error);
        alert("Erro ao apagar utilizador. Verifique a API.");
    }
}

// Buscar empréstimos ativos
async function fetchLoans() {
    try {
        const response = await fetch("http://127.0.0.1:5000/loans");
        const loans = await response.json();

        const loansContainer = document.getElementById("loans-container");
        loansContainer.innerHTML = loans.map(loan => `
            <div class="loan-item card" id="loan-${loan.id}">
                <p>Empréstimo ${loan.id} - Livro: ${loan.book.title} (ID: ${loan.book.id})</p>
                <p>Utilizador: ${loan.user.id}</p>
                <button class="devolver-btn" onclick="returnBook(${loan.id})">Devolver</button>
            </div>
        `).join('');
    } catch (error) {
        console.error("Erro ao buscar empréstimos:", error);
        alert("Não foi possível carregar os empréstimos. Verifique a API.");
    }
}

// Realizar um empréstimo
async function borrowBook(bookId) {
    const userId = prompt("Digite o ID do utilizador que deseja emprestar este livro:");

    if (!userId) {
        alert("O ID do utilizador é obrigatório.");
        return;
    }

    try {
        const response = await fetch("http://127.0.0.1:5000/borrow", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ user_id: userId, book_id: bookId }),
        });

        const result = await response.json();
        alert(result.message);
        fetchBooks();
        fetchLoans();
    } catch (error) {
        console.error("Erro ao realizar empréstimo:", error);
        alert("Erro ao realizar empréstimo. Verifique a API.");
    }
}

// Devolver um livro
async function returnBook(loanId) {
    try {
        const response = await fetch("http://127.0.0.1:5000/return", {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ loan_id: loanId }),
        });

        const result = await response.json();
        alert(result.message);

        document.getElementById(`loan-${loanId}`)?.remove();
        fetchBooks();
    } catch (error) {
        console.error("Erro ao devolver o livro:", error);
        alert("Erro ao processar a devolução. Verifique a API.");
    }
}

// Adicionar Utilizador
document.getElementById("add-user-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const name = document.getElementById("user-name").value;
    const email = document.getElementById("user-email").value;

    try {
        const response = await fetch("http://127.0.0.1:5000/add_user", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ name, email }),
        });

        const result = await response.json();
        alert(result.message);

        if (response.status === 201) {
            fetchUsers();
            document.getElementById("add-user-form").reset();
        }
    } catch (error) {
        console.error("Erro ao adicionar utilizador:", error);
        alert("Erro ao adicionar utilizador. Verifique a API.");
    }
});

// Adicionar Livro
document.getElementById("add-book-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const title = document.getElementById("book-title").value;
    const author = document.getElementById("book-author").value;
    const quantity = parseInt(document.getElementById("book-quantity").value, 10);

    try {
        const response = await fetch("http://127.0.0.1:5000/add_book", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ title, author, quantity }),
        });

        const result = await response.json();
        alert(result.message);

        if (response.ok) {
            fetchBooks();
            document.getElementById("add-book-form").reset();
        }
    } catch (error) {
        console.error("Erro ao adicionar livro:", error);
        alert("Erro ao adicionar livro. Verifique a API.");
    }
});
