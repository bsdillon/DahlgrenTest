from robot.api.deco import keyword
from yeti.window import Window
from yeti.anchor import Anchor
from yeti.button import Button
from yeti.textentry import TextEntry

class Calculator_1(Window):
   ROBOT_LIBRARY_SCOPE = 'SUITE'
   ROBOT_AUTO_KEYWORDS = False

   def __init__(self):
      x=3
      y=4
      w=524
      h=385

      focused=[]
      unfocused=[]
      self.widgets={}
      self.anchors={}

      #Add all anchors in window
      tmp = TitleBar('calculatorTitle.png', -5, -4, 0, 0)
      self.anchors['title']=tmp
      self.widgets['title']=tmp
      focused.append(tmp)

      super(Calculator_1, self).__init__('Calculator_1 Window', [x,y,w,h], focused, unfocused)

      #Add all widgets to window
      tmp = Button(self, '7_button', (3, 310, 94, 51))
      self.widgets['7_button']=tmp
      tmp = Button(self, '8_button', (100, 310, 94, 53))
      self.widgets['8_button']=tmp
      tmp = Button(self, '9_button', (195, 308, 94, 52))
      self.widgets['9_button']=tmp
      tmp = Button(self, '4_button', (5, 366, 94, 52))
      self.widgets['4_button']=tmp
      tmp = Button(self, '5_button', (98, 363, 94, 53))
      self.widgets['5_button']=tmp
      tmp = Button(self, '6_button', (196, 364, 93, 52))
      self.widgets['6_button']=tmp
      tmp = Button(self, '1_button', (5, 419, 94, 53))
      self.widgets['1_button']=tmp
      tmp = Button(self, '2_button', (99, 418, 94, 52))
      self.widgets['2_button']=tmp
      tmp = Button(self, '3_button', (193, 418, 93, 52))
      self.widgets['3_button']=tmp
      tmp = Button(self, '0_button', (101, 470, 92, 54))
      self.widgets['0_button']=tmp
      tmp = Button(self, 'times', (290, 309, 94, 52))
      self.widgets['times']=tmp
      tmp = Button(self, 'divide', (290, 254, 94, 54))
      self.widgets['divide']=tmp
      tmp = Button(self, 'subtract', (290, 363, 95, 52))
      self.widgets['subtract']=tmp
      tmp = Button(self, 'add', (289, 416, 95, 54))
      self.widgets['add']=tmp
      tmp = Button(self, 'equals', (291, 471, 93, 53))
      self.widgets['equals']=tmp
      tmp = Button(self, 'clear', (194, 200, 94, 53))
      self.widgets['clear']=tmp
      tmp = Button(self, 'decimal', (194, 471, 96, 53))
      self.widgets['decimal']=tmp
      tmp = TextEntry(self, 'Output', (9, 103, 376, 53))
      self.widgets['Output']=tmp
      tmp = Button(self, 'close_button', (348, 4, 35, 26))
      self.widgets['close_button']=tmp

   @keyword(name='Get Widget Region'
   def widgetRegion(self, widget_name):
      return self.get_widget(widget_name)._region()


   @keyword(name='Click')
   def Click(self, widget_name):
      self.get_widget(widget_name).click()


   @keyword(name='Read')
   def Read(self, widget_name):
      self.get_widget(widget_name).get_text()


   @keyword(name='Write')
   def Write(self, widget_name, text):
      self.get_widget(widget_name).set_value(text)



