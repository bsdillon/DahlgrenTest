import tkinter as tk
from tkinter import messagebox, ttk
from widgeterror import WidgetError
from logmanagement import LogManager

class ValueButtons(ttk.Frame):
    def __init__(self, parent, low:int, high:int, value:int=0, callback=None, validateBounds=True):
        self.logger = LogManager("ValueButtons")
        self.logger.trace(f"Start ValueButtons", indent_delta=1)
        ttk.Frame.__init__(self, parent)
        self.callback = callback
        self.low = low
        self.high = high
        self.validate = validateBounds
        if self.validate and not((self.low<= value) and (value <= self.high)):
            raise WidgetError(str(value)+" is invalid: must be in the range ["+str(self.low)+", "+str(self.high)+"]")
        self.value = value
        self.columnconfigure(2,weight=1)
        self.myWidgets = []
        throwaway = tk.Button(self,text="<<", command=self.leftFive)
        throwaway.grid(row=0, column=0, sticky=tk.W)
        self.myWidgets.append(throwaway)
        throwaway = tk.Button(self,text="<", command=self.left)
        throwaway.grid(row=0, column=1, sticky=tk.W)
        self.myWidgets.append(throwaway)
        self.label = ttk.Label(self, text=str(self.value))
        self.label.config({"background": "#ffffff"})
        self.label.grid(row=0, column=2, sticky=tk.W+tk.E)
        self.label.config(anchor=tk.CENTER)
        throwaway = tk.Button(self,text=">", command=self.right)
        throwaway.grid(row=0, column=3, sticky=tk.E)
        self.myWidgets.append(throwaway)
        throwaway = tk.Button(self,text=">>", command=self.rightFive)
        throwaway.grid(row=0, column=4, sticky=tk.E)
        self.myWidgets.append(throwaway)
        self.logger.trace(f"End", indent_delta=-1)

    def changeValue(self, delta):
        '''
        All error checking is done here, so ALL value changes go through this function
        '''
        proposedValue = self.value + delta
        if ((self.low<= proposedValue) and (proposedValue <= self.high)) or (not self.validate):
            self.value = proposedValue
            self.label.config(text=str(self.value))
            if not self.callback == None:
                self.callback(self.value)

    def set(self, newValue:int):
        self.changeValue(newValue-self.value)
        if not newValue == self.value:
            messagebox.showerror(title="Range Error", message=str(newValue)+" is invalid: must be in the range ["+str(self.low)+", "+str(self.high)+"]", parent=self)

    def resetRange(self, low:int, high:int, value:int):
        self.logger.trace(f"Start: {low}<={value}<={high}", indent_delta=1)
        self.logger.debug(f"Proposed range: {low}<={value}<={high}")
        if self.validate:
            if not((low<= value) and (value <= high)):
                #messagebox.showerror(title="Range Error", message=f"{value} is invalid: must be in the range [{low}, {high}]", parent=self)
                if value < low:
                    value = low
                elif value > high:
                    value = high
                self.logger.debug(f"Adjusted range: {low}<={value}<={high}")
        self.low = low
        self.high= high
        self.set(value)
        self.logger.trace(f"End", indent_delta=-1)

    def get(self):
        return self.value

    def left(self):
        self.changeValue(-1)

    def right(self):
        self.changeValue(1)

    def rightFive(self):
        self.changeValue(5)

    def leftFive(self):
        self.changeValue(-5)

    def enable(self):
        for w in self.myWidgets:
            w.configure(state=tk.NORMAL)

    def disable(self):
        for w in self.myWidgets:
            w.configure(state=tk.DISABLED)

    def setBackground(self, color):
        for w in self.myWidgets:
            w.config({"background": color})
