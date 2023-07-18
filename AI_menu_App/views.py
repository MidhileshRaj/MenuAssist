from django.core.files.storage import FileSystemStorage
from django.shortcuts import render
from django.http import *
from .models import *
import datetime
import time

from qr import gen_qrcode

# Create your views here.
def login_(request):
    return render(request,"login_index.html")

def login_post(request):
    username = request.POST['username']
    password = request.POST['password']
    res = login.objects.filter(username=username,password=password)
    if res.exists():
        res = login.objects.get(username=username, password=password)
        if res.type=="admin":
            return HttpResponse('''<script>alert('Login Success');window.location='/app/adm_index/'</script>''')

        elif res.type=="cashier":
            return HttpResponse('''<script>alert('Login Success');window.location='/app/cash_index/'</script>''')


        elif res.type=="kitchen":
            return HttpResponse('''<script>alert('Login Success');window.location='/app/kchn_index/'</script>''')


        elif res.type=="service station":
            return HttpResponse('''<script>alert('Login Success');window.location='/app/service_index/'</script>''')

        else:
            return HttpResponse('''<script>alert('Invalid User!');window.location='/app/login/'</script>''')
    else:
        return HttpResponse('''<script>alert('Invalid User!');window.location='/app/login/'</script>''')

#--------------------
#   index

def adm_index(request):
    return render(request, 'ADMIN/admin_index.html')
def home(request):
    return render(request,'ADMIN/home.html')

def user_inform(request):
    res = customer.objects.all()
    return render(request,'ADMIN/user inform.html',{'data':res})

def search_user(request):
    search = request.POST['textfield']
    res = customer.objects.filter(cust_name__contains=search)

    return render(request,'ADMIN/user inform.html',{'data':res})


def add_food(request):
    return render(request,'ADMIN/foodmangment.html')

def add_food_post(request):
    Foodname = request.POST['food']
    image = request.FILES['img']

    fs = FileSystemStorage()
    from datetime import datetime
    # dt = time.strftime("%Y%m%d-%H%M%S")
    # s = dt+image.name()
    s = datetime.now().strftime("%Y%m%d%H%M%S")+image.name
    fn = fs.save(s,image)


    category = request.POST['category']
    Discription = request.POST['textarea']
    Price = request.POST['textfield']
    Stock = request.POST['textfield2']

    ob_food=food()
    ob_food.food_item=Foodname
    ob_food.stock=Stock
    ob_food.price=Price
    ob_food.food_image=fs.url(s)
    ob_food.food_description=Discription
    ob_food.category=category
    ob_food.save()

    return HttpResponse('''<script>alert('Added');window.location='/app/add_food/'</script>''')

def edit_food(request,id):
    f=food.objects.get(id=id)
    request.session['fid']=id
    return render(request,'ADMIN/foodmangmntedit.html',{'data':f})

def edit_food_post(request):
    Foodname = request.POST['food']
    category = request.POST['category']
    Discription = request.POST['textarea']
    Price = request.POST['textfield']
    Stock = request.POST['textfield2']

    if 'img' in request.FILES:
        image=request.FILES['img']
        if image.name!="":
            fs = FileSystemStorage()
            from datetime import datetime
            # dt = time.strftime("%Y%m%d-%H%M%S")
            # s = dt+image.name()
            s = datetime.now().strftime("%Y%m%d%H%M%S") + image.name
            print(s)
            fn = fs.save(s, image)
            fob=food.objects.get(id=request.session['fid'])
            fob.food_item=Foodname
            fob.stock=Stock
            fob.price=Price
            fob.food_image=fs.url(s)
            print(fs.url(s))
            fob.food_description=Discription
            fob.category=category
            fob.save()
        else:
            fob = food.objects.get(id=request.session['fid'])
            fob.food_item = Foodname
            fob.stock = Stock
            fob.price = Price
            fob.food_description = Discription
            fob.category = category
            fob.save()

    else:
        fob = food.objects.get(id=request.session['fid'])
        fob.food_item = Foodname
        fob.stock = Stock
        fob.price = Price
        fob.food_description = Discription
        fob.category = category
        fob.save()

    return HttpResponse('''<script>alert('updeted');window.location='/app/view_food/'</script>''')






def view_food(request):
    res=food.objects.all()
    return render(request,'ADMIN/foodview.html',{'data':res})

def search_food(request):
    search = request.POST['textfield']
    res=food.objects.filter(food_item__contains=search)
    return render(request,'ADMIN/foodview.html',{'data':res})

def delete_food(request,id):
    f = food.objects.get(id=id)
    f.delete()
    return HttpResponse('ok')

def add_staff(request):
    return render(request,'ADMIN/staffreg.html')

