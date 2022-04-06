from django.urls import path
from . import views
#url Redirection for invoice Page on app level
urlpatterns = [
    path('', views.home, name='home'),
    path('home/', views.home, name='home'),
    path('order', views.menu, name='menu'),
    path('invoice/<int:id>', views.invoice, name='invoice'),
    path('menu', views.index, name='menu'),
    path('addnew', views.addnew, name='addnew'),
    path('bill_records', views.showBills, name='bill_records'),
    path('edit/<int:id>', views.edit,name='edit'),
    path('delete/<int:id>', views.delete,name='delete'),
    path('update/<int:id>', views.update,name='update'),
    path('edit/update/<int:id>', views.update,name='update'),
]
