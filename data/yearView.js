/* global $ */
/* global Chartist */
/* global XPathResult */
/* global xmlDocument */

async function createChart(data, unit, xpathExp) {
  const fixedUnit = unit === 'C' || unit === 'F' ? `°${unit}` : `${unit}`;
  const dataPoints = [[]];

  let i = 1;
  await data.forEach(value => dataPoints[0].push({ x: i++, y: value })); /* eslint no-plusplus: 0 */

  const chartData = { series: dataPoints };
  const chartOptions = {
    high: 40,
    low: -25,
    base: 0,
    showArea: true,
    showLine: true,
    showPoint: false,
    fullWidth: true,
    axisX: {
      type: Chartist.AutoScaleAxis,
      showGrid: true,
      showLabel: true,
      onlyInteger: true,
    },
    axisY: {
      labelInterpolationFnc: value => value + fixedUnit,
      offset: 60,
      onlyInteger: true,
    },
    plugins: [Chartist.plugins.zoom({
      onZoom: null,
      resetOnRightMouseBtn: true,
    })],
  };

  Chartist.Line('#yearChart', chartData, chartOptions);
}

async function parseXML(xpathExp) {
  const data = [];
  const stringTime = $('#yearViewTime').text();

  /* eslint no-nested-ternary: 0 */
  const time = stringTime === 'nachts' ? '09:00' : stringTime === 'mittags' ? '18:00' : '01:00';
  const iterator = xmlDocument.evaluate(`//entry[@time='${time}']/${xpathExp}`, xmlDocument, null, XPathResult.ANY_TYPE, null);

  let curr = iterator.iterateNext();
  const unit = curr.getAttribute('unit');

  while (curr) {
    data.push(curr.textContent);
    curr = iterator.iterateNext();
  }

  createChart(data, unit, xpathExp);
}

$(() => {
  $('#yearView').click(() => {
    $('.allMainCards').hide();
    $('.subCards').hide();
    $('.monthsBase').hide();

    $('#yearCol').show();

    parseXML('temperature/curTemp');
  });
});


/**
 * nachts = 09:00
 * mittag = 18:00
 * abend = 00:01
 */
