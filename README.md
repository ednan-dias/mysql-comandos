
# Comandos MySQL 

## Criação e Exclusão do Banco

* **Criar banco de dados:** `CREATE DATABASE Banco;`
* **Deletar banco de dados:** `DROP DATABASE Banco;`

## Select (Selecionar dados)

* **Selecionar todas as colunas de uma tabela**: `SELECT * FROM Tabela;`
* **Selecionar uma ou mais colunas de uma tabela:** `SELECT Coluna, Coluna2 FROM Tabela;`
* **Select com Distinc, (Selecionar dados únicos, omitindo os outros):** `SELECT DISTINCT Coluna FROM Tabela;`

## Where (Selecionar com condições)
 **= : Igual**
 **>, <, >=, <= : Maior, Menor, Maior ou Igual, Menor ou Igual**
 **<> Diferente**

* **Selecionar dados com condições:** `SELECT * FROM Tabela WHERE Coluna = 'Ednan' AND Coluna2 = 'Dias';`
* `SELECT * FROM Tabela WHERE Coluna = '1:18' OR Coluna2 = '1:10';`
* `SELECT * FROM Tabela WHERE Coluna <= 50;`
* `SELECT * FROM Tabela WHERE Coluna >= 25 AND Coluna2 <= 50;`
* `SELECT * FROM Tabela WHERE Coluna <> '1:10';`
* `SELECT * FROM Tabela WHERE Coluna >= 500 AND Coluna2 <= 700;` <br><br>

## Count (Contagem)

* **Selecionar contagem de todos os dados:** `SELECT COUNT(*) FROM Tabela;`
* **Selecionar contagem de algo especifíco:** `SELECT COUNT(Coluna) FROM Tabela;`
* **Selecionar contagem de algo único:** `SELECT COUNT(DISTINCT Coluna) FROM Tabela;`

## Limit (Selecionar quantidade específica de dados)
* **Selecionar dados com um limite:** `SELECT * FROM Coluna LIMIT 10;`

## Order by (Ordenar dados)
 **ASC: CRESCENTE, DESC: DECRESCENTE**
* `SELECT * FROM Tabela ORDER BY Coluna ASC;`
* `SELECT * FROM Tabela ORDER BY Coluna ASC, Coluna2 DESC;`
* `SELECT Coluna, Coluna FROM Tabela ORDER BY Coluna DESC LIMIT 10;`

## Between (Semelhante ao AND)
* **Encontrar valores que estão entre tais valores:** `SELECT * FROM Tabela WHERE Coluna BETWEEN 1000 AND 1500;`
* **Encontrar valores que não estão entre tais valores (Usar o NOT):** `SELECT * FROM Tabela WHERE Coluna NOT BETWEEN 1000 AND 1500;`

* `SELECT Coluna FROM Tabela WHERE Coluna BETWEEN '2000/01/01' AND '2003/12/31' ORDER BY Coluna ASC;`

## In (Semelhante ao OR)
* `SELECT * FROM Tabela WHERE Coluna IN (2,7,13);`

## Like (Encontrar algo)
* **Like '%to': Procurar algo que no final, termine com to**
* **Like 'to%': Procurar algo que no inicio, comece com to**
* **Like '%to%': Procurar algo que no meio, contenha to**
* **Like '%to_': Com o Underline, só irá aparecer um caractere depos de to**
* `SELECT * FROM Tabela WHERE Coluna LIKE '%essa%';`