def add_staff_post(request):
    username=request.POST['name']
    image=request.FILES['fileField']

    fs=FileSystemStorage()
    from datetime import datetime
    s=datetime.now().strftime("%Y%m%d%H%M%S")+image.name
    fn=fs.save(s,image)

    phoneno=request.POST['textfield']
    DOB=request.POST['textfield2']
    email=request.POST['textfield3']
    Place = request.POST['textfield4']
    Post = request.POST['post']
    District = request.POST['district']
    Pincode = request.POST['pin']

    #add login table

    loginobj=login()
    loginobj.username=email
    loginobj.password=phoneno
    loginobj.type='staff'
    loginobj.save()
    lid=loginobj.id
    ob_staff=staff()
    ob_staff.LOGIN_id=lid

    ob_staff.staff_name=username
    ob_staff.staffphone_no=phoneno
    ob_staff.staff_dob=DOB
    ob_staff.staff_email=email
    ob_staff.staff_place=Place
    ob_staff.staff_post=Post
    ob_staff.staff_district=District
    ob_staff.staff_pincode=Pincode
    ob_staff.staff_photo=fs.url(s)
    ob_staff.save()

    return  HttpResponse('''<script>alert('Added');window.location='/app/add_staff/'</script>''')

def edit_staff(request,id):
    s = staff.objects.get(id=id)
    request.session['sid']=id
    return render(request,'ADMIN/staffregedit.html',{'data':s})

def edit_staff_post(request):
    username = request.POST['name']
    phoneno = request.POST['textfield']
    DOB = request.POST['textfield2']
    email = request.POST['textfield3']
    place = request.POST['textfield4']
    post = request.POST['post']
    District = request.POST['district']
    Pincode = request.POST['pin']



    if 'fileField' in request.FILES:
        image=request.FILES['fileField']

        if image.name!="":

          fs = FileSystemStorage()
          from datetime import datetime
          s = datetime.now().strftime("%Y%m%d%H%M%S") + image.name
          fn = fs.save(s, image)

          sob=staff.objects.get(id=request.session['sid'])
          sob.staff_name=username
          sob.staffphone_no=phoneno
          sob.staff_photo=fs.url(s)
          sob.staff_dob=DOB
          sob.staff_email=email
          sob.staff_place=place
          sob.staff_post=post
          sob.staff_district=District
          sob.staff_pincode=Pincode
          sob.save()


        else:



            sob = staff.objects.get(id=request.session['sid'])
            sob.staff_name = username
            sob.staffphone_no = phoneno
            sob.staff_dob = DOB
            sob.staff_email = email
            sob.staff_place = place
            sob.staff_post = post
            sob.staff_district = District
            sob.staff_pincode = Pincode
            sob.save()

    else:
        sob = staff.objects.get(id=request.session['sid'])
        sob.staff_name = username
        sob.staffphone_no = phoneno
        sob.staff_dob = DOB
        sob.staff_email = email
        sob.staff_place = place
        sob.staff_post = post
        sob.staff_district = District
        sob.staff_pincode = Pincode
        sob.save()



    return  HttpResponse('''<script>alert('updated');window.location='/app/view_staff/'</script>''')

def view_staff(request):
    res = staff.objects.all()
    return render(request,'ADMIN/staffview.html',{'data':res})

def search_staff(request):
    search = request.POST['textfield']
    res = staff.objects.filter(staff_name__contains=search)

    return render(request,'ADMIN/staffview.html',{'data':res})

def delete_staff(request,id):
    s = staff.objects.get(id=id)
    s.delete()
    return HttpResponse('ok')

def add_tableno(request):
    return render(request,'ADMIN/tableno.html')

def add_tableno_post(request):
    Tableno=request.POST['textfield']
    no_of_seat = request.POST['seat']

    ob_table = table()
    ob_table.table_no= Tableno
    ob_table.no_of_seats= no_of_seat
    ob_table.table_status="available"
    ob_table.save()
    gen_qrcode(ob_table.id)
    return HttpResponse('''<script>alert('Added');window.location='/app/add_tableno/'</script>''')

def edit_tableno(request,id):
    try:
        t=table.objects.get(id=id)
    except:
        return HttpResponse('''<script>alert('id not found');window.location='/app/edit_tableno/'</script>''')


    return render(request,'ADMIN/tablenoedit.html',{'data':t})

def edit_tableno_post(request):
    tableno = request.POST['textfield']
    seatno = request.POST['seat']
    id = request.POST['id']

    tob=table.objects.get(id=id)
    tob.table_no=tableno
    tob.no_of_seat=seatno
    tob.save()

    return HttpResponse('''<script>alert('updated');window.location='/app/view_tableno/'</script>''')



def view_tableno(request):
    res = table.objects.all()
    return render(request,'ADMIN/tableview.html',{'data':res})

def view_tableno_post(request):
    tableno=request.POST['button']
    res = table.objects.filter(table_no__contains=tableno)

    return render(request,'ADMIN/tableview.html',{'data':res})


def search_table(request):
    search = request.POST['textfield']
    res = table.objects.filter(table_no__contains=search)

    return render(request,'ADMIN/tableview.html',{'data':res})


def delete_table(request,id):
    t= table.objects.get(id=id)
    t.delete()
    return HttpResponse('ok')
#kitchen



def kitchen_feedback(request):
    res = feedback.objects.all()
    return render(request,'KITCHEN/feedback.html',{'data':res})

def admin_feedback(request):
    res = feedback.objects.all()
    return render(request,'ADMIN/feedback.html',{'data':res})

def search_adm_feedback(request):
    search_from = request.POST['textfield']
    search_to = request.POST['textfield2']
    res = feedback.objects.filter(date__range=[search_from, search_to])
    return render(request, 'ADMIN/feedback.html', {'data': res})
def search_feedback(request):
    search_from = request.POST['textfield']
    search_to = request.POST['textfield2']
    res = feedback.objects.filter(date__range=[search_from, search_to])
    return render(request, 'KITCHEN/feedback.html', {'data': res})

def kitchen_order_details(request):
    res=order_main.objects.all()
    return render(request,'KITCHEN/order details.html',{'data':res})


def confirm_order(request,id):
    # oid=request.POST['oid']
    res=order_main.objects.filter(id=id).update(status='Confirm')
    return HttpResponse('''<script>alert('Confirmed');window.location='/app/kitchen_order_details/'</script>''')
def add_notification(request,id):
    res = order_main.objects.get(id=id)
    return render(request,'KITCHEN/add_notifications.html', {'data':res})

def add_notification_post(request):
    notificationn=request.POST['textarea']
    oid = request.POST['h1']
    ob_notification =notification()
    res = order_main.objects.get(id=oid)
    ob_notification.om_id =res
    ob_notification.status=notificationn
    ob_notification.save()
    return HttpResponse('''<script>alert('Send');window.location='/app/kitchen_order_details/'</script>''')


def search_k_orderdetails(request):
    search = request.POST['textfield']
    res = order_main.objects.get(customer.objects.filter(cust_name__contains=search))
    return render(request, 'KITCHEN/order details.html', {'data': res})


def kitchen_orderdet(request):
    return render(request,'KITCHEN/orderdet.html')

def search_k_orderdet(request):
    search = request.POST['textfield']
    return HttpResponse('ok')

def more_orderdet(request):
    res=order_main.objects.all()
    return render(request,'KITCHEN/orderdet.html',{'data':res})

def kitchen_home(request):
    return render(request,'KITCHEN/kitchen_home.html')

def more_order(request,id):
    b = order_main.objects.filter(ORDER_MAIN_id=id)
    return render(request,'KITCHEN/orderdet.html',{'data':b})

def kchn_index(request):
    return render(request,'KITCHEN/kitchen_index.html')

#service station

def service_station_bill(request):
    res = payment.objects.all()
    return render(request,'SERVICE STATION/bill.html',{'data':res})

def s_view_more(request,id):
    s = order_main.objects.filter(id=id)
    return render(request,'KITCHEN/orderdet.html',{'data':s})

def service_station_helpview(request):
    res=help.objects.all()
    return render(request,'SERVICE STATION/helpview.html',{'data':res})

def service_station_notification(request):

    res=notification.objects.all()

    return render(request,'SERVICE STATION/notification.html',{'data':res})

def s_home(request):
    return render(request,'SERVICE STATION/s_home.html')

def service_index(request):
    return render(request,'SERVICE STATION/service_index.html')


#cashier


def cashier_billing(request):
    res = order_main.objects.all()
    return render(request,'CASHIER/billing.html',{'data':res})





def more_billing(request,id):
    b = order_main.objects.get(LOGIN=id)
    q = payment.objects.get(USER=b)
    return render(request,'KITCHEN/orderdet.html',{'data':b,'pay':q})

def cash_index(request):
    return render(request, 'CASHIER/cashier_index.html')

def c_home(request):
    return render(request,'CASHIER/c_home.html')
# -------------------------------------------------


def a_login(request):
    username = request.POST['username']
    password = request.POST['password']
    res = login.objects.filter(username=username,password=password)
    if res.exists():
        res = login.objects.get(username=username, password=password)
        if res.type == "customer":
            return JsonResponse({'status':'ok',"lid":res.id})
        else:
            return JsonResponse({'status':'no'})
    else:
        return JsonResponse({'status':'no'})



