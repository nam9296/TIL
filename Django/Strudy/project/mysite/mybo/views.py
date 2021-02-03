from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from .models import Question
from django.utils import timezone
# Create your views here.

def index(request):
    question_list=Question.objects.order_by('-create_date')
    context={'question_list':question_list}

    return render(request, 'mybo/question_list.html', context)

# render함수는 context에 있는 질문 데이터를 템플릿(mybo/question_list.html)을
# 적용하여 html 코드로 변환해서 출력
# 템플릿 파일들을 저장하기 위한 폴더 생성


def detail(request, question_id):
    #question=Question.objects.get(id=question_id)
    question = get_object_or_404(Question,pk=question_id)
    context={'question':question}
    return render(request,'mybo/question_detail.html', context)


# /mybo/answer/create/2 ->question_id에 2가 전달됨.
# request에는 mybo/question_detail.html에서 textarea에 입력된 내용이 전달됨
# (content=request.POST.get('content')코드는 textarea에 입력된 내용을 추출
def answer_create(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    question.answer_set.create(content=request.POST.get('content'),
                               create_date=timezone.now())
    return redirect('mybo:detail', question_id=question.id)
