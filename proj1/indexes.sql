CREATE INDEX ZINDEX_BTREE_R_S_D ON ZRESPOSTAS (SEMESTRE_ID, DISCIPLINA_ID);

CREATE BITMAP INDEX ZINDEX_BITMAP_R_D ON ZRESPOSTAS (DISCIPLINA_ID);

CREATE INDEX ZINDEX_BTREE_R_S ON ZRESPOSTAS (SEMESTRE_ID);