function start(dataFile)
{
  var currentData = document.getElementById("dataSourceFile");
  if(currentData)
  {
    currentData.remove();
  }

  var script= document.createElement('script');
  script.src= dataFile;
  script.id='dataSourceFile';

  var head= document.getElementsByTagName('head')[0];
  head.appendChild(script);

  setTimeout(function(){waitForData(dataFile); },100);
}

function waitForData(dataFile)
{
  if(!testRuns)
  {
    setTimeout(function(){waitForData(dataFile); },100);
    return;
  }

  //testRuns is the object containing the arrays with test data, 
  //it is imported from a data file. 
  var rawData = Object.keys(testRuns);
  var length = rawData.length;

  generateHeatMap(testRuns, length, rawData);
  setTimeout(function(){start(dataFile); },2000);
}

function generateHeatMap(data, length, rawData)
{
  var heatMap = document.getElementById('heatmap');
  heatMap.replaceChildren();

  //create the first label for test IDs
  var row1 = heatMap.insertRow();
  var th = document.createElement("th");
  var text = document.createTextNode("Test ID");
  th.appendChild(text);
  row1.appendChild(th);
 
  //keep track of all the rows
  rows = [];
  var rowLast = 0;

  //keep track of the maximum size of all rows  
  var maxWidth = 2;//2 is the minimum that accounts for the test id and the report link
  
  for(var testIndex=0; testIndex<length+1; testIndex++)
  {
    //create a new test row
    var row = heatMap.insertRow();

    //create test label
    let labelCell = row.insertCell();
    var testNumber = testIndex+1;
    var testData = data[rawData[testIndex]];

    if(!testData)
    { //test run is in progress; TODO: take clock away when no test is ongoing
      rowLast = row;

      var image = document.createElement('img');
      image.id = "clock";
      image.src = "spinningclock.gif";
      image.width = 40;
      image.height = 40;
      labelCell.appendChild(image);

      toolTip(labelCell, 'Test Run ' + testNumber);
      break; //Ends loop
    }
    else
    { //Case where test run has been completed and test data is available
      rows.push(row);

      var label = document.createTextNode(testNumber);
      labelCell.appendChild(label);
      td = row.insertCell();
      td.classList.add("report");
      let dataIndex = rawData[testIndex];
      td.onclick = function(){
        CreatePopupReport(dataIndex);
      }
      td.id="test"+testIndex+"OQE";

      //add data for the test.
      for(let oneTest of testData)
      {
        if(oneTest.Step==='--' && oneTest.Case!=='--')
        {
          //only show the individual test cases
          td = row.insertCell();
          var status = oneTest.Status;
          toolText = "<b>"+oneTest.Case + "</b><br>" + oneTest.Details;
          toolTip(td, toolText);
          td.classList.add(status.toLowerCase());
          td.classList.add("active");
          td.classList.add("plump");
        }
        else if(oneTest.Case==='--' && oneTest.Step!=='--')
        {
          //only show the individual test cases
          td = row.insertCell();
          var status = oneTest.Status;
          toolText = "<b>"+oneTest.Step + "</b><br>" + oneTest.Details;
          toolTip(td, toolText);
          td.classList.add(status.toLowerCase());
          td.classList.add("active");
          td.classList.add("plump");
        }
      }

      if(maxWidth<1+testData.length)
      {
        maxWidth = 2 + testData.length;
      }
    }
  }

  //add buffer spaces - Top row
  row1.appendChild(addBuffer(Math.max(0,maxWidth-row1.cells.length)+1, "th", "Test Steps", ""));

  for( let row of rows) // all test rows
  {
    let width = maxWidth-row.cells.length;
    if(width>0)
    {
      row.appendChild(addBuffer(width, "td", "", "buffer"));
    }
  }

  //running row
  if(rowLast != 0)
  {
    rowLast.appendChild(addBuffer(Math.max(0,maxWidth-rowLast.cells.length)+1, "td", "Running...", "running"));
  }
}

//adds buffer space on the end of a row
function addBuffer(colspan, element, text, className)
{
  var cell = document.createElement(element);

  if(text.length>0)
  {
    var text = document.createTextNode(text);
    cell.appendChild(text);
  }

  if(className.length>0)
  {
    cell.classList.add(className);
  }
  cell.colSpan = colspan;

  return cell;
}

function toolTip(parent, text)
{
  parent.setAttribute('class','tooltip');
  var popUp = document.createElement("SPAN");
  popUp.setAttribute('class','tooltiptext');
  var popText = document.createElement("span");
  popText.innerHTML=text;
  popUp.appendChild(popText);
  parent.appendChild(popUp);
}

//----------Popup reports----------//
var reportOverlay = 0;

function closeReport()
{
  document.getElementById("reportWindow").style.width = "0%";
}

