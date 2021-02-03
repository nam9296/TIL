'''
1.

리스트에 있는 숫자들의 최빈값을 구하는 프로그램을 만들어라.

[12, 17, 19, 17, 23] = 17
[26, 37, 26, 37, 91] = 26, 37
[28, 30, 32, 34, 144] = 없다

최빈값 : 자료의 값 중에서 가장 많이 나타난 값
① 자료의 값이 모두 같거나 모두 다르면 최빈값은 없다.
② 자료의 값이 모두 다를 때, 도수가 가장 큰 값이 1개 이상 있으면 그 값은 모두 최빈값이다.

'''
# mylist = [26, 37, 26, 37, 91]
#
# eval_list= [mylist.count(i) for i in mylist]
#
# print(eval_list)
# res = []
# if max(eval_list) == 1:
#     print("없다")
# else:
#     for j in range(len(eval_list)):
#         if eval_list[j] == max(eval_list):
#             res.append(mylist[j])
#
# for item in set(res):
#     print(item, end = ",")

def frequency(numlist):
    numcount = [numlist.count(item) for item in numlist]
    res = []
    if max(numcount) == 1:
        print("없다")
    else:
        for i in range(len(numcount)):
            if numcount[i] == max(numcount):
                res.append(numlist[i])
    for item in set(res):
        print(item, end=" ")

frequency([12, 17, 19, 17, 23])
frequency([26, 37, 26, 37, 91])
frequency([28, 30, 32, 34, 144])

from collections import Counter

def modeList(nums):
    c=Counter(nums)
    desc=c.most_common()
    max=desc[0][1]
    ans=[]
    for i in desc:
        if i[1]==max:
            ans.append(i[0])
    if ans==nums:
        return "없다"
    return ans

'''
2.
약수를 모두 찾는 수학 문제를 풀다가 지친 X는 컴퓨터의 도움을 받아 문제를 풀어 보기로 하였다. 하지만 계산기를 이용하자니 계산기로 하고 싶지만 찾기도 어려우며, 쉽게 찾아낼 수도 없었다.

풀이에 지친 그는 결국 약수들이 가지고 있는 특징을 찾아 결국 몇시간에 걸쳐 복잡한 수라도 약수를 찾아줄 수 있고 개수도 알려주는 프로그램을 짜게 된다.

다음은 약수를 얻기 위한 입력과 출력 예제들이다.

입력 1

24
출력 1

{ 1, 2, 3, 4, 6, 8, 12, 24}
약수의 개수는 8개 입니다.
입력 2

36
출력 2

{ 1, 2, 3, 4, 6, 9, 12, 18, 36 }
약수의 개수는 9개 입니다.
입력 3

2468013579
출력 3

{ 1, 3, 9, 61, 183, 549, 4495471, 13486413, 40459239, 274223731, 822671193, 2468013579 }
약수의 개수는 12개 입니다.
사용한 소스코드를 풀이에 넣어 입력과 출력이 나왔음을 보이고,
소스코드를 디버깅하여 123456789를 입력해 출력된 결과를 '{ a, b, ... } / 약수의 개수는 ~개 입니다' 형식으로 하시오.
'''

def division(num):
    numlist = []
    for x in range(1, num + 1):
        if num % x == 0:
            numlist.append(x)
    print(numlist)
    print("약수의 개수는 %d개 입니다." %(len(numlist)))

division(24)
division(36)
#division(2468013579)

def divisor(n):
    ans=[]
    for i in range(1,n+1):
        if n%i==0:
            ans.append(i)
    print("입력 :",n,"\n출력 :",set(ans),"\n약수의 개수는",len(ans),"개 입니다.")

'''
3. 당신은 A 인터넷 카페 운영자이다.

당신의 인터넷 카페에는 휴대폰 번호 게시가 금지되어 있다.

하지만 일부 회원들이 편법을 동원하여 휴대폰 번호를 게시 후 불법 거래를 시도한다.

이를 체크하여 자동 삭제를 할 수 있도록 휴대폰 번호 검사 알고리즘을 작성하시오.

(011~019 는 10자리여도 휴대폰 번호이다. 010은 11자리여야만 한다.)

Input

영일영-구구칠8-일구팔사
0일영.칠칠칠팔.이삼사
영 일 칠 삼 칠 오 팔 이 팔 이
영일일 34구구 4 오 9 이
Output

01099781984 true
0107778234 false
0173758282 true
01134994592 true
'''
import re
def numCheck(string):
    string = re.sub(r'[\W\.-]+', '', string)
    num = {'영':0, '일':1, '이':2, '삼':3, '사':4, '오':5, '육':6,'칠':7, '팔':8, '구':9}
    for x in string:
        for y, z in num.items():
            if y == x:
                string = string.replace(x, str(z))
    if string.startswith('010') == True:
        match = re.match("^010([\d]{8})", string)
        if match == None:
            match = False
        else:
            match = True
    else:
        match1 = re.match("^01([\d]{8})", string)
        if match1 == None:
            match = False
        else:
            match = True

    return string, match
