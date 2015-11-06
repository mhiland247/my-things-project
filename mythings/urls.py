from django.conf.urls import include, url
from . import views

urlpatterns = [
    #url(r'^$', views.get_my_site, name='get_my_site'),
    url(r'post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'post/(?P<name>.*)$', views.post_detail_name, name='post_detail_name'),
    url(r'add/posts/$', views.add_posts, name='add_posts'),
    url(r'^blog/$', views.tag_list, name='tag_list'), 		
    url(r'^tag/(?P<tag>.*)/$', views.tag_list, name='tag_list'), 		
    url(r'post/list/$', views.post_list, name='post_list'),
    url(r'contact/$', views.contact_post, name='contact_post'),
    url(r'^$', views.home_page, name='michelle_home'),
    #url(r'landing/$', views.landing_page, name='greatideations_home'),
]

