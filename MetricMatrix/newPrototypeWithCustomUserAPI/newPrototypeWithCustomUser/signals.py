from django.contrib.auth import user_login_failed, user_logged_in
from django.contrib.auth.models import update_last_login
from django.utils import timezone

# Used with overridden User model in order to produce previous login time.
# Note that signals must be imported within the ready function in app.py

def update_last_and_previous_login(sender, user, **kwargs):
    user.previous_login = user.last_login
    user.last_login = timezone.now()
    user.save(update_fields=["previous_login", "last_login"])

user_logged_in.disconnect(update_last_login, dispatch_uid="update_last_login")
user_logged_in.connect(update_last_and_previous_login, dispatch_uid="update_last_and_previous_login")