print(numCheck('영일영-구구칠8-일구팔사'))
print(numCheck('0일영.칠칠칠팔.이삼사'))
print(numCheck("영 일 칠 삼 칠 오 팔 이 팔 이"))
print(numCheck("01134994592"))




def num_change(num):
    import re
    ko_tel = re.sub("[-. ]+", "", num)
    t = str.maketrans("영일이삼사오육칠팔구", "0123456789")
    num_tel =ko_tel.translate(t)
    while re.match("^01[1-9][\d]{7,8}|^010[\d]{8}",num_tel):
        print(num_tel,"true")
        break
    else:
        print(num_tel,"false")
num_change("영일영-구구칠8-일구팔사")


'''
4. 카프리카 수
카프리카 수란 인도의 수학자 D.R.카프리카의 의해 정의한 수이다.

어떤 수의 제곱수를 두 부분으로 나누어 더하였을 때 다시 원래의 수가 되는 수들을 의미한다.

예를 들어 45는 카프리카 수인데, 45² = 2025이고, 20+25 = 45이기 때문이다.

어떤 수를 입력 받고 그 수가 카프리카 수인지 아닌지를 출력하는 함수를 만드시오.

어떤 수를 입력 받고 자릿수가 그 수인 모든 카프리카 수를 출력하시오.

어떤 수를 입력 받고 어떤 수 이하의 모든 카프리카 수를 출력하시오.

이 셋중에서 원하는 유형 하나를 골라 푸시오.

입력 (유형 1)

print(kaprekar_number(1))
print(kaprekar_number(45))
print(kaprekar_number(297))
print(kaprekar_number(3213))
출력 (유형 1)

True
True
True
False
카프리카 상수
카프리카 상수도 마찬가지로 인도의 수학자 카프리카가 발견한 상수이다.

이 상수의 생성법은 다음과 같다.

숫자 하나로만 이루어지지 않은 4자리 수를 정한다. (예: 1000은 인정하되, 1111은 인정하지 않는다.)
첫 자리에 0이 와도 무방하다.
이 숫자를 크기 순으로 배열하여 두 수를 만든다. 하나는 큰 순, 하나는 작은 순으로 배열한다.
큰 쪽에서 작은 쪽을 빼 준다. 이때 나온 0은 유지한다.
이 과정을 반복하면 7번 이내로 6174가 나온다.
어떤 수를 입력 받고 몇번이내로 6174가 완성 되었는지 출력하는 함수를 입력하시오

단, 입력값은 정수여야 한다.

입력

print(kaprekar_constant(4371))
print(kaprekar_constant(21))
print(kaprekar_constant(1))
print(kaprekar_constant(1111))
출력

7
3
False
False
'''
def kaprekar_number(num):
    square = num ** 2
    square = str(square)
    if len(square) == 1:
        print('false')
    else:
        num1 = square[len(square) // 2:]
        num2 = square[:len(square) // 2]
        total = int(num1) + int(num2)
        if num == total:
            print('true')
        else:
            print('false')

kaprekar_number(1)
kaprekar_number(45)
kaprekar_number(297)
kaprekar_number(3213)




# 4-1. 카프리카 수 검사
#
# -1,2,3은 제곱이 한자리수. 더해도 그대로면 참
#
# -나머지는 반잘라서 더한다.

def is_kaprekar():
    n=input("수 입력:")
    num=str(int(n)**2)
    if len(num)<2:
        if num==n:
            print("true")
        else: print("false")
    elif int(num[:len(num)//2])+int(num[len(num)//2:])==int(n):
        print("true")
    else:
        print("false")
is_kaprekar()
# 4-2. 카프리카 상수
#
# -숫자 하나로만 된 수 빼기
#
# -4자리수 만들고
#
# -내림차순 빼기 오름차순
#
# -연산횟수 세기

def k_constant():
    num=input("숫자 입력:")
    if len(set(num))==1 and len(num)==4:
        return "숫자 하나로만 이루어진 수"
    cnt=0
    while num!=6174:
        num=str(num).zfill(4)
        asc=''.join(sorted(num))
        desc=''.join(sorted(num,reverse=True))
        num=int(desc)-int(asc)
        cnt+=1
    return cnt
k_constant()