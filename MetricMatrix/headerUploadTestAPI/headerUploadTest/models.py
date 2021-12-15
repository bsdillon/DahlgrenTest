from django.db import models

# Create your models here.

class ClassifiedUpload(models.Model):
    classification = models.CharField(max_length=100, choices = models.TextChoices("classification", "UNCLASSIFIED CUI FOUO CONFIDENTIAL SECRET TOP_SECRET").choices)
    file = models.FileField()
