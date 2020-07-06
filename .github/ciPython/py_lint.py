import os
import sys
from datetime import datetime

log = open(sys.argv[1])
current = datetime.now()

dt_string = current.strftime("%m/%d/%Y %H:%M:%S")
writer = open(os.path.join("./html/cidata/", "py_lint_log.txt"), "a")
writer.write(str(dt_string))
writer.write("\n------------------------\n")
# copies and write log
for line in log:
    writer.write(line)

writer.write("------------------------\n")
log.close()
writer.close()
