from robot.api.deco import keyword
from OQE.imageLibrary import MouseButtons
from widgets.window import Window
from widgets.widget import TestType

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
    def configure(self, type, configPath, dataPath):
        '''
        Sets up the details of the generic window for a specific test\n\n
        type - One of {Sikuli, Selenium}\n\n
        configPath - absolute path to the configuration file\n\n
        dataPath - absolute path to the data folder
        '''
        testType = None
        if type == "Sikuli":
            testType = TestType.Sikuli
        elif type == "Selenium":
            testType = TestType.Selenium

        self.configureWindow(testType, configPath, dataPath)

    @keyword(name="Capture Window")
    def captureWindow(self):
        '''
        Takes a picture of the window itself and returns the image file\n\n
        '''
        return self.capture()

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
    
    @keyword(name='DoubleClick')
    def DoubleClick(self, widget_name):
        '''
        Clicks on the intended widget twice\n\n
        widget_name - The unique name of the intended widget
        '''
        self.getWidget(widget_name).doubleClick()

    @keyword(name='Right Click')
    def RightClick(self, widget_name):
        '''
        Right clicks on the intended widget\n\n
        widget_name - The unique name of the intended widget
        '''
        self.getWidget(widget_name).click(button=MouseButtons.RIGHT)

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
    
    @keyword(name='Clear')
    def Clear(self, widget_name):
        '''
        Clears all text from the intended widget\n\n
        widget_name - The unique name of the intended widget
        '''
        self.getWidget(widget_name.clear())

    @keyword(name='Highlight')
    def Highlight(self, widget_name):
        self.getWidget(widget_name).debugHighlight()

    @keyword(name='Check State')
    def CheckState(self, widget_name):
        return self.getWidget(widget_name).getState()

    @keyword(name='Scroll')
    def Scroll(self, widget_name, direction):
        self.getWidget(widget_name).scroll(direction)

    @keyword(name='Move')
    def Move(self, endX, endY):
        '''
        Move the window to the desired end location
        endX - x coordinate of end location
        endY - y coordinate of end location
        '''
        if len(self.movePoints) > 0:
            tmp = self.movePoints[0]
            tmp.move(endX, endY)
            #determine offsets from widget; endX, endY is the CENTER of the anchor
            self.offset = (int(endX)-tmp.baseX-int(tmp.w/2), int(endY)-tmp.baseY-int(tmp.h/2))
            for w_name in self.widgets:
                self.widgets[w_name].newOffsets(self.offset)
        else:
            raise IndexError("No MovePoint defined for "+self.name)
