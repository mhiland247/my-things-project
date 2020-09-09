# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-12-02 17:28
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('mythings', '0017_auto_20161201_1618'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contact_lead',
            name='email',
            field=models.EmailField(default=datetime.datetime(2016, 12, 2, 17, 28, 0, 608558, tzinfo=utc), max_length=254),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='contact_lead',
            name='message',
            field=models.TextField(default=datetime.datetime(2016, 12, 2, 17, 28, 20, 108501, tzinfo=utc)),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='contact_lead',
            name='name',
            field=models.CharField(default=datetime.datetime(2016, 12, 2, 17, 28, 32, 419902, tzinfo=utc), max_length=100),
            preserve_default=False,
        ),
    ]