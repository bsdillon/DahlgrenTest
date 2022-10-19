import tkinter as tk
from tkinter import OptionMenu, StringVar, Canvas, filedialog as fd
from PIL import ImageTk, ImageGrab

# SECOND WINDOW
# This window is for displaying the image that will be scraped for item coordinates

class ImageWindow():
    def __init__(self, master):
        HEIGHT = 300
        WIDTH = 300

        top = tk.Toplevel()
        self.top = top

        frame2 = tk.Frame(top, width=WIDTH, height=HEIGHT)
        frame2.grid()

        addImage = tk.Button(frame2, text='Click to Open File', command=self.loadImage)
        addImage.grid(row=0, column=0)

        self.selectPoints = tk.Button(frame2, text='Start Selecting Points', command=self.togglePointSelection)
        self.selectPoints.grid(row=0, column=1)

        self.variable = StringVar(top)
        self.variable.set('Type')
        dropdown = OptionMenu(frame2, self.variable, 'Anchor', 'Button', 'Radio Button',
                            'Widget', 'Tab', 'Text Field', 'Scroll Bar', 'Dropdown', 'Checkbox')
        dropdown.grid(row=0, column=2)

        self.master = master
        self.pointSelectionStatus = False

        self.count = 0
        self.second_count = 0
        self.firstCoord = [-1,-1]
        self.secondCoord = [-1,-1]

        self.canvas = Canvas(frame2, bg='#2FF2FF', width=500,
                        height=300, scrollregion=(0, 0, 600, 600))

        self.canvas.grid(row=1, column=0, columnspan=3)

        self.canvas.update()

        # Add image to the Canvas Items
        # canvas.create_image(0,0,anchor=tk.NW)
        self.image_container = self.canvas.create_image(0, 0, anchor="nw")

        self.canvas.update()
        top.bind("<Button 2>", self.firstClick)
        top.bind("<Button 1>", self.getCords)

    def start(self):
        self.top.mainloop()

    def loadImage(self):
        name = fd.askopenfilename()
        img = ImageTk.PhotoImage(file=name)
        self.img = img
        print(name)
        self.canvas.config(height=img.height(), width=img.width())
        print("img w/h: " + str(img.width()), str(img.height()))
        self.canvas.itemconfig(self.image_container, image=img)
        self.canvas.config(height=img.height(), width=img.width())
        self.canvas.update()
        print(str(self.canvas.winfo_width()) + " " + str(self.canvas.winfo_height()))

    def togglePointSelection(self):
        if self.pointSelectionStatus == False:
            self.pointSelectionStatus = True
            self.selectPoints.config(text="Stop Selecting Points")
        else:
            self.pointSelectionStatus = False
            self.selectPoints.config(text="Start Selecting Points")

    def firstClick(self, eventorigin):
        x0 = eventorigin.x
        y0 = eventorigin.y
        # print("Corner 1",x0,y0, variable.get())
        self.firstCoord = [x0, y0]
        return x0, y0

    def secondClick(self, eventorigin):
        x0 = eventorigin.x
        y0 = eventorigin.y
        # print("Corner 2",x0,y0, variable.get())
        self.secondCoord = [x0, y0]
        return x0, y0

    def getCords(self, eventorigin):
        if self.pointSelectionStatus:
            if self.count == 0:
                self.firstClick(eventorigin)
                self.count = self.count+1
            else:
                self.secondClick(eventorigin)
                self.canvas.update()
                coords = self.firstCoord + self.firstCoord
                self.master.newTableEntry(coords, self.variable.get())
                # master.widget_list[master.second_count].print()
                self.second_count += 1
                offX, offY = self.canvas.winfo_rootx(), self.canvas.winfo_rooty()
                self.canvas.update()
                # print(x,y)

                if self.variable.get() == "Anchor":
                    small_pic = ImageGrab.grab(
                        bbox=(coords[0]+offX, coords[1]+offY, coords[2]+offX, coords[3]+offY))
                    small_pic.save(self.anchorFileName.get() + ".png")
                    small_pic.show()
                self.count = 0
                # capture()

                # save_canvas()

    def capture(self):
        self.canvas.update()
        x0 = self.canvas.winfo_rootx()
        y0 = self.canvas.winfo_rooty()
        x1 = x0 + self.canvas.winfo_width()
        y1 = y0 + self.canvas.winfo_height()
        # print(x0, y0, x1, y1)
        # print(canvas.winfo_screenheight(), canvas.winfo_screenwidth())
        im = ImageGrab.grab((x0, y0, x1, y1))
        im.save(self.master.anchorFileName.get() + '.png')  # Can also say im.show() to display it
        # im.show()
