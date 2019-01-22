<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xslt="http://xml.apache.org/xslt">
<xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

<xsl:template match="/">
  <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="node_modules/chartist/dist/chartist.min.css"/>
      <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet"/>
      <link rel="stylesheet" href="climateData.css"/>
      <title>Klimadaten von Dinosaur, CO</title>
    </head>
    <body>
      <br/><h1 class="text-center">Klimadaten für Dinosaur, Colorado, USA</h1>

      <xsl:call-template name="createMainCards"/>
      <xsl:call-template name="createSubCards"/>

      <xsl:call-template name="createMonthsBase"/>

      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <script src="node_modules/chartist/dist/chartist.min.js"></script>
      <script src="climateData.js"></script>  
    </body>
  </html>
</xsl:template>

<xsl:template name="createMainCards">

  <div class="container allMainCards">
  <h2 class="text-center">Hauptmenü</h2><br/>
    <br/>
    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="tempMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zur Temperatur</h6>
          <p class="card-text">
            Aktuelle Werte (bei Zeitpunkt der Messung), Durchschnitt in der letzten Stunde, Maximum und Minimum der letzten Stunde.
          </p>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="surfaceMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Oberfläche</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zur Oberflächentemperatur</h6>
          <p class="card-text">
            Durchschnitt in der letzten Stunde, Maximum und Minimum der letzten Stunde.
          </p>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="solarMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Sonneneinstrahlung</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zur Sonneneinstrahlung</h6>
          <p class="card-text">
            Durchschnitt in der letzten Stunde, Maximum und Minimum der letzten Stunde.
          </p>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="humidMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Feuchtigkeit</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zur Feuchtigkeit</h6>
          <p class="card-text">
            Durchschnitt in der letzten Stunde.
          </p>
        </div>
      </div>
    </div>

  </div>
</xsl:template>

<xsl:template name="createSubCards">
  <xsl:call-template name="createTemperatureSubCards"/>
  <xsl:call-template name="createSurfaceSubCards"/>
  <xsl:call-template name="createSolarSubCards"/>
  <xsl:call-template name="createHumiditySubCards"/>
</xsl:template>

<xsl:template name="createTemperatureSubCards">

  <div class="container temperatureCards subCards">
  <h2 class="text-center">Temperatur</h2><br/>
  <br/>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showCurTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Aktuelle Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zum Messzeitpunkt</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showAvgTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Durchschnittliche Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Durchschnittswerte der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showMaxTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Maximale Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Maximalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showMinTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Minimale Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Minimalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

  </div>
</xsl:template>

<xsl:template name="createSurfaceSubCards">

  <div class="container surfaceCards subCards">
  <h2 class="text-center">Oberflächentemperatur</h2><br/>
  <br/>
  
    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showAvgSurTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Durchschnittliche Oberflächentemperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Durchschnittswerte der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showMaxSurTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Maximale Oberflächentemperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Maximalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showMinSurTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Minimale Oberflächentemperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Minimalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

  </div>
</xsl:template>

<xsl:template name="createSolarSubCards">

  <div class="container solarCards subCards">
  <h2 class="text-center">Sonneneinstrahlung</h2><br/>
  <br/>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showAvgSolRad" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Durchschnittliche Sonneneinstrahlung</h5>
          <h6 class="card-subtitle mb-2 text-muted">Durchschnittswerte der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showMaxSolRad" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Maximale Sonneneinstrahlung</h5>
          <h6 class="card-subtitle mb-2 text-muted">Maximalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showMinSolRad" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Minimale Sonneneinstrahlung</h5>
          <h6 class="card-subtitle mb-2 text-muted">Minimalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

  </div>
</xsl:template>

<xsl:template name="createHumiditySubCards">
  <div class="container humidityCards subCards">
  <h2 class="text-center">Feuchtigkeit</h2><br/>
  <br/>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2" id="showAvgRelHum" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Durchschnittliche Feuchtigkeit</h5>
          <h6 class="card-subtitle mb-2 text-muted">Durchschnittswerte der letzten Stunde</h6>
        </div>
      </div>
    </div>

  </div>
</xsl:template>

<xsl:template name="createTimes">
  <div class="container">
    <div class="row justify-content-md-center showAllTimes">
      <div class="col-md text-center">
        <button type="button" class="btn btn-outline active" id="btnA">01:00 Uhr</button>
      </div>
      <div class="col-md text-center">
        <button type="button" class="btn btn-outline" id="btnB">06:00 Uhr</button>
      </div>
      <div class="col-md text-center">
        <button type="button" class="btn btn-outline" id="btnC">11:00 Uhr</button>
      </div>
      <div class="col-md text-center">
        <button type="button" class="btn btn-outline" id="btnD">16:00 Uhr</button>
      </div>
      <div class="col-md text-center">
        <button type="button" class="btn btn-outline" id="btnE">21:00 Uhr</button>
      </div>
    </div>
    <br/>
    <div class="row justify-content-md-center showResets">
      <div class="col-lg text-center">
        <button type="button" class="btn btn-outline" id="btnReset">Zurücksetzen</button>
      </div>
      <div class="col-lg text-center">
        <button type="button" class="btn btn-outline" id="btnApply">Anwenden</button>
      </div>

    </div>
  </div>
</xsl:template>

