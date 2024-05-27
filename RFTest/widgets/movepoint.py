from widget import Widget

class MovePoint(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "MovePoint["+name+"]"

    def LogAll(self):
        return "\t"+self.name+": move, click, doubleClick, read, capture, captureSmall\n"

    #not used in MovePoint
    def getState(self):
        raise NotImplementedError(f"{self}.getState")

    def write(self, _):
        raise NotImplementedError(f"{self}.write")
