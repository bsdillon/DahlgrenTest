import ctypes
from mainwindow import MainWindow

ctypes.windll.shcore.SetProcessDpiAwareness(2)

master = MainWindow()

master.test.start()
#master.mainloop()
