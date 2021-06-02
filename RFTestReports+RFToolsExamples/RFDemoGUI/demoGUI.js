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
              cell.style.backgroundColor = "ForestGreen";
            }else if(status == 'Fail') {
              cell.style.backgroundColor = "FireBrick";
            }else{
              cell.style.backgroundColor = "CadetBlue";
            }
            if (i === 5) { break;}
          }
         }


     function generateHeatMap(){
      var heatMap = document.getElementById('heatmap');
      generateHeatMapRows(heatMap, testRuns.testRun0);
      var runs = Object.keys(testRuns).length;
      console.log(runs);
      for(var j=0; j<runs; j++){
        var array = testRuns["testRun" + j];
        generateHeatMapColumns(heatMap, array);
      }
     }


      function totalStatus(data, paragraph, i){
          var pass = 0;
          var fail = 0;
          var other = 0;
          var stat = '';
          for(let element of data){
            if(element.Status == 'Pass') {
              pass = pass + 1;

            } else if(element.Status == 'Fail'){
              fail = fail + 1;

            } else {
              other = other + 1;
            }
          }
         if (other != 0){
          if(pass == 0 && fail ==0){
           stat = 'Not Run';
          }else{
           stat = 'Running...';
          }
         }else if(pass > fail){
          stat = 'Pass';
         }else{
          stat= 'Fail';
         }
         var paragraph = document.getElementById(paragraph);
         if(stat != 'Not Run'){
          var text = document.createTextNode(stat + "    ");
          paragraph.appendChild(text);
          var button = document.createElement("BUTTON")
          button.id = 'oqe' + i;
          var buttonLink = "testRun" + i;
          button.onclick = (function(buttonLink){ return function(){oqe(buttonLink);}})(buttonLink);
          button.innerHTML = 'OQE';
          paragraph.appendChild(button);
         }else{
          paragraph.innerHTML = " ";
         }
       }

       function oqe(x){
        var link = x +".html";
        var windowFeatures = "menubar=yes,location=yes,resizable=no,scrollbars=yes,status=yes,left=100,top=100";
        var newWindow = null;
        window.open(link, newWindow, windowFeatures);
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
         totalStatus(actualdata, para.id, i);
        }
        setTimeout(function(){ timedUpdate('heatmap'); }, 5000);
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
         var heatMap = document.getElementById('heatmap');
         generateHeatMapRows(heatMap, testRuns.testRun0);
         var runs = Object.keys(testRuns).length;
         for(var j=0; j<runs; j++){
           var array = testRuns["testRun" + j];
           generateHeatMapColumns(heatMap, array);
         }
         generateStatus(testRuns);
       }

       function start(){
        generateHeatMap();
        generateStatus(testRuns);
        setTimeout(function(){ timedUpdate('heatmap'); }, 5000);
       }
