import requests
import json
import base64

# ignore ssl-type warnings for now
import warnings
warnings.filterwarnings("ignore")
#

userList = [
    {"user": "admin", "client_id": "w7h7Be8PJqExOliMvqOC0goi4lNhvnuJO7isjfQD", "client_secret": "9Bfb2TzZnf4Q70OAxL6yW1mfcczjCQoTOCQER6yAqrhRRkcfHKfBLbzn15Ligm4NyeX5nPtdkpG5l07sdLubsm1P6wmTXaWH8131cFIb1flGRW6T4auZhkmZKiNlm8G0"},
    {"user": "app101", "client_id": "JQqOTRzB9kSvhpuaThmFS78hp2ljSiFwDaW2x56Q", "client_secret": "gmTCF9ZaxLxjqHq1sPNkG0U3g77mLXASdcQ3EIJeAgjfrli4nhOEYlDv6XmD32sWoJysuCKZmjGZcIphRxSdSDa6lglKHDhkl41i0mvgVxAUiTdu9NA61yeB59t5tLPQ"},
    #{"user": "bogus", "client_id": "3NlXru6PPbpouGGPbmo2kQr1H5Xu8gROt1bFjwos", "client_secret": "yOyR9Z1pkt1Di0Zw6wmYUl7jVKNivvg89JY2FaW5JxJEqD7NlrtVgjK8PN6FSUyIf890M3yY4TUCdBAyzNkIFIsUTM8pZCNwyD0cuIOW8xXAzF36M0KUVVazei6nKRWW"},
    #{"user": "", "client_id": "", "client_secret": ""},
]
cert = "../venv/Lib/site-packages/sslserver/certs/development.crt"

rootURL = "https://localhost"#https://localhost:8000""

# post for a token using Client Credentials
def getAccessToken(client_id, secret, cert):
    credential = "{0}:{1}".format(client_id, secret)
    encoded_cred = base64.b64encode(credential.encode("utf-8"))
    headers = {
        "Authorization": "Basic {0}".format(encoded_cred.decode()),
        "Cache-Control": "no-cache",
        "Content-Type": "application/x-www-form-urlencoded"
    }
    token_url = rootURL + "/o/token/"

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
    response = requests.get(rootURL + "/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab101
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab101/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # post lab104
    print("POST lab104")
    access_token = getAccessToken(client_id, secret, cert)
    newLab = {"name": "lab104", "UIC": 104}
    response = requests.post(rootURL + "/labs/", json = newLab, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab104
    print("GET lab104")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab104/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify lab101 (PATCH and PUT both use the same permissions stuff so it should be ok don't worry about it)
    print("PATCH lab101")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"UIC": 1000}
    response = requests.patch(rootURL + "/labs/lab101/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # put lab101 back
    print("PATCH lab101")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"UIC": 101}
    response = requests.patch(rootURL + "/labs/lab101/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify lab104
    print("PATCH lab104")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"UIC": 40000}
    response = requests.patch(rootURL + "/labs/lab104/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # delete lab 104
    print("DELETE lab104")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.delete(rootURL + "/labs/lab104/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(response.status_code)
    # view the labs
    print("GET labs")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))

# tests
for user in userList:
    print("Current Application: " + user["user"])
    client_id = user["client_id"]
    secret = user["client_secret"]

    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # post a test to lab101
    print("POST to lab101")
    access_token = getAccessToken(client_id, secret, cert)
    newTest = {"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}
    response = requests.post(rootURL + "/labs/lab101/tests/", json = newTest, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    if ("id" in response.json()):
        posted101 = response.json()["id"]
    else:
        posted101 = None
    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the posted test
    print("GET lab101 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab101/tests/" + str(posted101) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # post a test to lab102
    print("POST to lab102")
    access_token = getAccessToken(client_id, secret, cert)
    newTest = {"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}
    response = requests.post(rootURL + "/labs/lab102/tests/", json = newTest, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    if ("id" in response.json()):
        posted102 = response.json()["id"]
    else:
        posted102 = None
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view the posted test
    print("GET lab102 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab102/tests/" + str(posted102) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify new lab101 test
    print("PATCH lab101 new test")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"testCasePassFail": True}
    response = requests.patch(rootURL + "/labs/lab101/tests/" + str(posted101) + "/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # modify new lab102 test
    print("PATCH lab102 new test")
    access_token = getAccessToken(client_id, secret, cert)
    patch = {"testCasePassFail": True}
    response = requests.patch(rootURL + "/labs/lab102/tests/" + str(posted102) + "/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # delete new lab101 test
    print("DELETE lab101 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.delete(rootURL + "/labs/lab101/tests/" + str(posted101) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(response.status_code)
    # view lab101 tests
    print("GET lab101")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
    # delete new lab102 test
    print("DELETE lab102 new test")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.delete(rootURL + "/labs/lab102/tests/" + str(posted102) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(response.status_code)
    # view lab102 tests
    print("GET lab102")
    access_token = getAccessToken(client_id, secret, cert)
    response = requests.get(rootURL + "/labs/lab102/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
    print(json.dumps(response.json(), indent = 2))
