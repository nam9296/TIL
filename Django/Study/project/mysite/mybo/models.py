from django.db import models

# Create your models here.


class Question(models.Model):#붕어빵기계==Question(클래스)
                            #붕어빵 == 각각의 질문
    subject=models.CharField(max_length=200) #제목 속성(붕어빵 크기)
    content=models.TextField() #게시글 본문(붕어빵 내용물)
    create_date=models.DateTimeField()#게시일(붕어빵 무게)

    def __str__(self):
        return self.subject




class Answer(models.Model):

    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    #답변은 질문과 연결되어 있어야함
    #답변과 연결된  질문이 삭제된다면 -> 답변도 삭제한다는 의미(on_delete=models.CASCADE)

    content = models.TextField()
    create_date = models.DateTimeField()

# 모델 간 연결은 models.ForeignKey() 사용

