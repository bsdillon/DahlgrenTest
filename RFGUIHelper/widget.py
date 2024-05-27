import tkinter as tk
from tkinter import messagebox, ttk, OptionMenu
from PIL import ImageTk
from imageUpdate import ImageUpdater
from valuebuttons import ValueButtons
from imageselection import ImageSelection
from widgeterror import WidgetError
from namechecker import NameChecker
import random
from logmanagement import LogManager

# LEGACY TYPES
# Scroll Bar
# Dropdown

WIDGET_TYPES = {
    'Button': ['Link'],
    'Text Field': [],
    'Label': [],
    'List': ['Group'],
    'Tab': ['Group', 'Link'],
    'Check Box': ['Checked', 'Unchecked'],
    'Radio Button': ['Value', 'Group', 'Checked', 'Unchecked'],
    'Scroll Button': ['Group','Direction'],
    'Anchor': [],
    'MovePoint': [],
}

class Widget():
    '''
    Widget is a logical representation of a button or other GUI element on the screen.
    All widgets have a location (x,y) and dimensions (width, height). They also have 
    a name, a type, and a native view. All other fields vary based on the type.
    
    Functions in this class mainly deal with accessing these properties and transitions
    between Widget objects and a dictionary representation.
    '''
    
    def __init__(self, type, view, x, y, width, height):
        '''
        Constructs a widget with values for all common fields. Other fields
        are added depending on the requirements of the specified type.        
        '''
        self.logger = LogManager("Widget")
        self.logger.trace(f"Start Widget load", indent_delta=1)

        #seen only in string representation to distinguish otherwise identical objects.
        self.uniqueID=random.randint(1,1000)

        # default type
        if len(type)==0:
            type="Anchor"


        #start the attributes, adding attributes based on type
        self.attributes={}
        for k in WIDGET_TYPES[type]:
            self.attributes[k] = ""

        #adding default values
        self.attributes["name"]=""
        self.attributes["view"]=view
        self.attributes["type"]=type
        self.attributes["X"]=x
        self.attributes["Y"]=y
        self.attributes["width"]=width
        self.attributes["height"]=height

        self.logger.debug(f"All members: {self}")
        self.logger.trace(f"End Widget load", indent_delta=-1)

    def has_value(self, key):
        '''
        Returns True if the key exists in this widget; False otherwise.
        '''
        return (key in self.attributes)

    def get_value(self, key):
        '''
        Returns the value for a given key within the widget
        
        get_value is not guaranteed to be failure free. If there is any question use
        has_value first.
        '''
        if key in self.attributes:
            return self.attributes[key]
        raise KeyError(key+" is not in "+self.attributes["name"])

    def set_value(self, key, value):
        '''
        Assigns value to the given key for this widget
        '''
        if key in self.attributes:
            self.attributes[key] = value

    def __str__(self):
        return "Widget("+str(self.uniqueID)+"): "+str(self.attributes)

    def to_dict(self):
        '''
        Returns a dictionary collection representing the Widget object.
        '''
        answer = self.attributes.copy()
        self.logger.debug(f"{self} vs {answer}")
        return answer

    def clone(self):
        '''
        Creates a second Widget object with the same values, but in different memory space.
        '''
        temp = self.widget.to_dict()
        return Widget.from_dictionary(temp)

    @staticmethod
    def from_dictionary(dict):
        '''
        Returns a Widget object derived from the given dictionary
        '''
        w = Widget(dict["type"], dict["view"], dict["X"], dict["Y"], dict["width"], dict["height"])
        for k in dict.keys():
            w.set_value(k, dict[k])

        return w

