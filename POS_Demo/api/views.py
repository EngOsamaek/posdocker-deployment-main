from rest_framework.response import Response
from rest_framework.decorators import api_view
from POS_App.models import Bills
from .serializers import BillsSir ,Menuitemssir
from django.views.decorators.csrf import csrf_exempt

#api endpoint for sending order data (api/sendOrderData)
@csrf_exempt
@api_view(['POST'])
def sendOrderData(request):
    sir = BillsSir(data=request.data)
    if sir.is_valid():
        sir.save()
    return Response(sir.data)


    
# api endpoint for sending order data (api/sendmenuitems)
@csrf_exempt
@api_view(['POST'])
def sendmenuitems(request):
    sir = Menuitemssir(data=request.data)
    if sir.is_valid():
        print('done')
        sir.save()
    else:
        print('nope')
    return Response(sir.data)