CREATE TYPE votacao_t AS OBJECT (
  partido VARCHAR2(10),
  votos NUMBER(10)
);

CREATE TYPE votacao_table AS TABLE OF votacao_t;

CREATE TYPE freguesia_t AS OBJECT (
  codigo NUMBER(6),
  nome VARCHAR2(50),
  votacoes votacao_table
);

CREATE TYPE freguesia_table AS TABLE OF freguesia_t;

CREATE TYPE concelho_t AS OBJECT (
  codigo NUMBER(4),
  nome VARCHAR2(50),
  freguesias freguesia_table
);

CREATE TYPE concelho_table AS TABLE OF concelho_t;

CREATE TYPE participacao_t AS OBJECT (
  inscritos NUMBER(10),
  votantes NUMBER(10),
  abstencoes NUMBER(10),
  brancos NUMBER(10),
  nulos NUMBER(10)
);

CREATE TYPE participacao_table AS TABLE OF participacao_t;

CREATE TYPE lista_t AS OBJECT (
  partido VARCHAR2(10),
  mandatos number(2)
);

CREATE TYPE lista_table AS TABLE OF lista_t;

CREATE TYPE distrito_t AS OBJECT (
  codigo NUMBER(2),
  nome VARCHAR2(50),
  regiao VARCHAR(1),
  concelhos concelho_table,
  participacoes participacao_table,
  listas lista_table
);

CREATE TYPE distrito_table AS TABLE OF distrito_t;

CREATE TYPE partido_t AS OBJECT (
  sigla VARCHAR2(10),
  designacao VARCHAR2(100)
);

CREATE TYPE partido_table AS TABLE OF partido_t;

CREATE TYPE eleicao_t AS OBJECT (
  distritos distrito_table,
  partidos partido_table
);

SELECT xmltype(eleicao_t(
  (SELECT CAST(COLLECT(distrito_t(
    d.codigo, d.nome, d.regiao,
    CAST(MULTISET(
      SELECT concelho_t(c.codigo, c.nome,
        CAST(MULTISET(
          SELECT freguesia_t(f.codigo, f.nome,
            CAST(MULTISET(
              SELECT votacao_t(v.partido, v.votos)
              FROM votacoes v
              WHERE v.freguesia = f.codigo
            ) AS votacao_table))
          FROM freguesias f
          WHERE f.concelho = c.codigo
        ) AS freguesia_table))
      FROM concelhos c
      WHERE c.distrito = d.codigo
    ) AS concelho_table),
    CAST(MULTISET(
      SELECT participacao_t(p.inscritos, p.votantes, p.abstencoes, p.brancos, p.nulos)
      FROM participacoes p
      WHERE p.distrito = d.codigo
    ) AS participacao_table),
    CAST(MULTISET(
      SELECT lista_t(l.partido, l.mandatos)
      FROM listas l
      WHERE l.distrito = d.codigo
    ) AS lista_table))) AS distrito_table)
  FROM distritos d),
  (SELECT CAST(COLLECT(partido_t(p.sigla, p.designacao)) AS partido_table) FROM partidos p)
))
FROM dual;