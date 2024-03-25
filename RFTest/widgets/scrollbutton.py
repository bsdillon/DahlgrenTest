from widget import Widget

class ScrollDirection:
    NORTH = "North"
    EAST = "East"
    SOUTH = "South"
    WEST = "West"

class ScrollButton(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary, properties):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "ScrollButton["+name+"]"
        if properties["Direction"]:
            self.checkedImage = properties["Direction"]
        else:
            raise LookupError("No direction for "+str(self))

    def LogAll(self):
        #TODO fix log all
        return "\t"+self.name+": setGroup, read, click, doubleClick, capture, captureSmall, getState\n"

    def scroll(self, direction):
        if direction == ScrollDirection.UP:
            self.moveUp()
        elif direction == ScrollDirection.DOWN:
            self.moveDown()
        elif direction == ScrollDirection.LEFT:
            self.moveLeft()
        elif direction == ScrollDirection.RIGHT:
            self.moveRight()
        else:
            raise NotImplementedError("Scroll direction is invalid: "+direction)

    def moveUp(self):
        if self.orientation == ScrollType.HORIZ:
            raise NotImplementedError("Move Up is not available in "+self.name)
        tmp = (self.x,self.y,self.w,self.w)
        self.tester.click2( tmp[0], tmp[1], tmp[2], tmp[3])

    def moveDown(self):
        if self.orientation == ScrollType.HORIZ:
            raise NotImplementedError("Move Down is not available in "+self.name)
        tmp = (self.x,self.y+(self.h-self.w),self.w,self.w)
        self.tester.click2( tmp[0], tmp[1], tmp[2], tmp[3])

    def moveLeft(self):
        if self.orientation == ScrollType.VERT:
            raise NotImplementedError("Move Left is not available in "+self.name)
        tmp = (self.x,self.y,self.h,self.h)
        self.tester.click2( tmp[0], tmp[1], tmp[2], tmp[3])

    def moveRight(self):
        if self.orientation == ScrollType.VERT:
            raise NotImplementedError("Move Right is not available in "+self.name)
        tmp = (self.x+(self.w-self.h),self.y,self.h,self.h)
        self.tester.click2( tmp[0], tmp[1], tmp[2], tmp[3])

    #not used in scrollbutton
    def getState(self):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError
