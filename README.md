
![mysql-comandos](https://user-images.githubusercontent.com/62631162/87854490-c7e71700-c8e8-11ea-98fe-e8f32b89db89.jpg)

## Criação e Exclusão do Banco

* *Criar banco de dados:*
~~~sql
CREATE DATABASE Banco;
~~~
* *Deletar banco de dados:* 
~~~sql
DROP DATABASE Banco;
~~~

## Select 

**O comando SELECT permite recuperar os dados de um objeto do banco de dados, como uma tabela, view.**
**O Comando Distinct quando passado, retorna apenas dados únicos**

* *Selecionar todas as colunas de uma tabela*: 
~~~sql
SELECT * FROM Pessoas;
~~~
* *Selecionar uma ou mais colunas de uma tabela:* 
~~~sql
SELECT Nome, Idade FROM Pesoas;
~~~
* *Select com Distinc, (Selecionar dados únicos, omitindo os outros):* 
~~~sql
SELECT DISTINCT Nome FROM Pessoas;
~~~

## Where 

**A cláusula Where permite ao comando SQL passar condições de filtragem.**

* *= : Igual*
* *>, <, >=, <= : Maior, Menor, Maior ou Igual, Menor ou Igual*
* *<>: Diferente*
* *AND: Operador Lógico E*
* *OR: Operador Lógico OU*

* *Selecionar dados com condições:* 
~~~sql
SELECT * FROM Pessoas WHERE Nome = 'Ednan' AND Sobrenome = 'Dias';
SELECT * FROM Produto WHERE Escala = '1:18' OR Escala = '1:10';
SELECT * FROM Produto WHERE Preço <= 50;
SELECT * FROM Produto WHERE Preço >= 25 AND Preço <= 50;
SELECT * FROM Produto WHERE Escala <> '1:10';
SELECT * FROM Produto WHERE Peso >= 500 AND Peso <= 700; 
~~~

## Count 

**A função Count() retorna o número de registros em uma tabela.**

* *Selecionar contagem de todos os dados:* 
~~~sql
SELECT COUNT(*) FROM Pesoas;
~~~
* *Selecionar contagem de algo especifíco:* 
~~~sql
SELECT COUNT(Nome) FROM Pessoas;
~~~
* *Selecionar contagem de algo único:*
~~~sql
SELECT COUNT(DISTINCT Nome) FROM Pessoas;
~~~

## Limit 

**O Comando Limit, limita a filtragem dos dados.**

* *Selecionar dados com um limite:* 
~~~sql
SELECT * FROM Pessoas LIMIT 10;
~~~

## Order by

**O comando Order By, determina a ordem de apresentação do resultado de uma pesquisa de forma ascendente ou descendente.**

* *ASC: CRESCENTE, DESC: DECRESCENTE*
~~~sql
SELECT * FROM Pessoas ORDER BY Nome ASC;
SELECT * FROM Pessoas ORDER BY Nome ASC, Sobrenome DESC;
SELECT Nome, Sobrenome FROM Pessoas ORDER BY Nome DESC LIMIT 10;
~~~

## Between 

**Esse operador é usado quando precisamos recuperar as linhas de uma tabela cujo valor de um campo encontra-se em um intervalo especificado.**

**Quando passado o valor NOT, ele faz inverso do que ele faria, ou seja, se vc quisesse que ele retornasse valores que são maiores que 50, com o NOT, ele pegaria os que NÂO são maiores que 50.**

* *Encontrar valores que estão entre tais valores:*
~~~sql
SELECT * FROM Produto WHERE Preço BETWEEN 1000 AND 1500;
~~~

* *Encontrar valores que não estão entre tais valores (Usar o NOT):* 
~~~sql
SELECT * FROM Produto WHERE Preço NOT BETWEEN 1000 AND 1500;
~~~

~~~sql
SELECT Data FROM Produto WHERE Data BETWEEN '2000/01/01' AND '2003/12/31' ORDER BY Data ASC;
~~~

## In 

**O operador IN é utilizado quando desejamos consultar uma tabela, filtrando o valor de um de seus campos a partir de uma lista e possibilidades.**

~~~sql
SELECT * FROM Pessoas WHERE ID IN (2,7,13);
~~~

## Like 

**O operador LIKE é utilizado para buscar por uma determinada string dentro de um campo com valores textuais.**

* *Like '%to': Procurar algo que no final, termine com to*
* *Like 'to%': Procurar algo que no inicio, comece com to*
* *Like '%to%': Procurar algo que no meio, contenha to*
* *Like '%to_': Com o Underline, só irá aparecer um caractere depos de to*

~~~sql
SELECT * FROM Pessoas WHERE Nome LIKE '%essa%';
~~~

## Sum, Min, Max, Avg

**Usados geralmente para valores númericos.**

* *Sum: Soma Min: Valor Mínimo, Max: Valor Máximo, Avg: Média*

~~~sql
SELECT SUM(Total) AS "Contagem" FROM Produto LIMIT 10;
SELECT MIN(Total) AS "Contagem" FROM Produto LIMIT 10;
SELECT MAX(Total) AS "Contagem" FROM Produto LIMIT 10;
SELECT AVG(Total) AS "Contagem" FROM Produto LIMIT 10;
~~~

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

## Datas
* **Manipular datas**

* *Selecionar mês:*
~~~sql
    SELECT VendaID, MONTH(Data) FROM OrdemDeVendas;
~~~

* *Selecionar nome do mês:*
~~~sql
    SELECT VendaID, MONTHNAME(Data) FROM OrdemDeVendas;
~~~

* *Selecionar dia:*
~~~sql
    SELECT VendaID, DAY(Data) FROM OrdemDeVendas;
~~~

* *Selecionar nome do dia:*
~~~sql
    SELECT VendaID, DAYNAME(Data) FROM OrdemDeVendas;
~~~

* *Selecionar ano:*
~~~sql
    SELECT VendaID, YEAR(Data) FROM OrdemDeVendas;
~~~

* **Exemplo (extrair média de vendas de cada dia):**
~~~sql
    SELECT AVG(Total) AS Média, DAY(Data) AS Mês
    FROM OrdemDeVendas
    GROUP BY DAY(Data)
    ORDER BY Mês ASC;
~~~

## Manipulação de String
* **Manipular string**

* *Concatenar strings:*
~~~sql
    SELECT CONCAT(Nome,' ',Sobrenome) AS Nome
    FROM Pessoas;
~~~

* *Deixar tudo em maiusculo:*
~~~sql
    SELECT UPPER(Nome) FROM Pessoas;
~~~

* *Deixar tudo em minusculo:*
~~~sql
    SELECT LOWER(Nome) FROM Pessoas;
~~~

* *Contar caracteres:*
~~~sql
    SELECT LENGTH(Nome) FROM Pessoas;
~~~

* *Substring, selecionar partes:*
~~~sql
    SELECT Nome, SUBSTR(Nome,1,3) FROM Pessoas;

    SELECT Nome, SUBSTR(Coluna, Índice inicial, Pegar quantas casas depois do índice inicial)
    FROM Tabela;
~~~

* *Replace, substituir:*
~~~sql
    SELECT NumeroProduto, REPLACE(NumeroProduto,'-','#') FROM Pessoas;

    SELECT REPLACE(Coluna,'Caractere que vai ser substituído','Caractere que vai substituir')
    FROM Tabela;
~~~

## Funções Matemáticas

* *Soma:*
~~~sql
    SELECT Preço + Total AS Soma FROM Vendas;
~~~

* *Subtração:*
~~~sql
    SELECT Preço - Total AS Soma FROM Vendas;
~~~

* *Divisão:*
~~~sql
    SELECT Preço / Total AS Soma FROM Vendas;
~~~

* *Multiplicação:*
~~~sql
    SELECT Preço * Total AS Soma FROM Vendas;
~~~

* *Arredondamento:*
~~~sql
    SELECT ROUND(Total,2) FROM Vendas;

    SELECT ROUND(Coluna,Casas depois da vírgula) 
    FROM Tabela;
~~~

* *Raíz Quadrada:*
~~~sql
    SELECT SQRT(Total) FROM Vendas;
~~~

## SubSelect
* **Dois selects em apenas um select**

* *Para fazer o subselect coloque o segundo select em parentêses ()*

~~~sql
    SELECT * FROM Produto
    WHERE Preço > (SELECT AVG(Preço) FROM Produto);
~~~

~~~sql
    SELECT Nome FROM Pessoas
    WHERE PessoaID IN (SELECT
    PessoaID FROM Funcionários WHERE Função = 'Design Engineer');
~~~

## Self-Join
* **Selecionar dados com um condição na MESMA tabela**

~~~sql
    SELECT A.Nome, A.Endereço, B.Nome, B.Endereço FROM
    Pessoas A, Pessoas B WHERE A.Endereço = B.Endereço;
~~~

## Tipos de Dados

1. Boleanos
2. Caracteres
3. Números
4. Temporais

* ## 1. Boleanos
*Por padrão ele é iniciado como nulo, e pode receber tanto 1 como 0.*
*Tinyint, boolean, bit*

* ## 2. Caracteres
*Tamanho fixo - char // permite inserir até uma quantidade fixa de caracteres e sempre ocupa todo o espaço reservado.*
*tamanhos variáveis - varchar ou nvarchar // permite inserir até uma quantidade que for definida, porém só usa o espaço que for preenchido.*

* ## 3. Números
**Valores exatos**

* *1. TINYINT - não tem parte valor fracionados (ex: 1.43, 24.23)*
* *2. SMALLINT - mesma coisa, porém limite maior*
* *3. INT - mesma coisa, porém limite maior*
* *4. BIGINT - mesma coisa, porém limite maior*
* *5. NUMERIC ou DECIMAL - valores exatos, porém permite ter parte fracionados, que também pode ser especificado a precisão e escala (escala é o número de digitos na parte fracional) -ex: NUMERIC(5,2)*

**Valores Aproximados**
* *1. REAL - tem precisão aproximada de até 15 dígitos*
* *2. FLOAT - mesmo conceito de REAL*

## 4. Temporais
* *1. DATE - armazena data no formato aaaa/mm/dd*
* *2. DATETIME - armazena data e horas no formato aaaa/mm/dd:hh:mm:ss*
* *3. DATETIME2 - armazena data e horas com adição de milisegundos no formato aaaa/mm/dd:hh:mm:ssssssss*
* *4. SMALLDATETIME - data e hora respeitando o limite entre '1900-01-01:00:00:00' até '2079-06-06:23:59:59'.*
* *5. TIME - horas,minutos, segundos e milisegundos respeitando o limite de '00:00:00.000000' até '23:59:59.999999'*
* *6. DATETIMEOFFSET - permite armazenat informações de data e horas incluindo o fuso horário*

## Create Table

Principais tipos de restrições que podem ser aplicadas
**NOT NULL:** Não permite nulos
**UNIQUE:** Força que todos os valores em uma coluna sejam diferentes
**PRIMARY KEY:** Uma junção de NOT NULL e UNIQUE
**FOREIGN KEY:** Identifica únicamente uma linha em outra tabela
**CHECK:** Força uma condição específica em uma coluna
**DEFAULT:** Força um valor padrão quando nenhum valor é passado
**AUTO_INCREMENT:** A cada valor adicionado, o valor do campo primário é adicionado +1 automaticamente

~~~sql
    CREATE TABLE Canal (
        CanalID INT PRIMARY KEY AUTO_INCREMENT,
        Nome VARCHAR(150) NOT NULL,
        ContagemInscritos INT DEFAULT 0,
        DataCriacao DATETIME NOT NULL
    );

    CREATE TABLE Video (
        VideoID INT PRIMARY KEY AUTO_INCREMENT,
        Nome VARCHAR(150) NOT NULL,
        Vizualizacoes INT DEFAULT 0,
        Likes INT DEFAULT 0,
        Deslikes INT DEFAULT 0,
        Duracao  INT NOT NULL,
        CanalID INT,
        FOREIGN KEY (CanalID) REFERENCES Canal(CanalID)
    );
~~~

## Insert Into
* **Copiar dados de uma tabela para uma nova:**
~~~sql
    INSERT INTO Pessoas2 (Nome) SELECT Nome FROM Pessoas;

~~~

~~~sql
    INSERT INTO Pessoas(Nome,Idade) VALUES ('Danilo',13);

    INSERT INTO Casa(Nome,Endereco,PessoaID) VALUES ('Casa do Ednan', 'Rua do Maranhão', 13);
~~~

## Update

~~~sql
UPDATE Pessoas SET Nome = 'Nan' WHERE PessoaID = 1; WHERE CasaID = 1;
UPDATE Casa SET Endereco = 'Rua Miguel Ruiz, 437' WHERE CasaID = 1;
~~~

## Delete
* **Sempre usar o where, pois se não muito dados poderão ser excluídos!**

~~~sql
DELETE FROM Pessoas WHERE nome = 'Vera';
~~~

## Alter Table

* *Exemplos de o que pode ser feito:*

- Add, remover ou alterar uma coluna
- Setar valores padrões para uma coluna
- Add ou Remover restrições de colunas
- Renomear uma tabela

*Adicionar campo:*
~~~sql
    ALTER TABLE Youtube ADD Ativo BIT;
~~~

*Mudar campo:*
~~~sql
    ALTER TABLE Youtube MODIFY COLUMN Categoria VARCHAR(300) NOT NULL;
~~~

*Renomear coluna:* 
~~~sql
    ALTER TABLE Youtube CHANGE nome nomeDoCanal varchar(150) UNIQUE;
~~~

*Renomear tabela:*
~~~sql
    RENAME TABLE youtube TO Canal;
~~~

## Drop Table
**(Deletar tabela)**

~~~sql
    DROP TABLE Pessoas;
~~~

## Truncate Table
**(Remove todos os dados, mas mantém a tabela e sua arquitetura.)**

~~~sql
    TRUNCATE TABLE Pessoas;
~~~

## Check
**(Checar Condições)**

~~~sql
    CREATE TABLE Voto (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Idade INT CHECK (Idade >= 18);
    );
~~~

## Not Null
**(Não pode ser nulo)**

~~~sql
    CREATE TABLE Voto (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Idade INT NOT NULL;
    );
~~~

## Unique
**(Campo Único, não pode ser repetido.)**

~~~sql
    CREATE TABLE Voto (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) UNIQUE,
    Idade INT NOT NULL;
    );
~~~

## Views
**(São tipo uma tabela, só que você seleciona apenas as colunas que vc quer de outra tabela.)**

~~~sql
    CREATE VIEW Cidadaos AS SELECT Nome, Sobrenome FROM
    Pessoas WHERE Título = 'Mr.';
~~~



