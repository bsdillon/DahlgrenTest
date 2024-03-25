import tkinter as tk
from PIL import Image, ImageTk

class MainWindow():
    def __init__(self):
        self.test = None
        self.projFile = None
        self.window = tk.Tk()
        self.window.title("Test GUI")
        self.window.geometry("150x150")

        frame2 = tk.Frame(self.window)
        frame2.grid(row=2, column=0, columnspan=3, sticky=tk.N+tk.E+tk.W+tk.S)

        self.canvas = tk.Canvas(frame2, bg='#FFAAAA')
        self.canvas.pack(side="left", fill="both", expand=True)

        self.image_container = self.canvas.create_image(0, 0, anchor="nw")

        self.img = Image.open("test.png")
        self.tkImg = ImageTk.PhotoImage(self.img)
        self.canvas.itemconfig(self.image_container, image=self.tkImg)
        self.canvas.config(scrollregion=(0,0,self.img.width,self.img.height))
        self.canvas.update()

master = MainWindow()

master.window.mainloop()
