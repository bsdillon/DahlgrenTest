from widget import Widget

class RadioButton(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, properties):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "RadioButton["+name+"]"
        self.generateCheckedImages(path)
        if properties["Checked"]:
            self.checkedImage = properties["Checked"]
        else:
            raise LookupError("No checked image for "+str(self))

        if properties["Unchecked"]:
            self.uncheckedImage = properties["Unchecked"]
        else:
            raise LookupError("No unchecked image for "+str(self))

        if properties["Value"]:
            self.value = properties["Value"]
        else:
            raise LookupError("No value for "+str(self))
 
    def LogAll(self):
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall, getState\n"

    #not used in Radiobutton
    def getState(self):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError
