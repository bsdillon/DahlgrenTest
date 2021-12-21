from django.dispatch import receiver
from django.db.models.signals import post_save
from .models import ClassifiedUpload
from django.conf import settings
import os


# GOD DAMN IT
# BROKEN
# SOMEHOW???
# Supposed to redo media root and url stuff, so that the link to a resource is properly connected to the model instance that contains it.
@receiver(post_save, sender=ClassifiedUpload)
def update_file_path(instance, created, **kwargs):
    initial_path = str(instance.file.path)
    new_path = str(settings.MEDIA_ROOT) + "\{0}\{1}".format(instance.pk, instance.file.name)
    os.makedirs(os.path.dirname(new_path), exist_ok=True)
    os.rename(initial_path, new_path)
    instance.file = new_path
    instance.save()
