create database copa;
GO
use copa;

create table selecao(
    codigo int not null identity primary key,
    nome varchar(40) not null
    )
     
create table jogador(
    codigo int not null identity primary key,
    nome varchar(255) not null,
    cod_selecao int not null foreign key references selecao(codigo)
    )
     
create table habilidades(
    codigo int not null identity primary key,
    cod_jogador int not null foreign key references jogador(codigo),
    jogos_disputados int,
    gols int,
    gols_sofridos int,
    assintencia int,
    assintencia_finalizacao int,
    passes_certos int,
    passes_errados int,
    finalizacoes_certos int,
    finalizacoes_erradas int,
    desarmes_certos int,
    desarmes_errados int,
    cruzamentos_certos int,
    cruzamentos_errados int,
    lancamentos_certos int,
    lancamentos_errados int,
    dribles_certos int,
    dribles_errados int,
    cartoes_amarelos int,
    cartoes_vermelhos int,
    faltas_cometidas int,
    viradas_jogo_certas int,
    viradas_jogo_erradas int,
    impedimentos int,
    bolas_perdidas int,
    defesa int,
    penaltis_cometidos int,
    penaltis_recebidos int,
    rebatidas int
)


--CONFIGURANDO À INSTÂNCIA SQL PARA ACEITAR OPÇÕES AVANÇADAS
EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO

--HABILITANDO O USO DE CONSULTAS DISTRIBUÍDAS
EXEC sp_configure 'Ad Hoc Distributed Queries', 1
GO
RECONFIGURE
GO


--ADICIONANDO OS DRIVERS NA INSTÂNCIA SQL
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
GO
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1
GO


--Criando conexao para a palhilha como um servidor de banco
EXEC sp_addlinkedserver
    @server = 'ServidorCopa',
    @srvproduct = 'Excel', 
    @provider = 'Microsoft.ACE.OLEDB.12.0',
    @datasrc = 'C:\Users\Harlan\Desktop\Copa.xlsx',
    @provstr = 'Excel 12.0;IMEX=1;HDR=YES;'
GO

--Destruindo a conexao com a planilha criada 
--EXEC sp_dropserver
--    @server = N'ServidorCopa',
--    @droplogins='droplogins'
--GO

--Consulta de teste da conexao
SELECT distinct Selecao FROM OPENQUERY(ServidorCopa, 'SELECT * FROM [Plan2$]')