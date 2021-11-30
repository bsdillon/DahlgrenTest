function emptytt()
{
  //tool tip does nothing
}

function createConfig(title)
{
  var config = {
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
  return config;
}

function createChart(canvas, width, height, config)
{
  var ctx = canvas.getContext("2d");
  canvas.width = width;
  canvas.height = width;
  return new Chart(ctx, config);
}

var colors = ["rgb(0,59,79)","rgb(232, 176, 15)","rgb(111,175,198)","rgb(163,91,52)","rgb(148,67,139)","rgb(157,145,169)","rgb(221,26,143)","rgb(78,114,5)","rgb(77,3,36)","rgb(187,41,213)","rgb(155,191,255)","rgb(87,245,150)","rgb(118,7,228)","rgb(143,59,31)","rgb(11,116,221)","rgb(214,239,182)","rgb(242,39,129)","rgb(180,174,68)","rgb(112,21,104)"];

function setLabels(config, labels)
{
  for(let i = 0; i<labels.length; i++)
  {
    config.data.labels.push(labels[i]);
  }
}

function createDataSet(config, dataset, novelColors)
{
  var tmpColors = [];//use default colors
  for(let i=0;i<colors.length;i++)
  {
    tmpColors[i]=colors[i];
  }

  if(novelColors)//if a new set of colors has been defined
  {
    //because we are only copying colors, we can resort to the
    //defaults if there is an excessive number of data points.
    for(let i=0;i<novelColors.length;i++)
    {
      tmpColors[i]=novelColors[i];
    }
  }
  var tmp={};
  tmp.data=dataset;
  tmp.backgroundColor=[];
  for(let i = 0; i<dataset.length; i++)
  {
    tmp.backgroundColor.push(tmpColors[i]);
  }

  config.data.datasets.push(tmp);
  var a=0;
}

function clearData(config)
{
  dataSets = 0;
  lineStyleIndex = 0;
  groupIndex = [0, 0, 0, 0, 0, 0, 0];
  config.data.datasets=[];
  config.data.labels=[];
}