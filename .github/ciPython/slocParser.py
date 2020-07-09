import json
import sys
import datetime

# JSON data file of commit
datafile = sys.argv[1]
reader = open(datafile)
langs = {"hpp": "C++", "cc": "C", "java": "Java", "py": "Python", "html": "HTML", "yml": "YAML", "css": "CSS", ".h": "C++", "cpp": "C++", "sh": "Shell", "js": "JavaScript"}
counts = {}
line = reader.readline()
while line:
    vals = line.strip().lower().split(' ');
    if "." in vals[1]:
        parts = vals[1].split('.')
        ext = parts[len(parts)-1]
        if len(ext) > 0 and ext in langs:
            lang = langs[ext]
            if lang not in counts:
                counts[ext]=0;
            counts[ext] += int(vals[0],10);
    line = reader.readline()
reader.close()

# Incremental history file
outputfile = sys.argv[2]
out_file = open(outputfile, "a+")
date = datetime.datetime.now().strftime("%x");
for key in counts:
   out_file.write("slocs["+date+"]["+key+"]="+str(counts[key])+";\n")
out_file.close()
