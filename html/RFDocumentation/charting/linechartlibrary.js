var LINE_TYPE = 'line';
var AREA_TYPE = 'area';
var S_LINE_TYPE = 'STACKEDline';
var S_AREA_TYPE = 'STACKEDarea';
var S_VBAR_TYPE = 'STACKEDbar';
var S_HBAR_TYPE = 'STACKEDhorizontalBar';
var VBAR_TYPE = 'bar';
var HBAR_TYPE = 'horizontalBar';

var dataSets = 0;

function LineChart(chartType, title, xLabel, yLabel)
{
  this.chartType = chartType;//permanent copy
  var cType = this.chartType;//create temporary copy.
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

  this.config = config;
}

LineChart.prototype.createChart = function(myCanvas, width, height)
{
  var ctx = myCanvas.getContext("2d");
  myCanvas.width = width;
  myCanvas.height = height;
  this.chart = new Chart(ctx, this.config);
}

LineChart.prototype.setLabels = function(labels)
{
  for(var d in labels)
  {
    this.config.data.labels.push(labels[d]);
  }
}

LineChart.prototype.createDataSet = function(seriesName, linedata, dataObject)
{
  dataObject.label=seriesName;
  dataObject.data=linedata;
  this.config.data.datasets.push(dataObject);
}

LineChart.prototype.UpdateChart = function()
{
  this.chart.update();
}

function emptytt()
{
  //tool tip does nothing
}