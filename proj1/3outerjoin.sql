-- x
SELECT NOME
FROM XRESPOSTAS
  FULL OUTER JOIN XDISCIPLINA ON XRESPOSTAS.DISCIPLINA_ID = XDISCIPLINA.DISCIPLINA_ID
WHERE XRESPOSTAS.DISCIPLINA_ID IS NULL;

-- y
SELECT NOME
FROM YRESPOSTAS
  FULL OUTER JOIN YDISCIPLINA ON YRESPOSTAS.DISCIPLINA_ID = YDISCIPLINA.DISCIPLINA_ID
WHERE YRESPOSTAS.DISCIPLINA_ID IS NULL;

-- z
SELECT NOME
FROM ZRESPOSTAS
  FULL OUTER JOIN ZDISCIPLINA ON ZRESPOSTAS.DISCIPLINA_ID = ZDISCIPLINA.DISCIPLINA_ID
WHERE ZRESPOSTAS.DISCIPLINA_ID IS NULL;