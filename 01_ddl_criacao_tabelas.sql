-- 01_ddl_criacao_tabelas.sql
-- Sistema de Gestão de Imóveis R. Lacerda

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS imoveis_rlacerda
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

USE imoveis_rlacerda;

-- Tabela de proprietários
CREATE TABLE IF NOT EXISTS PROPRIETARIO (
  id_proprietario INT AUTO_INCREMENT PRIMARY KEY,
  nome            VARCHAR(100) NOT NULL,
  telefone        VARCHAR(20),
  email           VARCHAR(100)
) ENGINE = InnoDB;

-- Tabela de corretores
CREATE TABLE IF NOT EXISTS CORRETOR (
  id_corretor INT AUTO_INCREMENT PRIMARY KEY,
  nome        VARCHAR(100) NOT NULL,
  creci       VARCHAR(20)  NOT NULL,
  telefone    VARCHAR(20),
  email       VARCHAR(100)
) ENGINE = InnoDB;

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS CLIENTE (
  id_cliente       INT AUTO_INCREMENT PRIMARY KEY,
  nome             VARCHAR(100) NOT NULL,
  telefone         VARCHAR(20),
  email            VARCHAR(100),
  perfil_interesse VARCHAR(100)
) ENGINE = InnoDB;

-- Tabela de imóveis
CREATE TABLE IF NOT EXISTS IMOVEL (
  id_imovel       INT AUTO_INCREMENT PRIMARY KEY,
  id_proprietario INT NOT NULL,
  id_corretor     INT NOT NULL,
  endereco        VARCHAR(200) NOT NULL,
  metragem        DECIMAL(10,2) NOT NULL,
  valor           DECIMAL(15,2) NOT NULL,
  status          VARCHAR(20) NOT NULL,  -- ex: DISPONIVEL, RESERVADO, VENDIDO

  CONSTRAINT fk_imovel_proprietario
    FOREIGN KEY (id_proprietario)
    REFERENCES PROPRIETARIO (id_proprietario)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_imovel_corretor
    FOREIGN KEY (id_corretor)
    REFERENCES CORRETOR (id_corretor)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE = InnoDB;

-- Tabela de visitas
CREATE TABLE IF NOT EXISTS VISITA (
  id_visita   INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente  INT NOT NULL,
  id_imovel   INT NOT NULL,
  data_visita DATE NOT NULL,
  horario     TIME NOT NULL,
  observacoes TEXT,

  CONSTRAINT fk_visita_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE (id_cliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_visita_imovel
    FOREIGN KEY (id_imovel)
    REFERENCES IMOVEL (id_imovel)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE = InnoDB;

-- Tabela de propostas
CREATE TABLE IF NOT EXISTS PROPOSTA (
  id_proposta        INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente         INT NOT NULL,
  id_imovel          INT NOT NULL,
  data_proposta      DATE NOT NULL,
  valor_ofertado     DECIMAL(15,2) NOT NULL,
  condicoes_pagamento VARCHAR(200),
  status_proposta    VARCHAR(20) NOT NULL, -- ex: EM_ANALISE, ACEITA, RECUSADA, CANCELADA

  CONSTRAINT fk_proposta_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE (id_cliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_proposta_imovel
    FOREIGN KEY (id_imovel)
    REFERENCES IMOVEL (id_imovel)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE = InnoDB;
