use oficina;

-- Relação de Mecânicos por especialidade:
select concat(primeiroNome, ' ', inicialNomeMeio, ' ', sobrenome) as Nome_Completo_Mecânico, especialidade
from mecanico;


-- Calculando o valor das peças vendidas por ordem de serviço:
select od_idOrdemServico as id_Ordem_Serviço, round(sum(valorPeca),2) as Valor_Total
from peca
group by od_idOrdemServico;


-- Calculando o valor e o tipo dos serviços por ordem de serviço:
select od_idOrdemServico, tipoServico as Tipo_Serviço, sum(valorServico) as Somatória
from servico
group by od_idOrdemServico;


-- Calculando o valor ganho com revisões periódicas:
select tipoServico as Tipo_Serviço, sum(valorServico) as Somatória
from servico
group by tipoServico
having tipoServico = 'Revisão Periódica';


-- Calculando o valor ganho com consertos:
select tipoServico as Tipo_Serviço, sum(valorServico) as Somatória
from servico
group by tipoServico
having tipoServico = 'Conserto';


-- Calculando o valor total dos serviços e peças vendidos:
select sum(valorServico) as Somatória_Serviços, round(sum(valorPeca),2) as Somatória_Peças
from servico, peca
where idServico = idPeca;


-- Calculando o valor total das ordens de serviço:
select round(sum(valorServico + valorPeca),2) as Somatória_OS
from servico, peca
where idServico = idPeca;


-- Relação de veículos por cliente:
select concat(primeiroNome, ' ', inicialNomeMeio, ' ', sobrenome) as Nome_Completo, modelo as Modelo_Veículo, montadora as Montadora,
case when numeroRodas >= 10 then 'Caminhão'
	 when numeroRodas >= 4 then 'Carro'
     else 'Moto'
     end as Tipo_Veículo
from cliente inner join veiculo on idCliente = cliente_idCliente
group by idVeiculo;


-- Número de veiculos por montadora:
select montadora as Montadora, count(*) as Nº_Veículos
from veiculo
group by montadora
order by montadora;


-- Contagem do tipo dos veículos na oficina:
select count(*) as Contagem,
case when numeroRodas >= 10 then 'Caminhão'
	 when numeroRodas >= 4 then 'Carro'
     else 'Moto'
     end as Tipo_Veículo
from cliente inner join veiculo on idCliente = cliente_idCliente
group by Tipo_Veículo;
