<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<!-- / - будем обрабатывать корневой элемент, т.е. весь документ-->
  <xsl:template match="/">  
  <h1>Обработка (анализ) документа с помощью XSL</h1>  
  <br/> 
  
  
  Комплекс Курская: всего занятий =
  <xsl:value-of select="count(timeTable/lessons/lesson[@complex='КУ'])"/>
  <br/>
  
  Комплекс ВДНХ: всего занятий =
  <xsl:value-of select="count(timeTable/lessons/lesson[@complex='BT'])"/>
  <br/>
  
  Количество чётных занятий на Курской =
  <xsl:value-of select="count(timeTable/lessons/lesson[@complex='КУ' and position() mod 2 = 0])"/>
  <br/>
  
  Количество нечётных занятий на ВДНХ =
  <xsl:value-of select="count(timeTable/lessons/lesson[@complex='КУ' and position() mod 2 != 0])"/>
  <br/>
  
  Количество занятий в 10:00 = 
  <xsl:value-of select="count(timeTable/lessons/lesson[./time = '10:00'])"/>
  <br/>
  
  Количество занятий в 15:30 =
  <xsl:value-of select="count(timeTable/lessons/lesson[./time = '15:30'])"/>
  <br/>
  
  Количество занятий в 17:20 =
  <xsl:value-of select="count(timeTable/lessons/lesson[./time = '17:20'])"/>
  <br/>
  
  <!--Первое занятие: такое-то состоялось тогда-то(дата)-->
  Первое занятие: 
  <xsl:value-of select="timeTable/lessons/lesson/thema"/>
  Состоялось:
  <xsl:value-of select="timeTable/lessons/lesson/date"/>
  <xsl:value-of select="timeTable/lessons/lesson/time"/>
  <br/>
  
  <!--Последнее занятие: такое-то состоялось тогда-то(дата)-->
  Последнее занятие: 
  <xsl:value-of select="timeTable/lessons/lesson[last()]/thema"/>
  Состоялось:
  <xsl:value-of select="timeTable/lessons/lesson[last()]/date"/>
  <xsl:value-of select="timeTable/lessons/lesson[last()]/time"/>
  <br/>
  
  <!--Занятий по DTD столько-то-->
  Занятий по DTD:
  <xsl:value-of select="count(timeTable/lessons/lesson/thema[contains(., 'DTD')])"/>
  <br/>
  
  </xsl:template>  
	
</xsl:stylesheet>
