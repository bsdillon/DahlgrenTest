import requests
import json
import base64

# ignore ssl-type warnings for now
import warnings
warnings.filterwarnings("ignore")
#

admin = {"client_id": "uxsjRcQXcF8kcjrCAVRnUJNbgUrsOmkNe2BADNtd", "client_secret": "0KfnA11Y5sPwNdK3733PILl1VMDbromsVINNrWXhQtZPuKKxPJYaoekHtgVxjtkKS8on9IS9JbWNDJZclOuE3CDBOd8pvqaxgZq8YJcoTVOx0Mt7zawZ0ecraKMEdI4u"}
app101 = {"client_id": "IfohbSKEwENGyQWBNl15qpI81lt1phiOplvhYmV6", "client_secret": "9QzIgOuZoXwYzPoS57VIngjbLrPAU1WRu9FXqJJCLNfHrUTUPKKIFbj82XIph6LYfZw780XL0tu9YXVEdSamOY8imfNXrJvZRlM0nsAlZueNKfNuGansx9iOh22CmwAw"}

cert = "../venv/Lib/site-packages/sslserver/certs/development.crt"

rootURL = "https://localhost:8000"#"https://localhost"#

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


client_id = admin["client_id"]
secret = admin["client_secret"]
"""
print("POST lab104")
access_token = getAccessToken(client_id, secret, cert)
newLab = {"name": "lab104", "UIC": 104, "tests": [{"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}]}
response = requests.post(rootURL + "/labs/", json = newLab, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("POST to lab101")
access_token = getAccessToken(client_id, secret, cert)
newTest = {"eventStartDateTime": "2021-11-19T00:00", "eventEndDateTime": "2022-01-01T00:00", "testCasePassFail": False, "eventStatus": "PLANNED"}
response = requests.post(rootURL + "/labs/lab101/tests/", json = newTest, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))
if ("id" in response.json()):
    posted101 = response.json()["id"]
else:
    posted101 = None

client_id = app101["client_id"]
secret = app101["client_secret"]
print("GET lab101")
access_token = getAccessToken(client_id, secret, cert)
response = requests.get(rootURL + "/labs/lab101/tests/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))
client_id = admin["client_id"]
secret = admin["client_secret"]

print("DELETE lab101 new test")
access_token = getAccessToken(client_id, secret, cert)
response = requests.delete(rootURL + "/labs/lab101/tests/" + str(posted101) + "/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(response.status_code)

print("DELETE lab104")
access_token = getAccessToken(client_id, secret, cert)
response = requests.delete(rootURL + "/labs/lab104/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(response.status_code)
"""
#
"""
print("PATCH lab103")
access_token = getAccessToken(client_id, secret, cert)
patch = {"name": "lab303"}
response = requests.patch(rootURL + "/labs/lab103/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("PATCH lab303")
access_token = getAccessToken(client_id, secret, cert)
patch = {"name": "lab103"}
response = requests.patch(rootURL + "/labs/lab303/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("PATCH lab103")
access_token = getAccessToken(client_id, secret, cert)
patch = {"UIC": 303}
response = requests.patch(rootURL + "/labs/lab103/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

print("PATCH lab103")
access_token = getAccessToken(client_id, secret, cert)
patch = {"UIC": 103}
response = requests.patch(rootURL + "/labs/lab103/", json = patch, headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))
"""
