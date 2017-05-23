CREATE TABLE distritos AS (SELECT *
                           FROM gtd7.distritos);
ALTER TABLE distritos
  ADD CONSTRAINT distritos_codigo_pk
PRIMARY KEY (codigo);

CREATE TABLE participacoes AS (SELECT *
                               FROM gtd7.participacoes);
ALTER TABLE participacoes
  ADD CONSTRAINT participacoes_distrito_fk
FOREIGN KEY (distrito)
REFERENCES distritos (codigo)
  ADD CONSTRAINT participacoes_distrito_pk
PRIMARY KEY (distrito);

CREATE TABLE concelhos AS (SELECT *
                           FROM gtd7.concelhos);
ALTER TABLE concelhos
  ADD CONSTRAINT concelhos_distrito_fk
FOREIGN KEY (distrito)
REFERENCES distritos (codigo)
  ADD CONSTRAINT concelhos_codigo_pk
PRIMARY KEY (codigo);

CREATE TABLE freguesias AS (SELECT *
                            FROM gtd7.freguesias);
ALTER TABLE freguesias
  ADD CONSTRAINT freguesias_concelho_fk
FOREIGN KEY (concelho)
REFERENCES concelhos (codigo)
  ADD CONSTRAINT freguesias_codigo_pk
PRIMARY KEY (codigo);

CREATE TABLE partidos AS (SELECT *
                          FROM gtd7.partidos);
ALTER TABLE partidos
  ADD CONSTRAINT partidos_sigla_pk
PRIMARY KEY (sigla);

CREATE TABLE listas AS (SELECT *
                        FROM gtd7.listas);
ALTER TABLE listas
  ADD CONSTRAINT listas_distrito_fk
FOREIGN KEY (distrito)
REFERENCES distritos (codigo)
  ADD CONSTRAINT listas_partido_fk
FOREIGN KEY (partido)
REFERENCES partidos (sigla)
  ADD CONSTRAINT listas_distrito_partido_pk
PRIMARY KEY (distrito, partido);

CREATE TABLE votacoes AS (SELECT *
                          FROM gtd7.votacoes);
ALTER TABLE votacoes
  ADD CONSTRAINT votacoes_freguesia_fk
FOREIGN KEY (freguesia)
REFERENCES freguesias (codigo)
  ADD CONSTRAINT votacoes_partido_fk
FOREIGN KEY (partido)
REFERENCES partidos (sigla)
  ADD CONSTRAINT votacoes_freguesia_partido_pk
PRIMARY KEY (freguesia, partido);
