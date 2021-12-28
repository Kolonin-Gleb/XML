<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
    <!--Набор аттрибутов. Значения атрибутов берутся из X-path выражений-->
    <xsl:attribute-set name="item-attributes">
      <xsl:attribute name="id"><xsl:value-of select="@data-id"/></xsl:attribute>
      <xsl:attribute name="parentid"><xsl:value-of select="../../@data-id"/></xsl:attribute>
      <xsl:attribute name="author"><xsl:value-of select="p"/></xsl:attribute>
    </xsl:attribute-set>
  
    <xsl:template match="/"> <!--Действия для элемент-документа (match="/") -->
      <xsl:element name="items"> <!--Создание тега items в который будут помещаться данные-->
        <!-- Ловим все теги ul по мере обхода элемент-документа (match="/")-->
	      <xsl:apply-templates select="ul"/>
      </xsl:element>
    </xsl:template>

    <xsl:template match="ul"> <!--Действия для тегов ul-->
        <!-- Ловим все теги li по мере обхода тегов ul (match="ul"), что лежат в элемент-документе (match="/")-->
        <xsl:apply-templates select="li"/>
    </xsl:template>

    <xsl:template match="li"> <!--Действия для тегов li-->
        <!--Создание необходимых переменных и установка их значений из содержимого тегов-->
        <xsl:variable name="message" select="span"/>
        <!--
        <xsl:variable name="user" select="p"/>
        <xsl:variable name="user_id" select="@data-id"/>
        -->
        <xsl:variable name="parent_id" select="../../@data-id"/> <!--Выход из li в ul / из ul в li / взятие data-id этого li-->
        <!-- Таким образом сохраняется id того, кому отвечают-->
        

        
        <xsl:choose>
            <xsl:when test="not($parent_id)"> <!--Если не найден тот, кому отвечают-->
              <!--<item id="{$user_id}" parentid="0" author="{$user}"> <!- -установка атрибутов в тег item- ->-->
              <xsl:element name="item" use-attribute-sets="item-attributes"/> <!--установка атрибутов в тег item-->
                
              <xsl:value-of select="$message"/> <!--Установка значения тега item-->
              <!--</item>-->
            </xsl:when>
            <xsl:otherwise> <!--Если найден тот, кому отвечают-->
                <!--<item id="{$user_id}" parentid="{$parent_id}" author="{$user}">-->
                    <xsl:element name="item" use-attribute-sets="item-attributes"/> <!--установка атрибутов в тег item-->
                    <xsl:value-of select="$message"/>
                <!--</item>-->
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:apply-templates select="ul"/> <!---->
    </xsl:template>
</xsl:stylesheet>
