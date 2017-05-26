<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/ELEICAO_T">
	<html>
	<body>
		<xsl:apply-templates select=""/> 
	db.partidos.insertMany([ <br></br>
    <xsl:for-each select="PARTIDOS/PARTIDO_T">
		<xsl:choose>
			<xsl:when test="position() = last()">
            	{"sigla": "<xsl:value-of select="./SIGLA"/>", "designacao": "<xsl:value-of select="./DESIGNACAO"/>"} <br></br>
            </xsl:when>
            <xsl:otherwise>
            	{"sigla": "<xsl:value-of select="./SIGLA"/>", "designacao": "<xsl:value-of select="./DESIGNACAO"/>"}, <br></br>
            </xsl:otherwise>
		</xsl:choose>
	</xsl:for-each> ]);
	</body>
	</html>
</xsl:template>

<xsl:template match="/ELEICAO_T">
	<html>
	<body>
	db.partidos.insertMany([ <br></br>
    <xsl:for-each select="DISTRITOS/DISTRITO_T">
		<xsl:choose>
			<xsl:when test="position() = last()">
            	{"codigo": "<xsl:value-of select="./CODIGO"/>", "nome": "<xsl:value-of select="./NOME"/>", "regiao": "<xsl:value-of select="./REGIAO"/>"} <br></br>
            </xsl:when>
            <xsl:otherwise>
				{"codigo": "<xsl:value-of select="./CODIGO"/>", "nome": "<xsl:value-of select="./NOME"/>", "regiao": "<xsl:value-of select="./REGIAO"/>"}, <br></br>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each> ]);
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>