<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--Созранение выходного документа как XML с отступами-->
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="/"> <!--Действия для элемент-документа (match="/") -->
    <items> <!--Создание тега items в который будут помещаться данные-->
      <!-- Ловим все теги ul по мере обхода элемент-документа (match="/")-->
      <xsl:apply-templates select="ul"/>
    </items>
  </xsl:template>
  
    <xsl:template match="ul"> <!--Действия для тегов ul-->
      <!-- Ловим все теги li по мере обхода тегов ul (match="ul"), что лежат в элемент-документе (match="/")-->
      <xsl:apply-templates select="li"/>
    </xsl:template>
        
    <xsl:template match="li"> <!--Действия для тегов li-->
      <!--Создание необходимых переменных и установка их значений из содержимого тегов-->
      <xsl:variable name="user" select="p"/>
      <xsl:variable name="user_id" select="@data-id"/>
      <xsl:variable name="message" select="span"/>
      <xsl:variable name="parent_id" select="../../@data-id"/> <!--Выход из li в ul / из ul в li / взятие data-id этого li-->
      <!-- Таким образом сохраняется id того, кому отвечают-->
        
      <xsl:choose>
        <xsl:when condition="not($parent_id)"> <!--Если не найден тот, кому отвечают-->
          <item id="{$user_id}" parentid="0" author="{$user}"> <!--установка атрибутов в тег item-->
            <xsl:value-of select="$message"/> <!--Установка значения тега item-->
          </item>
        </xsl:when>
        <xsl:otherwise> <!--Если найден тот, кому отвечают-->
          <item id="{$user_id}" parentid="{$parent_id}" author="{$user}">
            <xsl:value-of select="$message"/>
          </item>
        </xsl:otherwise>
      </xsl:choose>
      
      <xsl:apply-templates select="ul"/>
    </xsl:template>
        
</xsl:stylesheet>