function CreatePopupReport(x)
{
  document.getElementById("reportWindow").style.width = "100%";
  reportOverlay = document.getElementById("reportContent");
  reportOverlay.replaceChildren();

  var header = document.createElement("H1");
  reportOverlay.appendChild(header);
  if(x == 'total')
  {
    header.innerHTML = 'Total OQE Results';
    cumulativeReport()
  }
  else
  {
    header.innerHTML = 'Test Results: '+x;
    var chartData = testRuns[x];
    singleTestTable(Object.keys(chartData[0]), chartData);
    generatePieChart('Test Steps Pass Rate', reportOverlay, ['Fail', 'Pass'], countPasses(chartData), ["rgb(255,0,0)","rgb(0,255,0)"]);
  } 
}

function singleTestTable(dataheader, data)
{
  var table = document.createElement("TABLE");
  reportOverlay.appendChild(table);

  table.classList.add("popup");
  var thead = table.createTHead();

  //create table headers
  var row = thead.insertRow();
  var statusCount = -1
  var detailsCount = -1
  var count = 0;
  for(let element of dataheader)
  {
    var th = document.createElement("th");
    var text = document.createTextNode(element);
    if(element==="Status")
    {
      statusCount = count;
      th.classList.add("small");
    }
    else if(element==="Details")
    {
      detailsCount = count;
      th.classList.add("large");
    }
    else if(element==="Step")
    {
      th.classList.add("medium");
    }
    else
    {
      th.classList.add("small");
    }

    th.appendChild(text);
    row.appendChild(th);
    count++;
  }

  //create new row for each step in the test
  var oddStripeStyle = false;//included for striped style
  var type = "Data";
  var detailSet = ["Data","Screenshot"];
  for (let step of data)
  {
    var row = table.insertRow();
    if(step["Case"]==='--' && step["Step"]==='--')
    {
      var cell = row.insertCell();
      cell.classList.add("BAR");
      cell.innerHTML = "&nbsp;"
      cell = row.insertCell();
      cell.classList.add("BAR");
      cell = row.insertCell();
      cell.classList.add("BAR");
      cell = row.insertCell();
      cell.classList.add("BAR");
      cell = row.insertCell();
      cell.classList.add("BAR");
    }
    else if(step["Case"]==='--' || step["Step"]==='--')
    {
      var className = step["Status"];
      //this is the end of the test step
      var cell = row.insertCell();
      if(step["Step"]==='--')
      {
        cell.innerHTML = step["Case"];
      }
      cell.classList.add(oddStripeStyle?"evenRow":"oddRow");
      cell = row.insertCell();
      if(step["Case"]==='--')
      {
        cell.innerHTML = step["Step"];
      }
      cell.classList.add(oddStripeStyle?"evenRow":"oddRow");
      cell = row.insertCell();
      cell.classList.add(oddStripeStyle?"evenRow":"oddRow");
      cell = row.insertCell();
      cell.innerHTML = step["Status"];
      cell.classList.add(className);
      cell = row.insertCell();
      cell.innerHTML = step["Details"];
      cell.classList.add(oddStripeStyle?"evenRow":"oddRow");
    }
    else
    {
      for (var i=0; i<dataheader.length; i++)
      {
        var cell = row.insertCell();
        var contents = step[dataheader[i]];

        if(i==statusCount)
        {
          type = step[dataheader[i]];
        }

        if(i==statusCount && (contents==='PASS' || contents==='FAIL'))
        {
          cell.classList.add(type);
        }
        else
        {
          cell.classList.add(oddStripeStyle?"evenRow":"oddRow");
        }

        if(i==detailsCount)
        {
          var matchLambda = (text) => text === type;
          var index = detailSet.findIndex(matchLambda);
          switch(index)
          {
            case -1:
              //pass or fail; no op
              break;
            case  0:
              //data
              var pieces = contents.split("; ");
              var contents = pieces[0];
              for(let i=1;i<pieces.length;i++)
              {
                contents = contents + "<br>" + pieces[i];
              }
              break;
            case  1:
              //screenshot
              contents = "Click for full image<br><img src='"+contents+"' class='thumb' onclick='flipSize(this);'>";
              break;
          }
        }
        cell.innerHTML = contents;
      }
    }

    //flip style on next line
    oddStripeStyle = !oddStripeStyle;
  }
}

function flipSize(img)
{
  img.classList.toggle("thumb");
}

