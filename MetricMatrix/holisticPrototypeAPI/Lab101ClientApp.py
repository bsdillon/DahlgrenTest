import requests
import json
import base64

# ignore ssl-type warnings for now
import warnings
warnings.filterwarnings("ignore")
#

userList = [
    {"user": "admin", "client_id": "uxsjRcQXcF8kcjrCAVRnUJNbgUrsOmkNe2BADNtd", "client_secret": "0KfnA11Y5sPwNdK3733PILl1VMDbromsVINNrWXhQtZPuKKxPJYaoekHtgVxjtkKS8on9IS9JbWNDJZclOuE3CDBOd8pvqaxgZq8YJcoTVOx0Mt7zawZ0ecraKMEdI4u"},
    {"user": "lab101", "client_id": "IfohbSKEwENGyQWBNl15qpI81lt1phiOplvhYmV6", "client_secret": "9QzIgOuZoXwYzPoS57VIngjbLrPAU1WRu9FXqJJCLNfHrUTUPKKIFbj82XIph6LYfZw780XL0tu9YXVEdSamOY8imfNXrJvZRlM0nsAlZueNKfNuGansx9iOh22CmwAw"},
    #{"user": "bogus", "client_id": "3NlXru6PPbpouGGPbmo2kQr1H5Xu8gROt1bFjwos", "client_secret": "yOyR9Z1pkt1Di0Zw6wmYUl7jVKNivvg89JY2FaW5JxJEqD7NlrtVgjK8PN6FSUyIf890M3yY4TUCdBAyzNkIFIsUTM8pZCNwyD0cuIOW8xXAzF36M0KUVVazei6nKRWW"},
]
cert = "../venv/Lib/site-packages/sslserver/certs/development.crt"

# post for a token using Client Credentials
def getAccessToken(client_id, secret, cert):
    credential = "{0}:{1}".format(client_id, secret)
    encoded_cred = base64.b64encode(credential.encode("utf-8"))
    headers = {
        "Authorization": "Basic " + encoded_cred.decode(),
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

# maybe output to a file for testing purposes: output what client is making requests, permissions and authorizations, what requests they're making, expected output, what they get in reality
# labs
for user in userList:
    print("Current Application: " + user["user"])
    client_id = user["client_id"]
    secret = user["client_secret"]

    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab101
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab101/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # post lab104
    print("POST lab104")
    access_token = getAccessToken(client_id, secret, cert)
    newLab = {"name": "lab104", "UIC": 104}
    response = requests.post("https://localhost:8000/labs/", json = newLab, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab104
    print("GET lab104")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab104/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify lab101 (PATCH and PUT both use the same permissions stuff so it should be ok don't worry about it)
    print("PATCH lab101")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"UIC": 1000}
    response = requests.patch("https://localhost:8000/labs/lab101/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # put lab101 back
    print("PATCH lab101")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"UIC": 101}
    response = requests.patch("https://localhost:8000/labs/lab101/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify lab104
    print("PATCH lab104")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"UIC": 40000}
    response = requests.patch("https://localhost:8000/labs/lab104/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # delete lab 104
    print("DELETE lab104")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.delete("https://localhost:8000/labs/lab104/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(response.status_code)
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))

# tests
for user in userList:
    print("Current Application: " + user["user"])
    client_id = user["client_id"]
    secret = user["client_secret"]
    
    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # post a test to lab101
    print("POST to lab101")
    access_token = getAccessToken(client_id, secret, cert)
    newTest = {"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}
    response = requests.post("https://localhost:8000/labs/lab101/tests/", json = newTest, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    if ("id" in response.json()):
        posted101 = response.json()["id"]
    else:
        posted101 = None
    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the posted test
    print("GET lab101 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab101/tests/" + str(posted101) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # post a test to lab102
    print("POST to lab102")
    access_token = getAccessToken(client_id, secret, cert)
    newTest = {"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}
    response = requests.post("https://localhost:8000/labs/lab102/tests/", json = newTest, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    if ("id" in response.json()):
        posted102 = response.json()["id"]
    else:
        posted102 = None
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the posted test
    print("GET lab102 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab102/tests/" + str(posted102) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify new lab101 test
    print("PATCH lab101 new test")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"testCasePassFail": True}
    response = requests.patch("https://localhost:8000/labs/lab101/tests/" + str(posted101) + "/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify new lab102 test
    print("PATCH lab102 new test")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"testCasePassFail": True}
    response = requests.patch("https://localhost:8000/labs/lab102/tests/" + str(posted102) + "/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # delete new lab101 test
    print("DELETE lab101 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.delete("https://localhost:8000/labs/lab101/tests/" + str(posted101) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(response.status_code)
    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # delete new lab102 test
    print("DELETE lab102 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.delete("https://localhost:8000/labs/lab102/tests/" + str(posted102) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(response.status_code)
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get("https://localhost:8000/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
