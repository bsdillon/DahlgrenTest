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
      
    buttonLink = rawData[i];
    createButton('button', oqe,'OQE', buttonLink, window, para, '', 'statOQE', '');


      //add data for the test.
      for(let oneTest of testData) {
        td = row.insertCell();
        var status = oneTest.Status;
        toolText = oneTest.Test + "<br>" + oneTest.Details;
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

//create tooltips for data td's
function toolTip(parent, text){
  parent.setAttribute('class','tooltip');
  var popUp = document.createElement("SPAN");
  popUp.setAttribute('class','tooltiptext');
  var popText = document.createElement("span");
  popText.innerHTML=text;
  popUp.appendChild(popText);
  parent.appendChild(popUp);
}

function createImage(id, source, width, height){
  var image = document.createElement('img');
  image.id = id;
  image.src = source;
  image.width = width;
  image.height = height;
  return image;
}

//BSD

 function sumArray(a, total){
       var total=0;
       for(var i in a) {
   total += a[i];
       }
       return total;
     }

 function loadTotalData(object, win){
      var length = Object.keys(object).length;
      var sortedData = sortData(object, breakElement);
      //Line Chart
      createHeaders('secondheader', "Performance Over Time", '2', win);
      var config2 = createLineConfig(LINE_TYPE, "Pass/Fail Percentage vs. Test Run", "Test Run", "Percentage");
      var chart2 = createLineChart("canvas2", 350, 350, config2, win);
      chart2.id = 'chart2';
      var XData = []
      var keys = Object.keys(object);
      var length = keys.length;
      for(var i=0; i<length; i++){//create labels for x axis, grabs the name of the first test in each test run
  var key = keys[i]
  var specData = object[key];
  XData.push(specData[i].Test);
      }
      setLineChartLabels(config2, XData);
      createLineDataSet(config2, "Pass Percentage", sortedData[0], LINE_TYPE);
      createLineDataSet(config2, "Fail Percentage", sortedData[1], LINE_TYPE);
      chart2.update();

      //Pie Chart
      data2 = [sumArray(sortedData[2]), sumArray(sortedData[3])];
      generatePieChart('firstheader', "Overall Test Breakdown", "2", win, data2);
      setTimeout(function(){ timedTotalUpdate('total', testRuns, win); }, 5000);
     }

 function timedTotalUpdate(tableid, object, win) {
      var data = Object.keys(object);
      var previousSubClass =[];
      const isClosed = win.closed;//this cont and the following if statement make sure that the update function does not run if the window has been closed, or switched to an individual OQE page
      if(!isClosed && !win.document.getElementById("totalPage")){
  for (let element of data){//this loop goes through all of the subtables in the main table, and determines whetehr they are hidden or open
     previousSubClass.push(table);
  }
  loadTable(testRuns, previousSubClass, win);
  loadTotalData(testRuns, win);
      }
 }

 function createHeaders(name, innerHTML, number, win){
   var name = win.document.createElement("H"+number);
   name.innerHTML = innerHTML;
   name.style.color = "rgb(0,59,79)";
   name.style.fontFamily = "helvetica";
   win.document.body.appendChild(name);

 }

 function generatePieChart(headerid, headerTitle, number, win, data2){
   createHeaders(headerid, headerTitle, number, win); //creates the header above the pie chart
   var config1 = createConfig("Pass v. Fail"); //all of these are functions from piechartlibrary.js
   var chart1 = createChart("canvas", 350, 350, config1, win);
   let labels = ['Fail', 'Pass'];
   setLabels(config1, labels);
   createDataSet(config1, data2);
   chart1.update();
}

 function generateTableHead(table, data, win) {
  var thead = table.createTHead();
  var row = thead.insertRow();
  var keys = [];
  for (let key of data) {
    keys.push(key);
  }
  //based on the way the listener is written, the parameters of a test are collected before everything else, but they should not be displayed in the table before everything else, so the list of headers has to be read and then shifted.
  //params = keys[0];
  //keys.shift();
  //keys.push(params);
  for(let element of keys) {
    var th = win.document.createElement("th");
    var text = win.document.createTextNode(element);
    th.appendChild(text);
    row.appendChild(th);
    th.style.borderRadius = "5px";
  }
  return keys; //returning this makes sure that th eheader keys are called in the correct order when the rest of the table content is generated.
}

 function isEven(value) {
	if (value%2 == 0)
		return true;
	else
		return false;
}

 function generateTable(table, data, win, keys) {
  var b = 1;//included for striped style
  for (let element of data) {
    var row = table.insertRow();
    var length = keys.length;
    for (var i=0; i<length; i++) {
      var cell = row.insertCell();
      var text = win.document.createTextNode(element[key]);
      if(!isEven(b)){
  cell.style.backgroundColor = 'rgba(0,0,0,0.07)';
      }
      cell.appendChild(text);
    }
    b = b + 1;
  }
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
    createButton('button', oqe,'OQE', buttonLink, window, para, '', 'statOQE', '');
     }
     var breakSpace = document.createElement("BR");
     breakSpace.id = "spacer";
     parentDiv.appendChild(breakSpace);
 }

 function totalStatus(data){
   var stat = '';
   var data1 = sortResults(data);
   if(data1[1] > data1[0]){
     stat = 'Pass';
   }else{
     stat= 'Fail';
   }
   return stat;
 }

