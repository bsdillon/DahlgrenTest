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
  myCanvas.style.backgroundColor = 'rgb(255,255,255)';
  return chart;
}

function setChartLabels(config, labels)
{
  for(var d in labels)
  {
    config.data.labels.push(labels[d]);
  }
}

var marker = ['circle', 'rect', 'rectRot','triangle'];
var style = [[1,5,0],[2,10,5],[2,5,3],[3,1,2],[3,3,5]];
var lineStyleIndex = 0;
var dataSets = 0;
var groupColors = [[1,0,0], [1,1,0], [0,1,0], [0,0,1], [1,0,1], [0,1,1], [1,1,1]];
var groupIndex = [0, 0, 0, 0, 0, 0, 0];

function createRandomStyleLine(config, seriesName, linedata)
{
  createAllStyle(config, seriesName, linedata, true, false, 0, 0);
}

function createRandomStyleArea(config, seriesName, linedata)
{
  createAllStyle(config, seriesName, linedata, true, true, 0, 0);
}

function createGroupStyleLine(config, seriesName, linedata, groupID, categoryID)
{
  createAllStyle(config, seriesName, linedata, false, false, groupID, categoryID);
}

function createGroupStyleArea(config, seriesName, linedata, groupID, categoryID)
{
  createAllStyle(config, seriesName, linedata, false, true, groupID, categoryID);
}

function clearData(config)
{
  dataSets = 0;
  lineStyleIndex = 0;
  groupIndex = [0, 0, 0, 0, 0, 0, 0];
  config.data.datasets=[];
  config.data.labels=[];
}

function createAllStyle(config, seriesName, linedata, random, fill, group, cat)
{
  dataSets++;
  var fillStyle="false";
  if(fill)
  {
    fillStyle="-1";
  }

  if(fill && dataSets==1)
  {
    fillStyle="start";
  }

  var colorNames = Object.keys(window.chartColors);
  var colorName = colorNames[lineStyleIndex % colorNames.length];
  var c = window.chartColors[colorName];
  var bg = Chart.helpers.color(window.chartColors[colorName]).alpha(0.5).rgbString();
  var primaryID = lineStyleIndex;
  var secondaryID = lineStyleIndex;
  lineStyleIndex++;
  var radius = 5;
  if(!random)
  {
    groupIndex[group]+=1;
    var scale = groupIndex[group];
    var r = groupColors[group][0]*(255-(scale*25));
    var g = groupColors[group][1]*(255-(scale*25));
    var b = groupColors[group][2]*(255-(scale*25));
    c = 'rgb('+r+','+g+','+b+')';
    bg = 'rgb('+r+','+g+','+b+')';
    radius = 3+groupIndex[group];
    primaryID = group;
    secondaryID = cat;
  }
  var newData =
  {
    label: seriesName,
    backgroundColor: bg,
    borderColor: c,
    borderWidth: style[primaryID % style.length][0],
    data: linedata,
    fill: fillStyle,
    pointStyle: marker[secondaryID % marker.length],
    pointRadius: radius,
    pointBorderColor: 'rgb(0, 0, 0)',
    borderDash: [style[secondaryID % style.length][1],style[secondaryID % style.length][2]]
  };

  newData.data=linedata;
  config.data.datasets.push(newData);
}