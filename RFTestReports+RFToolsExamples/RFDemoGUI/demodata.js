var testRuns = {
testRun0 : [
  { Test: "Open Site", Status: "Pass", Message: "" },
  { Test: "Radio Test", Status: "Pass", Message: "" },
  { Test: "Textbox Test", Status: "Pass", Message: "" },
  { Test: "Date Test", Status: "Fail", Message: "Element 'date' should have contained text '13/12/2020' but its text was ' '." },
  { Test: "Input Test", Status: "Pass", Message:" "}
],

testRun1 : [
  { Test: "Open Site", Status: "Pass", Message: "" },
  { Test: "Radio Test", Status: "Fail", Message: "Refused to run" },
  { Test: "Textbox Test", Status: "Fail", Message: "Just didn't work" },
  { Test: "Date Test", Status: "Fail", Message: "Element 'date' should have contained text '13/12/2020' but its text was ' '." },
  { Test: "Input Test", Status: "RunningMC", Message:" "}
],


testRun2 : [
  { Test: "Open Site", Status: "Not Run", Message: "" },
  { Test: "Radio Test", Status: "Not Run", Message: "" },
  { Test: "Textbox Test", Status: "Not Run", Message: "Just didn't work" },
  { Test: "Date Test", Status: "Not Run", Message: "Element 'date' should have contained text '13/12/2020' but its text was ' '." },
  { Test: "Input Test", Status: "Not Run", Message:"Running"}
],

testRun3 : [
  { Test: "Open Site", Status: "Not Run", Message: "" },
  { Test: "Radio Test", Status: "Not Run", Message: " " },
  { Test: "Textbox Test", Status: "Not Run", Message: "" },
  { Test: "Date Test", Status: "Not Run", Message: " " },
  { Test: "Input Test", Status: "Not Run", Message:" "}
],
};

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
