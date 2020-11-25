import json
import requests
import tkinter as tk
import urllib


root = tk.Tk()
# setting the window's size
root.geometry("480x240")

#declaring string for storing addr
addr_var=tk.StringVar()

def get_api():

    addr=addr_entry.get()
    print("connecting to: " + addr + "...")

    with urllib.request.urlopen(addr) as url:
        data = json.loads(url.read().decode())
        print(type(data))
        # print(json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))) # data dump

        # 'data' object is a python dictionary of dictionaries
        for item in data['paths']:
            print(item)


tk.Label(root, text="URI to connect to").grid(row=0)

addr_entry = tk.Entry(root, textvariable = addr_var, width=32)
addr_entry.grid(row=0, column=1)

# tk.Button(root, text="Connect", command=( get_api() )).grid(row=1, column=1)

root.mainloop()






