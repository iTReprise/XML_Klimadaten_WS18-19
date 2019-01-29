<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xslt="http://xml.apache.org/xslt">
<xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

<xsl:template match="/">
  <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
      <link rel="stylesheet" href="http://www.imn.htwk-leipzig.de/~futku/chartist/chartist.min.css"/>
      <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet"/>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.standalone.min.css" rel="stylesheet"/>
      <link rel="stylesheet" href="http://www.imn.htwk-leipzig.de/~futku/climateData.css"/>
      <title>Klimadaten von Dinosaur, CO</title>
    </head>
    <body>

      <nav class="navbar navbar-expand-sm navbar-light sticky-top">
        <div>
          <button class="navbar-toggler mr-2" type="button" data-toggle="collapse" data-target="#navbarText">
            <span class="navbar-toggler-icon" id="hamburgerIcon"/>
          </button>
          <a class="navbar-brand" href="#" id="returnToMain">
            Hauptmenü
          </a>
        </div>

        <div class="navbar-collapse collapse" id="navbarText">
          <ul class="nav navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" id="baseView" href="#">Monate</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="dayView" href="#">Tage</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="yearView" href="#">Jahr</a>
            </li>
          </ul>
        </div>

        <a href="https://github.com/iTReprise/XML_Klimadaten_WS18-19" class="github-corner" aria-label="View source on GitHub">
        <svg width="80" height="80" viewBox="0 0 250 250" aria-hidden="true">
          <path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"/>
          <path d="M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2" fill="currentColor" style="transform-origin: 130px 106px;" class="octo-arm"/>
          <path d="M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z" fill="currentColor" class="octo-body"/>
        </svg>

        <svg style="width:0;height:0;poisiton:absolute;" aria-hidden="true" focusable="false">
          <linearGradient id="fiveColorGradient" x2="1" y2="1">
            <stop offset="0%" stop-color="#8D3B72"/>
            <stop offset="25%" stop-color="#8A7090"/>
            <stop offset="50%" stop-color="#89A7A7"/>
            <stop offset="75%" stop-color="#72E1D1"/>
            <stop offset="100%" stop-color="#B5D8CC"/>
          </linearGradient>
        </svg>
      </a>
      </nav>

      <div class="container-fluid">
        <div class="row">
          <div class="col">
            <h1 class="text-center">Klimadaten für Dinosaur, Colorado, USA</h1>
            <xsl:call-template name="createMainCards"/>
            <xsl:call-template name="createSubCards"/>
            <xsl:call-template name="createMonthsBase"/>
          </div>
        </div>
        
        <div class="col" id="yearCol">
          <xsl:call-template name="createYearView"/>
        </div>

        <div class="col" id="dayCol">
          <xsl:call-template name="createDayView"/>
        </div>
      </div>

 

      <footer class="page-footer font-small fixed-bottom" id="fixedFooter">
        <div class="container-fluid">
          <div class="footer-copyright text-center">© 2019 Copyright:
            <a class="linkColor" href="https://github.com/iTReprise"> Florian Utku</a>
          </div>
        </div>
      </footer>

      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
      <script src="/chartist/chartist.min.js"></script>
      <script src="/chartist/chartist-plugin-zoom.min.js"></script>
      <script src="/climateData.js"></script>
      <script src="/yearView.js"></script>  
      <script src="/dayView.js"></script>  
    </body>
  </html>
</xsl:template>

