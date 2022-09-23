from robot.api.deco import keyword
import os.path
import shutil

letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

def alphaCount(index):
   return letters[int(index/(26*26))]+letters[int(index/26)%26]+letters[index%26]

def nextFile(arcPath, suggestion=None, extension="PNG"):
   #default image name
   if suggestion == None:
      suggestion = "image"

   #some sanitization of the suggestion
   suggestion = safeFileName(suggestion)

   # if not os.path.exists(arcPath):
   #    print("Path does not exits: "+arcPath)
   #    os.mkdir(arcPath)
   index = 0
   proposedPath = arcPath+"/"+suggestion+"."+extension
   while os.path.exists(proposedPath):
      tag = alphaCount(index)
      # was using os.path.sep
      proposedPath = arcPath+"/"+suggestion+tag+"."+extension
      index = index +1
   return proposedPath

def safeFileName(proposedName):
   #BSD we had some problems with absolute vs. relative path. Right now relative is still working
   #but this is how the absolute path could be created.
   #rootPath = os.path.join(os.path.dirname(os.path.abspath(self.dataFile)),  "IMG", proposedName)
   proposedName = proposedName.replace('\n', '_')
   proposedName = proposedName.replace('/', '_')
   return proposedName

def moveFile(file1, file2):
   shutil.move(file1, file2)

def deleteFile(file:str) -> None:
   """
   Removes file if it exists
   :param file: the file to be removed
   :returns: None
   """
   if os.path.exists(file):
      os.remove(file)
