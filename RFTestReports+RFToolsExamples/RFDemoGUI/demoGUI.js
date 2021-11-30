var FAIL_INDEX=0;
var PASS_INDEX=1;

function start() {
  //testRuns is the object containing the arrays with test data, 
  //it is imported from a data file. 
  var rawData = Object.keys(testRuns);
  var length = rawData.length;

  //adds picture at top of page
  var logo = createImage("mainLogo", "totallogo.png", "200", "75");
  var backing = document.getElementById('header');
  backing.appendChild(logo);
  generateStatus(testRuns, length, rawData);
  generateHeatMap(testRuns, length, rawData);
  //setTimeout(function(){timedUpdate('heatmap'); },2000);
}

function generateHeatMap(data, length, rawData) {
  var heatMap = document.getElementById('heatmap');

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
  var maxWidth = 2;
  
  for(var testIndex=0; testIndex<length+1; testIndex++) {
    //create a new test row
    var row = heatMap.insertRow();

    //create test label
    let labelCell = row.insertCell();
    var testNumber = testIndex+1;
    var testData = data[rawData[testIndex]];

    if(!testData) { //test run is in progress; TODO: take clock away when no test is ongoing
      rowLast = row;

      var image = createImage("clock", "spinningclock.gif", '40', '40');
      labelCell.appendChild(image);

      toolTip(labelCell, 'Test Run ' + testNumber);
      break; //Ends loop
    } else { //Case where test run has been completed and test data is available
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
      for(let oneTest of testData) {
        td = row.insertCell();
        var status = oneTest.Status;
        toolText = "<b>"+oneTest.Test + "</b><br>" + oneTest.Details;
        toolTip(td, toolText);
        td.classList.add(status.toLowerCase());
        td.classList.add("active");
        td.classList.add("plump");
      }

      if(maxWidth<1+testData.length)
      {
        maxWidth = 2 + testData.length;
      }
    }
  }

  //add buffer spaces - Top row
  row1.appendChild(addBuffer(Math.max(0,maxWidth-row1.cells.length), "th", "Test Steps", ""));

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
    rowLast.appendChild(addBuffer(Math.max(0,maxWidth-rowLast.cells.length), "td", "Running...", "running"));
  }
}

//adds buffer space on the end of a row
function addBuffer(myFill, element, text, className)
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
  cell.colSpan = myFill;

  return cell;
}

function toolTip(parent, text) {
  parent.setAttribute('class','tooltip');
  var popUp = document.createElement("SPAN");
  popUp.setAttribute('class','tooltiptext');
  var popText = document.createElement("span");
  popText.innerHTML=text;
  popUp.appendChild(popText);
  parent.appendChild(popUp);
}

//----------Popup reports----------//
var newWindow = 0;

function closePopUp() {
  if(newWindow!=0)
  {
    newWindow.close();
  }
  newWindow = 0;
}       

function CreatePopupReport(x) {
  var windowFeatures = "menubar=yes,location=yes,resizable=no,scrollbars=yes,status=yes,left=100,top=100";
  closePopUp();
  newWindow = window.open('', '', windowFeatures);
  newWindow.onunload = function () {newWindow=0;};
  newWindow.document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="popupreport.css"><script src="test.js"></script>';

  if(x == 'total') {
    newWindow.document.title = 'Total OQE Results';
    createHTag('Total OQE Results', '1', newWindow);
    cumulativeReport()
  }
  else {
    newWindow.document.title = 'Individual OQE';
    createHTag('Test Results', '1', newWindow);
    var chartData = testRuns[x];
    singleTestReport(chartData);
  } 
}

function cumulativeReport() {
  if(newWindow!=0)
  {
    loadTotalData(testRuns, newWindow);

  }
}

function singleTestReport(data) {
  var buttonParent = newWindow.document.createElement("H2");
  createButton('totalOQE', CreatePopupReport, 'Total OQE', 'total',newWindow, buttonParent, '', "totalPage", '');
  newWindow.document.body.appendChild(buttonParent);

  singleTestTable(Object.keys(data[0]), data, newWindow);
  generatePieChart('Test Steps Pass Rate', newWindow, ['Fail', 'Pass'], countPasses(data), ["rgb(255,0,0)","rgb(0,255,0)"]);
}

