<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!--Инструкции по преобразованию-->
  <xsl:template match="/"> <!--Для -->
    <li>
      <xsl:apply-templates select="ul"/>
    </li>
  </xsl:template>
  
  <xsl:template match="ul">
    <xsl:apply-templates select="li"/>
  </xsl:template>
  
  <xsl:template match="li">
    <xsl:variable name="author" select="p"/>
    <xsl:variable name="text" select="span"/>
    <xsl:variable name="id" select="@data-id"/>
    <xsl:variable name="parent" select="../../@data-id"/>
    <xsl:choose>
      <xsl:when test="parent">
        <xsl:variable name="parentid" select="../../@data-id"/>
      </xsl:when>
      <xsl:when test="not(parent)">
        <xsl:variable name="parentid" select="0"/>
      </xsl:when>
    </xsl:choose>
    
    <item id="{$id}" parent="{$parentid}" author="{$author}">
      <xsl:value-of select="$text"/>
    </item>
    <xsl:apply-templates select="ul"/>
  </xsl:template>
</xsl:stylesheet>


