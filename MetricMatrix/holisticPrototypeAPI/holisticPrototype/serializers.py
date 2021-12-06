from rest_framework import serializers
from .models import Lab, Test

# new stuff
from django.contrib.auth.models import User, Group
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
        # you're allowed to mess with any test you created
        assign_perm("add_test", self.context["request"].user, test)
        assign_perm("change_test", self.context["request"].user, test)
        assign_perm("delete_test", self.context["request"].user, test)
        assign_perm("view_test", self.context["request"].user, test)
        #
        # groups need their cut too
        write = Group.objects.get(name=lab_name + " Write Permissions")
        readonly = Group.objects.get(name=lab_name + " Read-Only Permissions")
        assign_perm("add_test", write, test)
        assign_perm("change_test", write, test)
        assign_perm("delete_test", write, test)
        assign_perm("view_test", write, test)
        assign_perm("view_test", readonly, test)
        #
        return test

    # if you change a test's lab, then the perms must change as well
    # override update here

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
        # you're allowed to see any lab you're allowed to make
        assign_perm("view_lab", self.context["request"].user, lab)
        #
        # create a new group for lab-wide read & write permissions
        readonly = Group.objects.create(name=validated_data["name"] + " Read-Only Permissions")
        write = Group.objects.create(name=validated_data["name"] + " Write Permissions")
        #
        for test_data in tests_data:
            test = Test.objects.create(lab=lab, **test_data)
            assign_perm("view_test", readonly, test)
            assign_perm("add_test", write, test)
            assign_perm("change_test", write, test)
            assign_perm("delete_test", write, test)
            assign_perm("view_test", write, test)
        return lab

    def update(self, instance, validated_data):
        name = instance.name
        if ("name" in validated_data and validated_data["name"] != name):
            readonly = Group.objects.get(name=name + " Read-Only Permissions")
            write = Group.objects.get(name=name + " Write Permissions")
            readonly.name = validated_data["name"] + " Read-Only Permissions"
            readonly.save()
            write.name = validated_data["name"] + " Write Permissions"
            write.save()

        return super().update(instance, validated_data)

    # also delete the groups if the lab goes, in viewset
