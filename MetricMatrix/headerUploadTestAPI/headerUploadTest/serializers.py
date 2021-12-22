from rest_framework import serializers
from .models import ClassifiedUpload

class ClassifiedUploadSerializer(serializers.ModelSerializer):
    class Meta:
        model = ClassifiedUpload
        fields = ["id", "classification", "file"]
