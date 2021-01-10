# # 파이썬 ?
# # 매우 인간적인 언어
# # 프로그래밍 (언어: 파이썬,...)-> 프로그램(application, app(앱))
# # 프로그래밍? 우리가 생각하는 것을 컴퓨터에 지시하는 행위
#
# # 1001 000100001(2진수 x) -> print('hi')
#
# print('hi')
#
# if 4 in [1, 2, 3, 4]:
#     print('4가 있어요.')
# # 기본적으로 프로그램 실행시 :ctrl+shift+f10
#
# # 리스트 : [], 튜플 : () , 딕셔너리, 셋 : {}
#
# languages = ['python', 'perl', 'c', 'java']
#
# for lang in languages:
#     if lang in ['python', 'perl']:
#         print("%6s need interpreter" % lang)
#     elif lang in ['c', 'java']:
#         print("%6s need compiler" % lang)
#     else:
#         print("should not reach here")
#
# # 유틸리티, gui, web, db, 데이터분석(파이썬에 추가적으로 패키지를 설치, 파이썬+pandas)
# # import pandas as pd
#
# print("hello, world")
# # a = 1 # assign( 할당, a에 1을 저장하세요)
# a = 1+2 # 더해라
# # print(a)
#
# # backspace key : 엔터키 위에<-
# if a == 10:
#     print('10')
# else:
#     print(a)
#
#
# # 코드블록 : 들여쓰기가 동일한 코드 집합
#
# print('코드블록 밖')
#
# # print() 내에서 숫자연산 가능
# print(5/3) # 1.6666666666666667
#
# print(6//3)  # 2
# print(6//3.0) # 2.0  실수로 나누면 실수로 몫이 나옴
# print(5//3)  # 몫만 출력 1
# print(7 % 4) # 나머지를 출력 3
# print(2 ** 3) # 거듭제곱  8
# print(int(3.3)) # 3 ,int 강제로 정수로 만들어줌
# print(int(5/2)) # 2
# print(10) # 숫자 10
# print('10') # 문자 10
# print(int('10')+2) # 문자열 10을 정수로 변환함  연산도 가능

# print(type(10)) # <class 'int'>
# print(type('하림')) # <class 'str'>
# print(divmod(9,4)) # 몫과 나머지를 나타내는 함수 /9를 4로 나눈 몫과 나머지
# #     함수(인수1,인수2)   output =>(2, 1) 몫:2 나머지:1
# res1 = divmod(9,4)
# print('결과: ',res1)  # 결과값이 튜플이며 그 안에는 2개의 요소가 있음
# print('1번째 요소 : ',res1[0]) # res1 튜플에 저장된 1번째 요소값을 출력
# print('2번째 요소 : ',res1[1])
#
# # 튜플(리스트)에서 데이터의 위치는 0번부터 시작~
#
# res2,res3 = divmod(9,4)
# print('1번째 요소 : ',res2)
# print('2번째 요소 : ',res3)
# print(0b11) # 3, 0b는 2진수를 의미함
# print(0o11) # 9 , 0o는 8진수
#
# print(5)  # 5
# print(float(5)) # 5.0 , float은 실수로 반환해주는 함수
#
# print("Kim's computer")
# print('he said."how are you"')
# print("안\t녕! \n반가워요 \n잘있어요") # \n : new line \t: teb
#
# print("naver","kakao","samsung")
# print("naver","kakao","samsung",sep='$') # sep='' 를 이용하여 구분하는 함수
#
# print("안녕")
# print("하세요")
#
# print("안녕",end='')
# print("하세요")
# # end = '' 를 이용하여 연결할 수 있음
#
# print(1+2*3)
# print((1+2)*3)
#
# # 동시에 여러가지 변수를 생성할 수 있음
# a,b,c = 1,2,3
# print(a,b,c)
#
# x,y =1,2
# x,y=y,x
# print(x,y)
# a=1
# print(a)
#
# del a
# #print(a) 에러가 나옴
#
# # 변수만 만들고 값을 저장하고 싶지 않을 때
# b=None # 사과바구니도 없음
# print(b)
# b='' # 사과바구니에 사과가 하나도없음
#
#
# x=10
# x=x+10 # x+=10 과 같은표현 이거 좀더 빠름
# print(x)

#input() # 입력을 받은 뒤 엔터 키를 누르면 다음 문장으로 이동
# x = input("출력하고 싶은 값을 입력해주세요! :")
# print("당신이 입력한 값은 : ", x)

# x = input("첫 번째 수 입력 : :")
# y = input("두 번째 수 입력 : :")
# print("덧샘 결과는 :  ", x+y)
# input으로 입력받은 수는 문자열(string)으로 나타남

# x = input("첫 번째 수 입력 : :")
# y = input("두 번째 수 입력 : :")
# print("덧샘 결과는 :  ", int(x)+int(y))

# x = int(input("첫 번째 수 입력 : :"))
# y = int(input("두 번째 수 입력 : :"))
# print("덧샘 결과는 :  ", x+y)

# x = float(input("첫 번째 수 입력 : :"))
# y = float(input("두 번째 수 입력 : :"))
# print("덧샘 결과는 :  ", x+y)


# a,b =input("두 수를 입력하세요:  ").split()
# print(a,b)

# print("안 녕 하 세 요".split())

'''
숫자 두개 입력 : 1 2 엔터
# 3
x,y =input("숫자 두 개 입력:  ").split()
print(int(x)+int(y))
'''

# x1,x2 = map(int,['3','4'])
# print(x1+x2)
#print(input("숫자 두 개 입력:  ").split())



#x1, x2 = map( int, input("숫자 두 개 입력:  ").split())
#print(x1+x2)
# "1 2" -> ['1','2'] -> [1,2] -> x1=1, x2=2
# 입력문자를 , 로 구별하려면 split(',') 하면 된다.
# x1, x2 = map( int, input("숫자 두 개 입력:  ").split(','))
# print(x1+x2)


# x = 'hello'
#
# x = """
# 인생을
# 짧다
# 그래서 파이썬이
# 필요하다
# """
# print(x)

# a = "python"
# print(a*3) # a 변수의 값을 3번 반복

# print("="*50)
# print("일기장")
# print("="*50)
#
# x = "life is too short"
# print(len(x))
# print(x[0]) # 인덱싱 , 순서는 0 부터 n-1까지
#
# # 인덱싱 : 변수에 저장된 문자열에 대해 위치를 지정하여 참조하는 행위
# print(x[-1]) # -기호는 뒤에서 부터 참조
# print(x[5:7])
# print(x[12:])
# print(x[:4])

# x= "pithon"
# x=x[:1] +'y'+x[2:]
# print(x)
# x = 5
# print("I eat %d eggs" % x) # 문자열 포멧팅, %d(decimal)

# x = 'two'
# print("I eat %s eggs" % x) # 문자열 포멧팅, %s(string)

# x = 'ten'
# d = 3
# per = 30
# print("I eat %s eggs. So I was sick for %d days. %d%%" % (x,d,per))

# 포멧팅 문자
# %f(float)
# %d(decimal)
# %s(string)
# price = "5,969,782,550"
# price1 = int(price)