function singleTestTable(dataheader, data, win) {
  var table = initTable(win);
  var thead = table.createTHead();

  //create table headers
  var row = thead.insertRow();
  for(let element of dataheader) {
    var th = win.document.createElement("th");
    var text = win.document.createTextNode(element);
    th.appendChild(text);
    row.appendChild(th);
  }

  //create new row for each step in the test
  var oddStripeStyle = false;//included for striped style
  for (let step of data) {
    var row = table.insertRow();
    for (var i=0; i<dataheader.length; i++) {
      var cell = row.insertCell();
      var text = win.document.createTextNode(step[dataheader[i]]);
      cell.classList.add(oddStripeStyle?"evenRow":"oddRow");
      cell.appendChild(text);
    }

    //flip style on next line
    oddStripeStyle = !oddStripeStyle;
  }
}

function loadTotalData(allData, win) {
  var length = Object.keys(allData).length;
  var axisLabels = ["Test Run", "Pass rate (%)"];
  var lineLabels = ["Fail Percentage", "Pass Percentage"];
  var colors = ["rgb(255,0,0)", "rgb(0,255,0)"];
  var allPasses = countAllPasses(allData);

  generateLineChart("Test Pass/Fail Rates", win, allPasses[0], axisLabels, lineLabels, colors);

  //Pie Chart
  var data2 = [allPasses[FAIL_INDEX+1],allPasses[PASS_INDEX+1]];
  generatePieChart("Overall Test Breakdown", win, ['Fail', 'Pass'], data2, colors);
  setTimeout(function(){ timedTotalUpdate('total', testRuns); }, 5000);
}






//BSD




 function isEven(value) {
	if (value%2 == 0)
		return true;
	else
		return false;
}











//timing function???
 function timedUpdate(tableid) {
   document.getElementById("mainLogo").remove();
   document.getElementById("dataSourceFile").remove();
   var table = document.getElementById(tableid);
   table.innerHTML = "";
   var elem = document.getElementById("statusText");
   elem.remove();
   var head= document.getElementsByTagName('head')[0];
   var script= document.createElement('script');
   script.src= 'demodata.js';
   script.id='dataSourceFile';
   head.appendChild(script);
   start();
 }


//lose this later
function generateStatus(data, length, rawData) {
  var div = document.createElement('div');
  div.id = 'statusText';
  div.style.margin = "10px 10px 10px 20px";
  var parentDiv = document.getElementById('main');
  parentDiv.appendChild(div);
  var space = document.getElementById("spacer")
  if(space){space.remove();}
  //document.body.appendChild(div);
  for(var i=0; i<length+1; i++){
    var para = document.createElement("P");
    para.id = 'status'+ i;
    div.appendChild(para);
    var test = document.createTextNode("Test Run " + i + "    ");
    para.appendChild(test);
    var actualdata = data[rawData[i]];
    if(!actualdata){
     var stat = 'Running...';
    }else{
     var testName = document.createTextNode(actualdata[0].Test+"   ");//this will only work when there is only one test in the testrun as it looks at the first entry in the testrun data and grabs its name
     para.appendChild(testName);
     var stat = totalStatus(actualdata);
    }
    var text = document.createTextNode(stat + "    ");
    var span = document.createElement('span');
    span.appendChild(text);
    span.classList.add(stat.toLowerCase());
    para.appendChild(span);
    buttonLink = rawData[i];
    createButton('button', CreatePopupReport,'OQE', buttonLink, window, para, '', 'statOQE', '');
     }
     var breakSpace = document.createElement("BR");
     breakSpace.id = "spacer";
     parentDiv.appendChild(breakSpace);
 }

 function totalStatus(data){
   var stat = '';
   var passes = countPasses(data);
   if(passes[1] > passes[0]){
     stat = 'Pass';
   }else{
     stat= 'Fail';
   }
   return stat;
 }

