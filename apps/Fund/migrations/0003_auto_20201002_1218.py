# Generated by Django 3.1.1 on 2020-10-02 12:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Fund', '0002_auto_20201002_1217'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundmanager',
            name='company_id',
            field=models.CharField(default='', max_length=20, verbose_name='所属公司 id'),
        ),
        migrations.AlterField(
            model_name='fundmanager',
            name='manager_id',
            field=models.CharField(max_length=20, unique=True, verbose_name='基金经理 id'),
        ),
    ]
