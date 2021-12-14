from django.contrib import admin

from .models import Lab, Test, User
from guardian.admin import GuardedModelAdmin
from django.contrib.auth.models import Permission
from django.contrib.auth.admin import UserAdmin
# Register your models here.

class LabAdmin(GuardedModelAdmin):
    pass

class TestAdmin(GuardedModelAdmin):
    pass

admin.site.register(User, UserAdmin)
admin.site.register(Lab, LabAdmin)
admin.site.register(Test, TestAdmin)
admin.site.register(Permission)
