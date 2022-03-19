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
velocidade_permitida integer(2),
posicao_geografica point,
data_hora datetime not null,
cod_do_local integer(8)not null,
chassi_veiculo varchar(17) not null unique,
placa_veiculo varchar(7) not null unique,
primary key(matricula,codigo_associado,cod_do_local,data_hora)
)default charset utf8;


create table veiculo(
modelo varchar(30) not null,
cor varchar(10) not null,
chassi varchar(17) not null unique,
placa varchar(7) not null unique,
categoria varchar(20) not null, 
ano_fabricacao date not null, 
cpf_proprietario integer(11) not null,
matricula_agente_infracao integer(10) not null,
codigo_associado_infracao integer(8) not null,
cod_do_local_infracao integer(8) not null,
data_hora_infracao datetime not null,
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
veiculo_placa varchar(7) not null unique,
veiculo_chassi varchar(17) not null unique,
primary key(cpf)
)default charset utf8;
alter table proprietario
modify data_nascimento date;
create table telefone(
proprietario_cpf integer(11) not null,
foreign key(proprietario_cpf) references proprietario(cpf)
);


alter table infracao
add foreign key (chassi_veiculo,placa_veiculo) references veiculo(chassi,placa);

alter table veiculo
add foreign key(cpf_proprietario) references proprietario(cpf), /*como declara foreign key caraio?*/
add foreign key(matricula_agente_infracao,codigo_associado_infracao,cod_do_local_infracao,data_hora_infracao) references infracao(matricula,codigo_associado,cod_do_local,data_hora);

create table veiculo_infracao(
select * from veiculo,infracao where veiculo.placa=infracao.codigo_associado and veiculo.placa=infracao.codigo
);





/*    AQUI TA OS COMANDOS PARA INSERIR EM CADA TABELA, DEPOIS É SÓ TU RODAR RLX SÓ ESTÁ FALTANDO O DO POINT ALI NA TABELA INFRACAO

insert into proprietario values
(67854687913, "arthur', m, 1882-2-1,3213321,"eunície barbosa","salgado de são felix","paraíba", "dsai312", "321mijiseer"),
(32156790812, "roberto', m, 2020-2-20,3254321,"coxas de asa","boa braba","goiás", "dhi5412", "321mi54bseer"),
(33154314332, "arnold', m, 1994-4-3,2136542,"samba","fuxico","pará", "ds23i32", "321mijiseer");

insert into infracao values
(12,32,321,90453,"jośe", 21,2019-3-2, 60,###colocar o point nao sei como funciona,'2021-12-18 13:17:17', 323,"321mijiseer", "dsai312"),
(43,65,123,35313,"marcos", 21,2016-4-2, 40,###colocar o point nao sei como funciona,'2019-12-18 14:17:17', 313,"321mi54bseer", "dhi5412"),
(67,30,654,53353,"oswaldo", 21,2015-6-2, 80,###colocar o point nao sei como funciona,'2018-12-18 15:17:17', 343,"321mijiseer", "ds23i32");

insert into veiculo values
("gol", "preto","321mijiseer","dsai312","b",2015-2-18, 67854687913,90453,321,323,'2021-12-18 13:17:17')
("palio", "azul","321mi54bseer","dhi5412","b",2013-2-18, 32156790812,35313,123,313,'2019-12-18 14:17:17')
("classic", "branco","321mijiseer","ds23i32","b",2015-6-18, 33154314332,53353,654,343,'2018-12-18 15:17:17')
*/

/*   AQUI TA OS COMANDOS PARA ATUALIZAÇÃO NO BANCO JÁ QUE SÃO SÓ 3 MESMO, ENTÃO TÁ SUAVE
update infracao
set nome ="ronaldo" where matricula = 321;
update infracao
set nome = "mario" where matricula = 123;
update infracao
set nome = "antonio" where matricula = 654;

*/

/*




*/
