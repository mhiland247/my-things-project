import csv
from django.contrib import admin
from .models import Post, Tag, ContactEntry, UserProfile
from django.core import serializers
from django.http import HttpResponse
from djangoseo.admin import register_seo_admin
from .seo import MyMetadata


# Register your models here.
#admin.site.register(MyMetadata)

def export_as_json(modeladmin, request, queryset):
    response = HttpResponse(content_type="application/json")
    response['Content-Disposition'] = 'attachment; filename="mycontacts.json"'
    serializers.serialize("json", queryset, stream=response)
    return response

'''def export_csv(modeladmin, request, queryset):
    #get model fields data
    data = modeladmin._meta.get_fields()
    field_names = [field.name for field in data.fields]
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="mycontacts.csv"'
    writer = csv.writer(response)
    #write field names as headers
    writer.writerow(field_names)
    #get field values as a row for each header
    for obj in queryset:
        writer.writerow([unicode(getattr(obj, field)).encode('utf-8') for field in field_names]) 
    return response'''

class PostAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Data',             {'fields': ['title', 'description', 'image', 'author', 'tags', 'name',]}),
        ('Date information', {'fields': ['published_date', 'image_date'], 'classes': ['collapse']}),
    ]

    list_display = ('title', 'description', 'image', 'author', 'published_date', 'image_date', 'display_tags', 'name',)
    list_filter = ['published_date']
    search_fields = ['tags', 'title']

    actions = [export_as_json]

class ContactEntryAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': [ 'message']}),
        ('Date information', {'fields': ['created_date'], 'classes': ['collapse']}),
    ]

    list_display = ( 'message',)
    list_filter = ['created_date']
    search_fields = ['message']

    actions = [export_as_json]

#class MyMetaDataAdmin(admin.ModelAdmin):
#    fieldsets = [
#        ('metadata',        {'fields': ['title', 'keyword', 'description', 'h1']}),
#]

admin.site.register(Tag) 
admin.site.register(ContactEntry, ContactEntryAdmin)
admin.site.register(Post, PostAdmin)
admin.site.register(UserProfile)
register_seo_admin(admin.site, MyMetadata)
