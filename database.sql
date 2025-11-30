-- --- CRIAÇÃO DAS TABELAS (Para garantir que os INSERTS funcionem) ---
CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Laboratorio (
    id_laboratorio INT PRIMARY KEY AUTO_INCREMENT,
    nome_sala VARCHAR(50),
    capacidade INT,
    tipo VARCHAR(50) -- Ex: Dev, Redes, Design
);

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    sigla VARCHAR(10)
);

CREATE TABLE Horario (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    inicio TIME,
    fim TIME,
    turno VARCHAR(20)
);

CREATE TABLE Periodo (
    id_periodo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50), -- Ex: 2º Semestre 2025
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    data_reserva DATE,
    status VARCHAR(20), -- Ativa, Cancelada
    id_professor INT,
    id_laboratorio INT,
    id_disciplina INT,
    id_horario INT,
    id_periodo INT,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_laboratorio) REFERENCES Laboratorio(id_laboratorio),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina),
    FOREIGN KEY (id_horario) REFERENCES Horario(id_horario),
    FOREIGN KEY (id_periodo) REFERENCES Periodo(id_periodo)
);

-- --- INSERTS (POVOANDO AS TABELAS) ---

-- 1. Professores
INSERT INTO Professor (nome, email) VALUES 
('Carlos Silva', 'carlos.silva@etec.sp.gov.br'),
('Ana Souza', 'ana.souza@etec.sp.gov.br'),
('Roberto Oliveira', 'roberto.dev@etec.sp.gov.br'),
('Fernanda Lima', 'fernanda.art@etec.sp.gov.br');

-- 2. Laboratórios
INSERT INTO Laboratorio (nome_sala, capacidade, tipo) VALUES 
('Lab 01 - Programação', 40, 'Desenvolvimento'),
('Lab 02 - Redes', 30, 'Infraestrutura'),
('Lab 03 - Maker/Jogos', 25, 'Alta Performance');

-- 3. Disciplinas (Foco em Jogos e TI)
INSERT INTO Disciplina (nome, sigla) VALUES 
('Programação de Jogos Digitais', 'PJD'),
('Banco de Dados I', 'BD1'),
('Modelagem 3D', 'M3D'),
('Lógica de Programação', 'LP');

-- 4. Horários (Noite)
INSERT INTO Horario (inicio, fim, turno) VALUES 
('19:00', '19:50', 'Noite'),
('19:50', '20:40', 'Noite'),
('21:00', '21:50', 'Noite'),
('21:50', '22:40', 'Noite');

-- 5. Período
INSERT INTO Periodo (descricao, data_inicio, data_fim) VALUES 
('2º Semestre 2025', '2025-07-20', '2025-12-20');

-- 6. Reservas (Criando agendamentos)
INSERT INTO Reserva (data_reserva, status, id_professor, id_laboratorio, id_disciplina, id_horario, id_periodo) VALUES 
('2025-10-15', 'Confirmada', 1, 3, 1, 1, 1), -- Carlos no Lab Jogos (1ª aula)
('2025-10-15', 'Confirmada', 1, 3, 1, 2, 1), -- Carlos no Lab Jogos (2ª aula)
('2025-10-16', 'Confirmada', 2, 1, 2, 3, 1), -- Ana em BD
('2025-10-17', 'Confirmada', 3, 1, 4, 1, 1), -- Roberto em Lógica
('2025-10-17', 'Pendente', 4, 3, 3, 1, 1);   -- Fernanda tentando Lab Jogos (conflito de data com Roberto se fosse mesma sala, mas horarios iguais)