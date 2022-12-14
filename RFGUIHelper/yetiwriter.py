from widget import Widget, YetiImports, YetiTypes
from tkinter import messagebox as mb, simpledialog as sd
TAB="   "

def writeYeti(widgets, projPath, parentWindow):
    #determine that a project exists
    if projPath == None:
        mb.showerror(title="Error", message="No project is open at this time", parent=parentWindow)

    #Get the full name for the new window class being written
    className = sd.askstring("Yeti File", "\t\tAssign a Class Name\t\t")
    if className == "" or className == None:
        mb.showerror(title="Error", message="Class name is empty", parent=parentWindow)
        return
    version = sd.askstring("Yeti Version", "\t\tAssign a version subname (or leave blank)\t\t")
    fullName = className
    if not (version == "" or version == None):
        fullName = fullName + "_"+version

    #parse important details from widgets
    uniqueImports = {}
    anchorFiles = []
    x = 10000
    y = 10000
    w = 0
    h = 0
    widgetCode = ""
    for some_widget in widgets:
        name = some_widget.getValue("name")
        type = some_widget.getValue("type")
        if not type in uniqueImports:
            uniqueImports[type] = YetiImports[type]

        tempX = int(some_widget.getValue("X"))
        tempY = int(some_widget.getValue("Y"))
        tempW = int(some_widget.getValue("width"))
        tempH = int(some_widget.getValue("height"))

        #determine the window bounds
        if tempX+tempW>w:
            w = tempX+tempW
        if tempY+tempH>h:
            h = tempY+tempH
        if tempX<x:
            x = tempX
        if tempY<y:
            y = tempY

        if type=="Anchor":
            anchorFiles.append((some_widget.getValue('Image file name'), tempX, tempY, name))
        else:
            dims = "("+str(tempX)+", "+str(tempY)+", "+str(tempW)+", "+str(tempH)+")"
            widgetCode = widgetCode + ((TAB*2)+"tmp = "+YetiTypes[type]+"(self, '"+name+"', "+dims+")\n")
            #Currently, YETI has a different method to "get" the widgets by name
            # widgetCode = widgetCode + ((TAB*2)+"self.widgets['"+name+"']=tmp\n")

    #create the file for code
    file = projPath + "/" + className.lower() + ".py"
    with open(file, "w") as write_file:

        #write all the imports
        write_file.write("from robot.api.deco import keyword\n")
        write_file.write("from yeti.window import Window\n")
        for key in uniqueImports.keys():
            write_file.write(uniqueImports[key]+"\n")
        write_file.write("\n")
        #end of imports

        write_file.write("class "+fullName+"(Window):\n")
        #setup Robot functions
        write_file.write(TAB+"ROBOT_LIBRARY_SCOPE = 'SUITE'\n")
        write_file.write(TAB+"ROBOT_AUTO_KEYWORDS = False\n\n")

        #write the init function
        write_file.write(TAB+"def __init__(self):\n")
        write_file.write((TAB*2)+"x="+str(x)+"\n")
        write_file.write((TAB*2)+"y="+str(y)+"\n")
        write_file.write((TAB*2)+"w="+str(h)+"\n")
        write_file.write((TAB*2)+"h="+str(w)+"\n\n")
        write_file.write((TAB*2)+"focused=[]\n")
        write_file.write((TAB*2)+"unfocused=[]\n")
        #Currently, YETI has a different method to "get" the widgets by name
        # write_file.write((TAB*2)+"self.widgets={}\n")
        write_file.write((TAB*2)+"self.anchors={}\n\n")
        write_file.write((TAB*2)+"#Add all anchors in window\n")
        for anc in anchorFiles:
            write_file.write((TAB*2)+"tmp = "+YetiTypes['Anchor']+"('"+anc[0]+"', "+str(x - anc[1])+", "+str(y - anc[2])+", 0, 0)\n")
            write_file.write((TAB*2)+"self.anchors['"+anc[3]+"']=tmp\n")
            write_file.write((TAB*2)+"self.widgets['"+anc[3]+"']=tmp\n")
            write_file.write((TAB*2)+"focused.append(tmp)\n\n")
        write_file.write((TAB*2)+"super("+fullName+", self).__init__('"+fullName+" Window', [x,y,w,h], focused, unfocused)\n\n")

        write_file.write((TAB*2)+"#Add all widgets to window\n")
        write_file.write(widgetCode+"\n")

        #other functions
     
        write_file.write(TAB+"@keyword(name='Select Radio'\n")
        write_file.write(TAB+"def selectRadio(self, widget_name):\n")
        write_file.write((TAB*2)+"return self.get_widget(widget_name).select()\n\n")

        write_file.write(TAB+"@keyword(name='Get Widget Region'\n")
        write_file.write(TAB+"def widgetRegion(self, widget_name):\n")
        write_file.write((TAB*2)+"return self.get_widget(widget_name).get_region()\n\n")

        write_file.write(TAB+"@keyword(name='Click')\n")
        write_file.write(TAB+"def Click(self, widget_name):\n")
        write_file.write((TAB*2)+"self.get_widget(widget_name).click()\n\n")

        write_file.write(TAB+"@keyword(name='Read')\n")
        write_file.write(TAB+"def Read(self, widget_name):\n")
        write_file.write((TAB*2)+"self.get_widget(widget_name).get_text()\n\n")

        write_file.write(TAB+"@keyword(name='Write')\n")
        write_file.write(TAB+"def Write(self, widget_name, text):\n")
        write_file.write((TAB*2)+"self.get_widget(widget_name).set_value(text)\n\n")

        write_file.write("\n")

