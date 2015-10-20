# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mythings', '0002_contactentry'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='contactentry',
            name='email',
        ),
        migrations.RemoveField(
            model_name='contactentry',
            name='first_name',
        ),
        migrations.RemoveField(
            model_name='contactentry',
            name='last_name',
        ),
    ]
