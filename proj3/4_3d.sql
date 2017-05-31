SELECT
  d.nome       AS distrito,
  c.nome       AS concelho,
  v.partido    AS partido,
  SUM(v.votos) AS votos
FROM distritos d
  INNER JOIN concelhos c ON c.distrito = d.codigo
  INNER JOIN freguesias f ON f.concelho = c.codigo
  INNER JOIN votacoes v ON v.freguesia = f.codigo
GROUP BY d.nome, c.nome, v.partido
ORDER BY distrito ASC, concelho ASC, votos DESC;