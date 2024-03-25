import os
import tkinter as tk
from PIL import Image, ImageTk
from tkinter import ttk, messagebox as mb, filedialog as fd

class ImageSelection(ttk.Frame):
    def __init__(self, parent, savePath, name, data, uncheckedType=True, callback=None):
        ttk.Frame.__init__(self, parent)
        self.isEnabled = True
        self.parent = parent
        self.savePath = savePath
        self.callback = callback
        self.checkText = "checked"
        if uncheckedType:
            self.checkText = "unchecked"
        self.widgetName = name+"_"+self.checkText
        
        #data = source Image;local image;left;top;right;bottom
        self.originalPath = data[0]
        if self.originalPath == "None":
            self.originalPath = None

        if self.originalPath: #test and perhaps override the original path
            try:
                Image.open(self.originalPath)
            except:
                mb.showerror(title="Error", message="Original image path is invalid: "+self.originalPath, parent=self.parent)
                self.originalPath = None
            
        self.localFile = data[1]
        if self.localFile=="None":
            self.localFile=None

        self.location = [int(data[2]),int(data[3])]
        self.imgDims = [int(data[2]),int(data[3]),int(data[4])-int(data[2]),int(data[5])-int(data[3])]

        self.columnconfigure(index=1, weight=1)   
        self.selectButton = tk.Button(self,text="Select  image...", command=self.select)
        self.selectButton.grid(row=0, column=0, sticky=tk.W)
        
        try:
            if self.localFile:#this is the already saved image
                img1 = Image.open(self.localFile)
                self.imgTk = ImageTk.PhotoImage(img1)
                self.label = ttk.Label(self, image=self.imgTk) #case 1 this successfully loads an image
            else:
                self.label = ttk.Label(self, text="") #case 2 there is no image file
        except Exception as ex:
            self.label = ttk.Label(self, text="") #case 3 this UNsuccessfully loads an image
        self.label.grid(row=0, column=1, sticky=tk.W+tk.E)
        self.update()

    def select(self):
        originalPath = self.originalPath
        if not (self.originalPath and mb.askyesno("Same image?", "Do you want to keep the same image?")):
            originalPath = fd.askopenfilename(parent=self.parent, title="Select Image", filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
            if originalPath == "":
                mb.showerror(title="Error", message="Image file not found", parent=self.parent)
                return None

        cw = ClickWindow(self.parent, self.checkText, originalPath, self.imgDims)
        self.wait_window(cw.choicewin)
        if cw.success:
            self.location = cw.location
            self.originalPath = originalPath

            self.callback()

    def saveImage(self, newDims=None):
        if newDims:
            self.imgDims=newDims
        box = (self.location[0], self.location[1], self.location[0]+self.imgDims[2], self.location[1]+self.imgDims[3])
        if self.originalPath:
            fileOnly = os.path.basename(self.originalPath) 
            ext = fileOnly.split(".")[-1]
            #TODO I have CONSIDERED deleting any old file for the checkbox, but it 
            # immediately had one problem and I don't want to keep that happening.
            # oldLocal = self.localFile
            # if oldLocal:
            #     os.remove(oldLocal)
            self.localFile = os.path.join(self.savePath, self.widgetName+"."+ext)
            image = Image.open(self.originalPath).crop(box)
            image.save(self.localFile)
            self.tkImage = ImageTk.PhotoImage(image)
            self.label.config(image=self.tkImage)
            self.update()
            
        return self.get()

    def updateName(self, nameText):
        self.widgetName = nameText
        self.saveImage()

    def get(self):
        if self.isEnabled:
            box = (self.location[0], self.location[1], self.location[0]+self.imgDims[2], self.location[1]+self.imgDims[3])
            if self.originalPath:
                return self.originalPath+";"+self.localFile+";"+str(box[0])+";"+str(box[1])+";"+str(box[2])+";"+str(box[3])
            return "None;None;"+str(box[0])+";"+str(box[1])+";"+str(box[2])+";"+str(box[3])
        return ""

    def disable(self):
        self.selectButton.configure(state=tk.DISABLED)
        self.isEnabled = False

    def enable(self):
        self.selectButton.configure(state=tk.NORMAL)
        self.isEnabled = True
            
class ClickWindow():
    def __init__(self, parent, checkText, imagePath, dimensions):
        self.success = False
        self.choicewin = tk.Toplevel(parent)
        self.choicewin.title("Locate the "+checkText+" image")

        self.choicewin.rowconfigure(index=6, weight=1)
        self.choicewin.columnconfigure(index=0, weight=1)
        self.choicewin.columnconfigure(index=5, weight=1)
        self.choicewin.columnconfigure(index=8, weight=1)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=0, column=0, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=0, column=1, columnspan=4, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=1, column=1, sticky=tk.N+tk.E+tk.W+tk.S)
        
        throwaway = tk.Button(self.choicewin, text='⤒', command=self.slowUp)
        throwaway.grid(row=1, column=2, sticky=tk.N+tk.E+tk.W+tk.S)
        throwaway = tk.Button(self.choicewin, text='⮅', command=self.fastUp)
        throwaway.grid(row=1, column=3, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=1, column=4, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=0, column=5, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Button(self.choicewin, text='⇤', command=self.slowLeft)
        throwaway.grid(row=2, column=1, sticky=tk.N+tk.E+tk.W+tk.S)
        throwaway = tk.Button(self.choicewin, text='⮄', command=self.fastLeft)
        throwaway.grid(row=3, column=1, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=2, column=2, columnspan=2, rowspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Button(self.choicewin, text='⇥', command=self.slowRight)
        throwaway.grid(row=2, column=4, sticky=tk.N+tk.E+tk.W+tk.S)
        throwaway = tk.Button(self.choicewin, text='⮆', command=self.fastRight)
        throwaway.grid(row=3, column=4, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=4, column=1, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Button(self.choicewin, text='⮇', command=self.fastDown)
        throwaway.grid(row=4, column=2, sticky=tk.N+tk.E+tk.W+tk.S)
        throwaway = tk.Button(self.choicewin, text='⤓', command=self.slowDown)
        throwaway.grid(row=4, column=3, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=4, column=4, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=0, column=5, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=0, column=6, columnspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Button(self.choicewin, text='△\n▽', command=self.taller)
        throwaway.grid(row=1, column=6, sticky=tk.N+tk.E+tk.W+tk.S)
        throwaway = tk.Button(self.choicewin, text='▽\n△', command=self.shorter)
        throwaway.grid(row=1, column=7, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Button(self.choicewin, text='Done', command=self.done)
        throwaway.grid(row=2, column=6, columnspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Button(self.choicewin, text='▷ ◁', command=self.narrower)
        throwaway.grid(row=3, column=6, sticky=tk.N+tk.E+tk.W+tk.S)
        throwaway = tk.Button(self.choicewin, text='◁ ▷', command=self.wider)
        throwaway.grid(row=3, column=7, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=4, column=6, columnspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=0, column=8, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choicewin)
        throwaway.grid(row=5, column=4, columnspan=9, sticky=tk.N+tk.E+tk.W+tk.S)

        HEIGHT = 300
        WIDTH = 300
        frame2 = tk.Frame(self.choicewin, width=WIDTH, height=HEIGHT, bg="#000000")
        frame2.grid(row=6, column=0, columnspan=9, sticky=tk.N+tk.E+tk.W+tk.S)

        self.canvas = tk.Canvas(frame2, bg='#000000',width=300,height=300,scrollregion=(0,0,300,300))
        self.image_container = self.canvas.create_image(0, 0, anchor="nw")

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

        self.img = Image.open(imagePath)
        if self.img.width<dimensions[2] or self.img.height<dimensions[3]:
            #if the image is smaller than dimensions required, we need to let the user know
            mb.showerror(title="Image too small", message="(Un)checked icons should be at LEAST the size of the widget:\n("+str(dimensions[2])+", "+str(dimensions[3])+")", parent=self.choicewin)
            self.choicewin.destroy()
            return
        
        self.tkImg = ImageTk.PhotoImage(self.img)

        self.canvas.itemconfig(self.image_container, image=self.tkImg)
        self.canvas.config(scrollregion=(0,0,self.img.width,self.img.height))
        self.canvas.update()

        self.dimensions = dimensions
        if self.dimensions[0]==-1 and self.dimensions[1]==-1:
            self.location = [int((self.img.width-self.dimensions[2])/2),int((self.img.height-self.dimensions[3])/2)]
            self.dimensions[0] = self.location[0]
            self.dimensions[1] = self.location[1]
        else:
            self.location = [self.dimensions[0], self.dimensions[1]]
        self.overlay=None
        self.updateOverlay()
        self.success=True

    def done(self):
        self.choicewin.destroy()

    def narrower(self):
        self.dimensions[2] -= 1
        self.updateOverlay()

    def wider(self):
        self.dimensions[2] += 1
        self.updateOverlay()

    def shorter(self):
        self.dimensions[3] -= 1
        self.updateOverlay()

    def taller(self):
        self.dimensions[3] += 1
        self.updateOverlay()

    def slowLeft(self):
        self.location[0] -= 1
        self.updateOverlay()

    def fastLeft(self):
        self.location[0] -= 5
        self.updateOverlay()

    def slowRight(self):
        self.location[0] += 1
        self.updateOverlay()

    def fastRight(self):
        self.location[0] += 5
        self.updateOverlay()

    def slowUp(self):
        self.location[1] -= 1
        self.updateOverlay()

    def fastUp(self):
        self.location[1] -= 5
        self.updateOverlay()

    def slowDown(self):
        self.location[1] += 1
        self.updateOverlay()

    def fastDown(self):
        self.location[1] += 5
        self.updateOverlay()

    def updateOverlay(self):
        if self.overlay:
            # delete the existing overlay
            self.canvas.delete(self.overlay.imageID)
        else:
            # creates the baseline image
            fill="#ff0000"
            alpha = 128
            fill = self.choicewin.winfo_rgb(fill) + (alpha,)
            image = Image.new('RGBA', (self.dimensions[2], self.dimensions[3]), fill)
            self.overlay = ImageTk.PhotoImage(image)

        if self.location[0]<0:
            self.location[0]=0
        elif self.location[0]+self.dimensions[2]>self.img.width:
            self.location[0]=self.img.width-self.dimensions[2]

        if self.location[1]<0:
            self.location[1]=0
        elif self.location[1]+self.dimensions[3]>self.img.height:
            self.location[1]=self.img.height-self.dimensions[3]

        #TODO what in the world is going on? Why does it need a +1/2 size of overlay
        self.overlay.imageID = self.canvas.create_image(self.location[0]+int(self.dimensions[2]/2), self.location[1]+int(self.dimensions[3]/2), image=self.overlay)
