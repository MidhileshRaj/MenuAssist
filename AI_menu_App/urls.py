from django.urls import path
from . import views
from qr import *
urlpatterns = [

    path('login/', views.login_),
    path('login_post/', views.login_post),

    # ------
    # index
    path('adm_index/', views.adm_index),

    path('home/', views.home),

    path('user_inform/', views.user_inform),
    path('search_user/', views.search_user),

    path('add_food/', views.add_food),
    path('add_food_post/', views.add_food_post),

    path('edit_food/<str:id>', views.edit_food),
    path('edit_food_post/', views.edit_food_post),

    path('view_food/', views.view_food),
    path('search_food/', views.search_food),
    path('delete_food/<str:id>', views.delete_food),

    path('add_staff/', views.add_staff),
    path('add_staff_post/', views.add_staff_post),

    path('edit_staff/<str:id>', views.edit_staff),
    path('edit_staff_post/', views.edit_staff_post),

    path('view_staff/', views.view_staff),
    path('search_staff/', views.search_staff),
    path('delete_staff/<str:id>', views.delete_staff),

    path('add_tableno/', views.add_tableno),
    path('add_tableno_post/', views.add_tableno_post),

    path('edit_tableno/<str:id>', views.edit_tableno),
    path('edit_tableno_post/', views.edit_tableno_post),

    path('view_tableno/', views.view_tableno),
    path('search_table/', views.search_table),
    path('delete_table/<str:id>', views.delete_table),

    #   kitchen
    path('kitchen_feedback/', views.kitchen_feedback),
    path('search_feedback/', views.search_feedback),
    path('search_adm_feedback/', views.search_adm_feedback),
    path('admin_feedback/', views.admin_feedback),

    path('add_notification/<id>', views.add_notification),
    path('add_notification_post/', views.add_notification_post),

    path('kitchen_order_details/', views.kitchen_order_details),

    path('confirm_order/<str:id>', views.confirm_order),

    path('more_order/<str:id>', views.more_order),

    path('kitchen_orderdet/', views.kitchen_orderdet),

    path('search_k_orderdet/', views.search_k_orderdet),

    path('more_orderdet/', views.more_orderdet),

    path('kitchen_home/', views.kitchen_home),

    path('search_k_orderdetails/', views.search_k_orderdetails),

    path('kchn_index/', views.kchn_index),

    # service station

    path('service_station_bill/', views.service_station_bill),

    path('s_view_more/<str:id>', views.s_view_more),

    path('service_station_helpview/', views.service_station_helpview),

    path('service_station_notification/', views.service_station_notification),

    path('s_home/', views.s_home),

    path('service_index/', views.service_index),

    # cashier

    path('cashier_billing/', views.cashier_billing),

    path('more_billing/<str:id>', views.more_billing),

    path('cash_index/', views.cash_index),

    path('c_home/', views.c_home),



    #-------------------------------

    path('a_login/', views.a_login),

    path('a_sign_up/',views.a_sign_up),

    path('a_sendfeedback/',views.a_sendfeedback),

    path('food_details/',views.food_details),

    path('a_help/',views.a_help),

    path('a_view_profile/',views.a_view_profile),

    path('order/',views.order),

    path('view_order/',views.view_order),

    path('cancel_order/',views.cancel_order),

    path('request_bill/',views.request_bill),




    #------------------------



]