function cumulativeReport()
{
  if(reportOverlay!=0)
  {
    //pass fails line chart
    var lineLabels = ["Fail Percentage", "Pass Percentage"];
    var colors = ["rgb(255, 0, 0)", "rgb(0,255,0)"];
    var allPasses = countAllPasses(testRuns);

    var lChart = new LineChart(S_VBAR_TYPE, "Test Pass/Fail Rates", "Test Run", "Pass rate (%)");
    var canvas = document.createElement("CANVAS");
    reportOverlay.appendChild(canvas);
    lChart.createChart(canvas, 350, 350);

    lChart.setLabels(allPasses[0][0]);
    var cStyle = new ChartStyle(false);
    for(let i=0;i<lineLabels.length;i++)
    {
      lChart.createDataSet(lineLabels[i], allPasses[0][i+1], cStyle.getSpecificDataObject(colors[i]));
    }
    lChart.UpdateChart();

    //look for more structured data
    var keys = Object.keys(reportStructure);
    var types = {"Line": LINE_TYPE, "VBar": VBAR_TYPE, "Pie": "Pie"};
    var alreadyCreated = [];
    for(let varName of keys)
    {
      //from the type of report we can determine if this is a multi-dataset or mono-dataset
      var temp = reportStructure[varName]['type'];
      var multi = temp.substring(0,6)=="Multi_";

      //remove any number in the title; only matters for mulit-dataset systems.
      let root = varName.substring(0,varName.indexOf("-"));

      //replacing spaces in the title
      var title = varName.substring(4);
      if(multi)
      {
        var title = title.substring(0,title.indexOf("-"));
        //check if we have already done this set
        if(alreadyCreated.find(function(x){return x===root;}))
        {
          continue;//and ignore additional runs
        }
        alreadyCreated.push(root);//if not add it in

        temp = temp.substring(6);//get rid of the multi
      }

      //we can also figure out the type of report and if it is progressive or discrete data
      var lookup = temp;
      if(temp.indexOf("_")>-1)
      {
        lookup = temp.substring(0,temp.indexOf("_"));
      }
      var typeReport = types[lookup];
      var progressive = temp.substring(temp.indexOf("_")+1)==="Progressive";

      while(title.indexOf("_")>=0)
      {
        title = title.replace("_"," ");
      }

      //get the list of all datasets
      var myKeys = [ varName ];//default is only one key
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
          if(proposed in reportStructure)
          {
             myKeys.push(proposed);
          }
          else
          {
            counting=false;
          }
        }
      }

      //now that we know we are not re-creating a multi-dataset chart
      //we are creating a new canvas for the purpose of the report
      var canvas = document.createElement("CANVAS");
      reportOverlay.appendChild(canvas);

      let chartCreated;
      let styleCreated = new ChartStyle(typeReport.includes("AREA"))
      for(let i=0;i<myKeys.length;i++)
      {
        if(typeReport == LINE_TYPE || typeReport == VBAR_TYPE)
        {
          if(i==0)
          {
            //only do this once
            chartCreated = new LineChart(typeReport, title, reportStructure[myKeys[i]]['x-axis'], reportStructure[myKeys[i]]['y-axis']);
            chartCreated.createChart(canvas, 350, 350);
            chartCreated.setLabels(reportStructure[myKeys[i]]['x-labels']);
          }

          var data = reportStructure[myKeys[i]]['data'];
          var data2=[];
          data2[0]=Number(data[0]);
          for(let i=1;i<data.length;i++)
          {
            data2[i]=Number(data[i]) + (progressive?data2[i-1]:0);
          }

          chartCreated.createDataSet(reportStructure[myKeys[i]]['series'], data2, styleCreated.getGroupDataObject(i,0));

          chartCreated.UpdateChart();
        }
        else if(temp==="Pie")
        {
          if(i==0)
          {
            //only do this once
            var config = createConfig(title);
            var chart1 = createChart(canvas, 350, 350, config);
            setLabels(config, reportStructure[myKeys[i]]['x-labels']);
          }
          createDataSet(config, reportStructure[myKeys[i]]['data'], ["rgb(255,0,0)","rgb(0,255,0)","rgb(0,0,255)","rgb(255,255,0)","rgb(0,255,255)","rgb(255,0,255)"]);
          chart1.update();
        }
      }
    }
  }
}

function countAllPasses(allData)
{
  var names = [];
  var failSet = [];
  var passSet = [];
  var groups = {};
  var fails = 0;
  var passes = 0;

  var keys = Object.keys(allData);
  var testIndex = 1;
  for(let dataKey of keys)
  {
    var subdata = allData[dataKey];
    var tmp = countPasses(subdata);
    fails+=tmp[0];
    passes+=tmp[1];

    names.push("Test "+testIndex);
    failSet.push(Math.floor(tmp[0]*100 / (tmp[1] + tmp[0])));
    passSet.push(Math.floor(tmp[1]*100 / (tmp[1] + tmp[0])));
    testIndex++;
  }

  return [[names,failSet,passSet], fails, passes];
}

function countPasses(data)
{
  var pass = 0;
  var fail = 0;
  for(let element of data)
  {
    if(element.Status == 'PASS')
    {
      pass = pass + 1;
    }
    else if(element.Status == 'FAIL')
    {
      fail = fail + 1;
    }
  }
  var answer = [fail, pass];
  return answer;
}

//--------Creating Elements-----------//
function generatePieChart(title, parent, labels, data, colors)
{
  var myCanvas = document.createElement("CANVAS");
  parent.append(myCanvas);

  //functions from piechartlibrary.js
  var config = createConfig(title);
  var chart1 = createChart(myCanvas, 350, 350, config);
  setLabels(config, labels);
  createDataSet(config, data, colors);
  chart1.update();
}
