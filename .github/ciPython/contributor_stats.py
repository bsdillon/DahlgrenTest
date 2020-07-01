import datetime
import json
import os
import sys

# keeps track of total commits for each user
total = open(os.path.join("./html/", "total_commit.txt"), 'r')
# keeps daily track of total commits for each user
daily = open("daily_commit.txt", 'w')
# appends daily commits in javascript
daily_js = open(os.path.join("./html/", "daily_commits.js", "a")
data_file = sys.argv[1]
reader = open(data_file)
json_array = json.load(reader)
old_commits = {}
COMMIT_COUNT = 0
# writes a dictionary of old commits from users
for line in total:
    word_list = line.split()
    if len(word_list) > 0:
        if word_list[0] == "Total":
            COMMIT_COUNT = int(word_list[2])
        elif word_list[0] == "Developer:":
            old_commits[word_list[1]] = COMMIT_COUNT
count = 0
total.close()
# updates daily commits
d = datetime.datetime.today()
date = d.strftime("%d-%B-%Y")
# javacript appending
daily_js.write("date[\""+date+"\"]={")
daily.write(date)
daily.write(" Daily Commits\n\n")
while count < len(json_array):
    user = json_array[count]["author"]["login"]
    if old_commits.get(user) is None:
        daily.write("Daily Commits: 0")
        # javacript appending
        daily_js.write("\""+user+"\"" + ": 0")
        if count != len(json_array) - 1:
            daily_js.write(", ")
    else:
        daily.write("Daily Commits: ")
        old_count = old_commits[user]
        daily_count = json_array[count]["total"] - old_count
        daily.write(str(daily_count) + "\n")
        # javascript appending
        daily_js.write("\""+user+"\"" + ": " + str(daily_count))
        if count != len(json_array) - 1:
            daily_js.write(", ")
    daily.write("Developer: ")
    daily.write(user + "\n")
    daily.write("-----------------------------\n")
    count = count + 1
# javascript appending
daily_js.write("}\n")
count = 0
# updates total commits
total = open(os.path.join("./html/", "total_commit.txt"), 'w')
total.write(date)
total.write(" Total Commits\n\n")
while count < len(json_array):
    total.write("Total Commits: ")
    total.write(str(json_array[count]["total"]) + "\n")
    total.write("Developer: ")
    user = json_array[count]["author"]["login"]
    total.write(user + "\n")
    total.write("-----------------------------\n")
    count = count + 1
reader.close()
total.close()
daily.close()
