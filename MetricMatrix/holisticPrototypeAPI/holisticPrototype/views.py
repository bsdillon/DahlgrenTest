from django.shortcuts import render

from rest_framework import viewsets, permissions
from .models import Lab, Test
from .serializers import LabSerializer, TestSerializer

from oauth2_provider.contrib.rest_framework import TokenHasReadWriteScope
# Custom permissons for client credentials

class ClientCredentialPermission(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.auth is None:
            return False
        grant_type = request.auth.application.get_authorization_grant_type_display()
        if request.user is None and grant_type == "Client credentials":
            request.user = request.auth.application.user # The application user defined in the admin screen! Currently only "admin" has a user - it's admin
            return True
        else:
            return False

# Create your views here.

class LabViewSet(viewsets.ModelViewSet):
    permission_classes = [ClientCredentialPermission, TokenHasReadWriteScope]#, permissions.IsAdminUser]
    serializer_class = LabSerializer
    queryset = Lab.objects.all()
    lookup_field = "name"

class TestViewSet(viewsets.ModelViewSet):
    permission_classes = [ClientCredentialPermission, TokenHasReadWriteScope]#, permissions.IsAdminUser]
    serializer_class = TestSerializer
    #queryset = Test.objects.all()
    def get_queryset(self):
        return Test.objects.filter(lab__name=self.kwargs["name"])
