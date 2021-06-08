//Home Page
 function generateHeatMapRows(table, data){
   for(let element of data) {
     table.insertRow();
   }
 }

 function generateHeatMapColumns(table, data){
   for (var i = 0; i < table.rows.length; i++) {
     cell = table.rows[i].insertCell(table.rows[i].cells.length);
     cell.setAttribute('class','tooltip');
     var popUp = document.createElement("SPAN");
     popUp.setAttribute('class','tooltiptext');
     let element = data[i];
     var popText = document.createTextNode(element.Test + ":  " + element.Message);
     popUp.appendChild(popText);
     cell.appendChild(popUp);
     var status = element.Status;
     if(status == 'Pass') {
       cell.style.backgroundColor = "green";
     }else if(status == 'Fail') {
       cell.style.backgroundColor = "red";
     }else{
       cell.style.backgroundColor = "CadetBlue";
     }
     if (i === data.length) { break;}
   }
 }

 function generateHeatMap(data){
   var heatMap = document.getElementById('heatmap');
   generateHeatMapRows(heatMap, data.testRun0);
   var runs = Object.keys(data).length;
   for(var j=0; j<runs; j++){
     var array = data["testRun" + j];
     generateHeatMapColumns(heatMap, array);
   }
}

 function totalStatus(data){
   var stat = '';
   var data1 = sortResults(data);
   if (data1[2] != 0){
     if(data1[1] == 0 && data1[0] ==0){
        stat = 'Not Run';
     }else{
        stat = 'Running...';
     }
   }else if(data1[1] > data1[0]){
     stat = 'Pass';
   }else{
     stat= 'Fail';
   }
   return stat;
 }

 function oqe(x){
     var link = x +".html";
     var windowFeatures = "menubar=yes,location=yes,resizable=no,scrollbars=yes,status=yes,left=100,top=100";
     var newWindow = null;
     if(x == 'total'){
        window.open(link, newWindow, windowFeatures);
     }else{
        var chartData = testRuns[x];
        var newWindow = window.open('individualOQE.html', '_blank', windowFeatures);   
        let doc = newWindow.document; 
        var table = doc.getElementById('demo');
        newWindow.addEventListener('load', loadOQEChart(chartData, table, doc), false);
        
     }      
 }



function createButton(name, func, inner, element, parent, align){
   var name = document.createElement("BUTTON");
   name.onclick = function(element){ return function(){ func(element);}}(element);
   name.innerHTML = inner;
   name.style.cssFloat = align;
   parent.appendChild(name);
 }

 function generateStatus(data){
        var length = Object.keys(data).length;
        var div =document.createElement('div');
        div.id = 'statusText';
        document.body.appendChild(div);
        for(var i=0; i<length; i++){
          var para = document.createElement("P");
          para.id = 'status'+ i;
          div.appendChild(para);
          var test = document.createTextNode("Test Run " + i + "    ");
          para.appendChild(test);
          var actualdata = testRuns["testRun" + i];
          var stat = totalStatus(actualdata);
          if(stat != 'Not Run'){
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
             createButton('button', oqe,'OQE', buttonLink, para, '');
    
          }else{
             para.innerHTML = " ";
          }
        }
 }


 function timedUpdate(tableid) {
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
        generateStatus(testRuns);
        generateHeatMap(testRuns);
        setTimeout(function(){ timedUpdate('heatmap'); }, 5000);
 }

function sortResults(data){
   var pass = 0;
   var fail = 0;
   var norun = 0;
   for(let element of data){
     if(element.Status == 'Pass') {
       pass = pass + 1;
     } else if(element.Status == 'Fail'){
       fail = fail + 1;
     }else{
       norun = norun + 1;
     }
   }
    data1 = [fail, pass, norun];
    return data1;
}

//Individual OQE Metrics
 function loadOQEChart(data, table, doc){
   var dataKeys = Object.keys(data[0]);
   //generateTableHead(table, dataKeys, doc);
   //generateTable(table, data, doc);
   data1 = sortResults(data);
   alert(data1);
   var config1 = createConfig("Pass vs. Fail");
   var chart1 = createChart("canvas", 350,350,config1);
   alert('here?');
   let labels =['Fail','Pass', 'Not Run'];
   setLabels(config1, labels);
   createDataSet(config1, data1);
   chart1.update();
   var suiteResult ='';
   if(data1[2] > data1[1]){
     suiteResult = 'Pass';
   }else{
     suiteResult = 'Fail';
   }
 }

 function timedUpdateExample(){
   document.getElementById("dataSourceFile").remove();
   clearLineGroupIndex();
   chart1.destroy();
   var head= document.getElementsByTagName('head')[0];
   var script= document.createElement('script');
   script.src= 'demodata.js';
   script.id='dataSourceFile';
   head.appendChild(script);
   loadOQEChart(data);
}

 function generateTableHead(table, data, doc) {
  let thead = table.createTHead();
  alert('here');
  let row = thead.insertRow();
  for (let key of dataKeys) {
    let th = doc.createElement("th");
    let text = doc.createTextNode(key);
    th.appendChild(text);
    row.appendChild(th);
  }
}

 function generateTable(table, data, doc) {
  for (let element of data) {
    let row = table.insertRow();
    for (key in element) {
      let cell = row.insertCell();
      let text = doc.createTextNode(element[key]);
      cell.appendChild(text);
    }
  }
}

