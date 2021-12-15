from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import ClassifiedUploadViewSet

router = DefaultRouter()
router.register(r"classifiedUploads", ClassifiedUploadViewSet)

urlpatterns = [
    path("", include(router.urls))
]
