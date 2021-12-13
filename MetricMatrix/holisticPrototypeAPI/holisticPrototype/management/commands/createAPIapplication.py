from django.core.exceptions import ValidationError
from django.core.management.base import BaseCommand

from oauth2_provider.models import get_application_model

# new from CPM'd file
from django.contrib.auth.models import User, Group
from django.db import IntegrityError

from django.core import management

Application = get_application_model()


class Command(BaseCommand):
    help = "Shortcut to create a new application in a programmatic way"

    def add_arguments(self, parser):
        parser.add_argument(
            "name",
            type=str,
            help="The name of this application",
        )
        parser.add_argument(
            "permissions",
            type=str,
            help="The permissions to grant: write, readonly, or admin",
        )

    def handle(self, *args, **options):
        # Extract all fields related to the application, this will work now and in the future
        # and also with custom application models.
        application_fields = [field.name for field in Application._meta.fields]
        application_data = {"client_type": "confidential",
                            "authorization_grant_type": "client-credentials"
                            }
        application_data.update({"name": options["name"]})

        new_application = Application(**application_data)
        # password may be left blank for a "unusable password" user...?
        try:
            if (options["permissions"] == "admin"):
                if (User.objects.filter(username=new_application.name).exists()):
                    raise IntegrityError
                else:
                    # seems like this doesn't raise IntegrityError on its own? So we need to check usernames before submitting the command.
                    management.call_command("createsuperuser", username=new_application.name)
                    user = User.objects.get(username=new_application.name)
            else:
                user = User.objects.create_user(new_application.name, password=new_application.client_secret)
        except IntegrityError:
            self.stdout.write(self.style.ERROR("An application with that name already exists"))
        else:
            new_application.user = user
            permissions = options["permissions"]
            try:
                if (permissions == "write"):
                    # assume the existence of a Write Permissions group
                    Group.objects.get(name="Write Permissions").user_set.add(user)
                elif (permissions == "readonly"):
                    Group.objects.get(name="Read-Only Permissions").user_set.add(user)
                elif (permissions != "admin"):
                    raise ValueError
            except ValueError:
                self.stdout.write(self.style.ERROR("Permissions must be write or readonly"))
                # deleting rather than never creating is probably stupid
                user.delete()
            else:
                try:
                    new_application.full_clean()
                except ValidationError as exc:
                    errors = "\n ".join(
                        ["- " + err_key + ": " + str(err_value) for err_key, err_value in exc.message_dict.items()]
                    )
                    self.stdout.write(self.style.ERROR("Please correct the following errors:\n %s" % errors))
                    user.delete()
                else:
                    new_application.save()
                    self.stdout.write(self.style.SUCCESS("New application created successfully"))

