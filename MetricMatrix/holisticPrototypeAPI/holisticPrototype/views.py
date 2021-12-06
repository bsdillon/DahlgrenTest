from django.shortcuts import render

from rest_framework import viewsets, permissions
from .models import Lab, Test
from .serializers import LabSerializer, TestSerializer

from oauth2_provider.contrib.rest_framework import TokenHasReadWriteScope
from rest_framework_guardian import filters

from rest_framework.response import Response

# for deleting permission groups for labs
from django.contrib.auth.models import Group
#

# Custom permissons - may want to move to a permissions.py

class ClientCredentialPermission(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.auth is None:
            return False
        grant_type = request.auth.application.get_authorization_grant_type_display()
        if request.user is None and grant_type == "Client credentials":
            request.user = request.auth.application.user # The application user defined in the admin screen!
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

class TestParentLabIsLegalPermissions(permissions.BasePermission):
    def has_permission(self, request, view):
        lab = Lab.objects.get(name = view.kwargs["name"])
        return request.user.has_perm("view_lab", lab)    

# Create your views here.

class LabViewSet(viewsets.ModelViewSet):
    permission_classes = [ClientCredentialPermission, permissions.DjangoModelPermissions, TokenHasReadWriteScope, CustomObjectPermissions]
    serializer_class = LabSerializer
    queryset = Lab.objects.all()
    lookup_field = "name"
    filter_backends = [filters.ObjectPermissionsFilter]
    def list(self, request, *args, **kwargs):
        response = super(LabViewSet, self).list(request, *args, **kwargs)
        if(response.data == []):
            response = Response({"detail": "You have permission to view this list, but it is either empty or contains only items you do not have permission to view."})
        return response

    def destroy(self, request, pk=None, *args, **kwargs):
        name = self.kwargs["name"]
        Group.objects.get(name=name + " Read-Only Permissions").delete()
        Group.objects.get(name=name + " Write Permissions").delete()
        return super(LabViewSet, self).destroy(request, *args, **kwargs)

class TestViewSet(viewsets.ModelViewSet):
    permission_classes = [ClientCredentialPermission, permissions.DjangoModelPermissions, TokenHasReadWriteScope, TestParentLabIsLegalPermissions, CustomObjectPermissions]
    serializer_class = TestSerializer
    filter_backends = [filters.ObjectPermissionsFilter]
    def get_queryset(self):
        return Test.objects.filter(lab__name=self.kwargs["name"])
    def list(self, request, *args, **kwargs):
        response = super(TestViewSet, self).list(request, *args, **kwargs)
        if(response.data == []):
            response = Response({"detail": "You have permission to view this list, but it is either empty or contains only items you do not have permission to view."})
        return response
