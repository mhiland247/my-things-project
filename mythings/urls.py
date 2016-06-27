from django.conf.urls import include, url
from . import views
from django.contrib.auth import views as auth_views

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
    url(r'^adduser/$', views.adduser, name='adduser'),
    url(r'^main/$', views.main_page, name='main_page'),
    url('^change-password/', auth_views.password_change),
    url(r'^accounts/login/$', auth_views.login),
    url(r'^googled9f8c9df384d9723.html/$', views.google, name='google')
   # url(r'^register/$', views.register, name='register'),
    #url(r'^login/$', views.user_login, name='login'),
    #url(r'^logout/$', views.user_logout, name='logout'),
]

