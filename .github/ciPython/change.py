import os
from datetime import datetime

current = datetime.now()
dt_string = current.strftime("%m/%d/%Y %H:%M:%S")
file = open(os.path.join("./html/cidata/", "change.txt"), "w")
file.write("Greetings, this is the NEW file modified at ")
file.write(dt_string)
file.write(".")

file.close()
