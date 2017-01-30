import socket
import json
import operator
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.sites.models import Site
from django.http import JsonResponse, HttpResponseNotFound, HttpResponse, HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect, render_to_response
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_protect, requires_csrf_token
from django.template import RequestContext, Context
from django.core.mail import send_mail, BadHeaderError
from django.template.loader import get_template

#restframework imports
from rest_framework import viewsets, authentication, permissions, status, generics
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.renderers import JSONRenderer
from rest_framework.decorators import api_view

from .models import Post, Tag, UserProfile, Lead, ContactEntry
from .forms import UserForm, UserProfileForm
from .serializers import UserSerializer, ThingsSerializer, TasksSerializer, LeadSerializer, PortfolioSerializer
# Create your views here.

"""Angular.js"""
def angular(request):
    return render_to_response('mythings/angular/index.html', RequestContext(request))

class PortfolioViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PortfolioSerializer

    def get_queryset(self):
        queryset = super(PortfolioViewSet, self).get_queryset()
        return queryset.filter(tags__tag='portfolio')


class PassionViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.filter(tags__tag='passion')
    serializer_class = PortfolioSerializer

def passion_list(request):
    return render(request, 'mythings/angular/passion_list.html')

class ThingsViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all().order_by('-published_date')
    serializer_class = ThingsSerializer

    def perform_create(self, serializer):
        """Force author to the current user and timenow on save"""
        serializer.save(author=self.request.user, published_date = timezone.now())
    #permission_classes = (IsOwnerOrReadOnly,)

    #def pre_save(self, obj):
       # obj.owner = self.request.user

class LeadViewSet(viewsets.ModelViewSet):
    queryset = Lead.objects.all()
    serializer_class = LeadSerializer

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer

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
    return render(request, 'mythings/michelle/index.html',
                  {'portfolio': portfolio, 'first_logo': first_logo, 'second_logo': second_logo,
                   'third_logo': third_logo, 'fourth_logo': fourth_logo, 'fifth_item': fifth_item,
                   'sixth_item': sixth_item})
    #return render(request, 'mythings/mysite/index.html')

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

def post_detail_name(request, name):
    for post in Post.objects.all():
        if post.url_name == name:
            return render(request, 'mythings/michelle/post_detail.html', {'post': post})


def tag_list(request, tag=None): #browser sends request for page, django receives request and creates request obj about the request, tag is a kwarg-returned as dict 'tag':tag key:value
    if tag:
        posts = Post.objects.filter(tags__tag=tag.strip()) # create a variable called posts that 
    else:
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        tag = "Blog"
    return render(request, 'mythings/mysite/passions.html', {'posts': posts, 'tag': tag.title()})
    #return render(request, 'mythings/michelle/tag_list.html', {'posts': posts, 'tag': tag.title()}) //oldsite

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

def send_mail(request):
    subject = "New email submission",
    message = "new contact"
    from_email = request.Post.get('email')
    if new_email:
        try:
            send_mail(subject, message, from_email, ['michelle.hiland@gmail.com'])
        except BadHeaderError:
            return HttpResponse('Invalid header found.')
        return HttpResponse('success')


def google(request):
    return render(request, 'mythings/michelle/googled9f8c9df384d9723.html')

"""End of django normal template url flow"""

"""New site"""
def home(request):
    portfolio = Post.objects.filter(tags__tag='portfolio')
    first_logo = Post.objects.filter(tags__tag='modern_logo')
    second_logo = Post.objects.filter(tags__tag='nonprofit_logo')
    third_logo = Post.objects.filter(tags__tag='local_logo')
    fourth_logo = Post.objects.filter(tags__tag='packaging_label')
    fifth_item = Post.objects.filter(tags__tag='muscle_diagram')
    sixth_item = Post.objects.filter(tags__tag='businesscard')
    return render(request, 'mythings/mysite/index.html',
                  {'portfolio': portfolio, 'first_logo': first_logo, 'second_logo': second_logo,
                   'third_logo': third_logo, 'fourth_logo': fourth_logo, 'fifth_item': fifth_item,
                   'sixth_item': sixth_item})


def about(request):
    return render(request, 'mythings/mysite/about.html')

def portfolio(request):
    return render(request, 'mythings/mysite/portfolio.html')

def contact(request):
    return render(request, 'mythings/mysite/contact.html')

@requires_csrf_token
def contact_lead(request):
    if request.method == 'POST':
        lead_text = request.POST.get('the_contact')
        #lead_email = request.POST.get('the_email')
        #lead_name = request.POST.get('the_name')
        response_data = {}

        contact = ContactEntry(message=lead_text, created_date=timezone.now())
        contact.save()

        response_data['result'] = 'Thank you for your interest, I will be in touch soon!'
        #response_data['name'] = contact.name
        #response_data['email'] = contact.email
        response_data['message'] = contact.message
        response_data['created_date'] = contact.created_date.strftime('%B %d, %Y')

        return HttpResponse(
            json.dumps(response_data),
            content_type="application/json"
        )
    else:
        return HttpResponse(
            json.dumps({"nothing to see": "this isn't happening"}),
            content_type="application/json"
        )
