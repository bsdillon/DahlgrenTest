from robot.api.deco import keyword
import imagelibrary
from window import Window
from widget import TestType

class genericwindow(Window):
    '''
    Testing testing
    '''
    ROBOT_LIBRARY_SCOPE = 'SUITE'
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self):
        Window.__init__(self)
        pass

    @keyword(name="Configure")
    def configure(self, type, configPath, dataPath, remoteConnection="None"):
        '''
        Sets up the details of the generic window for a specific test\n\n
        type - One of {Sikuli, Selenium}\n\n
        configPath - absolute path to the configuration file\n\n
        dataPath - absolute path to the data folder
        remoteConnection - 
        '''
        testType = None
        if type == "Sikuli":
            testType = TestType.Sikuli
        elif type == "Selenium":
            testType = TestType.Selenium

        self.configureWindow(testType, configPath, dataPath, remoteConnection)

    @keyword(name="Capture Image")
    def captureImage(self, widget_name):
        '''
        Takes a picture of the intended widget and returns the image file\n\n
        widget_name - The unique name of the intended widget
        '''
        return self.getWidget(widget_name).capture()

    @keyword(name='Click')
    def Click(self, widget_name):
        '''
        Clicks on the intended widget\n\n
        widget_name - The unique name of the intended widget
        '''
        self.getWidget(widget_name).click()

    @keyword(name='Click At')
    def ClickAt(self, widget_name, x, y):
        '''
        Clicks on the intended widget PLUS an x,y offset.\n
        The offeset allows you to click WITHIN a widget at some location.\n\n
        widget_name - The unique name of the intended widget
        x - x offset from upper left of widget
        y - y offset from upper left of widget
        '''
        self.getWidget(widget_name).clickAt(x, y)

    @keyword(name='Right Click')
    def RightClick(self, widget_name):
        '''
        Right clicks on the intended widget\n\n
        widget_name - The unique name of the intended widget
        '''
        self.getWidget(widget_name).click(button=imagelibrary.MouseButtons.RIGHT)

    @keyword(name='Read')
    def Read(self, widget_name):
        '''
        Read and return text from the intended widget\n\n
        widget_name - The unique name of the intended widget
        '''
        return self.getWidget(widget_name).read()

    @keyword(name='Write')
    def Write(self, widget_name, text):
        '''
        Write text onto the intended widget\n\n
        widget_name - The unique name of the intended widget\n\n
        text - the text to be written
        '''
        self.getWidget(widget_name).write(text)

    @keyword(name='Highlight')
    def Highlight(self, widget_name):
        self.getWidget(widget_name).debugHighlight()

    @keyword(name='Check State')
    def CheckState(self, widget_name):
        return self.getWidget(widget_name).getState()

    @keyword(name='Scroll')
    def Scroll(self, widget_name, direction):
        self.getWidget(widget_name).scroll(direction)

    @keyword(name='Create Gif')
    def create_gif(self, widget_name, count=3, rate_ms=200):
        return self.getWidget(widget_name).captureSmall(count, rate_ms)

    @keyword(name="Start Watcher For")
    def start_watcher(self, widget_name, name):
        self.getWidget(widget_name).startWatcher(name)

    @keyword(name="Stop Watcher For")
    def stop_watcher(self, name):
        return self.haltWater(name)
