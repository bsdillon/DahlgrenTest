from django.db import models

# Create your models here.

class Meat(models.Model):
    color = models.CharField(max_length = 100)
    weight = models.CharField(max_length = 100)
    flavor = models.CharField(max_length = 100)
    personality = models.CharField(max_length = 100)
