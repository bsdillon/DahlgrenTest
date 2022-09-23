var dataFile = ""

function start(newFile, archiveFile)
{
  //Find the selectData object and populat from archiveFile

  dataFile = newFile;
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

  setTimeout(function(){waitForData(); },100);
}

function waitForData()
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
  if(reportOpen)
  {
    //CreatePopupReport(reportType)
  }
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
var reportType = "None";
var reportOpen = false;

function scrolled(x)
{
  var x = 0;
}

function closeReport()
{
  document.getElementById("reportWindow").style.width = "0%";
  reportOpen = false;
}

function CreatePopupReport(x)
{
  var wasAlreadyOpen = reportOpen
  document.getElementById("reportWindow").style.width = "100%";
  reportOverlay = document.getElementById("reportContent");
  reportOverlay.innerHTML="";
  reportType = x;

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
    singleTestTable(x, Object.keys(chartData[0]), chartData);
  }
  reportOpen = true; 
}

function singleTestTable(testTitle, dataheader, data)
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
    if(step["Status"]=='Action')
    {
      var cell = row.insertCell();
      cell.classList.add("Action");
      cell.colSpan=5
      cell.innerHTML="Action: "+step["Step"];
    }
    else if(step["Case"]==='--' && step["Step"]==='--')
    {
      var cell = row.insertCell();
      cell.classList.add("BAR")
      cell.colSpan=5
    }
    else if(step["Case"]==='==' && step["Step"]==='==')
    {
      var cell = row.insertCell();
      cell.classList.add("BANNER");
      cell.innerHTML="FUNCTIONAL GROUP: "+step["Details"];
      cell.colSpan=5
    }
    else if(step["Case"]==='**' && step["Step"]==='**')
    {
      var cell = row.insertCell();
      cell.classList.add("SOFT");
      cell.colSpan=5
    }
    else if(step["Case"]==='--' || step["Step"]==='--')
    {
      var className = step["Status"];
      var type = "TEST RESULT: "+step["Case"];
      if(step["Case"]==='--')
      {
        type = "FUNCTIONAL GROUP: "+step["Step"];
      }
      var cell = row.insertCell();
      cell.classList.add(className);
      cell.innerHTML = className+" *** "+className+" *** "+type+" *** "+className+" *** "+className+"<br>"+step["Details"];
      cell.colSpan=5
    }
    else if(false)
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

        if(i==statusCount && (contents==='PASS' || contents==='FAIL' || contents==='Screenshot' || contents==='Data'))
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

  var charting = new DataCharting(350,350);
  var targetCase = testTitle;
  if(targetCase in testStructure)//there is a chart for this test
  {
    var keys = Object.keys(testStructure[targetCase]);
    for(let varName of keys)
    {
      var pieces = varName.split('-');
      if(pieces.length==1 || pieces[1]==='0')//non-multiple or just the first multiple
      {
        reportOverlay.appendChild(charting.createChart(testStructure[targetCase], varName));
      }
    }
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
    var allPasses = countAllPasses(testRuns);
    var lineLabels = [, "Pass Percentage"];

    var json = {"VAR_Pass_Fails-0": {"type": "VBar", "x-axis": "Test Run", "y-axis": "Pass rate (%)", "series": "Fail Percentage", "x-data": allPasses[0][0], "y-data": allPasses[0][1], "modes": ["Stacked", "Multi"], "colorScheme": ["rgb(255, 0, 0)", "rgb(0,255,0)"]},
                "VAR_Pass_Fails-1": {"type": "VBar", "x-axis": "Test Run", "y-axis": "Pass rate (%)", "series": "Pass Percentage", "x-data": allPasses[0][0], "y-data": allPasses[0][2], "modes": ["Stacked", "Multi"], "colorScheme": ["rgb(255, 0, 0)", "rgb(0,255,0)"]}};

    var charting = new DataCharting(350,350);
    reportOverlay.appendChild(charting.createChart(json, "VAR_Pass_Fails-0"));

    var keys = Object.keys(reportStructure);
    for(let varName of keys)
    {
      var pieces = varName.split('-');
      if(pieces.length==1 || pieces[1]==='0')//non-multiple or just the first multiple
      {
        reportOverlay.appendChild(charting.createChart(reportStructure, varName));
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

  chartCreated = new PieChart(title)
  chartCreated.createChart(myCanvas, 350, 350);
  chartCreated.setLabels(labels);

  var styleCreated = new ChartStyle(false);
  chartCreated.createDataSet(data, styleCreated.WriteSpecificPieDataObject(colors));
  chartCreated.UpdateChart();
}