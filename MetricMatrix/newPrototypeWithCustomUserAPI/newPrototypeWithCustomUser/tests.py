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
        self.defaultPerms = Group.objects.create(name="Default Permissions")
        assign_perm("newPrototypeWithCustomUser.view_lab", self.defaultPerms)
        assign_perm("newPrototypeWithCustomUser.view_test", self.defaultPerms)
        assign_perm("newPrototypeWithCustomUser.add_test", self.defaultPerms)
        assign_perm("newPrototypeWithCustomUser.change_test", self.defaultPerms)
        assign_perm("newPrototypeWithCustomUser.delete_test", self.defaultPerms)
        
        self.api_client = APIClient()
        self.admin = generateTestApplication(name="admin", isSuperuser=True)
        self.testLab1 = generateTestApplication(name="testLab1", group=self.defaultPerms)
        
        testLab1Lab = Lab.objects.create(name="testLab1", UIC=1)
        testLab2Lab = Lab.objects.create(name="testLab2", UIC=2)
        testLab3Lab = Lab.objects.create(name="testLab3", UIC=3)
        
        testLab1Test = Test.objects.create(lab=testLab1Lab, eventStartDateTime="2020-01-01T00:00:00Z", eventEndDateTime="2021-01-01T00:00:00Z", testCasePassFail=True, eventStatus="LOCKED")
        testLab1OtherTest = Test.objects.create(lab=testLab1Lab, eventStartDateTime="2021-12-31T00:00:00Z", eventEndDateTime="2022-12-31T00:00:00Z", testCasePassFail=False, eventStatus="PLANNED")
        testLab2Test = Test.objects.create(lab=testLab2Lab, eventStartDateTime="2022-12-31T00:00:00Z", eventEndDateTime="2023-12-31T00:00:00Z", testCasePassFail=False, eventStatus="PLANNED")

        assign_perm("view_lab", self.testLab1.user, testLab1Lab)
        assign_perm("view_test", self.testLab1.user, testLab1Test)
        assign_perm("add_test", self.testLab1.user, testLab1Test)
        assign_perm("change_test", self.testLab1.user, testLab1Test)
        assign_perm("delete_test", self.testLab1.user, testLab1Test)
        # need to manually create the perm groups for the labs and tests since they're not created via POST here...
        self.testLab1ReadOnly = Group.objects.create(name="testLab1 Read-Only Permissions")
        self.testLab1Write = Group.objects.create(name="testLab1 Write Permissions")
        assign_perm("view_lab", self.testLab1ReadOnly, testLab1Lab)
        assign_perm("view_lab", self.testLab1Write, testLab1Lab)
        assign_perm("view_test", self.testLab1ReadOnly, testLab1Test)
        assign_perm("view_test", self.testLab1Write, testLab1Test)
        assign_perm("add_test", self.testLab1Write, testLab1Test)
        assign_perm("change_test", self.testLab1Write, testLab1Test)
        assign_perm("delete_test", self.testLab1Write, testLab1Test)
        assign_perm("view_test", self.testLab1ReadOnly, testLab1OtherTest)
        assign_perm("view_test", self.testLab1Write, testLab1OtherTest)
        assign_perm("add_test", self.testLab1Write, testLab1OtherTest)
        assign_perm("change_test", self.testLab1Write, testLab1OtherTest)
        assign_perm("delete_test", self.testLab1Write, testLab1OtherTest)
        
        self.testLab2ReadOnly = Group.objects.create(name="testLab2 Read-Only Permissions")
        self.testLab2Write = Group.objects.create(name="testLab2 Write Permissions")
        assign_perm("view_lab", self.testLab2ReadOnly, testLab2Lab)
        assign_perm("view_lab", self.testLab2Write, testLab2Lab)
        assign_perm("view_test", self.testLab2ReadOnly, testLab2Test)
        assign_perm("view_test", self.testLab2Write, testLab2Test)
        assign_perm("add_test", self.testLab2Write, testLab2Test)
        assign_perm("change_test", self.testLab2Write, testLab2Test)
        assign_perm("delete_test", self.testLab2Write, testLab2Test)
        
        self.testLab3ReadOnly = Group.objects.create(name="testLab3 Read-Only Permissions")
        self.testLab3Write = Group.objects.create(name="testLab3 Write Permissions")
        assign_perm("view_lab", self.testLab3ReadOnly, testLab3Lab)
        assign_perm("view_lab", self.testLab3Write, testLab3Lab)

    def do_specific_test(self, currentApplication, response, expectedStatus, expectedResponse = None, file = None):
        actualStatus = response.status_code
        print("Expected status: {0}".format(expectedStatus))
        print("Actual status:   {0}".format(actualStatus))
        if (file is not None):
            file.write("Expected status: {0}\n".format(expectedStatus))
            file.write("Actual status:   {0}\n".format(actualStatus))
        self.assertEqual(actualStatus, expectedStatus)
        if (expectedResponse is not None):
            actualResponse = loadResponseToJson(response)
            print("Expected response: {0}".format(expectedResponse))
            print("Actual response:   {0}".format(actualResponse))
            if (file is not None):
                file.write("Expected response: {0}\n".format(expectedResponse))
                file.write("Actual response:   {0}\n".format(actualResponse))
            self.assertEqual(actualResponse, expectedResponse)
        
    def test_admin(self):
        with open("test_admin_output.txt", "w") as output:
            print("\nApplication: admin")
            output.write("Application: admin\n")
            currentApplication = self.admin
            print("Check access token")
            output.write("Check access token\n")
            accessTokenResponse = getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client)
            actualStatus = accessTokenResponse.status_code
            expectedStatus = 200
            print("Expected status: {0}".format(expectedStatus))
            print("Actual status:   {0}".format(actualStatus))
            output.write("Expected status: {0}\n".format(expectedStatus))
            output.write("Actual status:   {0}\n".format(actualStatus))
            self.assertEqual(actualStatus, expectedStatus)
            accessTokenResponse = loadResponseToJson(accessTokenResponse)
            actual = accessTokenResponse["access_token"]
            expected = AccessToken.objects.last().token
            print("Expected token: {0}".format(expected))
            print("Actual token:   {0}".format(actual))
            output.write("Expected token: {0}\n".format(expected))
            output.write("Actual token:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = accessTokenResponse["expires_in"]
            expected = 15
            print("Expected expiration time: {0}".format(expected))
            print("Actual expiration time:   {0}".format(actual))
            output.write("Expected expiration time: {0}\n".format(expected))
            output.write("Actual expiration time:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = accessTokenResponse["token_type"]
            expected = "Bearer"
            print("Expected token type: {0}".format(expected))
            print("Actual token type:   {0}".format(actual))
            output.write("Expected token type: {0}\n".format(expected))
            output.write("Actual token type:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = accessTokenResponse["scope"]
            expected = "read write"
            print("Expected scopes: {0}".format(expected))
            print("Actual scopes:   {0}".format(actual))
            output.write("Expected scopes: {0}\n".format(expected))
            output.write("Actual scopes:   {0}\n".format(actual))
            self.assertEqual(actual, expected)

            # labs

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}], file=output)

            print("GET testLab1")
            output.write("GET testLab1\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"name": "testLab1", "UIC": 1}, file=output)

            print("POST testLab4")
            output.write("POST testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.post("/labs/", data={"name": "testLab4", "UIC": 4}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  201, {"name": "testLab4", "UIC": 4}, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 4}], file=output)
            
            print("GET testLab4")
            output.write("GET testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"name": "testLab4", "UIC": 4}, file=output)

            print("PATCH testLab1")
            output.write("PATCH testLab1\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab1/", data={"UIC": 100}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"name": "testLab1", "UIC": 100}, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 4}], file=output)
            
            print("PATCH testLab4")
            output.write("PATCH testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab4/", data={"UIC": 400}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"name": "testLab4", "UIC": 400}, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}, {"name": "testLab4", "UIC": 400}], file=output)

            print("DELETE testLab4")
            output.write("DELETE testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.delete("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  204, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 100}, {"name": "testLab2", "UIC": 2}, {"name": "testLab3", "UIC": 3}], file=output)

            # tests

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                        {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}], file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}], file=output)

            print("GET testLab3 tests")
            output.write("GET testLab3 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab3/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"detail": "You have permission to view this list, but it is either empty or contains only items you do not have permission to view."}, file=output)

            print("POST test to testLab1")
            output.write("POST test to testLab1\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.post("/labs/testLab1/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  201, {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                        {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"},
                                        {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}], file=output)

            print("GET test 4")
            output.write("GET test 4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}, file=output)

            print("POST test to testLab2")
            output.write("POST test to testLab2\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.post("/labs/testLab2/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  201, {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}, file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200,  [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"},
                                         {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}], file=output)

            print("GET test 5")
            output.write("GET test 5\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}, file=output)

            print("PATCH test 4")
            output.write("PATCH test 4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab1/tests/4/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                        {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"},
                                        {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}], file=output)

            print("PATCH test 5")
            output.write("PATCH test 5\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab2/tests/5/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab2"}, file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"},
                                        {"id": 5, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab2"}], file=output)
            
            print("DELETE test 4")
            output.write("DELETE test 4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.delete("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  204, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                        {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}], file=output)
            print("DELETE test 5")
            output.write("DELETE test 5\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.delete("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  204, file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 3, "eventStartDateTime": "2022-12-31T00:00:00Z", "eventEndDateTime": "2023-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab2"}], file=output)
        
    def test_testLab1(self):
        with open("test_testLab1_output.txt", "w") as output:
            print("\nApplication: testLab1")
            output.write("Application: testLab1\n")
            currentApplication = self.testLab1
            print("Check access token")
            output.write("Check access token\n")
            accessTokenResponse = getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client)
            actualStatus = accessTokenResponse.status_code
            expectedStatus = 200
            print("Expected status: {0}".format(expectedStatus))
            print("Actual status:   {0}".format(actualStatus))
            output.write("Expected status: {0}\n".format(expectedStatus))
            output.write("Actual status:   {0}\n".format(actualStatus))
            self.assertEqual(actualStatus, expectedStatus)
            accessTokenResponse = loadResponseToJson(accessTokenResponse)
            actual = accessTokenResponse["access_token"]
            expected = AccessToken.objects.last().token
            print("Expected token: {0}".format(expected))
            print("Actual token:   {0}".format(actual))
            output.write("Expected token: {0}\n".format(expected))
            output.write("Actual token:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = accessTokenResponse["expires_in"]
            expected = 15
            print("Expected expiration time: {0}".format(expected))
            print("Actual expiration time:   {0}".format(actual))
            output.write("Expected expiration time: {0}\n".format(expected))
            output.write("Actual expiration time:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = accessTokenResponse["token_type"]
            expected = "Bearer"
            print("Expected token type: {0}".format(expected))
            print("Actual token type:   {0}".format(actual))
            output.write("Expected token type: {0}\n".format(expected))
            output.write("Actual token type:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = accessTokenResponse["scope"]
            expected = "read write"
            print("Expected scopes: {0}".format(expected))
            print("Actual scopes:   {0}".format(actual))
            output.write("Expected scopes: {0}\n".format(expected))
            output.write("Actual scopes:   {0}\n".format(actual))
            self.assertEqual(actual, expected)

            # labs

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}], file=output)

            print("GET testLab1")
            output.write("GET testLab1\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"name": "testLab1", "UIC": 1}, file=output)

            print("POST testLab4")
            output.write("POST testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.post("/labs/", data={"name": "testLab4", "UIC": 4}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}], file=output)

            print("GET testLab4")
            output.write("GET testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  404, {"detail": "Not found."}, file=output)

            print("PATCH testLab1")
            output.write("PATCH testLab1\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab1/", data={"UIC": 100}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}], file=output)

            print("PATCH testLab4")
            output.write("PATCH testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab4/", data={"UIC": 400}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}], file=output)

            print("DELETE testLab4")
            output.write("DELETE testLab4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.delete("/labs/testLab4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, file=output)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}], file=output)

            # tests

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"}], file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("GET testLab3 tests")
            output.write("GET testLab3 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab3/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("POST test to testLab1")
            output.write("POST test to testLab1\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.post("/labs/testLab1/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  201, {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                        {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}], file=output)

            print("GET test 4")
            output.write("GET test 4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}, file=output)

            print("POST test to testLab2")
            output.write("POST test to testLab2\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.post("/labs/testLab2/tests/", data={"eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("GET test 5")
            output.write("GET test 5\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("PATCH test 4")
            output.write("PATCH test 4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab1/tests/4/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                        {"id": 4, "eventStartDateTime": "2021-11-19T00:00:00Z", "eventEndDateTime": "2022-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "COMPLETED", "lab": "testLab1"}], file=output)

            print("PATCH test 5")
            output.write("PATCH test 5\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.patch("/labs/testLab2/tests/5/", data={"testCasePassFail": True, "eventStatus": "COMPLETED"}, secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)
            
            print("DELETE test 4")
            output.write("DELETE test 4\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.delete("/labs/testLab1/tests/4/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  204, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"}], file=output)

            print("DELETE test 5")
            output.write("DELETE test 5\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.delete("/labs/testLab2/tests/5/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, file=output)

            print("GET testLab2 tests")
            output.write("GET testLab2 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab2/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

    def test_bogus(self):
        with open("test_bogus_output.txt", "w") as output:
            print("\nApplication: bogus")
            output.write("Application: bogus\n")
            client_id = "adasdad"
            client_secret = "wasdawds"
            print("Check access token")
            output.write("Check access token\n")
            accessTokenResponse = getAccessTokenResponse(client_id, client_secret, self.api_client)
            actual = accessTokenResponse.status_code
            expected = 401
            print("Expected status: {0}".format(expected))
            print("Actual status:   {0}".format(actual))
            output.write("Expected status: {0}\n".format(expected))
            output.write("Actual status:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = loadResponseToJson(accessTokenResponse)
            expected = {"error": "invalid_client"}
            print("Expected response: {0}".format(expected))
            print("Actual response:   {0}".format(actual))
            output.write("Expected response: {0}\n".format(expected))
            output.write("Actual response:   {0}\n".format(actual))
            self.assertEqual(actual, expected)

            print("GET labs")
            output.write("GET labs\n")
            access_token = "addfhkdjksdfj"
            response = self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token))
            actual = response.status_code
            expected = 401
            print("Expected status: {0}".format(expected))
            print("Actual status:   {0}".format(actual))
            output.write("Expected status: {0}\n".format(expected))
            output.write("Actual status:   {0}\n".format(actual))
            self.assertEqual(actual, expected)
            actual = loadResponseToJson(response)
            expected = {"detail": "Authentication credentials were not provided."}
            print("Expected response: {0}".format(expected))
            print("Actual response:   {0}".format(actual))
            output.write("Expected response: {0}\n".format(expected))
            output.write("Actual response:   {0}\n".format(actual))
            self.assertEqual(actual, expected)

    def test_permissionGroups(self):
        with open("test_permissionGroups_output.txt", "w") as output:
            currentApplication = generateTestApplication(name="GroupPermTest", group=self.defaultPerms)
            print("\nApplication: GroupPermTest")
            # check labs and testLab1's tests outside the group, in the group, then outside again
            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"detail": "You have permission to view this list, but it is either empty or contains only items you do not have permission to view."}, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)

            print("Add GroupPermTest to the testLab1 read-only group")
            currentApplication.user.groups.add(self.testLab1ReadOnly)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"name": "testLab1", "UIC": 1}], file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, [{"id": 1, "eventStartDateTime": "2020-01-01T00:00:00Z", "eventEndDateTime": "2021-01-01T00:00:00Z", "testCasePassFail": True, "eventStatus": "LOCKED", "lab": "testLab1"},
                                        {"id": 2, "eventStartDateTime": "2021-12-31T00:00:00Z", "eventEndDateTime": "2022-12-31T00:00:00Z", "testCasePassFail": False, "eventStatus": "PLANNED", "lab": "testLab1"}], file=output)

            print("Remove GroupPermTest from the testLab1 read-only group")
            currentApplication.user.groups.remove(self.testLab1ReadOnly)

            print("GET labs")
            output.write("GET labs\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  200, {"detail": "You have permission to view this list, but it is either empty or contains only items you do not have permission to view."}, file=output)

            print("GET testLab1 tests")
            output.write("GET testLab1 tests\n")
            access_token = json.loads(getAccessTokenResponse(currentApplication.client_id, currentApplication.client_secret, self.api_client).content.decode())["access_token"]
            self.do_specific_test(currentApplication, self.api_client.get("/labs/testLab1/tests/", secure=True, HTTP_AUTHORIZATION="Bearer {0}".format(access_token)),
                                  403, {"detail": "You do not have permission to perform this action."}, file=output)
