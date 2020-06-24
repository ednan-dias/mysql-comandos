
# Comandos MySQL 

## Criação e Exclusão do Banco

* **Criar banco de dados:** `CREATE DATABASE Banco;`
* **Deletar banco de dados:** `DROP DATABASE Banco;`

## Select 

*O comando SELECT permite recuperar os dados de um objeto do banco de dados, como uma tabela, view.*

* **Selecionar todas as colunas de uma tabela**: `SELECT * FROM Pessoas;`
* **Selecionar uma ou mais colunas de uma tabela:** `SELECT Nome, Idade FROM Pesoas;`
* **Select com Distinc, (Selecionar dados únicos, omitindo os outros):** `SELECT DISTINCT Nome FROM Pessoas;`

## Where (Selecionar com condições)

*A cláusula Where permite ao comando SQL passar condições de filtragem.*
* **= : Igual**
* **>, <, >=, <= : Maior, Menor, Maior ou Igual, Menor ou Igual**
* **<> Diferente**

* **Selecionar dados com condições:** `SELECT * FROM Pessoas WHERE Nome = 'Ednan' AND Sobrenome = 'Dias';`
* `SELECT * FROM Produto WHERE Escala = '1:18' OR Escala = '1:10';`
* `SELECT * FROM Produto WHERE Preço <= 50;`
* `SELECT * FROM Produto WHERE Preço >= 25 AND Preço <= 50;`
* `SELECT * FROM Produto WHERE Escala <> '1:10';`
* `SELECT * FROM Produto WHERE Peso >= 500 AND Peso <= 700;` <br><br>

## Count (Contagem)

* **Selecionar contagem de todos os dados:** `SELECT COUNT(*) FROM Pesoas;`
* **Selecionar contagem de algo especifíco:** `SELECT COUNT(Nome) FROM Pessoas;`
* **Selecionar contagem de algo único:** `SELECT COUNT(DISTINCT Nome) FROM Pessoas;`

## Limit (Selecionar quantidade específica de dados)
* **Selecionar dados com um limite:** `SELECT * FROM Pessoas LIMIT 10;`

## Order by (Ordenar dados)
 **ASC: CRESCENTE, DESC: DECRESCENTE**
* `SELECT * FROM Pessoas ORDER BY Nome ASC;`
* `SELECT * FROM Pessoas ORDER BY Nome ASC, Sobrenome DESC;`
* `SELECT Nome, Sobrenome FROM Pessoas ORDER BY Nome DESC LIMIT 10;`

## Between (Semelhante ao AND)
* **Encontrar valores que estão entre tais valores:** `SELECT * FROM Produto WHERE Preço BETWEEN 1000 AND 1500;`
* **Encontrar valores que não estão entre tais valores (Usar o NOT):** `SELECT * FROM Produto WHERE Preço NOT BETWEEN 1000 AND 1500;`

* `SELECT Data FROM Produto WHERE Data BETWEEN '2000/01/01' AND '2003/12/31' ORDER BY Data ASC;`

## In (Semelhante ao OR)
* `SELECT * FROM Pessoas WHERE ID IN (2,7,13);`

## Like (Encontrar algo)
* **Like '%to': Procurar algo que no final, termine com to**
* **Like 'to%': Procurar algo que no inicio, comece com to**
* **Like '%to%': Procurar algo que no meio, contenha to**
* **Like '%to_': Com o Underline, só irá aparecer um caractere depos de to**
* `SELECT * FROM Pessoas WHERE Nome LIKE '%essa%';`


## Sum, Min, Max, Avg
* **Sum: Soma:** `SELECT SUM(Total) AS "Contagem" FROM Produto LIMIT 10;`
* **Min: Valor Mínimo:** `SELECT MIN(Total) AS "Contagem" FROM Produto LIMIT 10;`
* **Max: Valor Máximo:** `SELECT MAX(Total) AS "Contagem" FROM Produto LIMIT 10;`
* **Avg: Média:** `SELECT AVG(Total) AS "Contagem" FROM Produto LIMIT 10;`

## Group By (Agrupar dados)
* `SELECT Cor, COUNT(Cor) AS "Contagem" FROM Produto GROUP BY Cor;`
* `SELECT Nome, COUNT(Nome) AS "Contagem" from "Pessoas" GROUP BY Nome;`
* `SELECT Cor, AVG(Preço) AS "Contagem" FROM Produto WHERE Cor = 'Cinza' GROUP BY Color`

## Having ('Where' de dados agrupados)
* `SELECT Nome, COUNT(Nome) AS 'Quantidade' FROM Pessoas GROUP BY Nome HAVING COUNT(Nome) > 10;`
* `SELECT ProdutoID, SUM(Total) AS 'Total' FROM Produtos GROUP BY ProdutoID HAVING SUM(Total) BETWEEN 162000 AND 500000;`

## As (Renomear colunas)
* `SELECT SUM(Preço) AS "Preço Médio" FROM Produtos LIMIT 10;`


## Inner Join
