from django.shortcuts import render,HttpResponse,redirect
from django.http import HttpResponse
from .models import Menu_Items,Bills,Bill_history
from POS_App.forms import MenuFrom, Bills_Form,BillHistory_Form
from POS_App.Invoice import Invoice

from django.views.decorators.csrf import csrf_exempt
#Invoice View Function
@csrf_exempt
def invoice2(request):
#List of Items to be entered from database to html invoice template
    Items = [{'Item_Name':'Website design','Item_Price':'300.00','Item_Quantity':'1'},
    {'Item_Name':'Domain name (1 year)','Item_Price':'10.00','Item_Quantity':'1'},
    {'Item_Name':'Hosting (3 months)','Item_Price':'75.00','Item_Quantity':'1'},
    {'Item_Name':'SEO','Item_Price':'15.00','Item_Quantity':'1'},{'Item_Name':'Web site','Item_Price':'150.00','Item_Quantity':'1'}]
#Returning The Invoice Html Template + Injecting The dictionary(Will Be Implemented In A Differant way when connected to db)
    return render(request, "invoice.html" ,{'Id':'100','Created':'Feb 1, 2022','Due':'Feb 5, 2022','Company':'Osus','Company_Ad1':'Al-Malaz - Prince Abdul Mohsen','Company_Ad2':'Saudi Arabia','Billto_Company':'Dev Team .inc','Billto_Name':'Osus Team','Billto_Email':'osusteam@osus.com','Payment_Method':'Cash','Amount_Tendered':'1000', 'Items_list':Items, 'Total':'550.00'})
@csrf_exempt
#view for the home page (dashboard)
def home(request):
    return render(request, "index.html")


#view for the menu page + passing the menu_itmes dic from database
@csrf_exempt
def menu(request):
    items = Menu_Items.objects.all()
    dic = {'items': items}
    return render(request, "menu.html",dic)





# Create your views here.
@csrf_exempt
def addnew(request):
    if request.method == "POST":
        form = MenuFrom(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/')
            except:
                pass
    else:
        form = MenuFrom()
    return render(request, 'TableIndex.html', {'form': form})

@csrf_exempt
def index(request):
    menu = Menu_Items.objects.all()
    return render(request, "TableShow.html", {'menu_items': menu})

@csrf_exempt
def edit(request, id):
    menu = Menu_Items.objects.get(id=id)
    return render(request, 'TableEdit.html', {'menu_items': menu})

@csrf_exempt
def update(request, id):
    menu = Menu_Items.objects.get(id=id)
    form = MenuFrom(request.POST, instance=menu)
    if form.is_valid():
        form.save()
        return redirect("menu")
    return render(request, 'TableEdit.html', {'menu_items': menu})

@csrf_exempt
def main(request):
    return render(request, 'index.html')

@csrf_exempt
def delete(request, id):
    menu = Menu_Items.objects.get(id=id)
    menu.delete()
    return redirect("/")

@csrf_exempt
def bill_delete(request, id):
    bill = Bills.objects.get(id=id)
    bill.delete()
    return redirect("/")

from django.db.models import Max
def showBills(request):
    bills = Bills.objects.all()

    return render(request, "BillTable.html", {'bills': bills})
@csrf_exempt
# Create your views here.
def getBillID():
    bills=Bills.objects.all()
    bills=Bills.objects
    return bills.aggregate(Max('id'))


@csrf_exempt
def getMenuItems(id):
   item=[]
   items=Bill_history.objects.filter(bill_id=id)
   return items
@csrf_exempt
def getTotal(id):
    bill = Bills.objects.get(id=id)
    return bill.total
@csrf_exempt
def getDate(id):
    bill = Bills.objects.get(id=id)
    return bill.dates


@csrf_exempt
def invoice(request,id):
    objects=getMenuItems(id)
    invoices=[]
    x=len(objects)
    date = getDate(id)
    total = getTotal(id)
    for i in objects:

         invoice=Invoice(id,i.item_name,i.quantity,getTotal(id),i.price,getDate(id))
         invoices.append(invoice)
    return render(request, "invoice.html", {'invoices': invoices , 'date':date , 'total':total, 'id':id})
