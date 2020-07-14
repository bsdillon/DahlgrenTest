function createConfig(title, xLabel, yLabel, ttfunction, stackeData)
{
  var config = {
    type: 'line',
    data: {datasets: []
    },
    options:
    {
      responsive: false,
      legend:
      {
        labels:
        {
          usePointStyle: true
        }
      },
      title:
      {
        display: true,
        text: title
      },
      tooltips:
      {
        custom: function(tt) { ttfunction(tt);},
        mode: 'point',
        intersect: false,
      },
      hover:
      {
        mode: 'nearest',
        intersect: true
      },
      scales:
      {
        xAxes:
        [
          {
            display: true,
            scaleLabel:
            {
              display: true,
              labelString: xLabel
            }
          }
        ],
        yAxes:
        [
          {
            display: true,
            scaleLabel:
            {
              display: true,
              labelString: yLabel
            },
            ticks:
            {
              suggestedMin: 0,
              suggestedMax: 1.2
            },
            stacked: stackeData
          }
        ]
      }
    }
  };
  return config;
}

function createChart(canvasID, width, height, config)
{
  var myCanvas = document.getElementById(canvasID);
  var ctx = myCanvas.getContext("2d");
  myCanvas.width = 600;
  myCanvas.height = 600;
  var chart = new Chart(ctx, config);
  myCanvas.style.backgroundColor = 'rgb(255,255,255)'
  return chart
}

function setChartLabels(config, labels)
{
  for(d in labels)
  {
    config.data.labels.push(labels[d]);
  }
}

var marker = ['circle', 'rect', 'rectRot','triangle'];
var style = [[1,5,0],[2,10,5],[2,5,3],[3,1,2],[3,3,5]];
var lineStyleIndex = 0;
function createRandomStyleLine(config, seriesName, linedata)
{
  var colorNames = Object.keys(window.chartColors);
  var colorName = colorNames[lineStyleIndex % colorNames.length];
  var c = window.chartColors[colorName];
  var newData =
  {
    label: seriesName,
    backgroundColor: Chart.helpers.color(window.chartColors[colorName]).alpha(0.5).rgbString(),
    borderColor: c,
    borderWidth: style[lineStyleIndex % style.length][0],
    data: linedata,
    fill: false,
    pointStyle: marker[lineStyleIndex % marker.length],
    pointRadius: 5,
    pointBorderColor: 'rgb(0, 0, 0)',
    borderDash: [style[lineStyleIndex % style.length][1],style[lineStyleIndex % style.length][2]]
  };
  lineStyleIndex++;

  newData.data=linedata;
  config.data.datasets.push(newData);
}

function createRandomStyleArea(config, seriesName, linedata)
{
  dataSets++;
  var fillStyle="-1";
  if(dataSets==1)
  {
    fillStyle="start";
  }
  var colorNames = Object.keys(window.chartColors);
  var colorName = colorNames[lineStyleIndex % colorNames.length];
  var c = window.chartColors[colorName];
  var newData =
  {
    label: seriesName,
    backgroundColor: Chart.helpers.color(window.chartColors[colorName]).alpha(0.5).rgbString(),
    borderColor: c,
    borderWidth: style[lineStyleIndex % style.length][0],
    data: linedata,
    fill: fillStyle,
    pointStyle: marker[lineStyleIndex % marker.length],
    pointRadius: 5,
    pointBorderColor: 'rgb(0, 0, 0)',
    borderDash: [style[lineStyleIndex % style.length][1],style[lineStyleIndex % style.length][2]]
  };
  lineStyleIndex++;

  newData.data=linedata;
  config.data.datasets.push(newData);
}

var dataSets = 0;
var groupColors = [[1,0,0], [1,1,0], [0,1,0], [0,0,1], [1,0,1], [0,1,1], [1,1,1]];
var groupIndex = [0, 0, 0, 0, 0, 0, 0];
function createGroupStyleLine(config, seriesName, linedata, groupID, categoryID)
{
  groupIndex[groupID]+=1;
  var scale = groupIndex[groupID];
  var r = groupColors[groupID][0]*(255-(scale*25));
  var g = groupColors[groupID][1]*(255-(scale*25));
  var b = groupColors[groupID][2]*(255-(scale*25));
  var color = 'rgb('+r+','+g+','+b+')';
  var radius = 3+groupIndex[groupID];
  var newData =
  {
    label: seriesName,
    backgroundColor: color,
    borderColor: color,
    borderWidth: style[groupID % style.length][0],
    data: linedata,
    fill: false,
    pointStyle: marker[categoryID % marker.length],
    pointRadius: radius,
    pointBorderColor: 'rgb(0, 0, 0)',
    borderDash: [style[categoryID % style.length][1],style[categoryID % style.length][2]]
  };
  lineStyleIndex++;

  newData.data=linedata;
  config.data.datasets.push(newData);
}

function createGroupStyleArea(config, seriesName, linedata, groupID, categoryID)
{
  dataSets++;
  var fillStyle="-1";
  if(dataSets==1)
  {
    fillStyle="start";
  }
  groupIndex[groupID]+=1;
  var scale = groupIndex[groupID];
  var r = groupColors[groupID][0]*(128+(scale*12));
  var g = groupColors[groupID][1]*(128+(scale*12));
  var b = groupColors[groupID][2]*(128+(scale*12));
  var color = 'rgb('+r+','+g+','+b+')';
  var radius = 3+groupIndex[groupID];
  var newData =
  {
    label: seriesName,
    backgroundColor: color,
    borderColor: color,
    borderWidth: style[groupID % style.length][0],
    data: linedata,
    fill: fillStyle,
    pointStyle: marker[categoryID % marker.length],
    pointRadius: radius,
    pointBorderColor: 'rgb(0, 0, 0)',
    borderDash: [style[categoryID % style.length][1],style[categoryID % style.length][2]]
  };
  lineStyleIndex++;

  newData.data=linedata;
  config.data.datasets.push(newData);
}

function clearData(config)
{
  dataSets = 0;
  lineStyleIndex = 0;
  groupIndex = [0, 0, 0, 0, 0, 0, 0];
  config.data.datasets=[];
  config.data.labels=[];
}

