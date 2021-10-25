from django.db import models

# Create your models here.

class Prototype(models.Model):
    labName = models.CharField(max_length=100)
    UIC = models.IntegerField()
    eventStartDateTime = models.DateTimeField()
    eventEndDateTime = models.DateTimeField()
    totalTestCases = models.IntegerField()
    totalTestCasesPassed = models.IntegerField()
    totalTestCasesFailed = models.IntegerField()
    totalElapsedTime = models.TimeField()
    testUptime = models.TimeField()
    eventStatus = models.CharField(max_length=100, choices = models.TextChoices("eventStatus", "PLANNED ACTIVE COMPLETED LOCKED").choices)
    url = models.URLField()
