from django.test import TestCase

# Create your tests here.
from rest_framework.test import APIClient
from django.contrib.auth.models import User, Group
from oauth2_provider.models import get_application_model, get_access_token_model
from guardian.shortcuts import assign_perm
from .models import Lab, Test
import base64
import json

Application = get_application_model()
AccessToken = get_access_token_model()

# replicate the effects of the fullyrealizedapplication command
def generateTestApplication(name, group=None, isSuperuser=False):
    application_data = {"client_type": "confidential",
                        "authorization_grant_type": "client-credentials",
                        "name": name,
                        }
    new_application = Application(**application_data)
    if (isSuperuser):
        user = User.objects.create_superuser(new_application.name, password=new_application.client_secret)
    else:
        user = User.objects.create_user(new_application.name, password=new_application.client_secret)
    new_application.user = user

    if (group != None):
        user.groups.add(group)

    new_application.save()

    return new_application

# get access token
def getAccessTokenResponse(client_id, secret, api_client):
    credential = "{0}:{1}".format(client_id, secret)
    encoded_cred = base64.b64encode(credential.encode("utf-8"))
    token_url = "/o/token/"
    return api_client.post(token_url, data={"grant_type": "client_credentials"}, secure=True, HTTP_AUTHORIZATION="Basic {0}".format(encoded_cred.decode()), CONTENT_TYPE="application/x-www-form-urlencoded")

# load response to json
def loadResponseToJson(response):
    return json.loads(response.content.decode())

class LabAndTestTestCase(TestCase):
    def setUp(self):
        defaultPerms = Group.objects.create(name="Default Permissions")
        assign_perm("holisticPrototype.view_lab", defaultPerms)
        assign_perm("holisticPrototype.view_test", defaultPerms)
        assign_perm("holisticPrototype.add_test", defaultPerms)
        assign_perm("holisticPrototype.change_test", defaultPerms)
        assign_perm("holisticPrototype.delete_test", defaultPerms)
        
        self.api_client = APIClient()
        self.admin = generateTestApplication(name="admin", isSuperuser=True)
        self.testLab1 = generateTestApplication(name="testLab1", group=defaultPerms)
        testLab1Lab = Lab.objects.create(name="testLab1", UIC=1)
        testLab2Lab = Lab.objects.create(name="testLab2", UIC=2)
        Lab.objects.create(name="testLab3", UIC=3)
        testLab1Test = Test.objects.create(lab=testLab1Lab, eventStartDateTime="2020-01-01T00:00:00Z", eventEndDateTime="2021-01-01T00:00:00Z", testCasePassFail=True, eventStatus="LOCKED")
        Test.objects.create(lab=testLab1Lab, eventStartDateTime="2021-12-31T00:00:00Z", eventEndDateTime="2022-12-31T00:00:00Z", testCasePassFail=False, eventStatus="PLANNED")
        Test.objects.create(lab=testLab2Lab, eventStartDateTime="2022-12-31T00:00:00Z", eventEndDateTime="2023-12-31T00:00:00Z", testCasePassFail=False, eventStatus="PLANNED")

        assign_perm("view_lab", self.testLab1.user, testLab1Lab)
        assign_perm("view_test", self.testLab1.user, testLab1Test)
        assign_perm("add_test", self.testLab1.user, testLab1Test)
        assign_perm("change_test", self.testLab1.user, testLab1Test)
        assign_perm("delete_test", self.testLab1.user, testLab1Test)
        
    def test_all(self):
        currentApplication = self.admin
        # check access token
        accessTokenResponse = getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client)
        self.assertEqual(accessTokenResponse.status_code, 200)
        accessTokenResponse = loadResponseToJson(accessTokenResponse)
        self.assertEqual(accessTokenResponse["access_token"], AccessToken.objects.last().token)
        self.assertEqual(accessTokenResponse["expires_in"], 15)
        self.assertEqual(accessTokenResponse["token_type"], "Bearer")
        self.assertEqual(accessTokenResponse["scope"], "read write")

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, [{"name": "testLab1", "UIC": 1}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}])

        # GET testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, {"name": "testLab1", "UIC": 1})

        # POST testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.post("/labs/", data={"name": "testLab4", "UIC": 4}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 201)
        response = loadResponseToJson(response)
        self.assertEqual(response, {"name": "testLab4", "UIC": 4})

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, [{"name": "testLab1", "UIC": 1}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 4}])

        # GET testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, {"name": "testLab4", "UIC": 4})

        # PATCH testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab1/", data={"UIC": 100}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, {"name": "testLab1", "UIC": 100})

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 4}])

        # PATCH testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab4/", data={"UIC": 400}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, {"name": "testLab4", "UIC": 400})

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 400}])

        # DELETE testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.delete("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 204)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}])


        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        self.assertEqual(response.status_code, 200)
        response = loadResponseToJson(response)
        self.assertEqual(response, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                    {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}])
