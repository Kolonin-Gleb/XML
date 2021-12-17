<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<title>Что есть на складе</title>
			</head>
			<body>
				<h1>Что есть на складе</h1>
				<ul>
					<xsl:apply-templates select="/stock/item" />
				</ul>
			</body>
		</html>
	</xsl:template>	

	
	<xsl:template match="item">
		<li>
		  <xsl:value-of select="@name"/>
		  <xsl:choose>
		    <xsl:when test="@onstore='yes'">
		      На складе
		    </xsl:when>
		    <xsl:otherwise>
		      Нет на складе
		    </xsl:otherwise>
		  </xsl:choose>
		</li>
	</xsl:template>
	
	
</xsl:stylesheet>
