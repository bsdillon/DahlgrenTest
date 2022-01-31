from django.core.management.base import BaseCommand

from django.contrib.auth.models import Permission

from django.contrib.auth import get_user_model

from newPrototypeWithCustomUser.models import Lab, Test
from guardian.shortcuts import get_objects_for_user, get_objects_for_group, get_perms_for_model

class Command(BaseCommand):
    help = "Shortcut to check user permissions and group membership"

    def add_arguments(self, parser):
        parser.add_argument(
            "application",
            type=str,
            help="The name of the application",
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
            self.stdout.write(self.style.SUCCESS("Explicit General Permissions:"))
            for perm in user.user_permissions.all():
                self.stdout.write(self.style.SUCCESS(str(perm)))
            
            self.stdout.write(self.style.SUCCESS("\nExplicit Object Permissions:"))
            for perm in get_perms_for_model(Lab):
                objects = get_objects_for_user(user, "newPrototypeWithCustomUser." + perm.codename, accept_global_perms=False, use_groups=False)
                if objects:
                    self.stdout.write(self.style.SUCCESS(str(perm)))
                    for obj in objects:
                        self.stdout.write(self.style.SUCCESS(str(obj)))
            for perm in get_perms_for_model(Test):
                objects = get_objects_for_user(user, "newPrototypeWithCustomUser." + perm.codename, accept_global_perms=False, use_groups=False)
                if objects:
                    self.stdout.write(self.style.SUCCESS(str(perm)))
                    for obj in objects:
                        self.stdout.write(self.style.SUCCESS(str(obj)))
            
            self.stdout.write(self.style.SUCCESS("\nGroups:"))
            for group in user.groups.all():
                self.stdout.write(self.style.SUCCESS(str(group)))
                for perm in Permission.objects.filter(group=group):
                    self.stdout.write(self.style.SUCCESS(str(perm)))
                for perm in get_perms_for_model(Lab):
                    objects = get_objects_for_group(group, "newPrototypeWithCustomUser." + perm.codename, accept_global_perms=False)
                    if objects:
                        self.stdout.write(self.style.SUCCESS(str(perm)))
                        for obj in objects:
                            self.stdout.write(self.style.SUCCESS(str(obj)))
                for perm in get_perms_for_model(Test):
                    objects = get_objects_for_group(group, "newPrototypeWithCustomUser." + perm.codename, accept_global_perms=False)
                    if objects:
                        self.stdout.write(self.style.SUCCESS(str(perm)))
                        for obj in objects:
                            self.stdout.write(self.style.SUCCESS(str(obj)))
                self.stdout.write(self.style.SUCCESS("\n"))
