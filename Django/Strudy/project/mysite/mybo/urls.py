from django.urls import path
from . import views   # .은 현재 디렉토리(mybo 폴더, 패키지)

app_name='mybo' # 네임스페이스 (서로 다른 앱에서 동일한 별칭이 사용가능하도록) 설정

urlpatterns=[
    path('',views.index, name='index'),
    path('<int:question_id>/',views.detail, name='detail'),
    path('answer/create/<int:question_id>/', views.answer_create, name='answer_create'),

    # path('question/creat/',...),
]

#/mybo/ => 별칭 : index
#/mybo/3 => 별칭 : detail
# <int:question_id> : id(1~)