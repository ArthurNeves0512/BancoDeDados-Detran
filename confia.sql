create database bddetran
default character set utf8
default collate utf8_general_ci;

use bddetran;

create table infracao (
valor_cobrado decimal(5,2),
velocidade_aferida decimal(5,2),
codigo_associado integer(8) not null,
matricula integer(10) not null,
nome varchar(20)not null,
tempo_servico integer(2),
data_contatracao date,
velocidade_permitida integer(3),
posicao_geografica varchar(45),
data_hora datetime not null,
cod_do_local integer(8)not null,
primary key(matricula,codigo_associado,cod_do_local,data_hora)
)default charset utf8;


create table veiculo(
modelo varchar(30) not null,
cor varchar(10) not null,
chassi varchar(17) not null ,
placa varchar(7) not null ,
categoria varchar(20) not null, 
ano_fabricacao date not null, 
cpf_proprietario integer(11) not null,
primary key(placa, chassi) 
)default charset utf8;

create table proprietario(
cpf integer(11) not null,
nome varchar(27) not null,
sexo varchar(1) not null,
data_nascimento datetime not null, 
telefone integer(15) not null,
bairro varchar(40) not null,
cidade varchar(40) not null,
estado varchar(40) not null,
veiculproprietarioproprietarioo_placa varchar(7) not null unique,
veiculo_chassi varchar(17) not null unique,
primary key(cpf)
)default charset utf8;
alter table proprietario
modify data_nascimento date;


create table telefone
(cpf_proprietario integer(11) ,
telefone_proprietario varchar(14)
)default charset utf8;

alter table telefone
add foreign key(cpf_proprietario) references proprietario(cpf);


alter table infracao
add foreign key (chassi_veiculo,placa_veiculo) references veiculo(chassi,placa);

alter table veiculo
add foreign key(cpf_proprietario) references proprietario(cpf);



create table veiculo_infracao(
placa_veiculo varchar(7) not null,
chassi_veiculo varchar(17) not null,
matricula_agente_infracao integer(10) not null,
codigo_associado_infracao integer(8) not null,
cod_local_infracao integer(8) not null,
data_hora_infracao datetime not null
)default charset utf8;

alter table veiculo_infracao
add foreign key (placa_veiculo, chassi_veiculo) references veiculo(placa, chassi);

alter table veiculo_infracao
add foreign key(matricula_agente_infracao, codigo_associado_infracao, cod_local_infracao, data_hora_infracao) references infracao(matricula, codigo_associado, cod_do_local, data_hora);


/*
inserindo 3 elementos 

*/


insert into telefone values(321567908, 5561976568765),(321567908, 5561974563013),(331543143, 5561940028922) ;

insert into proprietario values
(678546879, "arthur", "m", "1882-2-1",3213321,"eunície barbosa","salgado de são felix","paraíba", "dsai312", "321mijiseer"),
(321567908, "roberto", "m", "2020-2-20",3254321,"coxas de asa","boa braba","goiás", "dhi5412", "321mi54bseer"),
(331543143, "arnold", "m", "1994-4-3",2136542,"samba","fuxico","pará", "ds23i32", "304mijiseer");


insert into infracao values
(12,32,321,90453,"jośe", 21,"2019-3-2", 60,"2132 786","2021-12-18 13:17:17", 323),
(43,65,123,35313,"marcos", 21,"2016-4-2", 40,"1232 43232","2019-12-18 14:17:17", 313),
(67,30,654,53353,"oswaldo", 21,"2015-6-2", 80,"2131 333","2018-12-18 15:17:17", 343);

insert into veiculo values
("gol", "preto","321mijiseer","dsai312","b","2015-02-18", 678546879),
("palio", "azul","321mi54bseer","dhi5412","b","2013-02-18", 321567908),
("classic", "branco","304mijiseer","ds23i32","b","2015-06-18", 331543143);

insert into veiculo_infracao values("dhi5412", "321mi54bseer", 35313, 123, 313, "2019-12-18 14:17:17");
insert into veiculo_infracao values("ds23i32", "304mijiseer", 90453, 321, 323, "2021-12-18 13:17:17");
insert into veiculo_infracao values("dsai312", "321mijiseer", 53353, 654, 343, "2018-12-18 15:17:17");


/*
aqui vc encontra os updates:
*/

update infracao
set nome ="ronaldo" where matricula = 321;
update proprietario
set nome = "mario" where cpf = 321567908;
update veiculo
set cor = "ciano" where chassi = "304mijiseer" and placa ="ds23i32";


/*
APAGANDO REGISTROS 

*/
delete from veiculo_infracao where chassi_veiculo ="321mi54bseer" and placa_veiculo ="dhi5412";
delete from veiculo where chassi ="321mi54bseer" and placa ="dhi5412";

delete from proprietario where cpf =321567908;

delete from telefone where cpf_proprietario =321567908;


/*

fazendo a busca 

*/
select *from veiculo where chassi ="304mijiseer" and placa = "ds23i32";
select *from veiculo where chassi ="321mijiseer" and placa = "dsai312";
select * from infracao, veiculo_infracao where infracao.codigo_associado= veiculo_infracao.codigo_associado_infracao;
select cpf from proprietario where cidade = "boa braba"; 
select telefone_proprietario from telefone where cpf_proprietario = 321567908; 