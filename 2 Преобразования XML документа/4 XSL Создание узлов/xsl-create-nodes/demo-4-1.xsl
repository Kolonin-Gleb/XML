<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
    <data>  
      <xsl:apply-templates select="/pricelist/book"/>
    </data>
  </xsl:template>
	
	<!--Создание набора атрибутов-->
  <xsl:attribute-set name="attrs">
    <xsl:attribute name="price">
      <xsl:value-of select="price"/>
    </xsl:attribute>
    <xsl:attribute name="lang">ru</xsl:attribute> <!--Содержимое этого атрибута всегда будет = ru-->
  </xsl:attribute-set>
	
	<xsl:template match="book">
    <xsl:element name="item-{position()}" use-attribute-sets="attrs">
      <xsl:value-of select="title"/>  
    </xsl:element>
	</xsl:template>	
</xsl:stylesheet>
<!--
<data>
  <item-1 price="..." lang="ru">...</item-1>
  <item-2 price="...">...</item-2>
  <item-3 price="...">...</item-3>
  ...
</data>
-->

