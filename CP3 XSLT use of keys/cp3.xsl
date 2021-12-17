<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key name="keyBorisov" match="/courses/course/teachers/teacher" use="."/> <!--Курсы Борисова-->
  <xsl:key name="keyXML" match="/courses/course/keywords/keyword" use="."/> <!--Курсы с темой XML-->
<!--  <xsl:key name="keyXSLT" match="/courses/course/keywords/keyword" use="."/> <!- -Курсы с темой XSLT- ->-->
  
  
	<xsl:template match="/">
		<html>
			<head>
				<title>Контрольная точка XML. Использование ключей</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>
			<body>
				<h1> 
					Наши курсы
        </h1>
				<hr />
          <h3>Курсы, которые читает Борисов И.О.</h3>
            <ul>
              <xsl:apply-templates select="key('keyBorisov', 'Борисов И.О.')" />
            </ul>
          <h3>Курсы, которые используют XML</h3>
            <ul>
              <xsl:apply-templates select="key('keyXML', 'XML')" />
            </ul>
          <h3>Курсы, которые читает Борисов И.О. и в которых есть XSLT</h3>
            <ul>
              <xsl:apply-templates select="key('keyBorisov', 'Борисов И.О.')[../../keywords/keyword = 'XSLT']" /> <!--[] - содержат доп. путь-->
            </ul>
			</body>
		</html>
	</xsl:template>
	
	<!--Шаблон для вывода значения курса где педагог - Борисов И.О.-->
	<!--Шаблон для вывода значения курса где педагог - Борисов И.О. и XSLT есть в программе-->
  <xsl:template match="teacher">
		<li>
			  <!--Прыжок на 2 этажа выше и получение данных-->
				<!--<xsl:value-of select="/courses/course/teachers/teacher/../../@id"/>-->
				<xsl:value-of select="../../@id" /> <!--Путь относительно teacher.-->
		</li>
	</xsl:template>
	
	<!--Шаблон для вывода курсов с темой XML-->
  <xsl:template match="keyword">
		<li>
        <!--Прыжок на 2 этажа выше и получение данных-->
				<xsl:value-of select="../../@id" /> <!--Путь относительно keyword-->
		</li>
  </xsl:template>
</xsl:stylesheet>
