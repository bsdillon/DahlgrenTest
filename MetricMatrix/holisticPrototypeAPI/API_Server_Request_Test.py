# currently, this won't work in the virtual environment (on my (Max's) machine)
# to activate the server (on linux or mac), put "export FLASK_APP=API_Flask_Server_Test.py" into the command line
# on windows, do "set FLASK_APP=API_Flask_Server_Test.py" instead
# you can use "export/set FLASK_ENV=development" to make the server restart whenever there is a change in the program
# that includes API_Server_Request_Test, so changing that file will reset the server to its defaults
# note that the export/set commands MUST NOT have spaces around the "="

import requests
import json

try:
    currentServerTarget = "Django" # "Flask" "FastAPI"

    if(currentServerTarget == "Flask"):
        # this is the default location that API_Flask_Server_Test.py opens its server
        api_url = "https://127.0.0.1:5000/meats"
    elif(currentServerTarget == "Django"):
        # this is the default location that testApi opens its Django server
        api_url = "http://127.0.0.1:8000/meats/"
    elif(currentServerTarget == "FastAPI"):
        # this is the default location that API_FastAPI_Server_Test.py opens its FastAPI server
        api_url = "http://127.0.0.1:8000/meats"

    # this is the cert file I am testing with, generated using OpenSSL:
    # set to False if you don't care about verified connections
    cert_file = False#"cert.pem"

    # known error: C:\Users\Maxwell\AppData\Local\Programs\Python\Python38\lib\site-packages\urllib3\connection.py:460: SubjectAltNameWarning: Certificate for 127.0.0.1 has no `subjectAltName`, falling back to check for a `commonName` for now. This feature is being removed by major browsers and deprecated by RFC 2818. (See https://github.com/urllib3/urllib3/issues/497 for details.)
    # attempted fix: https://docs.oracle.com/cd/E52668_01/E66514/html/ceph-issues-24424028.html
    # doesn't work, causes more problems...
    # solution is not clear here, it may be the case that direct access to IP addresses is not supported?

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
        # from here, the code is dependent on whether the server is the Flask or Django server
        elif(requestInput == "PUT"):
            invalidResponse = False
            uuid = input("ID: ")
            color = input("Color: ")
            weight = input("Weight: ")
            flavor = input("Flavor: ")
            personality = input("Personality: ")
            if(currentServerTarget == "Flask" or currentServerTarget == "FastAPI"):
                targetToPut = {"id":uuid, "color":color, "weight":weight, "flavor":flavor, "personality":personality}
                response = requests.put(api_url, json = targetToPut, verify = cert_file)
            elif(currentServerTarget == "Django"):
                targetToPut = {"color":color, "weight":weight, "flavor":flavor, "personality":personality}
                response = requests.put(api_url + uuid + "/", json = targetToPut, verify = cert_file)
        elif(requestInput == "PATCH"):
            invalidResponse = False
            uuid = input("ID: ")
            print("Any field that should not be updated must be left blank.")
            if(currentServerTarget == "Flask"):
                targetToPatch = {"id":uuid}
            elif(currentServerTarget == "Django"):
                targetToPatch = {}
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

            if(currentServerTarget == "Flask"):
                response = requests.patch(api_url, json = targetToPatch, verify = cert_file)
            elif(currentServerTarget == "Django"):
                response = requests.patch(api_url + uuid + "/", json = targetToPatch, verify = cert_file)
        elif(requestInput == "DELETE"):
            invalidResponse = False
            uuid = input("ID: ")
            if(currentServerTarget == "Flask" or currentServerTarget == "FastAPI"):
                response = requests.delete(api_url, data = {"id": uuid}, verify = cert_file)
            elif(currentServerTarget == "Django"):
                response = requests.delete(api_url + uuid, verify = cert_file)
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
