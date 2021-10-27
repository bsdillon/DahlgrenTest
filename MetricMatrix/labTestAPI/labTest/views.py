from django.shortcuts import render

from rest_framework import viewsets
from .models import Lab, Test
from .serializers import LabSerializer, TestSerializer
# Create your views here.

class LabViewSet(viewsets.ModelViewSet):
    serializer_class = LabSerializer
    queryset = Lab.objects.all()
    lookup_field = "name"

class TestViewSet(viewsets.ModelViewSet):
    serializer_class = TestSerializer
    #queryset = Test.objects.all()
    def get_queryset(self):
        return Test.objects.filter(lab__name=self.kwargs["name"])
