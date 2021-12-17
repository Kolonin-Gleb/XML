<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
    <html>
      <xsl:apply-templates select="/pricelist/book"/>
    </html>
  </xsl:template>
	
	<xsl:template match="book">
    <div>
      <xsl:text disable-output-escaping="yes"> <!--Отключение вывода в точности как указано. Нужно, чтобы знак & не превращался в надпись, поэтому yes-->
        Книга:<![CDATA[&nbsp;]]> <!--Установка непереносимого пробела-->
      </xsl:text> 
      <xsl:value-of select="title"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="author"/>
      <!-- Перенос </div> -->
      <xsl:text disable-output-escaping="yes">
      <![CDATA[&nbsp;]]>
      </xsl:text>
    </div>
	</xsl:template>
</xsl:stylesheet>

