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

Für Referenzen der einzelnen Felder - [siehe Punkt 5, hier](ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/hourly02/README.txt "Readme der Klimadaten"). Andere Felder wurde ignoriert, hauptsächlich aufgrund fehlenden Messwerten.

Alle jene Daten existieren für jede volle Stunde an jedem Tag im Jahr 2017. Sollte ein Datenwert in meiner [Quelldatei](ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/hourly02/2017/CRNH0203-2017-CO_Dinosaur_2_E.txt "Klimadaten von Dinosaur") fehlerhaft sein bzw. nicht vorliegen, dann hat das relevante XML-Element kein Inhalt.

Neben diesen Daten wird auch die LocationID [siehe Punkt 5, Feld 1 hier](ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/hourly02/README.txt "Readme der Klimadaten") und die Position der Messstation gespeichert.

### Aufgabe 3:
Die leere XML-Datei befindet sich im Ordner drafts+docs unter dem Namen climateData_ohne_daten.xml
* ()








http://www.imn.htwk-leipzig.de/~futku/climateData.xml
