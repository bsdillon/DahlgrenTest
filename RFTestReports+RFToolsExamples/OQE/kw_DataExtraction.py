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
      self.testCaseStart = datetime.fromtimestamp(0)

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
