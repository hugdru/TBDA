SELECT NOME
FROM XDISCIPLINA
WHERE disciplina_id NOT IN(
	SELECT disciplina_id
	FROM xrespostas)

SELECT nome
FROM ydisciplina
WHERE disciplina_id NOT IN(
	SELECT disciplina_id
	FROM yrespostas)

SELECT nome
FROM ydisciplina
WHERE disciplina_id NOT IN(
	SELECT disciplina_id
	FROM yrespostas)