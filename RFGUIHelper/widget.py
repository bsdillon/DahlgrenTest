import tkinter as tk
from tkinter import messagebox, ttk, OptionMenu
from PIL import ImageTk
from imageUpdate import ImageUpdater
from valuebuttons import ValueButtons
from fontselector import FontSelector

WidgetTypes = {
    'Anchor': ['Image file name'],
    'MovePoint': ['Image file name'],
    'Button': [],
    'Radio Button': ['Value', 'Group'],
    'Tab': ['Group', 'Font'],
    'Text Field': ['Font'],
    'List': ['Font'],
    'Label': ['Font'],
    'Scroll Bar': [],
    'Dropdown': ['Font'],
    'Check Box': [],
}

YetiImports = {
    'Anchor': ['from yeti.anchor import TitleBar'],
    'MovePoint': ['from yeti.anchor import TitleBar'],
    'Button': ['from yeti.button import Button'],
    'Radio Button': ['from yeti.radiobutton import RadioButton', 'from ads_window.widget.Checkbox import Checkbox'],
    'Tab': ['from yeti.button import Button', 'from yeti.tabs import Tabs'],
    'Text Field': ['from yeti.textentry import TextEntry'],
    'List': ['from yeti.List import StatelessList'],
    'Label': ['from yeti.label import Label'],
    'Scroll Bar': [''],
    'Dropdown': ['from ads_window.widget.DropdownMenu import StatelessDropdownMenu'],
    'Check Box': ['from ads_window.widget.Checkbox import Checkbox']
}

YetiTypes = {
    'Anchor': 'TitleBar',
    'MovePoint': 'TitleBar',
    'Button': 'Button',
    'Radio Button': 'Checkbox',
    'Tab': 'Button',
    'Text Field': 'TextEntry',
    'List': 'StatelessList',
    'Label': 'Label',
    'Scroll Bar': '',
    'Dropdown': 'StatelessDropdownMenu',
    'Check Box': 'Checkbox'
}

YetiEnabled = [
    'Anchor',
    'MovePoint',
    'Button',
    'Radio Button',
    'Tab',
    'Text Field',
    'List',
    'Label',
    'Dropdown',
    'Check Box'
]

NormalEnabled = [
    'Anchor',
    'MovePoint',
    'Button',
    'Radio Button',
    'Text Field',
    'Scroll Bar',
    'Dropdown',
    'Check Box'
]

class Widget():
    def __init__(self, type, x, y, width, height):
        self.editor = None
        self.attributes={}
        self.attributes["name"]=""
        self.attributes["type"]=type
        self.attributes["X"]=x
        self.attributes["Y"]=y
        self.attributes["width"]=width
        self.attributes["height"]=height

        #based on type, add attributes; then edit it
        for k in WidgetTypes[type]:
            self.attributes[k] = ""

    def hasValue(self, key):
        return (key in self.attributes)

    def getValue(self, key):
        if key in self.attributes:
            return self.attributes[key]
        raise KeyError(key+" is not in "+self.attributes["name"])

    def setValue(self, key, value):
        if key in self.attributes:
            self.attributes[key] = value

    def __str__(self):
        return str(self.attributes)

    def to_dict(self):
        return self.attributes

    @staticmethod
    def FromDictionary(dict):
        w = Widget(dict["type"], dict["X"], dict["Y"], dict["width"], dict["height"])
        for k in dict.keys():
            w.setValue(k, dict[k])

        return w

