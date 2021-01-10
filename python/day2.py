'''
3. 문자열에서 '파' 만 출력하세요.
s = "파이썬파이썬파이썬"
'''
# s = "파이썬파이썬파이썬"
# print(s[0]+s[3]+s[6])
# print(s[::3])
# offset : 몇 칸을 건너뛸것인지 양수(좌->우), 음수(우->좌)

# tel ="010-1234-5678"
# 데이터수집- > 전처리 -> 분석 -> ...
# replace : 문자(열) 치환
# ctrl + space bar : 함수들을 보이게 함 
#
# print(tel.replace("-",""))
#


'''
input : print(1,2,3)   콤마로 입력되면  띄어쓰기로 나눔
output : 1 2 3

input : print(1,2,3, sep="&")  
output : 1&2&3
'''

# 불(bool) 연산자
# print(3>2)  # True
# print(2 == 2) # True
# print(3 == 2) # False
# print(3!=2) # != means not equal
# a=1
# b=1
# print(a == b) # ==는 두 값이 같은지를 비교
# print(a is b) # is는 두 객체( 주소가 동일)를 비교
#
# print(1 == 1.0) # True # 정수와 실수라는 점에서 차이, 값은 같습니다.
# print(1 is 1.0) # False# 두 객체가 같은지 비교
# print(a is 1.0) # False
# 홍길동 나이 == 임꺽정 나이 Ture 일 때
# 홍길동 is 임꺽정 False

# 논리 연산자 : and(모두 참일때 True), or(하나 이상이 참일때 Ture), not(참은 False, 거짓은 True)
# 0: False, 1: True
# print(bool(1)) # True
# print(bool(0)) # False
# print(bool('test')) # True 문자열도 True이다.
# print(bool('')) # False

# print( bool(0 or 'test'))
# print( bool(0 and 'test'))

#정렬
# print("hi")
# print("                  hi")
# print("hi                  ")
#
# print("%10s"  % "hi")
# print("%-10s"  % "hi")
# print("hello %10s"  % "hi")
# print("%-10shello "  % "hi")

# print("%.4f" % 3.141592) # 3.1416
# # 소수점 이하 5째 자리에서 반올림 - > 4째 자리까지 표현
# print("%10.4f" % 3.141592) # 앞 10 자리를 확보한다음 출력(우측 맞춤)
#

# s = "two"
# num = 3
# day = "three"
# print("I eat %d apples" %num)
# print("I eat %s apples" %s)
#
# # .format 을 많이 이용함
# print("I eat {0} apples".format(num))
# print("I eat {0} apples".format(s))
#
# print("I ate {0} eggs. So I was sick for {1} days.".format(num,day))

# print("I ate {num} eggs. So I was sick for {day} days.".format(num=5,day=3))
# print("I ate {0} eggs. So I was sick for {day} days.".format(5,day=3))
#
#
# print("{0}".format("hi"))
# print("{0:<10}".format("hi"))# 10자리 확보 후 왼쪽 정렬
# print("{0:>10}".format("hi"))# 10자리 확보 후 오른쪽 정렬
# print("{0:^10}".format("hi"))# 10자리 확보 후 가운데 정렬
# print("{0:-^10}".format("hi"))# ----hi----
#
# print("{0}".format(3.141592)) # 3.141592
# print("{0:.4f}".format(3.141592)) # 3.1416
# print("{0:10.4f}".format(3.141592)) #     3.1416

# ## count() : 갯수를 반환해주는 함수
# a='hello'
# print(a.count('l')) # 2 l이 두개 있습니다.
#
# ## find() : 위치를 알려주는 함수
# print(a.find('l'))
# #중복일 경우 제일 먼저나오는 위치를 알려줌
# print(a.find('x')) # 없는 경우에는 -1을 출력
#
# print(a.index('l'))
# # 없는 경우에는 에러코드 반환

# # join() : 문자열을 삽입할 때 사용하는 함수
# print(",".join("abcd"))
# print(",".join(['a','b','c','d']))
# # 리스트에 저장되어 있는 각각의 문자들이 컴마와 결합하여 하나의 문자열이 됨
# print("".join(['a','b','c','d']))

# ## upper(): 대문자로 변환, lower() : 소문자로 변환
#
# b= 'hi'
# print(b.upper())
# print(b.lower())

## strip(), rstrip(), lstrip()
# n1 = "    대한민국"
# n2 = "대한민국     "
# n3 = "    대한민국    "
# print(n1.lstrip())
# print(n2.rstrip())
# print(n3.strip())

# s = "Life is too short"
# print(s.replace('Life','Your leg'))
# print(s.split()) # 공백문자로 분리
#
# 문자 바꾸기
#str.maketrans('바꿀문자', '새문자') 변환테이플(t) 생성
#'apple'.translate(t) -> apple을 t를 이용해서 바꾸세요
t= str.maketrans('aeiou','12345')
print('apple'.translate(t))


