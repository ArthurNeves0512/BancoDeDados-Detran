create database detran;

use detran;

create table veiculo(
modelo varchar(30) not null,
cor varchar(10) not null,
chassi varchar(17) not null unique,
placa varchar(7) not null,
categoria varchar(20) not null, 
ano_fabricacao integer(4) not null, 
cpf_proprietario integer(11) not null,
matricula_agente_infracao integer(10) not null,
codigo_associado_infracao integer(8) not null,
cod_do_local_infracao integer(8) not null,
data_hora_infracao datetime not null,
primary key(placa, chassi), /*declaracao correta de primary key?*/
foreign key(cpf_proprietario) references proprietario(cpf), /*como declara foreign key caraio?*/
foreign key(matricula_agente_infracao,codigo_associado_infracao,cod_do_local_infracao,data_hora_infracao) references infracao(matricula,codigo_associado,cod_do_local,data_hora)
);


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
veiculo_chassi varchar(45) not null unique,
primary key(cpf)

);

create table telefone(
proprietario_cpf integer(11) not null,
foreign key(proprietario_cpf) references proprietario(cpf)
);

create table infracao(
valor_cobrado decimal(3,2) not null,
velocidade_aferida integer(3) not null,
codigo_associado integer(8),
matricula integer(10) not null,
nome varchar(45) not null,
tempo_servico integer(3) not null,
data_contratacao datetime not null,
velocidade_permitida integer(3) not null,
posicao_geografica point,
data_hora datetime not null,
cod_do_local integer(8),
chassi_veiculo varchar(17) not null unique,
placa_veiculo varchar(7) not null,
primary key(matricula,codigo_associado,cod_do_local,data_hora),
foreign key (chassi_veiculo,placa_veiculo) references veiculo(chassi,placa)
);

/*pode ser que eu tenha feito umas cagadas na declaracao das chaves estrangeiras, mas eh porque o relacionamento era N:N, e eu ainda to confusa sobre a construcao de tabelas N:N*/

create table veiculo_infracao(
select * from veiculo,infracao where veiculo.placa=infracao.codigo_associado and veiculo.placa=infracao.codigo
);
