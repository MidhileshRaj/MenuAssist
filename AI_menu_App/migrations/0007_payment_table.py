# Generated by Django 3.2.16 on 2023-04-17 16:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('AI_menu_App', '0006_remove_payment_order'),
    ]

    operations = [
        migrations.AddField(
            model_name='payment',
            name='TABLE',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='AI_menu_App.table'),
        ),
    ]
