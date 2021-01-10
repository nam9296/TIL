# 입력(과일) -> 함수(믹서기) -> 출력(과일주스)
# 입력(자극) -> 함수(뇌) -> 출력(반응)

# 함수 정의 구문
# def 함수명(매개변수):
#   문장1
#   문장2

# # 함수 호출 구문
#
# def add1(a,b):
#     sum=a+b
#     return sum # 함수가 수행한 결과를 출력한다고 생각하면 됨
# print("호출 전")
# res = add1(1,2)
# print("호출 후")
# print(res)
# # 수행순서
# # 함수는 호출해야만 수행된다.
# # 1) add(1,2) 호출
# # 2) add함수 수행- > sum 리턴
# # 3) sum이 res에 저장

# # 입력값이 없는 함수
# def say():
#     return "안녕"
# print(say())


# # 출력값이 없는 함수
# def add2(a,b):
#     print("두 수의 합은 :  ", a+b)
# add2(3,5)

# # 입력값과 출력값이 없는 함수
# def say1():
#     print("안녕")
# #   return 이 생략되있음
# say1()

# # 매개변수의 초기값을 설정하여 함수를 호출
#
# def add(a,b):
#     return a+b
# res=add(2,3)
# print(res)
#
# def add(a,b=3):
#     print(b)
#     print(a)
#     return a+b
# res = add(2)
# print(res)

# # 함수로 전달되는 인수의 개수가 정해져 있지 않은경우
# def add_1(a,b):
#     res = a+b
#     return res
# r= add_1(1,2)
# print(r)

# def add_1(*arg): # *매개변수
#     res = 0
#     print(arg) # (1, 2, 3, 5, 4) 튜플이구나 ?
#     for i in arg:
#         res+=i
#     return res
# r= add_1(1,2,3,5,4)
# print(r)


#
# def mul(*arg):
#     nam = 1
#     for i in arg:
#         nam = i * nam
#     return nam
# res = mul(1,2,3,4,5)
# print(res)



### 중요해요
# def addmul(a,*arg):
#
#     if a == "mul":
#         nam = 1
#         for i in arg:
#             nam = i * nam
#         return nam
#     elif a == "add":
#         nam = 0
#         for i in arg:
#             nam = i + nam
#         return nam
# res = addmul("add",1,2,3,4,5)
# print(res)
#
# res = addmul("mul",1,2,3,4,5)
# print(res)
#

# def am(a,b):
#     return a+b, a*b
# print (am(7,2)) #(9, 14)
# # 함수의 결과값은 항상 1개이다. 튜플 형식으로 리턴됨
#
# # 리턴문은 반드시 한 개만 작성하자


# def prn(a):
#     if a == '안녕':
#         return
#     print('반가워')
#
# prn('안녕') # 아무것도 안나옴
# prn('메롱') # 반가워

# def say(a,b,man=True): # 매개변수를 작성하세요
#     print('내 이름은 ',a)
#     print('나이는',b)
#
#     if man:
#         print("성별은 남")
#     else:
#         print('성별은 여')
#     # if man == False:
#     #     print('성별은 여')
#     # else:
#     #     print('성별은 남')

# say('홍길동',25)
# 내 이름은 홍길동
# 나이는 25
# 성별은 남

# say('홍길동',25,True)
# # 내 이름은 홍길동
# # 내 나이는 25
# # 성별은 남
#
# say('김말순', 26, False)
# # 내 이름은 김말순
# # 나이는 26
# # 성별은 여
#
# say('김말순', 26)
# # 내이름은 김말순
# # 나이는 26
# # 성별은 남

# # def문 안에서의 변수는 밖에서는 무효하다. scope
# a=1
# def mytest(a):
#     a=a+1
#     print(a)
# mytest(a)
# print(a)
#
# def mytest2(z):
#     z=z+1
#     print(z)
# mytest2(3)
# # print(z)

# a =1
# def mytest3(a):
#     a=a+1 # 함수 안에서 밖에 있는 변수를 증가하고 싶다면, 2가지 방법( return, global)
# mytest3(a)
# print(a) # 2가 출력됬으면 ...

# #1. return 사용
# a =1
# def mytest3_1(a):
#     a=a+1
#     return a
# a=mytest3_1(a)
# print(a)
#
# #2. global 사용 : 함수 안에서 함수 밖의 변수를 직접 사용할 수 있다.
# a =1
# def mytest3_2():
#     global a
#     a=a+1
# mytest3_2()
# print(a)

# # lambda : def 와 동일한 기능을 수행하는 예약어
# # 함수 정의시 일반적으로는 def를 사용,
# # 함수가 복잡하거나 def를 사용하지 못하는 곳에서는 람다 사용
# #1. def를 이용한 일반적인 함수 정의
# def myadd(a,b):
#     return a+b
# res=myadd(2,5)
# print(res)
#
# print("="*50)
# #1. 람다를 이용한 함수 정의
# # 함수명 = lambda 매개변수1, 매개변수2, ... : 매개변수를 이용한 계산식
# myadd = lambda a,b: a+b
# res=myadd(2,5)
# print(res)

# def mymax(*arg):
#     nam = 0
#     for i in range(len(arg)):
#         if nam<arg[i]:
#             nam=arg[i]
#     return nam
#
# print(mymax(5,7,2,1))
# print(mymax(1,2,3,4,5,6,7,8,9))


# 일반 함수 형식
# def pt(x):
#     return x+10
# print(pt(1))

# 람다 함수 형식
# pt = lambda x: x+10
# print(pt(1))

# # 람다 함수 자체를 바로 호출
# # (lambda 매개변수들 : 수식)(매개변수 인수들)
# print((lambda x: x+10)(1))
# print((lambda x,y: x+y)(1,20))
#
# # 람다 함수 내에서는 변수를 생성할 수 없음
# # print((lambda x: y=2;x+y)(1)) ERROR
#
# y=2
# print((lambda x:x+y)(1))



# # 함수의 인수부분에 간단한 함수를 적용하고자 하는 경우
# # map(함수, 데이터)
# def pt(x):
#     return x+10
# print(list(map(pt,[1,2,3])))
#
# # 위 함수를 lambda로 구현하기
# print(list(map(lambda x:x+10,[1,2,3])))
#
# # 람다식으로 매개변수가 없는 함수 표현
# def kk():
#     return 1
# print(kk())
#
# print((lambda  : 1)()) # 위와 같은 표현

# 퀴즈
fl = ['test.c','test2.h','sample.py', 'sample2.c']

# 확장자가 c이거나 h인 파일 이름을 모두 화면에 출력


# def file_a(alist):
#     for i in fl:
#         if alist[-1] =='c' or 'h':
#             print(i)
# file_a(fl)

#
# for i in fl:
#     res= i.split('.')
#     if res[1]=='c' or res[1]=='h':
#         print(i)
#
































