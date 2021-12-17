<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key name="myKey1" match="/pricelist/book" use="price"/>
  <xsl:key name="myKey2" match="/pricelist/book/price" use="."/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Пример выборки книг</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>
			<body>
				<h1> 
					Книжек за 250 р 
					<xsl:value-of select="count(key('myKey2', 250))"/>
					штук</h1>
				<hr/>
				<ul>
					<xsl:apply-templates select="key('myKey1', 250)" />
				</ul>
				<h1> 
					Книжек за 100 р 
					<xsl:value-of select="count(key('myKey2', 100))"/>
					штук</h1>
				<hr/>
				<ul>
					<xsl:apply-templates select="key('myKey1', 100)" />
				</ul>
			</body>
		</html>
	</xsl:template>

	
	<xsl:template match="book">
		<li>
		<!--Цикл проходящий по всему содержимому book-->
			<xsl:for-each select="*">
			  <!--Получение названия вложенного тега-->
				<xsl:value-of select="name()" />
				<!--Добавление :-->
				<xsl:text>: </xsl:text>
				<!--Получение содержимого вложенного тега-->
				<xsl:value-of select="." />
				<br />
			</xsl:for-each>
		</li>
	</xsl:template>		
</xsl:stylesheet>