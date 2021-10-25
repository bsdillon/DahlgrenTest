from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import PrototypeViewSet

router = DefaultRouter()
router.register(r"prototype", PrototypeViewSet)

urlpatterns = [
    path("", include(router.urls))
]
