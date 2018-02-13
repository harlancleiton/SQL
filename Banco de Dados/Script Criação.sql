/*
Created		7/3/2007
Modified		21:09 18/09/2012
Project		CBF
Model		CBF	
Author		Prof. Antnio Cordeiro
Database		MS SQL 2008r2
*/


--Connectando-se ao banco Master
use master

-- Destruindo o Banco de dados CBF (caso exista)
drop database CBF

go
-- Criando o Banco de Dados
create database CBF
go
-- Connectando-se ao banco CBF
use CBF

go
Create table Federacao
(
	cod_fed Integer Identity NOT NULL,
	descricao Varchar(30) NOT NULL,
	uf Char(2) NOT NULL constraint federacao_uf_un unique(uf),  /* criao da constraint seguindo o pado de nomenclatura: tabela_atributo_restrio*/
	telefone Varchar(10) NULL,
	endereco Varchar(30) NULL,
Primary Key (cod_fed)
) 
go

Create table Clube
(
	cod_clube Integer Identity NOT NULL,
	cod_fed Integer NOT NULL,
	nome Varchar(30) NOT NULL,
	telefone Varchar(10) NULL,
	data_fundacao Datetime NULL constraint clube_dt_fund_ck Check (data_fundacao <= getdate() ),
Primary Key (cod_clube,cod_fed),
Foreign key (cod_fed) references Federacao(cod_fed)
) 
go

Create table Jogador
(
	cod_jog Integer Identity NOT NULL,
	cod_clube Integer NOT NULL,
	cod_fed integer NOT NULL,
	nome Varchar(30) NOT NULL,
	dat_nasc Datetime NOT NULL,
	sexo Char(1) NULL Constraint jogadores_ck_sexo Check (SEXO = 'M'),
	cidade_nasc Varchar(20) NOT NULL,
	salario Numeric(8,2) NULL constraint jogador_sal_ck Check (salario >= '5000.00' ),
Primary Key (cod_jog),
Foreign key (cod_clube,cod_fed) references clube(cod_clube,cod_fed),
Foreign key (cod_fed) references federacao(cod_fed)
) 


go 
-- Inserindo Fededaes
 insert into federacao values ('Federao Baiana de Futebol','BA','22356989','Av ACM 185')
 insert into federacao values ('Federao Paulista de Futebol','SP','1122356989','Av Paulista 193')
 insert into federacao values ('Federao Carioca de Futebol','RJ','3125669877','Av. Brasil 55')
 insert into federacao values ('Federao Mineira de Futebol','MG','3225556687','Av Tiradentes 87' )
go
-- Inserindo Clubes
 insert into clube values (1,'Bahia','7133566989','1920-07-03')
 insert into clube values (1,'Vitria','7133262589','1932-07-03')
 insert into clube values (2,'So Paulo','112226289','1912-01-02')
 insert into clube values (2,'Corintians','112112244','1913-01-02')
 insert into clube values (3,'Flamengo','7131226572','1895-05-03')
 insert into clube values (3,'Vasco','3121618558','1918-05-10')
 insert into clube values (4,'Cruzeiro','325544881','1918-05-10')
 insert into clube values (4,'Atltico Mineiro','7133566989','1920-07-03')
go


-- Jogadores do Bahia
insert into jogador values(1,1,'Paulo Mussi','1980-05-02','M','Salvador',5500.00)
insert into jogador values(1,1,'Fabio','1983-03-02','M','Salvador',8000.00)
insert into jogador values(1,1,'Marcos Baiano','1981-10-08','M','Jequi',50000.00)
insert into jogador values(1,1,'Thiago','1980-03-02','M','Salvador',35000.00)
insert into jogador values(1,1,'Rubens','1984-03-02','M','Salvador',45000.00)
insert into jogador values(1,1,'Danilo','1984-03-02','M','Salvador',55000.00)
insert into jogador values(1,1,'Mor','1984-03-02','M','Salvador',7000.00)
insert into jogador values(1,1,'Preto','1989-01-12','M','Salvador',500000.00)
insert into jogador values(1,1,'Artur','1989-01-12','M','Salvador',35000.00)
insert into jogador values(1,1,'Bob Santos','1984-06-09','M','Salvador',45000.00)
insert into jogador values(1,1,'Robson','1984-03-09','M','Forlaleza',50000.00)
go
-- Jogadores do Vitria

