'''
1. a = [1, 3, 5, 7, 9, 0, 2, 4, 6, 8]
# 앞쪽 절반을 출력해 보세요.
# 뒤쪽 절반을 출력해 보세요.
# 거꾸로 출력해 보세요.
# 거꾸로 짝수 번째만 출력해 보세요.
# 거꾸로 홀수 번째만 출력해 보세요.
'''
a = [1, 3, 5, 7, 9, 0, 2, 4, 6, 8]
print(a[:5])
print(a[5:])
print(a[::-1])
print(a[-2::-2])
print(a[::-2])

'''
피보나치 수열 구하기
13
피보나치 수열이란, 첫 번째 항의 값이 0이고 두 번째 항의 값이 1일 때, 이후의 항들은 이전의 두 항을 더한 값으로 이루어지는 수열을 말한다.

예) 0, 1, 1, 2, 3, 5, 8, 13

인풋을 정수 n으로 받았을때, n 이하까지의 피보나치 수열을 출력하는 프로그램을 작성하세요

'''

n = int(input("원하는 숫자를 입력하시오. : "))
alist = [0, 1]
while n >= (alist[-1] + alist[-2]):
    alist.append(alist[-1] + alist[-2])
print("입력한 수 이하의 피보나치수열은",alist)


'''
문자열 압축하기
문자열을 입력받아서, 같은 문자가 연속적으로 반복되는 경우에 그 반복 횟수를 표시하여 문자열을 압축하기.

입력 예시: aaabbcccccca

출력 예시: a3b2c6a1
'''

msg=str(input("문자를 입력하세요. : "))
word = msg[0] + "1"
count =1
for i in range(1,len(msg)):
    if msg[i] == msg[i-1]:
        count+=1
        word = word[:-1] +str(count)
    else:
        count=1
        word = word + msg[i] + "1"
print(word)

'''
4. 
10~1000까지 각 숫자 분해하여 곱하기의 전체 합 구하기
14
예로, 10~15까지의 각 숫자 분해하여 곱하기의 전체 합은 다음과 같다.

10 = 1 * 0 = 0
11 = 1 * 1 = 1
12 = 1 * 2 = 2
13 = 1 * 3 = 3
14 = 1 * 4 = 4
15 = 1 * 5 = 5

그러므로, 이 경우의 답은 0+1+2+3+4+5 = 15'''

def mul_num(lastnum):
    sum=0

    for i in range(10,lastnum+1):
        one = 1
        for j in str(i):
            one*=int(j)
        sum+=one
    print(sum)
mul_num(15)
mul_num(1000)

'''
5.
애니팡
타일판은 5 × 5
타일 종류는 1 ~ 4의 네 가지
가로나 세로로 3개 이상 같은 타일이 연속될 경우 펑! 사라지고, 그 자리에는 위쪽의 타일들이 내려와서 메꿉니다.
내려오면서 비게 된 자리는 0으로 채워집니다.
위의 규칙대로 동작하는 프로그램을 작성해주세요.

입력 형식
아래 예와 같은 5 × 5 숫자 배열을 리스트에 저장한 뒤 문제 해결하세요

2 4 1 2 1
3 4 2 3 3
2 4 1 2 2
4 4 4 1 2
4 2 3 3 2

출력형식
같은 타일들을 모두 처리한 후의 최종 5 × 5 숫자 배열

0 0 0 0 0
2 0 0 0 0
3 0 0 0 0
2 0 0 2 0
4 0 1 3 0

'''


# any_matrix=[[2, 4, 1, 2, 1],[3, 4, 2, 3, 3],[2, 4, 1, 2, 2],[4, 4, 4, 1, 2],[4, 2, 3, 3, 2]]
# print(any_matrix)
# print(type(any_matrix))