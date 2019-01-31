# Prüfungsprojekt im Fach Dokumentbeschreibungssprachen
## Wintersemester 2018/2019 - Florian Utku


### Aufgabe 1:
Meine Daten sind in 4 Kategorien mit eigenen Unterkategorien eingeteilt, die da wären:
  #### 1. Temperatur
    * Aktuelle Temperatur (Feld 9)
    * Durchschnittliche Temperatur (Feld 10)
    * Maximale Temperatur (Feld 11)
    * Minimale Temperatur (Feld 12)
  #### 2. Oberflächentemperatur
    * Durchschnittliche Oberflächentemperatur (Feld 21)
    * Maximale Oberflächentemperatur (Feld 23)
    * Minimale Oberflächentemperatur (Feld 25)
  #### 3. Sonneneinstrahlung
    * Durchschnittliche Sonneneinstrahlung (Feld 14)
    * Maximale Sonneneinstrahlung (Feld 16)
    * Minimale Sonneneinstrahlung (Feld 18)
  #### 4. Relative Luftfeuchtigkeit
    * Durchschnittliche Relative Luftfeuchtigkeit (Feld 27)

Für Referenzen der einzelnen Felder - siehe Punkt 5, [hier](ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/hourly02/README.txt "Readme der Klimadaten"). Andere Felder wurde ignoriert, hauptsächlich aufgrund fehlenden Messwerten.

Alle jene Daten existieren für jede volle Stunde an jedem Tag im Jahr 2017. Sollte ein Datenwert in meiner [Quelldatei](ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/hourly02/2017/CRNH0203-2017-CO_Dinosaur_2_E.txt "Klimadaten von Dinosaur") fehlerhaft sein bzw. nicht vorliegen, dann hat das relevante XML-Element kein Inhalt.

Neben diesen Daten wird auch die LocationID siehe Punkt 5, Feld 1 [hier](ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/hourly02/README.txt "Readme der Klimadaten") und die Position der Messstation gespeichert.

***
### Aufgabe 2:
Die leere XML-Datei befindet sich im Ordner drafts+docs unter dem Namen climateData_ohne_daten.xml
* [climateData_ohne_daten.xml](https://github.com/iTReprise/XML_Klimadaten_WS18-19/blob/master/drafts%2Bdocs/climateData_ohne_daten.xml)

Das Baumdiagramm befindet sich im Ordner drafts+docs unter dem Namen baumdiagramm.jpeg
* [baumdiagramm.jpeg](https://github.com/iTReprise/XML_Klimadaten_WS18-19/blob/master/drafts%2Bdocs/baumdiagramm.jpeg)

***
### Aufgabe 3:
Die XML-Datei, welche aus der CSV-Datei von Dinosaur enstanden ist befindet sich im Ordner data unter dem Namen climateData.xml
* [climateData.xml](https://github.com/iTReprise/XML_Klimadaten_WS18-19/blob/master/data/climateData.xml)

***
### Aufgabe 4:
Die DTD-Datei befindet sich im Ordner data unter dem Namen climateData.dtd
* [climateData.dtd](https://github.com/iTReprise/XML_Klimadaten_WS18-19/blob/master/data/climateData.dtd)

Zur Validierung wurde das Kommandozeilen Programm _xmllint_ unter Linux verwendet. Der passende Aufruf ist folgender:

```xmllint -noout -dtdvalid climateData.dtd climateData.xml```

***
### Aufgabe 5:
Die XSD-Datei befindet sich im Ordner data unter dem Namen climateData.xsd
* [climateData.xsd](https://github.com/iTReprise/XML_Klimadaten_WS18-19/blob/master/data/climateData.xsd)

Zur Validierung wurde das Kommandozeilen Programm _xmllint_ unter Linux verwendet. Der passende Aufruf ist folgender:

```xmllint -schema climateData.xsd climateData.xml -noout```

***
### Aufgabe 6:
Die XSL-Datei befindet sich im Ordner data unter dem Namen climateData.xsl
* [climateData.xsl](https://github.com/iTReprise/XML_Klimadaten_WS18-19/blob/master/data/climateData.xsl)

Es wurde in der XSL-Datei keinerlei XPATH-Ausdrücke verwendet, ihre einzige Funktion ist die Erstellung aller relevanten HTML-Elemente. Das liegt daran, dass es mir persönlicher einfacher gefallen ist, die XPATH-Abfragen direkt in JavaScript zu machen (siehe z.B. Zeile 55 in data/yearView.js). 

Bei Versuchen, die XPATH-Abfragen und Erstellung der SVG-Charts schon direkt bei der XML-Transformation zu machen bin ich auf das Problem gestoßen, dass die Charts mittels der gewählten Chart library in JavaScript erstellt werden wollen (sonst hätte alles per Hand gemacht werden müssen). Möglich wäre hier in der XSL-Datei einzelne HTML-Elemente anzulegen und diese dann mit den Daten zu befüllen welche dann wiederrum von einem HTML-Parser in JavaScript abgegriffen werden um daraus dann die Charts zu bauen.

#### Diese Methode hätte 2 gravierende Nachteile:
* Performance: Wenn alle Daten und mögliche Kombination der Daten bei Laden der Webseite erstellt werden, verlängert sich die Ladezeit um ein Vielfaches.
* Datenmüll: Die HTML-Datei bestände dann aus vielerlei unsichtbaren Elementen deren einziger Inhalt eine Aneinanderreihung von Dezimalzahlen wäre. Besonders für die Tagesansicht wäre das extrem unübersichtlich geworden.

Sonst befinden sich in der zugrundeliegenden XML-Datei keine bis wenige relevanten Daten, welche bei Transformation besonders beachtet werden müssten. Dadurch ist die XSL-Datei nun im Prinzip nur eine glorifizierte HTML-Datei.

In Retrospektive betrachtet wäre es sinnvollter gewesen, wenn die XML-Datei wirklich nur in einer JavaScript-Datei geladen wird und die Anzeige eine direkte HTML-Datei ist. 

Die XSL-Funktion ```call-template``` hat trotzdem viel ansonsten doppelt geschriebenen Code vermieden.

***
### Aufgabe 7:
Die fertige Webseite kann (Transformation lokal mittels `xsltproc`) **[hier](http://www.imn.htwk-leipzig.de/~futku/ "index.html")** oder auch als direkte XML-Datei (Transformation wird vom Browser übernommen) **[hier](http://www.imn.htwk-leipzig.de/~futku/climateData.xml "climateData.xml")** angesehen werden.

Die Bedienung sollte selbsterklärend sein. In der Jahresansicht kann gezoomt werden, in dem die linke Maustaste gedrückt wird und ein Fenster gezogen wird. Ein Klick der rechten Maustaste auf die Grafik setzt den Zoom zurück.
<br/>

Getestet wurde die Seite im Desktopbereich auf **Chromium/Chrome**, **Firefox** und **Microsoft Edge**.<br/>
Im Mobilsektor läuft  es problemlos in **Safari** und **Chrome**.

Im Internet Explorer läuft es nicht, das liegt daran, dass die JavaScript-Dateien im ECMAScript Standard 8 geschrieben wurden und dieser nicht von Internet Explorer unterstützt wird.<br/>
Wenn unbedingt notwendig, können die drei JavaScript-Dateien mit [Babel](https://babeljs.io/ "Babel Compiler") kompiliert werden. Dann sollte es funktionieren. Dies wurde aber nicht getestet.
