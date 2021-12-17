<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<title>Пример меню</title>
			</head>
			<body>
				<h1>Пример меню</h1>
				<ul>
				  <xsl:apply-templates select="/menu/menuItem"/>
				</ul>
			</body>
		</html>
	</xsl:template>	
  
  <xsl:template match="menuItem">
    <li>
      <xsl:choose> 
        <xsl:when test="@link">  
          <a href="{@link}"><xsl:value-of select="@title"/></a>
        </xsl:when>
        <xsl:otherwise>
          <strong><xsl:value-of select="@title"/></strong>
        </xsl:otherwise>
      </xsl:choose>
    </li>
    <xsl:if test="menuItem">
      <ul>
        <xsl:apply-templates select="menuItem"/>
      </ul>
    </xsl:if>
  </xsl:template>
	
</xsl:stylesheet>
