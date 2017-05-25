CREATE OR REPLACE PACKAGE eleicao_pkg IS
  PROCEDURE xml;
END eleicao_pkg;

CREATE OR REPLACE PACKAGE BODY eleicao_pkg IS
  PROCEDURE xml
  IS
    xml_out   XMLTYPE;
    -- This code is used because xml_out.getstringval() returns
    -- ORA-19011: O buffer da cadeia de caracteres é demasiado pequeno
    -- https://ronaldsoracle.wordpress.com/2015/04/30/printing-a-large-xmltype-value-using-dbms_output/
    procedure h_print_clob(p_clob in clob) is
    v_offset number := 1;
    v_chunk_size number := 10000;
    begin
    loop
        exit when v_offset > dbms_lob.getlength(p_clob);
        htp.print(dbms_lob.substr(p_clob, v_chunk_size, v_offset));
        v_offset := v_offset + v_chunk_size;
      end loop;
    end h_print_clob;
    --
    BEGIN
      SELECT XMLTYPE(eleicao_t(
        (SELECT CAST(COLLECT(distrito_t(
          d.codigo, d.nome, d.regiao,
          CAST(MULTISET(
            SELECT concelho_t(c.codigo, c.nome,
              CAST(MULTISET(
                SELECT freguesia_t(f.codigo, f.nome,
                  CAST(MULTISET(
                    SELECT votacao_t(v.partido, v.votos)
                    FROM votacoes v
                    WHERE v.freguesia = f.codigo
                  ) AS votacao_table))
                FROM freguesias f
                WHERE f.concelho = c.codigo
              ) AS freguesia_table))
            FROM concelhos c
            WHERE c.distrito = d.codigo
          ) AS concelho_table),
          CAST(MULTISET(
            SELECT participacao_t(p.inscritos, p.votantes, p.abstencoes, p.brancos, p.nulos)
            FROM participacoes p
            WHERE p.distrito = d.codigo
          ) AS participacao_table),
          CAST(MULTISET(
            SELECT lista_t(l.partido, l.mandatos)
            FROM listas l
            WHERE l.distrito = d.codigo
          ) AS lista_table))) AS distrito_table)
        FROM distritos d),
        (SELECT CAST(COLLECT(partido_t(p.sigla, p.designacao)) AS partido_table) FROM partidos p)
      ))
      INTO xml_out
      FROM dual;

      -- https://ronaldsoracle.wordpress.com/2015/04/30/printing-a-large-xmltype-value-using-dbms_output/
      -- Equivalent to set serveroutput on size unlimited
      dbms_output.enable(null);
      h_print_clob(xml_out.getClobVal);
      --

      EXCEPTION WHEN OTHERS THEN htp.print(SQLERRM);
    END;
END;