//Individual OQE Metrics
 function loadOQEChart(data, win){
   win.document.body.innerHTML = '';
   win.document.body.style.backgroundColor = "GhostWhite";
   win.document.title = 'Individual OQE';
   createHeaders('header1', 'Test Results', '1', win);
   var buttonParent = win.document.createElement("H2");
   createButton('totalOQE', oqe, 'Total OQE', 'total',win, buttonParent, '', "totalPage", '');
   win.document.body.appendChild(buttonParent);
   var dataKeys = Object.keys(data[0]);
   var table = initTable(win);
   tableStyle(table);
   var keys = generateTableHead(table, dataKeys, win);
   generateTable(table, data, win, keys);
   data1 = sortResults(data);
   generatePieChart('header2', 'Pass/Fail Graphic', '2', win, data1);
 }

 function sortResults(data){
   var pass = 0;
   var fail = 0;
   for(let element of data){
     if(element.Status == 'PASS') {
       pass = pass + 1;
     } else if(element.Status == 'FAIL'){
       fail = fail + 1;
     }
   }
    data1 = [fail, pass];
    return data1;
 }

 function sortData(object, breakElement){
    var passPercent =[];
    var failPercent =[];
    var failA = [];
    var passA = [];
    var otherA = [];
    var data = Object.keys(object);
    for(let element of data){
       var subdata = object[element];
       data1 = sortResults(subdata);
       passA.push(data1[1]);
       failA.push(data1[0]);
       otherA.push(data1[2]);
       var passP = (data1[1] / (data1[1] + data1[0]))*100;
       var failP = (data1[0] /(data1[1] + data1[0]))*100;
       passPercent.push(passP);
       failPercent.push(failP);
    }
    var returnArray = [passPercent, failPercent, failA, passA, otherA];
    return returnArray;
  }

 function loadTable(object, subclass, win){
     var j = 0;
     //Set Headers/Title
     win.document.body.innerHTML = '';
     win.document.body.style.backgroundColor = "GhostWhite";
     win.document.title = 'Total OQE Results';
     createHeaders('totalHeader', 'Total OQE Results', '1', win);
     //Initialize Table
     var table = initTable(win);
     var data = Object.keys(object);
     let thead = table.createTHead();

     //Create Table Title
     let row = thead.insertRow();
     let title = win.document.createTextNode("Test Runs");
     let th = win.document.createElement("th");
     row.appendChild(th);
     cell.appendChild(title);
     //Populate Table w/ Each Test Run
     for(let element of data){
      //Create Test Run Label
      let row = table.insertRow();
      let cell = row.insertCell();
      cell.style.backgroundColor = "GhostWhite";
      cell.style.borderRadius = "5px";
      cell.style.fontWeight = 'bolder';
      var specificData = testRuns[element];
      var testRunName = specificData[0].Test; //Only works when there is one test in each test run, otherwise it will just be the name of a specfici test and not the test run as a whole
      let text = win.document.createTextNode("Test Run " + j + "\u00A0");
      cell.appendChild(text);
      createButton('expand', expandTable, ' + ', element, win, cell, 'right', 'expnd', win);
      createButton('oqeLink', oqe, 'OQE', element, win, cell, "right", 'indOQE', '');
      //Subtables
      var subtable = createSubTable(object, element, win, j, subclass);
      cell.appendChild(subtable);
      j = j + 1;
     }
 }

 function oqe(x){
     var windowFeatures = "menubar=yes,location=yes,resizable=no,scrollbars=yes,status=yes,left=100,top=100";
     var newWindow = null;
     if(x != 'total'){
       var chartData = testRuns[x];
       var win = window.open('', newWindow, windowFeatures);
       var temp = loadOQEChart(chartData, win);
       win.addEventListener('load', temp, false);
     }else{
       var win = window.open('', newWindow, windowFeatures);
       win.addEventListener('load', startData(win), false );
     }
 }

//Cumulative OQE Metrics
 function startData(win){
      var initSubClass = [];
      for(var i=0; i<Object.keys(testRuns).length; i++){
   var initClass = "hidden";
   initSubClass.push(initClass);
      }
      loadTable(testRuns, initSubClass, win);
      loadTotalData(testRuns, win);
    }

 function createButton(name, func, inner, element, window, parent, align, buttonid, element2){
    var name = window.document.createElement("BUTTON");
    name.onclick = function(element, element2){ return function(){ func(element, element2);}}(element, element2);
    name.innerHTML = inner;
    name.style.cssFloat = align;
    buttonStyle(name);
    name.id = buttonid;
    parent.appendChild(name);
  }

 function createSubTable(object, element, win, j, subclass){
    var actualdata = object[element];
    var data1 = Object.keys(actualdata[0]);
    var subtable = win.document.createElement("TABLE");
    win.document.body.appendChild(subtable);
    subtable.id = "sub" + element;
    createStyle('hidden', win, 'display: none;');
    createStyle('show', win, 'border: 1px solid black;');
    subtable.className = subclass[j];
    var keys = generateTableHead(subtable, data1, win);//using the keys array created by the generateTableHead function (line 467) ensures the correct ordering of data in the table
    generateTable(subtable, actualdata, win);
    tableStyle(subtable);
    return subtable;
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
