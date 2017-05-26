<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>  
  <xsl:apply-templates/>  
  </body>
  </html>
</xsl:template>

<xsl:template match="distrito_t">
    <xsl:apply-templates select="codigo"/>  
    <xsl:apply-templates select="nome"/>
    <xsl:apply-templates select="concelhos"/>
  <br></br>
</xsl:template>

<xsl:template match="distrito_t/codigo">
  Codigo: <span style="color:#ff0000">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>

<xsl:template match="distrito_t/nome">
  Nome: <span style="color:#00ff00">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>

<xsl:template match="concelho_t">
    <xsl:apply-templates select="codigo"/>  
    <xsl:apply-templates select="nome"/>
  <br></br>
</xsl:template>

<xsl:template match="partido_t">
    <xsl:apply-templates select="title"/>  
    <xsl:apply-templates select="designacao"/>
  <br></br>
</xsl:template>

</xsl:stylesheet>

