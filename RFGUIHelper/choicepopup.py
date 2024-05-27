import tkinter as tk
from tkinter import ttk

class ChoicePopup:
    #TODO this window can be made independent of parent as all modalities occur in mainwindow
    #This will improve dependency inversion (SOLID)
    def __init__(self, parent, title="Select One", choice_list=[None], already=[], single_select=True):
        '''
        Based on single_select, ChoicePopup either allows one or multiple selections and the language
        and button labels changes accordingly.
        
        The choice_list gives you all valid options and already identifies those which may already be 
        selected before the window opens. This feature allows you to (de)select options
        '''
        self.result = []
        self.button = False
        self.choice_win = tk.Toplevel(parent)
        h = parent.winfo_height()
        w = parent.winfo_width()
        x = parent.winfo_rootx()
        y = parent.winfo_rooty()
        self.choice_win.title(title)

        # GUI consist of
        # instruction row
        # selection row         combo or multi-list depending on the mode of operation
        # button action row     some of these are created with the selection row

        throwaway = tk.Label(self.choice_win, text='    ')
        throwaway.grid(row =0, column = 0, columnspan=2, sticky=tk.W+tk.E)

        throwaway = tk.Label(self.choice_win, text="Select an item:")
        throwaway.grid(row =0, column = 2, sticky=tk.W+tk.E)

        throwaway = tk.Label(self.choice_win, text='    ')
        throwaway.grid(row =0, column = 3, columnspan=2, sticky=tk.W+tk.E)

        #Just to fill spaced in row 2   | EMPTY#1 | DONE | EMPTY#2 | CANCEL | EMPTY#3 |
        throwaway = tk.Label(self.choice_win, text='    ')
        throwaway.grid(row =2, column = 0, sticky=tk.W+tk.E)

        throwaway = tk.Label(self.choice_win, text='    ')
        throwaway.grid(row =2, column = 2, sticky=tk.W+tk.E)

        throwaway = tk.Label(self.choice_win, text='    ')
        throwaway.grid(row =2, column = 4, sticky=tk.W+tk.E)

        if single_select:
            self.var = tk.StringVar()
            self.options = ttk.Combobox(self.choice_win, textvariable=self.var)
            self.options['values'] = choice_list
            self.var.set(choice_list[0]) # default option
            throwaway = tk.Button(self.choice_win, text='Done', command=self.buttonDone)
            throwaway.grid(row =2, column = 1, sticky=tk.W)
        else:
            self.options = tk.Listbox(self.choice_win, selectmode = "multiple")
            for item in choice_list:
                self.options.insert(tk.END, item)

            if len(already)>0:
                for item in already:
                    index = choice_list.index(item)
                    self.options.select_set(index)
                
            throwaway = tk.Button(self.choice_win, text='Done', command=self.allDone)
            throwaway.grid(row =2, column = 1, sticky=tk.W)

        throwaway = tk.Button(self.choice_win, text='Cancel', command=self.buttonCancel)
        throwaway.grid(row =2, column = 3, sticky=tk.E)

        self.options.grid(row =1, column = 0, columnspan=5, sticky=tk.W+tk.E+tk.S)

        self.choice_win.columnconfigure(index=0, weight=1) #give the most room to the empty labels
        self.choice_win.columnconfigure(index=2, weight=1)
        self.choice_win.columnconfigure(index=4, weight=1)
        self.choice_win.rowconfigure(index=1, weight=1) #give the most room to the options
        
        self.choice_win.update()
        #now that we have the geometry, center the pop-up on the parent
        #TODO this is another dependency on Parent that needs to be externalized.
        width=250
        height = self.choice_win.winfo_height()
        center_x = int(x+(w/2)-(width/2))
        center_y = int(y+(h/2)-(height/2))
        self.choice_win.geometry(str(width)+"x"+str(height)+"+"+str(center_x)+"+"+str(center_y))
        self.choice_win.resizable(False, False)

    def allDone(self):
        '''
        Called at the end of a successful multi-select
        '''
        self.button = True
        tmp = []
        for i in self.options.curselection():
            tmp.append(self.options.get(i))
        self.result = tmp
        self.choice_win.grab_release()
        self.choice_win.destroy()

    def buttonDone(self):
        '''
        Called at the end of a successful single-select
        '''
        self.button = True
        tmp = self.var.get()
        self.result = [tmp]
        self.choice_win.grab_release()
        self.choice_win.destroy()

    def buttonCancel(self):
        '''
        Called if the selection is canceled
        '''
        self.button = False
        self.choice_win.grab_release()
        self.choice_win.destroy()