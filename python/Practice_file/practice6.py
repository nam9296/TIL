'''
1. 주어진 자연수가 홀수인지 짝수인지 판별해 주는 함수(is_odd)를 작성해 보자.
'''
def is_odd(num):
    if num % 2 == 0:
        print("{0} 은(는) 짝수 입니다.".format(num))
    elif num % 2 == 1:
        print("{0} 은(는) 홀수 입니다.".format(num))
is_odd(4)
is_odd(17)

'''
2. 다음은 "test.txt"라는 파일에 "Life is too short" 문자열을 저장한 후 다시 그 파일을 읽어서 출력하는 프로그램이다.
사용자의 입력을 파일(test.txt)에 저장하는 프로그램을 작성해 보자.
(단 프로그램을 다시 실행하더라도 기존에 작성한 내용을 유지하고 새로 입력한 내용을 추가해야 한다.)
'''
with open("test.txt","w") as t:
    t.write("Life is too short\n")
with open("test.txt","r") as t:
    print(t.read())

with open("test.txt", "a") as t:
    t.write(input("작성하는 내용을 저장해드려요 :  "))

# 3번 문제를 위해서 "you need java"를 작성하자

'''
3. 다음과 같은 내용을 지닌 파일 test.txt가 있다. 이 파일의 내용 중 "java"라는 문자열을 "python"으로 바꾸어서 저장해 보자.
Life is too short
you need java
'''
with open("test.txt","r") as t:
    line=t.read()
    print(line)
with open("test.txt",'w') as t:
    t.write(line.replace('java','python'))
with open("test.txt", "r") as t:
    line = t.read()
    print(line)


'''
4. "비트코인" 문자열을 화면에 출력하는 print_coin() 함수를 정의하라.
'''
def print_coin():
    print('비트코인')


'''
5. 4에서 정의한 함수를 호출하라.
'''
print_coin()
# return 으로 함수를 끝맺지 않아서 print(print_coin()) 을 사용하면 None 이 출력됨

'''
6. 4에서 정의한 print_coin 함수를 100번호출하라.
'''
def print_coin():
    for i in range(101):
        print("{0}번째 비트코인".format(i))
        print("-"*6)
print_coin()

'''
8. 하나의 문자를 입력받아 문자열 끝에 ":D" 스마일 문자열을 이어 붙여 출력하는 print_with_smile 함수를 정의하라.
'''
def print_with_smile():
    m=str(input("하나의 문자를 입력하세요:  "))
    print(m+':D')

print_with_smile()

'''
9. 현재 가격을 입력 받아 상한가 (30%)를 출력하는 print_upper_price 함수를 정의하라.
'''
def print_upper_price(alist) :
    k = int("{0:.0f}".format(len(alist)*0.3))
    alist.sort()

    print("상위 30프로 가격은 : {0}".format(alist[-1:-k:-1]))

list_price = [100,500,300,400,200,1000,200,102,103,203,40000,20040,5520]
print_upper_price(list_price)


'''
10. 하나의 리스트를 입력받아 짝수만 화면에 출력하는 print_even 함수를 정의하라.
'''

def print_even(alist):
    for i in alist:
        if i % 2 == 0:
            print(i,end='/')
print_even(list_price)
print('\n')

'''
11. 하나의 딕셔너리를 입력받아 딕셔너리의 key 값을 화면에 출력하는 print_keys 함수를 정의하라.
'''
def print_keys(adic):
    for keys in adic.keys():
        print(keys,end='/')
dic = {'아이디':'홍길동','레벨':10,'체력':200,'마나':20,'공격력':200,'방어력':50}
print_keys(dic)
print('\n')
'''
12. 문자열과 한줄에 출력될 글자 수를 입력을 받아 한 줄에 입력된 글자 수만큼 출력하는 print_mxn(string) 함수를 작성하라.
ex) print_mxn(hello,2)
he
ll
o
'''
def print_mxn(string,n):
    n_str = int(len(string)/n)
    for i in range(n_str+1):
        print(string[i*n:i*n+n])
print_mxn("hello",2)

'''
13. 연봉을 입력받아 월급을 계산하는 calc_monthly_salary(annual_salary) 함수를 정의하라. 회사는 연봉을 12개월로 나누어 분할 지급하며, 이 때 1원 미만은 버림한다.
calc_monthly_salary(12000000)
1000000

'''
def calc_monthly_salary(annual_salary):
    month=int(annual_salary/12)
    print(month)
calc_monthly_salary(12000000)


'''
14. 문자열 하나를 입력받아 인터넷 주소를 반환하는 make_url 함수를 정의하라.
make_url("naver")
www.naver.com

'''
def make_url():
    url=str(input("하나의 문자를 입력하세요:  "))
    print("www.{0}.com".format(url))
make_url()

'''
#
# 15. 문자열을 입력받아 각 문자들로 구성된 리스트로 반환하는 make_list 함수를 정의하라.
# make_list("abcd")
# ['a', 'b', 'c', 'd']
# '''
def make_list(a):
    list_a=list(a)
    print(list_a)
make_list("abcd")

'''
16. 게임 기업 입사문제
어떤 자연수 n이 있을 때, d(n)을 n의 각 자릿수 숫자들과 n 자신을 더한 숫자라고 정의하자.

예를 들어
d(91) = 9 + 1 + 91 = 101
이 때, n을 d(n)의 제네레이터(generator)라고 한다. 위의 예에서 91은 101의 제네레이터이다.
어떤 숫자들은 하나 이상의 제네레이터를 가지고 있는데, 101의 제네레이터는 91 뿐 아니라 100도 있다. 
그런데 반대로, 제네레이터가 없는 숫자들도 있으며, 이런 숫자를 인도의 수학자 Kaprekar가 셀프 넘버(self-number)라 이름 붙였다. 
예를 들어 1,3,5,7,9,20,31 은 셀프 넘버 들이다.
1 이상이고 5000 보다 작은 모든 셀프 넘버들의 합을 구하라.
'''
# 셀프넘버가 아닌 수 리스트 만들기
not_self_list = []
for i in range(1, 5001):
    not_self_num = i + i%10 + (i%100)//10 + (i%1000)//100 + i//1000
    # print(not_self_num)
    if not_self_num not in not_self_list :
        not_self_list.append(not_self_num)
# print(not_self_list)
total_sum = 0
# 셀프넘버인 수들을의 합 구하기
for i in range(1, 5001):
    if i not in not_self_list:
        total_sum = total_sum + i

print(total_sum)

'''
17. 최대낙차

box = [7,4,2,0,0,6,0,7,0]
출력 => 최대 낙차 :7
'''

# 해결 되면 수정해서 올리겠습니다.
box=[7,4,2,0,0,6,0,7,0]

drop2=[]
for i in range(len(box)):
    drop1=[]
    for j in box[i+1:]:
        if box[i]>j:
            drop1.append(j)
    drop2.append(len(drop1))
print("최대 낙차:", max(drop2))