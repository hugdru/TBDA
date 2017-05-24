SELECT d.codigo, d.nome, d.regiao,
  CURSOR (
    SELECT c.codigo, c.nome,
      CURSOR (
        SELECT f.codigo, f.nome,
          CURSOR (
            SELECT v.partido, v.votos
            FROM votacoes v
            WHERE v.freguesia = f.codigo
          ) AS votacoes
        FROM freguesias f
        WHERE f.concelho = c.codigo
      ) AS freguesias
    FROM concelhos c
    WHERE c.distrito = d.codigo
  ) AS concelhos,
  CURSOR (
    SELECT p.inscritos, p.votantes, p.abstencoes, p.brancos, p.nulos
    FROM participacoes p
    WHERE p.distrito = d.codigo
  ) AS participacoes,
  CURSOR (
    SELECT l.partido, l.mandatos
    FROM listas l
    WHERE l.distrito = d.codigo
  ) AS listas
FROM distritos d;

SELECT p.sigla, p.designacao
FROM partidos p;