from rest_framework import serializers
from .models import Lab, Test

# new stuff
from django.contrib.auth.models import User
from guardian.shortcuts import assign_perm
#

class TestSerializer(serializers.ModelSerializer):
    lab = serializers.StringRelatedField()#(read_only=True) #<- should it be?

    class Meta:
        model = Test
        fields = ["id", "eventStartDateTime", "eventEndDateTime", "testCasePassFail", "eventStatus", "lab"]

    def create(self, validated_data):
        lab_name = self.context.get("view").kwargs.get("name")
        validated_data["lab"] = Lab.objects.get(name=lab_name)        
        test = super(TestSerializer, self).create(validated_data)
        #
        assign_perm("add_test", self.context["request"].user, test)
        assign_perm("change_test", self.context["request"].user, test)
        assign_perm("delete_test", self.context["request"].user, test)
        assign_perm("view_test", self.context["request"].user, test)
        #
        return test

class LabSerializer(serializers.ModelSerializer):
    tests = TestSerializer(many=True, required=False, write_only = True)# may want to remove write_only? It obfuscates COMPLETELY, so you can't preview tests, in case that's a desirable outcome...

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
        #
        assign_perm("view_lab", self.context["request"].user, lab)
        #
        return lab
