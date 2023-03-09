import tkinter as tk
from tkinter import messagebox, ttk, filedialog as fd
from PIL import Image, ImageTk
from widget import EditorState, Widget, WidgetEditor
from imageUpdate import ImageUpdater
from tkinter.simpledialog import askstring

class SelectionState:
    INACTIVE = 0
    SELECT_FIRST = 1
    SELECT_SECOND = 2
    MAX = 3

class ImageWindow(ImageUpdater):
    def __init__(self, master, imagePath):
        self.master = master
        self.imagePath = imagePath

        top = tk.Toplevel(master.window)
        self.top = top
        top.protocol("WM_DELETE_WINDOW", master.closeTest)

        self.overlays = []
        self.imageList = {}
        self.selectedImage = tk.StringVar()
        self.imageCombo = ttk.Combobox(top, textvariable=self.selectedImage)
        self.imageCombo.bind('<<ComboboxSelected>>', self.changeSelectedImage)
        self.imageCombo.grid(row=0, column=0)

        self.selectionStage = SelectionState.INACTIVE
        self.instructions = tk.Label(top, text='Load a GUI Image')
        self.instructions.config(anchor=tk.CENTER)
        self.instructions.grid(row=0, column=1)

        HEIGHT = 300
        WIDTH = 300
        self.top.rowconfigure(index=2, weight=1)
        self.top.columnconfigure(index=0, weight=1)
        frame2 = tk.Frame(top, width=WIDTH, height=HEIGHT, bg="#000000")
        frame2.grid(row=2, column=0, columnspan=3, sticky=tk.N+tk.E+tk.W+tk.S)

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

    def restartStateMachine(self):
        self.instructions.config(text="Select First Point")
        self.selectionStage = SelectionState.SELECT_FIRST

