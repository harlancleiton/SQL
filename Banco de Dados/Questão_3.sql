
/*
3-	Relao de todos os jogadores 
(com os apelidos: Cdigo, Nome Jogador e Nome Clube) 
da federao cujo uf  BA com seus respectivos clubes.
*/
select -- Quais os dados sero Projetados ?
			
	j.cod_jog as 'Cdigo',
	j.nome as 'Nome Jogador',
	c.nome as 'Nome Clube'
	from -- Qual a origem dos dados ?			
		Clube as c,
		Jogador as j,
		Federacao as f		
		where 
			-- Qual o critrio ou condio para exibio?
			f.cod_fed = c.cod_fed
		and c.cod_clube = j.cod_clube
		and f.uf ='BA'