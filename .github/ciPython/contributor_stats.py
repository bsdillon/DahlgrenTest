import datetime
import json
import os
import sys

# Read all data (from the dawn of time) in and parse
data = "./html/cidata/weekly_commits.js"
week_js = open(data, "a")
json_array = json.load(open(sys.argv[1]))
if os.stat(data).st_size == 0:
    week_js.write("var contributions = {};\n")

COUNT = 0
dates = []
while COUNT < len(json_array):
    userData = json_array[COUNT]
    USERNAME = userData["author"]["login"]
    if USERNAME == "actions-user":
        USERNAME = "GitHubAction"
    weeks = userData["weeks"]
    curr_week = weeks[len(weeks) - 1]
    d = datetime.datetime.fromtimestamp(curr_week["w"])
    date = d.strftime("%d-%B-%Y")
    if date not in dates:
        week_js.write("contributions[\'"+date+"\']={};\n")
        dates.append(date)
    week_js.write("contributions[\'" + date + "\'].")
    week_js.write(USERNAME+"="+str(curr_week["c"])+";\n")
    COUNT += 1
