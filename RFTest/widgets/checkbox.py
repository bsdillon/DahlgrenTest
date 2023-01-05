from widgets.widget import Widget

class CheckBox(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, path):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "CheckBox["+name+"]"
        self.generateCheckedImages(path)

    def LogAll(self):
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall, getState\n"

    def write(self, _):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def find(self):
        raise NotImplementedError
