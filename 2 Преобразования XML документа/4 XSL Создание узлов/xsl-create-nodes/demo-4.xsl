<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
    <data>  
      <xsl:apply-templates select="/pricelist/book"/>
    </data>
  </xsl:template>
	
	<xsl:template match="book">
    <xsl:element name="item-{position()}">
      <xsl:attribute name="price">
        <xsl:value-of select="price"/>
      </xsl:attribute>
      
      <xsl:value-of select="title"/>
    </xsl:element>
	</xsl:template>
	
</xsl:stylesheet>
<!--
<data>
  <item-1 price="...">...</item-1>
  <item-2 price="...">...</item-2>
  <item-3 price="...">...</item-3>
  ...
</data>
-->