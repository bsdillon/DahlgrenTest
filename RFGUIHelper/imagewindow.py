from random import randint
import tkinter as tk
from tkinter import messagebox, ttk, filedialog as fd
from PIL import Image, ImageTk
from imageUpdate import ImageUpdater
from tkinter.simpledialog import askstring

class SelectionState:
    INACTIVE = 0
    SELECT_FIRST = 1
    SELECT_SECOND = 2
    MAX = 3

class ImageWindow(ImageUpdater):
    MAIN_COLOR = "#FF000080"
    IMPORT_COLOR = "#0000FF80"
    
    GROUP_COLORS = [
        "#FF800080",#orange
        "#ec3f0780",#dkOrange
        "#FFFF0040",#yellow
        "#80692580",#dkyellow
        "#00FF0080",#green
        "#00800080",#dkgreen
        "#00FFFF80",#cyan
        "#00808080",#dkcyan
        "#FF00FF80",#magenta
        "#80008080",#dkmagenta
    ]
    
    def __init__(self, master, imagePath):
        self.groupAssignments={}
        self.master = master
        self.imagePath = imagePath

        top = tk.Toplevel(master.window)
        self.top = top
        top.protocol("WM_DELETE_WINDOW", self.master.closeProject)
        top.title("Image Window")

        self.foreignViews = {}
        self.overlays = []
        self.imageList = {}
        self.img=None
        self.tkImg=None
        throwaway = tk.Label(top, text='Select View:')
        throwaway.grid(row=0, column=0, sticky=tk.W)

        self.selectedImage = tk.StringVar()
        self.imageCombo = ttk.Combobox(top, textvariable=self.selectedImage)
        self.imageCombo.bind('<<ComboboxSelected>>', self.changeSelectedImage)
        self.imageCombo.grid(row=0, column=1, sticky=tk.W)
        self.currentView = None

        throwaway = tk.Label(top, text='    ')
        throwaway.grid(row=0, column=2, sticky=tk.W+tk.E)

        throwaway = tk.Button(top, text='Import Widget', command=self.master.importWidget)
        throwaway.grid(row=0, column=3, sticky=tk.E)

        self.selectionStage = SelectionState.INACTIVE
        self.instructions = tk.Label(top, text='Load a GUI Image')
        self.instructions.config(anchor=tk.CENTER)
        self.instructions.grid(row=1, column=0, columnspan=4, sticky=tk.W+tk.E)

        HEIGHT = 500
        WIDTH = 500
        self.top.geometry(str(WIDTH)+'x'+str(HEIGHT))
        self.top.rowconfigure(index=2, weight=1)
        self.top.columnconfigure(index=3, weight=1)
        frame2 = tk.Frame(top, width=WIDTH, height=HEIGHT, bg="#000000")
        frame2.grid(row=2, column=0, columnspan=4, sticky=tk.N+tk.E+tk.W+tk.S)

        self.canvas = tk.Canvas(frame2, bg='#dddddd',width=300,height=300,scrollregion=(0,0,300,300))
        self.image_container = self.canvas.create_image(0, 0, anchor="nw")
        self.canvas.bind("<Button 1>", self.clickCanvas)

        self.scrollbarV = ttk.Scrollbar(frame2, orient="vertical", command=self.canvas.yview)
        self.scrollbarH = ttk.Scrollbar(frame2, orient="horizontal", command=self.canvas.xview)
        
        self.scrollbarV.pack(side="right", fill="y")
        self.scrollbarH.pack(side="bottom", fill="x")
        self.canvas.pack(side="left", fill="both", expand=True)

        scrollable_frame = ttk.Frame(self.canvas)
        scrollable_frame.pack(side="left", fill="both", expand=True)
        scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(
                scrollregion=self.canvas.bbox("all")
            )
        )

        self.canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=self.scrollbarV.set)
        self.canvas.configure(xscrollcommand=self.scrollbarH.set)
        self.canvas.update()

    def setLocation(self, x, y):
        self.top.geometry("+%d+%d" %(x,y))

    def getLocation(self):
        return [self.top.winfo_x(), self.top.winfo_y()]

    def restartStateMachine(self):
        self.instructions.config(text="Select First Point")
        self.selectionStage = SelectionState.SELECT_FIRST

    #TODO May be OBE
    def loadImage(self):
        name = fd.askopenfilename(parent=self.top, filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
        if name == "":
            messagebox.showerror(title="Error", message="Image file not found", parent=self.top)
            return

        project = askstring("Project", "Assign a project name")
        if project == "":
            messagebox.showerror(title="Error", message="Project name is empty", parent=self.top)
            return

    def getCurrentView(self):
        return self.currentView

    def changeSelectedImage(self, _):
        self.currentView = self.selectedImage.get()
        if self.currentView == "": #Occurs when the window is created and before an image is selected
            return
        self.img = Image.open(self.imageList[self.currentView])
        self.tkImg = ImageTk.PhotoImage(self.img)
        self.canvas.itemconfig(self.image_container, image=self.tkImg)
        self.canvas.config(scrollregion=(0,0,self.img.width,self.img.height))
        self.canvas.update()
        
        #fire an event
        self.master.viewChange(self.currentView)
        
        #Move to next state
        self.restartStateMachine()
        
    def getViewList(self):
        return list(self.imageList.keys())

    def addGroup(self, groupName):
        if groupName in self.groupAssignments:
            return
        
        usedColors = list(self.groupAssignments.values())
        if len(usedColors)==len(ImageWindow.GROUP_COLORS):
            txt = "#"
            for i in range(6):
                txt += hex(randint(0, 15))[-1:]
            self.groupAssignments[groupName] = txt
            return
        
        self.groupAssignments[groupName]=ImageWindow.GROUP_COLORS[len(self.groupAssignments)]
        
    def deleteGroup(self, groupName):
        if groupName in self.groupAssignments:
            del self.groupAssignments[groupName]
    
    def loadImageNames(self, imgList):
        #first remember the existing value if it exists
        value = self.selectedImage.get()
        
        self.imageList = imgList
        stillExists = False
        self.imageCombo['values'] = list(imgList.keys())
        if stillExists:
            self.selectedImage.set(value) #select the value if it still exists
            self.currentView = value
        else:
            nv = list(imgList.keys())[0]
            self.selectedImage.set(nv) #go with the first value
            self.currentView = nv
        self.changeSelectedImage(None)

    def clickCanvas(self, event):
        if self.master.blockedByWidgetEditor():
            return

        if not self.img: #no effect until image loads
            return

        loc = [self.canvas.canvasx(event.x), self.canvas.canvasy(event.y)]
        if loc[0]>self.img.width or loc[1]>self.img.height:
            messagebox.showerror(title="Click Error", message="All points must be on the image", parent=self.top)
            self.restartStateMachine()
            return
        if self.selectionStage == SelectionState.SELECT_FIRST:
            # if self.pointAlreadyCovered(loc[0], loc[1]):
            #     messagebox.showerror(title="Click Error", message="First point must be OUTSIDE all existing widgets", parent=self.top)
            #     self.restartStateMachine()
            #     return

            self.instructions.config(text="Select Second Point")
            self.firstCoord = [loc[0], loc[1]]
            self.selectionStage = SelectionState.SELECT_SECOND
        elif self.selectionStage == SelectionState.SELECT_SECOND:
            self.secondCoord = [loc[0], loc[1]]
            if (self.secondCoord[0]<=self.firstCoord[0]) or (self.secondCoord[1]<=self.firstCoord[1]):
                #error state restarts the clicking process
                messagebox.showerror(title="Click Error", message="Second point MUST be right and below first point", parent=self.top)
                self.restartStateMachine()
                return
            # if self.pointAlreadyCovered(self.secondCoord[0], self.secondCoord[1]):
            #     messagebox.showerror(title="Click Error", message="Second point must be OUTSIDE all existing widgets", parent=self.top)
            #     self.restartStateMachine()
            #     return
            # if self.boxOverlaps(self.firstCoord[0], self.firstCoord[1], self.secondCoord[0], self.secondCoord[1]):
            #     messagebox.showerror(title="Click Error", message="Selected region overlaps another", parent=self.top)
            #     self.restartStateMachine()
            #     return

            #with two points we can define a widget

            #capture the image of the widget
            img = self.img.crop((self.firstCoord[0], self.firstCoord[1],self.secondCoord[0], self.secondCoord[1]))

            self.master.newWidget(self.currentView, img, self.firstCoord[0], self.firstCoord[1], self.secondCoord[0]-self.firstCoord[0], self.secondCoord[1]-self.firstCoord[1])

            #either completed or not, restart the machine
            self.restartStateMachine()

    # def pointAlreadyCovered(self, x, y):
    #     for w in self.overlays:
    #         box = self.canvas.bbox(w.imageID)
    #         if box[0]<x and x<box[2] and box[1]<y and y<box[3]:
    #             return True
    #     return False

    # def boxOverlaps(self, x1, y1, x2, y2):
    #     for w in self.overlays:
    #         box = self.canvas.bbox(w.imageID)
    #         # According to stack overflow, this is the simplest check for overlap between objects in 2 dimensions
    #         # https://stackoverflow.com/questions/20925818/algorithm-to-check-if-two-boxes-overlap            
    #         if x2>=box[0] and box[2]>=x1 and y2>=box[1] and box[3]>=y1:
    #             return True
    #     return False

    def getImageSavePath(self):
        return self.imagePath

    def getImageBounds(self):
        return [self.img.width, self.img.height]

    def cropImage(self, x, y, w, h, tkImage=True, specificView=None):
        if specificView:
            file = self.imageList[specificView]
        else:
            file = self.imageList[self.currentView]

        img1 = Image.open(file).crop((x, y, x+w, y+h))
        if tkImage:
            return ImageTk.PhotoImage(img1)
        else:
            return img1

    def updateWidgetOverlays(self, widget, dx=0, dy=0):
        if not self.master.isInView(widget):
            return
        
        isImport = (widget.getValue("view")!=self.currentView)
        self.deleteOverlays(widget)

        grp = None
        if widget.hasValue("Group"):
            grp = widget.getValue("Group")
            self.addGroup(grp)

        wName = widget.getValue("name")
        widget.overlay = self.createOverlay(
                                            wName, 
                                            int(widget.getValue("X"))+dx,
                                            int(widget.getValue("Y"))+dy,
                                            widget.getValue("width"),
                                            widget.getValue("height"),
                                            isImport,
                                            group=grp)
        self.overlays.append(wName)

        #create a new image for the master window to display
        widget.tkImage = self.cropImage(
                                    int(widget.getValue("X")),
                                    int(widget.getValue("Y")),
                                    int(widget.getValue("width")),
                                    int(widget.getValue("height")),
                                    specificView=widget.getValue("view"))

    def deleteOverlays(self, widget):
        wName = widget.getValue("name")
        if wName in self.overlays:
            #widget has overlay, so delete all elements from canvas before rebuild
            self.canvas.delete(widget.overlay.textID2)
            self.canvas.delete(widget.overlay.textID)
            self.canvas.delete(widget.overlay.rectID)
            self.canvas.delete(widget.overlay.imageID)
            self.overlays.remove(wName)

    def createOverlay(self, text, x1Str, y1Str, wStr, hStr, isForeign, group=None):
        x1 = int(x1Str)
        y1 = int(y1Str)
        w = int(wStr)
        h = int(hStr)
        fill=ImageWindow.MAIN_COLOR
        if isForeign:
            fill = ImageWindow.IMPORT_COLOR
        elif group:
            fill = self.groupAssignments[group]
            
        image = Image.new('RGBA', (w, h), fill)
        overlay = ImageTk.PhotoImage(image)
        self.overlays.append(overlay)
        overlay.imageID = self.canvas.create_image(x1, y1, image=self.overlays[-1], anchor='nw')
        overlay.rectID = self.canvas.create_rectangle(x1, y1, x1+w, y1+h)

        fontColor = "#ffff00"
        backColor = "#000000"
        if isForeign:
            backColor = "#ffffff"
            fontColor = "#0000ff"
        tags = (text,)
        overlay.textID = self.canvas.create_text(x1, y1, text=text, fill=backColor, tags=tags, font=('Arial','14','bold'))
        overlay.textID2 = self.canvas.create_text(x1, y1, text=text, fill=fontColor, tags=tags, font=('Arial','14','bold'))
        bounds= self.canvas.bbox(overlay.textID)
        w = (w - (bounds[2]-bounds[0]))/2
        h = (h - (bounds[3]- bounds[1]))/2
        self.canvas.move(overlay.textID, w, h)
        self.canvas.move(overlay.textID2, w - 2, h - 2)
        return overlay
