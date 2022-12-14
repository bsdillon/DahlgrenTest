from widgets.widget import Widget

class RadioButton(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self, imageLibrary)
        self.name = "RadioButton["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall\n"

    def write(self, _):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def find(self):
        raise NotImplementedError
