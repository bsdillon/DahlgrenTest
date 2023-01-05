from robot.api.deco import keyword
from PIL import Image
from OQE.imagelibrary import imagelibrary, MouseButtons
from OQE.filemaker import *
#documentation at https://www.selenium.dev/documentation/webdriver/
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains

class seleniumlibrary(imagelibrary):
   ROBOT_LIBRARY_SCOPE = 'SUITE'
   ROBOT_AUTO_KEYWORDS = False

   def read3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")

      temp = self.foundElement.get_attribute('value')
      if not temp == None:
         return temp #this is an input with a value

      temp = self.foundElement.get_attribute('textContent')
      if not temp == None:
         return temp #this is an input with a textContent

      temp = self.foundElement.get_attribute('innerHTML')
      if not temp == None:
         return temp #this is an input with innerHTML

      #TODO are there other ways to get text???
      raise Exception("No text attribute found")

   def click3(self, button):
      if self.foundElement == None:
         raise Exception("Element was not found")

      if button==MouseButtons.LEFT:
         self.foundElement.click()
      elif button==MouseButtons.RIGHT:
         self.actionChain.context_click(self.foundElement)
      else:
         raise NotImplemented("Selenium does not implement mouse button#"+str(button))


   def dclick3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")
      self.actionChain.double_click(self.foundElement)

   def write3(self, text):
      if self.foundElement == None:
         raise Exception("Element was not found")
      self.foundElement.sendKeys(text)

   def move3(self, endX, endY):
      if self.foundElement == None:
         raise Exception("Element was not found")
      tmp = self.foundElement  #save the main element
      self.findElementFromPoint(endX, endY, 5, 5) #next location
      self.actionChain.dragAndDrop(tmp, self.foundElement)

   @keyword(name="Capture Screen")
   def captureScreen(self, name:str=None):
      """
      Already documented as part of imagelibrary
      """
      next = nextFile(self.imgPath, name)
      fileName = self.browser.get_screenshot_as_file(next)
      return fileName
    
   @keyword(name="Capture Screen At")
   def captureLimitedScreen(self, x, y, w, h, name:str=None):
      """
      Already documented as part of imagelibrary
      """
      savedFile = self.captureScreen(name)
      img = Image.open(savedFile)
      revised = img.crop(x,y,x+w,y+h)
      revised.save(savedFile)
      return savedFile

   def picture(self, path, thing, name=None):
      next = nextFile(path, name)
      thing.screenshot(next)
      return next

   def findElement(self, description):
      try:
         desc = description
         if description[0:4]=="css:":
            desc = description[4:]
         temp = self.browser.find_element(By.CSS_SELECTOR, desc)
         self.foundElement = temp
         t = temp.getLocation()
         return (t.getX(), t.getY())
      except NoSuchElementException:
         #not writing this up
         pass
      return (0, 0)

   def findElementFromPoint(self, x, y, w, h):
      midX = int(x)+(int(w)/2)
      midY = int(y)+(int(h)/2)
      script = "return document.elementFromPoint(arguments[0], arguments[1]);"
      self.foundElement = self.browser.execute_script( script, midX, midY)

   def __init__(self):
      imagelibrary.__init__(self)

   @keyword(name="Configure Selenium")
   def configureSelenium(self, browser, site):
      '''
      Part of *Test Configuration*\n\n
      Sets up the browser and URL of the test in question. Opens up the
      URL in question as part of the test.\n\n
      browser - One of {FF, CH, MS} for Firefox, Chrome, or Edge.\n\n
      site - A specific URL to be accessed in the test.
      '''
      self.type = browser
      if self.type == "FF":
         self.browser = webdriver.Firefox()
      elif self.type == "CH":
         self.browser = webdriver.Chrome()
      elif self.type == "MS":
         self.browser = webdriver.Edge()
      else:
         raise NotImplemented("SeleniumLibrary: Unknown browser type '"+self.type+"'")
      self.actionChain = ActionChains(self.browser)
      self.browser.get(site)