insert into jogador values(2,1,'Mark','1983-05-11','M','Aracaju',106000.00)
insert into jogador values(2,1,'Tadeu','1983-05-11','M','Feira de Santana',16000.00)
insert into jogador values(2,1,'Fabio Santana','1983-05-11','M','Salvador',56000.00)
insert into jogador values(2,1,'Chico Estrela','1984-06-08','M','Gandu',6500.00)
insert into jogador values(2,1,'Emerson','1976-05-01','M','Salvador',50000.00)
insert into jogador values(2,1,'Joo Paulo','1980-11-05','M','Salvador',76000.00)
insert into jogador values(2,1,'Fernando','1984-01-05','M','Livramento ',16000.00)
insert into jogador values(2,1,'Tales','1984-03-01','M','Vitria da Conquista',13000.00)
insert into jogador values(2,1,'Abedi','1984-04-02','M','Salvador',12000.00)
insert into jogador values(2,1,'Indio','1984-04-02','M','Ibitira',500000.00)
insert into jogador values(2,1,'Franco','1980-04-02','M','Camaari',80000.00)
go


-- Jogadores do So Paulo

insert into jogador values(3,2,'Mineiro','1976-04-02','M','Trs Coraes',96000.00)
insert into jogador values(3,2,'Danilo Alves','1984-03-02','M','Salvador',26000.00)
insert into jogador values(3,2,'Kaka','1984-10-08','M','So Paulo',500000.00)
insert into jogador values(3,2,'Aloisio','1979-04-02','M','Maceio',200000.00)
insert into jogador values(3,2,'Renato ','1984-04-01','M','Joo Pessoa',28000.00)
insert into jogador values(3,2,'Junior','1984-03-02','M','Araras',86000.00)
insert into jogador values(3,2,'Roberto','1984-08-02','M','So Paulo',8750.00)
insert into jogador values(3,2,'Mauro Neves','1984-03-02','M','Campinas',6100.00)
insert into jogador values(3,2,'Rogrio','1976-07-02','M','So Paulo',106000.00)
insert into jogador values(3,2,'Cleber','1976-07-02','M','So Paulo',96000.00)
insert into jogador values(3,2,'Daniel','1976-07-02','M','So Paulo',38000.00)
go
-- Jogadores do Corintians
insert into jogador values(4,2,'Rafael','1976-03-02','M','Florianopolis',96000.00)
insert into jogador values(4,2,'Flvio','1984-01-02','M','Salvador',26000.00)
insert into jogador values(4,2,'Roger','1984-12-08','M','So Paulo',200000.00)
insert into jogador values(4,2,'Nilmar','1979-04-06','M','So Paulo',500000.00)
insert into jogador values(4,2,'Marcelo ','1984-03-01','M','Campinas',28000.00)
insert into jogador values(4,2,'Junior Freitas','1976-07-02','M','Araras',86000.00)
insert into jogador values(4,2,'Marcos Santos','1984-01-02','M','So Caetano',8900.00)
insert into jogador values(4,2,'Tadei','1976-07-02','M','Campinas',6700.00)
insert into jogador values(4,2,'Wagner','1976-07-02','M','So Paulo',106000.00)
insert into jogador values(4,2,'Cleber Camargo','1976-07-02','M','So Paulo',96000.00)
insert into jogador values(4,2,'Dinho','1981-10-02','M','So Paulo',38000.00)
go


--Jogadores dp Flamengo
insert into jogador values(5,3,'Mauricio','1976-03-02','M','Rio de Janeiro',96000.00)
insert into jogador values(5,3,'Baiano','1984-01-02','M','Salvador',26000.00)
insert into jogador values(5,3,'Obina','1984-12-08','M','Salvador',200000.00)
insert into jogador values(5,3,'Zico','1979-04-06','M','Rio de Janeiro',500000.00)
insert into jogador values(5,3,'Junior ','1984-03-01','M','Rio de Janeiro',28000.00)
insert into jogador values(5,3,'Zinho','1984-03-01','M','Maca',86000.00)
insert into jogador values(5,3,'Andrade','1984-01-02','M','So Caetano',8970.00)
insert into jogador values(5,3,'Clemer','1984-03-01','M','Rio de Janeiro',10000.00)
insert into jogador values(5,3,'Ronaldo','1976-07-02','M','Rio de Janeiro',106000.00)
insert into jogador values(5,3,'Felipe','1984-03-01','M','Rio de Janeiro',96000.00)
insert into jogador values(5,3,'Edmundo','1981-10-02','M','Rio de Janeiro',78000.00)
go

