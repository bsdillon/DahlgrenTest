from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import MeatViewSet

router = DefaultRouter()
router.register(r"meats", MeatViewSet)

urlpatterns = [
    path("", include(router.urls))
]
