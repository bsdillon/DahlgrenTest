function emptytt()
{
  //tool tip does nothing
}

function PieChart(title)
{
  this.config = {
    type: 'pie',
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
    }
  };
}

PieChart.prototype.createChart = function(canvas, width, height)
{
  var ctx = canvas.getContext("2d");
  canvas.width = width;
  canvas.height = width;
  this.chart = new Chart(ctx, this.config);
}

PieChart.prototype.setLabels = function(labels)
{
  for(let i = 0; i<labels.length; i++)
  {
    this.config.data.labels.push(labels[i]);
  }
}

PieChart.prototype.createDataSet = function(dataset, dataObject)
{
  dataObject.data = dataset;

  this.config.data.datasets.push(dataObject);
}

PieChart.prototype.UpdateChart = function()
{
   this.chart.update();
}