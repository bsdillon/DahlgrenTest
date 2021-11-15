from rest_framework import serializers
from .models import Lab, Test

class TestSerializer(serializers.ModelSerializer):
    lab = serializers.StringRelatedField()

    class Meta:
        model = Test
        fields = ["id", "eventStartDateTime", "eventEndDateTime", "testCasePassFail", "eventStatus", "lab"]

    def create(self, validated_data):
        lab_name = self.context.get("view").kwargs.get("name")
        validated_data["lab"] = Lab.objects.get(name=lab_name)
        return super(TestSerializer, self).create(validated_data)

class LabSerializer(serializers.ModelSerializer):
    tests = TestSerializer(many=True, required=False)

    class Meta:
        model = Lab
        fields = ["name", "UIC", "tests"]

    def create(self, validated_data):
        if("tests" in validated_data):
            tests_data = validated_data.pop("tests")
        else:
            tests_data = []
        lab = Lab.objects.create(**validated_data)
        for test_data in tests_data:
            Test.objects.create(lab=lab, **test_data)
        return lab
