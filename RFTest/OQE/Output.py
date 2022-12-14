from robot.api.deco import keyword
from datetime import datetime
import os.path
import shutil
from filemaker import *
from datetime import *

defaultFile = './../../../RFData'

class Output:
   ROBOT_LIBRARY_SCOPE = 'SUITE'

   def __init__(self):
      self.currentTestName = "blank"
      self.timeMark = datetime.max
      self.testCaseStart = datetime.fromtimestamp(0)
      self.dataTitles = {}
      self.dataTitles[''] = []
      self.PASS_TOKEN="PASS"
      self.FAIL_TOKEN="FAIL"
      self.dataFile = None
      
   @keyword(name='Configure Data Path')
   def configureDataPath(self, primaryFile=defaultFile):
      self.dataFile = primaryFile+"/test2.js"

   @keyword(name='PASS Token')
   def getPass(self):
      return self.PASS_TOKEN

   @keyword(name='FAIL Token')
   def getFail(self):
      return self.FAIL_TOKEN

   @keyword(name='Prove it works')
   def temp(self):
      return "Output.py is connected"

   @keyword(name='Archive Any Previous Data')
   def archiveStart(self):
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
         BuiltIn().log_to_console("Searching for files in : "+ arcPath)
         proposedPath = arcPath + "/" + os.path.basename(self.dataFile)+str(index)
         BuiltIn().log_to_console("Full path is : "+ proposedPath)
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
         BuiltIn().log_to_console("New archive file: "+ proposedPath)
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

   @keyword(name='Insert Dummy Test Data')
   def dumbTest(self):
      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      deltaTime = str(self.testCaseStart - tmp)
      f = open(self.dataFile, "a")
      f.write("testRuns['Dummy Data~1970-01-01 00:00:00.000000']=[];\n")
      f.write("testRuns['Dummy Data~1970-01-01 00:00:00.000000'].push({Case: 'OQE setup validation', Step: 'Validation', Time: '"+deltaTime+"', Status: 'Pass', Details: 'Actual: Everying worked, Expected: Everything worked'});\n")
      f.close()

   def nextFile(path, suggestion=None, extension="PNG"):
      #default image name
      if suggestion == None:
         suggestion = "image"

      #some sanitization of the suggestion
      suggestion = safeFileName(suggestion)

      arcPath = os.path.dirname(path)
      if not os.path.exists(arcPath):
         os.mkdir(arcPath)

      index = 0;
      proposedPath = arcPath+os.path.sep+suggestion+"."+extension
      while os.path.exists(proposedPath):
         tag = letters[int(index/100)]+letters[int(index/10)%10]+letters[index%10]
         proposedPath = arcPath+os.path.sep+suggestion+tag+"."+extension
         index = index +1
      return proposedPath

   @keyword(name='Test Case Start Time')
   def getTime(self):
      self.testCaseStart = datetime.now()
      return str(self.testCaseStart)

   @keyword(name='Create Test Case')
   def WriteNewTestCase (self, testName, testTime):
      f = open(self.dataFile, "a")
      self.currentTestName = testName+"~"+testTime
      f.write("testRuns['"+self.currentTestName+"']=[];\n")
      f.close()

   ######################################
   ##       Assertion Functions        ##
   ######################################
   @keyword(name='Result True')
   def KW_OQE_compareBoolean(self, case, passCase=True):
      if bool(case) == passCase:
         testStatus = "PASS"
      else:
         testStatus = "FAIL"
      return testStatus
   
   @keyword(name='Compare Results')
   def KW_OQE_compareTestResults(self, actual, expected, equal=True):
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
      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      testStepName = testStepName.replace('\n', '_')
      testCaseName = testCaseName.replace('\n', '_')
      deltaTime = str(self.testCaseStart - tmp)
      f = open(self.dataFile, "a")
      f.write("testRuns['"+self.currentTestName+"'].push({Case: '"+testCaseName+"', Step: '"+testStepName+"', Time: '"+deltaTime+"', Status: '"+testStatus+"', Details: '"+file+"'});\n")
      f.close()

   @keyword(name='Write Data')
   def KW_OQE_writeDataToFile(self, testCaseName, testStepName, testStatus, data):
      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      deltaTime = str(self.testCaseStart - tmp)
      f = open(self.dataFile, "a")
      f.write("testRuns['"+self.currentTestName+"'].push({Case: '"+testCaseName+"', Step: '"+testStepName+"', Time: '"+deltaTime+"', Status: '"+testStatus+"', Details: '"+data+"'});\n")
      f.close()

   @keyword(name='Mark Time')
   def markTime(self):
      if self.timeMark!=datetime.max:
         raise Exception("Processing error: time marked twice")
      self.timeMark = datetime.now()

   @keyword(name='Time Done')
   def endTime(self):
      if self.timeMark==datetime.max:
         raise Exception("Processing error: time not marked")
      temp = (datetime.now() - self.timeMark).total_seconds() * 1000
      self.timeMark = datetime.max
      return temp

   @keyword(name='Reset Time')
   def resetTime(self):
      if self.timeMark==datetime.max:
         return
      self.time = datetime.max

   @keyword(name='Add Suite Structure')
   def newStructure(self, type, title, xaxis, yaxis, series, modes):
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
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles['']:
         raise Exception("Cannot add data to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("reportStructure['VAR_"+str(revised)+"']['y-data'].push("+str(data)+");\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['x-data'].push('"+str(label)+"');\n")
      f.close()

   @keyword(name='Set Suite Color Scheme')
   def setSuiteColorScheme(self, title, colors):
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
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles['']:
         raise Exception("Cannot add color group to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("reportStructure['VAR_"+str(revised)+"']['group']="+str(group)+";\n")
      f.close()

   @keyword(name='Add Test Structure')
   def newTestStructure(self, test, type, title, xaxis, yaxis, series, modes):
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
      if  test not in self.dataTitles.keys():
         raise Exception("4Cannot add color scheme to unknown test: "+test)
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles[test]:
         raise Exception("3Cannot add color scheme to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      tmp = ""
      for color in colors:
         tmp = tmp+"'"+color+"', "

      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['colorScheme']=["+tmp+"];\n")
      f.close()

   @keyword(name='Set Test Color Group')
   def setTestColorGroup(self, test, title, group):
      if  test not in self.dataTitles.keys():
         raise Exception("2Cannot add color group to unknown test: "+test)
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles[test]:
         raise Exception("1Cannot add color group to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("testStructure['"+test+"']['VAR_"+str(revised)+"']['group']="+str(group)+";\n")
      f.close()