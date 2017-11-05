import urllib.parse
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

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

class Photo(models.Model):
    photo = models.ImageField(upload_to='photos/%Y/%m/%d', blank=True)

    @property
    def get_photo(self):
        return self.photo.url

class Blog(models.Model):
    publisher = models.ForeignKey('auth.User')
    heading = models.CharField(max_length=200)
    content = models.TextField()
    created_on = models.DateTimeField(blank=True, null=True)
    photos = models.ManyToManyField(Photo, blank=True)
    tags = models.ManyToManyField(Tag, blank=True)

    def created_date(self):
        self.created_on = timezone.now()
        self.save()

    def __str__(self):
        return self.heading

    def display_tags(self):
        return ', '.join([t.tag for t in self.tags.all()])
    display_tags.short_description = 'Tags'

    @property
    def url_name(self):
        return urllib.parse.quote_plus(self.heading)

    class Meta:
        ordering = ['-created_on']


class ContactEntry(models.Model):
   # email = models.EmailField()
   # name = models.CharField(max_length=100)
    message = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.message

   # def __str__(self):
   #     return self.email

    #def __str__(self):
     #   return self.name


class UserProfile(models.Model):
    # This line is required. Links UserProfile to a User model instance.
    user = models.OneToOneField(User)

    # The additional attributes we wish to include.
    website = models.URLField(blank=True)
    picture = models.ImageField(upload_to='profile_images', blank=True)

    # Override the __unicode__() method to return out something meaningful!
    def __str__(self):
        return self.user.username

class Lead(models.Model):
    email = models.EmailField()
    created_date = models.DateTimeField(default=timezone.now)
    metadata = models.CharField(max_length=2000)

    def __str__(self):
        return self.email

class Task(models.Model):
    completed = models.BooleanField(default=False)
    title = models.CharField(max_length=100)
    description = models.TextField()
