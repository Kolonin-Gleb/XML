<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
<!--  <xsl:output 
		method="html" 
		doctype-public="-//W3C//DTD HTML 4.01//EN" 
		doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
		indent="yes"/>  
  -->
  <xsl:template match="/items">
    <ul>
      <xsl:apply-templates select="item[@parentid = 0]"/>
    </ul>
  </xsl:template>
  
  <xsl:template match="item">
    <xsl:variable name="currentId" select="@id"/>
    <li data-id="{$currentId}">
      <strong><xsl:value-of select="@author"/></strong> написал: <xsl:value-of select="."/>
    </li> 
    <xsl:variable name="childNodes" select="../item[@parentid = $currentId]"/> 
    <xsl:if test="$childNodes">
      <ul>
        <xsl:apply-templates select="$childNodes"/>
      </ul>
    </xsl:if>
  </xsl:template>  
  
</xsl:stylesheet>
