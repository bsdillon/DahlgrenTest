# currently, this won't work in the virtual environment (on my (Max's) machine)
# to activate the server (on linux or mac), put "export FLASK_APP=API_Flask_Test.py" into the command line
# on windows, do "set FLASK_APP=API_Flask_Test.py" instead
# you can use "export/set FLASK_ENV=development" to make the server restart whenever there is a change in the program
# that includes API_Request_Test, so changing that file will reset the server to its defaults
# note that the export/set commands MUST NOT have spaces around the "="

import requests
import json
import datetime

api_url = "https://www.boredapi.com/api/activity"
response = requests.get(api_url)
print(response)
print(response.status_code)
print(response.headers["Content-Type"])
# Raw bytes
print(response.content)
# As a string
print(response.text)
# As JSON, but prints ugly
#print(response.json())
print(json.dumps(response.json(), indent = 2))

print("\n\n")

api_url = "https://data.usajobs.gov/api/codelist/agencysubelements"
query = {"lastmodified":datetime.datetime(2021, 6, 1)}
response = requests.get(api_url, params = query)
print(response.status_code)
print(response.headers["Content-Type"])
print(json.dumps(response.json(), indent = 2))

print("\n\n")

try:
    # this is the default location that API_Flask_test.py opens its server
    api_url = "http://127.0.0.1:5000/meats"
    response = requests.get(api_url)
    response.raise_for_status()
    #cooode
    print(response.status_code)
    print(response.headers["Content-Type"])
    print(json.dumps(response.json(), indent = 2))

    targetToPost = {"color":"green", "weight":"light", "flavor":"strong", "personality":"vile"}

    loadedJSON = json.loads(response.text)
    
    if(targetToPost not in loadedJSON):
        response = requests.post(api_url, json = targetToPost)
        response.raise_for_status()
        #cooode
        print(response.status_code)
        print(json.dumps(response.json(), indent = 2))
    else:
        print("Target already there!")
    
except requests.exceptions.HTTPError as error:
    print(error)