# 정규표현식 : 문자열 전처리
#
# str = ", python,."
# print(type(str))
# print(str.lstrip(","))#  python,.
# print(str.lstrip(" "))# , python,.
# print(str.lstrip(" ,")) # python,.
# print(str.lstrip(", ")) # python,.
#따옴표 안에 제거할 문자를 순서상관없이 넣을 수 있다.
#
# print(str.rstrip(",. ")) #, python
# print(str.strip(",. "))  # python

# import string
# print(string.punctuation)
# # punctuation(구두점) : !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
#
# print(str.strip("!#$%&'()*+,-./:;<=>?@[\]^_`{|}~"))
# print(str.strip(string.punctuation))
#
# print('python'.ljust(10)) # 10자리 확보 후 좌측 정렬
# print('python'.rjust(10)) # 10자리 확보 후 우측 정렬
# print('python'.center(10)) # 10자리 확보 후 가운데 정렬

# # 메서드(함수) 체이닝(chaining) -> 코드가 간결해짐
# print('python'.rjust(10))
# s='python'.rjust(10)
# print(s.upper())
# # 한줄로 표현 가능
# print('python'.rjust(10).upper())
#
# # 패딩(padding) : 특정 값으로 빈 자리를 채우는 행위
# print("hello".zfill(10))
#
# print("apple pineapple".find('p'))
# print("apple pineapple".find('pp'))
#
# print("apple pineapple".rfind('p'))
# print("apple pineapple".rfind('pp'))
#
# # 리스트 ?
# x=[10,20,30]
# print(x)
# print(x[0])
#
# y = ['life','is','too','short']
# print(y[2])
#
# z = [1,2,3,'life','is','too','short']
# print(z[4])
#
# a = [1,2,['life','is',['too','short']]]
# print(a[2])
# print(a[2][2][0])
#
# b = [] # 빈 리스트 생성
# b = list() # 빈 리스트 생성
#
# b = [1,2,3]
# print(b[0]+b[2])

# a = [1,2,['life','is',['too','short']]]
# print(a[2])
# print(a[-1])
# print(a[-1][-1][-2])

# # 리스트 slicing
# x=[10,20,30,40,50]
# print(x[1:4])
#
# s="abcdefg"
# print(s[2:5])

# a= [1,2,3,['x','y','z'],4,5]
#
# print(a[3][:2])

# print(list(range(5)))
# print(list(range(3,5)))
# print(list(range(3,5,2)))
# print(list(range(10,0,-1)))


# # 리스트 연산(+,*)
# a=[1,2]
# b=[3,4]
# print(a+b)
# print("ab","cd")
# print(a*3)
# print("ab"*3)
# print(len(a))
#
# print(str(a[0])+"hi") # 정수 + 문자 가 안되므로 정수를 string으로 바꿔준다.

#
# # 리스트 요소 값 변경
# a =[1,2,3]
# a[2] = 4
# print(a)
#
# # 리스트 요소 값 삭제
# del a[2]
# print(a)
#
# a=list(range(1,10))
# print(a)
# del a[:5]
# print(a)

# a = [1,2,3]
# print(a)

# a.append(4) # a + [4] 와 같음
# print(a)
# a.append([5,6,7])#[1, 2, 3, 4, [5, 6, 7]]
# print(a)
# a.extend([5,6,7])#[1, 2, 3, 4, 5, 6, 7]
# print(a)
# b=[1,2,3]
# b=b+[4,5] #[1, 2, 3, 4, 5] # b+=[4,5]
# print(b)

# # sort() (정렬) : 오름차순으로 데이터를 나열
# a = [3,7,5,1]
# a.sort()
# #print(a.sort()) # None
# print(a)

# a = ['b','k','e']
# a.sort()
# print(a)


a = [3,7,5,1] # 내림차순으로 데이터를 정렬
a.sort()
a.reverse()
print(a)
#
# a = ['b','k','e']
# a.sort()
# a.reverse()
# print(a)

# # insert() : 리스트의 특정위치에 데이터 추가
# a = [7,8,9]
# # 7과 8사이에 4를 추가하고싶다.
# a.insert(1,4)
# print(a)

# # 리스트의 요소를 제거 : del, remove, pop
# # del : 특정 위치에 저장된 값을 제거
# a = [10,20,30,10,20,30]
# del a[1]
# print(a)
# # remove : 특정 값을 제거
# a = [10,20,30,10,20,30]
# a.remove(30)# 첫 번째 30만 제거됨
# print(a)
#
# # pop : 제일 마지막 요소를 삭제
# a = [10,20,30]
# a.pop()
# print(a)

# # 다르게 활용가능
# a = [10,20,30]
# s = a.pop()
# print(a,s)