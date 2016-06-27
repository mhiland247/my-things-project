import socket
import json
import operator
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.sites.models import Site
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404, redirect, render_to_response
from django.utils import timezone
from .models import Post, Tag, ContactEntry, UserProfile
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect, requires_csrf_token
from django.template import RequestContext
from django.http import HttpResponseNotFound, HttpResponse, HttpResponseRedirect
from .forms import UserForm, UserProfileForm
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User

# Create your views here.
'''def get_my_site(request):
    current_site = get_current_site(request)
        return render(request, 'mythings/michelle/home.html')
    else:
        return render(request, 'mythings/error.html')'''

def home_page(request):
   return render(request, 'mythings/michelle/home.html')

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

def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'mythings/michelle/post_detail.html', {'post': post})

def tag_list(request, tag=None): #browser sends request for page, django receives request and creates request obj about the request, tag is a kwarg-returned as dict 'tag':tag key:value
    if tag:
        posts = Post.objects.filter(tags__tag=tag.strip()) # create a variable called posts that 
    else:
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        tag = "Blog"
    return render(request, 'mythings/michelle/tag_list.html', {'posts': posts, 'tag': tag.title()})

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    #latest_blog_list = Post.objects.order_by('-published_date')[:2]
    #context = {'latest_blog_list': latest_blog_list}
    return render(request, 'mythings/michelle/myblog.html', {'posts': posts})

@requires_csrf_token
def contact_post(request):
    if request.method == 'POST':
        post_text = request.POST.get('the_post')
        response_data = {}

        post = ContactEntry(message=post_text, created_date=timezone.now())
        post.save()

        response_data['result'] = 'Message was submited, thank you!'
        response_data['message'] = post.message
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

def adduser(request):
    if request.method == "POST":
        form = UserForm(request.POST)
       # profile_form = UserProfileForm(request.POST)
        if form.is_valid():
            new_user = User.objects.create_user(**form.cleaned_data)
	    
            return HttpResponseRedirect('/main/')
    else:
        form = UserForm()
       # profile_form = UserProfileForm()

    return render(request, 'registration/adduser.html', {'form': form})

def main_page(request):
    return render(request, 'mythings/main.html') 


def google(request):
    return render(request, 'mythings/michelle/googled9f8c9df384d9723.html')

                                                          
'''def register(request):
    # Set a boolena value to to False initially. Code changes value to True when registration succeeds.
    registered = False

    # If it's a HTTP POST, we're interested in processing form data.
    if request.method == 'POST':
        # Attempt to grab information from the raw form information.
        user_form = UserForm(data=request.POST)
        profile_form = UserProfileForm(data=request.POST)

        # If the two forms are valid...
        if user_form.is_valid() and profile_form.is_valid():
            # Save the user's form data to the database.
            user = user_form.save()

            # Now we hash the password with the set_password method.
            user.set_password(user.password)
            user.save()

            # Since we need to set the user attribute ourselves, we set commit=False.
            profile = profile_form.save(commit=False)
            profile.user = user

            if 'picture' in request.FILES:
                profile.picture = request.FILES['picture']

            profile.save()

            # Update our variable to tell the template registration was successful.
            registered = True
        return render(request, 'mythings/main.html', {'registered': registered})

    # These forms will be blank, ready for user input.
    else:
        user_form = UserForm()
        profile_form = UserProfileForm()

    # Render the template depending on the context.
    return render(request, 'registration/register.html',{'user_form': user_form, 'profile_form': profile_form, 'registered': registered})

def user_login(request):
    # If the request is a HTTP POST, try to pull out the relevant information.
    if request.method == 'POST':
        # Gather the username and password provided by the user.
        username = request.POST['username']
        password = request.POST['password']

        # Use Django's machinery to attempt to see if the username/password
        user = authenticate(username=username, password=password)

        # If we have a User object, the details are correct.
        if user:
            # Is the account active? It could have been disabled.
            if user.is_active:
                # If the account is valid and active, we can log the user in.
                return HttpResponseRedirect('mythings/main.html')
            else:
                # An inactive account was used - no logging in!
                return HttpResponse("Your Things Theory account is disabled.")
        else:
            # Bad login details were provided. So we can't log the user in.
            print ("Invalid login details: {0}, {1}".format(username, password))
            return HttpResponse("Invalid login details supplied.")

    else:
        return render(request, 'registration/login.html', {})

@login_required
def user_logout(request):
    # Since we know the user is logged in, we can now just log them out.
    logout(request)

    # Take the user back to the homepage.
    return HttpResponseRedirect('/main/')'''
