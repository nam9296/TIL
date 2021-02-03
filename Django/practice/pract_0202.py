'''
1.
초기 투자액과 투자 기간, 그리고 투자 기간 중 날짜별 가치 변동율이 주어질 때 순이익과 이익 여부를 구합니다.

입력
첫째 줄에 투자액이 정수로 주어집니다. 두번째 줄에 투자기간이 정수로 주어집니다.
세번째 줄에 투자기간 중 일별 전일 대비 가치 변동이 각각 퍼센트 단위의 정수로 주어집니다.

투자액은 100 이상 10000 이하의 정수입니다.
투자 기간은 1 이상 10 이하의 정수입니다.
일별 변동폭은 -100 이상 100 이하의 정수로 주어집니다.
출력
첫째 줄에 순이익을 소수점 첫째자리에서 반올림한 값으로 나타냅니다.
두번째 줄에 이익인지 손해인지 여부를 good, same, bad로 나타냅니다.
이익이면 good, 손해이면 bad, 첫째줄에서 출력한 순이익이 0이면 same울 출력합니다.

예시
입력 예시
10000
4
10 -10 5 -5

출력 예시
-125
bad
'''
a = """
10000
4
10 -10 5 -5
"""

a = a.split()
amount = int(a[0])
period = int(a[1])
fluc = [int(i) for i in a[2:]]


p = amount
for i in range(period):
    p = p*(1+(fluc[i]*1/100))
n_profit = round(p-amount)

if n_profit > 0:
    print(n_profit, "good", sep="\n")
elif n_profit == 0:
    print(n_profit, "same", sep="\n")
else :
    print(n_profit, "bad", sep="\n")

"""
-125
bad
"""



'''
#2. 골드바흐의 추측

1) prime_number 함수: n까지의 소수를 구함 
    - num_list : 조금이라도 수고를? 줄이기 위해 3부터 시작하는 홀수 리스트를 만들고, 그 리스트에 2를 추가함
       (n이 2 이상의 정수(짝수)라고 했으므로 2 이후의 소수는 입력 해놓는 것은 불필요)
    - for 문: 
        - p : 3 ~ num_list 요소 i 까지 숫자로 나누어 떨어지면 p = False & break
        - p == True이면 p_list에 추가
   - p_list 리턴

2) goldbach 함수
   - for 문:
       - i : p_list 처음부터 , j : p_list 마지막부터 시작
       - i+j == n 이면 res 리스트에 추가
       - i == j 이면 그 이상 비교하면 중복된 쌍이 나오므로 break
       - res 리턴'''
def prime_number(n):
    num_list = list(range(3,n+1,2))
    p_list=[2]
    for i in num_list:
        p = True
        for j in range(3,i):
            if i%j == 0:
                p = False
                break
        if p == True:
            p_list.append(i)
    return p_list

def goldbach(n):
    p_list = prime_number(n)
    res = []
    for i in p_list:
        for j in p_list[::-1]:
            if i+j == n:
                res.append([i,j])
            if i==j:
                break
    print(res)

goldbach(26)    # [[3, 23], [7, 19], [13, 13]]
goldbach(48)    # [[5, 43], [7, 41], [11, 37], [17, 31], [19, 29]]

# 3번 배열 형태 바꾸기

arr1 = ['a1','a2','a3','a4','b1','b2','b3','b4']
arr2 = sorted(arr1, key=lambda x:x[1])
print(arr2) # ['a1', 'b1', 'a2', 'b2', 'a3', 'b3', 'a4', 'b4']