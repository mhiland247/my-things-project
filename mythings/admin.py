from django.contrib import admin
from .models import Post, Tag, ContactEntry

# Register your models here.

class PostAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Data',             {'fields': ['title', 'description', 'image', 'author', 'tags', 'name',]}),
        ('Date information', {'fields': ['published_date', 'image_date'], 'classes': ['collapse']}),
    ]

    list_display = ('title', 'description', 'image', 'author', 'published_date', 'image_date', 'display_tags', 'name',)
    list_filter = ['published_date']
    search_fields = ['tags', 'title']

class ContactEntryAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': [ 'message']}),
        ('Date information', {'fields': ['created_date'], 'classes': ['collapse']}),
    ]

    list_display = ( 'message',)
    list_filter = ['created_date']
    search_fields = ['message']

admin.site.register(Post, PostAdmin)
admin.site.register(Tag) 
admin.site.register(ContactEntry, ContactEntryAdmin)
