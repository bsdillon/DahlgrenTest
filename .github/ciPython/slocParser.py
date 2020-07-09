import json
import sys
import datetime

# JSON data file of commit
datafile = sys.argv[1]
reader = open(datafile)

counts = {}
line = reader.readline()
while line:
    vals = line.strip().lower().split(' ');
    if "." in vals[1]:
        ext = vals[1].split('.')[1]
        if ext not in counts:
            counts[ext]=0;
        counts[ext] += int(vals[0],10);
    line = reader.readline()
reader.close()

# Incremental history file
outputfile = sys.argv[2]
out_file = open(outputfile, "a+")
date = datetime.datetime.now().strftime("%x");
for key in counts:
   out_file.write("slocs["+date+"]["+key+"]="+counts[key]+";\n")
out_file.close()
