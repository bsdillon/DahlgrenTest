import tkinter  as tk
from tkinter import *
root = tk.Tk()
root.geometry("200x200")  # Size of the window

n=10 # number of buttons
i=3
for j in range(n):
    e = Button(root, text=j)
    e.grid(row=i, column=j)

root.mainloop()  # Keep the window open