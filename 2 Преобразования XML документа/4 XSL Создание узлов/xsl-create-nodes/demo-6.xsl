<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
    <html>  
      <xsl:apply-templates select="/pricelist/book"/>
    </html>
  </xsl:template>	
	
	<xsl:template match="book">
	  <!--Создание узла-комментария-->
    <xsl:comment>
      Обрабатывается книжка №<xsl:value-of select="position()"/>
    </xsl:comment>
    
    <div>
      <xsl:text disable-output-escaping="yes">
        Книга:<![CDATA[&nbsp;]]>
      </xsl:text> 
      <xsl:value-of select="title"/>
      <xsl:text> </xsl:text> <!--Установка пробела-->
      <xsl:value-of select="author"/>  
    </div>
	</xsl:template>	
</xsl:stylesheet>
