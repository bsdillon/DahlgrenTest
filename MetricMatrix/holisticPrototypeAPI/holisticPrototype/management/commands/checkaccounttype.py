from django.core.management.base import BaseCommand

from django.contrib.auth.models import User

class Command(BaseCommand):
    help = "Shortcut to check user account type: admin, superuser, or neither"

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
            user = User.objects.get(username=options["application"])
        except User.DoesNotExist:
            self.stdout.write(self.style.ERROR("No application with that name exists"))
        else:
            if (user.is_staff or user.is_superuser):
                if (user.is_staff):
                    self.stdout.write(self.style.SUCCESS("This user is an admin"))
                if (user.is_superuser):
                    self.stdout.write(self.style.SUCCESS("This user is a superuser"))
            else:
                self.stdout.write(self.style.SUCCESS("This user is neither an admin nor a superuser"))
