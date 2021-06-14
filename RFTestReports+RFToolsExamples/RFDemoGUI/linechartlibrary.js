var LINE_TYPE = 'line';
var AREA_TYPE = 'area';
var S_LINE_TYPE = 'STACKEDline';
var S_AREA_TYPE = 'STACKEDarea';
var S_VBAR_TYPE = 'STACKEDbar';
var S_HBAR_TYPE = 'STACKEDhorizontalBar';
var VBAR_TYPE = 'bar';
var HBAR_TYPE = 'horizontalBar';

function emptytt()
{
  //tool tip does nothing
}

function createLineConfig(cType, title, xLabel, yLabel)
{
  var stackY = true;
  var stackX = false;
  var stackData = false;
  if(cType.length>6 && cType.substring(0,7)==='STACKED')
  {
    stackData = true;
    cType = cType.substring(7,cType.len);
  }

  if(cType===AREA_TYPE)
  {
    cType = 'line';
  }
  else if(cType===HBAR_TYPE)
  {
    let temp = xLabel;
    xLabel = yLabel;
    yLabel = temp;
  }

  if(cType===VBAR_TYPE || cType===HBAR_TYPE)
  {
    stackY = true;
    stackX = true;
  }

  var config = {
    type: 'none',
    data: {datasets: []
    },
    options:
    {
      animation: false,
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
        custom: function(tt) { emptytt(tt);},
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
            stacked: false,
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
            stacked: false,
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
            }
          }
        ]
      }
    }
  };
  config.type = cType;
  if(stackY)
  {
    config.options.scales.yAxes[0].stacked = stackData;
  }

  if(stackX)
  {
    config.options.scales.xAxes[0].stacked = stackData;
  }

  return config;
}

function createLineChart(canvasID, width, height, config, win)
{
  var myCanvas = win.document.createElement("CANVAS");
  win.document.body.appendChild(myCanvas);
  var ctx = myCanvas.getContext("2d");
  myCanvas.width = width;
  myCanvas.height = height;
  var chart = new Chart(ctx, config);
  myCanvas.style.backgroundColor = 'rgb(255,255,255)';
  return chart;
}

function setLineChartLabels(config, labels)
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

function createLineDataSet(config, seriesName, linedata, cType)
{
  if(cType.length>6 && cType.substring(0,7)==='STACKED')
  {
    cType = cType.substring(7,cType.len);
  }

  if(cType===VBAR_TYPE)
  {
    createAllLineStyle(config, seriesName, linedata, true, false, 0, 0);
  }
  else if(cType===HBAR_TYPE)
  {
    createAllLineStyle(config, seriesName, linedata, true, false, 0, 0);
  }
  else if(cType===LINE_TYPE)
  {
    createAllLineStyle(config, seriesName, linedata, false, false, 0, 0);
  }
  else //area
  {
    createAllLineStyle(config, seriesName, linedata, true, true, 0, 0);
  }
}

function createRandomStyleLine(config, seriesName, linedata)
{
  createAllLineStyle(config, seriesName, linedata, true, false, 0, 0);
}

function createRandomStyleArea(config, seriesName, linedata)
{
  createAllLineStyle(config, seriesName, linedata, true, true, 0, 0);
}

function createGroupStyleLine(config, seriesName, linedata, groupID, categoryID)
{
  createAllLineStyle(config, seriesName, linedata, false, false, groupID, categoryID);
}

function createGroupStyleArea(config, seriesName, linedata, groupID, categoryID)
{
  createAllLineStyle(config, seriesName, linedata, false, true, groupID, categoryID);
}

function clearData(config)
{
  dataSets = 0;
  lineStyleIndex = 0;
  groupIndex = [0, 0, 0, 0, 0, 0, 0];
  config.data.datasets=[];
  config.data.labels=[];
}

function createAllLineStyle(config, seriesName, linedata, random, fill, group, cat)
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
  window.chartColors = {
          red: 'rgb(255, 99, 132)',
          green: 'rgb(75, 192, 192)',
          orange: 'rgb(255, 159, 64)',
          yellow: 'rgb(255, 205, 86)',
          blue: 'rgb(54, 162, 235)',
          purple: 'rgb(153, 102, 255)',
          grey: 'rgb(231,233,237)'
        };
  var colorNames = Object.keys(window.chartColors);
  var colorName = colorNames[lineStyleIndex % colorNames.length];
  var c = window.chartColors[colorName];
  var tmp =window.chartColors[colorName];
  var bg = Chart.helpers.color(tmp).alpha(0.5).rgbString();
  var primaryID = lineStyleIndex;
  var secondaryID = lineStyleIndex;
  lineStyleIndex++;
  var radius = 5;
  if(!random)
  {
    c1 = 'rgb(129,237,99)';
    c2 = 'rgb(252,86,74)';
    radius = 5;
    primaryID = group;
    secondaryID = cat;
  }
  var newData = {
   label: seriesName,
  };
  if(seriesName == "Pass Percentage"){
   newData =
     {
       label: seriesName,
       backgroundColor: c1,
       borderColor: c1,
       borderWidth: style[primaryID % style.length][0],
       data: linedata,
       fill: fillStyle,
       pointStyle: marker[secondaryID % marker.length],
       pointRadius: radius,
       pointBorderColor: 'rgb(0, 0, 0)',
       borderDash: [style[secondaryID % style.length][1],style[secondaryID % style.length][2]]
     };
  }else if(seriesName == "Fail Percentage"){
   newData =
     {
       label: seriesName,
       backgroundColor: c2,
       borderColor: c2,
       borderWidth: style[primaryID % style.length][0],
       data: linedata,
       fill: fillStyle,
       pointStyle: marker[secondaryID % marker.length],
       pointRadius: radius,
       pointBorderColor: 'rgb(0, 0, 0)',
       borderDash: [style[secondaryID % style.length][1],style[secondaryID % style.length][2]]
     };
  }


  newData.data=linedata;
  config.data.datasets.push(newData);
}
