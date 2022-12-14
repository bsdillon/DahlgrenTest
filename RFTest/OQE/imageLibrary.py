from robot.api.deco import keyword
import time  # needed for animation of GIFs
from os import sep, remove
import subprocess
from OQE.filemaker import *
from threading import Event, Thread
import pathlib
from robot.libraries.BuiltIn import BuiltIn

class MouseButtons:
    LEFT = 1
    MIDDLE = 2
    RIGHT = 3
    SCROLL_UP = 4
    SCROLL_DOWN = 5

class imageLibrary:
    ROBOT_AUTO_KEYWORDS = False

    @keyword(name="Start Watcher at Element")
    def startWatcher(self, name:str, description:str, rateSeconds:float=1, limit:int=-1):
        '''
        A.K.A "Click Watcher at Element" under Robot Framework
        Generates a click event on this GUI element.
        :param: name - proposed name to be given to watcher
        :param: description - text identifies the element
        :param: rateSeconds - the number of seconds between images; default is 1second
        :param: limit - total number of images ot take; default -1 indicates no end
        :return: the true name used for watcher
        '''
        self.findElement(description)
        return self.startWatcher3(name, rateSeconds, limit)

    @keyword(name="Start Watcher at")
    def startWatcher2(self, name:str, x:str, y:str, w:str, h:str, rateSeconds:float=1, limit:int=-1):
        '''
        A.K.A "Start Watcher at" under Robot Framework
        Generates a click event on this GUI element.
        :param: name - proposed name to be given to watcher
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :param: rateSeconds - the number of seconds between images; default is 1second
        :param: limit - total number of images ot take; default -1 indicates no end
        :return: the true name used for watcher
        '''
        self.findElementFromPoint(x,y,w,h)
        return self.startWatcher3(name, rateSeconds, limit)

    def startWatcher3(self, name:str, rateSeconds:float, limit:int):
        """
        Creates a Watcher object and saves it in self.watchers
        as a tupple "trueName":[Watcher, runEvent].
        :param: name - proposed name for the watcher
        :param: rateSeconds - the number of seconds between images; default is 1second
        :param: limit - total number of images ot take; default -1 indicates no end
        :return: the true name (derived from proposed name) of the Watcher
        """
        if self.foundElement == None:
            raise Exception("Element was not found")

        #BSD I do not BELIEVE there is a way for RFW to create
        #multiple threads attaching to this function. If not,
        #we will need some form of synchronization on self.watchers

        #determine the real name to use for this Watcher
        baseName = safeFileName(name)
        trueName = baseName
        index=1
        while trueName in self.watchers:
            trueName = baseName+str(index)
            index = index + 1

        #an event for cross-thread communication
        runEvent = Event()
        runEvent.set()

        print("Creating Watcher "+trueName)
        #create, save, and start the thread
        w = Thread(target=self.createWatcher, args=[trueName, runEvent, self.foundElement, rateSeconds, limit])
        self.watchers[trueName]=[w,runEvent]
        w.start()
        return trueName

    def createWatcher(self, baseName, runEvent, thing, rateSeconds, limit):
        '''
        This is the threaded method for watchers
        :param: baseName - the name used for creating all images in this watcher
        :param: runEvent - used to communicat across threads
        :param: thing - whatever we are taking picutres of
        :param: rateSeconds - the number of seconds between images; default is 1second
        :param: limit - total number of images ot take; default -1 indicates no end
        '''
        count = 0
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")

        while runEvent.isSet() and (limit==-1 or count<limit):
            time.sleep(rateSeconds)
            count = count + 1
            self.picture(self.watcherPath, thing, name=baseName+alphaCount(count))

    @keyword(name="Halt All Watchers")
    def haltAllWatchers(self):
        '''
        A.K.A "Halt All Watchers" under Robot Framework
        Stops any watcher threads still running at the end of the test
        '''
        for name in self.watchers:
            w = self.watchers.pop(name)
            # the 1th item is the event for the watcher.
            w[1].clear()
            # the 0th item is the thread itself.
            if w[0].is_alive():
                w[0].join()
                print("Watcher "+name+" stopped")
        print("All Watchers stopped")

    @keyword(name="Halt Watcher")
    def haltWatcher(self, name:str):
        '''
        A.K.A "Halt Watcher" under Robot Framework
        Uses the name of the Watcher to find it, halt it, delete it from memory, and return the resulting GIF file path.
        :param: name - true name of the Watcher
        :return: the gif file created by the watcher
        '''
        answer = None
        if name in self.watchers:
            w = self.watchers.pop(name)
            # the 1th item is the event for the watcher.
            w[1].clear()
            if w[0].is_alive():
                # the 0th item is the thread itself.
                w[0].join()
            #could also limit the join time and
            #recheck if the thread is still alive; while?

            #Create the gif file
            #answer = self.convertToGIF(name=name, sourcePath=self.watcherPath, key=name+"*")
        else:
            raise RuntimeError("No Watcher found for name "+name)
        
        return answer

    @keyword(name="Get Next Img File")
    def getImageFile(self, proposed):
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")

        return nextFile(self.imgPath, proposed)

    @keyword(name="Read from Element")
    def read(self, description):
        '''
        A.K.A "Read from Element" under Robot Framework
        :param: description - text identifies the element
        :return: text found at that element
        '''
        self.findElement(description)
        return self.read3()

    @keyword(name="Read from")
    def read2(self, x, y, w, h):
        '''
        A.K.A "Read from" under Robot Framework
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :return: text found at the region
        '''
        self.findElementFromPoint(x,y,w,h)
        return self.read3()

    @keyword(name="Click at Element")
    def click(self, description, button=MouseButtons.LEFT):
        '''
        A.K.A "Click at Element" under Robot Framework
        Generates a click event on this GUI element.
        :param: description - text identifies the element
        :param: button - one of the MouseButtons set (Left by default)
        '''
        self.findElement(description)
        self.click3(button)

    @keyword(name="Click at")
    def click2(self, x, y, w, h, button=MouseButtons.LEFT):
        '''
        A.K.A "Click at" under Robot Framework
        Generates a click event on this GUI region.
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :param: button - one of the MouseButtons set (Left by default)
        '''
        self.findElementFromPoint(x, y, w, h)
        self.click3(button)

    @keyword(name="Double Click at Element")
    def dclick(self, description):
        '''
        A.K.A "Double Click at Element" under Robot Framework
        Generates a double click event on this GUI element.
        :param: description - text identifies the element
        :return: 
        '''
        self.findElement(description)
        self.dclick3()

    @keyword(name="Double Click at")
    def dclick2(self, x, y, w, h):
        '''
        A.K.A "Double Click at" under Robot Framework
        Generates a double click event on this GUI element.
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        '''
        self.findElementFromPoint(x, y, w, h)
        self.dclick3()

    @keyword(name="Write Text at Element")
    def write(self, description, text):
        '''
        A.K.A "Write Text at Element" under Robot Framework
        Inserts the given text in this GUI element.
        :param: description - text identifies the element
        :param: text to insert in the GUI element
        '''
        self.findElement(description)
        self.write3(text)

    @keyword(name="Write Text at")
    def write2(self, x, y, w, h, text):
        '''
        A.K.A "Write Text at" under Robot Framework
        Inserts the given text in this GUI region.
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :param: text to insert in the GUI element
        '''
        self.findElementFromPoint(x, y, w, h)
        self.write3(text)

    @keyword(name="Drag Element To")
    def move(self, description, endX, endY):
        '''
        A.K.A "Drag Element To" under Robot Framework
        Generated a click and drag event moving the GUI element to the end location
        :param: description - text identifies the element
        :param: endX coordinate of desired end location
        :param: endY coordinate of desired end location
        '''
        self.findElement(description)
        self.move3(endX, endY)

    @keyword(name="Drag To")
    def move2(self, x, y, w, h, endX, endY):
        '''
        A.K.A "Drag To" under Robot Framework
        Generated a click and drag event moving the GUI region to the end location
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :param: endX coordinate of desired end location
        :param: endY coordinate of desired end location
        '''
        self.findElementFromPoint(x, y, w, h)
        self.move3(endX, endY)

    @keyword(name="Capture Temporary Image at Element")
    def captureTemp(self, description):
        '''
        A.K.A "Capture Temporary Image at Elmeent" under Robot Framework
        Creates an image of the GUI element in the IMG/TEMP/ space
        :param: description - text identifies the element
        '''
        self.findElement(description)
        self.captureTemp3()

    @keyword(name="Capture Temporary Image at")
    def captureTemp2(self, x, y, w, h):
        '''
        A.K.A "Capture Temporary Image at" under Robot Framework
        creates an image of the GUI region in the IMG/TEMP/ space
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        '''
        self.findElementFromPoint(x, y, w, h)
        self.captureTemp3()

    def captureTemp3(self):
        '''
        This is NOT a Robot Framework function. Unusual for a #3
        function which is generally defined by the speicfic image
        processing tool. This one leads to the picture function
        which IS defined by each library.
        creates an image of the GUI in the IMG/TEMP/ space
        '''
        if self.foundElement == None:
            raise Exception("Element was not found")
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")
        self.picture(self.tempPath, self.foundElement)

    @keyword(name="Capture Image at Element")
    def capture(self, description, name=None):
        '''
        A.K.A "Capture Image at Element" under Robot Framework
        creates an image of the GUI element in the IMG/ space
        :param: description - text identifies the element
        :param: name (proposed) of the desired image file
        :return: name of the actual image file
        '''
        self.findElement(description)
        return self.capture3(name)

    @keyword(name="Capture Image at")
    def capture2(self, x, y, w, h, name=None):
        '''
        A.K.A "Capture Image at" under Robot Framework
        creates an image of the GUI region in the IMG/ space
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :param: name (proposed) of the desired image file
        :return: name of the actual image file
        '''
        self.findElementFromPoint(x, y, w, h)
        tmp = self.capture3(name)
        return tmp

    def capture3(self, name=None):
        '''
        This is NOT a Robot Framework function. Unusual for a #3
        function which is generally defined by the speicfic image
        processing tool. This one leads to the picture function
        which IS defined by each library.

        creates an image of the GUI element in the IMG/ space
        :param: name (proposed) of the desired image file
        :return: name of the actual image file
        '''
        if self.foundElement == None:
            raise Exception("Element was not found")
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")

        return self.picture(self.imgPath, self.foundElement, name)

    @keyword(name="Capture Small GIF at Element")
    def captureSmall(self, description, number, name=None):
        '''
        A.K.A "Capture Small GIF at Element" under Robot Framework
        creates an animated image of the GUI element in the IMG/ space
        :param: description - text identifies the element
        :param: number of slides in the GIF
        :param: name (proposed) of the desired image file
        :return: name of the actual GIF file
        '''
        self.findElement(description)
        return self.captureSmall3(number, name)

    @keyword(name="Capture Small GIF at")
    def captureSmall2(self, x, y, w, h, number, name=None):
        '''
        A.K.A "Capture Small GIF at" under Robot Framework
        creates an animated image of the GUI region in the IMG/ space
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :param: number of slides in the GIF
        :param: name (proposed) of the desired image file
        :return: name of the actual GIF file
        '''
        self.findElementFromPoint(x, y, w, h)
        return self.captureSmall3(number, name)

    def captureSmall3(self, number, name=None):
        '''
        This is NOT a Robot Framework function. Unusual for a #3
        function which is generally defined by the speicfic image
        processing tool. This one leads to the picture function
        which IS defined by each library.

        captures a series of GIF frames in temporary storage and
        then creates one GIF out of those frames.
        :param: number of slides in the GIF
        :param: name (proposed) of the desired image file
        :return: name of the actual GIF file
        '''
        if self.foundElement == None:
            raise Exception("Element was not found")
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")
        for _ in range(int(number)):
            self.picture(self.tempPath, self.foundElement)
            time.sleep(.2)
        return self.convertToGIF(name)

    @keyword(name="Convert to GIF")
    def convertToGIF(self, name=None, sourcePath=None, key="*"):
        '''
        A.K.A "Convert to GIF" under Robot Framework
        Collects all images in the IMG/TEMP/ folder into one GIF
        :param: name (proposed) of the desired image file
        :return: name of the actual GIF file
        '''
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")
        next = nextFile(self.imgPath, name, "GIF")
        if sourcePath == None:
            sourcePath = self.tempPath

        cmd = ['convert',
            '-verbose',
            '-antialias',
            '-delay', '50',
            '-loop', '0',
            sourcePath+sep+key,
            next]
        p = subprocess.Popen(cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT)
        stdout, _ = p.communicate()
        rc=p.returncode
        if rc != 0:
            stdout = stdout.decode("utf-8")
            tmpE = ""
            for line in stdout.splitlines():
                tmpE = tmpE + line +"\n"
            raise RuntimeError("Error creating GIF\n Error:"+tmpE)

        #cleanup image files
        for file in pathlib.Path(sourcePath).glob(key):
            remove(file)
        return next

    def __init__(self):
        self.foundElement = None
        self.watchers = {}
        self.usable=False

    @keyword(name="Configure Image Path")
    def configureImagePath(self, dataPath):
        self.imgPath = dataPath + "/IMG"
        self.tempPath = dataPath + "/IMG/TEMP"
        self.watcherPath = dataPath + "/IMG/WATCHER"
        self.usable=True

    def read3(self):
        """
        Reads text as indicated by self.foundElement
        :return: Text found
        """
        raise NotImplementedError

    def click3(self, button=MouseButtons.LEFT):
        """
        :param: button one of the MouseButtons set (Left by default)
        Performs click as indicated by self.foundElement
        """
        raise NotImplementedError

    def dclick3(self):
        """
        Performs double click as indicated by self.foundElement
        """
        raise NotImplementedError

    def write3(self, text):
        """
        Writes text as indicated by self.foundElement
        :param text: Characters to be written
        """
        raise NotImplementedError

    def move3(self, endX, endY):
        """
        Moves to (endX, endY) as indicated by self.foundElement
        :param endX: Desired x coordinate
        :param endY: Desired y coordinate
        """
        raise NotImplementedError

    @keyword(name="Capture Screen")
    def captureScreen(self, name=None):
        """
        Takes an image of the entire screen
        :param name: The desired file name; defaults to image---.png
        """
        raise NotImplementedError
    
    @keyword(name="Capture Screen At")
    def captureLimitedScreen(self, x, y, w, h, name=None):
        """
        Takes an image of the specified region of the screen
        :param: x coordinate of the desired read region
        :param: y coordinate of the desired read region
        :param: w - width of the desired read region
        :param: h - height of the desired read region
        :param name: The desired file name; defaults to image---.png
        """
        raise NotImplementedError

    def picture(self, path, thing, name=None):
        """
        Based on tool-specific capabilities, take a picture
        at the specified region, saving it at the specified
        path and with the given file name.
        :param path: Any file path may be used, but IMG/ and IMG/TEMP are suggested
        :param thing: May be defined by the specific tool e.g. some tools need an XYWH region
        :param name: The desired file name; defaults to image---.png
        :return: the filename of the created image
        """
        raise NotImplementedError

    def findElement(self, description):
        """
        Defined for tool-specific element interaction
        based on a text input. Find the emelement and
        save some hook in self.foundElement
        :param description: Specific to each tool e.g. CSS description or image file
        :return: (x, y) location of element; (0, 0) if not found
        """
        raise NotImplementedError

    def findElementFromPoint(self, x, y, w, h):
        """
        Defined for tool-specific element interaction
        based on an XYWH region. Find the emelement and
        save some hook in self.foundElement
        :param x: x Coordinate of the desired region
        :param y: y Coordinate of the desired region
        :param w: width of the desired region
        :param h: height of the desired region
        """
        raise NotImplementedError
