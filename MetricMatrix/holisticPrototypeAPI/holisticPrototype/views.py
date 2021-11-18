from django.shortcuts import render

from rest_framework import viewsets, permissions
from .models import Lab, Test
from .serializers import LabSerializer, TestSerializer

from oauth2_provider.contrib.rest_framework import TokenHasReadWriteScope
from rest_framework_guardian import filters

# Custom permissons - may want to move to a permissions.py

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

class CustomObjectPermissions(permissions.DjangoObjectPermissions):
    perms_map = {
        "GET": ["%(app_label)s.view_%(model_name)s"],
        "OPTIONS": ["%(app_label)s.view_%(model_name)s"],
        "HEAD": ["%(app_label)s.view_%(model_name)s"],
        "POST": ["%(app_label)s.view_%(model_name)s"],
        "PUT": ["%(app_label)s.view_%(model_name)s"],
        "PATCH": ["%(app_label)s.view_%(model_name)s"],
        "DELETE": ["%(app_label)s.view_%(model_name)s"],
    }

# Create your views here.

class LabViewSet(viewsets.ModelViewSet):
    permission_classes = [ClientCredentialPermission, permissions.IsAuthenticated, TokenHasReadWriteScope, CustomObjectPermissions]
    serializer_class = LabSerializer
    queryset = Lab.objects.all()
    lookup_field = "name"
    filter_backends = [filters.ObjectPermissionsFilter]

class TestViewSet(viewsets.ModelViewSet):
    permission_classes = [ClientCredentialPermission, permissions.IsAuthenticated, TokenHasReadWriteScope, CustomObjectPermissions]
    serializer_class = TestSerializer
    filter_backends = [filters.ObjectPermissionsFilter]
    def get_queryset(self):
        return Test.objects.filter(lab__name=self.kwargs["name"])
