import tkinter as tk
from tkinter import messagebox, ttk
from PIL import Image, ImageTk

fonts = [
    'Times New Roman 12pt',
    'Arial 11pt',
    'Calibri 11pt Bold'
]

fontImgs = [
    'img1.png',
    'img2.png',
    'img3.png'
]

class FontSelector(ttk.Frame):

    def __init__(self, parent, value):
        ttk.Frame.__init__(self, parent)
        self.menuValue = tk.StringVar()
        self.menuValue.set( fonts[0])
        throwaway = tk.OptionMenu(self, self.menuValue, *(fonts), command=self.updateFont)
        throwaway.grid(row=0, column=0, sticky=tk.W+tk.E)
        #default value
        self.value = fonts[0]
        self.image = Image.open(fontImgs[0])
        self.tkImage = ImageTk.PhotoImage(self.image)
        self.tkLabel = tk.Label(self, image=self.tkImage)
        self.tkLabel.grid(row=1, column=0, sticky=tk.W+tk.E)

        if len(value)==0:
            value = fonts[0]
        set(value)

    def updateFont(self, _):
        self.set(self.menuValue.get())
    
    def get(self):
        return self.value

    def set(self, newValue):
        index = fonts.index(newValue)

        if index == -1:
            messagebox.showerror(title="Range Error", message=str(newValue)+" is invalid: must be Font 1, Font 2, or Font 3", parent=self)
        else:
            self.changeFont(fontImgs[index])
            self.value = newValue

    def changeFont(self, file):
        self.image = Image.open(file)
        self.tkImage = ImageTk.PhotoImage(self.image)
        self.tkLabel.config(image=self.tkImage)