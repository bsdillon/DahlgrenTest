from django.core.management.base import BaseCommand

from newPrototypeWithCustomUser.models import Lab, Test
from django.contrib.auth import get_user_model
from guardian.shortcuts import assign_perm, remove_perm

class Command(BaseCommand):
    help = "Shortcut to modify an application's explicit object-level permissions"

    def add_arguments(self, parser):
        parser.add_argument(
            "action",
            type=str,
            help="The permissions action to take: grant or revoke",
        )
        parser.add_argument(
            "application",
            type=str,
            help="The name of the application",
        )
        parser.add_argument(
            "permission",
            type=str,
            help="The permission to grant or revoke: add, change, delete, or view"
        )
        parser.add_argument(
            "model",
            type=str,
            help="The type of the target object: lab or test"
        )
        parser.add_argument(
            "object",
            type=str,
            help="The identifier of the target object: a lab name or test ID number"
        )

    def handle(self, *args, **options):
        # may want to pull applications down themselves, and pull out the user?
        # currently assumes user name is always equal to application name

        # i'd like to know a better way to do this kind of error handling stuff...
        try:
            action = options["action"].lower()
            if (action not in ["grant", "revoke"]):
                raise ValueError # uhh idk errors lmao
        except ValueError:
            self.stdout.write(self.style.ERROR("Action must be grant or revoke"))
        else:
            try:
                user = get_user_model().objects.get(username=options["application"])
            except get_user_model().DoesNotExist:
                self.stdout.write(self.style.ERROR("No application with that name exists"))
            else:
                try:
                    permission = options["permission"].lower()
                    if (permission not in ["add", "change", "delete", "view"]):
                        raise ValueError # uhh idk errors lmao
                except ValueError:
                    self.stdout.write(self.style.ERROR("Permission must be add, change, delete, or view"))
                else:
                    try:
                        if (user.groups.filter(name="Read-Only Permissions").exists() and action == "grant" and permission != "view"):
                            raise ValueError
                    except ValueError:
                        self.stdout.write(self.style.ERROR("Applications with read-only permissions can only be granted read permissions"))
                    else:
                        try:
                            model = options["model"].lower()
                            if (model not in ["lab", "test"]):
                                raise ValueError # uhh idk errors lmao
                        except ValueError:
                            self.stdout.write(self.style.ERROR("Model must be lab or test"))
                        else:
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
                            else:
                                if (action == "grant"):
                                    if (user.has_perm(permission + "_" + model, targetObject)):
                                        self.stdout.write(self.style.ERROR("This application already has that permission"))
                                    else:
                                        assign_perm(permission + "_" + model, user, targetObject)
                                        self.stdout.write(self.style.SUCCESS("Permissions granted successfully"))
                                else:
                                    if (user.has_perm(permission + "_" + model, targetObject)):
                                        remove_perm(permission + "_" + model, user, targetObject)
                                        self.stdout.write(self.style.SUCCESS("Permissions revoked successfully"))
                                    else:
                                        self.stdout.write(self.style.ERROR("This application already does not have that permission"))
