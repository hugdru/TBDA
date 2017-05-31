SELECT freguesias.nome, votacoes.votos
FROM freguesias
RIGHT JOIN votacoes ON freguesias.codigo=votacoes.freguesia
WHERE freguesias.concelho=(SELECT codigo
                           FROM concelhos
                           WHERE nome='Lisboa')
AND votacoes.partido=(SELECT sigla
                      FROM partidos
                      WHERE designacao='Partido Popular');