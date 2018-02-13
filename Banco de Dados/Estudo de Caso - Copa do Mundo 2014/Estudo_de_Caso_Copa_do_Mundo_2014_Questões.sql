--Q 4.3
--Consultar o nome dos jogadores de cada sele��o e ordenar pelo nome da sele��o
select j.nome Jogador, s.nome Selecao
from jogador j, selecao s
where j.cod_selecao=s.codigo
order by s.nome

--Consultar a quantidade de gols dos jogadores do Brasil
select j.nome Jogador, h.gols Gols
from jogador j,habilidades h, selecao s
where j.cod_selecao=s.codigo
	and j.codigo=h.cod_jogador
	and s.nome='Brasil'
order by Gols

--Consultar os gols sofridos pelos goleiros, ordenando do maior para o menor
select j.nome Jogador, h.gols_sofridos 'Gols Sofridos'
from jogador j, habilidades h
where j.codigo=h.cod_jogador
order by 'Gols Sofridos'

--Consultar as faltas cometidas pelos jogadores da Fran�a
select j.nome Jogador, h.faltas_cometidas 'Faltas Cometidas'
from jogador j,habilidades h, selecao s
where j.cod_selecao=s.codigo
	and j.codigo=h.cod_jogador
	and s.nome='Fran�a'
order by 'Faltas Cometidas'

--Q 4.4
--Consultar o maior artilheiro da copa
select j.nome Jogador, max(h.gols) Gols
from jogador j, habilidades h
where j.codigo=h.cod_jogador
group by j.nome

--Consultar o total de gols feitos por cada sele��o na copa
select s.nome Sele��o, sum(h.gols) Gols
from selecao s, habilidades h, jogador j
where s.codigo=j.cod_selecao
	and j.codigo=h.cod_jogador
group by s.nome
order by 'Gols'

--Consultar a sele��o que menos sofreu gols
select s.nome Sele��o, min(h.gols_sofridos) 'Gols Sofridos'
from selecao s, habilidades h, jogador j
where s.codigo=j.cod_selecao
	and j.codigo=h.cod_jogador
group by s.nome
order by 'Gols Sofridos'

--Consultar a soma dos gols feitos pelas sele��es
select s.nome Sele��o, sum(h.gols) Gols
from selecao s, habilidades h, jogador j
where j.codigo=h.cod_jogador
	and j.cod_selecao=s.codigo
group by s.nome
order by Gols desc

--Q 4.5
--Consultar os goleiros que sofreram mais gols do que fez o artilheiro da copa e mostra a sele��o desses goleiros
select j.nome Jogador, h.gols_sofridos 'Gols Sofridos', s.nome Sele��o
from jogador j, habilidades h, selecao s
where j.codigo=h.cod_jogador
	and j.cod_selecao=s.codigo
	and h.gols_sofridos > (select max(h.gols) Gols
							from habilidades h)
order by 'Gols Sofridos' desc

--Consultar os jogadores que est�o acima da m�dia de dribles certos
select j.nome Jogador, h.dribles_certos 'Dribles Certos'
from jogador j, habilidades h
where j.codigo=h.cod_jogador
	and h.dribles_certos > (select avg(h.dribles_certos)
							from habilidades h)
order by 'Dribles Certos' desc

--Consultar os jogadores que deram mais passes certos que a m�dia de passes errados
select j.nome Jogador, h.passes_certos 'Passes Certos'
from jogador j, habilidades h
where j.codigo=h.cod_jogador
	and h.passes_certos > (select avg(h.passes_errados)
							from habilidades h)
order by 'Passes Certos' desc

--Consultar os jogadores que realizaram mais finaliza��es certas que a m�dia
select j.nome Jogador, h.finalizacoes_certos 'Finaliza��es Certas'
from jogador j, habilidades h
where j.codigo=h.cod_jogador
	and h.finalizacoes_certos > (select avg(h.finalizacoes_certos)
							from habilidades h)
order by 'Finaliza��es Certas' desc