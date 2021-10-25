from django.shortcuts import render

from rest_framework import viewsets

from .models import Prototype
from .serializers import PrototypeSerializer

# Create your views here.

class PrototypeViewSet(viewsets.ModelViewSet):
    serializer_class = PrototypeSerializer
    queryset = Prototype.objects.all()