//Individual OQE Metrics

 function createButton(name, func, inner, element, window, parent, align, buttonid, element2){
    var name = window.document.createElement("BUTTON");
    name.onclick = function(element, element2){ return function(){ func(element, element2);}}(element, element2);
    name.innerHTML = inner;
    name.style.cssFloat = align;
    buttonStyle(name);
    name.id = buttonid;
    parent.appendChild(name);
  }

 function initTable(win){
  var table = win.document.createElement("TABLE");
  table.setAttribute('border', '5px solid black');
  win.document.body.appendChild(table);
  return table;
 }

 function expandTable(element, win) {
      var hiddenTable = win.document.getElementById("sub" + element);
      if(hiddenTable.className == 'hidden'){
       hiddenTable.setAttribute('class', 'show');
      }else if(hiddenTable.className == 'show'){
       hiddenTable.setAttribute('class', 'hidden');
      }
    }

 function createStyle(styleName, win, spec){
   var style = win.document.createElement('style');
   style.type = 'text/css';
   styleString = '.'+styleName + ' { ' +spec +' }';
   style.innerHTML = styleString;
   win.document.getElementsByTagName('head')[0].appendChild(style);
 }

 function buttonStyle(name){
   name.fontFamily = "helvetica";
      name.style.backgroundColor = "GhostWhite";
      name.style.boxShadow = "2px 2px 4px 0 rgba(0, 0, 0, 0.25), -4px -4px 8px 0 rgba(255, 255, 255, 0)";
      name.style.color = "rgb(0,59,79)";
      name.style.fontSize = "14";
      name.style.borderRadius = "5px";
      name.style.border = 'none';
      name.style.fontWeight = 'bold';
      name.onmouseover = function(name){ return function(){
    name.style.boxShadow =  "2px 2px 6px 0 rgba(255, 255, 255, 0.3) inset, -4px -4px 8px 0 rgba(0, 0, 0, .25) inset";
      }}(name);
      name.onmouseout = function(name){ return function(){
    name.style.boxShadow = "2px 2px 4px 0 rgba(0, 0, 0, 0.25), -4px -4px 8px 0 rgba(255, 255, 255, 0)";
      }}(name);
  }

//--------Creating Elements-----------//
function createHTag(innerHTML, number, win) {
  var header = win.document.createElement("H"+number);
  header.innerHTML = innerHTML;
  win.document.body.appendChild(header);
}

function countAllPasses(allData) {
  var names = [];
  var failSet = [];
  var passSet = [];
  var groups = {};
  var fails = 0;
  var passes = 0;

  var keys = Object.keys(allData);
  var testIndex = 1;
  for(let dataKey of keys) {
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

function countPasses(data) {
  var pass = 0;
  var fail = 0;
  for(let element of data) {
    if(element.Status == 'PASS') {
      pass = pass + 1;
    } else if(element.Status == 'FAIL') {
      fail = fail + 1;
    }
  }
  var answer = [fail, pass];
  return answer;
}

function generatePieChart(title, win, labels, data, colors) {
  var myCanvas = win.document.createElement("CANVAS");
  win.document.body.append(myCanvas);

  //functions from piechartlibrary.js
  var config = createConfig(title);
  var chart1 = createChart(myCanvas, 350, 350, config);
  setLabels(config, labels);
  createDataSet(config, data, colors);
  chart1.update();
}

function generateLineChart(title, win, dataSet, axisLabels, lineLabels, colors) {
  //Line Chart
  var config = createLineConfig(S_VBAR_TYPE, title, axisLabels[0], axisLabels[1]);

  var canvas = win.document.createElement("CANVAS");
  win.document.body.appendChild(canvas);

  var chart2 = createLineChart(canvas, 350, 350, config);

  setLineChartLabels(config, dataSet[0]);
  for(let i=0;i<lineLabels.length;i++)
  {
    createLineDataSet(config, lineLabels[i], dataSet[i+1], LINE_TYPE, colors[i]);
  }
  chart2.update();
}

function createImage(id, source, width, height){
  var image = document.createElement('img');
  image.id = id;
  image.src = source;
  image.width = width;
  image.height = height;
  return image;
}
