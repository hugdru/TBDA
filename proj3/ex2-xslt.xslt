<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<body>
	db.distritos.insertMany([ <br></br>
	<xsl:apply-templates select="ELEICAO_T/PARTIDOS"/> ]);
	<br></br>
	db.distritos.insertMany([ <br></br>
	<xsl:apply-templates select="ELEICAO_T/DISTRITOS"/> ]);
	</body>
	</html>
</xsl:template>

<xsl:template match="PARTIDO_T[position() != last()]">
	{
    <xsl:apply-templates select="SIGLA"/>  
    <xsl:apply-templates select="DESIGNACAO"/>
    },
  	<br></br>
</xsl:template>

<xsl:template match="PARTIDO_T[last()]">
    {
    <xsl:apply-templates select="SIGLA"/>  
    <xsl:apply-templates select="DESIGNACAO"/>
    }
  	<br></br>
</xsl:template>

<xsl:template match="PARTIDO_T/SIGLA">
  	"sigla": "<xsl:value-of select="."/>", 
</xsl:template>

<xsl:template match="PARTIDO_T/DESIGNACAO">
  	"designacao": "<xsl:value-of select="."/>"
</xsl:template>

<xsl:template match="DISTRITO_T[position() != last()]">
    {
    <xsl:apply-templates select="CODIGO"/>
    <xsl:apply-templates select="NOME"/>
    <xsl:apply-templates select="REGIAO"/>
    <xsl:apply-templates select="CONCELHOS"/>
    <xsl:apply-templates select="PARTICIPACOES"/>
    <xsl:apply-templates select="LISTAS"/>
    },
  	<br></br>
</xsl:template>

<xsl:template match="DISTRITO_T[last()]">
    {
    <xsl:apply-templates select="CODIGO"/>
    <xsl:apply-templates select="NOME"/>
    <xsl:apply-templates select="REGIAO"/>
    <xsl:apply-templates select="CONCELHOS"/>
    <xsl:apply-templates select="PARTICIPACOES"/>
    <xsl:apply-templates select="LISTAS"/>
    }
  	<br></br>
</xsl:template>

<xsl:template match="DISTRITO_T/CODIGO">
	"codigo": <xsl:value-of select="."/>,
	<br />
</xsl:template>

<xsl:template match="DISTRITO_T/NOME">
	"nome": "<xsl:value-of select="."/>",
	<br />
</xsl:template>

<xsl:template match="DISTRITO_T/REGIAO">
	"regiao": "<xsl:value-of select="."/>",
	<br />
</xsl:template>

<xsl:template match="CONCELHO_T">
    "concelhos": [
    <xsl:apply-templates select="CODIGO"/>  
    <xsl:apply-templates select="NOME"/>
    <xsl:apply-templates select="FREGUESIAS"/>
  	<br></br>
</xsl:template>

<xsl:template match="CONCELHO_T/CODIGO">
  	"codigo": <xsl:value-of select="."/>,
</xsl:template>

<xsl:template match="CONCELHO_T/NOME">
  	"nome": "<xsl:value-of select="."/>",
  	<br />
</xsl:template>

<xsl:template match="FREGUESIA_T">
    "freguesias": [
    <xsl:apply-templates select="CODIGO"/>  
    <xsl:apply-templates select="NOME"/>
    <xsl:apply-templates select="VOTACOES"/>
  	<br></br>
</xsl:template>

<xsl:template match="FREGUESIA_T/CODIGO">
  "codigo": <xsl:value-of select="."/>,
</xsl:template>

<xsl:template match="FREGUESIA_T/NOME">
  "nome": 
  <xsl:value-of select="."/>,
  <br />
</xsl:template>

<xsl:template match="VOTACAO_T">
    "freguesias": [
    <xsl:apply-templates select="PARTIDO"/>  
    <xsl:apply-templates select="VOTOS"/>
  <br></br>
</xsl:template>

<xsl:template match="VOTACAO_T/PARTIDO">
  "partido": 
  <xsl:value-of select="."/>,
</xsl:template>

<xsl:template match="VOTACAO_T/VOTOS">
  "votos": 
  <xsl:value-of select="."/>,
  <br />
</xsl:template>


</xsl:stylesheet>
