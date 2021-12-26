from robot.api.deco import keyword
from datetime import datetime
import os.path
import shutil

defaultFile = "demodata.js"
defaultSecondaryFile = "secondarydata.js"

class kw_DataExtraction:
   ROBOT_LIBRARY_SCOPE = 'SUITE'

   def __init__(self, primaryFile=defaultFile, secondaryFile=defaultSecondaryFile):
      self.dataFile = primaryFile
      self.otherFile = secondaryFile
      self.currentTestName = "blank"
      self.timeMark = datetime.max
      self.testCaseStart = datetime.fromtimestamp(0)
      self.dataTitles = []

   @keyword(name='Prove it works')
   def temp(self):
      return "kw_DataExtraction.py is connected"

   @keyword(name='Archive Any Previous Data')
   def archiveStart(self):
      #archive existing files
      if os.path.exists(self.dataFile):
         #create the archive space
         arcPath = os.path.dirname(self.dataFile) + os.path.sep + "ARCHIVE"
         if not os.path.exists(arcPath):
            os.mkdir(arcPath)

         #move the file to a unique name/number in archive
         index = 1
         proposedPath = arcPath+os.path.sep+os.path.basename(self.dataFile)+str(index)
         while os.path.exists(proposedPath):
           index = index +1
           proposedPath = arcPath+os.path.sep+os.path.basename(self.dataFile)+str(index)
         shutil.move(self.dataFile, proposedPath)

      #delete any remaining file
      if os.path.exists(self.dataFile):
         os.remove(self.dataFile)

      #create the default starting file
      f = open(self.dataFile, "w")
      f.write("var testRuns = {};\n")
      f.write("var reportStructure = {};\n")
      f.close()

   @keyword(name='Insert Dummy Test Data')
   def dumbTest(self):
      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      deltaTime = str(self.testCaseStart - tmp)
      f = open(self.dataFile, "a")
      f.write("testRuns['Dummy Data 1970-01-01 00:00:00.000000']=[];\n")
      f.write("testRuns['Dummy Data 1970-01-01 00:00:00.000000'].push({Case: 'OQE setup validation', Step: 'Validation', Time: '"+deltaTime+"', Status: 'Pass', Details: 'Actual: Everying worked, Expected: Everything worked'});\n")
      f.close()

   @keyword(name='Test Case Start Time')
   def getTime(self):
      self.testCaseStart = datetime.now()
      return str(self.testCaseStart)

   @keyword(name='Create Test Case')
   def WriteNewTestCase (self, testName):
      f = open(self.dataFile, "a")
      self.currentTestName = testName
      f.write("testRuns['"+self.currentTestName+"']=[];\n")
      f.close()

   @keyword(name='Compare Results')
   def KW_OQE_compareTestResults(self, actual, expected):
      if actual == expected:
         testStatus = "PASS"
      else:
         testStatus = "FAIL"
      return testStatus

   @keyword(name='Write Results')
   def KW_OQE_writeResultToFile(self, caseName, stepName, testStatus, details):
      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
      deltaTime = str(self.testCaseStart - tmp)
      details = details.replace("'", "**");
      f = open(self.dataFile, "a")
      f.write("testRuns['"+self.currentTestName+"'].push({Case: '"+caseName+"', Step: '"+stepName+"', Time: '"+deltaTime+"', Status: '"+testStatus+"', Details: '"+details+"'});\n")
      f.close()

   @keyword(name='Get Next Img File')
   def checkImageFileName(self, proposedName):
      #BSD we had some problems with absolute vs. relative path. Right now relative is still working
      #but this is how the absolute path could be created.
      #rootPath = os.path.join(os.path.dirname(os.path.abspath(self.dataFile)), "IMG", proposedName)
      rootPath = os.path.dirname(self.dataFile) + "/IMG/" + proposedName
      rootPath = rootPath.replace(' ', '_')
      index = 0

      proposedPath = rootPath + ".png"
      while os.path.exists(proposedPath):
         index = index + 1
         proposedPath = rootPath + str(index) + ".png"

      return proposedPath

   @keyword(name='Write Image')
   def KW_OQE_writeImageToFile(self, testCaseName, testStepName, testStatus, file):
      tmp = self.testCaseStart
      self.testCaseStart = datetime.now()
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

   @keyword(name='Add Structure')
   def newStructure(self, type, title, xaxis, yaxis, series, modes):
      revised = title.replace(' ', '_')
      if  revised in self.dataTitles:
         raise Exception("Cannot create additional data structure: "+revised)
      self.dataTitles.append(revised)
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
 
   @keyword(name='Structured Data')
   def structuredData(self, title, data, label):
      revised = title.replace(' ', '_')
      if  revised not in self.dataTitles:
         raise Exception("Cannot add data to unknown data structure: "+revised)
      f = open(self.dataFile, "a")
      f.write("reportStructure['VAR_"+str(revised)+"']['y-data'].push("+str(data)+");\n")
      f.write("reportStructure['VAR_"+str(revised)+"']['x-data'].push('"+str(label)+"');\n")
      f.close()
