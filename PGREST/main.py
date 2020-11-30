import json
import requests
import tkinter as tk
import urllib

root=tk.Tk()

# setting the windows size
root.geometry("600x400")

# declaring string variable
# for storing addr
addr_var=tk.StringVar()

# defining function to use address
def submit():

    addr=addr_entry.get()
    print("connecting to: " + addr + "...")

    with urllib.request.urlopen(addr) as url:
        data = json.loads(url.read().decode())
        # print(type(data))
        # print(json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))) # data dump

        rowBegin = 2
        # 'data' object is a python dictionary of dictionaries
        for item in data['paths']:
            # print(item)
            label = tk.Label(root, text = item)
            label.grid(row = rowBegin, column = 0)
            rowBegin = rowBegin + 1

    addr_var.set("")

# create label for entry widget
addr_label = tk.Label(root, text = 'address', font=('calibre', 10, 'bold'))

# create entry widget for address
addr_entry = tk.Entry(root, textvariable = addr_var,font=('calibre',10,'normal'))

# creating a button using the widget
# Button that will call the submit function
sub_btn=tk.Button(root,text = 'Submit', command = submit)

# placing the label and entry in
# the required position using grid
# method
addr_label.grid(row=0, column=0)
addr_entry.grid(row=0, column=1)
sub_btn.grid(row=1, column=1)

root.mainloop()