-- x
SELECT NOME
FROM XDISCIPLINA
WHERE disciplina_id NOT IN (
  SELECT disciplina_id
  FROM xrespostas);

-- y
SELECT nome
FROM ydisciplina
WHERE disciplina_id NOT IN (
  SELECT disciplina_id
  FROM yrespostas);

-- z
SELECT nome
FROM zdisciplina
WHERE disciplina_id NOT IN (
  SELECT disciplina_id
  FROM zrespostas);