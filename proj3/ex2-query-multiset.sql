SELECT XMLTYPE(eleicao_t(
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