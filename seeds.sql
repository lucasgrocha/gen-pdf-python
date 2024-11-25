DROP DATABASE IF EXISTS EMPRESA;

-- Create the EMPRESA database
CREATE DATABASE EMPRESA CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE EMPRESA;

CREATE TABLE FUNCIONARIO (
    party_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    nome_mae VARCHAR(100),
    nome_pai VARCHAR(100)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE CARGO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    party_id INT NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (party_id) REFERENCES FUNCIONARIO(party_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE ENDERECO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    party_id INT NOT NULL,
    rua VARCHAR(200) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    FOREIGN KEY (party_id) REFERENCES FUNCIONARIO(party_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;



INSERT INTO FUNCIONARIO (first_name, last_name, birthday, nome_mae, nome_pai) VALUES
('Maria', 'Silva', '1985-04-12', 'Ana Silva', 'Carlos Silva'),
('João', 'Santos', '1990-07-20', 'Beatriz Santos', 'José Santos'),
('Pedro', 'Oliveira', '1982-02-11', 'Lucia Oliveira', 'Antonio Oliveira'),
('Carla', 'Pereira', '1995-09-15', 'Fernanda Pereira', 'Eduardo Pereira'),
('Lucas', 'Costa', '1988-12-03', 'Paula Costa', 'Marco Costa'),
('Juliana', 'Martins', '1983-10-25', 'Elisabete Martins', 'Gustavo Martins'),
('Ricardo', 'Rodrigues', '1992-11-30', 'Sandra Rodrigues', 'João Rodrigues'),
('Tatiane', 'Almeida', '1994-03-18', 'Monique Almeida', 'Rogério Almeida'),
('Daniel', 'Lima', '1986-01-30', 'Claudia Lima', 'Paulo Lima'),
('Fernanda', 'Melo', '1990-06-17', 'Sueli Melo', 'Carlos Melo'),
('Andreia', 'Souza', '1993-08-22', 'Renata Souza', 'Antonio Souza'),
('Rafael', 'Nascimento', '1989-05-09', 'Aline Nascimento', 'Carlos Nascimento'),
('Isabela', 'Gomes', '1984-11-28', 'Cecilia Gomes', 'José Gomes'),
('Gabriel', 'Dias', '1991-02-14', 'Marcia Dias', 'Eduardo Dias'),
('Patrícia', 'Barbosa', '1996-04-23', 'Flavia Barbosa', 'Ricardo Barbosa'),
('Renato', 'Fernandes', '1987-06-30', 'Juliana Fernandes', 'Antonio Fernandes'),
('Larissa', 'Pinto', '1981-01-04', 'Marta Pinto', 'Carlos Pinto'),
('Leonardo', 'Carvalho', '1992-09-07', 'Ana Carvalho', 'Paulo Carvalho'),
('Bruna', 'Vieira', '1994-12-02', 'Cláudia Vieira', 'Fábio Vieira'),
('Fábio', 'Silveira', '1980-03-12', 'Lúcia Silveira', 'Ricardo Silveira'),
('Marcos', 'Campos', '1986-05-19', 'Sofia Campos', 'Paulo Campos'),
('Mariana', 'Fonseca', '1989-07-08', 'Eleni Fonseca', 'Rogério Fonseca'),
('Gustavo', 'Azevedo', '1995-09-11', 'Luciana Azevedo', 'Mário Azevedo'),
('Vera', 'Rocha', '1993-12-06', 'Rita Rocha', 'Ricardo Rocha'),
('Eduardo', 'Moreira', '1982-10-13', 'Flávia Moreira', 'Rogério Moreira'),
('Aline', 'Gonçalves', '1994-02-05', 'Cláudia Gonçalves', 'José Gonçalves'),
('César', 'Castro', '1990-01-25', 'Lúcia Castro', 'Carlos Castro'),
('Bruno', 'Cardoso', '1985-11-18', 'Fernanda Cardoso', 'Ricardo Cardoso'),
('Tatiane', 'Martins', '1990-03-08', 'Veronica Martins', 'Carlos Martins'),
('Lucas', 'Pereira', '1987-07-23', 'Miriam Pereira', 'Eduardo Pereira');

INSERT INTO CARGO (party_id, cargo, salario) VALUES
(1, 'Gerente', 6000.00),
(2, 'Assistente', 3000.00),
(3, 'Coordenador', 5000.00),
(4, 'Analista', 3500.00),
(5, 'Supervisor', 5500.00),
(6, 'Auxiliar', 2000.00),
(7, 'Assistente', 3000.00),
(8, 'Coordenador', 5000.00),
(9, 'Analista', 3500.00),
(10, 'Gerente', 6000.00),
(11, 'Supervisor', 5500.00),
(12, 'Analista', 3500.00),
(13, 'Coordenador', 5000.00),
(14, 'Assistente', 3000.00),
(15, 'Auxiliar', 2000.00),
(16, 'Gerente', 6000.00),
(17, 'Analista', 3500.00),
(18, 'Supervisor', 5500.00),
(19, 'Assistente', 3000.00),
(20, 'Coordenador', 5000.00),
(21, 'Analista', 3500.00),
(22, 'Supervisor', 5500.00),
(23, 'Auxiliar', 2000.00),
(24, 'Gerente', 6000.00),
(25, 'Assistente', 3000.00),
(26, 'Coordenador', 5000.00),
(27, 'Analista', 3500.00),
(28, 'Supervisor', 5500.00),
(29, 'Auxiliar', 2000.00),
(30, 'Gerente', 6000.00);

INSERT INTO ENDERECO (party_id, rua, bairro, numero, cep, cidade, estado, pais) VALUES
(1, 'Rua das Flores', 'Centro', '10', '12345-678', 'São Paulo', 'SP', 'Brasil'),
(2, 'Avenida Paulista', 'Jardim Paulista', '123', '98765-432', 'São Paulo', 'SP', 'Brasil'),
(3, 'Rua XV de Novembro', 'Centro', '45', '23456-789', 'Campinas', 'SP', 'Brasil'),
(4, 'Rua das Acácias', 'Vila Progresso', '56', '34567-890', 'São Paulo', 'SP', 'Brasil'),
(5, 'Rua das Laranjeiras', 'Lapa', '12', '45678-901', 'Rio de Janeiro', 'RJ', 'Brasil'),
(6, 'Avenida Rio Branco', 'Centro', '101', '56789-012', 'Rio de Janeiro', 'RJ', 'Brasil'),
(7, 'Rua dos Três Irmãos', 'Vila Nova', '32', '67890-123', 'São Paulo', 'SP', 'Brasil'),
(8, 'Rua das Palmeiras', 'Jardim América', '76', '78901-234', 'São Paulo', 'SP', 'Brasil'),
(9, 'Rua do Comercio', 'Vila Industrial', '89', '89012-345', 'São Bernardo do Campo', 'SP', 'Brasil'),
(10, 'Avenida Brasil', 'Bela Vista', '21', '90123-456', 'São Paulo', 'SP', 'Brasil'),
(11, 'Rua dos Jasmins', 'Centro', '67', '12345-678', 'Campinas', 'SP', 'Brasil'),
(12, 'Avenida Getúlio Vargas', 'Vila Mariana', '98', '23456-789', 'São Paulo', 'SP', 'Brasil'),
(13, 'Rua dos Girassóis', 'Vila Progresso', '120', '34567-890', 'São Paulo', 'SP', 'Brasil'),
(14, 'Rua das Orquídeas', 'Itaim Bibi', '55', '45678-901', 'São Paulo', 'SP', 'Brasil'),
(15, 'Avenida Brigadeiro Faria Lima', 'Pinheiros', '110', '56789-012', 'São Paulo', 'SP', 'Brasil'),
(16, 'Rua Santa Clara', 'Vila Moinho', '65', '67890-123', 'São Paulo', 'SP', 'Brasil'),
(17, 'Rua do Sol', 'Vila São João', '34', '78901-234', 'São Paulo', 'SP', 'Brasil'),
(18, 'Avenida dos Bandeirantes', 'Vila Clementino', '23', '89012-345', 'São Paulo', 'SP', 'Brasil'),
(19, 'Rua Marechal Deodoro', 'Vila Progresso', '15', '90123-456', 'São Bernardo do Campo', 'SP', 'Brasil'),
(20, 'Rua das Violetas', 'Bairro dos Estados', '66', '12345-678', 'Campinas', 'SP', 'Brasil'),
(21, 'Rua dos Eucaliptos', 'Bela Vista', '44', '23456-789', 'São Paulo', 'SP', 'Brasil'),
(22, 'Rua das Camélias', 'Vila São Paulo', '32', '34567-890', 'Rio de Janeiro', 'RJ', 'Brasil'),
(23, 'Avenida do Rio', 'Centro', '120', '45678-901', 'São Paulo', 'SP', 'Brasil'),
(24, 'Rua das Azaléias', 'Vila Jardim', '78', '56789-012', 'Campinas', 'SP', 'Brasil'),
(25, 'Rua do Ipê', 'Jardim das Flores', '59', '67890-123', 'São Paulo', 'SP', 'Brasil'),
(26, 'Avenida Afonso Pena', 'Vila Augusta', '10', '78901-234', 'São Paulo', 'SP', 'Brasil'),
(27, 'Rua do Cedro', 'Vila São José', '13', '89012-345', 'São Paulo', 'SP', 'Brasil'),
(28, 'Rua das Palmeiras', 'Vila Nova', '90', '90123-456', 'São Paulo', 'SP', 'Brasil'),
(29, 'Avenida Santo Amaro', 'Jardim Itapoa', '22', '12345-678', 'São Paulo', 'SP', 'Brasil'),
(30, 'Rua das Magnólias', 'Vila Maringá', '53', '23456-789', 'Campinas', 'SP', 'Brasil');
