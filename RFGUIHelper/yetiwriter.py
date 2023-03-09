from widget import Widget, YetiImports, YetiTypes
from tkinter import messagebox as mb, simpledialog as sd
TAB="   "

def writeYeti(widgets, projPath, parentWindow):
    #determine that a project exists
    if projPath == None:
        mb.showerror(title="Error", message="No project is open at this time", parent=parentWindow)

    #Get the full name for the new window class being written
    className = sd.askstring("Yeti File", "\t\tAssign a Class Name WITH VERSION IF NEEDED\t\t")
    if className == "" or className == None:
        mb.showerror(title="Error", message="Class name is empty", parent=parentWindow)
        return
    className = className.lower()

    parentClass = sd.askstring("Parent Class", "\t\tAssign a parent class\t\t", initialvalue="Window")
    if (parentClass == "" or parentClass == None):
        parentClass = "Window"
    
    parentImport = sd.askstring("Parent Import", "\t\tGive the full import for parent class\t\t", initialvalue="from yeti.window import Window")
    if (parentImport == "" or parentImport == None):
        parentImport = "from yeti.window import Window"
    
    #parse important details from widgets
    uniqueImports = []
    anchorFiles = []
    movePoints = []
    radioGroups = {}
    tabGroups = {}
    fonts = (TAB*2)+"self.fonts={\n"
    rbValues = (TAB*2)+"self.rb_values={\n"
    x = 10000
    y = 10000
    w = 0
    h = 0
    widgetCode = (TAB*2)+"#-------------Widget---------------\n"
    needDisplay = False
    displayCode = (TAB*2)+"tmpDisplay = os.getenv('CONSOLE') + ':' + os.getenv('CONSOLE_TACSIT_X_DISPLAY')\n\n"

    for some_widget in widgets:
        name = some_widget.getValue("name")
        type = some_widget.getValue("type")

        #tmps is a set of imports all of which are necessary for the type of widget in question
        tmps = YetiImports[type]
        for tmp in tmps:
            if not tmp in uniqueImports:
                uniqueImports.append(tmp) 

        tempX = int(some_widget.getValue("X"))
        tempY = int(some_widget.getValue("Y"))
        tempW = int(some_widget.getValue("width"))
        tempH = int(some_widget.getValue("height"))

        if some_widget.hasValue("Font"):
            fonts = fonts + (TAB*3)+ "'"+name+"':'"+some_widget.getValue("Font")+"',\n"

        if type == 'Radio Button':
            #get the group name
            grp = some_widget.getValue('Group')
            if not grp in radioGroups:
                #create an empty list for new radioGroups
                radioGroups[grp] = []
            
            #add the name of the widget to the radioGroup
            radioGroups[grp].append(name)

        if type == 'Tab':
            #get the group name
            grp = some_widget.getValue('Group')
            if not grp in tabGroups:
                #create an empty list for new tabGroups
                tabGroups[grp] = []
            
            #add the name of the widget to the tabGroup
            tabGroups[grp].append(name)

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
        elif type=="MovePoint":
            movePoints.append((some_widget.getValue('Image file name'), tempX, tempY, name))
        else:
            dims = "("+str(tempX)+", "+str(tempY)+", "+str(tempW)+", "+str(tempH)+")"
            if type == "Radio Button":
                widgetCode = widgetCode + (TAB*2)+"self."+name+" = "+YetiTypes[type]+"(self, '"+str(some_widget.getValue('Value'))+"', "+dims+")\n"
            elif type == "Dropdown":
                widgetCode = widgetCode + (TAB*2)+"self."+name+" = "+YetiTypes[type]+"(self, '"+name+"', "+dims+", font='"+some_widget.getValue('Font')+"')\n"
            elif type == "Text Field":
                widgetCode = widgetCode + (TAB*2)+"self."+name+" = "+YetiTypes[type]+"(self, '"+name+"', "+dims+", tmpDisplay)\n"
                needDisplay = True
            else:
                widgetCode = widgetCode + (TAB*2)+"self."+name+" = "+YetiTypes[type]+"(self, '"+name+"', "+dims+")\n"

            widgetCode = widgetCode + (TAB*2)+"self.widgets['"+name+"'] = self."+name+"\n"

    fonts = fonts + (TAB*2)+"}\n\n"

    #all widgets are done. Create the radiobuttons.
    radioCode = ""
    if len(radioGroups)>0:
        radioCode = (TAB*2)+"#----------- RADIO BUTTONS -------------\n"
    rg_Index = 0
    for grp in radioGroups:
        radioCode = radioCode + (TAB*2)+"self.radioList_"+str(rg_Index)+" = ["
        for w_name in radioGroups[grp]:
            radioCode = radioCode + "self."+w_name+", "
        radioCode = radioCode + "]\n"
        radioCode = radioCode + (TAB*2)+"self."+grp+"=RadioButton(\n"
        radioCode = radioCode + (TAB*3)+"self, '"+grp+"', [0,0,0,0], self.radioList_"+str(rg_Index)+")\n"
        radioCode = radioCode + (TAB*2)+"self.widgets['"+grp+"']=self."+grp+"\n\n"
        rg_Index = rg_Index + 1

    #all widgets are done. Create the tabs.
    tabCode = ""
    if len(tabGroups)>0:
        tabCode = (TAB*2)+"#----------- TABS -------------\n"
    rg_Index = 0
    for grp in tabGroups:
        tabCode = tabCode + (TAB*2)+"self.tabList_"+str(rg_Index)+" = ["
        for w_name in tabGroups[grp]:
            tabCode = tabCode + "self."+w_name+", "
        tabCode = tabCode + "]\n"
        tabCode = tabCode + (TAB*2)+"self."+grp+"=Tabs(\n"
        tabCode = tabCode + (TAB*3)+"self, '"+grp+"', [0,0,0,0], self.tabList_"+str(rg_Index)+")\n"
        tabCode = tabCode + (TAB*2)+"self.widgets['"+grp+"']=self."+grp+"\n\n"
        rg_Index = rg_Index + 1

    #create the file for code
    file = projPath + "/" + className.lower() + ".py"
    with open(file, "w") as write_file:

        #write all the imports
        write_file.write("from robot.api.deco import keyword\n")

        if needDisplay:
            write_file.write("import os\n")

        write_file.write(parentImport+"\n")
        for line in uniqueImports:
            write_file.write(line+"\n")
        write_file.write("\n")
        #end of imports

        write_file.write("class "+className+"("+parentClass+"):\n")
        #setup Robot functions
        write_file.write(TAB+"ROBOT_LIBRARY_SCOPE = 'SUITE'\n")
        write_file.write(TAB+"ROBOT_AUTO_KEYWORDS = False\n\n")

        #write the init function
        write_file.write(TAB+"def __init__(self):\n")
        write_file.write((TAB*2)+"x="+str(x)+"\n")
        write_file.write((TAB*2)+"y="+str(y)+"\n")
        write_file.write((TAB*2)+"w="+str(w)+"\n")
        write_file.write((TAB*2)+"h="+str(h)+"\n\n")
        write_file.write((TAB*2)+"focused=[]\n")
        write_file.write((TAB*2)+"unfocused=[]\n")
        write_file.write((TAB*2)+"self.anchors={}\n")
        write_file.write((TAB*2)+"self.movePoints={}\n\n")
        write_file.write((TAB*2)+"self.widgets={}\n\n")

        if needDisplay:
            write_file.write(displayCode)

        write_file.write((TAB*2)+"#Add all anchors in window\n")
        for anc in anchorFiles:
            write_file.write((TAB*2)+"tmp = "+YetiTypes['Anchor']+"('rfw3/"+anc[0]+"', "+str(x - anc[1])+", "+str(y - anc[2])+", 0, 0)\n")
            write_file.write((TAB*2)+"self.anchors['"+anc[3]+"']=tmp\n")
            write_file.write((TAB*2)+"self.widgets['"+anc[3]+"']=tmp\n")
            write_file.write((TAB*2)+"focused.append(tmp)\n\n")
        for mp in movePoints:
            write_file.write((TAB*2)+"tmp = "+YetiTypes['MovePoint']+"('rfw3/"+mp[0]+"', "+str(x - mp[1])+", "+str(y - mp[2])+", 0, 0)\n")
            write_file.write((TAB*2)+"self.movePoints['"+mp[3]+"']=tmp\n")
            write_file.write((TAB*2)+"self.widgets['"+mp[3]+"']=tmp\n")
            write_file.write((TAB*2)+"focused.append(tmp)\n\n")
        
        write_file.write((TAB*2)+"super("+className+", self).__init__('"+className+" Window', [x,y,w,h], focused, unfocused)\n\n")

        write_file.write((TAB*2)+"#Add all widgets to window\n")
        write_file.write(widgetCode+"\n")

        #add value dictionaries
        write_file.write(fonts)

        #add the radio button groups base on past widgets
        write_file.write(radioCode)
        write_file.write(tabCode)

        #other functions
        write_file.write(TAB+"def get_widget(self, widget_name):\n")
        write_file.write((TAB*2)+"if widget_name in self.widgets:\n")
        write_file.write((TAB*3)+"return self.widgets[widget_name]\n\n")
        write_file.write((TAB*2)+"return LookupError('No widget with name '+widget_name)\n\n")

        write_file.write(TAB+"@keyword(name='Find')\n")
        write_file.write(TAB+"def findme(self):\n")
        write_file.write((TAB*2)+"self.find()\n\n")

        write_file.write(TAB+"@keyword(name='Select Radio')\n")
        write_file.write(TAB+"def selectRadio(self, widget_name, value):\n")
        write_file.write((TAB*2)+"return self.get_widget(widget_name).select(str(value))\n\n")

        write_file.write(TAB+"@keyword(name='Get Widget Region')\n")
        write_file.write(TAB+"def widgetRegion(self, widget_name):\n")
        write_file.write((TAB*2)+"return self.get_widget(widget_name).get_region()\n\n")

        write_file.write(TAB+"@keyword(name='Click')\n")
        write_file.write(TAB+"def Click(self, widget_name):\n")
        write_file.write((TAB*2)+"self.get_widget(widget_name).click()\n\n")

        write_file.write(TAB+"@keyword(name='Read')\n")
        write_file.write(TAB+"def Read(self, widget_name):\n")
        write_file.write((TAB*2)+"self.get_widget(widget_name).get_text(self.fonts[widget_name])\n\n")

        write_file.write(TAB+"@keyword(name='Write')\n")
        write_file.write(TAB+"def Write(self, widget_name, text):\n")
        write_file.write((TAB*2)+"self.get_widget(widget_name).set_value(text)\n\n")

        write_file.write("\n")

