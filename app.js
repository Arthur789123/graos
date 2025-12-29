const mysql = require("mysql2/promise");
const express = require("express");
const cors = require("cors");

const app = express();

app.use(express.json());
app.use(cors());

const connection = mysql.createPool({
    host: "localhost", // Seu host do MySQL
    user: "root", // Seu usuário do MySQL
    password: "12345678", // Sua senha do MySQL
    database: "graos", // nome do BD Sakila
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
});

const PORT = 3001;
app.listen(PORT, async () => {
    console.log(`A conexão está sendo executada na porta ${PORT}`);

    // O código abaixo é para testarmos a comunicação com o MySQL
    const [result] = await connection.execute("SELECT 1");
    if (result) {
        console.log("Conexão ao BD feita com sucesso!");
    }
});

app.get('/produtos', async (req, res) => {
    const [produtos] = await connection.execute('SELECT * FROM produtos')
    return res.json(produtos);
})

app.get('/clientes', async (req, res) => {
    const [clientes] = await connection.execute('SELECT * FROM clientes')
    return res.json(clientes);
})

app.get('/estoque', async (req, res) => {
    const [estoque] = await connection.execute('SELECT * FROM clientes')
    return res.json(estoque);
})

app.get('/funcionarios', async (req, res) => {
    const [funcionarios] = await connection.execute('SELECT * FROM clientes')
    return res.json(funcionarios);
})

app.get('/produtos/:id', async (req, res) => {
    const { id } = req.params;
    const [produtos] = await connection.execute(
        'SELECT * FROM produtos WHERE produto_id = ?',
        [id]
    )
    return res.json(produtos);
})

app.get('/clientes/:id', async (req, res) => {
    const { id } = req.params;
    const [clientes] = await connection.execute(
        'SELECT * FROM clientes WHERE client_id = ?',
        [id]
    )
    return res.json(clientes);
})

app.get('/estoque/:id', async (req, res) => {
    const { id } = req.params;
    const [estoque] = await connection.execute(
        'SELECT * FROM clientes WHERE estoque_id = ?',
        [id]
    )
    return res.json(estoque);
})

app.get('/funcionarios/:id', async (req, res) => {
    const { id } = req.params;
    const [funcionarios] = await connection.execute(
        'SELECT * FROM funcionarios WHERE funcionarios_id = ?',
        [id]
    )
    return res.json(funcionarios);
})