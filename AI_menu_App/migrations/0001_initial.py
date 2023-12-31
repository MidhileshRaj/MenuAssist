# Generated by Django 3.2.16 on 2023-04-04 06:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='customer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cust_name', models.CharField(max_length=25)),
                ('custphone_no', models.CharField(max_length=10)),
                ('place', models.CharField(max_length=30)),
                ('email', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='food',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('food_item', models.CharField(max_length=30)),
                ('stock', models.BigIntegerField()),
                ('price', models.BigIntegerField()),
                ('food_image', models.CharField(max_length=250)),
                ('food_description', models.CharField(max_length=250)),
                ('category', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='login',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=50)),
                ('type', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='order_main',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.BigIntegerField(default=1)),
                ('total_amount', models.BigIntegerField()),
                ('date', models.CharField(max_length=15)),
                ('status', models.CharField(max_length=20)),
                ('LOGIN', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.customer')),
            ],
        ),
        migrations.CreateModel(
            name='table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('table_no', models.CharField(max_length=10)),
                ('no_of_seats', models.CharField(max_length=50)),
                ('table_status', models.CharField(max_length=25)),
            ],
        ),
        migrations.CreateModel(
            name='staff',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('staff_name', models.CharField(max_length=30)),
                ('staffphone_no', models.CharField(max_length=10)),
                ('staff_dob', models.CharField(max_length=15)),
                ('staff_email', models.CharField(max_length=30)),
                ('staff_place', models.CharField(max_length=40)),
                ('staff_post', models.CharField(max_length=30)),
                ('staff_district', models.CharField(max_length=30)),
                ('staff_pincode', models.CharField(max_length=10)),
                ('staff_photo', models.CharField(max_length=250)),
                ('LOGIN', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.login')),
            ],
        ),
        migrations.CreateModel(
            name='payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total_amount', models.CharField(max_length=10)),
                ('date', models.CharField(max_length=15)),
                ('status', models.CharField(max_length=25)),
                ('account_number', models.CharField(max_length=30)),
                ('ORDER_MAIN', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.order_main')),
            ],
        ),
        migrations.AddField(
            model_name='order_main',
            name='TABLE',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.table'),
        ),
        migrations.AddField(
            model_name='order_main',
            name='food_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.food'),
        ),
        migrations.CreateModel(
            name='notification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=100)),
                ('om_id', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.order_main')),
            ],
        ),
        migrations.CreateModel(
            name='help',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('help', models.CharField(max_length=50)),
                ('LOGIN', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.customer')),
                ('TABLE', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.table')),
            ],
        ),
        migrations.CreateModel(
            name='feedback',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('feedback', models.CharField(max_length=150)),
                ('rating', models.CharField(max_length=25)),
                ('date', models.CharField(max_length=15)),
                ('LOGIN', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.login')),
                ('food_id', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.food')),
            ],
        ),
        migrations.AddField(
            model_name='customer',
            name='LOGIN',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.login'),
        ),
    ]
