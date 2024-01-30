## Banco de Dados de Oficina Mecânica

Este banco de dados foi criado para gerenciar uma oficina mecânica. Ele contém várias tabelas que representam diferentes entidades em uma oficina mecânica,
como Cliente, Veiculo, Mecanico, Equipe, Peca, Tabela_Ref, Servico e Ordem_Servico.

O banco de dados, chamado OS_Mecanica, foi criado com o seguinte comando SQL:

CREATE DATABASE OS_Mecanica;

Após a criação do banco de dados, ele foi selecionado para uso com o comando:

USE OS_Mecanica;

Várias tabelas foram criadas para armazenar diferentes tipos de informações. Cada tabela foi criada com um comando CREATE TABLE,
seguido pelo nome da tabela e uma lista de colunas e seus respectivos tipos de dados. A tabela Cliente foi criada da seguinte forma:

CREATE TABLE Cliente (
    ID_Cliente int auto_increment primary key,
    Nome varchar(20) not null,
    Sobrenome varchar(30),
    Telefone varchar(15) not null,
    Endereco varchar(255)
);

As outras tabelas foram criadas de maneira semelhante. Algumas tabelas também incluem chaves estrangeiras para representar as relações entre as entidades.

Os dados foram inseridos nas tabelas usando o comando INSERT INTO. Os dados foram inseridos da seguinte formana na tabela Cliente:

INSERT INTO Cliente (Nome, Sobrenome, Telefone, Endereco) VALUES
('João', 'Silva', '123-456-7890', 'Rua das Flores, 123, Brasília, DF'),
('Maria', 'Santos', '234-567-8901', 'Avenida das Árvores, 456, Brasília, DF'),
('Carlos', 'Pereira', '345-678-9012', 'Praça dos Pássaros, 789, Brasília, DF'),
('Ana', 'Ferreira', '456-789-0123', 'Alameda dos Anjos, 012, Brasília, DF'),
('Pedro', 'Rocha', '567-890-1234', 'Boulevard dos Sonhos, 345, Brasília, DF');

Os dados foram inseridos nas outras tabelas de maneira semelhante.

Várias consultas SQL foram criadas para recuperar informações do banco de dados. Aqui estão alguns exemplos:

•	Recuperações simples com SELECT Statement:

SELECT * FROM Cliente;

•	Filtros com WHERE Statement:

SELECT * FROM Cliente WHERE Nome = 'João';

•	Crie expressões para gerar atributos derivados:

SELECT Nome, Sobrenome, CONCAT(Nome, ' ', Sobrenome) AS NomeCompleto FROM Cliente;

•	Defina ordenações dos dados com ORDER BY:

SELECT * FROM Cliente ORDER BY Nome;

•	Condições de filtros aos grupos – HAVING Statement:

SELECT ID_Cliente, COUNT(*) FROM Veiculo GROUP BY ID_Cliente HAVING COUNT(*) > 1;

•	Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:

SELECT Cliente.Nome, Veiculo.Modelo FROM Cliente INNER JOIN Veiculo ON Cliente.ID_Cliente = Veiculo.ID_Cliente;

Também foram feitos vários questionamentos para um melhor aproveitamento dos estudos sobre as queries, como por exemplo:

- Recuperações simples com SELECT Statement: Quais são todos os clientes que temos em nosso banco de dados?

- Filtros com WHERE Statement: Quais são os detalhes do cliente chamado ‘João’?

- Crie expressões para gerar atributos derivados: Qual é o nome completo de todos os nossos clientes?

- Defina ordenações dos dados com ORDER BY: Quem são todos os nossos clientes, ordenados por nome?

- Condições de filtros aos grupos – HAVING Statement: Quais clientes possuem mais de um veículo?

- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados: Quem são os proprietários de cada veículo que temos em nosso banco de dados?
