from dataclasses import fields
from django.urls import clear_script_prefix
from rest_framework import serializers
from POS_App.models import Bills ,Bill_history

#serializers for bills api
class BillsSir(serializers.ModelSerializer):
    class Meta:
        model = Bills
        fields = '__all__'

    # Bill_history serializer
class Menuitemssir(serializers.ModelSerializer):
    class Meta:
        model = Bill_history
        fields = '__all__'