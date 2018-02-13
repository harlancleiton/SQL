insert into selecao (nome) SELECT distinct Selecao FROM OPENQUERY(ServidorCopa, 'SELECT * FROM [Plan2$]')

select * from  selecao	

insert into jogador (cod_selecao,nome) SELECT s.codigo, excel.Jogador  
								FROM OPENQUERY(ServidorCopa, 'SELECT Selecao,Jogador FROM [Plan2$]') excel
								join selecao s on s.nome = excel.Selecao			
								
select * from  jogador																												 

insert into habilidades (cod_jogador,
    jogos_disputados ,
    gols ,
    gols_sofridos ,
    assintencia ,
    assintencia_finalizacao ,
    passes_certos ,
    passes_errados ,
    finalizacoes_certos ,
    finalizacoes_erradas ,
    desarmes_certos ,
    desarmes_errados ,
    cruzamentos_certos ,
    cruzamentos_errados ,
    lancamentos_certos ,
    lancamentos_errados ,
    dribles_certos ,
    dribles_errados ,
    cartoes_amarelos ,
    cartoes_vermelhos ,
    faltas_cometidas ,
    viradas_jogo_certas ,
    viradas_jogo_erradas ,
    impedimentos ,
    bolas_perdidas ,
    defesa ,
    penaltis_cometidos ,
    penaltis_recebidos ,
    rebatidas ) SELECT j.codigo, [JOGOS DISPUTADOS]   ,     
						[GOLS]   ,            
						[GOLS SOFRIDOS]   ,            
						[ASSISTÊNCIA]   ,            
						[ASSISTÊNCIA FINALIZAÇÃO]   ,            
						[PASSES CERTOS]   ,            
						[PASSES ERRADOS]   ,            
						[FINALIZAÇÕES CERTAS]   ,            
						[FINALIZAÇÕES ERRADAS]   ,            
						[DESARMES CERTOS]   ,            
						[DESARMES ERRADOS]   ,            
						[CRUZAMENTOS CERTOS]   ,            
						[CRUZAMENTOS ERRADOS]   ,            
						[LANÇAMENTOS CERTOS]   ,            
						[LANÇAMENTOS ERRADOS]   ,            
						[DRIBLE CERTO]   ,            
						[DRIBLE ERRADO]   ,            
						[CARTÕES AMARELOS]   ,            
						[CARTÕES VERMELHOS]   ,            
						[FALTAS COMETIDAS]   ,            
						[VIRADAS DE JOGO CERTAS]   ,            
						[VIRADAS DE JOGO ERRADAS]   ,            
						[IMPEDIMENTOS]   ,            
						[BOLAS PERDIDAS]   ,            
						[DEFESA/BLOQUEIO FIN]   ,            
						[PÊNALTIS COMETIDOS]   ,            
						[PÊNALTIS RECEBIDOS]   ,            
						[REBATIDAS] 
						FROM OPENQUERY(ServidorCopa, 'SELECT * FROM [Plan2$]') excel
						join jogador j on j.nome = excel.Jogador
						
select j.nome,h.* from habilidades h join jogador j on j.codigo = h.cod_jogador