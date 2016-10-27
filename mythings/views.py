import socket
import json
import operator
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.sites.models import Site
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404, redirect, render_to_response
from django.utils import timezone
from .models import Post, Tag, ContactEntry, UserProfile, Lead, Task
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect, requires_csrf_token
from django.template import RequestContext
from django.http import HttpResponseNotFound, HttpResponse, HttpResponseRedirect
from .forms import UserForm, UserProfileForm
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User
from rest_framework import viewsets, authentication, permissions, status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.renderers import JSONRenderer
from rest_framework.decorators import api_view
from .serializers import UserSerializer, ThingsSerializer, TasksSerializer

# Create your views here.

"""Angular.js"""



"""End of Angular.js"""


""" Django Views with normal template and url flow"""
def index(request):
    portfolio = Post.objects.filter(tags__tag='portfolio')
    first_logo = Post.objects.filter(tags__tag='modern_logo')
    second_logo = Post.objects.filter(tags__tag='nonprofit_logo')
    third_logo = Post.objects.filter(tags__tag='local_logo')
    fourth_logo = Post.objects.filter(tags__tag='packaging_label')
    fifth_item = Post.objects.filter(tags__tag='muscle_diagram')
    sixth_item = Post.objects.filter(tags__tag='businesscard')
    return render(request, 'mythings/michelle/index.html', {'portfolio' : portfolio, 'first_logo' : first_logo, 'second_logo' : second_logo, 'third_logo' : third_logo, 'fourth_logo' : fourth_logo, 'fifth_item' : fifth_item, 'sixth_item' : sixth_item})

@csrf_protect
#@login_required
def add_posts(request):
    if request.method == "POST": #if the form has been submitted
        post = Post() #assign variable to model
        post.title = request.POST['title'] #field bound to POST data
        post.description = request.POST['description']
        post.created_date = request.POST['image_date']
        post.author = request.user
        post.published_date = timezone.now()
        post.tag = request.POST['tag']
        post.image.save(request.FILES['get_image'].name, request.FILES['get_image'])
        t = post.tag.split(', ')
        for i in t:
            tag, created = Tag.objects.get_or_create(tag = i.strip())
            post.tags.add(tag)
        post.save()
        return redirect('mythings.views.post_detail', post.pk)
    else:
        post = Post()
    return render(request, 'mythings/michelle/add_posts.html', {'post': post})

def handle_uploaded_file(f,n):

    with open(n, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


def tag_list(request, tag=None): #browser sends request for page, django receives request and creates request obj about the request, tag is a kwarg-returned as dict 'tag':tag key:value
    if tag:
        posts = Post.objects.filter(tags__tag=tag.strip()) # create a variable called posts that 
    else:
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        tag = "Blog"
    return render(request, 'mythings/michelle/tag_list.html', {'posts': posts, 'tag': tag.title()})

@requires_csrf_token
def lead(request):
    if request.method == 'POST':
        lead_email = request.POST.get('the_post')
        response_data = {}

        post = Lead(email=lead_email, created_date=timezone.now())
        post.save()

        response_data['result'] = 'Thank you for your interest, we will be in touch soon!'
        response_data['email'] = post.email
        response_data['created_date'] = post.created_date.strftime('%B %d, %Y')

        return HttpResponse(
            json.dumps(response_data),
            content_type="application/json"
        )
    else:
        return HttpResponse(
            json.dumps({"nothing to see": "this isn't happening"}),
            content_type="application/json"
        )


def google(request):
    return render(request, 'mythings/michelle/googled9f8c9df384d9723.html')

"""End of django normal template url flow"""

"""Rest Framework Practice"""

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer

class ThingsViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all().order_by('-published_date')
    serializer_class = ThingsSerializer

class TagsViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all().filter(tags__tag='portfolio')
    serializer_class = ThingsSerializer
 
@api_view(['GET', 'POST'])
def things_list(request):
    """
    List all things or create a new thing
    """
    if request.method == 'GET':
        things = Post.objects.all()
        serializer = ThingsSerializer(things, many=True, context={'request': request})
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = ThingsSerializer(data=request.DATA)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(
                serilaizer.errors, status=status.HTTP_400_BAD_REQUEST)


@csrf_protect       
@api_view(['GET', 'POST'])
def task_list(request):
    """
    List all tasks, or create a new task routed to api /tasks
    """
    # GET Requests data from a specified resource
    if request.method == 'GET':
	#get all tasks objects
        tasks = Task.objects.all()
	# represent them inside a task serializer
        serializer = TasksSerializer(tasks, many=True)
	#return a django rest based resoponse, all task objects data converted to Json
        return Response(serializer.data)
    #POST Submits data to be processed to a specified resource
    elif request.method == 'POST':
        #create another instance of class sterializer, get data from request obj inside our Post
        serializer = TasksSerializer(data=request.DATA)
	#check if valid and save if is, will save to database
        if serializer.is_valid():
            serializer.save()
	#return response data and status cose in jason
            return Response(serilizer.data, status=status.HTTP_201_CREATED)
        #if it is not being created, return errors
        else:
            return Response(
                serilaizer.errors, status=status.HTTP_400_BAD_REQUEST)

#function based view for single task obj, HTTP Verbs-GET, PUT, DELETE
@csrf_protect
@api_view(['GET', 'PUT', 'DELETE'])
def task_detail(request, pk):
    """
    Get, update or delete a specific task
    """
    #try to get the task
    try:
        task = Task.objects.get(pk=pk)
    except Task.DoesNotExsist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'GET':
        serializer = TasksSerializer(task)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = TasksSerializer(task, data=request.DATA)
        if serializer.is_vaild():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(
                serilaizer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        #delete task
        task.delete()
        return Response(status=status.HTTP_202_NO_CONTENT)

    """End Rest Framework Practice"""


