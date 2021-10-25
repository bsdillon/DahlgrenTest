from rest_framework import serializers
from .models import Lab, Test

class TestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Test
        fields = ["id", "eventStartDateTime", "eventEndDateTime", "testCasePassFail", "eventStatus"]

class LabSerializer(serializers.ModelSerializer):
    tests = TestSerializer(many=True)

    class Meta:
        model = Lab
        fields = ["name", "UIC", "tests"]

    def create(self, validated_data):
        tests_data = validated_data.pop("tests")
        lab = Lab.objects.create(**validated_data)
        for test_data in tests_data:
            Test.objects.create(lab=lab, **test_data)
        return lab
