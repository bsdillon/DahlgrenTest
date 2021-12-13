from django.core.management.base import BaseCommand

from django.contrib.auth.models import User

class Command(BaseCommand):
    help = "Shortcut to delete an application"

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
            confirm = input("Are you sure you want to delete this application?\n" + user.username + "\nThis action cannot be undone! (y/n) ")
            if (confirm.lower() == "y"):
                user.delete()
                self.stdout.write(self.style.SUCCESS("Application deleted"))
