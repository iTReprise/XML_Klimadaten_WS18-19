/* global $ */
/* global Chartist */
/* global XPathResult */
/* global fetch */
/* global jQuery */

/**
 * Hashmap containing key-value pairs of
 * a month string and its shorthand string equivalent
 */
const dateToStringMap = {
  2017.01: 'jan',
  2017.02: 'feb',
  2017.03: 'mar',
  2017.04: 'apr',
  2017.05: 'may',
  2017.06: 'jun',
  2017.07: 'jul',
  2017.08: 'aug',
  2017.09: 'sep',
  '2017.10': 'oct', /* what */
  2017.11: 'nov',
  2017.12: 'dec',
};

const times = ['17:00']; /* change entries to show more than one line per chart */

const initCharts = {
  curTemp: true,
  avgTemp: false,
  maxTemp: false,
  minTemp: false,
  avgSurTemp: false,
  maxSurTemp: false,
  minSurTemp: false,
  avgSolar: false,
  maxSolar: false,
  minSolar: false,
  avgRelHum: false,
};

let xmlDocument;

/**
 * Analyze an array of values and create the right chart
 * @param {array} values All entries,
 *        array[0] = 'jan' || 'feb' || etc.,
 *        array[1] = 'curTemp' || 'avgtemp' || etc.
 */
function doStuff(dataPoints) {
  const currMonthString = dateToStringMap[dataPoints.shift()];
  let currInf = dataPoints.shift();
  currInf = currInf.charAt(0).toUpperCase() + currInf.slice(1);
  let unit = dataPoints.shift();
  unit = unit === 'C' || unit === 'F' ? `°${unit}` : ` ${unit}`;

  const labelValues = [];
  for (let i = 0; i < dataPoints[0].length; i += 1) {
    labelValues.push(i + 1);
  }

  Chartist.Line(`#${currMonthString + currInf}`,
    {
      labels: labelValues,
      series: dataPoints,
    },
    {
      showPoint: false,
      axisY: {
        labelInterpolationFnc: value => value + unit,
        onlyInteger: true,
      },
    });
}

/**
 * Get all values with the specified date and time restrictions
 * @param {document} xmlDoc The XML Document
 * @param {string} date Date in this format: 'yyyy.mm.dd'
 * @param {sting} time Time in this format: 'hh:mm'
 * @param {string} value xPath expression to select the relevant nodes,
 *        f.e. /temperature/curTemp
 * @returns {Promise} Array containg all values
 */
async function getAllMonthEntries(xmlDoc, date, xpathExp) {
  const dataPoints = [];
  let unit;

  for (let i = 0; i < times.length; i += 1) {
    const element = times[i];

    const iterator = xmlDoc.evaluate(
      `//entry[starts-with(@date, '${date}') and @time='${element}']/${xpathExp}`,
      xmlDoc,
      null,
      XPathResult.ANY_TYPE,
      null,
    );

    const array = [];
    let curr = iterator.iterateNext();
    unit = curr.getAttribute('unit');

    while (curr) {
      array.push(curr.textContent);
      curr = iterator.iterateNext();
    }
    dataPoints.push(array);
  }

  dataPoints.unshift(unit);
  dataPoints.unshift(xpathExp.split('/').pop());
  dataPoints.unshift(date);

  return dataPoints;
}

/**
 * Parse xmlTest to xml file and start calling xPath expressions
 * @param {text} xmlText The text of a valid xml file
 */
async function startXPathFuncs(xpathExp, xmlText) {
  let xmlDoc;
  if (xmlText !== undefined) {
    xmlDoc = jQuery.parseXML(xmlText);
    xmlDocument = xmlDoc;
  } else {
    xmlDoc = xmlDocument;
  }

  for (let i = 1; i <= 12; i += 1) {
    getAllMonthEntries(
      xmlDoc,
      `2017.${i < 10 ? `0${i}` : i}`,
      xpathExp,
    ).then(doStuff);
  }
}

/**
 * Main
 * Fetch a xml file and start evaluation of it
 */
fetch('http://localhost:1543/climateData.xml')
  .then(response => response.text()
    .then(xmlText => startXPathFuncs('temperature/curTemp', xmlText)));


