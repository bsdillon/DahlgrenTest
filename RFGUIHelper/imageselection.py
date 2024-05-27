import os
import shutil
import tkinter as tk
from PIL import Image, ImageTk
from valuebuttons import ValueButtons
from tkinter import ttk, messagebox as mb, filedialog as fd
from logmanagement import LogManager

class ImageSelection(ttk.Frame):
    '''
    ImageSelection is a custom UI component included in the WidgetEditor for the express purpose of
    identifying a target image for Sikuli to find during a test. It is commonly used to identify checked
    and unchecked radio buttons or checkboxes.
    '''
    #TODO in general if the image file fails it may require manual editing of the JSON file. 
    #See if you can get the errors handled automatically in this case.
    
    @staticmethod
    def get_default_data(x, y, w, h):
        return [None, None, x, y, x+w, y+h]
    
    def __init__(self, parent, save_path, name, data, unchecked_type=True, callback=None):
        ttk.Frame.__init__(self, parent)
        self.logger = LogManager("ImageSelection")
        self.logger.trace(f"Start", indent_delta=1)
        self.is_enabled = True
        self.parent = parent
        self.save_path = save_path
        self.callback = callback

        #by default the widget is for "checked", but we accomodate the unchecked type as well.
        self.check_text = "checked"
        if unchecked_type:
            self.check_text = "unchecked"
        self.widget_name = name+"_"+self.check_text

        self.configure_data(data)

        self.columnconfigure(index=1, weight=1)   
        self.select_button = tk.Button(self, text="Select  image...", command=self.select)
        self.select_button.grid(row=0, column=0, sticky=tk.W)
        
        self.label = ttk.Label(self, text="") #case 2 there is no image file
        self.label.grid(row=0, column=1, sticky=tk.W+tk.E)
        self.update_icon()
        self.update()
        self.logger.trace(f"End", indent_delta=-1)
    
    def update_icon(self):
        '''
        Used from two different cases to universally handle any localFile
        Defaults to no image at all, which is an acceptabled alternative.
        '''
        try:
            if self.local_file:#this is the already saved image
                img1 = Image.open(self.local_file)
                img1 = img1.resize((25, 25))
                self.tk_image = ImageTk.PhotoImage(img1)
                self.label.config(image=self.tk_image)
        except Exception as ex:
            pass #no harm no foul; no image is allowed
        #if no image is saved, no image is added.

    def configure_data(self, data):
        '''
        Called externally and internally to set the data for the image selection. Data is a ';' delimited
        string in the form
        
        source Image path;local image path;left;top;right;bottom
        '''
        self.logger.trace(f"Start", indent_delta=1)
        self.original_path = data[0]
        if self.original_path == "None":
            self.original_path = None

        if self.original_path: #test and perhaps override the original path
            try:
                Image.open(self.original_path)
            except:
                mb.showerror(title="Error", message="Original image path is invalid: "+self.original_path, parent=self.parent)
                self.original_path = None
        
        self.local_file = data[1]
        if self.local_file=="None":
            self.local_file=None

        self.location = [int(data[2]),int(data[3])]
        self.img_dimensions = [int(data[2]),int(data[3]),int(data[4])-int(data[2]),int(data[5])-int(data[3])]
        self.save_image()
        self.logger.trace(f"End", indent_delta=-1)

    def select(self):
        '''
        Called in response to a user action this method kicks off the ClickWindow modal to allow the user to select a new image.
        '''        
        self.logger.trace(f"Start {self.original_path}", indent_delta=1)
        original_path = self.original_path
        
        #If there is an existing source image, we can look at it again
        if not (self.original_path and mb.askyesno("Same image?", "Do you want to keep the same image?")):
            original_path = fd.askopenfilename(parent=self.parent, title="Select Image", filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
            if original_path == "":
                mb.showerror(title="Error", message="Image file not found", parent=self.parent)
                self.logger.trace(f"End", indent_delta=-1)
                return None

        #Generate the selection window
        the_window = self.parent
        while the_window:
            if isinstance(the_window, tk.Toplevel):
                break
            the_window = the_window.master
            
        if not the_window:
            the_window = self.parent
        
        cw = ClickWindow(the_window, self.check_text, original_path, self.img_dimensions)
        cw.choice_win.transient(the_window)
        cw.choice_win.grab_set()
        cw.choice_win.lift()
        self.wait_window(cw.choice_win)
        if cw.success:
            self.location = cw.location
            self.original_path = original_path

            self.callback()
        self.logger.trace(f"End", indent_delta=-1)

    def generate_local_file_path(self, name):
        '''
        Called internally to consistently generate the full file name
        '''
        ext = "png"
        return os.path.join(self.save_path, name +"."+ext)

    def save_image(self, new_dimensions=None):
        '''
        Called internally to have a consistent process for saving the image and updating 
        the image shown on UI.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        if new_dimensions:
            self.img_dimensions=new_dimensions
        box = (self.location[0], self.location[1], self.location[0]+self.img_dimensions[2], self.location[1]+self.img_dimensions[3])
        if self.original_path:
            self.local_file = self.generate_local_file_path(self.widget_name)
            image = Image.open(self.original_path).crop(box)
            image.save(self.local_file)
            self.update_icon()
            self.update()
            
        self.logger.trace(f"End", indent_delta=-1)
        return self.get()

    def update_name(self, new_name):
        '''
        Used externally to force the name of the widget to update with the widget.
        This enforces consistency and deletes any old images that may exist.
        '''
        self.logger.trace(f"Start {new_name}", indent_delta=1)
        try:
            old_file = self.generate_local_file_path(self.widget_name)
            temp_name = new_name+"_"+self.check_text
            new_file = self.generate_local_file_path(new_name)
            if os.path.exists(old_file) and os.path.exists(new_file):
                shutil.copyfile(old_file, new_file)
                #TODO I'm not at all sure if this is done in the right place. If the name change is PROPOSED
                #and the widget isn't updated, the move is still final. Likewise if the changes to the save file
                #aren't finalized, the move is still final. For now, leave things in this state but be aware
                #of the potential for error.
                
            self.widget_name = temp_name
        except Exception as ex:
            mb.showerror(title="Invalid name change", message="The new image name {new_name} failed with a message {ex}", parent=self.choice_win)
        self.logger.trace(f"End", indent_delta=-1)

    def get(self):
        '''
        Returns the single-string representation of the current image data
        '''
        if self.is_enabled:
            box = (self.location[0], self.location[1], self.location[0]+self.img_dimensions[2], self.location[1]+self.img_dimensions[3])
            if self.original_path:
                op = "None"
                if self.original_path:
                    op = self.original_path

                lf = "None"
                if self.local_file:
                    lf = self.local_file

                #[None, None, x, y, x+w, y+h]
                return op+";"+lf+";"+str(box[0])+";"+str(box[1])+";"+str(box[2])+";"+str(box[3])

            #[None, None, x, y, x+w, y+h]
            return "None;None;"+str(box[0])+";"+str(box[1])+";"+str(box[2])+";"+str(box[3])
        return ""

    def disable(self):
        self.logger.trace(f"Disabled")
        self.select_button.configure(state=tk.DISABLED)
        self.is_enabled = False

    def enable(self):
        self.logger.trace(f"Enabled")
        self.select_button.configure(state=tk.NORMAL)
        self.is_enabled = True
            
class ClickWindow():
    def __init__(self, parent, check_text, image_path, dimensions):
        self.logger = LogManager("ClickWindow")
        self.logger.trace(f"Start of initial startup", indent_delta=1)
        self.success = False
        self.choice_win = tk.Toplevel(parent)
        self.choice_win.title("Locate the "+check_text+" image")

        r = 1
        self.addLabels(self.choice_win, "X", r)
        self.x_location = ValueButtons(self.choice_win, 0, 100, 0, callback=self.update_overlay)
        self.x_location.grid(row=r, column=1, sticky=tk.E+tk.W)

        throwaway = tk.Label(self.choice_win)
        throwaway.grid(row=r, column=2, rowspan=4, sticky=tk.N+tk.E+tk.W+tk.S)

        throwaway = tk.Label(self.choice_win)
        throwaway.grid(row=r, column=3, rowspan=3, sticky=tk.N+tk.E+tk.W+tk.S)
        r += 1

        self.addLabels(self.choice_win, "Y", r)
        self.y_location = ValueButtons(self.choice_win, 0, 100, 0, callback=self.update_overlay)
        self.y_location.grid(row=r, column=1, sticky=tk.E+tk.W)
        r += 1

        self.addLabels(self.choice_win, "Width", r)
        self.width_dimension = ValueButtons(self.choice_win, 0, 100, 0, callback=self.update_overlay)
        self.width_dimension.grid(row=r, column=1, sticky=tk.E+tk.W)
        r += 1

        self.addLabels(self.choice_win, "Height", r)
        self.height_dimension = ValueButtons(self.choice_win, 0, 100, 0, callback=self.update_overlay)
        self.height_dimension.grid(row=r, column=1, sticky=tk.E+tk.W)

        throwaway = tk.Button(self.choice_win, text='Done', command=self.done)
        throwaway.grid(row=r, column=3, sticky=tk.N+tk.E+tk.W+tk.S)
        r += 1

        HEIGHT = 300
        WIDTH = 300
        frame2 = tk.Frame(self.choice_win, width=WIDTH, height=HEIGHT, bg="#000000")
        frame2.grid(row=r, column=0, columnspan=4, sticky=tk.N+tk.E+tk.W+tk.S)

        self.canvas = tk.Canvas(frame2, bg='#000000',width=300,height=300,scrollregion=(0,0,300,300))
        self.image_container = self.canvas.create_image(0, 0, anchor="nw")

        self.scrollbarV = ttk.Scrollbar(frame2, orient="vertical", command=self.canvas.yview)
        self.scrollbarH = ttk.Scrollbar(frame2, orient="horizontal", command=self.canvas.xview)
        
        self.scrollbarV.pack(side="right", fill="y")
        self.scrollbarH.pack(side="bottom", fill="x")
        self.canvas.pack(side="left", fill="both", expand=True)

        scrollable_frame = ttk.Frame(self.canvas)
        scrollable_frame.pack(side="left", fill="both", expand=True)
        scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(
                scrollregion=self.canvas.bbox("all")
            )
        )

        self.canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=self.scrollbarV.set)
        self.canvas.configure(xscrollcommand=self.scrollbarH.set)
        self.canvas.update()

        self.img = Image.open(image_path)
        if self.img.width<dimensions[2]:
          dimensions[2]=self.img.width

        if self.img.height<dimensions[3]:
          dimensions[3]=self.img.height

        # if self.img.width<dimensions[2] or self.img.height<dimensions[3]:
        #     #if the image is smaller than dimensions required, we need to let the user know
        #     mb.showerror(title="Image too small", message="(Un)checked icons should be at LEAST the size of the widget:\n("+str(dimensions[2])+", "+str(dimensions[3])+")", parent=self.choice_win)
        #     self.logger.trace(f"End of initial startup - FAIL", indent_delta=-1)
        #     self.choice_win.grab_release()
        #     self.choice_win.destroy()
        #     self.logger.trace(f"End - FAILED", indent_delta=-1)
        #     return
        
        self.tkImg = ImageTk.PhotoImage(self.img)

        self.canvas.itemconfig(self.image_container, image=self.tkImg)
        self.canvas.config(scrollregion=(0,0,self.img.width,self.img.height))
        self.canvas.update()

        self.dimensions = dimensions
        if self.dimensions[0]==-1 and self.dimensions[1]==-1:
            self.location = [int((self.img.width-self.dimensions[2])/2),int((self.img.height-self.dimensions[3])/2)]
            self.dimensions[0] = self.location[0]
            self.dimensions[1] = self.location[1]
        else:
            self.location = [self.dimensions[0], self.dimensions[1]]

        self.sensetive = False
        #this is done ONCE for the x and y dimensions
        self.x_location.resetRange(0, self.img.width, self.location[0])
        self.y_location.resetRange(0, self.img.height, self.location[1])

        #this is an initial w/h dimension
        self.width_dimension.resetRange(0, self.img.width, self.dimensions[2])
        self.height_dimension.resetRange(0, self.img.height, self.dimensions[3])
        self.sensetive = True

        self.overlay=None
        self.update_overlay(None)
        self.success=True
        self.logger.trace(f"End of initial startup", indent_delta=-1)

    def addLabels(self, panel, name, row):
        throwaway = tk.Label(panel, text=name)
        throwaway.grid(row=row, column=0, sticky="WE")

        tmpLabel = tk.Label(panel, text="")
        tmpLabel.grid(row=row, column=1)
        return throwaway

    def done(self):
        self.logger.trace(f"End Image Selection")
        self.choice_win.grab_release()
        self.choice_win.destroy()

    def narrower(self):
        self.dimensions[2] -= 1
        self.logger.debug(f"Width {self.dimensions[2]}")
        self.update_overlay()

    def wider(self):
        self.dimensions[2] += 1
        self.logger.debug(f"Width {self.dimensions[2]}")
        self.update_overlay()

    def shorter(self):
        self.dimensions[3] -= 1
        self.logger.debug(f"Height {self.dimensions[3]}")
        self.update_overlay()

    def taller(self):
        self.dimensions[3] += 1
        self.logger.debug(f"Height {self.dimensions[3]}")
        self.update_overlay()

    def slow_left(self):
        self.location[0] -= 1
        self.logger.debug(f"X {self.location[0]}")
        self.update_overlay()

    def fast_left(self):
        self.location[0] -= 5
        self.logger.debug(f"X {self.location[0]}")
        self.update_overlay()

    def slow_right(self):
        self.location[0] += 1
        self.logger.debug(f"X {self.location[0]}")
        self.update_overlay()

    def fast_right(self):
        self.location[0] += 5
        self.logger.debug(f"X {self.location[0]}")
        self.update_overlay()

    def slow_up(self):
        self.location[1] -= 1
        self.logger.debug(f"Y {self.location[1]}")
        self.update_overlay()

    def fast_up(self):
        self.location[1] -= 5
        self.logger.debug(f"Y {self.location[1]}")
        self.update_overlay()

    def slow_down(self):
        self.location[1] += 1
        self.logger.debug(f"Y {self.location[1]}")
        self.update_overlay()

    def fast_down(self):
        self.location[1] += 5
        self.logger.debug(f"Y {self.location[1]}")
        self.update_overlay()

    def update_overlay(self, _):
        if not self.sensetive:
            return
        
        #we are re-using the ValueButtons which passes a value we are NOT interested in
        self.logger.trace(f"Start", indent_delta=1)
        
        #this is where we get the relevant values.
        self.location[0] = int(self.x_location.get())
        self.location[1] = int(self.y_location.get())
        self.dimensions[2] = int(self.width_dimension.get())
        self.dimensions[3] = int(self.height_dimension.get())
        
        self.sensetive = False
        width_max = self.img.width-self.location[0]
        height_max = self.img.height-self.location[1]
        self.width_dimension.resetRange(0, width_max, min(self.dimensions[2], width_max))
        self.height_dimension.resetRange(0, height_max, min(self.dimensions[3], height_max))
        self.sensetive = True

        if self.overlay:
            # delete the existing overlay
            self.logger.trace(f"Delete overlay")
            self.canvas.delete(self.overlay.imageID)

        self.logger.trace(f"Create new image")
        # creates the baseline image
        fill="#ff0000"
        alpha = 128
        fill = self.choice_win.winfo_rgb(fill) + (alpha,)
        image = Image.new('RGBA', (self.dimensions[2], self.dimensions[3]), fill)
        self.overlay = ImageTk.PhotoImage(image)

        if self.location[0]<0:
            self.location[0]=0
        elif self.location[0]+self.dimensions[2]>self.img.width:
            self.location[0]=self.img.width-self.dimensions[2]

        if self.location[1]<0:
            self.location[1]=0
        elif self.location[1]+self.dimensions[3]>self.img.height:
            self.location[1]=self.img.height-self.dimensions[3]

        #TODO what in the world is going on? Why does it need a +1/2 size of overlay
        self.overlay.imageID = self.canvas.create_image(self.location[0]+int(self.dimensions[2]/2), self.location[1]+int(self.dimensions[3]/2), image=self.overlay)
        #self.overlay.imageID = self.canvas.create_image(self.location[0], self.location[1], image=self.overlay)
        self.logger.debug(f"Dimensions are ({self.location[0]}, {self.location[1]})x{self.dimensions[2]}+{self.dimensions[3]}")
        self.logger.trace(f"End", indent_delta=-1)

def other(self):
    self.choice_win.rowconfigure(index=6, weight=1)
    self.choice_win.columnconfigure(index=0, weight=1)
    self.choice_win.columnconfigure(index=5, weight=1)
    self.choice_win.columnconfigure(index=8, weight=1)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=0, column=0, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=0, column=1, columnspan=4, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=1, column=1, sticky=tk.N+tk.E+tk.W+tk.S)
    
    throwaway = tk.Button(self.choice_win, text='⤒', command=self.slow_up)
    throwaway.grid(row=1, column=2, sticky=tk.N+tk.E+tk.W+tk.S)
    throwaway = tk.Button(self.choice_win, text='⮅', command=self.fast_up)
    throwaway.grid(row=1, column=3, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=1, column=4, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=0, column=5, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Button(self.choice_win, text='⇤', command=self.slow_left)
    throwaway.grid(row=2, column=1, sticky=tk.N+tk.E+tk.W+tk.S)
    throwaway = tk.Button(self.choice_win, text='⮄', command=self.fast_left)
    throwaway.grid(row=3, column=1, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=2, column=2, columnspan=2, rowspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Button(self.choice_win, text='⇥', command=self.slow_right)
    throwaway.grid(row=2, column=4, sticky=tk.N+tk.E+tk.W+tk.S)
    throwaway = tk.Button(self.choice_win, text='⮆', command=self.fast_right)
    throwaway.grid(row=3, column=4, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=4, column=1, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Button(self.choice_win, text='⮇', command=self.fast_down)
    throwaway.grid(row=4, column=2, sticky=tk.N+tk.E+tk.W+tk.S)
    throwaway = tk.Button(self.choice_win, text='⤓', command=self.slow_down)
    throwaway.grid(row=4, column=3, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=4, column=4, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=0, column=5, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=0, column=6, columnspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Button(self.choice_win, text='△\n▽', command=self.taller)
    throwaway.grid(row=1, column=6, sticky=tk.N+tk.E+tk.W+tk.S)
    throwaway = tk.Button(self.choice_win, text='▽\n△', command=self.shorter)
    throwaway.grid(row=1, column=7, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Button(self.choice_win, text='Done', command=self.done)
    throwaway.grid(row=2, column=6, columnspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Button(self.choice_win, text='▷ ◁', command=self.narrower)
    throwaway.grid(row=3, column=6, sticky=tk.N+tk.E+tk.W+tk.S)
    throwaway = tk.Button(self.choice_win, text='◁ ▷', command=self.wider)
    throwaway.grid(row=3, column=7, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=4, column=6, columnspan=2, sticky=tk.N+tk.E+tk.W+tk.S)

    throwaway = tk.Label(self.choice_win)
    throwaway.grid(row=0, column=8, rowspan=5, sticky=tk.N+tk.E+tk.W+tk.S)
