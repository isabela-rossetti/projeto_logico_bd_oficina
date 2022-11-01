-- drop database oficina;
create database oficina;
use oficina;

-- Criando tabela Cliente:
create table cliente(
	idCliente int auto_increment primary key,
    primeiroNome varchar(45) not null,
    inicialNomeMeio varchar(3),
    sobrenome varchar(45) not null,
    endereco varchar(100) not null,
    telefone char(11) not null,
    email varchar(45),
    cpf_cnpj char(15) not null,
    dataNascimento date,
    constraint cpf_cnpj_cliente unique (cpf_cnpj)
);
 alter table cliente auto_increment=1;
 
 -- Criando tabela Veículo:
 create table veiculo(
	idVeiculo int auto_increment primary key,
    placa varchar(7) not null,
    cor varchar(45) not null,
    modelo varchar(45) not null,
    montadora varchar(45),
    tipoCombustivel enum('Gasolina','Etanol','Óleo Diesel','Flex') not null,
    numeroRodas int not null,
    cliente_idCliente int not null,
    constraint placa_veiculo unique (placa),
    constraint fk_veiculo_cliente foreign key (cliente_idCliente) references cliente (idCliente)
);
alter table veiculo auto_increment=1;
    
 -- Criando tabela Mecânico:
 create table mecanico(
	idMecanico int auto_increment primary key,
    cpfMecanico char(11) not null,
    primeiroNome varchar(45) not null,
    inicialNomeMeio varchar(3),
    sobrenome varchar(45) not null,
    endereco varchar(100),
    especialidade enum('Carro','Moto','Caminhão') not null,
    constraint cpf_mecanico unique (cpfMecanico)
);
alter table mecanico auto_increment=1;

 -- Criando tabela Ordem de Serviço:
 create table ordem_servico(
	idOrdemServico int auto_increment primary key,
    dataEmissaoOD date not null,
    statusOD enum('Aguardando confirmação', 'Em andamento', 'Concluído') not null default 'Aguardando confirmação',
    dataConclusaoOD date not null
);
alter table ordem_servico auto_increment=1;

-- Criando tabela Peça:
create table peca(
	idPeca int auto_increment primary key,
    descricaoPeca varchar(45) not null,
    valorPeca float not null,
    od_idOrdemServico int not null,
    constraint fk_peca_od foreign key (od_idOrdemServico) references ordem_servico (idOrdemServico) on update cascade
);
alter table peca auto_increment=1;

-- Criando tabela Serviço:
create table servico(
	idServico int auto_increment primary key,
    tipoServico enum('Conserto','Revisão Periódica'),
    valorServico float not null,
    od_idOrdemServico int not null,
    constraint fk_servico_od foreign key (od_idOrdemServico) references ordem_servico (idOrdemServico) on update cascade
);
alter table servico auto_increment=1;

-- Criando tabela Equipe - Mecânico:
create table equipe_mecanico(
	mecanico_idMecanico int,
    veiculo_idVeiculo int,
    servico_idServico int,
    primary key (mecanico_idMecanico, veiculo_idVeiculo, servico_idServico),
    constraint fk_equipe_mecanico_mecanico foreign key (mecanico_idMecanico) references mecanico (idMecanico) on update cascade,
    constraint fk_equipe_mecanico_veiculo foreign key (veiculo_idVeiculo) references veiculo (idVeiculo) on update cascade,
    constraint fk_equipe_mecanico_servico foreign key (servico_idServico) references servico (idServico) on update cascade
);

show tables;