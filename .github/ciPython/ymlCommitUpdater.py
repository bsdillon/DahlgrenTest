import json
import sys

# JSON data file of commit
datafile = sys.argv[1]
reader = open(datafile)
json_array = json.load(reader)
reader.close()

# Incremental history file
outputfile = sys.argv[2]
out_file = open(outputfile, "a+")

# Get commit meta data
commit_json = json_array["commit"]
com_message = commit_json["message"].replace("\n",":")
com_author = commit_json["author"]
com_name = com_author["name"]
com_date = com_author["date"]

# Write out meta data as new commit datum
out_file.write("\ncommit[\""+com_date+"\"]={\"developer\": \"")
out_file.write(com_name+"\", \"message\": \""+com_message)
out_file.write("\", \"files\": [")

# Go through all the files committed
count = 0
for f in json_array["files"]:
    name = f["filename"]
    if name[-3:] == 'yml':
        # We only want to print out yml files
        if count > 0:
            # We only want to add comma's between additional files
            out_file.write(", ")
        out_file.write("\""+name+"\"")
        count += 1
out_file.write("]};")
out_file.close()
