SELECT
  freguesias.nome,
  votacoes.votos
FROM freguesias
  INNER JOIN votacoes ON freguesias.codigo = votacoes.freguesia
WHERE freguesias.concelho = (SELECT codigo
                             FROM concelhos
                             WHERE nome = 'Lisboa')
      AND votacoes.partido = 'CDSPP'
ORDER BY votacoes.votos DESC;