
# Comandos MySQL

## Criação e Exclusão do Banco

* **Criar banco de dados:** `CREATE DATABASE Produtos;`
* **Deletar banco de dados:** `DROP DATABASE Produtos;`

## Select

* **Selecionar todas as colunas de uma tabela**: `SELECT * FROM Produtos;`
* **Selecionar uma ou mais colunas de uma tabela:** `SELECT Nome, Descrição FROM Produtos;`
* **Select com Distinc, (Selecionar dados únicos, omitindo os outros):** `SELECT DISTINCT Nome FROM Produtos;`

## Where

* **Selecionar dados com condições:** `SELECT * FROM Pessoas WHERE Nome = 'Ednan' AND Sobrenome = 'Dias';`
* `SELECT * FROM Produtos WHERE EscalaProduto = '1:18' OR EscalaProduto = '1:10';`
* `SELECT * FROM Produtos WHERE PreçoProduto <= 50;`
* `SELECT * FROM Produtos WHERE PreçoProduto >= 25 AND PreçoProduto <= 50;`
* `SELECT * FROM Produtos WHERE EscalaProduto <> '1:10';`
* `SELECT FROM Produtos WHERE Quantidade >= 500 AND Quantidade <= 700;`
select quantityInStock from products where quantityInStock >= 500 and quantityInStock <= 700;
