from django.contrib.auth.models import User, Group
from rest_framework import serializers
from .models import Post, Tag, Task

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'groups')

class ThingsSerializer(serializers.HyperlinkedModelSerializer):
    tags = serializers.SlugRelatedField(many=True, read_only=True, slug_field='tag')
    class Meta:
        model = Post
        fields = ('url','author','title', 'description', 'image', 'tags', 'published_date')

class TasksSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = ('completed', 'description', 'title')

