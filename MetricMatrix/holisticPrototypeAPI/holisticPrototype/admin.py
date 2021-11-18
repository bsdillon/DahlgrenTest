from django.contrib import admin

from .models import Lab, Test
from guardian.admin import GuardedModelAdmin
from django.contrib.auth.models import Permission
# Register your models here.

class LabAdmin(GuardedModelAdmin):
    pass

class TestAdmin(GuardedModelAdmin):
    pass

admin.site.register(Lab, LabAdmin)
admin.site.register(Test, TestAdmin)
admin.site.register(Permission)
