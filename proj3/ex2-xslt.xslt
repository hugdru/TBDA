<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">db.partidos.insertMany([<xsl:apply-templates select="ELEICAO_T/PARTIDOS"/>]);
db.distritos.insertMany([<xsl:apply-templates select="ELEICAO_T/DISTRITOS"/>]);</xsl:template>

<xsl:template match="PARTIDO_T[position() != last()]">{<xsl:apply-templates select="SIGLA"/><xsl:apply-templates select="DESIGNACAO"/>},</xsl:template>

<xsl:template match="PARTIDO_T[last()]">{<xsl:apply-templates select="SIGLA"/><xsl:apply-templates select="DESIGNACAO"/>}</xsl:template>

<xsl:template match="PARTIDO_T/SIGLA">"sigla":"<xsl:value-of select="."/>",</xsl:template>

<xsl:template match="PARTIDO_T/DESIGNACAO">"designacao":"<xsl:value-of select="."/>"</xsl:template>

<xsl:template match="DISTRITO_T[position() != last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/><xsl:apply-templates select="REGIAO"/>"concelhos":[<xsl:apply-templates select="CONCELHOS"/>],<xsl:apply-templates select="PARTICIPACOES"/>,"listas":[<xsl:apply-templates select="LISTAS"/>]},</xsl:template>

<xsl:template match="DISTRITO_T[last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/><xsl:apply-templates select="REGIAO"/>"concelhos":[<xsl:apply-templates select="CONCELHOS"/>],<xsl:apply-templates select="PARTICIPACOES"/>,"listas":[<xsl:apply-templates select="LISTAS"/>]}</xsl:template>

<xsl:template match="DISTRITO_T/CODIGO">"codigo":<xsl:value-of select="."/>,</xsl:template>

<xsl:template match="DISTRITO_T/NOME">"nome":"<xsl:value-of select="."/>",</xsl:template>

<xsl:template match="DISTRITO_T/REGIAO">"regiao":"<xsl:value-of select="."/>",</xsl:template>

<xsl:template match="CONCELHO_T[last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"freguesias":[<xsl:apply-templates select="FREGUESIAS"/>]}</xsl:template>

<xsl:template match="CONCELHO_T[position() != last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"freguesias":[<xsl:apply-templates select="FREGUESIAS"/>]},</xsl:template>

<xsl:template match="CONCELHO_T/CODIGO">"codigo":<xsl:value-of select="."/>,</xsl:template>

<xsl:template match="CONCELHO_T/NOME">"nome":"<xsl:value-of select="."/>",</xsl:template>

<xsl:template match="FREGUESIA_T[position() != last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"votacoes":[<xsl:apply-templates select="VOTACOES"/>]},</xsl:template>

<xsl:template match="FREGUESIA_T[last()]">{<xsl:apply-templates select="CODIGO"/><xsl:apply-templates select="NOME"/>"votacoes":[<xsl:apply-templates select="VOTACOES"/>]}</xsl:template>

<xsl:template match="FREGUESIA_T/CODIGO">"codigo":<xsl:value-of select="."/>,</xsl:template>

<xsl:template match="FREGUESIA_T/NOME">"nome":"<xsl:value-of select="."/>",</xsl:template>

<xsl:template match="VOTACAO_T[position() != last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="VOTOS"/>},</xsl:template>

<xsl:template match="VOTACAO_T[last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="VOTOS"/>}</xsl:template>

<xsl:template match="VOTACAO_T/PARTIDO">"partido":"<xsl:value-of select="."/>",</xsl:template>

<xsl:template match="VOTACAO_T/VOTOS">"votos":<xsl:value-of select="."/></xsl:template>

<xsl:template match="PARTICIPACAO_T">"participacoes":{<xsl:apply-templates select="INSCRITOS"/><xsl:apply-templates select="VOTANTES"/><xsl:apply-templates select="ABSTENCOES"/><xsl:apply-templates select="BRANCOS"/><xsl:apply-templates select="NULOS"/>}</xsl:template>

<xsl:template match="PARTICIPACAO_T/INSCRITOS">"inscritos":<xsl:value-of select="."/>,</xsl:template>

<xsl:template match="PARTICIPACAO_T/VOTANTES">"votantes":<xsl:value-of select="."/>,</xsl:template>

<xsl:template match="PARTICIPACAO_T/ABSTENCOES">"abstencoes":<xsl:value-of select="."/>,</xsl:template>

<xsl:template match="PARTICIPACAO_T/BRANCOS">"brancos":<xsl:value-of select="."/>,</xsl:template>

<xsl:template match="PARTICIPACAO_T/NULOS">"nulos":<xsl:value-of select="."/></xsl:template>

<xsl:template match="LISTA_T[position() != last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="MANDATOS"/>},</xsl:template>

<xsl:template match="LISTA_T[last()]">{<xsl:apply-templates select="PARTIDO"/><xsl:apply-templates select="MANDATOS"/>}</xsl:template>

<xsl:template match="LISTA_T/PARTIDO">"partido":"<xsl:value-of select="."/>",</xsl:template>

<xsl:template match="LISTA_T/MANDATOS">"mandatos":<xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>