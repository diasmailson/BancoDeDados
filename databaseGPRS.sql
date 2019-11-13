create database gprs;
use gprs;
-- show tables; mostra as tabelas criadas.


-- TABELAS DE CADASTRO GERADOR
create table Gerador(
idGerador int auto_increment,
CNPJ varchar(20) not null,
razaoSocial varchar(100) not null,
primary key(idGerador));

create table QtdFunc(
idGerador int,
idFunc int auto_increment,
FuncProp varchar(10),
FuncTerc varchar(10),
primary key (idFunc),
constraint pk_Ger_Func foreign key(idGerador) references Gerador(idGerador)); -- // para chave estrangeira

create table contatoGerador(
idGerador int,
idContato int auto_increment,
Telefone varchar(20) not null, 
Email varchar(50) not null,
Fax varchar(20) null,
primary key(idContato),
constraint pk_Gerador_contato foreign key(idGerador) references Gerador(idGerador));

create table enderecoGerador(
idGerador int,
idEnd int auto_increment not null,
rua varchar(50) not null,
numero varchar(10) not null,
cep varchar(15) not null,
bairro varchar(40) not null,
cidade varchar(40) not null,
uf char(2) not null,
primary key(idEnd),
constraint pk_Gerador_end foreign key(idGerador) references Gerador(idGerador));

create table responsavelTec(
idGerador int,
idrespTec int auto_increment,
descricaoAtv varchar(100),
primary key(idrespTec),
constraint pk_Gerador_rspTec foreign key(idGerador) references Gerador(idGerador));

create table respTecElab(
idrespTec int,
respTecElab int auto_increment,
primary key(respTecElab),
constraint pk_respTec_Elab foreign key(idrespTec) references responsavelTec(idrespTec));

create table respTecExec(
idrespTec int,
respTecExec int auto_increment,
primary key(respTecExec),
constraint pk_respTec_Exec foreign key(idrespTec) references responsavelTec(idrespTec));

create table contatoRespTec(
idrespTec int,
idContato int auto_increment,
email varchar(30),
telefone varchar(20),
primary key(idContatO),
constraint pk_respTec_Contato foreign key(idrespTec) references responsavelTec(idrespTec));

create table areaGerador(
idGerador int,
idArea int auto_increment,
areaTotal varchar(15),
areaConstruida varchar(15),
areaExpansao varchar(15),
dataCadastro date,
primary key(idArea),
constraint pk_Gerador_area foreign key(idGerador) references Gerador(idGerador));


-- TABELAS INVENTARIO/RESIDUO Q SE CONECTA A TBL GERADOR
create table inventarioResiduo(
idGerador int,
idInvRes int auto_increment,
dataColeta date,
freqGeracao varchar(100),
quantidade varchar(30),
acondicionamento varchar(300), -- Lista puxando informações
transporteExt varchar(300), -- descrição de como acontece o transporte
armazenamento varchar(300), -- descrição da armaz. do residuo
primary key(idInvRes),
constraint pk_Gerador_InvRes foreign key(idGerador) references Gerador(idGerador));

create table undEquip(
idInvRes int,
idUndEquip int auto_increment,
nomeUndEquip varchar(300),
primary key(idUndEquip),
constraint pk_InvRes_undEqp foreign key(idInvRes) references inventarioResiduo(idInvRes));

create table residuo(
idInvRes int,
idResid int auto_increment,
nomeRes varchar(100),
primary key(idResid),
constraint pk_InvRes_residuo foreign key(idInvRes) references inventarioResiduo(idInvRes));

create table norma(
idInvRes int,
idNorma int auto_increment,
nomeNorma varchar(100),
primary key(idNorma),
constraint pk_InvRes_norma foreign key(idInvRes) references inventarioResiduo(idInvRes));

create table classeGp(
idInvRes int,
idClasseGp int auto_increment,
nomeClasseGp varchar(100),
primary key(idClasseGp),
constraint pk_InvRes_classeGp foreign key(idInvRes) references inventarioResiduo(idInvRes));

create table acond(
idInvRes int,
idAcond int auto_increment,
codigoAcond varchar(5),
nomeAcond varchar(100),
primary key(idAcond),
constraint pk_InvRes_Acond foreign key(idInvRes) references inventarioResiduo(idInvRes));

create table destinacao(
idInvRes int,
idDestinacao int auto_increment,
tipoDestino varchar(300),
primary key (idDestinacao),
constraint pk_Invent_destinacao foreign key(idInvRes) references inventarioResiduo(idInvRes));

-- PLANO MOVIMENTAÇÃO RESIDUOS - Tbl 3

create table planMov(
idGerador int,
idPlanMov int auto_increment,
frequencia varchar(100),
residuo varchar(100),
quantidade varchar(30),
classe varchar(50),
primary key(idPlanMov),
constraint pk_DetInv foreign key(idGerador) references Gerador(idGerador));

create table estocTemp(
idPlanMov int,
idEstocTemp int auto_increment,
localEstoc varchar(300),
primary key(idEstocTemp),
constraint pk_PlanMov_Estoc foreign key(idPlanMov) references planMov(idPlanMov));

create table destFin(
idPlanMov int,
idDestFin int auto_increment,
destinoFinal varchar(300),
primary key(idDestFin),
constraint pk_PlanMov_Estoc foreign key(idPlanMov) references detInv(idPlanMov));
 
 
-- TBL 6 - EMPRESAS PRESTADORAS DE SERVIÇOS
-- * saber a que tabela está ligada.

drop table EmpServ;
create table EmpServ(
idEmpServ int auto_increment,
cnpj varchar(20) not null,
Telefone varchar(20) not null, 
Fax varchar(20) null,
primary key(idEmpServ));

create table EndEmpServ(
idEmpServ int,
idEndEmpServ int auto_increment,
rua varchar(50) not null,
numero varchar(10) not null,
cep varchar(15) not null,
bairro varchar(50) not null,
cidade varchar(50) not null,
uf char(2) not null,
primary key(idEndEmpServ),
constraint fk_EmpServ_end foreign key(idEmpServ) references EmpServ(idEmpServ));







