from django.conf.urls import include, url
from . import views
from django.contrib.auth import views as auth_views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'things', views.ThingsViewSet)
router.register(r'leads', views.LeadViewSet)
#router.register(r'portfolio', views.PortfolioViewSet, base_name='portfolio')

urlpatterns = [
    #original urls for mysite
    url(r'^$', views.index, name='index'),
    url(r'post/(?P<name>.*)$', views.post_detail_name, name='post_detail_name'),
    url(r'add/posts/$', views.add_posts, name='add_posts'),
    url(r'^tag/(?P<tag>.*)/$', views.tag_list, name='tag_list'),
    url(r'^googled9f8c9df384d9723.html/$', views.google, name='google'),
    url(r'^lead/$', views.lead, name='lead'),
    #end original urls for mysite
    # automatic url routing and browsable api
    url(r'^', include(router.urls)),
    # restapi urls practice
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^tasks/$', views.task_list, name='task_list'),
    url(r'^tasks/(?P<pk>[0-9]+)/$', views.task_detail, name='task_detail'),
    #url(r'^things/list/$', views.things_list, name='things_list'),
    #url(r'^things/list/(?P<pk>[0-9]+)$', views.things_detail, name='things_detail'),
    #end restapi pracice
    #angular.js
    #url(r'^lead/(?P<pk>[0-9a-zA-Z_-]+)$', LeadDetail.as_view(), name='lead-detail'),
    #url(r'^leads/$', views.LeadList, name='lead-list'),
    #url(r'^thing/(?P<pk>\d+)$', ThingDetail.as_view(), name='thing-detail'),
    #url(r'^thing/$', ThingList.as_view(), name='thing-list')"""

    #url(r'^', include(things_urls)),
   # url(r'^leads', include(leads_urls)),
]

