use detran;
create table veiculo(cor varchar(10) not null,
chassi varchar(17) not null unique,
placa varchar(7) primary key not null,
categoria varchar(20) not null, 
ano_fabricacao integer(4) not null, 
proprietario_cpf integer(11) not null);


create table proprietario(
cpf integer(11) primary key not null,
nome varchar(27) not null,
sexo varchar(1) not null,
data_nascimento datetime not null, 
telefone integer(15) not null,
bairro varchar(40)

);

create table infracao(
valor_cobrado decimal(3,2) not null,
velocidade_aferida integer(3) not null,
codigo_associado integer(8) primary key,
matricula integer(10) not null,
infracaocol integer(10) not null,
data_hora datetime not null
);
