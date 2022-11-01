use oficina;
show tables;

-- Inserindo dados na tabela Cliente:
desc cliente;
insert into cliente (primeiroNome, inicialNomeMeio, sobrenome, endereco, telefone, cpf_cnpj) 
			values ('José', 'M', 'Silva', 'Rua um, nº30, Centro, Araraquara, SP', '16998756811', '12345678912'),
				   ('João', 'P', 'Souza', 'Rua dois, nº450, São José, Araraquara, SP', '16997856322', '23456789123'),
                   ('Maria', 'E', 'Oliveira', 'Rua três, nº50, Biagioni, Araraquara, SP', '16998565833', '34567891234'),
                   ('Pedro', 'J', 'Assis', 'Rua quatro, nº9, Vila Harmonia, Araraquara, SP', '16997035444', '45678912345'),
                   ('Rosa', 'A', 'França', 'Rua cinco, nº63, Santana, Araraquara, SP', '16998821555', '56789123456'),
                   ('Henrique', 'F', 'Assis', 'Rua seis, nº74, Centro, Araraquara, SP', '16998413766', '67891234567');
select * from cliente;

-- Inserindo dados na tabela Veículo:
desc veiculo;
insert into veiculo (cliente_idCliente, placa, cor, modelo, montadora, tipoCombustivel, numeroRodas) -- tipoCombustivel: Gasolina, Etanol, Flex, Óleo Diesel
			 values (1, 'ABC1234', 'Preto', 'Montana', 'Chevrolet', 'Flex', '4'),
					(2, 'BCD2345', 'Vermelho', 'CG', 'Honda', 'Gasolina', '2'),
                    (2, 'CDE3456', 'Vermelho', 'Corsa', 'Chevrolet', 'Etanol', '4'),
                    (3, 'DEF4567', 'Prata', 'HB20', 'Hyundai', 'Flex', '4'),
                    (4, 'EFG5678', 'Azul', 'Volvo', 'Volvo', 'Óleo Diesel', '10'),
                    (5, 'FGH6789', 'Preto', 'Falcon', 'Honda', 'Gasolina', '2'),
                    (5, 'HIJ0123', 'Prata', 'Renegade', 'Jeep', 'Flex', '4'),
                    (6,'IJK9876', 'Prata', 'Etios', 'Toyota', 'Flex', '4');
select * from veiculo;

-- Inserindo dados na tabela Mecânico:
desc mecanico;
insert into mecanico (cpfMecanico, primeiroNome, inicialNomeMeio, sobrenome, especialidade) -- especialidade: carro, moto, caminhão
			  values ('98765432198', 'Jorge', 'Ap', 'Amaral', 'Carro'),
					 ('87654321987', 'Fernando', 'G', 'Pimentel', 'Moto'),
					 ('76543219876', 'Ulisses', 'E', 'Cruz', 'Caminhão'),
					 ('65432198765', 'Enxo', 'A', 'Silva', 'Carro');
select * from mecanico;
					  
-- Inserindo dados na tabela Ordem de serviço:
desc ordem_servico;
insert into ordem_servico (dataEmissaoOD, statusOD, dataConclusaoOD) -- status: aguardando confirmação, em andamento, concluído
				   values ('2022-10-01', 'Concluído', '2022-10-11'),
                          ('2022-10-10', 'Concluído', '2022-10-20'),
                          ('2022-10-10', 'Concluído', '2022-10-20'),
                          ('2022-10-10', 'Concluído', '2022-10-20'),
                          ('2022-10-15', 'Em andamento', '2022-10-25'),
                          ('2022-10-15', 'Em andamento', '2022-10-25'),
                          ('2022-10-29', 'Aguardando confirmação', '2022-11-09'),
                          ('2022-10-29', 'Aguardando confirmação', '2022-11-09');
select * from ordem_servico;
              
-- Inserindo dados na tabela Peça:
desc peca;
insert into peca (od_idOrdemServico, descricaoPeca, valorPeca)
		  values (1, 'Espelho Retrovisor', 256.99),
                 (1, 'Correia Dentada', 315.99),
                 (2, 'Vela', 20.95),
                 (3, 'Carburador', 750.99),
                 (3, 'Lanterna traseira', 285.99),
                 (4, 'Bateria', 210.99),
                 (4, 'Farol', 175.99),
                 (4, 'Rolamento do câmbio', 587.99);
select * from peca;

              
-- Inserindo dados na tabela Serviço:
desc servico;
insert into servico (od_idOrdemServico, tipoServico, valorServico)
		     values (1, 'Conserto', 1250.00),
                    (2, 'Conserto', 120.00),
                    (3, 'Conserto', 150.00),
                    (4, 'Conserto', 1500.00),
                    (5, 'Revisão Periódica', 350.00),
                    (6, 'Revisão Periódica', 350.00),
                    (7, 'Revisão Periódica', 350.00),
                    (8, 'Revisão Periódica', 350.00);
select * from servico;

-- Inserindo dados na tabela Equipe - Mecânico:
desc equipe_mecanico;
insert into equipe_mecanico (mecanico_idMecanico, veiculo_idVeiculo, servico_idServico)
					 values (1, 1, 1),
                            (1, 3, 2),
                            (4, 4, 3),
                            (4, 7, 4),
                            (4, 8, 5),
                            (2, 2, 6),
                            (2, 6, 7),
                            (3, 5, 8);
select * from equipe_mecanico;











              