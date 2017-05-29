CREATE OR REPLACE PACKAGE eleicao_pkg IS
  PROCEDURE mongo_output;
END eleicao_pkg;

CREATE OR REPLACE PACKAGE BODY eleicao_pkg IS
  PROCEDURE mongo_output
  IS
    l_xml   XMLTYPE;
    l_xslt   XMLTYPE;
    l_transformed XMLTYPE;
    -- This code is used because xml_out.getstringval() returns
    -- ORA-19011: O buffer da cadeia de caracteres é demasiado pequeno
    -- https://ronaldsoracle.wordpress.com/2015/04/30/printing-a-large-xmltype-value-using-dbms_output/
    procedure print_clob(p_clob in clob) is
    v_offset number := 1;
    v_chunk_size number := 10000;
    begin
        owa_util.mime_header('text/plain');
    loop
        exit when v_offset > dbms_lob.getlength(p_clob);
        htp.prn(dbms_lob.substr(p_clob, v_chunk_size, v_offset));
        v_offset := v_offset + v_chunk_size;
      end loop;
    end print_clob;
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
      INTO l_xml
      FROM dual;

      l_xslt := XMLTYPE.CREATEXML(
'<?xml version="1.0" encoding="UTF-8"?>' ||
'<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">' ||
'<xsl:template match="/"><xsl:apply-templates select="ELEICAO_T/PARTIDOS"/>' ||
'<xsl:apply-templates select="ELEICAO_T/DISTRITOS"/>;</xsl:template>' ||
'<xsl:template match="PARTIDO_T">
db.partidos.insert({<xsl:apply-templates select="SIGLA"/><xsl:apply-templates select="DESIGNACAO"/>});
</xsl:template>' ||
'<xsl:template match="PARTIDO_T/SIGLA">"sigla":"<xsl:value-of select="."/>",</xsl:template>' ||
'<xsl:template match="PARTIDO_T/DESIGNACAO">"designacao":"<xsl:value-of select="."/>"</xsl:template>' ||
'<xsl:template match="DISTRITO_T">
db.distritos.insert({<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/><xsl:apply-templates select="REGIAO"/>"concelhos":[<xsl:apply-templates select="CONCELHOS"/>],<xsl:apply-templates select="PARTICIPACOES"/>,"listas":[<xsl:apply-templates select="LISTAS"/>]});
</xsl:template>' ||
'<xsl:template match="DISTRITO_T/CODIGO">"codigo":<xsl:value-of select="."/>,</xsl:template>' ||
'<xsl:template match="DISTRITO_T/NOME">"nome":"<xsl:value-of select="."/>",</xsl:template>' ||
'<xsl:template match="DISTRITO_T/REGIAO">"regiao":"<xsl:value-of select="."/>",</xsl:template>' ||
'<xsl:template match="CONCELHO_T[last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"freguesias":[<xsl:apply-templates select="FREGUESIAS"/>]}</xsl:template>' ||
'<xsl:template match="CONCELHO_T[position() != last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"freguesias":[<xsl:apply-templates select="FREGUESIAS"/>]},</xsl:template>' ||
'<xsl:template match="CONCELHO_T/CODIGO">"codigo":<xsl:value-of select="."/>,</xsl:template>' ||
'<xsl:template match="CONCELHO_T/NOME">"nome":"<xsl:value-of select="."/>",</xsl:template>' ||
'<xsl:template match="FREGUESIA_T[position() != last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"votacoes":[<xsl:apply-templates select="VOTACOES"/>]},</xsl:template>' ||
'<xsl:template match="FREGUESIA_T[last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"votacoes":[<xsl:apply-templates select="VOTACOES"/>]}</xsl:template>' ||
'<xsl:template match="FREGUESIA_T/CODIGO">"codigo":<xsl:value-of select="."/>,</xsl:template>' ||
'<xsl:template match="FREGUESIA_T/NOME">"nome":"<xsl:value-of select="."/>",</xsl:template>' ||
'<xsl:template match="VOTACAO_T[position() != last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="VOTOS"/>},</xsl:template>' ||
'<xsl:template match="VOTACAO_T[last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="VOTOS"/>}</xsl:template>' ||
'<xsl:template match="VOTACAO_T/PARTIDO">"partido":"<xsl:value-of select="."/>",</xsl:template>' ||
'<xsl:template match="VOTACAO_T/VOTOS">"votos":<xsl:value-of select="."/></xsl:template>' ||
'<xsl:template match="PARTICIPACAO_T">"participacoes":{<xsl:apply-templates select="INSCRITOS"/><xsl:apply-templates select="VOTANTES"/><xsl:apply-templates select="ABSTENCOES"/><xsl:apply-templates select="BRANCOS"/><xsl:apply-templates select="NULOS"/>}</xsl:template>' ||
'<xsl:template match="PARTICIPACAO_T/INSCRITOS">"inscritos":<xsl:value-of select="."/>,</xsl:template>' ||
'<xsl:template match="PARTICIPACAO_T/VOTANTES">"votantes":<xsl:value-of select="."/>,</xsl:template>' ||
'<xsl:template match="PARTICIPACAO_T/ABSTENCOES">"abstencoes":<xsl:value-of select="."/>,</xsl:template>' ||
'<xsl:template match="PARTICIPACAO_T/BRANCOS">"brancos":<xsl:value-of select="."/>,</xsl:template>' ||
'<xsl:template match="PARTICIPACAO_T/NULOS">"nulos":<xsl:value-of select="."/></xsl:template>' ||
'<xsl:template match="LISTA_T[position() != last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="MANDATOS"/>},</xsl:template>' ||
'<xsl:template match="LISTA_T[last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="MANDATOS"/>}</xsl:template>' ||
'<xsl:template match="LISTA_T/PARTIDO">"partido":"<xsl:value-of select="."/>",</xsl:template>' ||
'<xsl:template match="LISTA_T/MANDATOS">"mandatos":<xsl:value-of select="."/></xsl:template>' ||
'</xsl:stylesheet>');

      -- http://www.oraclefrontovik.com/2012/12/some-different-ways-to-perform-xslt-from-plsql/
      -- l_transformed := l_xml.transform(xsl => l_xslt);
      SELECT XMLTRANSFORM(l_xml, l_xslt)
      INTO l_transformed
      FROM dual;
      --

      -- https://ronaldsoracle.wordpress.com/2015/04/30/printing-a-large-xmltype-value-using-dbms_output/
      -- Equivalent to set serveroutput on size unlimited
      dbms_output.enable(null);
      print_clob(l_transformed.getClobVal);
      --

      EXCEPTION WHEN OTHERS THEN htp.print(SQLERRM);
    END;
END;