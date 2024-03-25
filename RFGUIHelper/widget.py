import tkinter as tk
from tkinter import messagebox, ttk, OptionMenu
from PIL import ImageTk
from imageUpdate import ImageUpdater
from valuebuttons import ValueButtons
from imageselection import ImageSelection
from fontselector import FontSelector
from widgeterror import WidgetError

# LEGACY TYPES
# Scroll Bar
# Dropdown

WidgetTypes = {
    'Button': ['Link'],
    'Text Field': [],
    'Label': [],
    'List': ['Group'],
    'Tab': ['Group', 'Link'],
    'Check Box': ['Checked', 'Unchecked'],
    'Radio Button': ['Value', 'Group', 'Checked', 'Unchecked'],
    'Scroll Button': ['Group','Direction'],
    'Anchor': ['Image file name'],
    'MovePoint': ['Image file name'],
}


class Widget():
    def __init__(self, type, view, x, y, width, height):
        self.editor = None
        self.attributes={}
        self.attributes["name"]=""
        self.attributes["view"]=view
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
        w = Widget(dict["type"], dict["view"], dict["X"], dict["Y"], dict["width"], dict["height"])
        for k in dict.keys():
            w.setValue(k, dict[k])

        return w

class WidgetEditor:
    lastWidget = None
    foreignWidget = False
    viewUpdate = [None,0,0]

    def __init__(self):
        pass

    @staticmethod
    def CreateCrash():
        instance = WidgetEditor()
        instance.completed = EditorState.CANCELLED
        return instance

    @staticmethod
    def CreateEditor(widget:Widget, parentWindow, imageUpdater:ImageUpdater, revision=False, isForeign=False):
        instance = WidgetEditor()
        WidgetEditor.foreignWidget = isForeign

        instance.checkWidget = None # this is exclusively used to allow location-based changes to check/uncheck buttons
        instance.widget = widget
        instance.widgetList = list(WidgetTypes.keys())
        instance.widget.editor = instance
        span = 2
        if revision:
            span = 3
        instance.window = tk.Toplevel(parentWindow)
        instance.window.title("Widget Editor")
        instance.window.attributes('-topmost',1)
        instance.imageUpdater = imageUpdater
        xTmp = int(instance.widget.attributes['X'])
        yTmp = int(instance.widget.attributes['Y'])
        wTmp = int(instance.widget.attributes['width'])
        hTmp = int(instance.widget.attributes['height'])
        if WidgetEditor.foreignWidget:
            # we want to update imported images from your current view
            instance.tkImage = instance.imageUpdater.cropImage(xTmp, yTmp, wTmp, hTmp)
        else:
            instance.tkImage = instance.imageUpdater.cropImage(xTmp, yTmp, wTmp, hTmp, specificView=instance.widget.getValue("view"))

        HEIGHT = 300
        WIDTH = 225
        instance.window.geometry(str(WIDTH)+'x'+str(HEIGHT))
        instance.window.rowconfigure(0,weight=1)

        instance.imageSmall = True
        instance.tkLabel = tk.Label(instance.window, image=instance.tkImage)
        instance.tkLabel.bind("<Button-1>",instance.imageSizeToggle)
        instance.tkLabel.pack(side="left", fill="both", expand=True)
        instance.tkLabel.grid(row=0, column=0, columnspan=span)

        instance.frame = tk.Frame(instance.window, width=WIDTH, height=HEIGHT)
        instance.frame.grid(row=1, column=0, columnspan=span)
        instance.frame.columnconfigure(2,weight=1)

        try:
            instance.buildEditorTable()
        except WidgetError as we:
            instance.window.destroy()
            raise WidgetError("Cannot create/edit widget\n"+str(we))

        #add/update button revises the attributes of the object and then destroys the popup
        if revision or WidgetEditor.foreignWidget:
            throwaway = tk.Button(instance.window, text='Update', command=instance.update)
        else:
            throwaway = tk.Button(instance.window, text='Add', command=instance.update)
        throwaway.grid(row=2, column=0)

        if revision and (not WidgetEditor.foreignWidget):
            throwaway = tk.Button(instance.window, text='Delete', command=instance.delete)
            throwaway.grid(row=2, column=1)

        throwaway = tk.Button(instance.window, text='Cancel', command=instance.cancel)
        throwaway.grid(row=2, column=span-1)

        if (not revision) and (not WidgetEditor.lastWidget==None):
            #widget.setValue("type",WidgetEditor.lastWidget)
            instance.type.set(WidgetEditor.lastWidget)
            instance.changeType(None)
        return instance

    def setLocation(self, x, y):
        self.window.geometry("+%d+%d" %(x,y))

    def getLocation(self):
        return [self.window.winfo_x(), self.window.winfo_y()]

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

            try:
                if key=="type":
                    #type only is based on a specific enumeration so we limit it accordingly.
                    throwaway = OptionMenu(self.frame, self.type, *(self.widgetList), command=self.changeType)
                    self.type.set(self.widget.attributes[key])
                    if WidgetEditor.foreignWidget:
                        throwaway.configure(state=tk.DISABLED)
                elif key == 'X':
                    throwaway = ValueButtons(self.frame, 0, imageBounds[0], int(self.widget.attributes[key]), callback=self.changeImage, validateBounds=(not WidgetEditor.foreignWidget))
                elif key == 'Y':
                    throwaway = ValueButtons(self.frame, 0, imageBounds[1], int(self.widget.attributes[key]), callback=self.changeImage, validateBounds=(not WidgetEditor.foreignWidget))
                elif key == 'width':
                    throwaway = ValueButtons(self.frame, 0, imageBounds[0]-int(self.widget.attributes["X"]), int(self.widget.attributes[key]), callback=self.changeImage, validateBounds=(not WidgetEditor.foreignWidget))
                    if WidgetEditor.foreignWidget:
                        throwaway.disable()
                elif key == 'height':
                    throwaway = ValueButtons(self.frame, 0, imageBounds[1]-int(self.widget.attributes["Y"]), int(self.widget.attributes[key]), callback=self.changeImage, validateBounds=(not WidgetEditor.foreignWidget))
                    if WidgetEditor.foreignWidget:
                        throwaway.disable()
                elif key=='Checked':
                    #source Image;local image;left;top;right;bottom
                    data = [None,None,-1,-1,int(self.widget.attributes['X'])+int(self.widget.attributes['width']),int(self.widget.attributes['Y'])+int(self.widget.attributes['height'])]
                    if self.widget.attributes['Checked']:
                        data = self.widget.attributes['Checked'].split(';')
                    self.checkWidget = ImageSelection(self.frame, self.imageUpdater.getImageSavePath(), self.widget.attributes['name'], data, uncheckedType=False, callback=self.checkedImage)
                    throwaway = self.checkWidget

                    if self.widget.attributes['name']:
                        self.checkWidget.enable()
                    else:
                        self.checkWidget.disable()

                    if WidgetEditor.foreignWidget:
                        self.checkWidget.disable()
                elif key=='Unchecked':
                    #source Image;local image;left;top;right;bottom
                    data = [None,None,int(self.widget.attributes['X']),int(self.widget.attributes['Y']),int(self.widget.attributes['X'])+int(self.widget.attributes['width']),int(self.widget.attributes['Y'])+int(self.widget.attributes['height'])]
                    if self.widget.attributes['Unchecked']:
                        data = self.widget.attributes['Unchecked'].split(';')
                    self.uncheckWidget = ImageSelection(self.frame, self.imageUpdater.getImageSavePath(), self.widget.attributes['name'], data, callback=self.uncheckedImage)
                    throwaway = self.uncheckWidget

                    if self.widget.attributes['name']:
                        self.uncheckWidget.enable()
                    else:
                        self.uncheckWidget.disable()

                    if WidgetEditor.foreignWidget:
                        self.uncheckWidget.disable()
                elif key == 'Font':
                    throwaway = FontSelector(self.frame, self.widget.attributes[key])
                    if WidgetEditor.foreignWidget:
                        throwaway.configure(state=tk.DISABLED)
                elif key == "view":
                    throwaway = ttk.Entry(self.frame, width=20)
                    throwaway.insert(0, self.widget.attributes[key])
                    throwaway.config({"background": "#00aaff"})
                    throwaway.configure(state=tk.DISABLED)
                elif key == "Direction":
                    self.dirVar = tk.StringVar()
                    throwaway = ttk.Combobox(self.frame, textvariable=self.dirVar)
                    directions = ["North","East","South","West"]
                    throwaway['values'] = directions
                    value = self.widget.attributes[key]
                    if not (value in directions):
                        self.dirVar.set(value) # default option
                    throwaway.bind("<<ComboboxSelected>>", self.directionChanged)
                    if WidgetEditor.foreignWidget:
                        throwaway.configure(state=tk.DISABLED)
                elif key == "Link":
                    self.linkVar = tk.StringVar()
                    throwaway = ttk.Combobox(self.frame, textvariable=self.linkVar)
                    views = self.imageUpdater.getViewList()
                    views.insert(0, "<None>")
                    throwaway['values'] = views
                    value = self.widget.attributes[key]
                    if not (value in views):
                        value = "<None>"
                    self.linkVar.set(value) # default option
                    throwaway.bind("<<ComboboxSelected>>", self.linkChanged)
                    if WidgetEditor.foreignWidget:
                        throwaway.configure(state=tk.DISABLED)
                elif key == "name":
                    self.nameWidget = ttk.Entry(self.frame, width=20)
                    throwaway = self.nameWidget
                    throwaway.bind("<KeyRelease>", self.nameChanged)
                    throwaway.insert(0, self.widget.attributes[key])
                    throwaway.config({"background": "#00aaff"})
                    if WidgetEditor.foreignWidget:
                        throwaway.configure(state=tk.DISABLED)
                else:
                    throwaway = ttk.Entry(self.frame, width=20)
                    throwaway.insert(0, self.widget.attributes[key])
                    throwaway.config({"background": "#00aaff"})
                    if WidgetEditor.foreignWidget:
                        throwaway.configure(state=tk.DISABLED)
            except WidgetError as we:
                raise WidgetError("Problem with widget["+key+"]: "+str(we))

            throwaway.grid(row=r, column=2, sticky=tk.E+tk.W)
            self.entries[key] = throwaway
            r = r+2

        #only make it sensetive AFTER the thing is built
        self.sensetive = True

    def nameChanged(self, _):
        name = self.nameWidget.get()
        self.widget.attributes["name"] = name
        if self.checkWidget: # if we have checked/unchecked we have to madify the name and file
            self.checkWidget.enable()
            self.uncheckWidget.enable()
            self.checkWidget.updateName(name)
            self.uncheckWidget.updateName(name)

    def linkChanged(self, _):
        self.widget.attributes["Link"] = self.linkVar
        pass

    def directionChanged(self, _):
        self.widget.attributes["Direction"] = self.dirVar
        pass

    def checkedImage(self):
        value = self.checkWidget.saveImage()
        self.widget.attributes["Checked"]=value

    def uncheckedImage(self):
        value = self.uncheckWidget.saveImage()
        self.widget.attributes["Unchecked"]=value

    def changeImage(self, _):
        if self.sensetive:
            self.sensetive = False
            self.updateTkImage()

            imageBounds = self.imageUpdater.getImageBounds()
            width = imageBounds[0]-int(self.entries['X'].get())
            self.entries['width'].resetRange(0, width, min(width,int(self.entries['width'].get())))
            height = imageBounds[1]-int(self.entries['Y'].get())
            self.entries['height'].resetRange(0, height, min(height,int(self.entries['height'].get())))

            if self.checkWidget: # if we have checked/unchecked we have to madify the dimensions
                dims = [int(self.widget.attributes['X']), int(self.widget.attributes['Y']), int(self.widget.attributes['width']), int(self.widget.attributes['height'])]
                self.widget.attributes["Checked"] = self.checkWidget.saveImage(newDims=dims)
                self.widget.attributes["Unchecked"] = self.uncheckWidget.saveImage(newDims=dims)

            self.sensetive = True

    def imageSizeToggle(self, _):
        self.imageSmall = not self.imageSmall
        self.updateTkImage()

    def updateTkImage(self):
        width = int(self.entries['width'].get())
        self.widget.attributes['width']=width
        height = int(self.entries['height'].get())
        self.widget.attributes['height']=height
        xTmp = int(self.entries['X'].get())
        yTmp = int(self.entries['Y'].get())
        if WidgetEditor.foreignWidget:
            # we want to update imported images from your current view
            cropped = self.imageUpdater.cropImage(
                                            xTmp,
                                            yTmp,
                                            width,
                                            height,
                                            tkImage=False)
        else:
            cropped = self.imageUpdater.cropImage(
                                            xTmp,
                                            yTmp,
                                            width,
                                            height,
                                            tkImage=False,
                                            specificView=self.widget.getValue("view"))

        size = 2
        if not self.imageSmall:
            cropped = cropped.resize((width*size , height*size))
        self.tkImage = ImageTk.PhotoImage(cropped)
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
        if WidgetEditor.foreignWidget:
            dx = int(self.entries['X'].get())-int(self.widget.attributes['X'])
            dy = int(self.entries['Y'].get())-int(self.widget.attributes['Y'])
            WidgetEditor.viewUpdate = [self.widget.attributes['view'], dx, dy]
        else:
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
            WidgetEditor.viewUpdate = [None, 0, 0]

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
