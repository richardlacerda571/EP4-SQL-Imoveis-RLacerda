-- 03_dml_selects.sql
USE imoveis_rlacerda;

-- 1) Listar imóveis disponíveis com proprietário e corretor, ordenados pelo valor (maior para menor)
SELECT 
  i.id_imovel,
  i.endereco,
  i.metragem,
  i.valor,
  i.status,
  p.nome  AS nome_proprietario,
  c.nome  AS nome_corretor
FROM IMOVEL i
JOIN PROPRIETARIO p ON p.id_proprietario = i.id_proprietario
JOIN CORRETOR     c ON c.id_corretor     = i.id_corretor
WHERE i.status = 'DISPONIVEL'
ORDER BY i.valor DESC;

-- 2) Consultar visitas realizadas, trazendo cliente e imóvel
SELECT
  v.id_visita,
  v.data_visita,
  v.horario,
  cli.nome AS nome_cliente,
  i.endereco AS endereco_imovel
FROM VISITA v
JOIN CLIENTE cli ON cli.id_cliente = v.id_cliente
JOIN IMOVEL  i   ON i.id_imovel    = v.id_imovel
ORDER BY v.data_visita DESC, v.horario;

-- 3) Listar propostas com valor acima de 300 mil, com cliente, imóvel e status
SELECT
  pr.id_proposta,
  pr.data_proposta,
  pr.valor_ofertado,
  pr.status_proposta,
  cli.nome AS nome_cliente,
  i.endereco AS endereco_imovel
FROM PROPOSTA pr
JOIN CLIENTE cli ON cli.id_cliente = pr.id_cliente
JOIN IMOVEL  i   ON i.id_imovel    = pr.id_imovel
WHERE pr.valor_ofertado > 300000.00
ORDER BY pr.valor_ofertado DESC;

-- 4) Quantidade de propostas por status
SELECT
  status_proposta,
  COUNT(*) AS quantidade
FROM PROPOSTA
GROUP BY status_proposta
ORDER BY quantidade DESC;

-- 5) Imóveis que ainda NÃO receberam propostas
SELECT
  i.id_imovel,
  i.endereco,
  i.valor,
  i.status
FROM IMOVEL i
LEFT JOIN PROPOSTA pr ON pr.id_imovel = i.id_imovel
WHERE pr.id_proposta IS NULL;
