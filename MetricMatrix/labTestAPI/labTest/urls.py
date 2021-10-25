from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import LabViewSet, TestViewSet

router = DefaultRouter()
router.register(r"lab",LabViewSet)
#router.register(r"test",TestViewSet)
urlpatterns = [
    path("", include(router.urls))
]
