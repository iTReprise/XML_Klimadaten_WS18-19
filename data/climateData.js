/* global $ */
/* global Chartist */
/* global XPathResult */
/* global fetch */
/* global jQuery */

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

function doStuff(values) {
  const currMonthString = dateToStringMap[values.shift()];
  let currInformation = values.shift();
  currInformation = currInformation.charAt(0).toUpperCase() + currInformation.slice(1);

  Chartist.Line(`#${currMonthString + currInformation}`, {
    labels: [],
    series: [values],
  });
}

async function getAllMonthEntries(xmlDoc, date, value) {
  const iterator = xmlDoc.evaluate(`//entry[starts-with(@date, ${date})]/${value}`, xmlDoc, null, XPathResult.ANY_TYPE, null);

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

async function startXPathFuncs(xmlText) {
  const xmlDoc = jQuery.parseXML(xmlText);

  for (let i = 1; i <= 12; i += 1) {
    getAllMonthEntries(xmlDoc, `2017.${i < 10 ? `0${i}` : i}`, 'temperature/curTemp').then(doStuff);
  }
}

fetch('http://localhost:1543/climateData.xml').then(response => response.text().then(text => startXPathFuncs(text)));

$(() => {
  /*
  const janCurTempData = $('#janCurTempData').text().slice(0, -1).split(/,/);
  Chartist.Line('#janCurTemp', {
    labels: [1, 2, 3, 4],
    series: [janCurTempData],
  });
  */

/*   const febCurTempData = $('#febCurTempData').text().slice(0, -1).split(/,/);
  Chartist.Line('#febCurTemp', {
    labels: [1, 2, 3, 4],
    series: [febCurTempData],
  });

  const marCurTempData = $('#marCurTempData').text().slice(0, -1).split(/,/);
  Chartist.Line('#marCurTemp', {
    labels: [1, 2, 3, 4],
    series: [marCurTempData],
  });

  const aprCurTempData = $('#aprCurTempData').text().slice(0, -1).split(/,/);
  Chartist.Line('#aprCurTemp', {
    labels: [1, 2, 3, 4],
    series: [aprCurTempData],
  }); */
});
