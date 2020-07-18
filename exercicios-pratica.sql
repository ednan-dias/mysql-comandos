
## Exercício na Prática
# Banco de dados utilizados: adventureworks

# Insert
select FirstName,LastName from contact;

# Insert com Distinct
select distinct Lastname from contact;

# Where
select Name,Weight from product where Weight > 500 and Weight <= 700;
select * from employee where MaritalStatus = 'M' and SalariedFlag = 1;
select EmailAddress from contact where FirstName = 'Peter' and LastName = 'Krebs';

# Count
select count(*) from product;
select count(Size) from product;

# Limit
select * from contact limit 20;

# Order by
select ProductID, ListPrice from product order by ListPrice desc limit 10;
select Name, ProductNumber from product order by ProductID asc limit 4;

# Between
select Name, ListPrice from product where ListPrice between 1500 and 2000;

# In
select * from product where Color in ('Blue','Silver');
select * from product where ProductID in (350,400,480);

# Like
select * from contact where FirstName like '%ade';
select * from contact where FirstName like 'fra%';

# Exercícios sobre fundamentos do SQL
select count(ListPrice) from product where ListPrice > 1500;
select count(LastName) from contact where LastName like 'P%';
select count(distinct City) from address;
select distinct City from address;
select count(*) from product where Color = 'red' and ListPrice between 500 and 1000;
select count(*) from product where Name like '%road%';

# Sum, Min, Max, Avg
select sum(ListPrice) from product limit 10;
select min(ListPrice) from product limit 10;
select max(ListPrice) from product limit 10;
select avg(ListPrice) from product limit 10;

# Group By
select MiddleName, count(FirstName) as 'Quantidade' from contact group by MiddleName;
select ProductID, avg(OrderQty) as 'Média' from salesorderdetail group by ProductID;

select ProductID, sum(LineTotal) as 'Total' from 
salesorderdetail group by ProductID order by sum(LineTotal) desc limit 10;

select ProductID, count(ProductID) as 'Contagem', avg(OrderQty) as 'Média'
 from salesorderdetail group by ProductID;
 
 # Having
select StateProvinceID, count(StateProvinceID) as 'Quantidade'
from address group by StateProvinceID having count(StateProvinceID) > 1000;

select ProductID, avg(LineTotal) as 'Contagem'
from salesorderdetail group by ProductID having avg(LineTotal) < 1000000;

# As
select FirstName as 'Nome', LastName as 'Sobrenome' from contact limit 10;
select ProductNumber as 'Codigo do Produto' from product limit 10;
select UnitPrice as 'Preço Unitário' from salesorderdetail limit 10;

# Inner Join
select C.FirstName,C.LastName,E.Title,E.VacationHours from employee as E inner join contact as C 
on E.ContactID = C.ContactID;

select A.AddressID, A.City, S.StateProvinceID, S.Name from address as A 
inner join stateprovince as S on A.StateProvinceID = S.StateProvinceID;

# Union
select FirstName from contact where FirstName = 'Samuel'
union
select FirstName from contact where FirstName like 'S%';

# Data
select monthname(DueDate) as Dia, year(DueDate) as Mês from workorder;

# String
select concat(AddressLine1,' / ',City) from address;
select City,length(City) from address;
select lower(City) from address;
select upper(City) from address;
select substr(City,1,3) from address;
select replace(City,'Bothell', 'Ednan') from address;

# Funções Matemáticas
select avg(round(UnitPrice,2)) as 'Média arredondada' from salesorderdetail;

# SubSelect
select * from address
where StateProvinceID in (select StateProvinceID from
stateprovince where Name = 'Alberta');

# Self-Join
select A.product_id, A.quantity, B.product_id, B.quantity from order_details A, order_details B
where A.quantity = B.quantity;

# Create Table
create table Pessoas (
	PessoaID int primary key auto_increment,
    nome varchar(150) not null,
    idade int not null
);

create table Casa (
	CasaID int primary key auto_increment,
    nome varchar(150) not null,
    endereco varchar(150) not null,
    PessoaID int,
    foreign key (PessoaID) references Pessoas(PessoaID)
);

# Insert Into
create table teste(
	testeID int primary key,
    nome varchar(150) not null,
    idade int not null
);

insert into teste(testeID,nome,idade) values (1,'Ednan',18);

insert into teste(testeID,nome,idade) values (2,'Vera',41), (3,'Edimar',42), (4,'Danilo',13);

create table teste2(
	testeID int primary key auto_increment,
    nome varchar(150) not null
);

insert into teste2(nome) values ('Ronaldo');

insert into teste2 (nome) select nome from teste;

# Update
update casa set nome = 'Casa do Nan' where CasaID = 1;
update casa set endereco = 'Rua Miguel Ruiz, 437' where CasaID = 1;

# Alter Table
select * from pessoas;

create database cidadaos;

create table pessoas (
	pessoasID int primary key,
	nome varchar(150) unique not null,
    idade int not null
);

alter table pessoas modify column nome varchar(300) not null; 

alter table pessoas change nome nomePessoa varchar(150) not null;

rename table pessoas to pessoal;

# Check Constraint

create table Voto (
	id int primary key auto_increment,
    nome varchar(100) not null,
    idade int check (idade >= 18)
);

insert into Voto(nome,idade) values ('Marcos', 19);



















