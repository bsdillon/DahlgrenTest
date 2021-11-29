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

# note: all test *methods* must start with "test" if you want them to be run automatically!
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

    def do_specific_test(self, currentApplication, response, expectedStatus, expectedResponse):
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        actualStatus = response.status_code
        self.assertEqual(actualStatus, expectedStatus)
        actualResponse = loadResponseToJson(response)
        self.assertEqual(actualResponse, expectedResponse)
        print("OK!")
        
    def test_admin(self):
        # as admin
        currentApplication = self.admin
        # check access token
        accessTokenResponse = getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client)
        actual = accessTokenResponse.status_code
        expected = 200
        self.assertEqual(actual, expected)
        accessTokenResponse = loadResponseToJson(accessTokenResponse)
        actual = accessTokenResponse["access_token"]
        expected = AccessToken.objects.last().token
        self.assertEqual(actual, expected)
        actual = accessTokenResponse["expires_in"]
        expected = 15
        self.assertEqual(actual, expected)
        actual = accessTokenResponse["token_type"]
        expected = "Bearer"
        self.assertEqual(actual, expected)
        actual = accessTokenResponse["scope"]
        expected = "read write"
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 1}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}]
        self.assertEqual(actual, expected)

        self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                              200, [{"name": "testLab1", "UIC": 1}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}])

        # GET testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"name": "testLab1", "UIC": 1}
        self.assertEqual(actual, expected)

        # POST testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.post("/labs/", data={"name": "testLab4", "UIC": 4}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 201
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"name": "testLab4", "UIC": 4}
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 1}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 4}]
        self.assertEqual(actual, expected)

        # GET testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"name": "testLab4", "UIC": 4}
        self.assertEqual(actual, expected)

        # PATCH testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab1/", data={"UIC": 100}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"name": "testLab1", "UIC": 100}
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 4}]
        self.assertEqual(actual, expected)

        # PATCH testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab4/", data={"UIC": 400}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"name": "testLab4", "UIC": 400}
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 400}]
        self.assertEqual(actual, expected)

        # DELETE testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.delete("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 204
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}]
        self.assertEqual(actual, expected)

        # tests

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))        
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                    {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}]
        self.assertEqual(actual, expected)

        # GET testLab3 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab3/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You have permission to view this list, but it is either empty or contains only items you do not have permission to view."}
        self.assertEqual(actual, expected)

        # POST test to testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.post("/labs/testLab1/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 201
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}
        self.assertEqual(actual, expected)

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                    {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"},
                    {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # GET test 4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}
        self.assertEqual(actual, expected)

        # POST test to testLab2
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.post("/labs/testLab2/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 201
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"},
                    {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}]
        self.assertEqual(actual, expected)

        # GET test 5
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}
        self.assertEqual(actual, expected)

        # PATCH test 4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab1/tests/4/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}
        self.assertEqual(actual, expected)

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                    {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"},
                    {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # PATCH test 5
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab2/tests/5/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab2"}
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"},
                    {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab2"}]
        self.assertEqual(actual, expected)
        
        # DELETE test 4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.delete("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 204
        self.assertEqual(actual, expected)

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                    {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # DELETE test 5
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.delete("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 204
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}]
        self.assertEqual(actual, expected)
        
    def test_testLab1(self):
        # as testLab1
        currentApplication = self.testLab1
        # check access token
        accessTokenResponse = getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client)
        actual = accessTokenResponse.status_code
        expected = 200
        self.assertEqual(actual, expected)
        accessTokenResponse = loadResponseToJson(accessTokenResponse)
        actual = accessTokenResponse["access_token"]
        expected =AccessToken.objects.last().token
        self.assertEqual(actual, expected)
        actual = accessTokenResponse["expires_in"]
        expected = 15
        self.assertEqual(actual, expected)
        actual = accessTokenResponse["token_type"]
        expected = "Bearer"
        self.assertEqual(actual, expected)
        actual = accessTokenResponse["scope"]
        expected = "read write"
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 1}]
        self.assertEqual(actual, expected)

        # GET testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"name": "testLab1", "UIC": 1}
        self.assertEqual(actual, expected)

        # POST testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.post("/labs/", data={"name": "testLab4", "UIC": 4}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 1}]
        self.assertEqual(actual, expected)

        # GET testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 404
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "Not found."}
        self.assertEqual(actual, expected)

        # PATCH testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab1/", data={"UIC": 100}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 1}]
        self.assertEqual(actual, expected)

        # PATCH testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab4/", data={"UIC": 400}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 1}]
        self.assertEqual(actual, expected)

        # DELETE testLab4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.delete("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)

        # GET labs
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"name": "testLab1", "UIC": 1}]
        self.assertEqual(actual, expected)

        # tests

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # GET testLab3 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab3/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # POST test to testLab1
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.post("/labs/testLab1/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 201
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}
        self.assertEqual(actual, expected)

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                    {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # GET test 4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}
        self.assertEqual(actual, expected)

        # POST test to testLab2
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.post("/labs/testLab2/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # GET test 5
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # PATCH test 4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab1/tests/4/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}
        self.assertEqual(actual, expected)

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected =[{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                   {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # PATCH test 5
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.patch("/labs/testLab2/tests/5/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)
        
        # DELETE test 4
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.delete("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 204
        self.assertEqual(actual, expected)

        # GET testLab1 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 200
        self.assertEqual(actual, expected)
        actual =  loadResponseToJson(response)
        expected = [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"}]
        self.assertEqual(actual, expected)

        # DELETE test 5
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.delete("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)

        # GET testLab2 tests
        access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
        response = self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 403
        self.assertEqual(actual, expected)
        actual =  loadResponseToJson(response)
        expected = {"detail": "You do not have permission to perform this action."}
        self.assertEqual(actual, expected)

    def test_bogus(self):
        # bogus credentials
        client_id = "adasdad"
        client_secret = "wasdawds"
        # check access token
        accessTokenResponse = getAccessTokenResponse(client_id, client_secret, self.api_client)
        actual = accessTokenResponse.status_code
        expected = 401
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(accessTokenResponse)
        expected = {"error": "invalid_client"}
        self.assertEqual(actual, expected)

        # GET labs
        access_token = "addfhkdjksdfj"
        response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
        actual = response.status_code
        expected = 401
        self.assertEqual(actual, expected)
        actual = loadResponseToJson(response)
        expected = {"detail": "Authentication credentials were not provided."}
        self.assertEqual(actual, expected)
        