/* eslint no-underscore-dangle: 0 */
$(() => {
  $('#tempMain').click(() => {
    $('.allMainCards').toggle();
    $('.temperatureCards').toggle();
  });

  $('#surfaceMain').click(() => {
    $('.allMainCards').toggle();
    $('.surfaceCards').toggle();
  });

  $('#solarMain').click(() => {
    $('.allMainCards').toggle();
    $('.solarCards').toggle();
  });

  $('#humidMain').click(() => {
    $('.allMainCards').toggle();
    $('.humidityCards').toggle();
  });

  /* TODO add other returns */
  $('.backToTemperatur').click(() => {
    $('.temperatureCards').toggle();
    $('.monthsBase').hide();
  });

  $('.backToOberflächentemperatur').click(() => {
    $('.surfaceCards').toggle();
    $('.monthsBase').hide();
  });

  $('.backToSonneneinstrahlung').click(() => {
    $('.solarCards').toggle();
    $('.monthsBase').hide();
  });

  $('.backToLuftfeuchtigkeit').click(() => {
    $('.humidityCards').toggle();
    $('.monthsBase').hide();
  });

  $('.backToMain').click(() => {
    $('.allMainCards').toggle();
    $('.subCards').hide();
  });

  $('#showCurTemp').click(() => {
    $('#everyMonthCurTemp').toggle();
    $('.subCards').hide();
    $('.CurTempChart').each((index, element) => element.__chartist__.update());
  });

  $('#showAvgTemp').click(() => {
    $('#everyMonthAvgTemp').toggle();
    $('.subCards').hide();
    if (initCharts.avgTemp) {
      $('.AvgTempChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('temperature/avgTemp');
    }
  });

  $('#showMaxTemp').click(() => {
    $('#everyMonthMaxTemp').toggle();
    $('.subCards').hide();
    if (initCharts.avgTemp) {
      $('.MaxTempChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('temperature/maxTemp');
    }
  });

  $('#showMinTemp').click(() => {
    $('#everyMonthMinTemp').toggle();
    $('.subCards').hide();
    if (initCharts.avgTemp) {
      $('.MinTempChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('temperature/minTemp');
    }
  });

  $('#showAvgSurTemp').click(() => {
    $('#everyMonthAvgSurTemp').toggle();
    $('.subCards').hide();
    if (initCharts.avgSurTemp) {
      $('.AvgSurTempChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('surface/avgSurTemp');
    }
  });

  $('#showMaxSurTemp').click(() => {
    $('#everyMonthMaxSurTemp').toggle();
    $('.subCards').hide();
    if (initCharts.maxSurTemp) {
      $('.MaxSurTempChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('surface/maxSurTemp');
    }
  });

  $('#showMinSurTemp').click(() => {
    $('#everyMonthMinSurTemp').toggle();
    $('.subCards').hide();
    if (initCharts.minSurTemp) {
      $('.MinSurTempChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('surface/minSurTemp');
    }
  });

  $('#showAvgSolRad').click(() => {
    $('#everyMonthAvgSolRad').toggle();
    $('.subCards').hide();
    if (initCharts.avgSolar) {
      $('.AvgSolarChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('solar/avgSolRad');
    }
  });

  $('#showMaxSolRad').click(() => {
    $('#everyMonthMaxSolRad').toggle();
    $('.subCards').hide();
    if (initCharts.maxSolarTemp) {
      $('.MaxSolarChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('solar/maxSolRad');
    }
  });

  $('#showMinSolRad').click(() => {
    $('#everyMonthMinSolRad').toggle();
    $('.subCards').hide();
    if (initCharts.minSurTemp) {
      $('.MinSolarChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('solar/minSolRad');
    }
  });

  $('#showAvgRelHum').click(() => {
    $('#everyMonthAvgRelHum').toggle();
    $('.subCards').hide();
    if (initCharts.avgSolar) {
      $('.AvgRelHumChart').each((index, element) => element.__chartist__.update());
    } else {
      startXPathFuncs('humidity/avgRelHum');
    }
  });
});
