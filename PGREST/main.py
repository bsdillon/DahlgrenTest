import json
import requests
import tkinter as tk
import urllib

#create root panel
root=tk.Tk()
root.title("PGRest GUI v0.01")

# declaring variables
addr_var=tk.StringVar() # string for storing address
data = [] # root directory data

# defining function to display data in a
def display(extension):
    print("CONNECTING TO: "+addr_entry.get() + extension)

    with urllib.request.urlopen(addr_entry.get() + extension) as url:
        # 'data' object is a python dictionary of dictionaries
        displayData = json.loads(url.read().decode())

        iter=4
        for item in displayData:
            print(item)
            returnedText = tk.Label(root, text =item)
            returnedText.grid(row = iter, column = 1)
            iter += 1

    # todo: add buttons for PGREST filters programatically here?

# defining function to connect to initial address,
# display available paths
def connect():
    # remove tailing '/' to prevent later connection issues
    if(addr_entry.get()[-1] == "/"):
        addr_entry.delete(len(addr_entry.get())-1)

    # get data from address
    with urllib.request.urlopen(addr_entry.get()) as url:
        # 'data' object is a python dictionary of dictionaries
        data = json.loads(url.read().decode())

    iter = 0
    for item in data['paths']:
        # don't display root directory as path option
        if item != "/" :
            # important note: creating buttons dynamically, you should pass a function
            # object instead of a function call. Easy way to do this, is using a lambda
            # i.e.
            directory = tk.Button(root, text = item, command =(lambda: display(item)))
            directory.grid(row = 2, column = iter)
            iter += 1

# create label for entry widget
addr_label = tk.Label(root, text = 'address', font=('calibre', 10, 'bold'))

# create entry widget for address
addr_entry = tk.Entry(root, textvariable = addr_var,font=('calibre',10,'normal'))

# Button that will call the connect function
sub_btn=tk.Button(root,text = 'connect', command =connect)

# positioning buttons with grid
# could switch to pack() in future
addr_label.grid(row=0, column=0)
addr_entry.grid(row=0, column=1)
sub_btn.grid(row=1, column=1)

# end
root.mainloop()