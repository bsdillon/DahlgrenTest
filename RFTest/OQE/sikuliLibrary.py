

import imagelibrary
#from il import imagelibrary, MouseButtons
import filemaker
import os
from pathlib import Path
from py4j.java_gateway import JavaGateway
gateway = JavaGateway()#connect to JVM
import textreader

MINIMUM_MATCH_PERCENT = 0.97

class sikulilibrary(imagelibrary.imagelibrary):
   ROBOT_LIBRARY_SCOPE = 'SUITE'
   ROBOT_AUTO_KEYWORDS = False

   def read3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")

      a = self.foundElement
      file = self.capture2(a.getX(), a.getY(), a.getW(), a.getH())
      output = textreader().getText(file, deleteAfter=False)
      return output

   def highlightElement3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")
      self.foundElement.highlight(.25)

   def click3(self, button):
      if self.foundElement == None:
         raise Exception("Element was not found")
      
      if button==imagelibrary.MouseButtons.LEFT:
         self.foundElement.click()
      elif button==imagelibrary.MouseButtons.RIGHT:
         self.foundElement.rightClick()
      else:
         raise NotImplemented("Sikuli does not implement mouse button#"+str(button))

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
      screen.dragDrop(self.foundElement, location)

   def searchRegion3(self, targetImage):
      '''
      Searches the region from self.foundElement for
      the image indicated by the given file. Returns 
      (x,y) location of target OR (-1,-1)
      targetImage: Absolute file path for desired image.
      '''
      if self.foundElement == None:
         raise Exception("Element was not found")

      temp = gateway.entry_point.findImage(self.foundElement, targetImage)

      if temp!=None and temp.getScore() >= MINIMUM_MATCH_PERCENT:
         self.foundElement = temp
         t = temp.getTarget()
         return (int(t.getX()),int(t.getY()))

      return (-1, -1)

   def picture(self, path, thing, name=None):
      screen = gateway.entry_point.getScreen()
      image = screen.capture(thing)
      tmp = image.getFilename()
      next = filemaker.nextFile(path, name)
      filemaker.moveFile(tmp, next)
      return next

   def findElement(self, description):
      path = Path(os.path.join(".", description))
      if path.is_file() and os.path.exists(description):
         pattern = gateway.entry_point.createPattern(description)
         screen = gateway.entry_point.getScreen(0)
         temp = screen.find(pattern)
         if temp.getScore() >= MINIMUM_MATCH_PERCENT:
            self.foundElement = temp
            t = temp.getTarget()
            return (int(t.getX()),int(t.getY()))

      raise ValueError("Cannot find widget")                

   def findElementFromPoint(self, x, y, w, h):
      self.foundElement = gateway.entry_point.createRegion(int(x), int(y), int(w), int(h))

   def __init__(self):
      imagelibrary.imagelibrary.__init__(self)
      import random
      self.myID = random.randint(1, 1000)
      # try:
      #    a = 0
      #    b = 1/a
      # except Exception as err:
      #    import traceback
      #    BuiltIn().log_to_console("Error for "+str(self.myID))
      #    BuiltIn().log_to_console(str(traceback.format_exception(type(err), err, err.__traceback__)))
      #    BuiltIn().log_to_console("\n\n\n\n")

      gateway.entry_point.addImagePath(os.getcwd(), self.myID)