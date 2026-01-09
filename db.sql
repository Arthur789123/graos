CREATE DATABASE graos;

USE graos;

CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    validade DATE,
    unidade ENUM('g', 'kg'),
    peso DECIMAL(7,2),
    marca VARCHAR(50),
    preco DECIMAL(7,2),
    tipo VARCHAR(40),
    thumbnail VARCHAR(500)
);
   
CREATE TABLE funcionarios (
    funcionarios_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(90),
    telefone VARCHAR(30),
    cargo VARCHAR(40),
    e_mail VARCHAR(90),
    senha VARCHAR(20),
    genero ENUM ('M','F','O'),
    data_nascimento DATE,
    data_admissao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cpf VARCHAR(14) UNIQUE
)

CREATE TABLE clientes (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(45),
    cpf VARCHAR(14) UNIQUE,
    e_mail VARCHAR(75),
    telefone VARCHAR(20),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    estado Varchar(2),
    data_nascimento DATE,
    genero ENUM('M', 'F', 'O'),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE estoque (
  estoque_id INT AUTO_INCREMENT PRIMARY KEY,
  produto_id INT ,
  quantidade INT DEFAULT 0,
  localizacao VARCHAR(100),
  FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

INSERT INTO clientes (nome_completo, cpf, e_mail, telefone, bairro, cidade, estado, genero, data_nascimento)
VALUES
('Beatriz Costa', '321.654.987-00', 'beatriz.costa@example.com', '(31) 98765-4321', 'Centro', 'Belo Horizonte', 'MG', 'F', '1991-04-10'),
('Lucas Pereira', '456.123.789-55', 'lucas.pereira@example.com', '(21) 99876-5432', 'Ipanema', 'Rio de Janeiro', 'RJ', 'M', '1988-08-22'),
('Sofia Martins', '789.456.123-66', 'sofia.martins@example.com', '(11) 91234-5678', 'Vila Nova', 'São Paulo', 'SP', 'F', '1994-01-05');


INSERT INTO produtos (nome, tipo, validade, peso, unidade, marca, preco, thumbnail)
VALUES
('Proteina de Soja 400g', 'Soja', '2025-12-10', 400.00, 'g', 'Camil', 8.64, "https://www.sondadelivery.com.br/img.aspx/sku/1415476/530/1415476.jpg"),
('Café Mellita 500g', 'Café', '2026-03-25', 500.00, 'g', 'Melitta', 41.99, "https://phygital-files.mercafacil.com/catalogo/uploads/produto/caf_torrado_e_mo_do_melitta_sabor_da_fazenda_pacote_500g_2ded1063-a8bb-4610-8f5b-2cd2c9639b50.png"),
('Feijão tipo 1 1kg', 'Feijão', '2026-02-14', 1, 'kg', 'Coop', 5.99, "https://coopsp.vtexassets.com/arquivos/ids/238069-1200-1200?v=638460297180470000&width=1200&height=1200&aspect=true"),
('Arroz tipo 1 1kg', 'Arroz', '2025-11-30', 1, 'kg', 'Tio João', 6.59, "https://coopsp.vtexassets.com/arquivos/ids/216318-800-auto?v=637919532812830000&width=800&height=auto&aspect=true");


INSERT INTO funcionarios (nome, telefone, cargo, e_mail, senha, genero, data_nascimento, cpf)
VALUES
('Marcos Oliveira', '(11) 98882-9911', 'Caixa', 'marcos@chocolateria.com', 'M@rcos22', 'M', '1992-03-29', '231.952.515-23'),
('João Ribeiro', '(11) 99456-7780', 'Gerente', 'joao@chocolateria.com', 'J0@0Ad!', 'M', '1985-07-12', '454.163.759-55'),
('Camila dos Santos', '(21) 97654-3210', 'Vendedora', 'camila@chocolateria.com', 'C@mil@123', 'F', '1998-11-14', '987.654.321-00')

INSERT INTO estoque (produto_id, quantidade, localizacao)
VALUES
((SELECT produto_id FROM produtos WHERE nome = 'Soja' LIMIT 1), 50, 'Armazém A'),
((SELECT produto_id FROM produtos WHERE nome = 'Café' LIMIT 1), 20, 'Armazém B'),
((SELECT produto_id FROM produtos WHERE nome = 'Feijão' LIMIT 1), 100, 'Loja Centro'),
((SELECT produto_id FROM produtos WHERE nome = 'Arroz' LIMIT 1), 75, 'Armazém A');
