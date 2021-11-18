from django.db import models

# Create your models here.

class Lab(models.Model):
    name = models.CharField(max_length=100,unique=True)
    UIC = models.IntegerField()

    def __str__(self):
        return self.name

class Test(models.Model):
    lab = models.ForeignKey(Lab, related_name="tests", on_delete=models.CASCADE)
    eventStartDateTime = models.DateTimeField()
    eventEndDateTime = models.DateTimeField()
    testCasePassFail = models.BooleanField()
    eventStatus = models.CharField(max_length=100, choices = models.TextChoices("eventStatus", "PLANNED ACTIVE COMPLETED LOCKED").choices)
