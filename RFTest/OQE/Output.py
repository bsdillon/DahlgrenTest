from robot.api.deco import keyword
from datetime import datetime
import os.path
import shutil
from filemaker import *
from datetime import *

defaultFile = './../../../RFData'

class output:
   '''
   Highly related to DataExtraction.resource, the output file directly writes into the
   javascript data file.\n\n
   ...    _*Creating a valid test*_\n\n
   ...    \t\t*Configuration Validation* - Verify the connection between the test script 
   ...    and the report.\n\n
   ...    *Test Setup* - Create and configure individual tests.\n\n\n
   ...    _*Generating test data*_\n\n
   ...    *Time Functions* - Start, stop, and read named timers during test\n\n
   ...    *Comparisons* - Derive Pass/Fail criteria by comparing value(s)\n\n
   ...    *Output Functions* - Write a line into the report file.\n\n\n
   ...    _*Graphing data*_\n\n
   ...    *Suite Chart Functions* - Create data charts for the suite. Add data, change format, etc.\n\n
   ...    *Test Chart Functions* - Create data charts for a single test. Add data, change format, etc.
   '''
   ROBOT_LIBRARY_SCOPE = 'SUITE'
   ROBOT_AUTO_KEYWORDS = False

   def __init__(self):
      self.currentTestName = "blank"
      self.timeMark = {}
      self.testCaseStart = datetime.fromtimestamp(0)
      self.dataTitles = {}
      self.dataTitles[''] = []
      self.PASS_TOKEN="PASS"
      self.FAIL_TOKEN="FAIL"
      self.dataFile = None

   @keyword(name='Prove it works')
   def ProveItWorks(self):
      '''
      Part of *Configuration Validation*\n
      Prove it Works returns text (for the purpose of logging) that came from 
      output.py. This return validates that link int he OQE library.
      '''
      return "output.py is connected"

   @keyword(name='Insert Dummy Test Data')
   def InsertDummyTestData(self):
      '''
      Part of *Configuration Validation*\n
      Insert Dummy Test Data creates a small entry in test.js which validates
      the connnection between the OQE library and the report tool.
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Insert Dummy Test Data' before 'Configure Data Path'")

      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      deltaTime = str(self.testCaseStart - tmp)
      f = open(self.dataFile, "a")
      f.write("testRuns['Dummy Data~1970-01-01 00:00:00.000000']=[];\n")
      f.write("testRuns['Dummy Data~1970-01-01 00:00:00.000000'].push({Case: 'OQE setup validation', Step: 'Validation', Time: '"+deltaTime+"', Status: 'Pass', Details: 'Actual: Everying worked, Expected: Everything worked'});\n")
      f.close()

   @keyword(name='Configure Data Path')
   def ConfigureDataPath(self, primaryFile=defaultFile):
      '''
      Part of *Test Setup*.\n
      The primaryFile path is the location where the test data, images, etc.
      will be written. This setting _*MUST*_ come before the first use.
      Multiple errors will be raised if a different keyword is called first.
      '''
      self.dataFile = primaryFile+"/test.js"

   @keyword(name='Archive Any Previous Data')
   def ArchiveAnyPreviousData(self):
      '''
      Part of *Test Setup*\n
      Archive Any Previous Data ensures that any remaininig data is saved
      and the file structure is prepared for new data. The function detects
      or creates the IMG, IMG/TEMP, IMG/WATCHER, and ARCHIVE folders. I also
      renames any existing test.js and moves it into the archive. Data from
      the existing test.js is added to the archive.js file. In any case a new
      test.js file is created.
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Archive Any Previous Data' before 'Configure Data Path'")

      imgPath = os.path.dirname(self.dataFile) + "/" + "IMG"
      if not os.path.exists(imgPath):
         os.mkdir(imgPath)

      tempPath = imgPath + "/" + "TEMP"
      if not os.path.exists(tempPath):
         os.mkdir(tempPath)

      tempPath = imgPath + "/" + "WATCHER"
      if not os.path.exists(tempPath):
         os.mkdir(tempPath)

      #archive existing files
      if os.path.exists(self.dataFile):
         #create the archive space
         arcPath = os.path.dirname(self.dataFile) + "/" + "ARCHIVE"
         if not os.path.exists(arcPath):
            os.mkdir(arcPath)

         archiveFile = os.path.dirname(self.dataFile) + "/" + "archive.js"
         if not os.path.exists(archiveFile):
            f = open(archiveFile, "w")
            f.write("var archive = [];\n")

         #move the file to a unique name/number in archive
         index = 1
         proposedPath = arcPath + "/" + os.path.basename(self.dataFile)+str(index)
         while os.path.exists(proposedPath):
            index = index +1            
            proposedPath = arcPath + "/" + os.path.basename(self.dataFile)+str(index)

         #TODO Need more metadata from the old file
         tmp = open(self.dataFile, "r")
         data = ""
         firstDate = datetime.now()
         for x in tmp:
            if len(x)>9:
               tmp2 = x[-7:-1]+x[:10]
               if tmp2=="']=[];testRuns['":
                  #this finds the lines where each testRun is defined.
                  last = x.index("'",10)
                  name = x[10:last]
                  parts = name.split("~")
                  #Sample time 2022-10-12 14:13:05.588537
                  newdate = datetime.strptime(parts[1],'%Y-%m-%d %H:%M:%S.%f')
                  if firstDate > newdate:
                     firstDate = newdate
                  data = data + parts[0]+" "
         tmp.close()

         timeStr = firstDate.strftime("%y/%m/%d - (%H:%M:%S)") #formatted this way for sortability

         f = open(archiveFile, "a")
         f.write("archive.push(['"+proposedPath+"','"+data+"','"+timeStr+"']);\n")
         shutil.move(self.dataFile, proposedPath)

      #delete any remaining file
      deleteFile(self.dataFile)

      #create the default starting file
      f = open(self.dataFile, "w")
      f.write("var testRuns = {};\n")
      f.write("var reportStructure = {};\n")
      f.write("var testStructure = {};\n")
      f.close()

   @keyword(name='Create Test Case')
   def CreateTestCase (self, testName):
      '''
      Part of *Test Setup*\n
      Create Test Case is called at the start of each test case and generates a new
      row in the test report.
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Create Test Case' before 'Configure Data Path'")

      f = open(self.dataFile, "a")
      self.testCaseStart = datetime.now()
      testTime = str(self.testCaseStart)
      self.currentTestName = testName+"~"+testTime
      f.write("testRuns['"+self.currentTestName+"']=[];\n")
      f.close()
      return testName+" "+testTime

   ######################################
   ##           Comparisons            ##
   ######################################
   @keyword(name='PASS Token')
   def PassToken(self):
      '''
      Part of *Comparisons*\n
      Generates the PASS value for various test functions.
      '''
      return self.PASS_TOKEN

   @keyword(name='FAIL Token')
   def FailToken(self):
      '''
      Part of *Comparisons*\n
      Generates the FAIL value for various test functions.
      '''
      return self.FAIL_TOKEN

   @keyword(name='Result True')
   def ResultTrue(self, case, passCase=True):
      '''
      Part of *Comparisons*\n
      Evaluates the Boolean value of the (potentially complicated)
      case. In the normal use case, PASS for case==True.\n\n
      
      Change _passCase_ to PASS for case==False.
      '''
      if bool(case) == passCase:
         testStatus = "PASS"
      else:
         testStatus = "FAIL"
      return testStatus
   
   @keyword(name='Compare Results')
   def CompareResulsts(self, actual, expected, equal=True):
      '''
      Part of *Comparisons*\n
      Evaluates the identity of _actual_ and _expected_. The normal use case
      PASSes if they match.\n\n

      Use _equal_ to PASS when they do *NOT* match.
      '''
      if (actual == expected):
         if bool(equal):
            testStatus = "PASS"
         else:
            testStatus = "FAIL"
      else:
         if bool(equal):
            testStatus = "FAIL"
         else:
            testStatus = "PASS"
      return testStatus

   @keyword(name='Compare Limited Text')
   def KW_OQE_compareLimitedText(self, actual, expected):
      '''
      Part of *Comparisons*\n
      Evaluates the identity of _actual_ and _expected_ as strings.
      That comparison is _*limited*_ in that _actual_ may be longer
      than _expected_. The match need only consist of the few characters.
      The distinction allows the standard portion of a string to match
      without acknowledging the details that follow.\n\n

      Ex.   *Know*ledge vs *Know* - matches\n
      Ex.   *Found target* 12345 vs *Found target& - matches
      '''
      temp = actual
      if len(actual) > len(expected):
         temp = actual[0:len(expected)]
      if temp == expected:
         testStatus = "PASS"
      else:
         testStatus = "FAIL"
      return testStatus

   @keyword(name='Compare To Range')
   def KW_OQE_compareToRange(self, actual, expected, percentError):
      '''
      Part of *Comparisons*\n
      Evaluates the identity of _actual_ and _expected_. The value
      _actual_ must fall into a range of _expected_ +/- _percentError.\n\n

      Ex.    93 and 99 +/- 2% - Not a match\n
      Ex.    93 and 95 +/- 3% - Matches
      '''
      low = expected*(100-percentError)/100
      high = expected*(100+percentError)/100

      if low<=actual<=high:
         testStatus = "PASS"
      else:
         testStatus = "FAIL"
      return testStatus
   ######################################
   ##       Assertion Functions        ##
   ######################################     

   @keyword(name='Write Results')
   def KW_OQE_writeResultToFile(self, caseName, stepName, testStatus, details):
      '''
      Part of *Output Functions*\n
      Most basic of report outputs, this generates a single row of the report showing 
      the case test
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Write Results' before 'Configure Data Path'")

      tmp = self.testCaseStart
      caseName = caseName.replace('\n', '_')
      stepName = stepName.replace('\n', '_')
      self.testCaseStart = datetime.now()
      deltaTime = str(self.testCaseStart - tmp)
      details = details.replace("'", "**")
      details = details.replace("\n", "_")
      f = open(self.dataFile, "a")
      f.write("testRuns['"+self.currentTestName+"'].push({Case: '"+caseName+"', Step: '"+stepName+"', Time: '"+deltaTime+"', Status: '"+testStatus+"', Details: '"+details+"'});\n")
      f.close()

   @keyword(name='Write Image')
   def KW_OQE_writeImageToFile(self, testCaseName, testStepName, testStatus, file):
      '''
      Part of *Output Functions*\n
      The function takes in an image file location and pushes a single line in the report.
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Write Image' before 'Configure Data Path'")

      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      testStepName = testStepName.replace('\n', '_')
      testCaseName = testCaseName.replace('\n', '_')
      deltaTime = str(self.testCaseStart - tmp)
      f = open(self.dataFile, "a")
      f.write("testRuns['"+self.currentTestName+"'].push({Case: '"+testCaseName+"', Step: '"+testStepName+"', Time: '"+deltaTime+"', Status: '"+testStatus+"', Details: '"+file+"'});\n")
      f.close()

   @keyword(name='Write Data')
   def KW_OQE_writeDaxtaToFile(self, testCaseName, testStepName, testStatus, data):
      '''
      Part of *Output Functions*\n
      The function takes in a set of data-as-text and pushes a single line in the report.
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Write Data' before 'Configure Data Path'")

      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      deltaTime = str(self.testCaseStart - tmp)
      f = open(self.dataFile, "a")
      f.write("testRuns['"+self.currentTestName+"'].push({Case: '"+testCaseName+"', Step: '"+testStepName+"', Time: '"+deltaTime+"', Status: '"+testStatus+"', Details: '"+data+"'});\n")
      f.close()

   @keyword(name='Mark Time')
   def markTime(self, name):
      '''
      Part of *Time Functions*\n
      Mark time is the start of a timeclock which tracks a specific function.
      The _name_ parameter must be unique to the measured value and must be
      identical in the _Mark Time_ and _Time Done_ keywords.\n
      Throws an error if the _name_ is already in use.
      '''
      if name in self.timeMark:
         raise Exception("Processing error: time marked twice for "+name)
      self.timeMark[name] = datetime.now()

   @keyword(name='Time Done')
   def endTime(self, name):
      '''
      Part of *Time Functions*\n
      Time Done is the end of a timeclock which tracks a specific function.
      The _name_ parameter must be unique to the measured value and must be
      identical in the _Mark Time_ and _Time Done_ keywords.\n
      Throws an error if the _name_ has not already been marked.
      '''
      if not name in self.timeMark:
         raise Exception("Processing error: time not marked for "+name)
      temp = (datetime.now() - self.timeMark[name]).total_seconds() * 1000
      del self.timeMark[name]
      return temp

   @keyword(name='Reset Time')
   def resetTime(self):
      '''
      Part of *Time Functions*\n
      At the end of a test (or in another opportune moment), the _Reset Time_ 
      keyword eliminates any lingering time recording. After _Reset Time_
      all _name_ values are eligible.
      '''
      self.timeMark = {}

   @keyword(name='Add Suite Structure')
   def newStructure(self, type, title, xaxis, yaxis, series, modes):
      '''
      Part of *Suite Chart Functions*\n
      Defines the details of a new chart item.\n\n
      _type_: Select one {Line, VBar, HBar, Area, Pie, Scatter}\n
      _title_: Any text\n
      _xaxis_: Any text; it is suggested that units be included\n
      _yaxis_: Any text; it is suggested that units be included\n
      _series_: Any text; allows multiple data series in one chart.
      Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.\n
      _modes_: Select None or multiple of {Progressive, Multi, Stacked, Trend}
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Add Suite Structure' before 'Configure Data Path'")

      revised = title.replace(' ', '_')
      if  revised in self.dataTitles['']:
         raise Exception("Cannot create additional data structure: "+revised)
      self.dataTitles[''].append(revised)
      f = open(self.dataFile, "a")
      f.write("reportStructure['VAR_"+str(revised)+"'] = {};\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['type']='"+str(type)+"';\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['x-axis']='"+str(xaxis)+"';\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['y-axis']='"+str(yaxis)+"';\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['series']='"+str(series)+"';\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['x-data']= [];\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['y-data']= [];\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['modes']= [")
      setModes = modes.split('_')
      for mode in setModes:
         f.write("'"+mode+"', ")
      f.write("];\n")
      f.close()
 
   @keyword(name='Structured Suite Data')
   def structuredData(self, title, data, label):
      '''
      Part of *Suite Chart Functions*\n
      Incrememntally addes data to a specific chart by title. This manages the
      Suite, scalar, and multi-dataset charts.\n\n
      _data_: y-value\n
      _label_: x-value
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Structured Suite Data' before 'Configure Data Path'")

      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles['']:
         raise Exception("Cannot add data to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("reportStructure['VAR_"+str(revised)+"']['y-data'].push("+str(data)+");\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['x-data'].push('"+str(label)+"');\n")
      f.close()

   @keyword(name='Set Suite Color Scheme')
   def setSuiteColorScheme(self, title, colors):
      '''
      Part of *Suite Chart Functions*\n
      By default, all charts use the same rainbow color scheme, but the user may
      define a series of RGB color sets for each chart by title. This manages the
      Suite, scalar, and multi-dataset charts.\n\n
      Ex. 'rgb(164,100,174)'  Each numerical value on interval [0,255]
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Set Suite Color Scheme' before 'Configure Data Path'")

      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles['']:
         raise Exception("7Cannot add color scheme to unknown data structure: "+revised)
      tmp = ""
      for color in colors:
         tmp = tmp+"'"+color+"', "

      f = open(self.dataFile, "a")
      f.write("reportStructure['VAR_"+str(revised)+"']['colorScheme']=["+tmp+"];\n")
      f.close()

   @keyword(name='Set Suite Color Group')
   def setSuiteColorGroup(self, title, group):
      '''
      Part of *Suite Chart Functions*\n
      By default, all charts use the same rainbow color scheme, but the user may
      select one of several pre-defined color scheme by title. This manages the
      Suite, scalar, and multi-dataset charts.\n\n
      Ex. 1  Shades of Yellow
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Set Suite Color Group' before 'Configure Data Path'")

      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles['']:
         raise Exception("Cannot add color group to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("reportStructure['VAR_"+str(revised)+"']['group']="+str(group)+";\n")
      f.close()

   @keyword(name='Add Test Structure')
   def newTestStructure(self, test, type, title, xaxis, yaxis, series, modes):
      '''
      Part of *Test Chart Functions*\n
      Defines the details of a new chart item for a specific test.\n\n
      _test_: Full test name derived from _New Test Event_\n
      _type_: Select one {Line, VBar, HBar, Area, Pie, Scatter}\n
      _title_: Any text\n
      _xaxis_: Any text; it is suggested that units be included\n
      _yaxis_: Any text; it is suggested that units be included\n
      _series_: Any text; allows multiple data series in one chart.
      Each title must be enumerated as in MyTitle-0, MyTitle-1, etc.\n
      _modes_: Select None or multiple of {Progressive, Multi, Stacked, Trend}
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Add Test Structure' before 'Configure Data Path'")

      if  test not in self.dataTitles.keys():
          self.dataTitles[test] = []
          f = open(self.dataFile, "a")
          f.write("testStructure['"+test+"'] = {};\n")
          f.close()
      revised = title.replace(' ', '_')
      if  revised in self.dataTitles[test]:
         raise Exception("Cannot create additional data structure: "+revised)
      self.dataTitles[test].append(revised)
      f = open(self.dataFile, "a")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"'] = {};\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['type']='"+str(type)+"';\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['x-axis']='"+str(xaxis)+"';\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['y-axis']='"+str(yaxis)+"';\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['series']='"+str(series)+"';\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['x-data']= [];\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['y-data']= [];\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['modes']= [")
      setModes = modes.split('_')
      for mode in setModes:
         f.write("'"+mode+"', ")
      f.write("];\n")
      f.close()
 
   @keyword(name='Structured Test Data')
   def structuredTestData(self, test, title, data, label):
      '''
      Part of *Test Chart Functions*\n
      Incrememntally addes data to a specific chart by test and title. This manages the
      Suite, scalar, and multi-dataset charts.\n\n
      _data_: y-value\n
      _label_: x-value

      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Structured Test Data' before 'Configure Data Path'")

      if  test not in self.dataTitles.keys():
         raise Exception("Cannot add data to unknown test: "+test)
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles[test]:
         raise Exception("Cannot add data to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['y-data'].push("+str(data)+");\n")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['x-data'].push('"+str(label)+"');\n")
      f.close()

   @keyword(name='Set Test Color Scheme')
   def setTestColorScheme(self, test, title, colors):
      '''
      Part of *Test Chart Functions*\n
      By default, all charts use the same rainbow color scheme, but the user may
      define a series of RGB color sets for each chart by test and title. This manages the
      Test, scalar, and multi-dataset charts.\n\n
      Ex. 'rgb(164,100,174)'  Each numerical value on interval [0,255]
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Set Test Color Scheme' before 'Configure Data Path'")

      if  test not in self.dataTitles.keys():
         raise Exception("Cannot add color scheme to unknown test: "+test)
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles[test]:
         raise Exception("Cannot add color scheme to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      tmp = ""
      for color in colors:
         tmp = tmp+"'"+color+"', "

      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['colorScheme']=["+tmp+"];\n")
      f.close()

   @keyword(name='Set Test Color Group')
   def setTestColorGroup(self, test, title, group):
      '''
      Part of *Test Chart Functions*\n
      By default, all charts use the same rainbow color scheme, but the user may
      select one of several pre-defined color scheme by test and title. This manages
      Test, and multi-dataset charts.\n\n
      Ex. 1  Shades of Yellow
      '''
      if self.dataFile==None:
         raise FileNotFoundError("Called 'Set Test Color Group' before 'Configure Data Path'")

      if  test not in self.dataTitles.keys():
         raise Exception("Cannot add color group to unknown test: "+test)
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles[test]:
         raise Exception("Cannot add color group to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['group']="+str(group)+";\n")
      f.close()