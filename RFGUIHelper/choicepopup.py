import tkinter as tk
from tkinter import ttk

class ChoicePopup:
    def __init__(self, parent, title="Select One", choicelist=[None], already=[], singleSelect=True):
        self.result = []
        self.button = False
        self.choicewin = tk.Toplevel(parent)
        h = parent.winfo_height()
        w = parent.winfo_width()
        x = parent.winfo_rootx()
        y = parent.winfo_rooty()
        self.choicewin.title(title)

        #first row
        throwaway = tk.Label(self.choicewin, text='    ')
        throwaway.grid(row =0, column = 0, columnspan=2, sticky=tk.W+tk.E)

        throwaway = tk.Label(self.choicewin, text="Select an item:")
        throwaway.grid(row =0, column = 2, sticky=tk.W+tk.E)

        throwaway = tk.Label(self.choicewin, text='    ')
        throwaway.grid(row =0, column = 3, columnspan=2, sticky=tk.W+tk.E)


        throwaway = tk.Label(self.choicewin, text='    ')
        throwaway.grid(row =2, column = 0, sticky=tk.W+tk.E)

        if singleSelect:
            self.var = tk.StringVar()
            self.options = ttk.Combobox(self.choicewin, textvariable=self.var)
            self.options['values'] = choicelist
            self.var.set(choicelist[0]) # default option
            throwaway = tk.Button(self.choicewin, text='Done', command=self.buttonDone)
            throwaway.grid(row =2, column = 1, sticky=tk.W)
        else:
            self.options = tk.Listbox(self.choicewin, selectmode = "multiple")
            for item in choicelist:
                self.options.insert(tk.END, item)

            if len(already)>0:
                for item in already:
                    index = choicelist.index(item)
                    self.options.select_set(index)
                
            throwaway = tk.Button(self.choicewin, text='Done', command=self.allDone)
            throwaway.grid(row =2, column = 1, sticky=tk.W)

        throwaway = tk.Label(self.choicewin, text='    ')
        throwaway.grid(row =2, column = 2, sticky=tk.W+tk.E)

        throwaway = tk.Button(self.choicewin, text='Cancel', command=self.buttonCancel)
        throwaway.grid(row =2, column = 3, sticky=tk.E)

        throwaway = tk.Label(self.choicewin, text='    ')
        throwaway.grid(row =2, column = 4, sticky=tk.W+tk.E)

        self.options.grid(row =1, column = 0, columnspan=5, sticky=tk.W+tk.E+tk.S)

        self.choicewin.columnconfigure(index=0, weight=1)
        self.choicewin.columnconfigure(index=2, weight=1)
        self.choicewin.columnconfigure(index=4, weight=1)
        self.choicewin.rowconfigure(index=1, weight=1)
        
        self.choicewin.update()
        width=250
        height = self.choicewin.winfo_height()
        centerX = int(x+(w/2)-(width/2))
        centerY = int(y+(h/2)-(height/2))
        self.choicewin.geometry(str(width)+"x"+str(height)+"+"+str(centerX)+"+"+str(centerY))
        self.choicewin.resizable(False, False)

    def allDone(self):
        self.button = True
        tmp = []
        for i in self.options.curselection():
            tmp.append(self.options.get(i))
        self.result = tmp
        self.choicewin.grab_release()
        self.choicewin.destroy()

    def buttonDone(self):
        self.button = True
        tmp = self.var.get()
        self.result = [tmp]
        self.choicewin.grab_release()
        self.choicewin.destroy()

    def buttonCancel(self):
        self.button = False
        self.choicewin.grab_release()
        self.choicewin.destroy()