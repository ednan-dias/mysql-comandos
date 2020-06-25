
# Comandos MySQL 

## Criação e Exclusão do Banco

* *Criar banco de dados:* `CREATE DATABASE Banco;`
* *Deletar banco de dados:* `DROP DATABASE Banco;`

## Select 

**O comando SELECT permite recuperar os dados de um objeto do banco de dados, como uma tabela, view.**
**O Comando Distinct quando passado, retorna apenas dados únicos**

* *Selecionar todas as colunas de uma tabela*: `SELECT * FROM Pessoas;`
* *Selecionar uma ou mais colunas de uma tabela:* `SELECT Nome, Idade FROM Pesoas;`
* *Select com Distinc, (Selecionar dados únicos, omitindo os outros):* `SELECT DISTINCT Nome FROM Pessoas;`

## Where 

**A cláusula Where permite ao comando SQL passar condições de filtragem.**

* *= : Igual*
* *>, <, >=, <= : Maior, Menor, Maior ou Igual, Menor ou Igual*
* *<>: Diferente*
* *AND: Operador Lógico E*
* *OR: Operador Lógico OU*

* *Selecionar dados com condições:* `SELECT * FROM Pessoas WHERE Nome = 'Ednan' AND Sobrenome = 'Dias';`
* `SELECT * FROM Produto WHERE Escala = '1:18' OR Escala = '1:10';`
* `SELECT * FROM Produto WHERE Preço <= 50;`
* `SELECT * FROM Produto WHERE Preço >= 25 AND Preço <= 50;`
* `SELECT * FROM Produto WHERE Escala <> '1:10';`
* `SELECT * FROM Produto WHERE Peso >= 500 AND Peso <= 700;` <br><br>

## Count 

**A função Count() retorna o número de registros em uma tabela.**

* *Selecionar contagem de todos os dados:* `SELECT COUNT(*) FROM Pesoas;`
* *Selecionar contagem de algo especifíco:* `SELECT COUNT(Nome) FROM Pessoas;`
* *Selecionar contagem de algo único:* `SELECT COUNT(DISTINCT Nome) FROM Pessoas;`

## Limit 

**O Comando Limit, limita a filtragem dos dados.**

* *Selecionar dados com um limite:* `SELECT * FROM Pessoas LIMIT 10;`

## Order by

**O comando Order By, determina a ordem de apresentação do resultado de uma pesquisa de forma ascendente ou descendente.**

 *ASC: CRESCENTE, DESC: DECRESCENTE*
* `SELECT * FROM Pessoas ORDER BY Nome ASC;`
* `SELECT * FROM Pessoas ORDER BY Nome ASC, Sobrenome DESC;`
* `SELECT Nome, Sobrenome FROM Pessoas ORDER BY Nome DESC LIMIT 10;`

## Between 

**Esse operador é usado quando precisamos recuperar as linhas de uma tabela cujo valor de um campo encontra-se em um intervalo especificado.**

**Quando passado o valor NOT, ele faz inverso do que ele faria, ou seja, se vc quisesse que ele retornasse valores que são maiores que 50, com o NOT, ele pegaria os que NÂO são maiores que 50.**

* *Encontrar valores que estão entre tais valores:* `SELECT * FROM Produto WHERE Preço BETWEEN 1000 AND 1500;`
* *Encontrar valores que não estão entre tais valores (Usar o NOT):* `SELECT * FROM Produto WHERE Preço NOT BETWEEN 1000 AND 1500;`

* `SELECT Data FROM Produto WHERE Data BETWEEN '2000/01/01' AND '2003/12/31' ORDER BY Data ASC;`

## In 

**O operador IN é utilizado quando desejamos consultar uma tabela, filtrando o valor de um de seus campos a partir de uma lista e possibilidades.**

* `SELECT * FROM Pessoas WHERE ID IN (2,7,13);`

## Like 

**O operador LIKE é utilizado para buscar por uma determinada string dentro de um campo com valores textuais.**

