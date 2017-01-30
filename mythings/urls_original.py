from django.conf.urls import include, url
from . import views
from django.contrib.auth import views as auth_views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'things', views.ThingsViewSet)
router.register(r'tags', views.TagsViewSet)
#router.register(r'portfolio', views.PortfolioViewSet, base_name='portfolio')

urlpatterns = [
    #url(r'index/(?P<tag>.*)/$', views.index, name='index'),
    url(r'^$', views.index, name='index'),
    url(r'post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'post/(?P<name>.*)$', views.post_detail_name, name='post_detail_name'),
    url(r'add/posts/$', views.add_posts, name='add_posts'),
    url(r'^blog/$', views.tag_list, name='tag_list'), 		
    url(r'^tag/(?P<tag>.*)/$', views.tag_list, name='tag_list'), 		
    url(r'post/list/$', views.post_list, name='post_list'),
    #url(r'contact/$', views.contact_post, name='contact_post'),
    url(r'^home_page/$', views.home_page, name='home_page'),
    #url(r'^$', views.home_page, name='michelle_home'),
    #url(r'landing/$', views.landing_page, name='greatideations_home'),
    url(r'^adduser/$', views.adduser, name='adduser'),
    url(r'^main/$', views.main_page, name='main_page'),
    url('^change-password/', auth_views.password_change),
    url(r'^accounts/login/$', auth_views.login),
    url(r'^googled9f8c9df384d9723.html/$', views.google, name='google'),
      # For lead posting
    url(r'^lead/$', views.lead, name='lead'),

    # automatic url routing and browsable api
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^tasks/$', views.task_list, name='task_list'),
    url(r'^taks/(?P<pk>[0-9]+)/$', views.task_detail, name='task_detail'),
    url(r'^thingslist/$', views.things_list, name='things_list'),
   # url(r'^logos/$', views.tag_logo, name='logos')
   # url(r'^register/$', views.register, name='register'),
    #url(r'^login/$', views.user_login, name='login'),
    #url(r'^logout/$', views.user_logout, name='logout'),
]

