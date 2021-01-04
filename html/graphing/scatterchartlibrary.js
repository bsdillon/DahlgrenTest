function emptytt()
{
  //tool tip does nothing
}

function createConfig(title, xLabel, yLabel)
{
  var config = {
    type: 'scatter',
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

var marker = ['circle', 'rect', 'rectRot','triangle'];
var style = [[1,5,0],[2,10,5],[2,5,3],[3,1,2],[3,3,5]];
var lineStyleIndex = 0;
var dataSets = 0;
var groupColors = [[1,0,0], [1,1,0], [0,1,0], [0,0,1], [1,0,1], [0,1,1], [1,1,1]];
var groupIndex = [0, 0, 0, 0, 0, 0, 0];

function createDataSet(config, seriesName, xData, yData)
{
  var size = Math.min(xData.length, yData.length);
  var data = [];
  for(let i = 0; i<size; i++)
  {
    data.push({x:xData[i], y: yData[i]});
  }

  createAllStyle(config, seriesName, data, true, 0, 0);
}

function addTrendLine(config, seriesName, xData, yData)
{
  var size = Math.min(xData.length, yData.length);
  var minX = Number.MAX_VALUE;
  var maxX = Number.MIN_VALUE;
  var meanX = 0;
  var meanY = 0;

  for(let i = 0; i<size; i++)
  {
    minX = xData[i]<minX ? xData[i] : minX;
    maxX = xData[i]>maxX ? xData[i] : maxX;
    meanX += xData[i];
    meanY += yData[i];
  }
  meanX /= size;
  meanY /= size;

  var varianceX = 0;
  var varianceY = 0;
  var covariance = 0;
  var sigmaX = 0;
  var sigmaY = 0;
  for(let i = 0; i<size; i++)
  {
    var tmpX = xData[i]-meanX;
    var tmpY = yData[i]-meanY;
    sigmaX += (tmpX*tmpX);
    sigmaY += (tmpY*tmpY);
    covariance += (tmpX*tmpY);
  }
  sigmaX /= (size-1);
  sigmaX = Math.sqrt(sigmaX);
  sigmaY /= (size-1);
  sigmaY = Math.sqrt(sigmaY);
  covariance /= (sigmaX*sigmaY*(size-1));
  var rsquare = (covariance*covariance);
  var M = covariance*sigmaY/sigmaX;
  var B = meanY - (M*meanX);

  var label = seriesName +" -- y = "+M.toFixed(2)+" x ";
  label += B>0 ? "+ "+B.toFixed(2) : "- "+(-B).toFixed(2);
  label += " -- R^2: "+rsquare.toFixed(2);

  var endpoints = [];
  var minY = B + (M*minX);
  var maxY = B + (M*maxX);
  endpoints.push({x:minX, y: minY});
  endpoints.push({x:maxX, y: maxY});

  createAllStyle(config, label, endpoints, false, 3, 2);

  config.data.datasets[dataSets-1].showLine = true;
}

function clearData(config)
{
  dataSets = 0;
  lineStyleIndex = 0;
  groupIndex = [0, 0, 0, 0, 0, 0, 0];
  config.data.datasets=[];
  config.data.labels=[];
}

function createAllStyle(config, seriesName, linedata, random, group, cat)
{
  dataSets++;
  var fillStyle="false";

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