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

function createChart(canvasID, width, height, config, win)
{
  win.alert('running');
  var myCanvas = win.document.get.ElementById(canvasID);
  win.alert(myCanvas);
  var ctx = myCanvas.getContext("2d");
  myCanvas.width = width;
  myCanvas.height = width;
  var chart = new Chart(ctx, config);
  myCanvas.style.backgroundColor = 'rgb(255,255,255)';
  return chart;
}

var colors = ["rgb(252,86,74)","rgb(129,237,99)","rgb(111,175,198)","rgb(163,91,52)","rgb(148,67,139)","rgb(157,145,169)","rgb(221,26,143)","rgb(78,114,5)","rgb(77,3,36)","rgb(187,41,213)","rgb(155,191,255)","rgb(87,245,150)","rgb(118,7,228)","rgb(143,59,31)","rgb(11,116,221)","rgb(214,239,182)","rgb(242,39,129)","rgb(180,174,68)","rgb(112,21,104)"];

function setLabels(config, labels)
{
  for(let i = 0; i<labels.length; i++)
  {
    config.data.labels.push(labels[i]);
  }
}

function createDataSet(config, dataset)
{
  var tmp={};
  tmp.data=dataset;
  tmp.backgroundColor=[];
  for(let i = 0; i<dataset.length; i++)
  {
    tmp.backgroundColor.push(colors[i]);
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
