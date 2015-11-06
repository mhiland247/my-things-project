import socket
import json
import operator
from django.contrib.sites.shortcuts import get_current_site
from django.contrib.sites.models import Site
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404, redirect, render_to_response
from django.http import HttpResponse
from django.utils import timezone
from .models import Post, Tag, ContactEntry
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect, requires_csrf_token
from django.template import RequestContext
from django.http import HttpResponseNotFound 

# Create your views here.
'''def get_my_site(request):
    current_site = get_current_site(request)
    if current_site.domain == 'michellehiland.com':
        return render(request, 'mythings/michelle/home.html')
    elif request.get_host.domain == 'greatideations.com':
        return render(request, 'mythings/greatideations/index.html')
    else:
        return render(request, 'mythings/error.html')'''

def home_page(request):
   return render(request, 'mythings/michelle/home.html')

#def landing_page(request):
#    return render(request, 'mythings/greatideations/index.html')

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

''''def contact_form(request):
    if request.method == "POST": #if the form has been submitted
        post = ContactEntry()
        post.message = request.POST['message']
        post.created_date = timezone.now()
        post.save()
        response = "thank you"
        return render(request, 'mythings/home.html' {'response': response})
	#return render(request, 'mythings/thanks.html')
        #return JsonResponse({"Thank you":"I will get back to you shortly."})
    else:
        post = ContactEntry()
    return render(request, 'mythings/home.html', {'post': post})

def thanks(request):
   # post = get_object_or_404(ContactEntry, pk=pk)
    return render(request, 'mythings/thanks.html')'''


