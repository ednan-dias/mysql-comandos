
# Comandos MySQL 

## Criação e Exclusão do Banco

* **Criar banco de dados:** `CREATE DATABASE Produtos;`
* **Deletar banco de dados:** `DROP DATABASE Produtos;`

## Select (Selecionar dados)

* **Selecionar todas as colunas de uma tabela**: `SELECT * FROM Produtos;`
* **Selecionar uma ou mais colunas de uma tabela:** `SELECT Nome, Descrição FROM Produtos;`
* **Select com Distinc, (Selecionar dados únicos, omitindo os outros):** `SELECT DISTINCT Nome FROM Produtos;`

## Where (Selecionar com condições)
* **= : Igual**
* **>, <, >=, <= : Maior, Menor, Maior ou Igual, Menor ou Igual**
* **<> Diferente**

* **Selecionar dados com condições:** `SELECT * FROM Pessoas WHERE Nome = 'Ednan' AND Sobrenome = 'Dias';`
* `SELECT * FROM Produtos WHERE EscalaProduto = '1:18' OR EscalaProduto = '1:10';`
* `SELECT * FROM Produtos WHERE PreçoProduto <= 50;`
* `SELECT * FROM Produtos WHERE PreçoProduto >= 25 AND PreçoProduto <= 50;`
* `SELECT * FROM Produtos WHERE EscalaProduto <> '1:10';`
* `SELECT * FROM Produtos WHERE Quantidade >= 500 AND Quantidade <= 700;` <br><br>

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

## Between (Semelhante ao AND)
* **Encontrar valores que estão entre tais valores:** `SELECT * FROM Produtos WHERE Preço BETWEEN 1000 AND 1500;`
* **Encontrar valores que não estão entre tais valores:** `SELECT * FROM Produtos WHERE Preço NOT BETWEEN 1000 AND 1500;`

* `SELECT Data FROM Empregados WHERE Data BETWEEN '2000/01/01' AND '2003/12/31' ORDER BY Data ASC;`

## In (Semelhante ao OR)
* `SELECT * FROM Pessoas WHERE PessoasID IN (2,7,13);`

## Like (Encontrar algo)
* **Like '%to': Procurar algo que no final, termine com to**
* **Like 'to%': Procurar algo que no inicio, comece com to**
* **Like '%to%': Procurar algo que no meio, contenha to**
* **Like '%to_': Com o Underline, só irá aparecer um caractere depos de to**
* `SELECT * FROM Pessoas WHERE PrimeiroNome LIKE '%essa%';`





