SELECT freguesias.nome, votacoes.votos
FROM freguesias
  INNER JOIN votacoes ON freguesias.codigo = votacoes.freguesia
  INNER JOIN concelhos ON concelhos.codigo = freguesias.concelho AND concelhos.nome = 'Lisboa'
WHERE votacoes.partido = 'CDSPP'
ORDER BY votacoes.votos DESC;