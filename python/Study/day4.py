# 정렬 함수 sort() 는 day2에서 한적있다
# sorted() 는 무엇일까
#
# data = [2,4,3,1,5,10,9]
# data.sort()
# print(data) # 정렬된 결과가 data변수에 저장됨
#
# data1 = [5,3,2,6,41,6,73,]
# data2 = sorted(data1)
# print(data2) # data1 변수에 정렬전의 모습으로 남아있음
#
# dic = {'아이디':'홍길동','레벨':10,'체력':200,'마나':20,'공격력':200,'방어력':50}
# print(dic.keys())
# print(dic.values())
# print(dic.items())
#
# dic.clear() # 모든 요소들을 제거
# print(dic) #{}

# print(dic['아이디'])
# print(dic.get('아이디'))# 키에 연결된 값을 추출
# 딕셔너리.get('키') == 딕셔너리['키']
# print(dic['민첩']) #ERROR
# print(dic.get('민첩')) # NONE
# print(dic.get('민첩',0)) # 민첩이 존재하지않으면 0으로 출력시키기
# if dic.get('민첩'):
#     print('민첩 능력이 있습니다.')
# else:
#     print(' 민첩이 존재하지 않습니다.')



# # 집합(set)
# s1=set([1,2,2,2,3]) # 리스트 자료를 기초로 집합(중복 제외)을 생성
# print(s1) #{1, 2, 3} 중복이 지워져있음
#
# s2=set('hihello')
# print(s2) #{'h', 'l', 'e', 'o', 'i'}
#
# # list()
# # tuple()
# # dic()
# s3=set()
# print(set)# <class 'set'>

# 이전에 set은 squence가 아니라고 했었다. 순서가 없기 때문에.
# 순서가 없으므로 인덱싱과 슬라이싱이 불가능
# print(s1[1])
# 반드시 인덱싱을 원하면 set을 리스트나 튜플로 변환한 후 인덱싱을 수행

# print(list(s1)) #[1, 2, 3]
# s1_1=list(s1)
# print(s1_1[2])

# s1=set([1,2,3,4,5,6])
# s2=set([4,5,6,7,8,9])
# # 교집합
# print(s1&s2)
# print(s1.intersection(s2)) # {4, 5, 6}
# # 합집합
# print(s1|s2)
# print(s1.union(s2)) # {1, 2, 3, 4, 5, 6, 7, 8, 9}
# # 차집합
# print(s1-s2)
# print(s1.difference(s2)) # {1, 2, 3}
# print(s2-s1)
# print(s2.difference(s1)) # {8, 9, 7}
#
# # 집합에 추가하기
# s3 = set()
# s3.add(3) # 하나씩만 추가 가능
# print(s3) #{3}
#
# # update() : 집합에 여러개를 추가
# s3.update([1,2,3,5,6])
# print(s3) # {1, 2, 3, 5, 6}
# s3.update([1,2,3,15,16])
# print(s3) # {1, 2, 3, 5, 6, 15, 16}
#
# # remove() : 집합을 제거하기
# s3.remove(2)
# print(s3)

# # 불(bool) 자료형 : True or False
# # 참 : "test", [1,2], 1, ...
# # 거짓 : "", None, 0, [], (), {}
#


# a = [1,2,3]
# # 변수 = 리스트? 리스트(객체)는 메모리에 생성되고,
# # 변수 a는 메모리상의 주소를 가지게 됨
#
# # a 변수가 가리키는 메모리의 주소를 확인
# print(id(a)) # 2285370999232 에 [1,2,3]이 저장되어 있다.
# print("="*50)
# a=[1,2,3]
# b=a # a가 가지고 있는 주소값을 b와 같게 ?
# print(b)
# print(a)
# print(id(a)) #2092979848384
# print(id(b)) #2092979848384 같네?
#
# a[1]=5
# print(a)
# print(b) # a를 바꿧는데 b도 바뀌어있음
#
# #is : 두 변수가 가리키는 메모리상의 대상이 동일한지 확인
# print(a is b)
#
# k=[1,5,3]
# print(id(k)) # 1342706395840
# print(id(a)) # 1342706091136
# print(k is a)# False
# print(b is k)# False
# print( a==k)# 값이 같은지만 확인, True
#
# # b를 a와 같은 값을 갖지만, 다른 주소를 가리키도록 하고싶다.
#
# # 1번째 방법 [:] 이용
# a = [1,2,3]
# b=a[:]
# print(id(a))
# print(id(b))# 주소가 다르다 !
# print(a)
# print(b)# 값은 같네
#
# # 2번째 방법 copy모듈에 있는 copy 함수 이용
# from copy import copy
# c=[1,2,3,4]
# d=copy(c)
# print(id(c))
# print(id(d))
# print(c,d)


