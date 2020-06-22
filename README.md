
# Comandos MySQL

## Criação e Exclusão do Banco

* **Criar banco de dados:** `CREATE DATABASE Produtos;`
* **Deletar banco de dados:** `DROP DATABASE Produtos;`

## Select (Selecionar dados)

* **Selecionar todas as colunas de uma tabela**: `SELECT * FROM Produtos;`
* **Selecionar uma ou mais colunas de uma tabela:** `SELECT Nome, Descrição FROM Produtos;`
* **Select com Distinc, (Selecionar dados únicos, omitindo os outros):** `SELECT DISTINCT Nome FROM Produtos;`

## Where (Selecionar com condições)

* **Selecionar dados com condições:** `SELECT * FROM Pessoas WHERE Nome = 'Ednan' AND Sobrenome = 'Dias';`
* `SELECT * FROM Produtos WHERE EscalaProduto = '1:18' OR EscalaProduto = '1:10';`
* `SELECT * FROM Produtos WHERE PreçoProduto <= 50;`
* `SELECT * FROM Produtos WHERE PreçoProduto >= 25 AND PreçoProduto <= 50;`
* `SELECT * FROM Produtos WHERE EscalaProduto <> '1:10';`
* `SELECT * FROM Produtos WHERE Quantidade >= 500 AND Quantidade <= 700;` <br><br>
* **= : Igual**
* **>, <, >=, <= : Maior, Menor, Maior ou Igual, Menor ou Igual**
* **<> Diferente**

## Count (Contagem)

* **Selecionar contagem de todos os dados:** `SELECT COUNT(*) FROM Pessoas;`
* **Selecionar contagem de algo especifíco:** `SELECT COUNT(Nome) FROM Pessoas;`
* **Selecionar contagem de algo único:** `SELECT COUNT(DISTINCT Nome) FROM Pessoas;`

## Limit (Selecionar quantidade específica de dados)
* **Selecionar dados com um limite:** `SELECT * FROM Produtos LIMIT 10;`

## Order by (Ordenar dados)
* **ASC: CRESCENTE, DESC: DECRESCENTE**
* `SELECT * FROM Pessoas ORDER BY PrimeiroNome ASC;`
* `SELECT * FROM Pessoas ORDER BY PrimeiroNome ASC, Sobrenome DESC;`
* `SELECT ProdutoID, Preço FROM Produto ORDER BY Preço DESC LIMIT 10;`





