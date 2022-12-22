-- AULA 5. 2022.09.18

CREATE DATABASE bd_Mecanico;

USE bd_Mecanico;

-- DDL Criação de Tabelas
CREATE TABLE Cliente (
    CPF char(11) primary key not null,
    Nome varchar(255) not null,
    Telefone varchar(100),
    Endereco varchar(255)
);

CREATE TABLE Veiculo (
    Renavam char(11) primary key not null,
    Chassi varchar(255),
    Modelo varchar(100),
    Cor varchar(50),
    CPF char(11) not null,
    Foreign key (CPF) references Cliente (CPF)
);

CREATE TABLE Relato_Cliente (
    id_Relato int primary key auto_increment,
    Problema varchar(1000),
    Data_Ocorrencia date,
    Renavam char(11) not null,
    Foreign key (Renavam) references Veiculo (Renavam)
);

CREATE TABLE Servico (
    id_Servico int primary key auto_increment not null,
    Descricao varchar(1000),
    Custo varchar(20),
    Tempo_Realizacao varchar(20)
);

CREATE TABLE Produto (
    id_Produto int primary key auto_increment not null,
    Descricao varchar(1000),
    Custo varchar(20)
);

CREATE TABLE Orcamento (
    id_Orcamento int primary key auto_increment not null,
    Renavam char(11) not null,
    Situacao varchar(1000),
    Data_Orcamento date,
    Valor varchar(20),
    Forma_Pagamento varchar(50),
    Previsao_Entrega date,
    Foreign key (Renavam) references Veiculo (Renavam)
);

CREATE TABLE item_servico (
    id_Servico int not null,
    id_Orcamento int not null,
    Situacao varchar(1000),
    Custo varchar(20),
    Foreign key (id_Servico) references Servico (id_Servico),
    Foreign key (id_Orcamento) references Orcamento (id_Orcamento)
);

CREATE TABLE item_produto (
    id_Produto int not null,
    id_Orcamento int not null,
    Situacao varchar(1000),
    Quantidade varchar(3),
    Custo varchar(20),
    Foreign key (id_Produto) references Produto (id_Produto),
    Foreign key (id_Orcamento) references Orcamento (id_Orcamento)
);

-- Alterar Tabelas
ALTER TABLE Cliente
CHANGE COLUMN Nome Nome_Completo varchar(255);

ALTER TABLE Veiculo
ADD COLUMN Ano char(4);

-- DDL Exclusão de Tabelas
DROP TABLE item_produto, item_servico;
DROP TABLE Orcamento, Relato_Cliente, Veiculo;
DROP TABLE Produto, Servico, Cliente;
