from widget import Widget

class TextField(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "TextField["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": read, write, capture, captureSmall\n"

    def typeEnter(self):
        pass
        
    #not used in Textfield
    def getState(self):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError
