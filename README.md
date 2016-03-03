Synopsis
My things project is website with a dynamic portfolio of "things" I have created.
The portfolio page adds the newest content to the top. Each thing can be clicked
on to view indivually and all are associated with tags so can be aggregated based
on tags and in the case of portfolio all things with the tag portfolio are displayed.

Code Example
These examples will show you how to create a thing and then view it specifing a tag 
to sort things that are similar.

How to add a new thing or post and associate it with a tag.

@csrf_protect
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
    
    How to then filter on the tag to display all posts or things based on the name of the tag if a name is not specified blog 
    display all.
    
    def tag_list(request, tag=None): 
    if tag:
        posts = Post.objects.filter(tags__tag=tag.strip()) 
    else:
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        tag = "Blog"
    return render(request, 'mythings/michelle/tag_list.html', {'posts': posts, 'tag': tag.title()})
    
    Motivation
    A learning experience in django and way to create a dynamic portfolio of my work.
    
  
    
