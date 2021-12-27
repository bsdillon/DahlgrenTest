var chartColors = {red: 'rgb(255, 0, 0)', orange: 'rgb(255, 128, 0)', yellow: 'rgb(255, 255, 0)',
        green: 'rgb(0, 255, 0)', blue: 'rgb(0, 0, 255)', purple: 'rgb(128, 0, 255)', 
        ro: 'rgb(128, 32, 0)', oy: 'rgb(128, 81, 0)', yg: 'rgb(64, 128, 0)', 
        gb: 'rgb(0, 128, 128)', bp: 'rgb(32, 0, 128)',
        grey: 'rgb(231,233,237)'};
var colors = ["rgb(0,59,79)","rgb(232, 176, 15)","rgb(111,175,198)","rgb(163,91,52)","rgb(148,67,139)","rgb(157,145,169)","rgb(221,26,143)","rgb(78,114,5)","rgb(77,3,36)","rgb(187,41,213)","rgb(155,191,255)","rgb(87,245,150)","rgb(118,7,228)","rgb(143,59,31)","rgb(11,116,221)","rgb(214,239,182)","rgb(242,39,129)","rgb(180,174,68)","rgb(112,21,104)"];
var marker = ['circle', 'rect', 'rectRot','triangle'];
var style = [[1,5,0],[2,10,5],[2,5,3],[3,1,2],[3,3,5]];
var lineStyleIndex = 0;
var groupColors = [[1,0,0], [1,1,0], [0,1,0], [0,0,1], [1,0,1], [0,1,1]];
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

  groupIndex[group%groupColors.length]+=1;
  var scale = groupIndex[group%groupColors.length];
  var r = groupColors[group%groupColors.length][0]*(255-(scale*50));
  var g = groupColors[group%groupColors.length][1]*(255-(scale*50));
  var b = groupColors[group%groupColors.length][2]*(255-(scale*50));

  return this.WriteDataObject('rgb('+r+','+g+','+b+', .5)', 'rgb('+r+','+g+','+b+')', 3+groupIndex[group], group, category);
}

ChartStyle.prototype.WriteDefaultPieDataObject = function()
{
  return this.WriteSpecificPieDataObject([]);
}

ChartStyle.prototype.WriteGroupPieDataObject = function(groupNumber, quantity)
{
  var myColor = groupColors[groupNumber%groupColors.length];

  var shade = 255/(quantity+1);

  var tmp={};
  tmp.data=[];
  tmp.backgroundColor=[];
  for(let i=0;i<quantity;i++)
  {
    var r = myColor[0]*(255-(i*shade));
    var g = myColor[1]*(255-(i*shade));
    var b = myColor[2]*(255-(i*shade));
    tmp.backgroundColor.push('rgb('+r+','+g+','+b+')');
  }

  return tmp;
}

ChartStyle.prototype.WriteSpecificPieDataObject = function(novelColors)
{
  var names = Object.keys(chartColors);
  var tmpColors = [];//use default colors
  for(let i=0;i<names.length;i++)
  {
    tmpColors[i]=chartColors[names[i]];
  }

  if(novelColors)//if a new set of colors has been defined
  {
    //because we are only copying colors, we can resort to the
    //defaults if there is an excessive number of data points.
    for(let i=0;i<novelColors.length;i++)
    {
      tmpColors[i]=novelColors[i];
    }
  }

  var tmp={};
  tmp.data=[];
  tmp.backgroundColor=[];
  for(let i = 0; i<tmpColors.length; i++)
  {
    tmp.backgroundColor.push(tmpColors[i]);
  }
  return tmp;
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

ChartStyle.prototype.WriteTrendDataObject = function()
{
  //we want to use the same color scheme as the last data set
  //so we decrese lineStyleIndex by one
  var colorNames = Object.keys(chartColors);
  var colorName = colorNames[(lineStyleIndex-1) % colorNames.length];
  var bgColor = Chart.helpers.color(chartColors[colorName]).alpha(0.5).rgbString();
  var bColor = chartColors[colorName];
  var pRadius = 5;
  primaryID = lineStyleIndex-1
  secondaryID = lineStyleIndex-1

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
       fill: false,
       pointStyle: 'none',
       pointRadius: pRadius,
       pointBorderColor: 'rgb(0, 0, 0)',
       borderDash: [style[secondaryID % style.length][1],style[secondaryID % style.length][2]],
       showLine: true
     };
   return newData;
}
