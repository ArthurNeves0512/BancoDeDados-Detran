create database detran;

use detran;

create table veiculo(
cor varchar(10) not null,
chassi varchar(17) not null unique,
placa varchar(7) not null,
categoria varchar(20) not null, 
ano_fabricacao integer(4) not null, 
proprietario_cpf integer(11) not null,
primary key(placa, chassi), /*declaracao correta de primary key?*/
foreign key(proprietario_cpf) /*como declara foreign key caraio?*/

);


create table proprietario(
cpf integer(11) not null,
nome varchar(27) not null,
sexo varchar(1) not null,
data_nascimento datetime not null, 
telefone integer(15) not null,
bairro varchar(40),
veiculo_placa varchar(7) not null unique,
veiculo_chassi varchar(45) not null unique,
primary key(cpf),
foreign key(veiculo_placa,veiculo_chassi)

);

create table infracao(
valor_cobrado decimal(3,2) not null,
velocidade_aferida integer(3) not null,
codigo_associado integer(8),
matricula integer(10) not null,
infracaocol integer(10) not null,
data_hora datetime not null,
primary key(matricula,codigo_associado,codigo_local,data_hora)
);

create table veiculo_infracao(
select * from veiculo,infracao where veiculo.placa=infracao.codigo_associado
)
