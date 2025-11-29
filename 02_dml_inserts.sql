-- 02_dml_inserts.sql
USE imoveis_rlacerda;

-- PROPRIETARIO
INSERT INTO PROPRIETARIO (nome, telefone, email) VALUES
  ('João Silva',        '61999990001', 'joao.silva@example.com'),
  ('Maria Oliveira',    '61999990002', 'maria.oliveira@example.com'),
  ('Carlos Fernandes',  '61999990003', 'carlos.fernandes@example.com');

-- CORRETOR
INSERT INTO CORRETOR (nome, creci, telefone, email) VALUES
  ('Richard Lacerda', 'DF29179', '61996259801', 'richard.lacerda@imobiliaria.com'),
  ('Ana Souza',       'DF30500', '61998887766', 'ana.souza@imobiliaria.com');

-- CLIENTE
INSERT INTO CLIENTE (nome, telefone, email, perfil_interesse) VALUES
  ('Pedro Gomes',   '61991112222', 'pedro.gomes@example.com',   'Chácara região 26 de Setembro'),
  ('Luciana Reis',  '61992223333', 'luciana.reis@example.com',  'Casa em condomínio fechado'),
  ('Rafael Costa',  '61993334444', 'rafael.costa@example.com',  'Lote para investimento'),
  ('Juliana Lima',  '61994445555', 'juliana.lima@example.com',  'Imóvel com natureza, 26 de Setembro');

-- IMOVEL
INSERT INTO IMOVEL (id_proprietario, id_corretor, endereco, metragem, valor, status) VALUES
  (1, 1, '26 de Setembro, Rua 3, Lote 10',   250.00, 350000.00, 'DISPONIVEL'),
  (1, 1, '26 de Setembro, Rua 2, Lote 05',   400.00, 280000.00, 'DISPONIVEL'),
  (2, 2, 'Vicente Pires, Rua 12, Casa 03',   300.00, 650000.00, 'DISPONIVEL'),
  (3, 1, 'Região do Café Sem Troco, Gleba A',46600.00,350000.00,'DISPONIVEL');

-- VISITA
INSERT INTO VISITA (id_cliente, id_imovel, data_visita, horario, observacoes) VALUES
  (1, 1, '2025-11-10', '10:00:00', 'Cliente interessado em chácara com renda.'),
  (2, 3, '2025-11-11', '15:30:00', 'Gostou da casa, pediu simulação de financiamento.'),
  (3, 2, '2025-11-12', '09:00:00', 'Busca lote com possibilidade de troca por veículo.'),
  (4, 4, '2025-11-13', '16:00:00', 'Muito interesse na área verde e na localização.');

-- PROPOSTA
INSERT INTO PROPOSTA (id_cliente, id_imovel, data_proposta, valor_ofertado, condicoes_pagamento, status_proposta) VALUES
  (1, 1, '2025-11-15', 340000.00, 'Entrada 120.000 + financiamento bancário.', 'EM_ANALISE'),
  (2, 3, '2025-11-16', 630000.00, 'Entrada 200.000 + restante em 24x direto.', 'EM_ANALISE'),
  (3, 2, '2025-11-17', 260000.00, 'Entrada com veículo + diferença em espécie.', 'RECUSADA'),
  (4, 4, '2025-11-18', 340000.00, 'Pagamento à vista em 30 dias.', 'ACEITA');
