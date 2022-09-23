from imageLibrary import imageLibrary
from filemaker import *
from pathlib import Path
from py4j.java_gateway import JavaGateway
gateway = JavaGateway()# connect to the JVM

minimumMatch = 0.97

class sikuliLibrary(imageLibrary):
   ROBOT_LIBRARY_SCOPE = 'SUITE'

   def read3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")

      reader = gateway.entry_point.createReader()
      return reader.readText(self.foundElement)

   def click3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")
      self.foundElement.click()

   def dclick3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")
      self.foundElement.doubleClick()

   def write3(self, text):
      if self.foundElement == None:
         raise Exception("Element was not found")
      self.foundElement.type(text)

   def move3(self, endX, endY):
      if self.foundElement == None:
         raise Exception("Element was not found")
      location = gateway.entry_point.createLocation( int(endX), int(endY))
      screen = gateway.entry_point.getScreen(0)
      screen.dragDrop(self.foundElement, location);

   def picture(self, path, thing, name=None):
      screen = gateway.entry_point.getScreen()
      image = screen.capture(thing)
      tmp = image.getFile(path)
      next = nextFile(path, name)
      moveFile(tmp, next)
      return next

   def findElement(self, description):
      path = Path(description)      
      if path.is_file() and os.path.exists(description):
         pattern = gateway.entry_point.createPattern(description)
         screen = gateway.entry_point.getScreen(0)
         temp = screen.find(pattern);
         if temp.getScore >= minimumMatch:
            self.foundElement = temp
            return True
      return False

   def findElementFromPoint(self, x, y, w, h):
      self.foundElement = gateway.entry_point.createRegion(int(x), int(y), int(w), int(h))

   def __init__(self, dataPath):
      imageLibrary.__init__(self, dataPath)