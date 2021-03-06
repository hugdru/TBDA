-- x
SELECT
  d.DISCIPLINA_ID,
  d.SIGLA
FROM (
       SELECT
         r.DISCIPLINA_ID,
         COUNT(r.RESPOSTA) AS N_RESPOSTAS,
         AVG(r.RESPOSTA)   AS AVG_RESPOSTA
       FROM XRESPOSTAS r
       WHERE r.SEMESTRE_ID = 21
       GROUP BY r.DISCIPLINA_ID
       HAVING COUNT(r.RESPOSTA) > 300
       ORDER BY AVG_RESPOSTA DESC) s
  INNER JOIN XDISCIPLINA d ON d.DISCIPLINA_ID = s.DISCIPLINA_ID
WHERE ROWNUM <= 1;

-- y
SELECT
  d.DISCIPLINA_ID,
  d.SIGLA
FROM (
       SELECT
         r.DISCIPLINA_ID,
         COUNT(r.RESPOSTA) AS N_RESPOSTAS,
         AVG(r.RESPOSTA)   AS AVG_RESPOSTA
       FROM YRESPOSTAS r
       WHERE r.SEMESTRE_ID = 21
       GROUP BY r.DISCIPLINA_ID
       HAVING COUNT(r.RESPOSTA) > 300
       ORDER BY AVG_RESPOSTA DESC) s
  INNER JOIN YDISCIPLINA d ON d.DISCIPLINA_ID = s.DISCIPLINA_ID
WHERE ROWNUM <= 1;

-- z
SELECT
  d.DISCIPLINA_ID,
  d.SIGLA
FROM (
       SELECT
         r.DISCIPLINA_ID,
         COUNT(r.RESPOSTA) AS N_RESPOSTAS,
         AVG(r.RESPOSTA)   AS AVG_RESPOSTA
       FROM ZRESPOSTAS r
       WHERE r.SEMESTRE_ID = 21
       GROUP BY r.DISCIPLINA_ID
       HAVING COUNT(r.RESPOSTA) > 300
       ORDER BY AVG_RESPOSTA DESC) s
  INNER JOIN ZDISCIPLINA d ON d.DISCIPLINA_ID = s.DISCIPLINA_ID
WHERE ROWNUM <= 1;