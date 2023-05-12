from django.contrib import admin
from .views import index
from .models import Patient, Tests
# Register your models here.

admin.site.site_url = 'index'
admin.site.register(Patient)
admin.site.register(Tests)
#admin.site.register(Tests)