class WidgetEditor:
    FIXED_WIDTH = 100
    FIXED_HEIGHT = 175

    last_widget = None
    view_update = [None,0,0]

    def __init__(self):
        self.logger = LogManager("WidgetEditor")
        #no constructor necessary
        pass

    @staticmethod
    def create_crash():
        '''
        Creates an instance of the object expressly for the purpose of having a null value.
        References exclusively to show the editing failed.
        '''
        instance = WidgetEditor()
        instance.completed = EditorState.CANCELLED
        return instance

    @staticmethod
    def create_editor(widget_dictionary, name_checker:NameChecker, parent_window, image_updater:ImageUpdater, revision=False, is_foreign=False):
        '''
        Creates a modal window to edit the Widget itself.
        
        widget_dictionary - a dictionary representation of the Widget in question
        name_checker - role interface to validate new or updated widget names
        parent_window - TODO needs to be removed for dependency inversion (SOLID)
        image_updater - role interface to manage view/image editing
        revision - forces the editor to offer update and delete options instead of only add and cancel.
        is_foreign - forces the widget editor to only move the widget rather than edit its properties i.e. foreign widgets don't belong to me.
        '''
        instance = WidgetEditor()
        instance.logger.trace(f"Start WidgetEditor", indent_delta=1)

        instance.foreign_widget = is_foreign
        instance.is_revision = revision
        instance.original_name = widget_dictionary["name"]
        instance.name_checker = name_checker
        instance.image_updater = image_updater
        instance.widget = Widget.from_dictionary(widget_dictionary)

        instance.window = tk.Toplevel(parent_window)
        instance.window.transient(parent_window)
        instance.window.grab_set()
        instance.window.attributes('-topmost', 1) #TODO I added grab_set later; may be OBE
        instance.window.title("Widget Editor")

        #all editors have a fixed size.
        WIDTH = 530
        HEIGHT = 240
        instance.window.geometry(f"{WIDTH}x{HEIGHT}")
        instance.window.resizable(False, False)

        instance.logger.debug(f"Input Widget {instance.widget}")
        #GUI starts with a panel showing the relevant section fo the view
        xTmp = int(instance.widget.attributes['X'])
        yTmp = int(instance.widget.attributes['Y'])
        wTmp = int(instance.widget.attributes['width'])
        hTmp = int(instance.widget.attributes['height'])
        cropped = instance.size_image(xTmp, yTmp, wTmp, hTmp)
        instance.tk_image = ImageTk.PhotoImage(cropped)
        instance.tk_label = tk.Label(instance.window, image=instance.tk_image)
        instance.tk_label.pack(side="left", fill="both", expand=True)
        instance.window.rowconfigure(0,weight=1)
        instance.tk_label.grid(row=0, column=0, columnspan=3, sticky="NWES")

        #The editor table is an extensive and super-complete set of variables along with means
        #to edit them. It is a specialized subsection of the GUI.
        try:
            instance.build_editor_table()
        except WidgetError as we:
            instance.window.destroy()
            instance.logger.trace(f"End", indent_delta=-1)
            raise WidgetError("Cannot create/edit widget\n"+str(we))

        #add/update button revises the attributes of the object and then destroys the popup
        if revision or instance.foreign_widget:
            throwaway = tk.Button(instance.window, text='Update', command=instance.update)
        else:
            throwaway = tk.Button(instance.window, text='Add', command=instance.update)
        throwaway.grid(row=1, column=0)

        #delete button is only active for revisions
        if revision and (not instance.foreign_widget):
            throwaway = tk.Button(instance.window, text='Delete', command=instance.delete)
        else:
            throwaway = tk.Button(instance.window, text='Delete')
            throwaway.configure(state=tk.DISABLED)
        throwaway.grid(row=1, column=1)        

        throwaway = tk.Button(instance.window, text='Cancel', command=instance.cancel)
        throwaway.grid(row=1, column=2)

        #the GUI shoudl remember from editor to editor what the last widget type was
        #thus all buttons can be created rapidly without always setting the type
        if (not revision) and (not WidgetEditor.last_widget==None):
            instance.variables["type"].set(WidgetEditor.last_widget)
            instance.change_type(None)
        instance.logger.trace(f"End", indent_delta=-1)
        return instance

    def build_editor_table(self):
        '''
        Build editor creates a fixed set of GUI elements, gives them default configuration,
        and then updates them with specific characteristics of the Widget in question.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        
        #only make it sensitive AFTER the thing is built
        self.sensitive = False
        self.completed = EditorState.CANCELLED  #default state

        self.editor_table = ttk.Frame(self.window)
        self.gui_members={} # used to reference these GUI members by key rather than as a instance variable
        self.variables = {} # same for variables tied to various members.        
        labels={} # only used in this method to indiciate if the field is enabled or disabled for this type

        #left side contains headers and the only persistent fields common to all types.
        left_side = ttk.Frame(self.editor_table)
        left_side.grid(row=0, column=0)
        
        r = 1
        throwaway = tk.Label(left_side, text="")
        throwaway.grid(row=r, column=0)

        tmpLabel = tk.Label(left_side, text="")
        tmpLabel.grid(row=r, column=1)

        throwaway = tk.Label(left_side, text="Value")
        throwaway.grid(row=0, column=2, sticky="WE")

        labels["name"] = self.addLabels(left_side, "Name", r)
        self.variables["name"] = tk.StringVar()
        throwaway = ttk.Entry(left_side, width=20, textvariable=self.variables["name"])
        throwaway.bind("<KeyRelease>", self.name_changed)
        throwaway.configure(state=tk.DISABLED)
        self.set_live_label(labels["name"], False)
        throwaway.grid(row=r, column=2)
        self.gui_members["name"] = throwaway
        r = r+2

        labels["view"] = self.addLabels(left_side, "View", r)
        self.variables["view"] = tk.StringVar()
        tmpV = tk.Label(left_side, width=20, textvariable=self.variables["view"])
        tmpV.grid(row=r, column=2)
        self.gui_members["view"] = tmpV
        r = r+2

        labels["type"] = self.addLabels(left_side, "Type", r)
        self.variables["type"] = tk.StringVar()
        #type only is based on a specific enumeration so we limit it accordingly.
        throwaway = OptionMenu(left_side, self.variables["type"], *(list(WIDGET_TYPES.keys())), command=self.change_type)
        self.variables["type"].set("Anchor") # default option
        throwaway.configure(state=tk.DISABLED)
        self.set_live_label(labels["type"], False)
        throwaway.grid(row=r, column=2, sticky="WE")
        self.gui_members["type"] = throwaway
        r = r+2

        #these numeric values are implemented in a uniform manner
        attributes = ["X","Y","width","height"]
        for aName in attributes:
            labels[aName] = self.addLabels(left_side, aName, r)
            throwaway = ValueButtons(left_side, 0, 100, 0, callback=self.change_image, validateBounds=(not self.foreign_widget))
            throwaway.grid(row=r, column=2, sticky=tk.E+tk.W)
            throwaway.disable()
            self.set_live_label(labels[aName], False)
            self.gui_members[aName] = throwaway
            r = r+2

        #right side contains fields that variably apply to different types
        #these are loosely grouped by the editing method
        right_side = ttk.Frame(self.editor_table)
        right_side.grid(row=0, column=1, rowspan=2)
        
        labels["Group"] = self.addLabels(right_side, "Group", r)
        self.variables["Group"]=tk.StringVar()
        throwaway = ttk.Entry(right_side, width=20, textvariable=self.variables["Group"])
        throwaway.config({"background": "#00aaff"})
        throwaway.configure(state=tk.DISABLED)
        self.set_live_label(labels["Group"], False)
        throwaway.grid(row=r, column=2)
        self.gui_members["Group"] = throwaway
        r = r+2

        labels["Value"] = self.addLabels(right_side, "Value", r)
        self.variables["Value"]=tk.StringVar()
        throwaway = ttk.Entry(right_side, width=20, textvariable=self.variables["Value"])
        throwaway.config({"background": "#00aaff"})
        throwaway.configure(state=tk.DISABLED)
        self.set_live_label(labels["Value"], False)
        throwaway.grid(row=r, column=2)
        self.gui_members["Value"] = throwaway
        r = r+2

        labels["Link"] = self.addLabels(right_side, "Link", r)
        self.variables["Link"] = tk.StringVar()
        views = self.image_updater.get_view_list()
        views.insert(0, "<None>")
        throwaway = OptionMenu(right_side, self.variables["Link"], *(views), command=self.link_changed)
        self.variables["Link"].set("<None>") # default option
        throwaway.configure(state=tk.DISABLED)
        self.set_live_label(labels["Link"], False)
        throwaway.grid(row=r, column=2, sticky="WE")
        self.gui_members["Link"] = throwaway
        r = r+2

        labels["Direction"] = self.addLabels(right_side, "Direction", r)
        self.variables["Direction"] = tk.StringVar()
        directions = ["<None>","North","East","South","West"]
        tempOM = OptionMenu(right_side, self.variables["Direction"], *(directions), command=self.direction_changed)
        self.variables["Direction"].set("<None>") # default option
        tempOM.configure(state=tk.DISABLED)
        self.set_live_label(labels["Direction"], False)
        tempOM.grid(row=r, column=2, sticky="WE")
        self.gui_members["Direction"] = tempOM
        r = r+2

        #source Image;local image;left;top;right;bottom
        data = ImageSelection.get_default_data(int(self.widget.attributes['X']), int(self.widget.attributes['Y']), int(self.widget.attributes['width']), int(self.widget.attributes['height']))
        callback_list = {"Checked":self.checked_image , "Unchecked":self.unchecked_image}
        for txt in ["Checked","Unchecked"]:
            labels[txt] = self.addLabels(right_side, txt, r)
            tmp_is = ImageSelection(right_side, self.image_updater.get_image_save_path(), self.widget.attributes['name'], data.copy(), unchecked_type=False, callback=callback_list[txt])
            tmp_is.disable()
            self.set_live_label(labels[txt], False)
            tmp_is.grid(row=r, column=2, sticky="WE")
            self.gui_members[txt] = tmp_is
            r = r+2

        imageBounds = self.image_updater.get_image_bounds()
        for key in self.widget.attributes:
            try:
                self.logger.debug(f"Setting [{key}]={self.widget.attributes[key]}")
                if key == 'view':
                    # we NEVER enable view
                    self.variables[key].set(self.widget.attributes[key])
                if key in 'X':
                    self.gui_members[key].resetRange(0, imageBounds[0], int(self.widget.attributes[key]))
                    self.gui_members[key].enable()
                    self.set_live_label(labels[key], True)
                elif key == 'Y':
                    self.gui_members[key].resetRange(0, imageBounds[1], int(self.widget.attributes[key]))
                    self.gui_members[key].enable()
                    self.set_live_label(labels[key], True)
                elif key == 'width':
                    self.gui_members[key].resetRange(0, imageBounds[0]-int(self.widget.attributes["X"]), int(self.widget.attributes[key]))
                    if not self.foreign_widget:
                        self.gui_members[key].enable()
                        self.set_live_label(labels[key], True)
                elif key == 'height':
                    self.gui_members[key].resetRange(0, imageBounds[1]-int(self.widget.attributes["Y"]), int(self.widget.attributes[key]))
                    if not self.foreign_widget:
                        self.gui_members[key].enable()
                        self.set_live_label(labels[key], True)
                elif key in ['Checked','Unchecked']:
                    if self.widget.attributes[key]:
                        data = self.widget.attributes[key].split(';')
                        self.gui_members[key].configure_data(data)
                        
                    if not self.foreign_widget:
                        self.gui_members[key].enable()
                        self.set_live_label(labels[key], True)
                elif key in ["type","Link","Direction"]:
                    #default value is "<None>", but the "new" value is "" empty
                    if len(self.widget.attributes[key])>0: 
                        #we must have a non-empty value
                        self.variables[key].set(self.widget.attributes[key])

                    if not self.foreign_widget:
                        self.gui_members[key].configure(state="normal")
                        self.set_live_label(labels[key], True)
                else:
                    self.variables[key].set(self.widget.attributes[key])
                    if not self.foreign_widget:
                        self.gui_members[key].configure(state=tk.NORMAL)
                        self.set_live_label(labels[key], True)
            except WidgetError as we:
                raise WidgetError("Problem with widget["+key+"]: "+str(we))

        #only make it sensitive AFTER the thing is built
        self.sensitive = True
        
        self.editor_table.grid(row=0, column=3, rowspan=2)
        self.logger.trace(f"End", indent_delta=-1)

    def addLabels(self, panel, name, row):
        throwaway = tk.Label(panel, text=name)
        throwaway.grid(row=row, column=0, sticky="WE")

        tmpLabel = tk.Label(panel, text="")
        tmpLabel.grid(row=row, column=1)
        return throwaway

    def set_live_label(self, label, is_alive):
        LIVE = "#F0F0F0"
        LIVE_TEXT = "#000000"
        DEAD = "#C3C3C3"
        DEAD_TEXT = "#FFFFFF"

        if is_alive:
            label.config({"background": LIVE})
            label.config({"foreground": LIVE_TEXT})
        else:
            label.config({"background": DEAD})
            label.config({"foreground": DEAD_TEXT})

    def name_changed(self, _):
        name = self.variables["name"].get()
        self.widget.attributes["name"] = name
        self.logger.debug(f"Updating name {name}")

    def link_changed(self, _):
        if self.sensitive:
            value = self.variables["Link"]
            self.widget.attributes["Link"] = value
            self.logger.debug(f"Updating link {value}")

    def direction_changed(self, _):
        if self.sensitive:
            value = self.variables["Direction"]
            self.widget.attributes["Direction"] = value
            self.logger.debug(f"Updating direction {value}")

    def checked_image(self):
        value = self.gui_members["Checked"].save_image()
        self.logger.debug(f"Updating checked image {value}")
        self.widget.attributes["Checked"]=value

    def unchecked_image(self):
        value = self.gui_members["Unchecked"].save_image()
        self.logger.debug(f"Updating unchecked image {value}")
        self.widget.attributes["Unchecked"]=value

    def change_image(self, _):
        if self.sensitive:
            self.logger.trace(f"Start", indent_delta=1)
            self.sensitive = False
            self.update_tk_image() #TODO, this is ONLY used in this function and could be imported again.
            #TODO that process will be finicky because we have several different versions of x, y, w, h

            imageBounds = self.image_updater.get_image_bounds()
            width = imageBounds[0]-int(self.gui_members['X'].get())
            self.gui_members['width'].resetRange(0, width, min(width,int(self.gui_members['width'].get())))
            height = imageBounds[1]-int(self.gui_members['Y'].get())
            self.gui_members['height'].resetRange(0, height, min(height,int(self.gui_members['height'].get())))

            self.sensitive = True
            self.logger.trace(f"End", indent_delta=-1)

    def update_tk_image(self):
        width = int(self.gui_members['width'].get())
        self.widget.attributes['width']=width
        height = int(self.gui_members['height'].get())
        self.widget.attributes['height']=height
        xTmp = int(self.gui_members['X'].get())
        yTmp = int(self.gui_members['Y'].get())
        
        cropped = self.size_image(xTmp, yTmp, width, height)
        self.tk_image = ImageTk.PhotoImage(cropped)
        self.tk_label.config(image=self.tk_image)

    def size_image(self, xTmp, yTmp, width, height):
        self.logger.trace(f"Start ({xTmp}, {yTmp})x{width}+{height}", indent_delta=1)
        
        if width==0:
            width=1

        if height==0:
            height=1
        
        if self.foreign_widget:
            # we want to update imported images from your current view
            cropped = self.image_updater.crop_image(
                                            xTmp,
                                            yTmp,
                                            width,
                                            height,
                                            tk_image=False)
        else:
            cropped = self.image_updater.crop_image(
                                            xTmp,
                                            yTmp,
                                            width,
                                            height,
                                            tk_image=False,
                                            specific_view=self.widget.get_value("view"))

        wCoeff = (WidgetEditor.FIXED_WIDTH+0.0)/width
        hCoeff = (WidgetEditor.FIXED_HEIGHT+0.0)/height
        
        #assume width is the dominant dimension
        finalH = WidgetEditor.FIXED_HEIGHT
        finalW = width*hCoeff
        if hCoeff>wCoeff:
            finalW = WidgetEditor.FIXED_WIDTH
            finalH = height*wCoeff       

        self.logger.trace(f"End", indent_delta=-1)
        return cropped.resize((int(finalW), int(finalH)))

    def change_type(self, _):
        if self.sensitive:
            oldType = WIDGET_TYPES[self.widget.attributes["type"]].copy()
            newType = WIDGET_TYPES[self.variables["type"].get()].copy()
            self.logger.trace(f"Start {oldType}-->{newType}", indent_delta=1)
            for k in ["name","view","type","X","Y","width","height"]:
                oldType.append(k)
                newType.append(k)

            for key in self.gui_members:
                if (key in oldType) and (not key in newType):
                    #this one is being removed
                    del self.widget.attributes[key]
                elif (not key in oldType) and (key in newType):
                    #this one is being added
                    self.widget.attributes[key] = ""
                elif (key in oldType) and (key in newType):
                    #this one is in both
                    if key in ["type","Link","Direction","view"]:
                        self.widget.attributes[key] = self.variables[key].get()
                    else:
                        self.widget.attributes[key] = self.gui_members[key].get()
                # last case is key not in either... so nothing happens

            for component in self.editor_table.winfo_children():
                component.destroy()
            self.build_editor_table()
            self.logger.trace(f"End", indent_delta=-1)

    def update(self):
        self.logger.trace(f"Start", indent_delta=1)
        wDictionary = self.widget.to_dict()
        
        if self.foreign_widget:
            dx = int(self.gui_members['X'].get())-int(self.widget.attributes['X'])
            dy = int(self.gui_members['Y'].get())-int(self.widget.attributes['Y'])
            WidgetEditor.view_update = [wDictionary['view'], dx, dy]
        else:
            allKeys = WIDGET_TYPES[self.variables["type"].get()]
            for k in ["name","view","type","X","Y","width","height"]:
                allKeys.append(k)

            for key in allKeys:
                value = ""
                if key in ["type","Link","Direction","view"]:
                    value = self.variables[key].get()
                else:
                    value = str(self.gui_members[key].get())

                if key == "name":
                    if self.is_revision and self.original_name!=value and not self.name_checker.is_valid_name(value):
                        #this is a revision, but the name has changed. It may no longer be valid
                        messagebox.showerror(title="Widget Error", message="The selected name '"+value+"' is already in use", parent=self.window)
                        self.logger.trace(f"End - Name {value} already in use", indent_delta=-1)
                        return
                    elif (not self.is_revision) and not self.name_checker.is_valid_name(value):
                        #this is a new widget and it may not have a valid name
                        messagebox.showerror(title="Widget Error", message="The selected name '"+value+"' is already in use", parent=self.window)
                        self.logger.trace(f"End - Name {value} already in use", indent_delta=-1)
                        return
                        
                #error check on entries
                if len(value)==0:
                    messagebox.showerror(title="Widget Error", message="You must give a value for "+key, parent=self.window)
                    self.logger.trace(f"End - Missing value for {key}", indent_delta=-1)
                    return

                #update the widget
                wDictionary[key] = value
            WidgetEditor.view_update = [None, 0, 0]

        #close the windows
        self.answer = Widget.from_dictionary(wDictionary)
        self.completed = EditorState.COMPLETE
        WidgetEditor.last_widget = wDictionary["type"]
        self.logger.trace(f"End", indent_delta=-1)
        self.window.grab_release()
        self.window.destroy()
    
    def delete(self):
        self.logger.trace(f"Start", indent_delta=1)
        self.answer = None # there is no more widget
        self.completed = EditorState.DELETED
        self.logger.trace(f"End", indent_delta=-1)
        self.window.grab_release()
        self.window.destroy()

    def cancel(self):
        self.logger.trace(f"Start", indent_delta=1)
        self.answer = None # there is no more widget
        self.completed = EditorState.CANCELLED
        self.logger.trace(f"End", indent_delta=-1)
        self.window.grab_release()
        self.window.destroy()

#TODO - may be OBE if not used by next version
    # def setLocation(self, x, y):
    #     '''
    #     Used to programmatically relocate the editor
    #     '''
    #     self.window.geometry("+%d+%d" %(x,y))

    # def getLocation(self):
    #     return [self.window.winfo_x(), self.window.winfo_y()]

class EditorState:
    CANCELLED = 0
    COMPLETE = 1
    DELETED = 2
