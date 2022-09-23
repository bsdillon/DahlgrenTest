from PIL import Image
from imageLibrary import imageLibrary
from filemaker import *
#documentation at https://www.selenium.dev/documentation/webdriver/
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains

class seleniumLibrary(imageLibrary):
   ROBOT_LIBRARY_SCOPE = 'SUITE'

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

   def click3(self):
      if self.foundElement == None:
         raise Exception("Element was not found")
      self.foundElement.click()
      #time.sleep(2)

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
      Selenium has the ability to capture the whole screen
      """
      next = nextFile(self.imgPath, name)
      fileName = self.browser.get_screenshot_as_file(next)
      return fileName

    
   @keyword(name="Capture Screen At")
   def captureLimitedScreen(self, x, y, w, h, name:str=None):
      """
      Selenium can capture the whole screen and then limit
      the size of the file to a specific region
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
         return True
      except NoSuchElementException:
         #not writing this up
         pass
      return False

   def findElementFromPoint(self, x, y, w, h):
      midX = int(x)+(int(w)/2)
      midY = int(y)+(int(h)/2)
      script = "return document.elementFromPoint(arguments[0], arguments[1]);"
      self.foundElement = self.browser.execute_script( script, midX, midY)

   def __init__(self, dataPath, browser, site):
      imageLibrary.__init__(self, dataPath)
      self.type = browser
      if self.type == "FF":
         self.browser = webdriver.Firefox()
      elif self.type == "CH":
         self.browser = webdriver.Chrome()
      elif self.type == "MS":
         self.browser = webdriver.Edge()
      self.actionChain = ActionChains(self.browser)
      self.browser.get(site )
