-- Criação da Tabela Pacientes
CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    senha_hash VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da Tabela ProfissionaisSaude
CREATE TABLE ProfissionaisSaude (
    id_profissional INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    crm_cro_etc VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco_consultorio VARCHAR(255)
);

-- Criação da Tabela Agendamentos
CREATE TABLE Agendamentos (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_profissional INT,
    data_hora DATETIME NOT NULL,
    tipo_agendamento VARCHAR(100) NOT NULL,
    local_agendamento VARCHAR(255),
    observacoes TEXT,
    status_agendamento VARCHAR(50) DEFAULT 'Pendente',
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_profissional) REFERENCES ProfissionaisSaude(id_profissional)
);

-- Criação da Tabela Prontuarios
CREATE TABLE Prontuarios (
    id_prontuario INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_profissional INT,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    diagnostico TEXT,
    tratamento TEXT,
    observacoes_gerais TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_profissional) REFERENCES ProfissionaisSaude(id_profissional)
);

-- Criação da Tabela Medicamentos
CREATE TABLE Medicamentos (
    id_medicamento INT PRIMARY KEY AUTO_INCREMENT,
    id_prontuario INT NOT NULL,
    nome_medicamento VARCHAR(255) NOT NULL,
    dosagem VARCHAR(100),
    frequencia VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (id_prontuario) REFERENCES Prontuarios(id_prontuario)
);