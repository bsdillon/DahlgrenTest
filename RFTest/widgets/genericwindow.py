from robot.api.deco import keyword
from OQE.imageLibrary import MouseButtons
from widgets.window import Window
from widgets.widget import TestType

class genericwindow(Window):
    ROBOT_LIBRARY_SCOPE = 'SUITE'
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, type, configPath, dataPath):
        testType = None
        if type == "Sikuli":
            testType = TestType.Sikuli
        elif type == "Selenium":
            testType = TestType.Selenium

        Window.__init__(self, testType, configPath, dataPath)

    @keyword(name="Capture Image")
    def captureImage(self, widget_name):
        return self.getWidget(widget_name).capture()

    @keyword(name='Click')
    def Click(self, widget_name):
        self.getWidget(widget_name).click()

    @keyword(name='Right Click')
    def RightClick(self, widget_name):
        self.getWidget(widget_name).click(button=MouseButtons.RIGHT)

    @keyword(name='Read')
    def Read(self, widget_name):
        return self.getWidget(widget_name).read()

    @keyword(name='Write')
    def Write(self, widget_name, text):
        self.getWidget(widget_name).write(text)
