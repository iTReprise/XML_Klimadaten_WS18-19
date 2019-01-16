/* global $ */
/* global Chartist */
/* global XPathResult */
/* global fetch */
/* global jQuery */

function test(xmlText) {
  const xmlDoc = jQuery.parseXML(xmlText);
  const xpath = xmlDoc.evaluate('//latitude/text()', xmlDoc, null, XPathResult.ANY_TYPE, null);
  console.log(xpath);
}

fetch('http://localhost:1543/climateData.xml').then(response => response.text().then(text => test(text)));

$(() => {
  const janCurTempData = $('#janCurTempData').text().slice(0, -1).split(/,/);
  Chartist.Line('#janCurTemp', {
    labels: [1, 2, 3, 4],
    series: [janCurTempData],
  });

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
