//Set Total Number of Test Runs
 var totalRuns = 6;
//Home Page
 function generateHeatMap(data, length){
    var heatMap = document.getElementById('heatmap');
    heatMap.style.margin = "10px 10px 10px 10px";
    for(var j=0; j<length+1; j++){
     var row = heatMap.insertRow();
     var labelCell = row.insertCell();
     var label = document.createTextNode(j);
     labelCell.appendChild(label);
     labelCell.style.color = "white";
     labelCell.style.backgroundColor = "Gray";
     var array = data["testRun"+j];
     if(!array && j!= totalRuns){ //Case where test run is in progress
      var image = document.createElement('img');
      image.src = "spinningclock.gif";
      image.height = '40';
      image.width = '40';
      var runLabel = 'Test Run ' + j;
      labelCell.innerHTML = '';
      labelCell.appendChild(image);
      toolTip(labelCell, runLabel);
      if(typeof heatMap.rows[j-1] === "undefined"){ //Case where no previous test runs have completed
       cell = row.insertCell();
       cell.style.backgroundColor = 'rgb(198, 204, 208)';
       break;
      }else{ //Generates in progress cells
       var loadCells = heatMap.rows[j-1].cells.length-1;
       for(var i=0; i<loadCells; i++){
         cell = row.insertCell();
         cell.style.backgroundColor = "rgb(198, 204, 208)";
       }
      }
      break; //Ends loop
     }else if (j == totalRuns){ //End of all test runs case
      labelCell.innerHTML = 'End';
      labelCell.colSpan = heatMap.rows[j-1].cells.length;
      break;
     }else{ //Case where test run has been completed and test data is available
      for(let element of array){
        cell = row.insertCell();
        var status = element.Status;
        toolText = element.Test + ":  " + element.Message;
        toolTip(cell, toolText);
        if(status == 'Pass') {
          cell.style.backgroundColor = "CadetBlue";
          hoverStyle(cell, "CadetBlue", 'rgb(95, 150, 160');
        }else if(status == 'Fail') {
          cell.style.backgroundColor = "rgb(0,59,79)";
          hoverStyle(cell, 'rgb(0, 59, 79)', 'rgb(0, 50, 59)');
        }
       }
     }
     //Establish target number for buffer cells
     var targetNum = Object.keys(array).length;
     if(!data["testRun" + (j-1)]){
       targetNum = targetNum;
     }else{
       prevNum = heatMap.rows[j-1].cells.length-1;
       if(targetNum < prevNum){
         targetNum = prevNum;
       }
      }
     //Create Buffer Cells
     for(var i=0; i<heatMap.rows.length; i++){
        while(typeof heatMap.rows[i].cells[targetNum] === "undefined"){
           bufferCell = heatMap.rows[i].insertCell(heatMap.rows[i].cells.length);
           bufferCell.style.backgroundColor = "Gray";
         }
     }
   }
   //Create Test Runs Header
   createTotalHeader(heatMap);
}

 function hoverStyle(cell, color1, color2){
   cell.onmouseover = function(cell){ return function(){
      cell.style.backgroundColor = color2;
      cell.style.boxShadow =  "2px 2px 6px 0 rgba(255, 255, 255, 0.3) inset, -4px -4px 8px 0 rgba(0, 0, 0, .25) inset";
   }}(cell);
   cell.onmouseout = function(cell){ return function(){
      cell.style.backgroundColor = color1;
      cell.style.boxShadow = "";
   }}(cell);

 }

 function createTotalHeader(heatMap){
   var rowspan = heatMap.rows.length;
   var headerRuns = heatMap.rows[0].insertCell(heatMap.rows[0].cells[0]);
   headerRuns.rowSpan = rowspan;
   headerRuns.style.backgroundColor = "DimGray";
   headerRuns.style.color = "white";
   headerRuns.setAttribute('class', 'rotate');
   headerRuns.style.cssFloat = 'center';
   var header = document.createTextNode("Test Runs");
   headerRuns.appendChild(header);
 }

 function toolTip(parent, text){
   parent.setAttribute('class','tooltip');
   var popUp = document.createElement("SPAN");
   popUp.setAttribute('class','tooltiptext');
   var popText = document.createTextNode(text);
   popUp.appendChild(popText);
   parent.appendChild(popUp);
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

 function createButton(name, func, inner, element, window, parent, align, buttonid){
   var name = window.document.createElement("BUTTON");
   name.onclick = function(element){ return function(){ func(element);}}(element);
   name.innerHTML = inner;
   name.style.cssFloat = align;
   buttonStyle(name);
   name.id = buttonid;
   parent.appendChild(name);
 }

 function generateStatus(data, length){
        var div =document.createElement('div');
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
          var actualdata = testRuns["testRun" + i];
          if(!actualdata && i != totalRuns){
           var stat = 'Running...';
          }else if(i == totalRuns){
           para.innerHTML = '';
           break;
          }else{
           var stat = totalStatus(actualdata);
          }
          var text = document.createTextNode(stat + "    ");
          var span = document.createElement('span');
          span.appendChild(text);
          if(stat == 'Pass'){
            span.style.color = 'green';
          }else if (stat == 'Fail'){
            span.style.color = 'red';
          }
          para.appendChild(span);
          buttonLink = 'testRun' + i;
          createButton('button', oqe,'OQE', buttonLink, window, para, '', 'statOQE');
     }
     var breakSpace = document.createElement("BR");
     breakSpace.id = "spacer";
     parentDiv.appendChild(breakSpace);
 }

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

 function start(){
        var length = Object.keys(testRuns).length;
        headerLogo();
        generateStatus(testRuns, length);
        generateHeatMap(testRuns, length);
        setTimeout(function(){ timedUpdate('heatmap'); }, 5000);
 }


 function headerLogo(){
   var logo = document.createElement('img');
   logo.id = "mainLogo";
   logo.src = "totallogo.png";
   logo.width = "200";
   logo.height = "75";

   var backing = document.getElementById('header');
   backing.appendChild(logo);
 }

 function sortResults(data){
   var pass = 0;
   var fail = 0;
   for(let element of data){
     if(element.Status == 'Pass') {
       pass = pass + 1;
     } else if(element.Status == 'Fail'){
       fail = fail + 1;
     }
   }
    data1 = [fail, pass];
    return data1;
 }

 function oqe(x){
     var link = x +".html";
     var windowFeatures = "menubar=yes,location=yes,resizable=no,scrollbars=yes,status=yes,left=100,top=100";
     var newWindow = null;
     if(x != 'total'){
       var chartData = testRuns[x];
       var win = window.open('', newWindow, windowFeatures);
       win.addEventListener('load', loadOQEChart(chartData, win), false);
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
     tableStyle(table);
     //Create Table Title
     let row = thead.insertRow();
     let title = win.document.createTextNode("Test Runs");
     let cell = row.insertCell();
     cell.appendChild(title);
     cellStyle(cell, "bold");
     //Populate Table w/ Each Test Run
     for(let element of data){
      //Create Test Run Label
      let row = table.insertRow();
      let cell = row.insertCell();
      cell.style.borderRadius = "5px";
      cell.style.backgroundColor = "GhostWhite";
      cell.style.fontWeight = 'bolder';
      let text = win.document.createTextNode("Test Run " + j + "\u00A0");
      cell.appendChild(text);
      //Create Expansion Button
      var expand = win.document.createElement("BUTTON");
      expand.onclick = function(element, win){ return function(){ expandTable(element, win);}}(element, win);
      expand.innerHTML = ' + ';
      expand.style.cssFloat = "right";
      buttonStyle(expand);
      cell.appendChild(expand);
      //Link to Individual OQE
      createButton('oqeLink', oqe, 'OQE', element, win, cell, "right", 'indOQE');
      //Subtables
      var subtable = createSubTable(object, element, win, j, subclass);
      cell.appendChild(subtable);
      j = j + 1;
     }
 }

 function tableStyle(table){
  table.style.borderRadius = "10px";
  table.style.border = "6px solid GhostWhite";
  table.style.color = "rgb(0,59,79)";
  table.style.fontFamily = "helvetica";
  table.style.boxShadow = "12px 12px 16px 0 rgba(0, 0, 0, 0.25), -8px -8px 12px 0 rgba(255, 255, 255, 0)";
 }

 function cellStyle(cell, weight){
  // cell.style.borderRadius = "5px";
   cell.style.backgroundColor = "GhostWhite";
   cell.style.fontWeight = weight;
   //cell.style.boxShadow = " 2px 2px 6px 0 rgba(255, 255, 255, 0.3) inset, -1.5px -1.5px 3px 0 rgba(0, 0, 0, .25) inset";
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
    generateTableHead(subtable, data1, win);
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

 function sortData(object, breakElement){
    var passPercent =[];
    var failPercent =[];
    var failA = [];
    var passA = [];
    var otherA = [];
    var data = Object.keys(object);
    for(let element of data){
       var subdata = testRuns[element];
       var length = Object.keys(subdata).length;
       data1 = sortResults(subdata);
       passA.push(data1[1]);
       failA.push(data1[0]);
       otherA.push(data1[2]);
       var passP = (data1[1] / (data1[1] + data1[0]))*100;
       var failP = (data1[0] /(data1[1] + data1[0]))*100;
       passPercent.push(passP);
       failPercent.push(failP);
       if(element == breakElement){break;}
    }
    var returnArray = [passPercent, failPercent, failA, passA, otherA];
    return returnArray;
  }

 function sumArray(a, total){
       var total=0;
       for(var i in a) {
         total += a[i];
       }
       return total;
     }

 function loadTotalData(object, win){
      var length = Object.keys(object).length;
      var breakElement = 'testRun' + length-1;
      var sortedData = sortData(object, breakElement);
      //Line Chart
      createHeaders('secondheader', "Performance Over Time", '2', win);
      var config2 = createLineConfig(LINE_TYPE, "Pass/Fail Percentage vs. Test Run", "Test Run", "Percentage");
      var chart2 = createLineChart("canvas2", 350, 350, config2, win);
      chart2.id = 'chart2';
      var XData = Object.keys(object);
      setLineChartLabels(config2, XData);
      createLineDataSet(config2, "Pass Percentage", sortedData[0], LINE_TYPE);
      createLineDataSet(config2, "Fail Percentage", sortedData[1], LINE_TYPE);
      chart2.update();
      //Pie Chart
      createHeaders('firstheader', 'Overall Test Breakdown', '2', win);
      var config1 = createConfig("Pass vs. Fail");
      var chart1 = createChart("canvas", 350,350,config1, win);
      let labels =['Fail','Pass'];
      setLabels(config1, labels);
      data2 = [sumArray(sortedData[2]), sumArray(sortedData[3])];
      createDataSet(config1, data2);
      chart1.update();
      setTimeout(function(){ timedTotalUpdate('total', testRuns, win); }, 5000);
     }


 function timedTotalUpdate(tableid, object, win) {
      var data = Object.keys(object);
      var previousClass =[];
      const isClosed = win.closed;
      if(!isClosed && !win.document.getElementById("totalPage")){
        for (let element of data){
           if(!win.document.getElementById("sub" + element)){
             previousClass.push('hidden');
           }else{
             var table = win.document.getElementById("sub" + element).className;
             previousClass.push(table);
           }
        }
        loadTable(testRuns, previousClass, win);
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

//Individual OQE Metrics
 function loadOQEChart(data, win){
   win.document.body.innerHTML = '';
   win.document.body.style.backgroundColor = "GhostWhite";
   win.document.title = 'Individual OQE';
   createHeaders('header1', 'Test Results', '1', win);
   var buttonParent = win.document.createElement("H2");
   createButton('totalOQE', oqe, 'Total OQE', 'total',win, buttonParent, '', "totalPage");
   win.document.body.appendChild(buttonParent);
   var dataKeys = Object.keys(data[0]);
   var table = initTable(win);
   tableStyle(table);
   generateTableHead(table, dataKeys, win);
   generateTable(table, data, win);
   createHeaders('header2', "Pass/Fail Graphic", '2', win);
   data1 = sortResults(data);
   var config1 = createConfig("Pass vs. Fail");
   var chart1 = createChart("canvas", 350,350,config1, win);
   let labels =['Fail','Pass'];
   setLabels(config1, labels);
   createDataSet(config1, data1);
   chart1.update();
 }

 function generateTableHead(table, data, win) {
  var thead = table.createTHead();
  var row = thead.insertRow();
  for (let key of data) {
    var th = win.document.createElement("th");
    var text = win.document.createTextNode(key);
    th.appendChild(text);
    row.appendChild(th);
    th.style.borderRadius = "5px";
    cellStyle(th, "bold");
  }
}

function isEven(value) {
	if (value%2 == 0)
		return true;
	else
		return false;
}

 function generateTable(table, data, win) {
  var b = 1;
  for (let element of data) {
    var row = table.insertRow();
    for (key in element) {
      var cell = row.insertCell();
      var text = win.document.createTextNode(element[key]);
      cellStyle(cell, "normal");
      if(!isEven(b)){
        cell.style.backgroundColor = 'rgba(0,0,0,0.07)';
      }
      cell.appendChild(text);
    }
    b = b + 1;
  }
}

