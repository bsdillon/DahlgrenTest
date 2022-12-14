from OQE.imageLibrary import imageLibrary, MouseButtons
from OQE.filemaker import *
from pathlib import Path
from py4j.java_gateway import JavaGateway
gateway = JavaGateway()#connect to JVM
from OQE.textReader import textReader

minimumMatch = 0.97

class sikuliLibrary(imageLibrary):
   ROBOT_LIBRARY_SCOPE = 'SUITE'
   ROBOT_AUTO_KEYWORDS = False

   def read3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")

      a = self.foundElement
      file = self.capture2(a.getX(), a.getY(), a.getW(), a.getH())
      output = textReader().getText(file, deleteAfter=False)
      return output

   def click3(self, button):
      if self.foundElement == None:
         raise Exception("Element was not found")
      
      if button==MouseButtons.LEFT:
         self.foundElement.click()
      elif button==MouseButtons.RIGHT:
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
      screen.dragDrop(self.foundElement, location);

   def picture(self, path, thing, name=None):
      screen = gateway.entry_point.getScreen()
      image = screen.capture(thing)
      tmp = image.getFilename()
      next = nextFile(path, name)
      moveFile(tmp, next)
      return next

   def findElement(self, description):
      path = Path(os.path.join(".", description))
      if path.is_file() and os.path.exists(description):
         try:
            pattern = gateway.entry_point.createPattern(description)
            screen = gateway.entry_point.getScreen(0)
            import time
            time.sleep(10)
            temp = screen.find(pattern)
            if temp.getScore() >= minimumMatch:
               self.foundElement = temp
               t = temp.getTarget()
               return (int(t.getX()),int(t.getY()))
         except Exception as err:
            import traceback
            BuiltIn().log_to_console("Sikuli could not find "+description)
            BuiltIn().log_to_console(str(traceback.format_exception(type(err), err, err.__traceback__)))
            raise err

      return (0, 0)

   def findElementFromPoint(self, x, y, w, h):
      self.foundElement = gateway.entry_point.createRegion(int(x), int(y), int(w), int(h))

   def __init__(self):
      imageLibrary.__init__(self)
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