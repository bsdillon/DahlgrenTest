import datetime
import sys

# JSON data file of commit
datafile = sys.argv[1]
reader = open(datafile)
langs = {"hpp": "CPP", "cc": "C", "java": "Java"}
langs["py"]= "Python"
langs["html"]= "HTML"
langs["yml"] = "YAML"
langs["css"] = "CSS"
langs["h"] = "CPP"
langs["cpp"] = "CPP"
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
            v_int = int(vals[0], 10)
            counts[lang] += v_int
    line = reader.readline()
reader.close()

# Incremental history file
outputfile = sys.argv[2]
out_file = open(outputfile, "a+")
date = datetime.datetime.now().strftime("%x")
out_file.write("slocs[\""+date+"\"]={};\n")
for key in counts:
    out_file.write("slocs[\""+date+"\"]."+key+"="+str(counts[key])+";\n")
out_file.close()
