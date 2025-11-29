-- 04_dml_updates_deletes.sql
USE imoveis_rlacerda;

-- ======================
-- UPDATES
-- ======================

-- 1) Atualizar o status de um imóvel para 'VENDIDO' quando a proposta for ACEITA
UPDATE IMOVEL i
JOIN PROPOSTA pr ON pr.id_imovel = i.id_imovel
SET i.status = 'VENDIDO'
WHERE pr.id_proposta = 4
  AND pr.status_proposta = 'ACEITA';

-- 2) Ajustar o valor ofertado de uma proposta em negociação
UPDATE PROPOSTA
SET valor_ofertado = 345000.00,
    condicoes_pagamento = 'Entrada 150.000 + restante em financiamento bancário.'
WHERE id_proposta = 1
  AND status_proposta = 'EM_ANALISE';

-- 3) Atualizar o telefone de um cliente
UPDATE CLIENTE
SET telefone = '61990001111'
WHERE id_cliente = 2;

-- ======================
-- DELETES
-- ======================

-- 1) Remover propostas CANCELADAS (simulação: se tivesse esse status)
DELETE FROM PROPOSTA
WHERE status_proposta = 'CANCELADA';

-- 2) Remover visitas muito antigas (antes de 2025-11-01, por exemplo)
DELETE FROM VISITA
WHERE data_visita < '2025-11-01';

-- 3) Remover clientes sem visitas e sem propostas (cliente nunca interagiu)
DELETE FROM CLIENTE cli
WHERE NOT EXISTS (
    SELECT 1 FROM VISITA v WHERE v.id_cliente = cli.id_cliente
)
AND NOT EXISTS (
    SELECT 1 FROM PROPOSTA pr WHERE pr.id_cliente = cli.id_cliente
);
