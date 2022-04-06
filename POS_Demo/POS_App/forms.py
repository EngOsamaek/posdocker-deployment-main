from django import forms
from POS_App.models import Menu_Items, Bills,Bill_history


class MenuFrom(forms.ModelForm):
    class Meta:
        model = Menu_Items
        fields = ['name', 'description', 'price','pImage']  # https://docs.djangoproject.com/en/3.0/ref/forms/widgets/
        widgets = {'name': forms.TextInput(attrs={'class': 'form-control'}),
                   'description': forms.TextInput(attrs={'class': 'form-control'}),
                   'price': forms.TextInput(attrs={'class': 'form-control'}),
                   'pImage': forms.TextInput(attrs={'class': 'form-control'}),
                   }


class Bills_Form(forms.ModelForm):
    class Meta:
        model = Bills
        fields = ['total', 'created_by']  # https://docs.djangoproject.com/en/3.0/ref/forms/widgets/
        widgets = {'total': forms.TextInput(attrs={'class': 'form-control'}),
                   'created_by': forms.TextInput(attrs={'class': 'form-control'}),
                   
                   }

class BillHistory_Form(forms.ModelForm):
    class Meta:
        model = Bill_history
        fields = ['item_name', 'quantity', 'price']  # https://docs.djangoproject.com/en/3.0/ref/forms/widgets/
        widgets = {'item_name': forms.TextInput(attrs={'class': 'form-control'}),
                   'quantity': forms.TextInput(attrs={'class': 'form-control'}),
                   'price': forms.TextInput(attrs={'class': 'form-control'}),
                   }