-- Jogadores do Vasco

insert into jogador values(6,3,'Alex','1976-03-02','M','Rio de Janeiro',96000.00)
insert into jogador values(6,3,'Tulio','1984-01-02','M','Salvador',26000.00)
insert into jogador values(6,3,'Marcio Torres','1984-12-08','M','Salvador',190000.00)
insert into jogador values(6,3,'Romrio','1979-04-06','M','Rio de Janeiro',500000.00)
insert into jogador values(6,3,'Fernando Sampaio','1984-03-01','M','Rio de Janeiro',28000.00)
insert into jogador values(6,3,'Renato Gaucho','1984-03-01','M','Maca',86000.00)
insert into jogador values(6,3,'Thiado F','1984-01-02','M','So Caetano',6850.00)
insert into jogador values(6,3,'Clodoaldo','1984-03-01','M','Rio de Janeiro',8000.00)
insert into jogador values(6,3,'Rogeiro','1976-07-02','M','Rio de Janeiro',106000.00)
insert into jogador values(6,3,'Marcio Melo','1984-03-01','M','Rio de Janeiro',96000.00)
insert into jogador values(6,3,'Fernando','1981-10-02','M','Rio de Janeiro',38000.00)
go


-- Jogadores do Cruzeiro
insert into jogador values(7,4,'Rogrio','1976-03-02','M','Ouro Preto',96000.00)
insert into jogador values(7,4,'Teodoro','1984-01-02','M','Ouro Preto',26000.00)
insert into jogador values(7,4,'Alex Vagalume','1984-12-08','M','Salvador',190000.00)
insert into jogador values(7,4,'Sorin','1979-04-06','M','Rio de Janeiro',500000.00)
insert into jogador values(7,4,'Edilson','1984-03-01','M','Ouro Preto',28000.00)
insert into jogador values(7,4,'Juares','1984-03-01','M','Maca',86000.00)
insert into jogador values(7,4,'Joo','1984-01-02','M','Belohorizonte',8900.00)
insert into jogador values(7,4,'Mario Antnio','1984-03-01','M','Ouro Preto',6900.00)
insert into jogador values(7,4,'Vanderley','1976-07-02','M','Poos de Caldas',106000.00)
insert into jogador values(7,4,'Fabio Pacheco','1984-03-01','M','Poos de Caldas',96000.00)
insert into jogador values(7,4,'Renan','1981-10-02','M','Ouro Preto',38000.00)

go
--Atltico Mineiro
insert into jogador values(8,4,'Marinho','1976-03-02','M','Ouro Preto',96000.00)
insert into jogador values(8,4,'Tales Fernando','1984-01-02','M','Salvador',26000.00)
insert into jogador values(8,4,'Algodo','1984-12-08','M','Salvador',190000.00)
insert into jogador values(8,4,'Eder','1979-04-06','M','Rio de Janeiro',500000.00)
insert into jogador values(8,4,'Vander','1984-03-01','M','Rio de Janeiro',28000.00)
insert into jogador values(8,4,'Juares','1984-03-01','M','Maca',86000.00)
insert into jogador values(8,4,'Arago','1984-01-02','M','Ouro Preto',8400.00)
insert into jogador values(8,4,'Bebeto','1984-03-01','M','Ouro Preto',5600.00)
insert into jogador values(8,4,'Valmir','1976-07-02','M','Trs Coraes',106000.00)
insert into jogador values(8,4,'Adriano Silva','1984-03-01','M','Poos de Caldas',96000.00)
insert into jogador values(8,4,'Sergio Abreu','1981-10-02','M','Belohorizonte',38000.00)
go


select  count(*) as 'Quantidade Jogadores',
	j.cod_clube as 'Cdigo do Clube'
   from  jogador as j
group by j.cod_clube


