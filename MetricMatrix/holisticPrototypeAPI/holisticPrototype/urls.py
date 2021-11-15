from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import LabViewSet, TestViewSet

router = DefaultRouter()
router.register(r"labs",LabViewSet)
router.register(r"labs/(?P<name>\w+)/tests",TestViewSet,basename="tests")
urlpatterns = [
    path("", include(router.urls))
]
