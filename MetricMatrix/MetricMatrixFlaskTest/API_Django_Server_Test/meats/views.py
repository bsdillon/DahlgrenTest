from django.shortcuts import render

from rest_framework import viewsets

from .models import Meat
from .serializers import MeatSerializer

# Create your views here.

class MeatViewSet(viewsets.ModelViewSet):
    serializer_class = MeatSerializer
    queryset = Meat.objects.all()
