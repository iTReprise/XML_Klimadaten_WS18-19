<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:xslt="http://xml.apache.org/xslt">
<xsl:output method="html" encoding="utf-8" indent="yes" xslt:indent-amount="2" />
<xsl:strip-space elements="*"/>

<xsl:template match="/">
  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="node_modules/chartist/dist/chartist.min.css"/>
      <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet"/>
      <link rel="stylesheet" href="climateData.css"/>
      <title>Klimadaten von Dinosaur, CO</title>
    </head>
    <body>
      <h1 class="text-center">Klimadaten für Dinosaur, Colorado</h1>
      <xsl:call-template name="everyMonthCurTemp"/>

      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <script src="node_modules/chartist/dist/chartist.min.js"></script>
      <script src="climateData.js"></script>
    </body>
  </html>
</xsl:template>

<xsl:template name="everyMonthCurTemp">
  <h2 class="text-center">Temperatur für jeden Monat, aktueller Wert</h2><br/>

  <div class="container allMonths">
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'Januar'"/>
        <xsl:with-param name="monthAbr" select="'jan'"/>
        <xsl:with-param name="monthInt" select="'2017.01'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'Februar'"/>
        <xsl:with-param name="monthAbr" select="'feb'"/>
        <xsl:with-param name="monthInt" select="'2017.02'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'März'"/>
        <xsl:with-param name="monthAbr" select="'mar'"/>
        <xsl:with-param name="monthInt" select="'2017.03'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'April'"/>
        <xsl:with-param name="monthAbr" select="'apr'"/>
        <xsl:with-param name="monthInt" select="'2017.04'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'Mai'"/>
        <xsl:with-param name="monthAbr" select="'may'"/>
        <xsl:with-param name="monthInt" select="'2017.05'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'Juni'"/>
        <xsl:with-param name="monthAbr" select="'jun'"/>
        <xsl:with-param name="monthInt" select="'2017.06'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'Juli'"/>
        <xsl:with-param name="monthAbr" select="'jul'"/>
        <xsl:with-param name="monthInt" select="'2017.07'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'August'"/>
        <xsl:with-param name="monthAbr" select="'aug'"/>
        <xsl:with-param name="monthInt" select="'2017.08'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'September'"/>
        <xsl:with-param name="monthAbr" select="'sep'"/>
        <xsl:with-param name="monthInt" select="'2017.09'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'Oktober'"/>
        <xsl:with-param name="monthAbr" select="'oct'"/>
        <xsl:with-param name="monthInt" select="'2017.10'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'November'"/>
        <xsl:with-param name="monthAbr" select="'nov'"/>
        <xsl:with-param name="monthInt" select="'2017.11'"/>
      </xsl:call-template>
    </div>
    <div class="row">
      <xsl:call-template name="singleMonthCurTemp">
        <xsl:with-param name="monthFull" select="'Dezember'"/>
        <xsl:with-param name="monthAbr" select="'dec'"/>
        <xsl:with-param name="monthInt" select="'2017.12'"/>
      </xsl:call-template>
    </div>
  </div>

</xsl:template>

<xsl:template name="singleMonthCurTemp">
  <xsl:param name="monthFull"/>
  <xsl:param name="monthAbr"/>
  <xsl:param name="monthInt"/>
  <div class="container-fluid col-sm monthName"><xsl:value-of select="$monthFull"/>, 01:00 Uhr<br/>
  <div id="{$monthAbr}CurTemp" class="ct-chart ct-perfect-fourth"/>
</div>
</xsl:template>

</xsl:stylesheet>