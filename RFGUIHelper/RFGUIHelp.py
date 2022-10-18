import tkinter as tk
from PIL import ImageTk, ImageGrab
from tkinter import Canvas, filedialog as fd, OptionMenu, StringVar, ttk
import json
from widget import Widget

import ctypes
ctypes.windll.shcore.SetProcessDpiAwareness(2)

# FIRST WINDOW
# This window contains any action items for configuring the items and their information

master = tk.Tk()
master.title("RF GUI WIZARD")
master.geometry("700x500")

master.widget_list = []

frame = tk.Frame(master)
frame.grid()


def loadImage():
    name = fd.askopenfilename()
    img = ImageTk.PhotoImage(file=name)
    test.img = img
    print(name)
    canvas.config(height=img.height(), width=img.width())
    print("img w/h: " + str(img.width()), str(img.height()))
    canvas.itemconfig(image_container, image=img)
    canvas.config(height=img.height(), width=img.width())
    canvas.update()
    print(str(canvas.winfo_width()) + " " + str(canvas.winfo_height()))


addImage = tk.Button(master, text='Click to Open File', command=loadImage)
addImage.grid(row=1, column=0)

master.pointSelectionStatus = False


def togglePointSelection():
    if master.pointSelectionStatus == False:
        master.pointSelectionStatus = True
        selectPoints.config(text="Stop Selecting Points")
    else:
        master.pointSelectionStatus = False
        selectPoints.config(text="Start Selecting Points")


selectPoints = tk.Button(
    master, text='Start Selecting Points', command=togglePointSelection)
selectPoints.grid(row=1, column=1)

variable = StringVar(master)
variable.set('Type')
dropdown = OptionMenu(master, variable, 'Anchor', 'Button', 'Radio Button',
                      'Widget', 'Tab', 'Text Field', 'Scroll Bar', 'Dropdown', 'Checkbox')
dropdown.grid(row=1, column=2)


def exportToJSON():
    children = table.get_children()
    tempList = []
    for x in children:
        print(table.item(x))
        tempVals = table.item(x).get('values')
        tempW = Widget(tempVals[0], tempVals[1],
                       tempVals[2], tempVals[3], tempVals[4], tempVals[5], tempVals[6])
        tempList.append(tempW)
    for x in tempList:
        x.print()
    # jsonString = json.dumps(master.widget_list[1])
    results = [obj.to_dict() for obj in tempList]
    jsdata = json.dumps(results)
    print(jsdata)
    print("Started writing JSON data into a file")
    with open("developer.json", "w") as write_file:
        json.dump(results, write_file)  # encode dict into JSON
    print("Done writing JSON data into .json file")


exportJSON = tk.Button(master, text='Export to JSON', command=exportToJSON)
exportJSON.grid(row=1, column=3)


def clearEntries():
    for item in table.get_children():
        table.delete(item)


clear = tk.Button(master, text='Clear Entries', command=clearEntries)
clear.grid(row=1, column=4)


def getPointSelectionStatus():
    return master.pointSelectionStatus


# SECOND WINDOW
# This window is for displaying the image that will be scraped for item coordinates

test = tk.Toplevel()

HEIGHT = 300
WIDTH = 300

frame2 = tk.Frame(test, width=WIDTH, height=HEIGHT)
frame2.grid()

canvas = Canvas(frame2, bg='#2FF2FF', width=300,
                height=300, scrollregion=(0, 0, 600, 600))

canvas.grid()

canvas.update()


# Add image to the Canvas Items
# canvas.create_image(0,0,anchor=tk.NW)
image_container = canvas.create_image(0, 0, anchor="nw")

master.count = 0
master.second_count = 0


def getCords(eventorigin):
    if getPointSelectionStatus():
        if master.count == 0:
            firstClick(eventorigin)
            master.count = master.count+1
        else:
            secondClick(eventorigin)
            canvas.update()
            coords = firstClick.coords + secondClick.coords
            table.insert(parent='',
                         index='end',
                         text='',
                         values=("",  # needs to be populated by the user
                                 # "",
                                 variable.get(),
                                 # firstClick.coords,
                                 # secondClick.coords,
                                 coords[0],
                                 coords[1],
                                 coords[2]-coords[0],
                                 coords[3]-coords[1],
                                 ""  # needs to be populated by the user
                                 )
                         )
            tempW = Widget("", variable.get(), coords[0], coords[1],
                           coords[2]-coords[0], coords[3]-coords[1], "")
            master.widget_list.append(tempW)
            # master.widget_list[master.second_count].print()
            master.second_count += 1
            offX, offY = canvas.winfo_rootx(), canvas.winfo_rooty()
            canvas.update()
            # print(x,y)
            coords = firstClick.coords + secondClick.coords
            if variable.get() == "Anchor":
                small_pic = ImageGrab.grab(
                    bbox=(coords[0]+offX, coords[1]+offY, coords[2]+offX, coords[3]+offY))
                small_pic.save(anchorFileName.get() + ".png")
                small_pic.show()
            master.count = 0
            # capture()

            # save_canvas()


