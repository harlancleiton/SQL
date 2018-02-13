/*
5 - Recuperar a relao de todos os clubes e suas respectivas federaes.
Projetando atravs de apelidos os atributos: Cdigo do Clube, Nome do Clube, 
Ano da Fundao e Federao das federaes RJ e SP cujo nome do clube termine com a letra O.
*/
select --Quais dados serao projetados?
	c.cod_clube as 'Código',
	c.nome as 'Nome Clube',
	DATEPART(year,c.data_fundacao) as 'Ano Fundação',
	f.descricao as 'Federação'
from --Qual origem dos dados?
	Clube as c,
	Federacao as f
where --Qual o criterio?
	f.cod_fed=c.cod_fed
	and f.uf in('RJ','SP')
	and c.nome like '%o'