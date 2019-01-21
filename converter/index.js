const fs = require('fs');

const input = '../data/datenInText.csv';
const output = '../data/climateData.xml';

function finished() {
  console.log('Successfully created the xml file. Closing now.');
}

function convert(data, endString) {
  const meta = `<climateData
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="climateData.xsd"
  locationID="${data[1][0]}">
  <longitude unit="decimal_degrees">${data[1][6]}</longitude>
  <latitude unit="decimal_degrees">${data[1][7]}</latitude>`;
  fs.appendFileSync(output, meta, 'utf8');

  for (let i = 1; i <= data.length - 2; i += 1) {
    data[i].map((value, index) => {
      if (value <= -9999) data[i][index] = null;
    });
    const date = `${data[i][1].substring(0, 4)}.${data[i][1].substring(4, 6)}.${data[i][1].substring(6, 8)}`;
    const time = data[i][2].length === 4
      ? `${data[i][2].substring(0, 2)}:${data[i][2].substring(2, 4)}`
      : data[i][2].length === 3
        ? `0${data[i][2].substring(0, 1)}:${data[i][2].substring(1, 4)}`
        : '00:00';

    const entry = `\n
  <entry date="${date}" time="${time}" standard="UTC">
    <temperature>
      <curTemp unit="C">${data[i][8]}</curTemp>
      <avgTemp unit="C">${data[i][9]}</avgTemp>
      <maxTemp unit="C">${data[i][10]}</maxTemp>
      <minTemp unit="C">${data[i][11]}</minTemp>
    </temperature>

    <surface>
      <avgSurTemp unit="C">${data[i][20]}</avgSurTemp>
      <maxSurTemp unit="C">${data[i][22]}</maxSurTemp>
      <minSurTemp unit="C">${data[i][24]}</minSurTemp>
    </surface>
    
    <solar>
      <avgSolRad unit="W/m²">${data[i][13]}</avgSolRad>
      <maxSolRad unit="W/m²">${data[i][15]}</maxSolRad>
      <minSolRad unit="W/m²">${data[i][17]}</minSolRad>
    </solar>

    <humidity>
      <avgRelHum unit="%">${data[i][26]}</avgRelHum>
    </humidity>
  </entry>`;

    fs.appendFileSync(output, entry, 'utf8');
  }
  fs.appendFile(output, endString, 'utf8', (err) => {
    if (err) throw err;
    else finished();
  });
}

function createXML(data) {
  const startString = `<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="climateData.xsl"?>
<!DOCTYPE climateData SYSTEM "climateData.dtd">\n`;
  const endString = '\n\n</climateData>';

  fs.writeFile(output, startString, 'utf8', (err) => {
    if (err) throw err;
    else convert(data, endString);
  });
}

function loaded(fData) {
  console.log('CSV file loaded successfully.\n');
  let data = fData;

  /* Format data to support the following notation:
  **
  ** data[0][0] is the first identifier for every consecutive entry,
  ** i.e. The station WBAN number
  **
  ** data[1][4] is the 4th value of the first entry,
  ** i.e. The Local Standard Time (LST) of the observation
  */
  data = data.split('\n');
  for (let i = 0; i < data.length; i += 1) {
    data[i] = data[i].split(',');
  }
  const headers = data[1];
  const wbanNumber = data[data.length - 2][0];
  while (data[0][0] !== wbanNumber) {
    data.shift();
  }
  data.unshift(headers);

  createXML(data);
}

function loadCSV(path) {
  fs.readFile(path, 'utf8', (err, data) => {
    if (err) throw err;
    else loaded(data);
  });
}

loadCSV(input);
