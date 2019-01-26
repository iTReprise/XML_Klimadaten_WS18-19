/* global $ */
/* global Chartist */
/* global XPathResult */
/* global xmlDocument */

let initYear = true;

async function createChart(data, unit) {
  const fixedUnit = unit === 'C' || unit === 'F' ? `°${unit}` : `${unit}`;
  
  /* empty value to missing value */
  /* eslint no-confusing-arrow: 0 */
  let dataPoints = await data;
  dataPoints = dataPoints.map(value => value === '' ? null : value);

  /* needs to be a certain format to zoom */ 
  let specialArray = [[]];
  for (let i = 0; i < dataPoints.length; i += 1) {
    const element = dataPoints[i];
    specialArray[0].push({ x: i, y: element });
  }

  const chartData = { series: specialArray };
  const chartOptions = {
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

async function parseXML(xpathExp, stringTime) {
  const data = [];
  // const stringTime = $('#yearViewTime').text();

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

function changeChart() {
  let name;
  let time;
  let xpathExp;

  $('.timeSelect').each((index, element) => {
    if ($(element).hasClass('active')) {
      time = $(element).get(0).text;
    }
  });

  $('.valueSelect').each((index, element) => {
    if ($(element).hasClass('active')) {
      xpathExp = element.getAttribute('id').substring(7);
      name = $(element).get(0).text;
    }
  });

  switch (xpathExp.substring(3, 6)) {
    case 'Tem':
      xpathExp = `temperature/${xpathExp}`;
      break;
    case 'Sur':
      xpathExp = `surface/${xpathExp}`;
      break;
    case 'Sol':
      xpathExp = `solar/${xpathExp}`;
      break;
    case 'Rel':
      xpathExp = `humidity/${xpathExp}`;
      break;
    default:
      break;
  }

  $('#dropdownTimeBtn').text(time);
  $('#dropdownValueBtn').text(name);

  parseXML(xpathExp, time);
}

/**
 * nachts = 09:00
 * mittag = 18:00
 * abend = 00:01
 */
$(() => {
  $('#yearView').click(() => {
    $('.allMainCards').hide();
    $('.subCards').hide();
    $('.monthsBase').hide();
    $('#dayCol').hide();

    $('#yearCol').show();

    if (initYear) {
      parseXML('temperature/curTemp', 'abends');
      initYear = false;
    }
  });

  $('.timeSelect').click(function setNewTime() {
    $('.timeSelect').each((index, element) => $(element).removeClass('active'));
    $($(this).get(0)).addClass('active');

    changeChart();
  });

  $('.valueSelect').click(function setNewTime() {
    $('.valueSelect').each((index, element) => $(element).removeClass('active'));
    $($(this).get(0)).addClass('active');

    changeChart();
  });
});
