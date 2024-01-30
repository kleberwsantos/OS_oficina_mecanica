create database OS_Mecanica;

use OS_Mecanica;


CREATE TABLE Cliente (
    ID_Cliente int auto_increment primary key,
    Nome varchar(20) not null,
    Sobrenome varchar(30),
    Telefone varchar(15) not null,
    Endereco varchar(255)
);

-- ALTER table Veiculo
-- MODIFY Placa varchar(11);
CREATE TABLE Veiculo (
    ID_Veiculo int auto_increment primary key,
    Modelo varchar(50) not null,
    Ano int,
    Placa char(7) not null,
    ID_Cliente int,
    foreign key (ID_Cliente) references Cliente(ID_Cliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE Mecanico (
    ID_Mecanico int auto_increment primary key,
    Nome varchar(20) not null,
    Sobrenome varchar(30),
    Especialidade varchar(50) not null,
    Endereco varchar(255) not null,
    Telefone varchar(20) not null
);

CREATE TABLE Equipe (
    ID_Equipe int auto_increment primary key
);

CREATE TABLE Equipe_Mecanico (
    ID_Equipe int,
    ID_Mecanico int,
    primary key (ID_Equipe, ID_Mecanico),
    foreign key (ID_Equipe) references Equipe(ID_Equipe),
    foreign key (ID_Mecanico) references Mecanico(ID_Mecanico)
);

CREATE TABLE Peca (
    ID_Peca int auto_increment primary key,
    Nome varchar(50) not null,
    Preco decimal(10, 2)
);

CREATE TABLE Tabela_Ref (
    ID_Tabela_Ref int auto_increment primary key,
    Nome varchar(50) not null,
    Descricao varchar(255), 
    Valor_hora decimal(10, 2)
);

CREATE TABLE Servico (
    ID_Servico int auto_increment primary key,
    Descricao varchar(255),
    Valor decimal(10, 2),
    ID_Peca int,
    ID_Tabela_Ref int,
    foreign key (ID_Peca) references Peca(ID_Peca),
    foreign key (ID_Tabela_Ref) references Tabela_Ref(ID_Tabela_Ref)
);

CREATE TABLE Ordem_Servico (
    ID_Ordem int auto_increment primary key,
    Data_emissao DATE not null,
    Data_conclusao DATE not null,
    Autorizado bool,
    Valor decimal(10, 2),
    Valor_total decimal(10, 2),
    OsStatus enum('Aberto', 'Em Progresso', 'Concluído') default('Aberto'), 
    ID_Veiculo int,
    ID_Servico int,
    ID_Equipe int,
    foreign key (ID_Veiculo) references Veiculo(ID_Veiculo),
    foreign key (ID_Servico) references Servico(ID_Servico),
    foreign key (ID_Equipe) references Equipe(ID_Equipe)
);

-- Inserindo clientes
INSERT INTO Cliente (Nome, Sobrenome, Telefone, Endereco) VALUES
('João', 'Silva', '123-456-7890', 'Rua das Flores, 123, Brasília, DF'),
('Maria', 'Santos', '234-567-8901', 'Avenida das Árvores, 456, Brasília, DF'),
('Carlos', 'Pereira', '345-678-9012', 'Praça dos Pássaros, 789, Brasília, DF'),
('Ana', 'Ferreira', '456-789-0123', 'Alameda dos Anjos, 012, Brasília, DF'),
('Pedro', 'Rocha', '567-890-1234', 'Boulevard dos Sonhos, 345, Brasília, DF');

-- Recuperações simples com SELECT Statement:
SELECT * FROM Cliente;

-- Expressões para gerar atributos derivados:
SELECT Nome, Sobrenome, CONCAT(Nome, ' ', Sobrenome) AS NomeCompleto FROM Cliente;

-- Condições de filtros aos grupos – HAVING Statement:
SELECT ID_Cliente, COUNT(*) FROM Veiculo GROUP BY ID_Cliente HAVING COUNT(*) > 1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:
SELECT Cliente.Nome, Veiculo.Modelo FROM Cliente INNER JOIN Veiculo ON Cliente.ID_Cliente = Veiculo.ID_Cliente;

-- Inserindo veículos
INSERT INTO Veiculo (Modelo, Ano, Placa, ID_Cliente) VALUES
('Fiat Uno', 2010, 'ABC-1234', 1),
('Chevrolet Onix', 2015, 'DEF-5678', 2),
('Volkswagen Gol', 2012, 'GHI-9012', 3),
('Ford Ka', 2019, 'JKL-3456', 4),
('Hyundai HB20', 2020, 'MNO-7890', 5);

-- Inserindo mecânicos
INSERT INTO Mecanico (Nome, Sobrenome, Especialidade, Endereco, Telefone) VALUES
('Carlos', 'Santos', 'Motor', 'Avenida das Árvores, 456, Brasília, DF', '098-765-4321'),
('Roberto', 'Oliveira', 'Freios', 'Rua das Pedras, 678, Brasília, DF', '987-654-3210'),
('Patrícia', 'Melo', 'Suspensão', 'Alameda dos Rios, 901, Brasília, DF', '876-543-2109'),
('Lucas', 'Costa', 'Elétrica', 'Praça dos Ventos, 234, Brasília, DF', '765-432-1098'),
('Juliana', 'Barros', 'Pneus', 'Boulevard dos Mares, 567, Brasília, DF', '654-321-0987');

-- Filtros com WHERE Statement:
SELECT * FROM Mecanico WHERE Sobrenome = 'Barros';

-- Defina ordenações dos dados com ORDER BY:
SELECT * FROM Mecanico ORDER BY Especialidade;

-- Inserindo equipes
INSERT INTO Equipe () VALUES
(),
(),
(),
(),
();

-- Inserindo equipe-mecânico
INSERT INTO Equipe_Mecanico (ID_Equipe, ID_Mecanico) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo peças
INSERT INTO Peca (Nome, Preco) VALUES
('Filtro de óleo', 30.00),
('Pastilhas de freio', 50.00),
('Amortecedor', 200.00),
('Bateria', 400.00),
('Pneu', 250.00);

-- Inserindo referências de tabela
INSERT INTO Tabela_Ref (Nome, Descricao, Valor_hora) VALUES
('Serviço de troca de óleo', 'Troca de óleo do motor', 50.00),
('Serviço de troca de freios', 'Troca das pastilhas de freio', 70.00),
('Serviço de troca de suspensão', 'Troca dos amortecedores', 100.00),
('Serviço de troca de bateria', 'Troca da bateria do veículo', 60.00),
('Serviço de troca de pneus', 'Troca dos pneus do veículo', 80.00);

-- Inserindo serviços
INSERT INTO Servico (Descricao, Valor, ID_Peca, ID_Tabela_Ref) VALUES
('Troca de óleo do motor', 80.00, 1, 1),
('Troca das pastilhas de freio', 120.00, 2, 2),
('Troca dos amortecedores', 300.00, 3, 3),
('Troca da bateria do veículo', 460.00, 4, 4),
('Troca dos pneus do veículo', 330.00, 5, 5);

-- Inserindo ordens de serviço
INSERT INTO Ordem_Servico (Data_emissao, Data_conclusao, Autorizado, Valor, Valor_total, OsStatus, ID_Veiculo, ID_Servico, ID_Equipe) VALUES
('2024-01-30', '2024-02-05', true, 80.00, 80.00, 'Aberto', 1, 1, 1),
('2024-02-01', '2024-02-06', true, 120.00, 120.00, 'Aberto', 2, 2, 2),
('2024-02-02', '2024-02-07', true, 300.00, 300.00, 'Aberto', 3, 3, 3),
('2024-02-03', '2024-02-08', true, 460.00, 460.00, 'Aberto', 4, 4, 4),
('2024-02-04', '2024-02-09', true, 330.00, 330.00, 'Aberto', 5, 5, 5);


show databases;

show tables;