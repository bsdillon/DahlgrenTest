import tkinter as tk
from imagewindow import ImageWindow
from tkinter import ttk
import json
from widget import Widget

# FIRST WINDOW
# This window contains any action items for configuring the items and their information

class MainWindow():
    def __init__(self):
        window = tk.Tk()

        self.test = ImageWindow(self)
        window.title("RF GUI WIZARD")
        window.geometry("600x500")

        self.widget_list = []

        frame = tk.Frame(window)
        frame.grid()

        windowName = tk.Label(frame, text="Anchor File Name:")
        windowName.grid(row=0, column=0)

        self.anchorFileName = tk.Entry(frame)
        self.anchorFileName.grid(row=0, column=1)

        exportJSON = tk.Button(frame, text='Export to JSON', command=self.exportToJSON)
        exportJSON.grid(row=0, column=2)

        deleteSelection = tk.Button(frame, text='Delete Selection', command=self.delete)
        deleteSelection.grid(row=0, column=3)

        clear = tk.Button(frame, text='Clear Entries', command=self.clearEntries)
        clear.grid(row=0, column=4)

        #Here is where you can add more columns to the 'spreadsheet'
        table = ttk.Treeview(frame, show='headings', columns=(
            "Name", "Type", "X", "Y", "Width", "Height", "Group"), height=18)
        self.table = table
        table['show'] = 'headings'
        table.grid(row=1, column=0, columnspan=5)

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
        table.bind("<Button 1>", self.edit)

    def exportToJSON(self):
        children = self.table.get_children()
        tempList = []
        for x in children:
            print(self.table.item(x))
            tempVals = self.table.item(x).get('values')
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

    def clearEntries(self):
        for item in self.table.get_children():
            self.table.delete(item)

    def edit(self, event):
        # if table.get_children == :
            # return
        if self.table.identify_region(event.x, event.y) == 'cell':
            # the user clicked on a cell

            def ok(event):
                """Change item value."""
                self.table.set(item, column, entry.get())
                entry.destroy()

            column = self.table.identify_column(event.x)  # identify column
            item = self.table.identify_row(event.y)  # identify item
            x, y, width, height = self.table.bbox(item, column)
            value = self.table.set(item, column)

        elif self.table.identify_region(event.x, event.y) == 'heading':
            # the user clicked on a heading

            def ok(event):
                """Change heading text."""
                self.table.heading(column, text=entry.get())
                entry.destroy()

            column = self.table.identify_column(event.x)  # identify column
            # table.bbox work sonly with items so we have to get the bbox of the heading differently
            # get x and width (same as the one of any cell in the column)
            x, y, width, _ = self.table.bbox(self.table.get_children('')[0], column)
            # get vertical coordinates (y1, y2)
            y2 = y
            # get bottom coordinate
            while self.table.identify_region(event.x, y2) != 'heading':
                y2 -= 1
            # get top coordinate
            y1 = y2
            while self.table.identify_region(event.x, y1) == 'heading':
                y1 -= 1
            height = y2 - y1
            y = y1
            value = self.table.heading(column, 'text')

        elif self.table.identify_region(event.x, event.y) == 'nothing':
            column = self.table.identify_column(event.x)  # identify column
            # check whether we are below the last row:
            x, y, width, height = self.table.bbox(self.table.get_children('')[-1], column)
            if event.y > y:

                def ok(event):
                    """Change item value."""
                    # create item
                    item = self.table.insert("", "end", values=("", ""))
                    self.table.set(item, column, entry.get())
                    entry.destroy()

                y += height
                value = ""
            else:
                return
        else:
            return
        # display the Entry
        entry = ttk.Entry(self.table)  # create edition entry
        entry.place(x=x, y=y, width=width, height=height,
                    anchor='nw')  # display entry on top of cell
        entry.insert(0, value)  # put former value in entry
        entry.bind('<FocusOut>', lambda e: entry.destroy())
        entry.bind('<Return>', ok)  # validate with Enter
        entry.focus_set()

    def delete(self):
        # Get selected item to Delete
        selected_item = self.table.selection()[0]
        self.table.delete(selected_item)

    def newTableEntry(self, coords, type):
        self.table.insert(parent='',
            index='end',
            text='',
            values=("",  # needs to be populated by the user
                    # "",
                    self.variable.get(),
                    # firstClick.coords,
                    # secondClick.coords,
                    coords[0],
                    coords[1],
                    coords[2]-coords[0],
                    coords[3]-coords[1],
                    ""  # needs to be populated by the user
                    )
            )
        tempW = Widget("", type, coords[0], coords[1],
                    coords[2]-coords[0], coords[3]-coords[1], "")
        self.widget_list.append(tempW)