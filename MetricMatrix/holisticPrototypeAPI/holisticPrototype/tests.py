from django.test import TestCase, RequestFactory

# Create your tests here.
from django.contrib.auth.models import User, Group
from oauth2_provider.models import get_application_model
from oauth2_provider.views import TokenView
from guardian.shortcuts import assign_perm
from .models import Lab, Test
import base64
import json

# replicate the effects of the fullyrealizedapplication command
def generateTestApplication(name, group=None, isSuperuser=False):
    Application = get_application_model()
    
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

    return new_application

# get access token
def getAccessToken(client_id, secret, factory):
    cert = "venv/Lib/site-packages/sslserver/certs/development.crt" # ??
    credential = "{0}:{1}".format(client_id, secret)
    encoded_cred = base64.b64encode(credential.encode("utf-8"))
    token_url = "/o/token/"
    # getting an error with unsupported grant type?
    tokenRequest = factory.post(token_url, data={"grant_type": "client_credentials"}, secure=True, AUTH_TYPE="Basic " + encoded_cred.decode(), CONTENT_TYPE="application/x-www-form-urlencoded")
    tokenResponse = TokenView.as_view()(tokenRequest)
    if ("access_token" in json.loads(tokenResponse.content.decode())):
        return json.loads(tokenResponse.content.decode())["access_token"]
    else:
        return json.loads(tokenResponse.content.decode())["error"]

class LabAndTestTestCase(TestCase):
    def setUp(self):
        defaultPerms = Group.objects.create(name="Default Permissions")
        assign_perm("holisticPrototype.view_lab", defaultPerms)
        assign_perm("holisticPrototype.view_test", defaultPerms)
        assign_perm("holisticPrototype.add_test", defaultPerms)
        assign_perm("holisticPrototype.change_test", defaultPerms)
        assign_perm("holisticPrototype.delete_test", defaultPerms)
        
        self.factory = RequestFactory()
        self.admin = generateTestApplication(name="admin", isSuperuser=True)
        self.testLab1 = generateTestApplication(name="testLab1", group=defaultPerms)
        testLab1Lab = Lab.objects.create(name="testLab1", UIC=1)
        Lab.objects.create(name="testLab2", UIC=2)
        testLab1Test = Test.objects.create(lab=testLab1Lab, eventStartDateTime="2020-01-01T00:00", eventEndDateTime="2021-01-01T00:00", testCasePassFail=True, eventStatus="LOCKED")

        assign_perm("view_lab", self.testLab1.user, testLab1Lab)
        assign_perm("view_test", self.testLab1.user, testLab1Test)
        assign_perm("add_test", self.testLab1.user, testLab1Test)
        assign_perm("change_test", self.testLab1.user, testLab1Test)
        assign_perm("delete_test", self.testLab1.user, testLab1Test)
        
    def test_all(self):
        print(getAccessToken(self.admin.client_id, self.admin.client_secret, self.factory))
