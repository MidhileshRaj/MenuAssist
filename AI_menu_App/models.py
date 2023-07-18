from django.db import models

#Create your models here.

class login(models.Model):
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    type = models.CharField(max_length=50)
    class meta:
        db_table="Login"

class food(models.Model):
    food_item = models.CharField(max_length=30)
    stock = models.BigIntegerField()
    price = models.BigIntegerField()
    food_image = models.CharField(max_length=250)
    food_description = models.CharField(max_length=250)
    category = models.CharField(max_length=50)
    class meta:
        db_table="Food"

class customer(models.Model):
    LOGIN = models.ForeignKey(login,on_delete=models.CASCADE,default=1)
    cust_name = models.CharField(max_length=25)
    custphone_no = models.CharField(max_length=10)
    place = models.CharField(max_length=30)
    email = models.CharField(max_length=40)
    class meta:
        db_table="Customer"

class staff(models.Model):
    LOGIN = models.ForeignKey(login,on_delete=models.CASCADE,default=1)
    staff_name = models.CharField(max_length=30)
    staffphone_no = models.CharField(max_length=10)
    staff_dob = models.CharField(max_length=15)
    staff_email = models.CharField(max_length=30)
    staff_place = models.CharField(max_length=40)
    staff_post = models.CharField(max_length=30)
    staff_district = models.CharField(max_length=30)
    staff_pincode = models.CharField(max_length=10)
    staff_photo = models.CharField(max_length=250)
    class meta:
        db_table="Staff"


class table(models.Model):
    table_no = models.CharField(max_length=10)
    no_of_seats = models.CharField(max_length=50)
    table_status = models.CharField(max_length=25)
    class meta:
        db_table="Table"

class order_main(models.Model):
    LOGIN=models.ForeignKey(customer,on_delete=models.CASCADE,default=1)
    food_id = models.ForeignKey(food, on_delete=models.CASCADE, default=1)
    quantity = models.BigIntegerField(default=1)
    total_amount = models.BigIntegerField()
    date = models.CharField(max_length=15)
    TABLE=models.ForeignKey(table,on_delete=models.CASCADE,default=1)
    status = models.CharField(max_length=20)
    class meta:
        db_table="Order_main"








# class order_sub(models.Model):
#     ORDER_MAIN = models.ForeignKey(order_main,on_delete=models.CASCADE,default=1)
#     food_id = models.ForeignKey(food,on_delete=models.CASCADE,default=1)
#     price = models.CharField(max_length=10)
#     quantity = models.CharField(max_length=30)
#     class meta:
#         db_table="Order_sub"

class feedback(models.Model):
    food_id = models.ForeignKey(food,on_delete=models.CASCADE,default=1)
    feedback = models.CharField(max_length=150)
    rating = models.CharField(max_length=25)
    date = models.CharField(max_length=15)
    USER = models.ForeignKey(customer, on_delete=models.CASCADE,default=1)
    class meta:
        db_table="Feedback"

class payment(models.Model):
    total_amount = models.CharField(max_length=10)
    date = models.CharField(max_length=15)
    status = models.CharField(max_length=25)
    account_number = models.CharField(max_length=30)
    TABLE = models.ForeignKey(table, on_delete=models.CASCADE, default=7)
    USER=models.ForeignKey(customer,on_delete=models.CASCADE,default=1)

class help(models.Model):
    TABLE = models.ForeignKey(table,on_delete=models.CASCADE,default=1)
    USER = models.ForeignKey(customer, on_delete=models.CASCADE,default=1)
    help = models.CharField(max_length=50)



class notification(models.Model):
    om_id=models.ForeignKey(order_main,on_delete=models.CASCADE,default=1)
    status=models.CharField(max_length=100)








    class meta:
        db_table="Payment"

