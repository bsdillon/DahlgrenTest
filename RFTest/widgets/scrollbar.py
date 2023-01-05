from widgets.widget import Widget

class ScrollType:
    HORIZ = "Horizontal"
    VERT = "Vertical"

class ScrollDirection:
    UP = "Up"
    DOWN = "Down"
    LEFT = "Left"
    RIGHT = "Right"

class ScrollBar(Widget):
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self, name:str, imageLibrary):
        Widget.__init__(self)
        self.configureWidget(imageLibrary)
        self.name = "ScrollBar["+name+"]"
    
    def setLocation(self, x, y, w, h):
        Widget.setLocation(self, x, y, w, h)
        if w > h:
            self.orientation = ScrollType.HORIZ
        else:
            self.orientation = ScrollType.VERT

    def LogAll(self):
        if self.orientation == ScrollType.HORIZ:
            return "\t"+self.name+": moveLeft, moveRight\n"
        
        #vertical
        return "\t"+self.name+": moveUp, moveDown\n"

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

    def read(self):
        raise NotImplementedError

    def capture(self, _):
        raise NotImplementedError

    def captureSmall(self, *_):
        raise NotImplementedError

    def move(self, *_):
        raise NotImplementedError

    def click(self):
        raise NotImplementedError

    def doubleClick(self):
        raise NotImplementedError

    def write(self, _):
        raise NotImplementedError

    def find(self):
        raise NotImplementedError

    def setGroup(self, _):
        raise NotImplementedError

    def getState(self):
        raise NotImplementedError
