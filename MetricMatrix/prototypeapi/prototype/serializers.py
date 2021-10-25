from rest_framework import serializers
from .models import Prototype

class PrototypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prototype
        fields = ["id", "labName", "UIC", "eventStartDateTime", "eventEndDateTime", "totalTestCases", "totalTestCasesPassed", "totalTestCasesFailed", "totalElapsedTime", "testUptime", "eventStatus", "url"]
