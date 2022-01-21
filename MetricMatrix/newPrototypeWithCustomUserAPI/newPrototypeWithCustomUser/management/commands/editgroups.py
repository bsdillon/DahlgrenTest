from django.core.management.base import BaseCommand

from django.contrib.auth.models import Group
from django.contrib.auth import get_user_model

class Command(BaseCommand):
    help = "Shortcut to add or remove user from a group"

    def add_arguments(self, parser):
        parser.add_argument(
            "application",
            type=str,
            help="The name of the application",
        )
        parser.add_argument(
            "group",
            type=str,
            help="The name of the group. Use quotation marks around names that contain spaces",
        )
        parser.add_argument(
            "action",
            type=str,
            help="Add or remove the user from the group: add or remove"
        )

    def handle(self, *args, **options):
        # may want to pull applications down themselves, and pull out the user?
        # currently assumes user name is always equal to application name

        # i'd like to know a better way to do this kind of error handling stuff...
        try:
            user = get_user_model().objects.get(username=options["application"])
        except get_user_model().DoesNotExist:
            self.stdout.write(self.style.ERROR("No application with that name exists"))
        else:
            try:
                group = Group.objects.get(name=options["group"])
            except Group.DoesNotExist:
                self.stdout.write(self.style.ERROR("No group with that name exists"))
            else:
                try:
                    action = options["action"].lower()
                    if (action not in ["add", "remove"]):
                        raise ValueError # uhh idk errors lmao
                except ValueError:
                    self.stdout.write(self.style.ERROR("Action must be add or remove"))
                else:
                    if (action == "add"):
                        if (user.groups.filter(name=group).exists()):
                            self.stdout.write(self.style.ERROR("This application is already in that group"))
                        else:
                            user.groups.add(group)
                            self.stdout.write(self.style.SUCCESS("Application added to group successfully"))
                    else:
                        if (user.groups.filter(name=group).exists()):
                            user.groups.remove(group)
                            self.stdout.write(self.style.SUCCESS("Application removed from group successfully"))
                        else:
                            self.stdout.write(self.style.ERROR("This application is already not in that group"))
