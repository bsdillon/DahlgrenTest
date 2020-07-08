import os
import sys

file = open(os.path.join("./html/cidata/", "change.txt"), "w")
file.write("Greetings, this is the NEW file.")

file.close()
