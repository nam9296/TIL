'''
1. 임의의 두 수를 입력 받은 후 최소공배수/최대공약수 출력

'''
# def GC_Divisor(a,b):
#     X=min(a,b)
#     for i in range(X+1,1,-1):
#         if a%i==0 and b%i==0:
#             res=i
#             break
#         return res
#
# print(GC_Divisor(5,3))

'''
2.
 1~1000에서 각 숫자의 개수 구하기

예로 10 ~ 15 까지의 각 숫자의 개수를 구해보자

10 = 1, 0
11 = 1, 1
12 = 1, 2
13 = 1, 3
14 = 1, 4
15 = 1, 5

그러므로 이 경우의 답은 0:1개, 1:7개, 2:1개, 3:1개, 4:1개, 5:1개
'''

alist = []
for i in range(1, 1001):
    alist += list(str(i))

for j in range(10):
    print("%s : " % j, alist.count(str(j)))



'''
3.
시저 암호는, 고대 로마의 황제 줄리어스 시저가 만들어 낸 암호인데, 
예를 들어 알파벳 A를 입력했을 때, 그 알파벳의 n개 뒤에 오는
(여기서는 예를 들 때 3으로 지정하였다)알파벳이 출력되는 것이다. 
예를 들어 바꾸려는 단어가 'CAT"고, n을 5로 지정하였을 때 "HFY"가 되는 것이다.

어떠한 암호를 만들 문장과 n을 입력했을 때 암호를 만들어 출력하는 프로그램을 
작성해라.
'''

def Caesar(sen,num):
    result = ''
    alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    for i in sen:
        idx = alpha.find(i)
        idx += num
        result += alpha[idx]
    print(result)
Caesar('CAT',5)