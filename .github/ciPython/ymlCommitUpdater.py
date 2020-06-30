import datetime
import json
import os
import sys
from datetime import timedelta

# JSON data file of commit
datafile = sys.argv[1]
reader = open(datafile)
json_array = json.load(reader)

# Incremental commit history file
outputfile = sys.argv[2]
out_file = open(outputfile, 'w')

# Get commit meta data
commit_json = json["commit"]
com_message = commit_json["message"]
com_author = commit_json["author"]
com_name = com_author["name"]
com_date = com_author["date"]

# Write out meta data as new commit datum
out_file.write("commit["+com_date+"]={'meta': {'name': "+com_name+", 'message': "+com_message+"}, "

# Go through all the files committed
count = 0
for f in json_array["files"] :
    name = f["filename"]
    if name.[-3]=="yml"
        # We only want to print out yml files
        if count>0
            # We only want to add comma's between additional files
            out_file.write(", ")
        out_file.write(name+": "+f["patch"])
        count++

reader.close()