* *Like '%to': Procurar algo que no final, termine com to*
* *Like 'to%': Procurar algo que no inicio, comece com to*
* *Like '%to%': Procurar algo que no meio, contenha to*
* *Like '%to_': Com o Underline, só irá aparecer um caractere depos de to*
* `SELECT * FROM Pessoas WHERE Nome LIKE '%essa%';`


## Sum, Min, Max, Avg

**Usados geralmente para valores númericos.**

* *Sum: Soma, Min: Valor Mínimo*
* *Sum: Soma:* `SELECT SUM(Total) AS "Contagem" FROM Produto LIMIT 10;`
* *Min: Valor Mínimo:* `SELECT MIN(Total) AS "Contagem" FROM Produto LIMIT 10;`
* *Max: Valor Máximo:* `SELECT MAX(Total) AS "Contagem" FROM Produto LIMIT 10;`
* *Avg: Média:* `SELECT AVG(Total) AS "Contagem" FROM Produto LIMIT 10;`

## Group By 

**A cláusula GROUP BY agrupa linhas baseado em semelhanças entre elas.**

~~~sql
SELECT Cor, COUNT(Cor) AS "Contagem" 
FROM Produto GROUP BY Cor;

SELECT Nome, COUNT(Nome) AS "Contagem" 
FROM "Pessoas" GROUP BY Nome;

SELECT Cor, AVG(Preço) AS "Contagem"
FROM Produto WHERE Cor = 'Cinza' GROUP BY Color;
~~~

## Having 

**A cláusula WHERE é utilizada no "modo de linha" para filtrar linhas (restrição horizontal). A cláusula HAVING tem funções semelhantes no "modo de grupo": serve para filtrar grupos quando o query possui um GROUP BY.**

~~~sql
SELECT Nome, COUNT(Nome) AS 'Quantidade'
FROM Pessoas GROUP BY Nome HAVING COUNT(Nome) > 10;

SELECT ProdutoID, SUM(Total) AS 'Total' 
FROM Produtos GROUP BY ProdutoID 
HAVING SUM(Total) BETWEEN 162000 AND 500000;
~~~

## As 

**Serve para renomear colunas, geralmente sem nomes definidos.**

~~~sql
SELECT SUM(Preço) AS "Preço Médio" FROM Produtos LIMIT 10;
~~~


## Inner Join
* **A cláusula INNER JOIN permite usar um operador de comparação para comparar os valores de colunas provenientes de tabelas associadas.**

* *Inner Join, Outer Join, Self-Join*

~~~sql 
SELECT S.ProdutoID, S.NumeroCarreira, P.Nome FROM Vendas as S INNER JOIN Produto as P on S.ProdutoID = P.ProdutoID;

SELECT P.Preço, P.Nome, PS.Nome as 'Nome Subcategoria' FROM Produtos as P INNER JOIN ProdutoSubcategoria AS PS ON P.ProdutoSubcategoriaID = PS.ProdutoSubcategoriaID;

SELECT E.Endereço, E.Cidade, ES.Nome FROM Endereço AS E INNER JOIN Estado AS ES ON E.EstadoID = ES.EstadoID;
~~~

## Tipos de Joins
* **Inner Join: retorna apenas os resultados que correspondem (existem) tanto na tabela A como na tabela B**
* **Full Outer Join: retorna um conjunto de todos os registros correspondentes na tabela A e tabela B quando são iguais. E além disso se não houver valores correspondentes, ele simplesmente irá preencher esse lado com 'Null'**
* **Left Outer Join: retorna um conjunto de todos os registros da tabela A, e além disso, os registros correspondentes (quando disponíveis) na tabela B. Se não houver registros correspondentes ele simplemente vai preencher com 'Null'**

~~~sql
SELECT * FROM Contato AS C 
LEFT JOIN ContatoCartao AS CC
ON C.ContatoID = CC.ContadoID
WHERE CC.ContadoID IS NULL;
~~~

## Union
* **O operador Union combina dois ou mais resultados de um select em um resultado apenas.**
~~~sql
SELECT ProdutoID, Nome, Numero 
FROM Produto WHERE Nome LIKE '%Chain%'
UNION
SELECT ProdutoID, Nome, Numero 
FROM Produto WHERE Nome LIKE '%Decal%';     
~~~

