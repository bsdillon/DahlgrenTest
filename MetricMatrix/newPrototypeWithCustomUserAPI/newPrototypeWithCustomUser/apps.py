from django.apps import AppConfig


class NewprototypewithcustomuserConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'newPrototypeWithCustomUser'

    def ready(self):
        from . import signals
