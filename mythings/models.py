import urllib.parse

from django.db import models
from django.utils import timezone

# Create your models here.

class Tag(models.Model):
    tag = models.TextField(blank=True)

    def __str__(self):
        return self.tag

    class Meta:
        ordering = ['-tag']


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    image = models.ImageField(upload_to='photos/%Y/%m/%d')
    description = models.TextField()
    published_date = models.DateTimeField(blank=True, null=True)
    image_date = models.DateField(blank=True, null=True)
    tags = models.ManyToManyField(Tag, blank=True)
    name = models.CharField(max_length=200)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title

    @property
    def url_name(self):
        return urllib.parse.quote_plus(self.title)

    @property
    def get_image(self):
        return self.image.url

    def display_tags(self):
        return ', '.join([t.tag for t in self.tags.all()])
    display_tags.short_description = 'Tags'
  
    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-published_date']

class ContactEntry(models.Model):
    message = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.message
    
'''class BlogSearchListView(BlogListView):
    """
    Display a Blog List page filtered by the search query.
    """
    paginate_by = 10

    def get_queryset(self):
        result = super(BlogSearchListView, self).get_queryset()'''