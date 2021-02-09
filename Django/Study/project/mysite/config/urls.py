"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from mybo import views

urlpatterns = [
    path('admin/', admin.site.urls),
    #path('mybo/', views.index),

    path('mybo/', include('mybo.urls')),
    # mybo/ 로 시작되는 페이지 요청이 있는 경우에는 모두 mybo에 있는
    # urls.py 파일의 매핑 규칙을 참조하여 처리해야함
    # 결과적으로 mybo/ 로 시작되는 요청은 모두 mybo/urls파일이 담당

    # localhost(www.naver.com):8000/mybo/
    # 127.0.0.1(100,200,200,5):8000(포트번호는 0~65535번 까지 있음)
    # 삼성전자 주소 : 가전기기사업부/...
    # 대표전화(1588-1000): 구내번호(ex.99번)

    # ex)
    # url 페이지 요청                   요청 처리 담당 파일
    # mybo/question/create/             mybo/urls.py
    # mybo/answer/search/               mybo/urls.py
    #     그 외                         config/urls.py
]
# mybo 주소와 views파일의 index함수를 매핑함
# 'mybo/' => http://127.0.0.1:8000/mybo 주소로 인식함