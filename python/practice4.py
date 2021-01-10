'''
1. a 리스트에서 중복 숫자를 제거해 보자.
a = [1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 5]
'''
a = [1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 5]
a1 = set(a)
a2 = list(a1)
print(a2)

'''
2. while문을 사용해 1부터 1000까지의 자연수 중 3의 배수이면서 7의 배수인
수의 합을 구해 보자.

'''
i = 0
sum = 0
while i < 1000:
    i = i + 1
    if i % 3 == 0 and i % 7 == 0:
        sum = sum + i

print(sum)

'''
3. while문을 사용하여 다음과 같이 별(*)을 표시하는 프로그램을 작성해 보자.
1)
*
**
***
****
*****

2)
     *
    **
   ***
  ****
 *****
3)adv
     *
    ***
   *****
  *******
 *********
'''
#1)
i = 0
while True:
    i += 1
    if i > 5: break
    print("*" * i)

# 선생님의 답 for문으로 풀 수 있다.
# i=0
# for i in ragne(5):
#     for j in range():
#         print(" ")
#     for k in range():
#         print("*")
#2)
i = 0
while True:
    i += 1
    if i > 5: break
    print('{:>5}'.format("*"*i))
# 선생님의 답

#3)

i = -1
while True:
    i += 2
    if i < 9: break
    print('{:^10}'.format("*"*i))

# 선생님의 답
i=0
while i <5:
    i=i+1
    print('{:^10}'.format('*'*(i*2-1)))

'''
4.
for문을 사용해 1부터 100까지의 숫자를 출력해 보자.
'''
for i in range(101):
    print(i)

'''
4-1.(adv)
for문을 사용해 2부터 100까지의 숫자 중에서 소수를(prime number) 출력해 보자.
*소수란? 1과 자기 자신으로만 나누어 떨어지는 수(ex. 2, 3, 5, 7, 11, 13,...)
'''
for i in range(2,101):
    prime = True
    for j in range(2,i):
        if i % j ==0:
            prime = False
            break
    if prime:
        print(i,end=" ")

# 선생님 답
for num in range(2,101):
    for i in range(2,num+1):
        if num == i:
            print(num,end=' ')
        elif num % i == 0:
            break


'''
5.
A 학급에 총 10명의 학생이 있다. 이 학생들의 중간고사 점수는 다음과 같다.
[70, 60, 55, 75, 95, 90, 80, 80, 85, 100]
for문을 사용하여 A 학급의 평균 점수를 구해 보자.
'''
class_num = [70, 60, 55, 75, 95, 90, 80, 80, 85, 100]

class_total = 0
for i in class_num:
    class_total += i
mean = class_total / len(class_num)
print(mean)

'''
6. 로또 당첨 번호 제작(adv)
*주의:중복된 수 나오면 안됨
이번 주 로또 당첨 번호 :  3 7 13 22 25 29
'''
import random
num_lotto =set()

for i in range(7):
    num_lotto.add(random.randint(1,46) )
list_lotto = list(num_lotto)
list_lotto.sort()
print(list_lotto)


'''
7. 자판기(pro, 커피 한 잔에 300원이라 가정, 초기 커피는 10개)
돈을 넣어 주세요: 500
거스름돈 200를 주고 커피를 줍니다.
돈을 넣어 주세요: 300
커피를 줍니다.
돈을 넣어 주세요: 100
돈을 다시 돌려주고 커피를 주지 않습니다.
남은 커피의 양은 8개입니다.
돈을 넣어 주세요: 0
종료합니다

'''
coffee =10

while True:
    money= int(input("돈을 넣어주세요. :  "))

    if money > 300:
        print("거스름돈 %d를 주고 커피를 줍니다." % (money-300))
        coffee = coffee - 1
    elif money == 300:
        print("커피를 줍니다.")
        coffee = coffee - 1
    elif money >0 and money<300:
        print("돈을 다시 돌려주고 커피를 주지 않습니다.")
        print("남은 커피의 양은 %d개입니다." %coffee)
    elif money ==0:
        print("종료합니다")
        break