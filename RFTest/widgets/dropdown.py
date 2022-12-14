from widgets.widget import Widget

class DropDown(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self, imageLibrary)
        self.name = "DropDown["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": read, click, doubleClick, capture, captureSmall, write\n"

    def move(self, *_):
        raise NotImplementedError

    def find(self):
        raise NotImplementedError

    def setGroup(self, _):
        raise NotImplementedError
