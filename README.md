# Sistema de Gestão de Imóveis R. Lacerda – SQL (Experiência Prática IV)

Este repositório contém os scripts SQL da Experiência Prática IV da disciplina de Modelagem de Banco de Dados, 
baseados no minimundo de uma imobiliária (Sistema de Gestão de Imóveis R. Lacerda).

## 1. Tecnologias utilizadas

- Banco de dados: MySQL ou MariaDB
- Ferramenta: MySQL Workbench (ou DBeaver / linha de comando)
- Linguagem: SQL (DML e DDL)

> Observação: SQL é uma **linguagem de consulta e manipulação de dados**, não é 
uma linguagem de programação tradicional (como Java ou Python), mas pode ser usada 
em conjunto com elas.

## 2. Estrutura do repositório

- `01_ddl_criacao_tabelas.sql` – Criação do banco e das tabelas (modelo lógico).
- `02_dml_inserts.sql` – Comandos `INSERT` para povoamento inicial das tabelas.
- `03_dml_selects.sql` – Consultas `SELECT` com `JOIN`, `WHERE`, `ORDER BY` e `GROUP BY`.
- `04_dml_updates_deletes.sql` – Comandos `UPDATE` e `DELETE` com condições.

## 3. Ordem de execução

1. Executar `01_ddl_criacao_tabelas.sql`
2. Executar `02_dml_inserts.sql`
3. Executar `03_dml_selects.sql` para testar as consultas.
4. Executar `04_dml_updates_deletes.sql` para testar as operações de alteração e remoção.

## 4. Como executar no MySQL Workbench

1. Abrir o MySQL Workbench.
2. Criar uma conexão ou usar uma existente.
3. Abrir cada arquivo `.sql` e executar (botão de raio).
4. Verificar os resultados nas abas de resultado ou com `SELECT * FROM nome_da_tabela`.

## 5. Integração com o modelo lógico

Os scripts foram construídos com base no modelo lógico e no DER revisado:

- Entidades principais: `PROPRIETARIO`, `CORRETOR`, `CLIENTE`, `IMOVEL`, `VISITA`, `PROPOSTA`.
- Relacionamentos 1:N foram implementados com chaves estrangeiras (`FK`).
- As tabelas foram normalizadas até a **Terceira Forma Normal (3FN)**.

## 6. Autor

- Nome: Richard Nascimento Lacerda  
- Projeto: Sistema de Gestão de Imóveis R. Lacerda  
- CRECI: DF 29179 (quando aplicável ao contexto do minimundo)
