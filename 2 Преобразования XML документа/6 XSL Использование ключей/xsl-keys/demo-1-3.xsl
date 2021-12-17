<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output 
		method="html" 
		encoding="utf-8"
		doctype-public="-//W3C//DTD HTML 4.01//EN"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Пример выборки книг</title>
				
			</head>
			<body>
				<h1> 
					Книжек за 250 р 
					<xsl:value-of select="count(/pricelist/book[price = 250])" />
					штук</h1>
				<hr />
				<ul>
					<xsl:apply-templates select="/pricelist/book[price = 250]" />
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

							  