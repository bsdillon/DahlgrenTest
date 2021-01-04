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

target_var=tk.StringVar() # string for storing target of filter
filter_var=tk.StringVar() # string for storing type of filter
value_var=tk.StringVar() # string for storing value for filter

query = ""

# function for adding filter entries to path extension
def addFilter():
    # todo: check for valid input and break if invalid input detected
    # todo: build on to query string with query+target+filter+value
    print("filler")

# function to execute query
def query():
    # todo: copy most of code from displayPath() to display results of query
    # todo: print results of query to GUI screen
    print("filler but in query function")

# function for building remaining needed GUI elements
def buildGUI():

    #filter target i.e.
    target_entry = tk.Entry(root, textvariable = target_var,font=('calibre',10,'normal'), text = "target")
    target_entry.grid( row = 3, column = 0)

    # filter tags i.e. eq (equals)
    filters = tk.OptionMenu(root, filter_var, "eq", "gte", "gt","lte","lt",
                            "neq","like","ilike","in","is","@@","@>","<@","not")
    filters.grid( row = 3, column = 1)

    #filter value i.e. studentAge
    value_entry = tk.Entry(root, textvariable = value_var,font=('calibre',10,'normal'), text = "value")
    value_entry.grid( row = 3, column = 2)

    #button to add filter to path extension
    add_button = tk.Button(root, text = "Add", command =(lambda: addFilter))
    add_button.grid( row = 4, column = 0)

    #button to execute resulting query
    query_button = tk.Button(root, text = "Query", command =(lambda: query))
    query_button.grid( row = 4, column = 1)

# defining function to display data in a path
# also construct rest of GUI elements, namely filters
def displayPath(path):
    buildGUI()

    print("CONNECTING TO: "+addr_entry.get() + path)
    with urllib.request.urlopen(addr_entry.get() + path) as url:
        # 'data' object is a python dictionary of dictionaries
        displayData = json.loads(url.read().decode())

        iter=5
        for item in displayData:
            print(item)
            returnedText = tk.Label(root, text =item)
            returnedText.grid(row = iter, column = 1)
            iter += 1


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
            directory = tk.Button(root, text = item, command =(lambda: displayPath(item)))
            directory.grid(row = 2, column = iter)
            iter += 1

# create label for entry widget
addr_label = tk.Label(root, text = 'address', font=('calibre', 10, 'bold'))

# create entry widget for address
addr_entry = tk.Entry(root, textvariable = addr_var,font=('calibre',10,'normal'), width=16)

# Button that will call the connect function
sub_btn=tk.Button(root,text = 'connect', command =connect)

# positioning buttons with grid
# could switch to pack() in future
addr_label.grid(row=0, column=0)
addr_entry.grid(row=0, column=1)
sub_btn.grid(row=1, column=1)

# end
root.mainloop()