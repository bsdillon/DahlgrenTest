from robot.api.deco import keyword
import imagelibrary
import filemaker
import os
from pathlib import Path
from py4j.java_gateway import JavaGateway
gateway = JavaGateway()#connect to JVM
import textreader

MINIMUM_MATCH_PERCENT = 0.97
SOME_FIND = 0.2

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

      #get focus on the element
      self.foundElement.click()
      # CTRL + A to select any existing text
      self.foundElement.type(None, "a", 2)
      # (over)write the text
      self.foundElement.type(text)

   def move3(self, endX, endY):
      if self.foundElement == None:
         raise Exception("Element was not found")
      screen = self.getScreen()
      location = screen.newLocation(int(endX), int(endY))
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

      p = gateway.entry_point.createPattern(targetImage)
      temp = self.foundElement.exists(p)

      screen = self.getScreen()
      if not gateway.entry_point.checkAndSetRemote(screen, temp, self.remote):
         raise ValueError("Remotes don't match")

      if temp!=None and temp.getScore() >= MINIMUM_MATCH_PERCENT:
         self.foundElement = temp
         t = temp.getTarget()
         return (int(t.getX()),int(t.getY()))

      return (-1, -1)

   def picture(self, path, thing, name=None):
      screen = self.getScreen()
      image = screen.capture(thing)

      if not gateway.entry_point.checkAndSetRemote(screen, image, self.remote):
         raise ValueError("Remotes don't match")
      tmp = image.getFilename()
      next = filemaker.nextFile(path, name)
      filemaker.moveFile(tmp, next)
      return next

   def findElement(self, description):
      #path = Path(os.path.join(".", description))
      if os.path.exists(description):
         screen = self.getScreen()
         pattern = gateway.entry_point.createPattern(description)
         try:
            temp = screen.find(pattern)
            score = temp.getScore()
            if score >= MINIMUM_MATCH_PERCENT:
               self.foundElement = temp
               t = temp.getTarget()
               return (int(t.getX()),int(t.getY()))
         except:
            pass
      return (-1,-1)

   def findElementFromPoint(self, x, y, w, h):
      screen = self.getScreen()
      self.foundElement = screen.newRegion(int(x), int(y), int(w), int(h))

      if not gateway.entry_point.checkAndSetRemote(screen, self.foundElement, self.remote):
         raise ValueError("Remotes don't match for find element")

   def __init__(self):
      imagelibrary.imagelibrary.__init__(self)
      import random
      self.myID = random.randint(1, 1000)

      gateway.entry_point.addImagePath(os.getcwd(), self.myID)
      self.remote = "Unconfigured"
      self.ip = None
      self.port = None
      self.password = None

   @keyword(name="Configure Sikuli")
   def configureSikuli(self, vncConnection):
      '''
      Part of *Test Configuration*\n\n
      Sets up the sikuli screen details. FOR RIGHT NOW, it is setup
      once for the whole event.\n\n
      vncConnection should have EITHER:\n
      * "None" (local test and default)
      * "ip;port"
      * "ip;port;somepassword"
      '''
      self.remote = vncConnection != "None"
      if self.remote:
         parts = vncConnection.split(';')
         ipParts = parts[0].split('.')
         if len(ipParts)!=4:
            raise SyntaxError("IP not formatted correct: 4 octets "+vncConnection)

         for n in ipParts:
            try:
              tmp = int(n)
            except Exception:
               raise SyntaxError("IP not formatted correct: Integer required")

            if tmp<0 or tmp>255:
               raise SyntaxError("IP not formatted correct: range [0-255]")

         self.ip = parts[0]

         try:
            tmp = int(parts[1])
         except Exception:
            raise SyntaxError("Port not formatted correct: Integer required")

         if tmp<255 or tmp>65535:
            raise SyntaxError("Port not formatted correct: range [255-65535]")
         self.port = tmp

         if len(parts)==3:
            self.password = parts[2]

   def getScreen(self):
      #from robot.libraries.BuiltIn import BuiltIn
      #BuiltIn().log_to_console("Seeking screen with id: "+str(self.myID))
      #BuiltIn().log_to_console("    remote: "+str(self.remote))
      #BuiltIn().log_to_console("    password: "+str(self.password))
      #BuiltIn().log_to_console("    ip: "+str(self.ip))
      #BuiltIn().log_to_console("    port: "+str(self.port))

      if self.remote == "Unconfigured":
         raise Exception("Remote/local has not been configured")

      if self.remote:
         if self.password == None:
            return gateway.entry_point.getScreen(self.ip, self.port)

         return gateway.entry_point.getScreen(self.ip, self.port, self.password)

      return gateway.entry_point.getScreen()