def capture():
    canvas.update()
    x0 = canvas.winfo_rootx()
    y0 = canvas.winfo_rooty()
    x1 = x0 + canvas.winfo_width()
    y1 = y0 + canvas.winfo_height()
    # print(x0, y0, x1, y1)
    # print(canvas.winfo_screenheight(), canvas.winfo_screenwidth())
    im = ImageGrab.grab((x0, y0, x1, y1))
    im.save(anchorFileName.get() + '.png')  # Can also say im.show() to display it
    # im.show()


def firstClick(eventorigin):
    x0 = eventorigin.x
    y0 = eventorigin.y
    # print("Corner 1",x0,y0, variable.get())
    firstClick.coords = [x0, y0]
    return x0, y0


def secondClick(eventorigin):
    x0 = eventorigin.x
    y0 = eventorigin.y
    # print("Corner 2",x0,y0, variable.get())
    secondClick.coords = [x0, y0]
    return x0, y0


# edit table
def edit(event):
    # if table.get_children == :
        # return
    if table.identify_region(event.x, event.y) == 'cell':
        # the user clicked on a cell

        def ok(event):
            """Change item value."""
            table.set(item, column, entry.get())
            entry.destroy()

        column = table.identify_column(event.x)  # identify column
        item = table.identify_row(event.y)  # identify item
        x, y, width, height = table.bbox(item, column)
        value = table.set(item, column)

    elif table.identify_region(event.x, event.y) == 'heading':
        # the user clicked on a heading

        def ok(event):
            """Change heading text."""
            table.heading(column, text=entry.get())
            entry.destroy()

        column = table.identify_column(event.x)  # identify column
        # table.bbox work sonly with items so we have to get the bbox of the heading differently
        # get x and width (same as the one of any cell in the column)
        x, y, width, _ = table.bbox(table.get_children('')[0], column)
        # get vertical coordinates (y1, y2)
        y2 = y
        # get bottom coordinate
        while table.identify_region(event.x, y2) != 'heading':
            y2 -= 1
        # get top coordinate
        y1 = y2
        while table.identify_region(event.x, y1) == 'heading':
            y1 -= 1
        height = y2 - y1
        y = y1
        value = table.heading(column, 'text')

    elif table.identify_region(event.x, event.y) == 'nothing':
        column = table.identify_column(event.x)  # identify column
        # check whether we are below the last row:
        x, y, width, height = table.bbox(table.get_children('')[-1], column)
        if event.y > y:

            def ok(event):
                """Change item value."""
                # create item
                item = table.insert("", "end", values=("", ""))
                table.set(item, column, entry.get())
                entry.destroy()

            y += height
            value = ""
        else:
            return
    else:
        return
    # display the Entry
    entry = ttk.Entry(table)  # create edition entry
    entry.place(x=x, y=y, width=width, height=height,
                anchor='nw')  # display entry on top of cell
    entry.insert(0, value)  # put former value in entry
    entry.bind('<FocusOut>', lambda e: entry.destroy())
    entry.bind('<Return>', ok)  # validate with Enter
    entry.focus_set()


def delete():
    # Get selected item to Delete
    selected_item = table.selection()[0]
    table.delete(selected_item)


deleteSelection = tk.Button(master, text='Delete Selection', command=delete)
deleteSelection.grid(row=3, column=0)


windowName = tk.Label(master, text="Anchor File Name:")
windowName.grid(row=0, column=0)
anchorFileName = tk.Entry(master)
anchorFileName.grid(row=0, column=1)

#Here is where you can add more columns to the 'spreadsheet'
table = ttk.Treeview(master, show='headings', columns=(
    "Name", "Type", "X", "Y", "Width", "Height", "Group"), height=18)
table['show'] = 'headings'
table.grid(row=2, columnspan=5)

table['columns'] = ('Name', 'Type', 'X', 'Y', 'Width', 'Height', 'Group')

table.column("#0", width=0,  stretch=False)
table.column("Name", anchor=tk.CENTER, width=80)
table.column("Type", anchor=tk.CENTER, width=80)
table.column("X", anchor=tk.CENTER, width=80)
table.column("Y", anchor=tk.CENTER, width=80)
table.column("Width", anchor=tk.CENTER, width=80)
table.column("Height", anchor=tk.CENTER, width=80)
table.column("Group", anchor=tk.CENTER, width=80)

table.heading("#0", text="", anchor=tk.CENTER)
table.heading("Name", text="Name", anchor=tk.CENTER)
table.heading("Type", text="Type", anchor=tk.CENTER)
table.heading("X", text="X", anchor=tk.CENTER)
table.heading("Y", text="Y", anchor=tk.CENTER)
table.heading("Width", text="Width", anchor=tk.CENTER)
table.heading("Height", text="Height", anchor=tk.CENTER)
table.heading("Group", text="Group", anchor=tk.CENTER)
table.bind("<Button 1>", edit)

# mouseclick event
test.bind("<Button 2>", firstClick)
test.bind("<Button 1>", getCords)

canvas.update()

test.mainloop()
master.mainloop()

# radio button grouping
# tab grouping
#  value of grouping
#  drop down
#   number of items
#  Text fields, where they are
#
# Get the type dropdown in the table
#
