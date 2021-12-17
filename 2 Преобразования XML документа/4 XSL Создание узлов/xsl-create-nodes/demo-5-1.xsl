<?xml version="1.0" encoding="UTF-8" ?>

<!--Объявление DTD-->
<!DOCTYPE xsl:stylesheet
[
  <!ENTITY nbsp "&#160;">
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
    <html>
      <xsl:apply-templates select="/pricelist/book"/>
    </html>
  </xsl:template>	
	
	<xsl:template match="book">
    <div>
      <xsl:text disable-output-escaping="yes"> <!--Отключение вывода в точности как указано. Нужно, чтобы знак & не превращался в надпись, поэтому yes-->
        Книга: &nbsp; <!--Установка непереносимого пробела-->
      </xsl:text> 
      <xsl:value-of select="title"/>
      <xsl:text> </xsl:text> <!--Установка пробела-->
      <xsl:value-of select="author"/>
      <!-- Перенос </div> -->
      <xsl:text disable-output-escaping="yes">
      <![CDATA[&nbsp;]]>
      </xsl:text>
    </div>
	</xsl:template>
</xsl:stylesheet>

