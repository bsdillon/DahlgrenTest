function emptytt()
{
  //tool tip does nothing
}

function ScatterChart(title, xLabel, yLabel)
{
  this.config = {
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
}

ScatterChart.prototype.createChart = function(canvas, width, height)
{
  var ctx = canvas.getContext("2d");
  canvas.width = width;
  canvas.height = height;
  canvas.style.backgroundColor = 'rgb(255,255,255)';
  this.chart = new Chart(ctx, this.config);
}

ScatterChart.prototype.addTrendLine = function(seriesName, xData, yData, dataObject)
{
  var size = Math.min(xData.length, yData.length);
  var minX = Number.MAX_VALUE;
  var maxX = Number.MIN_VALUE;
  var meanX = 0;
  var meanY = 0;

  for(let i = 0; i<size; i++)
  {
    var mX = Number(xData[i]);
    var mY = Number(yData[i]);
    minX = mX<minX ? mX : minX;
    maxX = mX>maxX ? mX : maxX;
    meanX += mX;
    meanY += mY;
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
    var mX = Number(xData[i]);
    var mY = Number(yData[i]);
    var tmpX = mX-meanX;
    var tmpY = mY-meanY;
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

  dataObject.label=seriesName;
  dataObject.data=endpoints;
  this.config.data.datasets.push(dataObject);
}

ScatterChart.prototype.createDataSet = function(seriesName, xData, yData, dataObject)
{
  var size = Math.min(xData.length, yData.length);
  var linedata = [];
  for(let i = 0; i<size; i++)
  {
    linedata.push({x:Number(xData[i]), y: Number(yData[i])});
  }

  dataObject.label=seriesName;
  dataObject.data=linedata;
  this.config.data.datasets.push(dataObject);
}

ScatterChart.prototype.UpdateChart = function()
{
  this.chart.update();
}