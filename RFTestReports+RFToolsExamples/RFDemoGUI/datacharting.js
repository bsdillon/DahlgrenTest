function DataCharting(defaultWidth, defaultHeight)
{
  this.width = defaultWidth;
  this.height = defaultHeight;
  this.alreadyCreated = [];
  this.count = 0;
}

DataCharting.prototype.createChart = function(json, name)
{
  var temp = json[name]['type'];
  var types = {"Line": LINE_TYPE, "VBar": VBAR_TYPE, "HBar": HBAR_TYPE, "Area":  AREA_TYPE, "S_Line": LINE_TYPE, "S_VBar": VBAR_TYPE, "S_HBar": HBAR_TYPE, "S_Area":  AREA_TYPE, "Pie": "Pie", "Scatter": "Scatter"};
  //we can also figure out the type of report and if it is progressive or discrete data
  var typeReport = types[temp];
  var multi = json[name]['modes'].indexOf("Multi")>-1;
  var stacked = json[name]['modes'].indexOf("Stacked")>-1;
  var progressive = json[name]['modes'].indexOf("Progressive")>-1;
  var filled = typeReport.includes("area");
  var group = -1;
  var trend = json[name]['modes'].indexOf("Trend")>-1;

  if(json[name].group)
  {
    group = json[name].group;
  }

  //remove any number in the title; only matters for mulit-dataset systems.
  let root = name.substring(0,name.indexOf("-"));

  //replacing spaces in the title
  var title = name.substring(4);
  if(multi)
  {
    var title = title.substring(0,title.indexOf("-"));
    //check if we have already done this set
    if(this.alreadyCreated.find(function(x){return x===root;}))
    {
      return;//I already have one of these
    }
    this.alreadyCreated.push(root);//if not add it in
  }

  //we can also figure out the type of report and if it is progressive or discrete data
  var typeReport = types[temp];

  while(title.indexOf("_")>=0)
  {
    title = title.replace("_"," ");
  }

  //get the list of all datasets
  var myKeys = [ name ];//default is only one key
  if(multi)//for multiple data sets
  {
    //propose a series of enumerated keys with the matching root
    myKeys = [];
    var counting = true;
    var index = 0;
    while(counting)
    {
      proposed = root +"-"+index;
      index++;
      if(proposed in json)
      {
        myKeys.push(proposed);
      }
      else
      {
        counting=false;
      }
    }
  }

  var canvas = document.createElement("CANVAS");
  let chartCreated;
  let styleCreated = new ChartStyle(filled);

  for(let i=0;i<myKeys.length;i++)
  {
    if(typeReport == LINE_TYPE || typeReport == VBAR_TYPE || typeReport == AREA_TYPE || typeReport == HBAR_TYPE)
    {
      if(i==0)
      {
        //only do this once
        let tmp = typeReport;
        if(stacked)
        {
          tmp = "STACKED"+tmp;
        }
        chartCreated = new LineChart(tmp, title, json[myKeys[i]]['x-axis'], json[myKeys[i]]['y-axis']);
        chartCreated.createChart(canvas, this.width, this.height);
        chartCreated.setLabels(json[myKeys[i]]['x-data']);
      }

      var data = json[myKeys[i]]['y-data'];
      var data2=[];
      data2[0]=Number(data[0]);
      for(let j=1;j<data.length;j++)
      {
        data2[j]=Number(data[j]) + (progressive?data2[j-1]:0);
      }

      var dataObject;
      if(json[name].colorScheme)
      {
        dataObject = styleCreated.getSpecificDataObject(json[name]['colorScheme'][i]);
      }
      else if(group>-1)
      {
        dataObject = styleCreated.getGroupDataObject(group,group);
      }
      else
      {
        dataObject = styleCreated.getRandomDataObject();
      }
      chartCreated.createDataSet(json[myKeys[i]]['series'], data2, dataObject);

      chartCreated.UpdateChart();
    }
    else if(temp==="Pie")
    {
      if(i==0)
      {
        //only do this once
        chartCreated = new PieChart(title)
        chartCreated.createChart(canvas, this.width, this.height);
        chartCreated.setLabels(json[myKeys[i]]['x-data']);
      }
      chartCreated.createDataSet(json[myKeys[i]]['y-data'], styleCreated.WriteDefaultPieDataObject());
      chartCreated.UpdateChart();
    }
    else if(typeReport==="Scatter")
    {
      if(i==0)
      {
        //only do this once
        chartCreated = new ScatterChart(title,json[myKeys[i]]['x-axis'], json[myKeys[i]]['y-axis'])
        chartCreated.createChart(canvas, this.width, this.height);
      }
      chartCreated.createDataSet(json[myKeys[i]]['series'], json[myKeys[i]]['x-data'], json[myKeys[i]]['y-data'], styleCreated.getRandomDataObject());
      if(trend)
      {
        chartCreated.addTrendLine("Trend["+json[myKeys[i]]['series']+"]", json[myKeys[i]]['x-data'], json[myKeys[i]]['y-data'], styleCreated.WriteTrendDataObject());
      }
      chartCreated.UpdateChart();
    }
  }
  this.count++;

  return canvas;
}
