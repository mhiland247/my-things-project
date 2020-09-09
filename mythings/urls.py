from django.conf.urls import include, url
from . import views
from django.contrib.auth import views as auth_views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'things', views.ThingsViewSet)
router.register(r'leads', views.LeadViewSet)
router.register(r'portfolio', views.PortfolioViewSet)
router.register(r'passions', views.PassionViewSet)

urlpatterns = [
    # django normal urls
    url(r'^home/$', views.index, name='index'),
    # vitality site
    url(r'^$', views.blog, name='blog'),
    url(r'^new_contact/$', views.new_contact, name='new_contact'),
    #url(r'^campaign/$', views.campaign, name='campaign'),
    #new site
    #url(r'^mysite/$', views.home, name='home'),
    #url(r'^about/$', views.about, name='about'),
    #url(r'^portfolio/$', views.portfolio, name='portfolio'),
    #url(r'^contact/$', views.contact, name='contact'),
    #url(r'^contact_lead/$', views.contact_lead, name='contact_lead'),
    #url(r'post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'post/(?P<name>.*)$', views.post_detail_name, name='post_detail_name'),
    url(r'add/posts/$', views.add_posts, name='add_posts'),
    url(r'^blog/$', views.tag_list, name='tag_list'),
    url(r'^tag/(?P<tag>.*)/$', views.tag_list, name='tag_list'),
    #url(r'post/list/$', views.post_list, name='post_list'),
    #url(r'^adduser/$', views.adduser, name='adduser'),
    url('^change-password/', auth_views.password_change),
    url(r'^accounts/login/$', auth_views.login),
    url(r'^googled9f8c9df384d9723.html/$', views.google, name='google'),
    # For lead posting
    url(r'^lead/$', views.lead, name='lead'),

    #angular urls
    url(r'^angular/$', views.angular, name='angular_index'),
    url(r'passion_list/$', views.passion_list, name='passion_list'),
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    #url(r'^posts/?$', views.PostsView, name='my_crud_view'),


]

