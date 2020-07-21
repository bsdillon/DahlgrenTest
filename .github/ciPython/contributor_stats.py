import datetime
import json
import sys

# Read all data (from the dawn of time) in and parse
week_js = open("./html/cidata/weekly_commits.js", "a")
json_array = json.load(open(sys.argv[1]))
week_js.write("var contributions = {};\n")

count = 0
dates = []
while count < len(json_array):
    userData = json_array[count]
    USERNAME = userData["author"]["login"]
    if USERNAME == "actions-user":
        USERNAME = "GitHubAction"
    weeks = userData["weeks"]
    curr_week = weeks[len(weeks) - 2]
    d = datetime.datetime.fromtimestamp(curr_week["w"])
    date = d.strftime("%d-%B-%Y")
    if date not in dates:
        week_js.write("contributions[\'"+date+"\']={};\n")
        dates.append(date)
    week_js.write("contributions[\'" + date + "\'].")
    week_js.write(USERNAME+"="+str(curr_week["c"])+";\n")
    count += 1
