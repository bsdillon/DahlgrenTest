import json
import requests
import tkinter as tk
import urllib

#create root panel
root=tk.Tk()
root.title("PGRest GUI v0.01")

# setting the windows size
# todo: make dynamic window that scales with displayed data
root.geometry("600x400")

# declaring variables
addr_var=tk.StringVar() # string for storing address
data = [] # root directory data

# defining function to display data in a root
def display(extension):
    print("reached function call")

    with urllib.request.urlopen(addr_entry.get() + extension) as url:
        # 'data' object is a python dictionary of dictionaries
        displayData = json.loads(url.read().decode())

        for item in displayData:
            print(item)

# defining function to connect to initial address
def connect():
    # get data from address
    with urllib.request.urlopen(addr_entry.get()) as url:
        # 'data' object is a python dictionary of dictionaries
        data = json.loads(url.read().decode())

    # establish beginning
    initCol = 0

    # todo: generate buttons that don't automatically press themselves
    for item in data['paths']:
        # don't display root directory as path option
        if item != "/" :
            # important note: creating buttons dynamically, you should pass a function
            # object instead of a function call. Easy way to do this, is using a lambda
            # i.e.
            directory = tk.Button(root, text = item, command =(lambda: display(item)))
            directory.grid(row = 2, column = initCol)
            initCol += 1

# create label for entry widget
addr_label = tk.Label(root, text = 'address', font=('calibre', 10, 'bold'))

# create entry widget for address
addr_entry = tk.Entry(root, textvariable = addr_var,font=('calibre',10,'normal'))

# Button that will call the connect function
sub_btn=tk.Button(root,text = 'connect', command = connect)

# positioning buttons with grid
# could switch to pack() in future
addr_label.grid(row=0, column=0)
addr_entry.grid(row=0, column=1)
sub_btn.grid(row=1, column=1)

# end
root.mainloop()