# a=[1,2,3]
# print(a.pop())
# print(a.pop())
# print(a.pop())

# # while 조건 :       #  조건이 참을 만족하는 동안 반복하세요(거짓이 될 때까지)
#     # 문장1
#     # 문장2
#     # 문장3
#     # ...
#
# a=[1,2,3,4,5,6,7]
#
# while a: # True : a 리스트에 pop 대상 데이터가 남아 있는 경우
#     print(a.pop())
# print('반복문을 종료합니다.')

# if 문
# if [조건]:(만약 조건을 만족하면)
#     문장1
#     문장2
# else:(만족하지 않으면)
#     문장1
#     문장2

# x=5
# if x > 1:
#     print("x는 1이상.")
#     if x>=5:
#         print("x는 5이상")
#     if x==10:
#         print("10")
# print("출력")
#
# money=True
# if money:
#     print("버스")
# else:
#     print("도보")

# or, and, not : 여러 조건을 표현
# or : 또는, and:그리고,이고,이면서
# money=1000
# card=True
#
# if money >=5000 or card:
#     print("택시")
# else:
#     print("버스")

#
# money=6000
# card=True
# if not money<=5000:
#     print("택시")
# else:
#     print("버스")


# #x in 리스트(튜플,문자열)
#
# print(4 in [1,2,3])
# print(4 not in [1,2,3])
#
# print(4 in ('a' in 'a','b'))
# print('h' in 'hello')


# if 조건:
#     문장
# elif 조건:
#     문장:
# elif 조건 :
#     문장
# else:
#     문장

# money = 1000
# card = True
# if money>3000:
#     print("택시")
# elif card: # 3000원 이하의 돈을 가지고 있지만, 카드를 가지고 있다면
#     print("버스")
# else: # 3000원 이상도 없고 ,카드도 없는 경우
#     print("도보")
#

# s = 60
# if s >= 60: msg='pass'
# else:msg='fail'
# print(msg)

# s = 60
# if s >= 60:
#     msg='pass'
# else:
#     msg='fail'
# print(msg)

# # 퇴근을 5초 당겨주는 궁극의 코드
# 만약에 s가 60 이상이면 "pass"를 msg에 대입하고, 아니면 "fail"를 msg에 대입

# msg='pass' if s>= 60 else 'fail'
# print(msg)

# 반복문 : for, while

# i=0
# while i<10: # "i 변수값이 10보다 작다" 0라는 조건을 만족하는 동안, 반복하세요
#     i=i+1
#     print(i,"번째 반복 수행")


# i=0
# while True: # 무한 루프(loop)
#     i=i+1
#     print(i,"번째 반복 수행")

# i=0
# while True:
#     i=i+1
#     print(i,"번째 반복 수행")
#     if i>10:
#         break

# prompt="""
# 1.추가
# 2.삭제
# 3.종료
# 번호입력: """
# # print(prompt)
# 
# num=0
# while num != 3:
#     print(prompt)
#     num=int(input())

# a=0
# while a<10:
#     a=a+1
#     if a%2==0: continue# continue : while의 시작위치로 이동
#     print(a) #1,3,5,7,9

# while a<10:
#     a=a+1
#     if a%2==0: break# break : 반복문을 벗어나게됨
#     print(a)


# # while 문을 이용해서 1~100 사이의 자연수 중 4의 배수의 합을 출력하는 코드를 만들어라
#
# i =0
# sum=0
# while i<100:
#     i=i+1
#     if i%4==0:
#         sum=sum+i
# print(sum)


# for 문
# for 변수 in 리스트(튜플,문자열):
#     문장1
#     문장2

# mylist = [1,2,3]
# mylist = ["하나","둘","셋"]
# for i in mylist:
#     print(i)
#
#
# for i in "bigdata":
#     print(i)
#
#
# for i in [(1,2),(3,4),(5,6)]:
#     print(i)

# for i,j in [(1,2),(3,4),(5,6)]:
#     print(i)
#     print(j)
#

# for i in range(5):
#     print(i)

# for i in range(3,10,2):
#     print(i)

# a = [5,6,7,8]
# for i in range(len(a)):
#     print(i)


# # 이중 for문
# for i in range(2, 10):
#     for j in range(1, 10):
#         print(i * j,end=" ")
#     print("") # 프린트를 넣으면 무조건 줄이 바뀜
# 2 4 6 8 10 12 14 16 18
# 3 6 9 12 15 18 21 24 27
# 4 8 12 16 20 24 28 32 36
# 5 10 15 20 25 30 35 40 45
# 6 12 18 24 30 36 42 48 54 
# 7 14 21 28 35 42 49 56 63
# 8 16 24 32 40 48 56 64 72
# 9 18 27 36 45 54 63 72 81


































