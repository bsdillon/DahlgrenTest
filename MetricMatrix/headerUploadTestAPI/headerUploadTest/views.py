from django.shortcuts import render

from rest_framework import viewsets, parsers
from .models import ClassifiedUpload
from .serializers import ClassifiedUploadSerializer

# Create your views here.

class ClassifiedUploadViewSet(viewsets.ModelViewSet):
    serializer_class = ClassifiedUploadSerializer
    queryset = ClassifiedUpload.objects.all()

    parser_classes = [parsers.MultiPartParser]
