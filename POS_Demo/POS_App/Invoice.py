class Invoice:
    billID=0
    menu_items=[]
    quantity=0
    total=0.0
    price=[]
    date=0

    def __init__(self,billID,menu_items,quantity,total,price,date):
        self.billID=billID
        self.menu_items=menu_items
        self.quantity=quantity
        self.total=total
        self.price=price
        self.date=date
