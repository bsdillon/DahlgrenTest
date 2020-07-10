import sys
import datetime

# JSON data file of commit
datafile = sys.argv[1]
reader = open(datafile)
langs = {"hpp": "C++", "cc": "C", "java": "Java", "py": "Python", "html": "HTML"}
langs["yml"] = "YAML"
langs["css"] = "CSS"
langs["h"] = "C++"
langs["cpp"] = "C++"
langs["sh"] = "Shell"
langs["js"] = "JavaScript"
counts = {}
line = reader.readline()
while line:
    vals = line.strip().lower().split(' ')
    if "." in vals[1]:
        parts = vals[1].split('.')
        ext = parts[len(parts)-1]
        if len(ext) > 0 and ext in langs:
            lang = langs[ext]
            if lang not in counts:
                counts[lang] = 0
            counts[lang] += int(vals[0], 10)
    line = reader.readline()
reader.close()

# Incremental history file
outputfile = sys.argv[2]
out_file = open(outputfile, "a+")
date = datetime.datetime.now().strftime("%x")
for key in counts:
    out_file.write("slocs[\""+date+"\"][\""+key+"\"]="+str(counts[key])+";\n")
out_file.close()