class WidgetEditor:
    lastWidget = None

    @staticmethod
    def Edit(widget:Widget, parent, imageUpdater:ImageUpdater, reviseWidget=False, yetiType=False):
        #TODO I would like to instantiate without init. Defend against creating
        # the editor without calling this static method. Not sure how to do that.
        WidgetEditor(widget, parent, imageUpdater, reviseWidget, yetiType=yetiType)
        parent.wait_window(widget.editor.window)

        if widget.editor.completed == EditorState.COMPLETE:
            WidgetEditor.lastWidget = widget.getValue("type")
            imageUpdater.updateImage(widget)

            #the process was completed and a new widget is ready
            if widget.hasValue('Image file name'):
                #Any widget that needs to save the image file
                fileName = widget.getValue('Image file name')

                #TODO better sanitization of filename
                fileName = fileName.replace(" ","_")

                #add extension
                tmp = fileName.find(".")
                if tmp == -1:
                    tmp = len(fileName)
                fileName = fileName[0:tmp]+".png"

                #finalize the name of the file and save
                widget.setValue('Image file name', fileName)

    def __init__(self, widget:Widget, parentWindow, imageUpdater:ImageUpdater, revision, yetiType=False):
        self.widget = widget
        self.widgetList = NormalEnabled
        if yetiType:
            self.widgetList = YetiEnabled
        widget.editor = self
        span = 2
        if revision:
            span = 3
        self.window = tk.Toplevel(parentWindow)
        self.imageUpdater = imageUpdater
        self.tkImage = ImageTk.PhotoImage(self.widget.image)       

        HEIGHT = 600
        WIDTH = 600
        self.window.rowconfigure(0,weight=1)

        self.imageSmall = True
        self.tkLabel = tk.Label(self.window, image=self.tkImage)
        self.tkLabel.bind("<Button-1>",self.imageSizeToggle)
        self.tkLabel.pack(side="left", fill="both", expand=True)
        self.tkLabel.grid(row=0, column=0, columnspan=span)

        self.frame = tk.Frame(self.window, width=WIDTH, height=HEIGHT)
        self.frame.grid(row=1, column=0, columnspan=span)
        self.frame.columnconfigure(2,weight=1)

        self.buildEditorTable()
        
        #add/update button revises the attributes of the object and then destroys the popup
        if revision:
            throwaway = tk.Button(self.window, text='Update', command=self.update)
        else:
            throwaway = tk.Button(self.window, text='Add', command=self.update)
        throwaway.grid(row=2, column=0)

        if revision:
            throwaway = tk.Button(self.window, text='Delete', command=self.delete)
            throwaway.grid(row=2, column=1)

        throwaway = tk.Button(self.window, text='Cancel', command=self.cancel)
        throwaway.grid(row=2, column=span-1)

        if (not revision) and (not WidgetEditor.lastWidget==None):
            #widget.setValue("type",WidgetEditor.lastWidget)
            self.type.set(WidgetEditor.lastWidget)
            self.changeType(None)
        
    def buildEditorTable(self):
        #only make it sensetive AFTER the thing is built
        self.sensetive = False
        self.completed = EditorState.CANCELLED  #default state

        #add header to table
        throwaway = tk.Label(self.frame, text="Attribute")
        throwaway.grid(row=0, column=0)

        throwaway = tk.Label(self.frame, text="")
        throwaway.grid(row=0, column=1)

        throwaway = tk.Label(self.frame, text="Value")
        throwaway.grid(row=0, column=2)

        self.entries={}
        self.type = tk.StringVar()
        #for each row add the label and an entry
        r = 1
        imageBounds = self.imageUpdater.getImageBounds()
        for key in self.widget.attributes:
            throwaway = tk.Label(self.frame, text=key)
            throwaway.grid(row=r, column=0)

            tmpLabel = tk.Label(self.frame, text="")
            tmpLabel.grid(row=r, column=1)

            if key=="type":
                #type only is based on a specific enumeration so we limit it accordingly.
                throwaway = OptionMenu(self.frame, self.type, *(self.widgetList), command=self.changeType)
                self.type.set(self.widget.attributes[key])
            elif key == 'X':
                throwaway = ValueButtons(self.frame, 0, imageBounds[0], int(self.widget.attributes[key]), callback=self.changeImage)
            elif key == 'Y':
                throwaway = ValueButtons(self.frame, 0, imageBounds[1], int(self.widget.attributes[key]), callback=self.changeImage)
            elif key == 'width':
                throwaway = ValueButtons(self.frame, 0, imageBounds[0]-int(self.widget.attributes["X"]), int(self.widget.attributes[key]), callback=self.changeImage)
            elif key == 'height':
                throwaway = ValueButtons(self.frame, 0, imageBounds[1]-int(self.widget.attributes["Y"]), int(self.widget.attributes[key]), callback=self.changeImage)
            elif key == 'Font':
                throwaway = FontSelector(self.frame, self.widget.attributes[key])
            else:
                throwaway = ttk.Entry(self.frame, width=20)
                throwaway.insert(0, self.widget.attributes[key])
                throwaway.config({"background": "#00aaff"})

            throwaway.grid(row=r, column=2, sticky=tk.E+tk.W)
            self.entries[key] = throwaway
            r = r+2

        #only make it sensetive AFTER the thing is built
        self.sensetive = True

    def changeImage(self, _):
        if self.sensetive:
            self.sensetive = False
            widthDim = int(self.entries['width'].get())
            heightDim = int(self.entries['height'].get())
            image = self.imageUpdater.cropImage(
                                            int(self.entries['X'].get()),
                                            int(self.entries['Y'].get()),
                                            widthDim,
                                            heightDim)
            imageBounds = self.imageUpdater.getImageBounds()
            width = imageBounds[0]-int(self.entries['X'].get())
            self.entries['width'].resetRange(0, width, min(width,int(self.entries['width'].get())))
            height = imageBounds[1]-int(self.entries['Y'].get())
            self.entries['height'].resetRange(0, height, min(height,int(self.entries['height'].get())))
            size = 2
            if not self.imageSmall:
                image = image.resize((widthDim*size , heightDim*size))
            self.tkImage = ImageTk.PhotoImage(image)
            self.tkLabel.config(image=self.tkImage)
            self.sensetive = True

    def imageSizeToggle(self, _):
        width = int(self.entries['width'].get())
        height = int(self.entries['height'].get())
        image = self.imageUpdater.cropImage(
                                        int(self.entries['X'].get()),
                                        int(self.entries['Y'].get()),
                                            width,
                                            height)
        self.imageSmall = not self.imageSmall
        size = 2
        if not self.imageSmall:
            image = image.resize((width*size , height*size))
        self.tkImage = ImageTk.PhotoImage(image)
        self.tkLabel.config(image=self.tkImage)

    def changeType(self, _):
        oldType = WidgetTypes[self.widget.attributes["type"]]
        newType = WidgetTypes[self.type.get()]
        for key in self.entries:
            if (key in oldType) and (not key in newType):
                #this one is being removed
                del self.widget.attributes[key]
            else:
                #this one is in both
                if key=="type":
                    self.widget.attributes[key] = self.type.get()
                else:
                    self.widget.attributes[key] = self.entries[key].get()

        for k in newType:
            if not (k in self.widget.attributes):
                self.widget.attributes[k] = ""

        for component in self.frame.winfo_children():
            component.destroy()
        self.buildEditorTable()

    def update(self):
        for key in self.entries:
            value = ""
            if key=="type":
                value = self.type.get()
            else:
                value = str(self.entries[key].get())

            #error check on entries
            if len(value)==0:
                messagebox.showerror(title="Widget Error", message="You must give a value for "+key, parent=self.window)
                return

            #update the widget
            self.widget.attributes[key] = value

        #close the windows
        self.completed = EditorState.COMPLETE
        self.window.destroy()

    def delete(self):
        self.completed = EditorState.DELETED
        self.window.destroy()

    def cancel(self):
        self.completed = EditorState.CANCELLED
        self.window.destroy()

class EditorState:
    CANCELLED = 0
    COMPLETE = 1
    DELETED = 2
