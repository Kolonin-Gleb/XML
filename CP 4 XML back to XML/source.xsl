<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--Созранение выходного документа как XML с отступами-->
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/"> <!--Обход всего документа-->
        <items>
            <xsl:apply-templates select="ul"/>
        </items>
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
            <xsl:when test="not($parent)">
                <item id="{$id}" parentid="0" author="{$author}">
                    <xsl:value-of select="$text"/>
                </item>
            </xsl:when>
            <xsl:otherwise>
                <item id="{$id}" parentid="{$parent}" author="{$author}">
                    <xsl:value-of select="$text"/>
                </item>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="ul"/>
    </xsl:template>
</xsl:stylesheet>