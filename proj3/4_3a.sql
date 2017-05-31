SELECT
  partido,
  SUM(mandatos) AS total_mandatos
FROM listas
GROUP BY partido
ORDER BY total_mandatos DESC;