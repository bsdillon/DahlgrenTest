from choicepopup import ChoicePopup
import traceback
import tkinter as tk
from imagewindow import ImageWindow
from tkinter import ttk, messagebox as mb, filedialog as fd, simpledialog as sd
import json
from widget import EditorState, Widget, WidgetEditor
from PIL import Image, ImageTk
from pathlib import Path
import shutil
import os
from widgeterror import WidgetError

PROJECT_EXT = ".json"
THUMBNAIL = (25, 18)

class MainWindow():
    TOOL_VERSION = "3.1"

    def __init__(self):
        self.test = None
        self.projFile = None
        self.window = tk.Tk()
        self.window.protocol("WM_DELETE_WINDOW", self.closeWindow)

        self.menubar = tk.Menu(self.window)
        self.window.config(menu=self.menubar)
        self.filemenu = tk.Menu(self.menubar, tearoff=0)
        self.filemenu.add_command(label="New", command=self.newProject)
        self.filemenu.add_command(label="Open", command=self.openProject)
        self.filemenu.add_command(label="Save", command=self.saveProject)
        self.filemenu.add_command(label="Save as...", command=self.saveAsProject)
        self.filemenu.add_command(label="Close", command=self.closeProject)
        self.filemenu.add_separator()
        self.filemenu.add_command(label="Exit", command=self.closeWindow)
        self.menubar.add_cascade(label="File", menu=self.filemenu)

        throwaway = tk.Menu(self.menubar, tearoff=0)
        throwaway.add_command(label="Clear Widgets", command=self.clearEntries)
        throwaway.add_separator()
        throwaway.add_command(label="Add View", command=self.addView)
        throwaway.add_command(label="Replace View Image", command=self.replaceView)
        throwaway.add_command(label="Edit View Name", command=self.editView)
        throwaway.add_command(label="Delete View", command=self.deleteView)
        self.menubar.add_cascade(label="Project Actions", menu=throwaway)
        
        self.window.title("RF GUI WIZARD")
        self.window.geometry("600x500")

        self.viewList = {}
        self.widget_list = {}
        self.tkImages=[]
        self.currentView = None
        self.lastEdited = None

        frame = tk.Frame(self.window)
        self.window.rowconfigure(0,weight=1)#forces frame to resize with window
        self.window.columnconfigure(0,weight=1)
        frame.grid(row=0, column=0, sticky=tk.N+tk.S+tk.E+tk.W)

        #Frame2 only serves to allow scrolling of table
        frame2 = tk.Frame(frame, bg="#FF0000")
        frame2.grid(row=1, column=0, columnspan=5, sticky=tk.N+tk.S+tk.E+tk.W)

        frame.columnconfigure(0,weight=1)
        frame.rowconfigure(1,weight=1)#gives frame2 the majority of the space

        cNames = ("name_c", "view_c", "type_c", "X_c", "Y_c", "Width_c", "Height_c")
        self.table = ttk.Treeview(frame2, columns=cNames)
        self.table.column("#0", anchor=tk.CENTER, width=50, stretch=True)
        self.table.column("name_c", anchor=tk.CENTER, width=80)
        self.table.column("view_c", anchor=tk.CENTER, width=80)
        self.table.column("type_c", anchor=tk.CENTER, width=80)
        self.table.column("X_c", anchor=tk.CENTER, width=80)
        self.table.column("Y_c", anchor=tk.CENTER, width=80)
        self.table.column("Width_c", anchor=tk.CENTER, width=80)
        self.table.column("Height_c", anchor=tk.CENTER, width=80)

        self.table.heading("#0", text="Icon")
        self.table.heading("name_c", text="Name")
        self.table.heading("view_c", text="View")
        self.table.heading("type_c", text="Type")
        self.table.heading("X_c", text="X")
        self.table.heading("Y_c", text="Y")
        self.table.heading("Width_c", text="Width")
        self.table.heading("Height_c", text="Height")
        self.table.bind("<Button 1>", self.editWidget)

        self.scrollbarV = ttk.Scrollbar(frame2, orient="vertical", command=self.table.yview)
        self.scrollbarH = ttk.Scrollbar(frame2, orient="horizontal", command=self.table.xview)
        self.scrollbarV.pack(side="right", fill="y")
        self.scrollbarH.pack(side="bottom", fill="x")
        self.table.pack(side="left", fill="both", expand=True)

        self.table.configure(yscrollcommand=self.scrollbarV.set)
        self.table.configure(xscrollcommand=self.scrollbarH.set)

        self.enableProjectMenus(False)

    def reloadProject(self):
        self.exportJSON()
        cView = self.currentView
        loc = None
        if self.test:
            loc = self.test.getLocation()
        temp = self.projFile
        #wLoc = self.lastEdited.getLocation()
        
        self.closeProject(forced=True)
        self.projFile = temp
        self.importJSON()
        if loc:
            self.test.setLocation(loc[0], loc[1])
        if cView in self.viewList:
            self.currentView = cView
            self.viewChange(cView)

    def enableProjectMenus(self, projectOpen):
        if projectOpen:
            self.filemenu.entryconfig("New", state="disabled")
            self.filemenu.entryconfig("Open", state="disabled")

            self.menubar.entryconfig("Project Actions", state="normal")
            self.filemenu.entryconfig("Save", state="normal")
            self.filemenu.entryconfig("Save as...", state="normal")
            self.filemenu.entryconfig("Close", state="normal")
        else:
            self.filemenu.entryconfig("New", state="normal")
            self.filemenu.entryconfig("Open", state="normal")

            self.menubar.entryconfig("Project Actions", state="disabled")
            self.filemenu.entryconfig("Save", state="disabled")
            self.filemenu.entryconfig("Save as...", state="disabled")
            self.filemenu.entryconfig("Close", state="disabled")

    #--------------------------------------#
    #            View Utilities            #
    #--------------------------------------#
    def isInView(self, widget):
        if self.currentView:
            name = widget.getValue("name")
            nView = self.viewList[self.currentView]
            if "Widgets" in nView:
                for w in nView["Widgets"]:
                    if w==name:
                        return True
        return False
    
    def viewChange(self, nextView):
        #get the list of widgets associated with the last view
        lastList = []
        if self.currentView: #only if there WAS a last view
            lView = self.viewList[self.currentView]
            if "Widgets" in lView:
                lastList = lView["Widgets"]

        #get the list of widgets associated with the next view
        nView = self.viewList[nextView]        
        nextList = []
        if "Widgets" in nView:
            nextList = nView["Widgets"]
 
        #update widgets
        self.currentView = nextView
        for wName in self.widget_list:
            w = self.widget_list[wName]
            if wName in nextList: #add new widgets
                self.test.updateWidgetOverlays(w)
            elif wName in lastList: #delete old widgets
                #we ONLY delete it if it is NOT in both views
                self.test.deleteOverlays(w)
        
        #for all foreign groups in a view, update the deltas
        if "Foreign" in nView:
            for vn in nView["Foreign"]:
                delta = nView["Foreign"][vn]
                self.updateForeignWidgets(vn, delta[0], delta[1])    

    def selectImage(self):
        tmp = fd.askopenfilename(parent=self.window, title="Select GUI Screenshot", filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
        if tmp == "":
            mb.showerror(title="Error", message="Image file not found", parent=self.window)
            return None
        return tmp
    
    def addView(self):
        if self.blockedByWidgetEditor():
            return

        absFile = Path(self.projFile).absolute()
        saveFolder = str(absFile.parent)
        
        oldImage = self.selectImage()
        if oldImage == None:
            return
        extension = oldImage.split(".")[-1]

        viewName = None
        while viewName==None:
            viewName = sd.askstring("View Definition", "\t\tAssign a name to this view\t\t")
            if viewName == "" or viewName == None:
                mb.showerror(title="Error", message="View name is empty", parent=self.window)
                return
            
            if viewName in self.viewList:
                mb.showerror(title="Duplicate view name", message="View '"+viewName+"' already exists; please select again.", parent=self.window)
                viewName==None                
        viewName = viewName.replace(".","_") #We don't want any inadvertant '.' characters
        simpleFile = viewName+"."+extension

        copyName = os.path.join(saveFolder, simpleFile)
        self.viewList[viewName]={"Image":simpleFile}
        shutil.copyfile(oldImage, copyName)
        
        #all done, update data
        mb.showinfo(title="Saving Progress", message="Successfully added")
        self.reloadProject()

    def selectExistingView(self):
        absFile = Path(self.projFile).absolute()
        removablePath = str(absFile.parent)

        #setup list of view images
        choices = {}
        for vName in self.viewList:
            imgPath = self.viewList[vName]["Image"]
            choices[vName]=os.path.join(removablePath, imgPath)
        
        cp = ChoicePopup(self.window, title="Select a view", choicelist=list(choices.keys()))
        self.window.wait_window(cp.choicewin)
        viewKey = cp.result[0]
        if not cp.button:
            mb.showerror(title="Error", message="No view selected", parent=self.window)
            return None
        fullOldImage = choices[viewKey]
        shortOldImage = fullOldImage[len(removablePath)+1:]
        viewName = shortOldImage.split(".")[0]

        return [viewName, fullOldImage]

    def replaceView(self):
        if self.blockedByWidgetEditor():
            return

        selection = self.selectExistingView()
        if selection:
            viewName = selection[0]
            fullOldImage = selection[1]

            mb.showinfo(title="Updated image", message="Selecting an image for "+viewName)

            newImage = self.selectImage()
            if newImage == None:
                return
            
            #all ready lets delete and replace
            os.remove(fullOldImage)
            shutil.copyfile(newImage, fullOldImage)
            
            #all done, update data
            mb.showinfo(title="Saving Progress", message="Successfully updated")
            self.reloadProject()

    def editView(self):
        if self.blockedByWidgetEditor():
            return

        absFile = Path(self.projFile).absolute()
        saveFolder = str(absFile.parent)

        selection = self.selectExistingView()
        if selection:
            oldViewName = selection[0]
            fullOldImage = selection[1]
            extension = fullOldImage.split(".")[-1]

            viewName = None
            while viewName==None:
                viewName = sd.askstring("View Definition", "\t\tAssign a new name to this view\t\t")
                if viewName == "" or viewName == None:
                    mb.showerror(title="Error", message="View name is empty", parent=self.window)
                    return
                
                if viewName in self.viewList:
                    mb.showerror(title="Duplicate view name", message="View '"+viewName+"' already exists; please select again.", parent=self.window)
                    viewName==None                
            viewName = viewName.replace(".","_") #We don't want any inadvertant '.' characters
            simpleFile = viewName+"."+extension
            copyName = os.path.join(saveFolder, simpleFile)

            #changes the name of the image for the view and deletes it
            shutil.copyfile(fullOldImage, copyName)
            os.remove(fullOldImage)

            #need to alter ALL of the view members
            oldView = self.viewList[oldViewName]
            del self.viewList[oldViewName]
            self.viewList[viewName]={"Image":simpleFile}
            newView = self.viewList[viewName]
            if "Foreign" in oldView:
                # there are some foreign widgets so we copy the whole thing.
                newView["Foreign"]= oldView["Foreign"]
            
            if "Widgets" in oldView:
                newView["Widgets"]=[]
                for wName in oldView["Widgets"]:
                    #This is a widget KNOWN TO the old view
                    w = self.widget_list[wName]
                    vValue = w.getValue("view")
                    if oldViewName==vValue:
                        #this is a native widget in that view
                        w.setValue("view", viewName)
                    
                        
                    #add it to the new view
                    newView["Widgets"].append(wName)
            
            #all done, update data
            mb.showinfo(title="Saving Progress", message="Successfully renamed")
            self.reloadProject()

    def deleteView(self):
        if self.blockedByWidgetEditor():
            return

        selection = self.selectExistingView()
        if selection:
            viewName = selection[0]
            fullOldImage = selection[1]

            response = mb.askyesno("Confirm deletion?", "Deleting "+viewName+" may irreversibly delete some widgets.\nAre you sure you want to do this?")

            if response == None:
                return response
            elif response: #True for "Yes" option
                os.remove(fullOldImage) # file is gone
                del self.viewList[viewName] #view is removed from list

                #TODO other actions e.g. widgets in viewName???

                #all done, update data
                mb.showinfo(title="Saving Progress", message="Successfully deleted")
                self.reloadProject()
    
    #--------------------------------------#
    #          Save File Utilities         #
    #--------------------------------------#
    def selectFile(self):
        '''
        SelectFile uses tkinter utilities to select a folder/file for saving a project
        
        returns None or a valid file name
        '''
        proposedFile = fd.asksaveasfilename(title="Select a save location", filetypes=[("json","*.json")], defaultextension="json")
        if proposedFile == "":
            mb.showerror(title="Error", message="Project could not be saved", parent=self.window)
            return None

        #ensure that the file name ends in .json
        if proposedFile[-5:]!=PROJECT_EXT:
            proposedFile = proposedFile + PROJECT_EXT
        return proposedFile

    def saveProject(self):
        '''
        For SaveProject the project file location is already known and is simply reused.
        '''
        if self.blockedByWidgetEditor():
            return

        if self.projFile == None:
            mb.showerror(title="Error", message="No project is open at this time", parent=self.window)

        self.exportJSON()

    def saveAsProject(self):
        '''
        Selects a new project file location and saves the project
        '''
        if self.blockedByWidgetEditor():
            return

        if self.projFile == None:
            mb.showerror(title="Error", message="No project is open at this time", parent=self.window)

        temp = self.selectFile()
        if temp:
            self.projFile = temp
            self.saveProject()        

    def exportJSON(self):
        tempList = {}
        absFile = Path(self.projFile).absolute()
        removablePath = str(absFile.parent)
        tempList["Version"] = self.TOOL_VERSION
        
        tempList["Views"] = self.viewList
        wList = []
        for w in list(self.widget_list.values()):
            wList.append(w.to_dict())

            #updates the icon for that widget
            if w.hasValue('Image file name'):
                image = ImageTk.getimage( w.tkImage )
                image.save(removablePath+"/"+w.getValue('Image file name'))

        tempList["Widgets"] = wList

        with open(self.projFile, "w") as write_file:
            json.dump(tempList, write_file)
            
    def newProject(self):
        projFile = self.selectFile()
        if projFile:
            #There used to be an empty check and an already exists check.
            #This is no longer an issue.        
            self.projFile = projFile

            mb.showinfo(title="Project Initialization", message="Begin by selecting an image of the first window view")

            #get the first image for the project
            self.viewList = {}
            self.addView()

            self.reloadProject()
            self.enableProjectMenus(True)

    #--------------------------------------#
    #          Open File Utilities         #
    #--------------------------------------#
    def openProject(self):
        path = fd.askopenfilename(title="Select a project", filetypes=[("json","*.json")])
        if path == "":
            mb.showerror(title="Error", message="Project not selected", parent=self.window)
            return

        self.projFile = path
        self.importJSON()

    def importJSON(self):
        self.viewList = {}

        absFile = Path(self.projFile).absolute()
        removablePath = str(absFile.parent)
        with open(self.projFile, "r") as read_file:
            dictionary = json.load(read_file)

        self.clearEntries()
        self.viewList = {}
        self.widget_list = {}

        errors = []
        try:
            self.version = "3.0"
            if "Version" in dictionary:
               self.version = dictionary["Version"]

            if self.version!=self.TOOL_VERSION:
                #this is the trigger to "update" the file.
                print("Need to update file")
                #TODO update file
            
            if not self.test:
                self.test = ImageWindow(self, removablePath)

            #cross validation of views vs widgets
            #keep the names of all views as a reference
            self.viewList = dictionary["Views"]

            #create all widgets; excluding any without a matching view
            for w in dictionary["Widgets"]:
                widget = Widget.FromDictionary(w)
                wName = widget.getValue("name")
                theview = widget.getValue("view")
                if theview in self.viewList:
                    #this widget has a matching view; remember it as a reference
                    self.widget_list[wName]=widget
                else:
                    #add the error notes but only ONCE for each widget/view
                    note = "Removed widget "+wName+"; Cannot find parent view "+theview
                    if not (note in errors):
                        errors.append(note)
 
            viewFiles = {}
            for vName in self.viewList:
                view = self.viewList[vName]
                tmpList = []
                if "Widgets" in view:
                    tmpList = view["Widgets"]

                for wName in tmpList:
                    if not(wName in self.widget_list):
                        #add the error notes but only ONCE for each widget/view
                        note = "Cannot find widget "+wName
                        if not (note in errors):
                            errors.append(note)

                        view["Widgets"].remove(wName)

                fullPath = os.path.join(removablePath, view["Image"])
                viewFiles[vName]=fullPath

            #now we have a full set of views that have been validated
            self.test.loadImageNames(viewFiles)

            #now we have a full set of widgets that have been validated
            for wName in self.widget_list:
                widget = self.widget_list[wName]
                if widget.hasValue('Image file name'):
                    imgFile = os.path.join(removablePath, widget.getValue('Image file name'))
                    widget.tkImage = ImageTk.PhotoImage(Image.open(imgFile))
                theview = widget.getValue("view")
                self.updateTableRow(theview, widget)

            self.viewChange(list(self.viewList.keys())[0])
            
            notes = ""
            for n in errors:
                notes += n+"\n"
            if len(errors)>0:
                mb.showerror(title="Error", message="JSON is corrupted. Partially corrected.\n"+notes, parent=self.window)

        except Exception as ex:
            traceback.print_exception(ex)
            raise IOError("JSON is corrupt or does not support RFGUIHelper:\n\t"+str(ex))
        self.enableProjectMenus(True)

    def closeWindow(self):
        response = self.closeProject()
        if response == None:
            return

        self.window.quit()

    def closeProject(self, forced=False):
        if forced and self.lastEdited:
            self.lastEdited.window.close()

        if self.blockedByWidgetEditor():
            return

        if self.projFile == None:
            return True

        response = False
        if not forced:
            response = mb.askyesnocancel("Save changes?", "\tDo you want to save any changes?\t")

        if response == None:
            return response
        elif response: #True for "Yes" option
            self.saveProject()
        
        self.clearEntries()
        self.projFile = None
        self.viewList = {}
        self.currentView = None

        if self.test != None:
            for wName in list(self.widget_list):
                self.test.deleteOverlays(self.widget_list[wName])
                del self.widget_list[wName]

            self.test.top.destroy()
            self.test = None
            self.enableProjectMenus(False)

        return response

    #--------------------------------------#
    #            Widget Utilities          #
    #--------------------------------------#
    def updateForeignWidgets(self, foreignView, dx, dy):
        cView = self.viewList[self.currentView]

        #get all the widgets in this view
        nextList = []
        if "Widgets" in cView:
            nextList = cView["Widgets"]
        
        #search for foreign widgets
        for wName in self.widget_list:
            w = self.widget_list[wName]
            vName = w.getValue("view")
            if wName in nextList and vName==foreignView:
                #this widget is in the current view 
                #AND it is from the foreign view

                self.test.updateWidgetOverlays(w, dx=int(dx), dy=int(dy))

    def importWidget(self):
        # we compile a list of all widgets we could import 
        # (i.e. not native to this view) the list is actually
        # the keys of a collection, so we can readily get to
        # the widgets associated with the name.
        choices = {}
        for wName in self.widget_list:
            w = self.widget_list[wName]
            if w.getValue("view")!=self.currentView:
                choices[wName]=w

        alreadyWidgets = [] # this is a list of already-imported widgets in this list
        cView = self.viewList[self.currentView]
        if "Widgets" in cView:
            for w in cView["Widgets"]:
                if w in choices: # we can only "already" have widgets from the choices list.
                    alreadyWidgets.append(w)

        # here we do the selection process
        cp = ChoicePopup(self.window, title="Select a widget", choicelist=list(choices.keys()), already=alreadyWidgets, singleSelect=False)
        self.window.wait_window(cp.choicewin)
        if not cp.button:
            mb.showerror(title="Error", message="Operation canceled", parent=self.window)
            return None

        if len(cp.result)>0:
            if not("Foreign" in cView):
                cView["Foreign"] = {}

            if not ("Widgets" in cView):
                cView["Widgets"] = []

        # adding all the things which are left on the list
        for wName in cp.result:
            vName = choices[wName].getValue("view")
            deltas = (0,0)
            if vName in cView["Foreign"]:
                deltas = cView["Foreign"][vName]

            if wName in alreadyWidgets: #delete them from our already-added set
                alreadyWidgets.remove(wName)
            else:
                self.viewList[self.currentView]["Widgets"].append(wName)

            self.test.updateWidgetOverlays(choices[wName], deltas[0], deltas[1])

        # anything left needs to be deleted
        for wName in alreadyWidgets:
            self.viewList[self.currentView]["Widgets"].remove(wName)
            self.test.deleteOverlays(choices[wName])
                    
    def updateTableRow(self, viewName:str, w:Widget, rowNumber=-1):
        absFile = Path(self.projFile).absolute()
        removablePath = str(absFile.parent)

        for v in self.viewList:
            if v==viewName:
                fullPath = os.path.join(removablePath, self.viewList[v]["Image"])
                viewImage = Image.open(fullPath)
                break

        dims = (int(w.getValue("X")), int(w.getValue("Y")), int(w.getValue("width")), int(w.getValue("height")))
        cropped = viewImage.crop((dims[0], dims[1], dims[0]+dims[2], dims[1]+dims[3]))
        cropped.thumbnail(THUMBNAIL)
        self.tkImages.append(ImageTk.PhotoImage(cropped))
        #TODO there should be some garbage collection here.
        # we could remove older tkImages if we could find them
        
        valueSet = (w.getValue("name"),
                    w.getValue("view"),
                    w.getValue("type"),
                    w.getValue("X"),
                    w.getValue("Y"),
                    w.getValue("width"),
                    w.getValue("height")
                    )
        if rowNumber==-1:
            self.table.insert(parent='',
                index='end',
                text='',
                image=self.tkImages[-1],
                values=valueSet)
        else:
            self.table.item(rowNumber,
                text="", 
                image=self.tkImages[-1],
                values=valueSet)
        if self.isInView(w): # separate issue, only update the overlay if it is on this view
            self.test.updateWidgetOverlays(w)

    def newTableEntry(self, viewName:str, w:Widget):
        # remember this widget as part of the current view
        cView = self.viewList[viewName]
        if not ("Widgets" in cView):
            cView["Widgets"]=[]

        wName = w.getValue("name")
        cView["Widgets"].append(wName) 
        self.widget_list[wName]=w

        self.updateTableRow(viewName, w)
 
    def newWidget(self, vName, img, x, y, width, height):
        if self.blockedByWidgetEditor():
            return

        widget = Widget("Anchor", vName, x, y, width, height)
        widget.tkImage = img

        self.universalWidgetHandler(widget, False)
        if self.lastEdited.completed == EditorState.COMPLETE:
            #update the master table
            self.newTableEntry(self.currentView, widget)

        self.lastEdited = None

    def universalWidgetHandler(self, widget, foreign, isRevision=False):
        try:
            self.lastEdited = WidgetEditor.CreateEditor(widget, self.window, self.test, revision=isRevision, isForeign=foreign)
            self.window.wait_window(self.lastEdited.window)
        except WidgetError as we:
            self.lastEdited = WidgetEditor.CreateCrash()
            mb.showerror(title="Error", message=str(we))

        if self.lastEdited.completed == EditorState.COMPLETE:
            WidgetEditor.lastWidget = widget.getValue("type")

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

    def blockedByWidgetEditor(self):
        if self.lastEdited:
            mb.showerror(title="Pending Widget", message="Please close the current widget editing window before continuing", parent=self.window)
            return True
        return False

    def editWidget(self, event):
        if self.blockedByWidgetEditor():
            return
        
        # list of the values in this row
        row_ID = self.table.identify_row(event.y)
        values = self.table.item(row_ID)["values"]

        if len(values)<1:
            #nothing found
            return

        found = False
        cView = self.viewList[self.currentView]
        vitalWidgets = []
        if "Widgets" in cView:
            for w in cView["Widgets"]:
                vitalWidgets.append(w)

        if values[0] in self.widget_list:
            w = self.widget_list[values[0]]
            found = True

            oldName = w.getValue("name")
            inThisView = oldName in vitalWidgets #widgets on the current view
            isImport = inThisView and (w.getValue("view")!=self.currentView) #widgets imported from elsewhere

            self.universalWidgetHandler(w, isImport, True)
            if self.lastEdited.completed == EditorState.COMPLETE:
                if WidgetEditor.viewUpdate[0]:
                    # this was a foreign widget
                    # just store the data for this view
                    vName = WidgetEditor.viewUpdate[0]
                    dx = WidgetEditor.viewUpdate[1]
                    dy = WidgetEditor.viewUpdate[2]
                    cView = self.viewList[self.currentView]
                    if not "Foreign" in cView:
                        cView["Foreign"]={}
                    cView["Foreign"][vName]=(dx, dy)

                    self.updateForeignWidgets(vName, dx, dy)
                else:
                    #this is NOT a foreign widget, 
                    # so it should be updated
                    self.updateTableRow(w.getValue('view'), w, rowNumber=row_ID)
                    newName = w.getValue("name")
                    if oldName!=newName:
                        for view in self.viewList:
                            if "Widgets" in self.viewList[view] and oldName in self.viewList[view]["Widgets"]:
                                self.viewList[view]["Widgets"].remove(oldName)
                                self.viewList[view]["Widgets"].append(newName)

            elif self.lastEdited.completed == EditorState.DELETED:
                self.test.deleteOverlays(w)
                del self.widget_list[w.getValue("name")]
                self.table.delete(row_ID)

            self.lastEdited=None
            return

        if not found:
            mb.showerror(title="Edit Error", message="Could not find "+values[0]+" to edit", parent=self.window)
            return

    def clearEntries(self):
        if self.blockedByWidgetEditor():
            return

        for item in self.table.get_children():
            self.table.delete(item)

        if self.test:
            for wName in list(self.widget_list):
                self.test.deleteOverlays(self.widget_list[wName])
                del self.widget_list[wName]

        self.widget_list.clear()