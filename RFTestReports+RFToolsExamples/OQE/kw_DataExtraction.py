from robot.api.deco import keyword
from datetime import datetime
import os.path
import shutil

defaultFile = "demodata.js"
defaultSecondaryFile = "secondarydata.js"

class kw_DataExtraction:

   def __init__(self, primaryFile=defaultFile, secondaryFile=defaultSecondaryFile):
      self.dataFile = primaryFile;
      self.otherFile = secondaryFile;

   @keyword(name='Prove it works')
   def temp(self):
      return "It works"

   @keyword(name='Archive Any Previous Data')
   def archiveStart(self):
      #archive existing files
      if os.path.exists(self.dataFile):
         #create the archive space
         arcPath = os.path.dirname(self.dataFile) + os.path.sep + "ARCHIVE"
         if not os.path.exists(arcPath):
            os.mkdir(arcPath)
         index = 1

         #move the file to a unique name/number in archive
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
      f = open(self.dataFile, "a")
      f.write("testRuns['1970-01-01 00:00:00.000000']=[];\n")
      f.write("testRuns['1970-01-01 00:00:00.000000'].push({Test: 'Some name of a things', Status: 'Pass', Step: 'from the  last parameter of verify and record', time: 'Start Time: 2021-10-01 01:32:33, 2021-10-01 01:32:36.100111', Details: 'Actual: Something, Expected: Else'});\n")
      f.write("testRuns['1970-01-01 00:00:00.000000'].push({Test: 'Some name of a things', Status: '', Step: 'from the  last parameter of verify and record', time: 'Start Time: 2021-10-01 01:32:33, 2021-10-01 01:32:36.100111', Details: 'Actual: , Expected: [{Thing: other, Sometheing: else, More: stuff}]'});\n")
      f.close()

   def totalTime(self, testStartTime):
      testEndTime = datetime.now()
      timeMessage = "Start time: " + str(testStartTime) + " , End Time: " + str(testEndTime)
      return timeMessage

   def detailMessage(self, actual, expected):
      message = "Actual: " + actual + " , Expected: " + expected
      return message

   def initialGuiDataBuilder(self, testCaseTime, testCaseName, testStatus, testStep, message, totalTime):
      return testCaseTime + ": [ \n {Test: '" + testCaseName + "' , Status: '" + testStatus + "' , Step: '" + testStep + "' , Time: '" + totalTime + "' , Details: '" + message + "'},"

   def guiDataBuilder(self, testCaseTime, testCaseName, testStatus, testStep, message, totalTime):
      return    "{Test: '" + testCaseName + "' , Status: '" + testStatus + "' , Step: '" + testStep + "' , Time: '" + totalTime + "' , Details: '" + message + "'},"

   def removeBrackets(self, numToDelete):
      #loop through once or twice to get rid of ], and or };
      while numToDelete > 0:
         #get list of lines in file
         currentFile = open(self.dataFile, "r")
         lines = file.readlines(currentFile)
         currentFile.close()
         #delete unneccessary ], };
         lineCount = len(lines)
         del lines[lineCount-1] #deletes last line in file
         #write to file
         updatedFile = open(self.dataFile, "w+")
         for line in lines:
            updatedFile.write(line)
         updatedFile.close()
         numToDelete -= 1

   #Needed to format/update GUI
   @keyword(name='getTime')
   def getTime(self):
      testCaseStart = dateTime.now()
      return str(testCaseStart)

   #TODO update to deal with partial matches as in "Not Good" matching on "Good"
   @keyword(name='CompareResults')
   def KW_OQE_compareTestResults(self, actual, expected):
      if ((actual == expected) or (expected in actual)):
         testStatus = "PASS"
      else:
         testStatus = "FAIL"
      return testStatus

   @keyword(name='WriteResults')
   def KW_OQE_writeResultToFile(self, testCaseTime, testCaseInstance, actual, expected, testCaseName, testStatus, testStep, testStepStartTime, details):
      #unique identifier of test case
      testCaseTime = '"' + str(testCaseTime) + '"'
      details = str(details)

      #elapsed test time
      totalTime = self.totalTime(testStepStartTime)

      #build details message --> if additional details are provided add to end of message
      if(not details):
         message = self.detailMessage(actual, expected)
      else:
         details = details.replace('\'', '') #removes the ' within the string to ensure .js data file is fomratted correctly
         message = details

      with open(self.dataFile, 'a') as file:
         if(testCaseInstance == '1'):
            self.removeBrackets(1) #need to remove };
            dataString = self.initialGuiDataBuilder(testCaseTime, testCaseName, testStatus, testStep, message, totalTime)
         else:
            self.removeBrackets(2) #need to remove ]
            dataString = self.guiDataBuilder(testCaseTime, testCaseName, testStatus, testStep, message, totalTime)

         file.write(dataString)
      #write date to self.otherFile --external file not linked to GUI display
      with open(self.otherFile, 'a') as file:
         self.KW_OQE_WriteToExternalOQEFile(testCaseTime, testCaseName, testStep, dataString)

   @keyword(name='EndOfIndividualTestCase')
   def KW_OQE_endOfIndividualTestCase(self):
      #need to include }; so the GUI updates real time
      with open(self.dataFile, 'a') as file:
         file.write("\n]," + "\n };")

   @keyword(name='WriteToExternalOQEFile')
   def KW_OQE_WriteToExternalOQEFile(self, testCaseStartTime, testCaseName, testStep, info):
      testCaseStartTime = str(testCaseStartTime)
      currentTime = str(datetime.now())
      info = str(info)

      testInFile = self.checkForTestInFile(testCaseStartTime)

      if testInFile:
         with open(self.otherFile, 'a') as file:
            file.write("\nTest Step: " + testStep + "\nSystem Time: " + currentTime + "\n" + info)
      else:
         with open(self.otherFile, 'a') as file:
            file.write("\nTest Case Start Time: " + testCaseStartTime + "\nTest Case Name: " + testCaseName + "\nTest Step: " + testStep + "\nSystem Time: " + currentTime + "\n" + info)

   def checkForTestInFile(self, testCaseStartTime):
      with open(self.otherFile) as file:
         if testCaseStartTime in file.read():
            return True
         else: 
            return False