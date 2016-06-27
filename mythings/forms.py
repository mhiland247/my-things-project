from django import forms
from django.contrib.auth.models import User
from django.forms import ModelForm
from .models import UserProfile

class UserForm(ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())
   # email = forms.CharField(widget=forms.EmailField())

    class Meta:
        model = User
        fields = ('username', 'email', 'password')

class UserProfileForm(forms.ModelForm):
    website = forms.URLField(label='Website (optional)')
    picture = forms.ImageField(label='Picture (optional)')

    class Meta:
        model = UserProfile
        fields = ('website', 'picture')
