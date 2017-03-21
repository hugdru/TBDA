SELECT AVG(xr.RESPOSTA)
FROM XRESPOSTAS xr
  INNER JOIN (
               SELECT xd.DISCIPLINA_ID
               FROM XDISCIPLINA xd
               WHERE xd.SIGLA = 'FPRO'
             ) xd ON xd.DISCIPLINA_ID = xr.DISCIPLINA_ID;

SELECT AVG(yr.RESPOSTA)
FROM YRESPOSTAS yr
  INNER JOIN (
               SELECT yd.DISCIPLINA_ID
               FROM YDISCIPLINA yd
               WHERE yd.SIGLA = 'FPRO'
             ) yd ON yd.DISCIPLINA_ID = yr.DISCIPLINA_ID;

SELECT AVG(zr.RESPOSTA)
FROM ZRESPOSTAS zr
  INNER JOIN (
               SELECT zd.DISCIPLINA_ID
               FROM ZDISCIPLINA zd
               WHERE zd.SIGLA = 'FPRO'
             ) zd ON zd.DISCIPLINA_ID = zr.DISCIPLINA_ID;