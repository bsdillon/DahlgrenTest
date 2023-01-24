import tkinter as tk
from imagewindow import ImageWindow
from tkinter import ttk, messagebox as mb, filedialog as fd, simpledialog as sd
import json
from widget import EditorState, Widget, WidgetEditor
from PIL import Image, ImageTk
from pathlib import Path
import shutil
import os
from yetiwriter import writeYeti

CONFIG_DIR = './configs'
PROJECT_FILE = "project.json"
THUMBNAIL = (25, 18)

class MainWindow():
    def __init__(self):
        self.test = None
        self.projFile = None
        self.window = tk.Tk()
        self.window.protocol("WM_DELETE_WINDOW", self.closeWindow)

        menubar = tk.Menu(self.window)
        self.window.config(menu=menubar)
        filemenu = tk.Menu(menubar, tearoff=0)
        filemenu.add_command(label="New", command=self.newProject)
        filemenu.add_command(label="Open", command=self.getProjectName)
        filemenu.add_command(label="Save", command=self.saveProject)
        #BSD may be added later
        #filemenu.add_command(label="Save as...", command=self.saveAsProject)
        filemenu.add_command(label="Close", command=self.closeProject)
        filemenu.add_separator()
        filemenu.add_command(label="Exit", command=self.closeWindow)
        menubar.add_cascade(label="File", menu=filemenu)

        filemenu = tk.Menu(menubar, tearoff=0)
        filemenu.add_command(label="Clear All", command=self.clearEntries)
        filemenu.add_command(label="Export YETI", command=self.exportYeti)
        #BSD may be added later
        #filemenu.add_command(label="Add Image", command=self.addImage)
        menubar.add_cascade(label="Actions", menu=filemenu)


        self.window.title("RF GUI WIZARD")
        self.window.geometry("600x500")

        self.widget_list = []
        self.images=[]

        frame = tk.Frame(self.window)
        self.window.rowconfigure(0,weight=1)#forces frame to resize with window
        self.window.columnconfigure(0,weight=1)
        frame.grid(row=0, column=0, sticky=tk.N+tk.S+tk.E+tk.W)

        cNames = ("name_c", "type_c", "X_c", "Y_c", "Width_c", "Height_c")
        self.table = ttk.Treeview(frame, columns=cNames)
        frame.rowconfigure(1,weight=1)#gives the table the majority of the space
        frame.columnconfigure(0,weight=1)
        self.table.grid(row=1, column=0, columnspan=5, sticky=tk.N+tk.S+tk.E+tk.W)

        self.table.column("#0", anchor=tk.CENTER, width=50, stretch=True)
        self.table.column("name_c", anchor=tk.CENTER, width=80)
        self.table.column("type_c", anchor=tk.CENTER, width=80)
        self.table.column("X_c", anchor=tk.CENTER, width=80)
        self.table.column("Y_c", anchor=tk.CENTER, width=80)
        self.table.column("Width_c", anchor=tk.CENTER, width=80)
        self.table.column("Height_c", anchor=tk.CENTER, width=80)

        self.table.heading("#0", text="Icon")
        self.table.heading("name_c", text="Name")
        self.table.heading("type_c", text="Type")
        self.table.heading("X_c", text="X")
        self.table.heading("Y_c", text="Y")
        self.table.heading("Width_c", text="Width")
        self.table.heading("Height_c", text="Height")
        self.table.bind("<Button 1>", self.edit)

    def newProject(self):
        project = sd.askstring("Project", "\t\tAssign a project name\t\t")
        if project == "" or project == None:
            mb.showerror(title="Error", message="Project name is empty", parent=self.window)
            return

        projPath = os.path.join(CONFIG_DIR, project)
        if os.path.exists(projPath):
            mb.showerror(title="Error", message="Project '"+project+"' already exists", parent=self.window)
            return
            
        # we have a valid, new project name and we will configure for that
        Path(projPath).mkdir(parents=True, exist_ok=False)
        projFile = os.path.join(projPath, PROJECT_FILE)

        #get the first image for the project
        self.imageList = []
        name = fd.askopenfilename(parent=self.window, title="Select GUI Screenshot", filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
        if name == "":
            mb.showerror(title="Error", message="Image file not found", parent=self.window)
            return
        nameOnly = os.path.basename(name)
        newName = os.path.join(projPath, nameOnly)
        self.imageList.append(str(Path(newName).absolute()))
        shutil.copyfile(name, newName)
            
        self.exportJSON(projFile)
        self.openProject(projPath)

    def getProjectName(self):
        temp = fd.askdirectory(initialdir=CONFIG_DIR,mustexist=True,title="Select a project", filetypes=[("JSON","*.JSON"), ("json","*.json")])
        if temp == "":
            mb.showerror(title="Error", message="Project not selected", parent=self.window)
            return
        self.openProject(temp)

    def openProject(self, directory):
        self.projPath = directory
        self.projFile = os.path.join(self.projPath,PROJECT_FILE)
        self.imageList = []
        self.importJSON(self.projFile)

    def importJSON(self, file):

        with open(file, "r") as read_file:
            dictionary = json.load(read_file)
        self.clearEntries()
        self.imageList = []
        self.projPath = ""
        self.projFile = ""
        self.widget_list = []
        self.test = None
	try:
            self.projPath = dictionary["Path"]
            self.projFile = dictionary["File"]
            for img in dictionary["Images"]:
                self.imageList.append(img)

            self.test = ImageWindow(self, self.projPath)
            self.test.loadImageNames(self.imageList)

            for w in dictionary["Widgets"]:
                widget = Widget.FromDictionary(w)
                self.test.updateImage(widget)
                self.newTableEntry(Image.open(self.imageList[0]), widget)
        except:
            raise IOError("JSON is corrupt or does not support RFGUIHelper")

    def exportYeti(self):
        writeYeti(self.widget_list, self.projPath, self.window)

    def exportJSON(self, file):
        tempList = {}
        absFile = Path(file).absolute()
        path = absFile.parent
        tempList["Path"] = str(path)
        tempList["File"] = str(absFile)
        tempList["Images"]= self.imageList
        wList = []
        for w in self.widget_list:
            wList.append(w.to_dict())

            #updates the icond for that widget
            if w.hasValue('Image file name'):
                w.image.save(self.projPath+"/"+w.getValue('Image file name'))

        tempList["Widgets"] = wList

        with open(file, "w") as write_file:
            json.dump(tempList, write_file)

    def saveProject(self):
        if self.projFile == None:
            mb.showerror(title="Error", message="No project is open at this time", parent=self.window)

        self.exportJSON(self.projFile)

    #BSD may not be needed for some time or ever
    # def saveAsProject(self):
    #     project = sd.askstring("Project", "\t\tAssign a project name\t\t")
    #     if project == "":
    #         mb.showerror(title="Error", message="Project name is empty", parent=self.window)
    #         return
        
    #     projPath = os.path.join(CONFIG_DIR, project)
    #     if os.path.exists(projPath):
    #         mb.showerror(title="Error", message="Project '"+project+"' already exists", parent=self.window)
    #         return

    def closeProject(self):
        response = mb.askyesnocancel("Save changes?", "\tDo you want to save any changes?\t")

        if response == None:
            return response
        elif response: #True for "Yes" option
            self.saveProject()
        
        self.clearEntries()
        self.projPath = None
        self.projFile = None
        self.imageList = []

        if self.test != None:
            self.test.top.destroy()
            self.test = None

        return response

    def closeTest(self):
        response = self.closeProject()
        if response == None:
            return

    def closeWindow(self):
        response = self.closeProject()
        if response == None:
            return

        self.window.quit()

    def newTableEntry(self, rootImage, w:Widget):
        self.widget_list.append(w)

        tmp = (int(w.getValue("X")), int(w.getValue("Y")), int(w.getValue("width")), int(w.getValue("height")))
        img1 = rootImage.crop((tmp[0], tmp[1], tmp[0]+tmp[2], tmp[1]+tmp[3]))
        img1.thumbnail(THUMBNAIL)
        self.images.append(ImageTk.PhotoImage(img1))

        self.table.insert(parent='',
            index='end',
            text='',
            image=self.images[-1],
            values=(w.getValue("name"),
                    w.getValue("type"),
                    w.getValue("X"),
                    w.getValue("Y"),
                    w.getValue("width"),
                    w.getValue("height")
                    )
            )
 
    def clearEntries(self):
        for item in self.table.get_children():
            self.table.delete(item)

        if hasattr('self', 'test'):
            for w in self.widget_list:
                self.test.deleteOverlays(w)

        self.widget_list.clear()

    def edit(self, event):
        row_ID = self.table.identify_row(event.y)
        values = self.table.item(row_ID)["values"] #gets a list of the values
        if len(values)<1:
            #nothing found
            return

        found = False
        for w in self.widget_list:
            if w.getValue("name") == values[0]:
                found = True
                WidgetEditor.Edit(w, self.window, self.test, reviseWidget=True)
                if w.editor.completed == EditorState.COMPLETE:
                    #update the widget
                    self.test.updateImage(w)
                    img1 = w.image.copy()
                    img1.thumbnail(THUMBNAIL)
                    self.images.append(ImageTk.PhotoImage(img1))

                    #TODO there should be some garbage collection here.
                    # the old image is still in self.images
                    self.table.item(row_ID, 
                                    text="", 
                                    image=self.images[-1],
                                    values=(w.getValue("name"),
                                        w.getValue("type"),
                                        w.getValue("X"),
                                        w.getValue("Y"),
                                        w.getValue("width"),
                                        w.getValue("height")
                                        ))
                elif w.editor.completed == EditorState.DELETED:
                    self.test.deleteOverlays(w)
                    self.widget_list.remove(w)
                    self.table.delete(row_ID)
                return

        if not found:
            mb.showerror(title="Edit Error", message="Could not find "+values[0]+" to edit", parent=self.window)
            return
