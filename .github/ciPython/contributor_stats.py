import datetime
import json
import sys

# Read all data (from the dawn of time) in and parse
daily_js = open("./html/cidata/daily_commits.js", "w")
json_array = json.load(open(sys.argv[1]))

count = 0
dates = []
while count < len(json_array):
    userData = json_array[count]
    userName = userData["author"]["login"]
    weeks = userData["weeks"]
    for w in weeks:
        d = datetime.datetime.fromtimestamp(w["w"])
        date = d.strftime("%d-%B-%Y")
        if date not in dates:
            daily_js.write("contributions[\'"+date+"\']={};\n")
            dates.append(date)
        daily_js.write("contributions[\'" + date + "\'].")
        daily_js.write(userName+"="+str(w["c"])+";\n")
    count += 1
