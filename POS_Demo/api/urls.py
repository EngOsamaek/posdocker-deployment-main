from django.urls import path
from . import views
#url Redirection for api Page on project level
urlpatterns = [
    path('makeorder/', views.sendOrderData),
    path('sendmenuitems/', views.sendmenuitems),
]