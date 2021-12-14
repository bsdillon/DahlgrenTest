import requests
import json
import base64
import sys

import warnings
warnings.filterwarnings("ignore")

cert = "../venv/Lib/site-packages/sslserver/certs/development.crt"

def getAccessToken(client_id, secret, cert):
    credential = "{0}:{1}".format(client_id, secret)
    encoded_cred = base64.b64encode(credential.encode("utf-8"))
    headers = {
        "Authorization": "Basic {0}".format(encoded_cred.decode()),
        "Cache-Control": "no-cache",
        "Content-Type": "application/x-www-form-urlencoded"
    }
    token_url = "https://localhost:8000/o/token/"
    
    tokenResponse = requests.post(token_url, headers=headers, data={"grant_type": "client_credentials"}, verify = cert)
    #print(json.dumps(tokenResponse.json(), indent = 2))
    # should maybe push out the error response if there is one e.g. with "bogus"
    if ("access_token" in tokenResponse.json()):
        return tokenResponse.json()["access_token"]
    else:
        return tokenResponse.json()["error"]

# demo stuff from here

print("Create new applications with these commands:\n"
      "python manage.py fullyrealizedapplication RFTESTER write\n"
      "python manage.py fullyrealizedapplication IWS1PEO readonly")
rftID = input("Enter RFTESTER's client ID: ")
rftSec = input("Enter RFTESTER's client secret: ")
peoID = input("Enter IWS1PEO's client ID: ")
peoSec = input("Enter IWS1PEO's client secret: ")

admin = {"client_id": "w7h7Be8PJqExOliMvqOC0goi4lNhvnuJO7isjfQD", "client_secret": "9Bfb2TzZnf4Q70OAxL6yW1mfcczjCQoTOCQER6yAqrhRRkcfHKfBLbzn15Ligm4NyeX5nPtdkpG5l07sdLubsm1P6wmTXaWH8131cFIb1flGRW6T4auZhkmZKiNlm8G0"}
rfTester = {"client_id": rftID, "client_secret": rftSec}
iws1peo = {"client_id": peoID, "client_secret": peoSec}

if (rfTester["client_id"] == ""
    or rfTester["client_secret"] == ""
    or iws1peo["client_id"] == ""
    or iws1peo["client_secret"] == ""):
    print("You forgot something! Remember to create the clients and add their creds here.")
    sys.exit()

# Create a new lab object as the admin:
print("admin will GET labs")
access_token = getAccessToken(admin["client_id"], admin["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("admin will POST cs11")
access_token = getAccessToken(admin["client_id"], admin["client_secret"], cert)
newLab = {"name": "cs11", "UIC": 11}
response = requests.post("https://localhost:8000/labs/", json = newLab, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("admin will GET labs")
access_token = getAccessToken(admin["client_id"], admin["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("RFTESTER will GET labs")
access_token = getAccessToken(rfTester["client_id"], rfTester["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("IWS1PEO will GET labs")
access_token = getAccessToken(iws1peo["client_id"], iws1peo["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("\nGrant RFTESTER and IWS1PEO read permissions for cs11 with these commands:\n"
      "python manage.py editpermissions grant RFTESTER view lab cs11\n"
      "python manage.py editpermissions grant IWS1PEO view lab cs11")
input("Press Enter to continue\n")

print("RFTESTER will GET labs")
access_token = getAccessToken(rfTester["client_id"], rfTester["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("IWS1PEO will GET labs")
access_token = getAccessToken(iws1peo["client_id"], iws1peo["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("RFTESTER will GET cs11 tests")
access_token = getAccessToken(rfTester["client_id"], rfTester["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/cs11/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("IWS1PEO will GET cs11 tests")
access_token = getAccessToken(iws1peo["client_id"], iws1peo["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/cs11/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("RFTESTER will POST to cs11")
access_token = getAccessToken(rfTester["client_id"], rfTester["client_secret"], cert)
newTest = {"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}
response = requests.post("https://localhost:8000/labs/cs11/tests/", json = newTest, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

postedCS11 = response.json()["id"]

print("Can IWS1PEO POST to cs11?")
access_token = getAccessToken(iws1peo["client_id"], iws1peo["client_secret"], cert)
newTest = {"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}
response = requests.post("https://localhost:8000/labs/cs11/tests/", json = newTest, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("RFTESTER will GET cs11 tests")
access_token = getAccessToken(rfTester["client_id"], rfTester["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/cs11/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("IWS1PEO will GET cs11 tests")
access_token = getAccessToken(iws1peo["client_id"], iws1peo["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/cs11/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("\nGrant IWS1PEO read permissions for the test with this command:\n"
      "python manage.py editpermissions grant IWS1PEO view test " + str(postedCS11))
input("Press Enter to continue\n")

print("IWS1PEO will GET cs11 tests")
access_token = getAccessToken(iws1peo["client_id"], iws1peo["client_secret"], cert)
response = requests.get("https://localhost:8000/labs/cs11/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))