//Cumulative OQE Metrics
 function generateTableHead(table, data) {
   let thead = table.createTHead();
   let row = thead.insertRow();
   for (let key of data) {
     let th = document.createElement("th");
     let text = document.createTextNode(key);
     th.appendChild(text);
     row.appendChild(th);
   }
 }

 function loadTable(object, subclass){
     var j = 0;
     var table = document.getElementById("total");
     var data = Object.keys(object);
     let thead = table.createTHead();
     let row = thead.insertRow();
     let title = document.createTextNode("Test Runs");
     let cell = row.insertCell();
     cell.appendChild(title);
     for(let element of data){
      let row = table.insertRow();
      let cell = row.insertCell();
      let text = document.createTextNode("Test Run " + j + "\u00A0");
      cell.appendChild(text);
      createButton('expand', expandTable, ' + ', element, cell, "right");
      createButton('oqeLink', oqe, 'OQE', element, cell, "right");
      var actualdata = object[element];
      var data1 = Object.keys(actualdata[0]);
      var subtable = document.createElement("TABLE");
      subtable.id = "sub" + element;
      subtable.setAttribute('class', subclass[j]);
      generateTableHead(subtable, data1);
      generateTable(subtable, actualdata);
      cell.appendChild(subtable);
      j = j + 1;
     }
    }


 function expandTable(element) {
      var hiddenTable = document.getElementById("sub" + element);
      if(hiddenTable.className == 'hidden'){
       hiddenTable.setAttribute('class', 'show');
      }else if(hiddenTable.className == 'show'){
       hiddenTable.setAttribute('class', 'hidden');
      }
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
       var passP = (data1[1] / (data1[1] + data1[0] + data1[2]))*100;
       var failP = (data1[0] /(data1[1] + data1[0] + data1[2]))*100;
       passPercent.push(passP);
       failPercent.push(failP);
       if(element == breakElement){break;}
    }
    var returnArray = [passPercent, failPercent, failA, passA, otherA];
    return returnArray;
  }

 function loadTotalData(object){
      var length = Object.keys(object).length;
      var breakElement = 'testRun' + length-1;
      var config2 = createLineConfig(LINE_TYPE, "Pass/Fail Percentage vs. Test Run", "Test Run", "Percentage");
      var chart2 = createLineChart("canvas2", 350, 350, config2);
      chart2.id = 'chart2';
      var XData = Object.keys(object);
      setLineChartLabels(config2, XData);
      var config1 = createConfig("Pass vs. Fail");
      var chart1 = createChart("canvas1", 350,350, config1);
      chart1.id = 'chart1';
      let labels =['Fail','Pass'];
      setLabels(config1, labels);
      var sortedData = sortData(object, breakElement);
      data2 = [sumArray(sortedData[2]), sumArray(sortedData[3])];
      createDataSet(config1, data2);
      chart1.update();
      createLineDataSet(config2, "Pass Percentage", sortedData[0], LINE_TYPE);
      createLineDataSet(config2, "Fail Percentage", sortedData[1], LINE_TYPE);
      chart2.update();
      setTimeout(function(){ timedTotalUpdate('total', testRuns); }, 5000);
     }



 function sumArray(a, total){
       var total=0;
       for(var i in a) {
         total += a[i];
       }
       return total;
     }

 function timedTotalUpdate(tableid, object) {
      var data = Object.keys(object);
      var previousClass =[];
      for (let element of data){
       var table = document.getElementById("sub" + element);
       previousClass.push(table.className);
      }
      document.getElementById("dataSourceFile").remove();
      var table = document.getElementById(tableid);
      table.innerHTML = "";
      var head= document.getElementsByTagName('head')[0];
      var script= document.createElement('script');
      script.src= 'demodata.js';
      script.id='dataSourceFile';
      head.appendChild(script);
      loadTable(testRuns, previousClass);
      loadTotalData(testRuns);
 }

 function startData(){
      var initSubClass = ['hidden', 'hidden', 'hidden', 'hidden'];
      loadTable(testRuns, initSubClass);
      loadTotalData(testRuns);
    }