def a_sign_up(request):
    name = request.POST['name']
    phone = request.POST['phone']
    email= request.POST['email']
    place = request.POST['place']
    password = request.POST['password']


    ob_login=login()
    ob_login.username=name
    ob_login.password=password
    ob_login.type="customer"
    ob_login.save()

    ob_customer=customer()
    ob_customer.cust_name=name
    ob_customer.custphone_no=phone
    ob_customer.email=email
    ob_customer.LOGIN=ob_login
    ob_customer.place=place
    ob_customer.save()
    return JsonResponse({'status':'ok'})


def a_sendfeedback(request):
    lid = request.POST['lid']
    feed = request.POST['feedback']
    rt = request.POST['rating']
    fid = request.POST['fid']
    import datetime
    datet=datetime.datetime.now()

    ob_fb=feedback()
    ob_fb.feedback=feed
    ob_fb.rating=rt
    ob_fb.date=datet
    ob_fb.food_id_id=fid
    ob_fb.USER=customer.objects.get(LOGIN_id=lid)
    ob_fb.save()
    return JsonResponse({'status': 'ok'})




def a_help(request):
   lid = request.POST['lid']
   helpp = request.POST['help']
   tid = request.POST['tid']


   ob_hlp = help()
   ob_hlp.help = helpp
   ob_hlp.USER = customer.objects.get(LOGIN_id=lid)
   ob_hlp.TABLE_id = tid
   ob_hlp.save()
   return JsonResponse({'status':'ok'})

def food_details(request):
    foods = food.objects.all()
    x=[]
    print(x)
    for i in foods:
        x.append({"id":i.id,"food_item":i.food_item,"stock":i.stock,"price":i.price,"food_image":i.food_image,"food_description":i.food_description,"category":i.category})
    if len(x)>0:
        return JsonResponse({"status":"ok","data":x})
    else:
        return

def a_view_profile(request):
    clid=request.POST['lid']
    res=customer.objects.filter(LOGIN_id=clid)
    if res.exists():
        res=customer.objects.get(LOGIN_id=clid)
        print(res)
        return JsonResponse({'status': 'ok', "cust_name":res.cust_name,"custphone_no":res.custphone_no,"email":res.email,"place":res.place})
        # return JsonResponse({'status': 'ok','data':res})
    else:
        return JsonResponse({'status': 'no'})


def order(request):
    from datetime import datetime,time
    lid=request.POST['lid']
    pid=request.POST['pid']
    print(pid,"fooddd")
    qty=request.POST['qty']
    tid=request.POST['tid']
    print(tid,"table")
    orobj=order_main()
    orobj.LOGIN=customer.objects.get(LOGIN_id=lid)
    orobj.food_id_id=pid
    orobj.quantity=qty
    orobj.date = datetime.now()
    orobj.TABLE_id=tid
    orobj.status='ordered'
    fobj=food.objects.get(id=pid)
    tot=0
    print(fobj.price)
    tot=(tot + int(fobj.price)) *int(qty)
    print(tot)
    orobj.total_amount=tot
    orobj.save()
    return JsonResponse({'status':"ok"})


def view_order(request):
    tam = 0
    lid=request.POST['lid']
    uid=customer.objects.get(LOGIN=login.objects.get(id=lid))
    res=order_main.objects.filter(LOGIN=uid, status='confirm')
    print(uid,"ppppppppppppppppppppppppppppppppppppp")
    x=[]
    for i in res:
        tam+=i.total_amount
        print(tam,"blaaaaahhh")
        x.append({"id":i.id, "TABLE_id":i.TABLE.id, "food_id":i.food_id.id,"LOGIN":i.LOGIN.id,"quantity":i.quantity,"total_amount":i.total_amount,"date":i.date,"TABLE":i.TABLE.id,"status":i.status,"food_item":i.food_id.food_item,"price":i.food_id.price,"food_image":i.food_id.food_image})
    if len(x)>0:
        print(x)
        return JsonResponse({"status":"ok","data":x,"totamnt":tam})
    else:
        return JsonResponse({"status":"no"})

def cancel_order(request):
    oid=request.POST['oid']
    res=order_main.objects.filter(id=oid).update(status='cancel')
    return JsonResponse({"status": "ok"})

def request_bill(request):
    lid = request.POST['lid']
    amount = request.POST['amnt']
    acnt = request.POST['account']
    tbl = request.POST['tbl_id']
    # pin = request.POST['pin']
    pobj = payment()
    pobj.total_amount = amount
    pobj.account_number = acnt
    pobj.date = datetime.datetime.now()
    pobj.USER = customer.objects.get(LOGIN_id=lid)
    pobj.TABLE = table.objects.get(id=tbl)
    pobj.status = 'paid'
    pobj.save()
    return JsonResponse({"status": "ok"})