<xsl:template name="createMainCards">

  <div class="container allMainCards">
  <h2 class="text-center">Hauptmenü</h2><br/>
    <br/>
    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card1" id="tempMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zur Temperatur</h6>
          <p class="card-text">
            Aktuelle Werte (bei Zeitpunkt der Messung), Durchschnitt in der letzten Stunde, Maximum und Minimum der letzten Stunde.
          </p>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card2" id="surfaceMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Oberfläche</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zur Oberflächentemperatur</h6>
          <p class="card-text">
            Durchschnitt in der letzten Stunde, Maximum und Minimum der letzten Stunde.
          </p>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card3" id="solarMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Sonneneinstrahlung</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zur Sonneneinstrahlung</h6>
          <p class="card-text">
            Durchschnitt in der letzten Stunde, Maximum und Minimum der letzten Stunde.
          </p>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card4" id="humidMain" style="width: 18rem;">
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

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card2" id="showCurTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Aktuelle Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Werte zum Messzeitpunkt</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card3" id="showAvgTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Durchschnittliche Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Durchschnittswerte der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card4" id="showMaxTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Maximale Temperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Maximalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card5" id="showMinTemp" style="width: 18rem;">
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
  
    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card2" id="showAvgSurTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Durchschnittliche Oberflächentemperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Durchschnittswerte der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card3" id="showMaxSurTemp" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Maximale Oberflächentemperatur</h5>
          <h6 class="card-subtitle mb-2 text-muted">Maximalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card4" id="showMinSurTemp" style="width: 18rem;">
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

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card2" id="showAvgSolRad" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Durchschnittliche Sonneneinstrahlung</h5>
          <h6 class="card-subtitle mb-2 text-muted">Durchschnittswerte der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card3" id="showMaxSolRad" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Maximale Sonneneinstrahlung</h5>
          <h6 class="card-subtitle mb-2 text-muted">Maximalwert der letzten Stunde</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card4" id="showMinSolRad" style="width: 18rem;">
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

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 backToMain" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">Hauptmenü</h5>
          <h6 class="card-subtitle mb-2 text-muted">Eine Ebene zurück.</h6>
        </div>
      </div>
    </div>

    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card2" id="showAvgRelHum" style="width: 18rem;">
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
    <div class="row justify-content-sm-center showAllTimes">
      <div class="col-sm text-center">
        <button type="button" class="btn timesBtn btn-outline active" id="btnA">01:00 Uhr</button>
      </div>
      <div class="col-sm text-center">
        <button type="button" class="btn timesBtn btn-outline" id="btnB">06:00 Uhr</button>
      </div>
      <div class="col-sm text-center">
        <button type="button" class="btn timesBtn btn-outline" id="btnC">11:00 Uhr</button>
      </div>
      <div class="col-sm text-center">
        <button type="button" class="btn timesBtn btn-outline" id="btnD">16:00 Uhr</button>
      </div>
      <div class="col-sm text-center">
        <button type="button" class="btn timesBtn btn-outline" id="btnE">21:00 Uhr</button>
      </div>
    </div>
    <br/>
    <div class="row justify-content-sm-center showResets">
      <div class="col-sm text-center">
        <button type="button" class="btn timesBtn btn-outline" id="btnReset">Zurücksetzen</button>
      </div>
      <div class="col-sm text-center">
        <button type="button" class="btn timesBtn btn-outline" id="btnApply">Anwenden</button>
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
    <div class="row justify-content-sm-center">
      <div class="card col-md-12 mb-2 card1 backTo{$valueFull}" style="width: 18rem;">
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

  <h3 class="text-center"><xsl:value-of select="$monthFull"/>, 2017</h3>
  <div class="row md-center">
    <div id="{$monthAbr}{$value}" class="ct-chart ct-major-seventh {$value}Chart col-md-12 mb-2"/>
  </div>
  <br/>
</xsl:template>

