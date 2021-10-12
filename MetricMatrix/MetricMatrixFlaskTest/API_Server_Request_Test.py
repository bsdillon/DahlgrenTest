# currently, this won't work in the virtual environment (on my (Max's) machine)
# to activate the server (on linux or mac), put "export FLASK_APP=API_Flask_Server_Test.py" into the command line
# on windows, do "set FLASK_APP=API_Flask_Server_Test.py" instead
# you can use "export/set FLASK_ENV=development" to make the server restart whenever there is a change in the program
# that includes API_Server_Request_Test, so changing that file will reset the server to its defaults
# note that the export/set commands MUST NOT have spaces around the "="

import requests
import json

try:
    # this is the default location that API_Flask_test.py opens its server
    api_url = "https://127.0.0.1:5000/meats"

    # this is the cert file I am testing with, generated using OpenSSL:
    cert_file = "cert.pem"

    invalidResponse = True
    while invalidResponse:
        requestInput = input("Request type (GET, POST, PUT, PATCH, DELETE): ")
        requestInput = requestInput.upper()
        if(requestInput == "GET"):
            invalidResponse = False
            
            response = requests.get(api_url, verify = cert_file)
        elif(requestInput == "POST"):
            invalidResponse = False
            color = input("Color: ")
            weight = input("Weight: ")
            flavor = input("Flavor: ")
            personality = input("Personality: ")
            targetToPost = {"color":color, "weight":weight, "flavor":flavor, "personality":personality}

            response = requests.post(api_url, json = targetToPost, verify = cert_file)
        elif(requestInput == "PUT"):
            invalidResponse = False
            uuid = input("UUID: ")
            color = input("Color: ")
            weight = input("Weight: ")
            flavor = input("Flavor: ")
            personality = input("Personality: ")
            targetToPut = {"uuid":uuid, "color":color, "weight":weight, "flavor":flavor, "personality":personality}

            response = requests.put(api_url, json = targetToPut, verify = cert_file)
        elif(requestInput == "PATCH"):
            invalidResponse = False
            uuid = input("UUID: ")
            print("Any field that should not be updated must be left blank.")
            targetToPatch = {"uuid":uuid}
            color = input("Color: ")
            if(color != ""):
                targetToPatch["color"] = color
            weight = input("Weight: ")
            if(weight != ""):
                targetToPatch["weight"] = weight
            flavor = input("Flavor: ")
            if(flavor != ""):
                targetToPatch["flavor"] = flavor
            personality = input("Personality: ")
            if(personality != ""):
                targetToPatch["personality"] = personality

            response = requests.patch(api_url, json = targetToPatch, verify = cert_file)
        elif(requestInput == "DELETE"):
            invalidResponse = False
            uuid = input("UUID: ")

            response = requests.delete(api_url, data = {"uuid": uuid}, verify = cert_file)
        else:
            print("Invalid response, try again.")
        
    response.raise_for_status()
    #cooode
    print(response.status_code)
    if(response.status_code != 204):
        print(json.dumps(response.json(), indent = 2))
    
except requests.exceptions.HTTPError as errorH:
    print(errorH)
except requests.exceptions.ConnectionError as errorC:
    print(errorC)
