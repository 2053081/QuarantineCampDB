from django.shortcuts import render
from .models import Patient, Tests
# Create your views here.


def result(request): #TEST RESULT
    result = Tests.objects.all()
    context = {
        'result' : result
    }
    return render(request, 'real/result.html', context)

def index(request): #SEARCH FUNCTION
    if 'q' in request.GET:
        q = request.GET['q']
        data = Patient.objects.filter(full_name__icontains=q)
    else:
        data = Patient.objects.all()

    context = {
        'data' : data,
    }
    return render(request, 'real/index.html', context)
