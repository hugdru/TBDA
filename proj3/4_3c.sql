SELECT
  d.codigo,
  d.nome,
  l.partido
FROM distritos d
  INNER JOIN listas l ON l.distrito = d.codigo
  INNER JOIN (
               SELECT
                 listas.distrito      AS distrito,
                 MAX(listas.mandatos) AS max_mandatos,
                 SUM(listas.mandatos) AS sum_mandatos
               FROM listas
               GROUP BY listas.distrito
             ) l_max_sum ON l_max_sum.distrito = l.distrito
WHERE l.mandatos = l_max_sum.max_mandatos AND l_max_sum.max_mandatos > l_max_sum.sum_mandatos - max_mandatos;