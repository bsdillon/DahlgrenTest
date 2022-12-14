import ctypes
from mainwindow import MainWindow

ctypes.windll.shcore.SetProcessDpiAwareness(2)

master = MainWindow()

master.window.mainloop()
# test.start()
#         self.top.lift()
#         self.top.mainloop()
