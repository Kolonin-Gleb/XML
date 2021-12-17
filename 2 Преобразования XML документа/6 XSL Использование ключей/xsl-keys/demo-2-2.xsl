<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key name="myKey" match="/pricelist/book" 
                        use="concat(price, ':', author)"/>
  
	<xsl:template match="/">
		<html>
			<head>
				<title>Пример выборки книг</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>
			<body>
				<h1> 
					Книжек за 250 р 
					<xsl:value-of select="count(key('myKey', concat(250, ':', 'Джерри Хонейкатт')))"/>
					штук</h1>
				<hr/>
				<ul>
					<xsl:apply-templates select="key('myKey', concat(250, ':', 'Джерри Хонейкатт'))" />
				</ul>
				
			</body>
		</html>
	</xsl:template>

	
	<xsl:template match="book">
		<li>
			<xsl:for-each select="*">
				<xsl:value-of select="name()" />
				<xsl:text>: </xsl:text>
				<xsl:value-of select="." />
				<br />
			</xsl:for-each>
		</li>
	</xsl:template>		
</xsl:stylesheet>