<xsl:template name="createYearView">
  <h2 class="text-center">
    <div class="container">
      <div class="row justify-content-md-center">
        <div class="dropdown dropdownValue col-sm-auto">
          <button class="btn btn-outline btn-lg dropdown-toggle" type="button" id="dropdownValueBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Aktuelle Temperatur</button>
          <div class="dropdown-menu" aria-labelledby="dropdownValueBtn">
            <a class="dropdown-item valueSelect active" id="toggle_curTemp">Aktuelle Temperatur</a>
            <a class="dropdown-item valueSelect" id="toggle_avgTemp">Durchschnittliche Temperatur</a>
            <a class="dropdown-item valueSelect" id="toggle_maxTemp">Maximale Temperatur</a>
            <a class="dropdown-item valueSelect" id="toggle_minTemp">Minimale Temperatur</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item valueSelect" id="toggle_avgSurTemp">Durchschnittliche Oberflächentemperatur</a>
            <a class="dropdown-item valueSelect" id="toggle_maxSurTemp">Maximale Oberflächentemperatur</a>
            <a class="dropdown-item valueSelect" id="toggle_minSurTemp">Minimale Oberflächentemperatur</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item valueSelect" id="toggle_avgSolRad">Durchschnittliche Sonneneinstrahlung</a>
            <a class="dropdown-item valueSelect" id="toggle_maxSolRad">Maximale Sonneneinstrahlung</a>
            <a class="dropdown-item valueSelect" id="toggle_minSolRad">Minimale Sonneneinstrahlung</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item valueSelect" id="toggle_avgRelHum">Durchschnittliche Feuchtigkeit</a>
          </div>
        </div>

        <div class="col-sm-auto">
          <a class="btn btn-outline btn-lg">im Jahr 2017,</a>
        </div>

        <div class="dropdown dropdownTime col-sm-auto">
          <button class="btn btn-outline dropdown-toggle btn-lg" type="button" id="dropdownTimeBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">abends</button>
          <div class="dropdown-menu" aria-labelledby="dropdownTimeBtn">
            <a class="dropdown-item timeSelect" id="toggleNightView">nachts</a>
            <a class="dropdown-item timeSelect" id="toggleNoonView">mittags</a>
            <a class="dropdown-item timeSelect active" id="toggleEveView">abends</a>
          </div>
        </div>
      </div>
    </div>
  </h2>

  <div class="row md-center">
    <div id="yearChart" class="ct-chart ct-major-tenth col-md-12 mb-2" oncontextmenu="return false;"/>
  </div>

  <svg style="width:0;height:0;poisiton:absolute;" aria-hidden="true" focusable="false">
    <linearGradient id="fiveColorGradientTakeTwo" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#8D3B72"/>
      <stop offset="25%" stop-color="#8A7090"/>
      <stop offset="50%" stop-color="#89A7A7"/>
      <stop offset="75%" stop-color="#72E1D1"/>
      <stop offset="100%" stop-color="#B5D8CC"/>
    </linearGradient>
  </svg>

</xsl:template>

<xsl:template name="createDayView">
  <h2 class="text-center">
    <div class="container">
      <div class="row justify-content-md-center">
        <div class="dropdown dropdownValue col-sm-auto">
          <button class="btn btn-outline btn-lg dropdown-toggle" type="button" id="dropdownValueBtnDay" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Aktuelle Temperatur</button>
          <div class="dropdown-menu" aria-labelledby="dropdownValueBtnDay">
            <a class="dropdown-item valueSelectDay active" id="toggle_curTemp">Aktuelle Temperatur</a>
            <a class="dropdown-item valueSelectDay" id="toggle_avgTemp">Durchschnittliche Temperatur</a>
            <a class="dropdown-item valueSelectDay" id="toggle_maxTemp">Maximale Temperatur</a>
            <a class="dropdown-item valueSelectDay" id="toggle_minTemp">Minimale Temperatur</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item valueSelectDay" id="toggle_avgSurTemp">Durchschnittliche Oberflächentemperatur</a>
            <a class="dropdown-item valueSelectDay" id="toggle_maxSurTemp">Maximale Oberflächentemperatur</a>
            <a class="dropdown-item valueSelectDay" id="toggle_minSurTemp">Minimale Oberflächentemperatur</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item valueSelectDay" id="toggle_avgSolRad">Durchschnittliche Sonneneinstrahlung</a>
            <a class="dropdown-item valueSelectDay" id="toggle_maxSolRad">Maximale Sonneneinstrahlung</a>
            <a class="dropdown-item valueSelectDay" id="toggle_minSolRad">Minimale Sonneneinstrahlung</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item valueSelectDay" id="toggle_avgRelHum">Durchschnittliche Feuchtigkeit</a>
          </div>
        </div>

        <div class="col-sm-auto">
          <a class="btn btn-outline btn-lg" id="datePicker">am 04.07.2017</a>
        </div>

        <div class="col-sm-auto">
          <a class="btn btn-outline btn-lg">von 00:00 bis 24:00 Uhr (UTC)</a>
        </div>
      </div>
    </div>
  </h2>
  
  <div class="row justify-content-md-center">
    <div id="dayChart" class="ct-chart ct-major-tenth col-md-12 mb-2"/>
  </div>

</xsl:template>

</xsl:stylesheet>