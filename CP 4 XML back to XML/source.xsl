<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
        <!--Переменные для установки значений атрибутов-->
        <xsl:variable name="user" select="p"/>
        <xsl:variable name="user_id" select="@data-id"/>
        <xsl:variable name="parent_id" select="../../@data-id"/> <!--Выход из li в ul / из ul в li / взятие data-id этого li-->
        <!-- Таким образом сохраняется id того, кому отвечают-->

        <xsl:choose>
            <xsl:when test="$parent_id"> <!--Если найден тот, кому отвечают-->
                <item id="{$user_id}" parentid="{$parent_id}" author="{$user}">
                    <xsl:value-of select="$message"/>
                </item>
            </xsl:when>
            <xsl:otherwise> <!--Если не найден тот, кому отвечают-->
                  <item id="{$user_id}" parentid="0" author="{$user}"> <!--установка атрибутов в тега-->
                    <xsl:value-of select="$message"/> <!--Установка значения тега-->
                </item>
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:apply-templates select="ul"/> <!--Действия для тегов ul, что вложены в этот тег li-->
        <!--Без данного действия трансформация будет произведёна только для 1 сообщения-->
    </xsl:template>
</xsl:stylesheet>
