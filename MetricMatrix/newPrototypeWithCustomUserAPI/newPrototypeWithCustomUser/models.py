from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy

# Create your models here.

class Lab(models.Model):
    name = models.CharField(max_length=100,unique=True)
    UIC = models.IntegerField()

    def __str__(self):
        return self.name

class Test(models.Model):
    # Nested models are defined like this: the "inside" model references the "outside" model, not the other way around.
    lab = models.ForeignKey(Lab, related_name="tests", on_delete=models.CASCADE)
    eventStartDateTime = models.DateTimeField()
    eventEndDateTime = models.DateTimeField()
    testCasePassFail = models.BooleanField()
    # Choices here are separated by spaces.
    eventStatus = models.CharField(max_length=100, choices = models.TextChoices("eventStatus", "PLANNED ACTIVE COMPLETED LOCKED").choices)

class User(AbstractUser):
    # Override User model. Remember to set AUTH_USER_MODEL in settings.py
    # blank=True and null=True have to do with the database allowing this field to be empty.
    # This way, previous_login is allowed to "exist" during the first ever login.
    previous_login = models.DateTimeField(gettext_lazy("previous login"), blank=True, null=True)
