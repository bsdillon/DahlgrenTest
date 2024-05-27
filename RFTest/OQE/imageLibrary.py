from robot.api.deco import keyword
import time  # needed for animation of GIFs
from os import sep, remove, listdir, path
import filemaker
from threading import Event, Thread
from PIL import Image
import fnmatch

PNG_EXTENSION = '*.PNG'
class MouseButtons:
    LEFT = 1
    MIDDLE = 2
    RIGHT = 3
    SCROLL_UP = 4
    SCROLL_DOWN = 5

class imagelibrary:
    '''
    ImageLibrary is the parent of libraries that work with the GUI and manage image
    capture. There are 4 \n\n
    *Watcher Functions* - Create and halt "watchers" that monitor a segment of the GUI\n\n
    *Test Configuration* - Setup and configure the imagelibrary for testing\n\n
    *Image Functions* - Capture images, revise images, create animations, etc.\n\n
    *GUI Operations* - Interact with the GUI e.g. read, write, click, etc.
    '''
    ROBOT_AUTO_KEYWORDS = False

    @keyword(name="Configure Image Path")
    def configureImagePath(self, dataPath):
        '''
        Part of *Test Configuration*\n\n
        dataPath - the absolute path to the data folder
        '''
        self.imgPath = dataPath + "/IMG"
        self.tempPath = dataPath + "/IMG/TEMP"
        self.watcherPath = dataPath + "/IMG/WATCHER"
        self.usable=True

    @keyword(name="Start Watcher at Element")
    def startWatcher(self, name:str, description:str, rateSeconds:float=1, limit:int=-1):
        '''
        Part of *Watcher Functions*\n\n
        Generates a click event on this GUI element. Returns the true name used for the watcher\n\n
        name - proposed name to be given to watcher\n\n
        description - text identifies the element\n\n
        rateSeconds - the number of seconds between images; default is 1second\n\n
        limit - total number of images ot take; default -1 indicates no end\n\n
        '''
        self.findElement(description)
        return self.startWatcher3(name, rateSeconds, limit)

    @keyword(name="Start Watcher at")
    def startWatcher2(self, name:str, x:str, y:str, w:str, h:str, rateSeconds:float=1, limit:int=-1):
        '''
        Part of *Watcher Functions*\n\n
        Generates a click event on this GUI element. Returns the true name of the watcher\n\n
        name - proposed name to be given to watcher\n\n
        x coordinate of the desired read region\n\n
        y coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        rateSeconds - the number of seconds between images; default is 1 second\n\n
        limit - total number of images ot take; default -1 indicates no end\n\n
        '''
        self.findElementFromPoint(x,y,w,h)
        return self.startWatcher3(name, rateSeconds, limit)

    def startWatcher3(self, name:str, rateSeconds:float, limit:int):
        """
        Creates a Watcher object and saves it in self.watchers
        as a tupple "trueName":[Watcher, runEvent]. Returns the true name (derived
        from the proposed name) of the watcher.\n\n
        name - proposed name for the watcher\n\n
        rateSeconds - the number of seconds between images; default is 1second\n\n
        limit - total number of images ot take; default -1 indicates no end\n\n
        """
        if self.foundElement == None:
            raise Exception("Element was not found")

        #BSD I do not BELIEVE there is a way for RFW to create
        #multiple threads attaching to this function. If not,
        #we will need some form of synchronization on self.watchers

        #determine the real name to use for this Watcher
        baseName = filemaker.safeFileName(name)
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
        baseName - the name used for creating all images in this watcher
        runEvent - used to communicat across threads
        thing - whatever we are taking picutres of
        rateSeconds - the number of seconds between images; default is 1second
        limit - total number of images ot take; default -1 indicates no end
        '''
        count = 0
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")

        while runEvent.isSet() and (limit==-1 or count<limit):
            time.sleep(rateSeconds)
            count = count + 1
            self.picture(self.watcherPath, thing, name=baseName+filemaker.alphaCount(count))

    @keyword(name="Halt All Watchers")
    def haltAllWatchers(self):
        '''
        Part of *Watcher Functions*\n\n
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
        Part of *Watcher Functions*\n\n
        Uses the name of the Watcher to find it, halt it, delete it from memory, and 
        return the resulting GIF file path. Returns the GIF file created by the watcher.\n\n
        name - true name of the Watcher
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
            answer = self.convertToGIF(name=name, sourcePath=self.watcherPath, key=name+"*")
        else:
            raise RuntimeError("No Watcher found for name "+name)
        
        return answer

    @keyword(name="Get Next Img File")
    def getImageFile(self, proposed):
        '''
        Part of *Image Functions*\n\n
        Takes in a proposed name, determines what the file system can support, and then
        returns the accepted name.\n\n
        proposed - the name the test would prefer to use
        '''
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")

        return filemaker.nextFile(self.imgPath, proposed)

    @keyword(name="Read from Element")
    def read(self, description):
        '''
        Part of *GUI Operations*\n\n
        Find the element described and returns the text found there.\n\n
        description - text identifies the element\n\n
        '''
        self.findElement(description)
        return self.read3()

    @keyword(name="Read from")
    def read2(self, x, y, w, h):
        '''
        Part of *GUI Operations*\n\n
        Find the region and returns the text found there.
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        '''
        self.findElementFromPoint(x,y,w,h)
        return self.read3()

    @keyword(name="Highlight at Element")
    def highlightElement(self, description):
        '''
        Part of *GUI Operations*\n\n
        Generates a highlight event on this GUI region.\n\n
        description - text identifies the element
        '''
        self.findElement(description)
        self.highlightElement3()

    @keyword(name="Highlight at")
    def highlightElement2(self, x, y, w, h):
        '''
        Part of *GUI Operations*\n\n
        Generates a highlight event on this GUI region.\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region
        '''
        self.findElementFromPoint(x, y, w, h)
        self.highlightElement3()

    @keyword(name="Click at Element")
    def click(self, description, button=MouseButtons.LEFT):
        '''
        Part of *GUI Operations*\n\n
        Generates a click event on this GUI element.\n\n
        description - text identifies the element\n\n
        button - one of the MouseButtons set (Left by default)
        '''
        self.findElement(description)
        self.click3(button)

    @keyword(name="Click at")
    def click2(self, x, y, w, h, button=MouseButtons.LEFT):
        '''
        Part of *GUI Operations*\n\n
        Generates a click event on this GUI region.\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        button - one of the MouseButtons set (Left by default)
        '''
        self.findElementFromPoint(x, y, w, h)
        self.click3(button)

    @keyword(name="Double Click at Element")
    def dclick(self, description):
        '''
        Part of *GUI Operations*\n\n
        Generates a double click event on this GUI element.\n\n
        description - text identifies the element
        '''
        self.findElement(description)
        self.dclick3()

    @keyword(name="Double Click at")
    def dclick2(self, x, y, w, h):
        '''
        Part of *GUI Operations*\n\n
        Generates a double click event on this GUI element.\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region
        '''
        self.findElementFromPoint(x, y, w, h)
        self.dclick3()

    @keyword(name="Write Text at Element")
    def write(self, description, text):
        '''
        Part of *GUI Operations*\n\n
        Inserts the given text in this GUI element.\n\n
        description - text identifies the element\n\n
        text to insert in the GUI element
        '''
        self.findElement(description)
        self.write3(text)

    @keyword(name="Write Text at")
    def write2(self, x, y, w, h, text):
        '''
        Part of *GUI Operations*\n\n
        Inserts the given text in this GUI region.\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        text to insert in the GUI element
        '''
        self.findElementFromPoint(x, y, w, h)
        self.write3(text)

    @keyword(name="Drag Element To")
    def move(self, description, endX, endY):
        '''
        Part of *GUI Operations*\n\n
        Generated a click and drag event moving the GUI element to the end location\n\n
        description - text identifies the element\n\n
        endX - coordinate of desired end location\n\n
        endY - coordinate of desired end location\n\n
        '''
        self.findElement(description)
        self.move3(endX, endY)

    @keyword(name="Drag To")
    def move2(self, x, y, w, h, endX, endY):
        '''
        Part of *GUI Operations*\n\n
        Generated a click and drag event moving the GUI region to the end location\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        endX - coordinate of desired end location\n\n
        endY - coordinate of desired end location\n\n
        '''
        self.findElementFromPoint(x, y, w, h)
        self.move3(endX, endY)

    @keyword(name="Capture Temporary Image at Element")
    def captureTemp(self, description):
        '''
        Part of *Image Functions*\n\n
        Creates an image of the GUI element in the IMG/TEMP/ space\n\n
        description - text identifies the element
        '''
        self.findElement(description)
        self.captureTemp3()

    @keyword(name="Capture Temporary Image at")
    def captureTemp2(self, x, y, w, h):
        '''
        Part of *Image Functions*\n\n
        Creates an image of the GUI region in the IMG/TEMP/ space\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region
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
        Part of *Image Functions*\n\n
        Creates an image of the GUI element in the IMG/ space. Returns the name of the 
        actual image file.\n\n
        description - text identifies the element\n\n
        name - (proposed) of the desired image file
        '''
        self.findElement(description)
        return self.capture3(name)

    @keyword(name="Capture Image at")
    def capture2(self, x, y, w, h, name=None):
        '''
        Part of *Image Functions*\n\n
        Creates an image of the GUI region in the IMG/ space. Returns the actual
        image file created.\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        name - (proposed) of the desired image file
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
        name (proposed) of the desired image file
        Return -name of the actual image file
        '''
        if self.foundElement == None:
            raise Exception("Element was not found")
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")

        return self.picture(self.imgPath, self.foundElement, name)

    @keyword(name="Capture Small GIF at Element")
    def captureSmall(self, description, number, name=None):
        '''
        Part of *Image Functions*\n\n
        Creates an animated image of the GUI element in the IMG/ space. Returns the actual
        GIF file created.\n\n
        description - text identifies the element\n\n
        number - of slides in the GIF\n\n
        name - (proposed) of the desired image file
        '''
        self.findElement(description)
        return self.captureSmall3(number, name)

    @keyword(name="Capture Small GIF at")
    def captureSmall2(self, x, y, w, h, number, rate, name=None):
        '''
        Part of *Image Functions*\n\n
        Creates an animated image of the GUI region in the IMG/ space. Returns the 
        actual GIF file created.\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        number - of slides in the GIF\n\n
        name - (proposed) of the desired image file
        '''
        self.findElementFromPoint(x, y, w, h)
        return self.captureSmall3(number, rate, name)

    def captureSmall3(self, number, rate=200, name=None):
        '''
        This is NOT a Robot Framework function. Unusual for a #3
        function which is generally defined by the speicfic image
        processing tool. This one leads to the picture function
        which IS defined by each library.

        captures a series of GIF frames in temporary storage and
        then creates one GIF out of those frames.
        number of slides in the GIF
        name (proposed) of the desired image file
        Return -name of the actual GIF file
        '''
        if self.foundElement == None:
            raise Exception("Element was not found")
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")
        for _ in range(int(number)):
            self.picture(self.tempPath, self.foundElement)
            time.sleep(rate/1000.0)#convert ms to seconds
        return self.convertToGIF(name=name, rate=rate)

    @keyword(name="Search Region at Element")
    def searchRegion(self, description, targetImage):
        '''
        Part of *Image Functions*\n\n
        Searches the region from self.foundElement for
        the image indicated by the given file. Returns 
        (x,y) location of target OR (-1,-1)\n\n
        description - text identifies the element\n\n
        targetImage - absolute path of target image file\n\n
        '''
        self.findElement(description)
        return self.searchRegion3(targetImage)

    @keyword(name="Search Region At")
    def searchRegion2(self, x, y, w, h, targetImage):
        '''
        Part of *Image Functions*\n\n
        Searches the region from self.foundElement for
        the image indicated by the given file. Returns 
        (x,y) location of target OR (-1,-1)\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        targetImage - absolute path of target image file\n\n
        '''
        self.findElementFromPoint(x, y, w, h)
        return self.searchRegion3(targetImage)

    @keyword(name="Convert to GIF")
    def convertToGIF(self, name=None, sourcePath=None, key="*", rate=200):
        '''
        Part of *Image Functions*\n\n
        Collects all images in the IMG/TEMP/ folder into one GIF. Returns the actual
        GIF file created.\n\n
        name - (proposed) of the desired image file
        '''
        if not self.usable:
            raise FileNotFoundError("Cannot use ImageLibrary before 'Configure Image Path'")
        next = filemaker.nextFile(self.imgPath, name, "GIF")
        
        images = []
        
        if sourcePath == None:
            sourcePath = self.tempPath

        allFiles = sorted(listdir(sourcePath))
        accepeted_files = []

        for filename in allFiles:
            if fnmatch.fnmatch(filename, key) and fnmatch.fnmatch(filename, PNG_EXTENSION):
                file_path = path.join(sourcePath, filename)
                accepeted_files.append(file_path)
                # Open each image and append it to the images list
                images.append(Image.open(file_path))
        # Save the images as a GIF
        images[0].save(next, save_all=True, append_images=images[1:], duration=rate, loop=0)

        #cleanup image files
        for filename in accepeted_files:
            remove(filename)
        return next

    def __init__(self):
        self.foundElement = None
        self.watchers = {}
        self.usable=False

    def read3(self):
        """
        Reads text as indicated by self.foundElement
        Return -Text found
        """
        raise NotImplementedError(f"{self}.read3")

    def highlightElement3(self):
        '''
        Generates a highlight event on this GUI region.
        '''
        raise NotImplementedError(f"{self}.highlightElement")

    def click3(self, button=MouseButtons.LEFT):
        """
        button one of the MouseButtons set (Left by default)
        Performs click as indicated by self.foundElement
        """
        raise NotImplementedError(f"{self}.click3")

    def dclick3(self):
        """
        Performs double click as indicated by self.foundElement
        """
        raise NotImplementedError(f"{self}.dclick3")

    def write3(self, text):
        """
        Writes text as indicated by self.foundElement
        text: Characters to be written
        """
        raise NotImplementedError(f"{self}.write3")

    def move3(self, endX, endY):
        """
        Moves to (endX, endY) as indicated by self.foundElement
        endX: Desired x coordinate
        endY: Desired y coordinate
        """
        raise NotImplementedError(f"{self}.move3")

    def searchRegion3(self, targetImage):
        '''
        Searches the region from self.foundElement for
        the image indicated by the given file. Returns 
        (x,y) location of target OR (-1,-1)
        targetImage: Absolute file path for desired image.
        '''
        raise NotImplementedError(f"{self}.searchRegion3")

    @keyword(name="Capture Screen")
    def captureScreen(self, name=None):
        """
        Part of *Image Functions*\n\n
        Takes an image of the entire screen\n\n
        name - The desired file name; defaults to image---.png
        """
        raise NotImplementedError(f"{self}.captureScreen")
    
    @keyword(name="Capture Screen At")
    def captureLimitedScreen(self, x, y, w, h, name=None):
        """
        Part of *Image Functions*\n\n
        Takes an image of the specified region of the screen.\n\n
        x - coordinate of the desired read region\n\n
        y - coordinate of the desired read region\n\n
        w - width of the desired read region\n\n
        h - height of the desired read region\n\n
        name - The desired file name; defaults to image---.png
        """
        raise NotImplementedError(f"{self}.captureLimitedScreen")

    def picture(self, path, thing, name=None):
        """
        Based on tool-specific capabilities, take a picture
        at the specified region, saving it at the specified
        path and with the given file name.
        path: Any file path may be used, but IMG/ and IMG/TEMP are suggested
        thing: May be defined by the specific tool e.g. some tools need an XYWH region
        name: The desired file name; defaults to image---.png
        Return -the filename of the created image
        """
        raise NotImplementedError(f"{self}.picture")

    def findElement(self, description):
        """
        Defined for tool-specific element interaction
        based on a text input. Find the emelement and
        save some hook in self.foundElement
        description: Specific to each tool e.g. CSS description or image file
        Return -(x, y) location of element; (0, 0) if not found
        """
        raise NotImplementedError(f"{self}.findElement")

    def findElementFromPoint(self, x, y, w, h):
        """
        Defined for tool-specific element interaction
        based on an XYWH region. Find the emelement and
        save some hook in self.foundElement
        x: x Coordinate of the desired region
        y: y Coordinate of the desired region
        w: width of the desired region
        h: height of the desired region
        """
        raise NotImplementedError(f"{self}.findElementFromPoint")
