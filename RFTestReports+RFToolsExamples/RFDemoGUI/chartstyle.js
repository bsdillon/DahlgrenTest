var chartColors = {red: 'rgb(255, 99, 132)', orange: 'rgb(255, 159, 64)', yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)', blue: 'rgb(54, 162, 235)', purple: 'rgb(153, 102, 255)',
        grey: 'rgb(231,233,237)'};
var marker = ['circle', 'rect', 'rectRot','triangle'];
var style = [[1,5,0],[2,10,5],[2,5,3],[3,1,2],[3,3,5]];
var lineStyleIndex = 0;
var groupColors = [[1,0,0], [1,1,0], [0,1,0], [0,0,1], [1,0,1], [0,1,1], [1,1,1]];
var groupIndex = [0, 0, 0, 0, 0, 0, 0];

function ChartStyle(fill)
{
  this.fillOption = fill;
  lineStyleIndex = 0;
  groupIndex = [0, 0, 0, 0, 0, 0, 0];
}

ChartStyle.prototype.getSpecificDataObject = function (bgColor, borderColor)
{
  return this.WriteDataObject(Chart.helpers.color(bgColor).alpha(0.5).rgbString(), borderColor, 5, lineStyleIndex, lineStyleIndex);
}

ChartStyle.prototype.getRandomDataObject = function ()
{
  var colorNames = Object.keys(chartColors);
  var colorName = colorNames[lineStyleIndex % colorNames.length];

  return this.WriteDataObject(Chart.helpers.color(chartColors[colorName]).alpha(0.5).rgbString(), chartColors[colorName], 5, lineStyleIndex, lineStyleIndex);
}

ChartStyle.prototype.getGroupDataObject = function (group, category)
{
  var primaryID = lineStyleIndex;
  var secondaryID = lineStyleIndex;

  groupIndex[group]+=1;
  var scale = groupIndex[group];
  var r = groupColors[group][0]*(255-(scale*25));
  var g = groupColors[group][1]*(255-(scale*25));
  var b = groupColors[group][2]*(255-(scale*25));

  return this.WriteDataObject('rgb('+r+','+g+','+b+')', 'rgb('+r+','+g+','+b+')', 3+groupIndex[group], group, category);
}

ChartStyle.prototype.WriteDataObject = function(bgColor, bColor, pRadius, primaryID, secondaryID)
{
  lineStyleIndex++;

  var fillStyle="false";
  if(this.fillOption)
  {
    fillStyle="-1";
  }

  if(this.fillOption && lineStyleIndex==1)
  {
    fillStyle="start";
  }

   var seriesName = "dummy";
   var dummyData = [];
   var newData =
     {
       label: seriesName,
       backgroundColor: bgColor,
       borderColor: bColor,
       borderWidth: style[primaryID % style.length][0],
       data: dummyData,
       fill: fillStyle,
       pointStyle: marker[secondaryID % marker.length],
       pointRadius: pRadius,
       pointBorderColor: 'rgb(0, 0, 0)',
       borderDash: [style[secondaryID % style.length][1],style[secondaryID % style.length][2]]
     };
   return newData;
}