#todo May be OBE
    def loadImage(self):
        name = fd.askopenfilename(parent=self.top, filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
        if name == "":
            messagebox.showerror(title="Error", message="Image file not found", parent=self.top)
            return

        project = askstring("Project", "Assign a project name")
        if project == "":
            messagebox.showerror(title="Error", message="Project name is empty", parent=self.top)
            return

    def changeSelectedImage(self, _):
        value = self.selectedImage.get()
        if value == "": #Occurs when the window is created and before an image is selected
            return
        self.img = Image.open(self.imageList[value])
        self.tkImg = ImageTk.PhotoImage(self.img)
        self.canvas.itemconfig(self.image_container, image=self.tkImg)
        self.canvas.config(scrollregion=(0,0,self.img.width,self.img.height))
        self.canvas.update()

        #Move to next state
        self.restartStateMachine()
        
    def loadImageNames(self, list):
        self.imageList = {}
        tmp = []
        for l in list:
            pieces = l.split("\\")
            tmp.append(pieces[-1])
            self.imageList[tmp[-1]]=l
        self.imageCombo['values'] = tmp
        self.selectedImage.set(tmp[0])
        self.changeSelectedImage(None)

    def clickCanvas(self, event):
        loc = [self.canvas.canvasx(event.x), self.canvas.canvasy(event.y)]
        if loc[0]>self.img.width or loc[1]>self.img.height:
            messagebox.showerror(title="Click Error", message="All points must be on the image", parent=self.top)
            self.restartStateMachine()
            return
        if self.selectionStage == SelectionState.SELECT_FIRST:
            if self.pointAlreadyCovered(loc[0], loc[1]):
                messagebox.showerror(title="Click Error", message="First point must be OUTSIDE all existing widgets", parent=self.top)
                self.restartStateMachine()
                return

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
            if self.pointAlreadyCovered(self.secondCoord[0], self.secondCoord[1]):
                messagebox.showerror(title="Click Error", message="Second point must be OUTSIDE all existing widgets", parent=self.top)
                self.restartStateMachine()
                return
            if self.boxOverlaps(self.firstCoord[0], self.firstCoord[1], self.secondCoord[0], self.secondCoord[1]):
                messagebox.showerror(title="Click Error", message="Selected region overlaps another", parent=self.top)
                self.restartStateMachine()
                return

            #with two points we can define a widget
            tempW = Widget("Anchor", self.firstCoord[0], self.firstCoord[1],
                    self.secondCoord[0]-self.firstCoord[0], self.secondCoord[1]-self.firstCoord[1])

            #capture the image of the widget
            tempW.image = self.img.crop((self.firstCoord[0], self.firstCoord[1],self.secondCoord[0], self.secondCoord[1]))
    
            WidgetEditor.Edit(tempW, self.top, self, yetiType=self.master.YetiEnabled)

            if tempW.editor.completed == EditorState.COMPLETE:
                #update the master table
                self.master.newTableEntry(self.img.copy(), tempW)

            #either completed or not, restart the machine
            self.restartStateMachine()

    def pointAlreadyCovered(self, x, y):
        for w in self.overlays:
            box = self.canvas.bbox(w.imageID)
            if box[0]<x and x<box[2] and box[1]<y and y<box[3]:
                return True
        return False

    def boxOverlaps(self, x1, y1, x2, y2):
        for w in self.overlays:
            box = self.canvas.bbox(w.imageID)
            # According to stack overflow, this is the simplest check for overlap between objects in 2 dimensions
            # https://stackoverflow.com/questions/20925818/algorithm-to-check-if-two-boxes-overlap            
            if x2>=box[0] and box[2]>=x1 and y2>=box[1] and box[3]>=y1:
                return True
        return False

    def getImageSavePath(self):
        return self.imagePath

    def getImageBounds(self):
        return [self.img.width, self.img.height]

    def cropImage(self, x, y, w, h):
        return self.img.crop((x, y, x+w, y+h))

    def updateImage(self, widget):
        self.deleteOverlays(widget)

        widget.overlay = self.createOverlay(
                                            widget.getValue("name"), 
                                            widget.getValue("X"),
                                            widget.getValue("Y"),
                                            widget.getValue("width"),
                                            widget.getValue("height"))

            #create a new image for the master window to display
        widget.image = self.cropImage(
                                    int(widget.getValue("X")),
                                    int(widget.getValue("Y")),
                                    int(widget.getValue("width")),
                                    int(widget.getValue("height")))

    def deleteOverlays(self, widget):
        if hasattr(widget, 'overlay'):
            #widget has overlay, so delete all elements from canvas before rebuild
            self.canvas.delete(widget.overlay.textID2)
            self.canvas.delete(widget.overlay.textID)
            self.canvas.delete(widget.overlay.rectID)
            self.canvas.delete(widget.overlay.imageID)
            self.overlays.remove(widget.overlay)
            delattr(widget, "overlay")

    def createOverlay(self, text, x1Str, y1Str, wStr, hStr):
        x1 = int(x1Str)
        y1 = int(y1Str)
        w = int(wStr)
        h = int(hStr)
        fill="#ff0000"
        alpha = 128
        fill = self.top.winfo_rgb(fill) + (alpha,)
        image = Image.new('RGBA', (w, h), fill)
        overlay = ImageTk.PhotoImage(image)
        self.overlays.append(overlay)
        overlay.imageID = self.canvas.create_image(x1, y1, image=self.overlays[-1], anchor='nw')
        overlay.rectID = self.canvas.create_rectangle(x1, y1, x1+w, y1+h)

        tags = (text,)
        overlay.textID = self.canvas.create_text(x1, y1, text=text, fill="#000000", tags=tags, font=('Arial','14','bold'))
        overlay.textID2 = self.canvas.create_text(x1, y1, text=text, fill="#ffff00", tags=tags, font=('Arial','14','bold'))
        bounds= self.canvas.bbox(overlay.textID)
        w = (w - (bounds[2]-bounds[0]))/2
        h = (h - (bounds[3]- bounds[1]))/2
        self.canvas.move(overlay.textID, w, h)
        self.canvas.move(overlay.textID2, w - 2, h - 2)
        return overlay
