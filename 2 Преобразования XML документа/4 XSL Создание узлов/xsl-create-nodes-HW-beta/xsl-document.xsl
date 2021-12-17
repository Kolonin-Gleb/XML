<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
	  <!--Длинная форма записи для создания узла-элемент-->
    <xsl:element name="html"> 
	    <xsl:apply-templates select="/items/element"/>
    </xsl:element>
  </xsl:template>
	
	
	<!--Мои шаблоны-->
	<xsl:template match="element">
	  <!--Создание узла товаров-->
    <xsl:goods>
      <!--Создание узла-комментария-->
      <xsl:comment>
        Всего элементов: <xsl:value-of select="count(items/element)"/>
      </xsl:comment>
      
      <!--Короткая форма записи для создания узла-элемент-->
      
      <!---->
      <xsl:element name="name()"> 
	      <xsl:apply-templates select="/items/element"/>
      </xsl:element>
      
      <computer> <xsl:value-of select="items/element[position(.)]"/> </computer>
      
      

    </xsl:goods>
	</xsl:template>
	
</xsl:stylesheet>

<!--
Задание. Преобразуйте данный документ в XML-документ вида*:

    <computer>Intel Core Duo</computer>
    <monitor>Dell 23'</monitor>
    <computer>Intel Core i5</computer>
    <computer>Intel Core i7</computer>
    <printer>LBP 2900</printer>
    <monitor>HP 21'</monitor>
    <printer>Canon 3211</printer>
</goods>
-->

