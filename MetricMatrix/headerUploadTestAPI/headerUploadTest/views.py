from django.shortcuts import render

from rest_framework import viewsets, parsers
from rest_framework.response import Response
from .models import ClassifiedUpload
from .serializers import ClassifiedUploadSerializer

# Create your views here.

class ClassifiedUploadViewSet(viewsets.ModelViewSet):
    serializer_class = ClassifiedUploadSerializer
    queryset = ClassifiedUpload.objects.all()

    parser_classes = [parsers.MultiPartParser]

    def retrieve(self, request, *args, **kwargs):
        response = super().retrieve(request, *args, **kwargs)
        response["Classification"] = self.get_object().classification
        return response

    # probably also should try it out on list,create, update, partial_update, destroy...
