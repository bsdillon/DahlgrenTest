import json
import sys

# JSON data file of commit
datafile = sys.argv[1]
reader = open(datafile)
json_array = json.load(reader)
reader.close()

# Incremental commit history file
outputfile = sys.argv[2]
out_file = open(outputfile, "a+")

# See https://thispointer.com/
# how-to-append-text-or-lines-to-a-file-in-python/
# Scan to end of existing output file
# Move read cursor to the end of file
out_file.seek(0,2)
# If file is not empty then append '\n'
data = out_file.read(100)
if len(data) > 0 :
    out_file.write("\n")
# It is safe to append text at the end of file

# Get commit meta data
commit_json = json_array["commit"]
com_message = commit_json["message"]
com_author = commit_json["author"]
com_name = com_author["name"]
com_date = com_author["date"]

# Write out meta data as new commit datum
out_file.write("commit[\""+com_date+"\"]={\"developer\": \"")
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
out_file.write("]}")
out_file.close()
