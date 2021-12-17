<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
    <data>
      <xsl:apply-templates select="/pricelist/book"/>
    </data>
  </xsl:template>
	
	<xsl:template match="book">
    <xsl:element name="item">
      <xsl:value-of select="title"/>  
    </xsl:element>
	</xsl:template>
</xsl:stylesheet>
<!--
<data>
  <item>...</item>
  <item>...</item>
  <item>...</item>
</data>
-->