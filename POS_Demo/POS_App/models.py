from pydoc import describe
from django.db import models
from datetime import datetime
# Create your models here.


class Menu_Items(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=200)
    price = models.CharField(max_length=15)
    pImage = models.URLField(default=None) 

    class Meta:
        db_table = 'menu_items'






#just for testing 
class Burger(models.Model):
    name = models.CharField(max_length=120)
    priceM = models.DecimalField(max_digits=4,decimal_places=2)
    priceL = models.DecimalField(max_digits=4,decimal_places=2)
    pImage = models.URLField()




#bills model
class Bills(models.Model):
    created_by = models.CharField(max_length=120)
    total = models.DecimalField(max_digits=10,decimal_places=2)
    dates = models.DateTimeField(auto_now = True)

    class Meta:
        db_table = 'bill'


class Bill_history(models.Model):
    bill_id=models.CharField(max_length=50)
    item_name = models.CharField(max_length=50)
    quantity = models.CharField(max_length=100)
    price = models.CharField(max_length=100)

    class Meta:
        db_table = 'bill_history'
