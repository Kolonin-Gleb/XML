<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!--Инструкции по преобразованию-->
  <xsl:template match="/ul"> <!--Для -->
    <li>
      <xsl:apply-templates select="item[@parentid = 0]"/>
    </li>
  </xsl:template>
  
  <xsl:template match="/">
    <items>
    <!-- Каждый li должен превратиться в item -->
    <!-- Каждый item заполнить аттрибутами и в значение поместить то, что говорят (значение span).-->
       <item>
          <xsl:for-each select="*">
            <xsl:value-of select="name()" />
            <xsl:text>: </xsl:text>
            <xsl:value-of select="." />
          </xsl:for-each>
       </item>
    </items>
  </xsl:template>  
  
  
</xsl:stylesheet>
