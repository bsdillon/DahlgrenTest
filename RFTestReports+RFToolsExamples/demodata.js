let testCases = [
  { Test: "Open Site", Status: "Pass", Message: "" },
  { Test: "Radio Test", Status: "Pass", Message: "" },
  { Test: "Textbox Test", Status: "Pass", Message: "" },
  { Test: "Date Test", Status: "Fail", Message: "Element 'date' should have contained text '13/12/2020' but its text was ' '." },
  { Test: "Input Test", Status: "Fail", Message:" "}
];
function loadData(){
          var config1 = createConfig("Pass vs. Fail");
          var chart1 = createChart("canvas", 350,350,config1);
          let labels =['Fail','Pass', 'Not Run'];
          setLabels(config1, labels);
          var pass = 0;
          var fail = 0;
          var norun = 0;
          for(let element of testCases){
           if(element.Status == 'Pass') {
            pass = pass + 1;
           } else if(element.Status == 'Fail'){
            fail = fail + 1;
           }else{
            norun = norun + 1;
           }
          }
          data1 = [fail, pass, norun];
          console.log(data1);
          createDataSet(config1, data1);
          chart1.update();
          var suiteResult ='';
          if(pass > fail){
             suiteResult = 'Pass';
          }else{
             suiteResult = 'Fail';
          }
          console.log(suiteResult);
}
function generateHeatMapHead(table, data) {
 let thead = table.createTHead();
 let row = thead.insertRow();
}
function generateHeatMap(table, data){
  for(let element of data) {
   let row = table.insertRow();
   let cell = row.insertCell()
   let text = document.createTextNode("");
   cell.appendChild(text);
   cell.style.height = "50";
   cell.style.width ="50";
   cell.style.backgroundColor = "blue";
   console.log(element);
   status = element.Status;
   console.log(status);
   if(status == 'Pass') {
    cell.style.backgroundColor = "green";
   }else if(status == 'Fail') {
    cell.style.backgroundColor = "red";
   }
 }
}

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

function generateTable(table, data) {
  for (let element of data) {
    let row = table.insertRow();
    for (key in element) {
      let cell = row.insertCell();
      let text = document.createTextNode(element[key]);
      cell.appendChild(text);
    }
  }
}

