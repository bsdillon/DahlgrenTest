from mainwindow import MainWindow
import platform

if platform.system() == 'Windows':
    #required for windows applications.
    import ctypes
    ctypes.windll.shcore.SetProcessDpiAwareness(2)

#start main window
master = MainWindow()
master.window.mainloop()
