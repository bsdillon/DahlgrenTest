from django.core.management.base import BaseCommand

from holisticPrototype.models import Lab, Test
from django.contrib.auth.models import User
from guardian.shortcuts import assign_perm

class Command(BaseCommand):
    help = "Shortcut to modify user object-level permissions"

    def add_arguments(self, parser):
        parser.add_argument(
            "application",
            type=str,
            help="The name of the application",
        )
        parser.add_argument(
            "permission",
            type=str,
            help="The permission to grant: add, change, delete, or view"
        )
        parser.add_argument(
            "model",
            type=str,
            help="The type of the target object: a lab or test"
        )
        parser.add_argument(
            "object",
            type=str,
            help="The identifier of the target object: a lab name or test ID number"
        )

    def handle(self, *args, **options):
        # may want to pull applications down themselves, and pull out the user?
        # currently assumes user name is always equal to
        try:
            user = User.objects.get(username=options["application"])
        except User.DoesNotExist:
            self.stdout.write(self.style.ERROR("No application with that name exists"))
        try:
            permission = options["permission"].lower()
            if (permission not in ["add", "change", "delete", "view"]):
                raise ValueError # uhh idk errors lmao
        except ValueError:
            self.stdout.write(self.style.ERROR("Permission must be add, change, delete, or view"))
        try:
            model = options["model"].lower()
            if (model not in ["lab", "test"]):
                raise ValueError # uhh idk errors lmao
        except ValueError:
            self.stdout.write(self.style.ERROR("Model must be lab or test"))
        try:
            if(model == "lab"):
                targetObject = Lab.objects.get(name=options["object"])
            elif(model == "test"):
                targetObject = Test.objects.get(id=int(options["object"]))
        except Lab.DoesNotExist:
            self.stdout.write(self.style.ERROR("No lab with that name exists"))
        except Test.DoesNotExist:
            self.stdout.write(self.style.ERROR("No test with that name exists"))
        except ValueError:
            self.stdout.write(self.style.ERROR("Test ID must be an integer"))

        assign_perm(permission + "_" + model, user, targetObject)
        self.stdout.write(self.style.SUCCESS("Permissions granted successfully"))
