/* global $ */
/* global Chartist */
/* global XPathResult */
/* global xmlDocument */

let activeDate = '2017.01.01';
let init = true;

async function createChartDay(data, unit) {
  const fixedUnit = unit === 'C' || unit === 'F' ? `°${unit}` : `${unit}`;

  const chartData = { series: [data] };
  const chartOptions = {
    showArea: true,
    showPoint: false,
    fullWidth: true,
    axisY: {
      labelInterpolationFnc: value => value + fixedUnit,
      offset: 60,
      onlyInteger: true,
    },
  };

  const chart = Chartist.Line('#dayChart', chartData, chartOptions);

  /* animate chart */
  chart.on('draw', (event) => {
    if (event.type === 'line') {
      event.element.animate({
        d: {
          begin: event.index * 200,
          dur: 1000,
          from: event.path.clone().scale(1, 0).translate(0, event.chartRect.height()).stringify(),
          to: event.path.clone().stringify(),
          easing: Chartist.Svg.Easing.easeInOutCirc,
        },
      });
    }
  });
}

async function parseXMLDay(xpathExp, day) {
  const data = [];
  const date = day || activeDate;

  /* eslint no-nested-ternary: 0 */
  const iterator = xmlDocument.evaluate(`//entry[@date='${date}']/${xpathExp}`, xmlDocument, null, XPathResult.ANY_TYPE, null);

  let curr = iterator.iterateNext();
  const unit = curr.getAttribute('unit');

  while (curr) {
    data.push(curr.textContent);
    curr = iterator.iterateNext();
  }

  createChartDay(data, unit);
}

function changeChartDay(day) {
  let name;
  let xpathExp;

  $('.valueSelectDay').each((index, element) => {
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

  $('#dropdownValueBtnDay').text(name);

  parseXMLDay(xpathExp, day);
}

$(() => {
  $('#datePicker').datepicker({
    format: 'dd.mm.yyyy',
    startDate: '01.01.2017',
    endDate: '31.12.2017',
    defaultViewDate: '01.01.2017',
    autoclose: true,
  });

  $('#datePicker').on('changeDate', ((event) => {
    const day = event.format().split('.').reverse().join('.');
    activeDate = day;

    $('#datePicker').text(`am ${event.format()}`);
    changeChartDay(day);
  }));

  $('#dayView').click(() => {
    $('.allMainCards').hide();
    $('.subCards').hide();
    $('.monthsBase').hide();
    $('#yearCol').hide();

    $('#dayCol').show();

    if (init) {
      parseXMLDay('temperature/curTemp');
      init = false;
    }
  });

  $('.valueSelectDay').click(function setNewTime() {
    $('.valueSelectDay').each((index, element) => $(element).removeClass('active'));
    $($(this).get(0)).addClass('active');

    changeChartDay();
  });
});
