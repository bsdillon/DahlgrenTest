import datetime
import json
import os
import sys

# Read all data (from the dawn of time) in and parse
data = "./html/cidata/weekly_commits.js"
week_js = open(data, "w")
json_array = json.load(open(sys.argv[1]))
week_js.write("var contributions = {};\n")

COUNT = 0
INDEX = 0
dates = []
maxWeeks = len(json_array[COUNT]["weeks"])

while INDEX < maxWeeks:
    while COUNT < len(json_array):
        userData = json_array[COUNT]
        USERNAME = userData["author"]["login"]
        if USERNAME == "actions-user":
            USERNAME = "GitHubAction"
        USERNAME = USERNAME.replace('-', '')
        weeks = userData["weeks"]
        w = weeks[INDEX]
        d = datetime.datetime.fromtimestamp(w["w"])
        date = d.strftime("%x")
        if date not in dates:
            week_js.write("contributions[\'"+date+"\']={};\n")
            dates.append(date)
        week_js.write("contributions[\'" + date + "\'].")
        week_js.write(USERNAME+"="+str(w["c"])+";\n")
        COUNT += 1
    COUNT = 0
    INDEX += 1