<xsl:template name="createMonthsBase">
  <div id="everyMonthCurTemp" class="monthsBase temperature/curTemp">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'CurTemp'"/>
      <xsl:with-param name="valueFull" select="'Temperatur'"/>
      <xsl:with-param name="valueExtra" select="'aktueller Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthAvgTemp" class="monthsBase temperature/avgTemp">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'AvgTemp'"/>
      <xsl:with-param name="valueFull" select="'Temperatur'"/>
      <xsl:with-param name="valueExtra" select="'durchschnittlicher Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthMaxTemp" class="monthsBase temperature/maxTemp">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'MaxTemp'"/>
      <xsl:with-param name="valueFull" select="'Temperatur'"/>
      <xsl:with-param name="valueExtra" select="'maximaler Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthMinTemp" class="monthsBase temperature/minTemp">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'MinTemp'"/>
      <xsl:with-param name="valueFull" select="'Temperatur'"/>
      <xsl:with-param name="valueExtra" select="'minimaler Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthAvgSurTemp" class="monthsBase surface/avgSurTemp">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'AvgSurTemp'"/>
      <xsl:with-param name="valueFull" select="'Oberflächentemperatur'"/>
      <xsl:with-param name="valueExtra" select="'durchschnittlicher Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthMaxSurTemp" class="monthsBase surface/maxSurTemp">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'MaxSurTemp'"/>
      <xsl:with-param name="valueFull" select="'Oberflächentemperatur'"/>
      <xsl:with-param name="valueExtra" select="'maximaler Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthMinSurTemp" class="monthsBase surface/minSurTemp">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'MinSurTemp'"/>
      <xsl:with-param name="valueFull" select="'Oberflächentemperatur'"/>
      <xsl:with-param name="valueExtra" select="'minimaler Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthAvgSolRad" class="monthsBase solar/avgSolRad">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'AvgSolRad'"/>
      <xsl:with-param name="valueFull" select="'Sonneneinstrahlung'"/>
      <xsl:with-param name="valueExtra" select="'durchschnittlicher Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthMaxSolRad" class="monthsBase solar/maxSolRad">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'MaxSolRad'"/>
      <xsl:with-param name="valueFull" select="'Sonneneinstrahlung'"/>
      <xsl:with-param name="valueExtra" select="'maximaler Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthMinSolRad" class="monthsBase solar/minSolRad">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'MinSolRad'"/>
      <xsl:with-param name="valueFull" select="'Sonneneinstrahlung'"/>
      <xsl:with-param name="valueExtra" select="'minimaler Wert'"/>
    </xsl:call-template>
  </div>

  <div id="everyMonthAvgRelHum" class="monthsBase humidity/avgRelHum">
    <xsl:call-template name="everyMonth">
      <xsl:with-param name="valueShort" select="'AvgRelHum'"/>
      <xsl:with-param name="valueFull" select="'Luftfeuchtigkeit'"/>
      <xsl:with-param name="valueExtra" select="'durchschnittlicher Wert'"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template name="everyMonth">
  <xsl:param name="valueShort"/>
  <xsl:param name="valueFull"/>
  <xsl:param name="valueExtra"/>

  <h2 class="text-center">
    <xsl:value-of select="$valueFull"/> für jeden Monat, <xsl:value-of select="$valueExtra"/>
  </h2>
  <br/>
  <br/>

  <div class="container returnCard">
    <div class="row justify-content-md-center">
      <div class="card col-md-12 mb-2 backTo{$valueFull}" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title"><xsl:value-of select="$valueFull"/></h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>
  </div>
  <br/>

  <xsl:call-template name="createTimes"/>
  <br/>

  <div class="container allMonths">
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'Januar'"/>
      <xsl:with-param name="monthAbr" select="'jan'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'Februar'"/>
      <xsl:with-param name="monthAbr" select="'feb'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'März'"/>
      <xsl:with-param name="monthAbr" select="'mar'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'April'"/>
      <xsl:with-param name="monthAbr" select="'apr'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'Mai'"/>
      <xsl:with-param name="monthAbr" select="'may'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'Juni'"/>
      <xsl:with-param name="monthAbr" select="'jun'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'Juli'"/>
      <xsl:with-param name="monthAbr" select="'jul'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'August'"/>
      <xsl:with-param name="monthAbr" select="'aug'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'September'"/>
      <xsl:with-param name="monthAbr" select="'sep'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'Oktober'"/>
      <xsl:with-param name="monthAbr" select="'oct'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'November'"/>
      <xsl:with-param name="monthAbr" select="'nov'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
    <xsl:call-template name="singleMonth">
      <xsl:with-param name="monthFull" select="'Dezember'"/>
      <xsl:with-param name="monthAbr" select="'dec'"/>
      <xsl:with-param name="value" select="$valueShort"/>
    </xsl:call-template>
  </div>

</xsl:template>

<xsl:template name="singleMonth">
  <xsl:param name="monthFull"/>
  <xsl:param name="monthAbr"/>
  <xsl:param name="value"/>

  <xsl:value-of select="$monthFull"/><br/>
  <div class="row md-center">
    <div id="{$monthAbr}{$value}" class="ct-chart ct-major-seventh {$value}Chart col-md-12 mb-2"/>
  </div>
</xsl:template>

</xsl:stylesheet>