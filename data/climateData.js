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
  '2017.10': 'oct',
  2017.11: 'nov',
  2017.12: 'dec',
};

let xmlDocument;

/**
 * Analyze an array of values and create the right chart
 * @param {array} values All entries,
 *        array[0] = 'jan' || 'feb' || etc.,
 *        array[1] = 'curTemp' || 'avgtemp' || etc.
 */
function doStuff(values) {
  const currMonthString = dateToStringMap[values.shift()];
  let currInf = values.shift();
  currInf = currInf.charAt(0).toUpperCase() + currInf.slice(1);

  const labelValues = [];
  for (let i = 0; i < values.length; i += 1) {
    labelValues.push(i + 1);
  }

  Chartist.Line(`#${currMonthString + currInf}`, {
    labels: labelValues,
    series: [values],
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
async function getAllMonthEntries(xmlDoc, date, time, value) {
  const iterator = xmlDoc.evaluate(
    `//entry[starts-with(@date, '${date}') and @time='${time}']/${value}`,
    xmlDoc,
    null,
    XPathResult.ANY_TYPE,
    null,
  );

  const array = [];
  let curr = iterator.iterateNext();

  while (curr) {
    array.push(curr.textContent);
    curr = iterator.iterateNext();
  }
  array.unshift(value.split('/').pop());
  array.unshift(date);
  return array;
}

/**
 * Parse xmlTest to xml file and start calling xPath expressions
 * @param {text} xmlText The text of a valid xml file
 */
async function startXPathFuncs(xmlText) {
  const xmlDoc = jQuery.parseXML(xmlText);
  xmlDocument = xmlDoc;

  for (let i = 1; i <= 12; i += 1) {
    getAllMonthEntries(
      xmlDoc,
      `2017.${i < 10 ? `0${i}` : i}`,
      '01:00',
      'temperature/curTemp',
    ).then(doStuff);
  }
}

/**
 * Main
 * Fetch a xml file and start evaluation of it
 */
fetch('http://localhost:1543/climateData.xml')
  .then(response => response.text()
    .then(text => startXPathFuncs(text)));
