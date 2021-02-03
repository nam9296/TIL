'''
1. 숫자 및 문자열 분리 (파이썬)
문자와 숫자가 섞인 문자열을 입력받은 후, 숫자와 문자를 분리하시오.
input:
"c910m6ia 1ho"

output:
str : cma ho
int : 91061

'''
text = "c910m6ia 1ho"

def Separate(text):
    strings = ''
    integer = ''

    for i in text:
        if i.isdigit():
            integer += i #
        else:
            strings += i
    print('str : {} \nint : {}'.format(strings, integer))

Separate(text)

'''
2. 가위바위보(파이썬)
사용자 입력과 random함수를 사용하여, 사용자와 컴퓨터가 대결하는 가위 바위 보 게임을 만들어보자.

입력: [문자열] "가위", "바위" 혹은 "보" 출력: [문자열] 결과 반환
'''

import random
def RSP():
    a=input("가위 바위 보 !:  ")
    b = ['가위', '바위', '보']
    computer = random.choice(b)

    if a == computer:
        print("비겼습니다! 다시 한번 !")
        return RSP()

    elif a != computer:
        if (a=="가위" and computer =='바위') or (a=="바위" and computer == '보') or (a=="보" and computer=="가위"):
            print("컴퓨터가 이겼습니다! 다시 한번 !")
            return RSP()
        else:
            print("당신이 이겼습니다 !")

RSP()

'''
3.로또(파이썬)
랜덤으로 1부터 45 까지의 무작위로 섞인 6개의 숫자를 당첨 번호로 생성해 저장한 뒤
로또를 몇 개 살지 입력받고 입력된 번호의 수에 따라 렌덤으로 뽑힌 번호를 당첨 번호와 비교한다.
만약 당첨이 되면 당첨된 번호와 당첨금을 출력해주자

#1회차
예시 : 로또를 몇개 구매하시겠습니까? : 5
현재 당첨번호는 43,2,35,16,4,6입니다.

구매하신 추첨번호는 43,2,41,18,19,21 입니다.
구매하신 추첨번호는 28,20,1,4,32,5 
구매하신 추첨번호는 11,4,35,2,43,16 2등입니다
...



1 등 : 6개 일치(10억원)
2 등 : 5개 일치(2백만원)
3 등 : 4개 일치(5만원)
4 등 : 3개 일치(5천원)
'''



def lotto(alist):
    import numpy as np  # 중복을 제거하기위해서 numpy 사용
    lucky_num = []  # 당첨번호
    for i in range(6):
        num = np.random.randint(1, 46)
        lucky_num.append(num)
    #print(lucky_num)

    num = 0
    for j in alist:
        if j in lucky_num:
            num += 1
    #print(num)

    if num == 3:
        print("3개의 수를 맞추셨습니다, 4등이므로 5000원 당첨되셨어요 !")
    elif num == 4:
        print("4개의 수를 맞추셨습니다, 3등이므로 50000원 당첨되셨어요 !")
    elif num == 5:
        print("5개의 수를 맞추셨습니다, 2등이므로 2백만원 당첨되셨어요 !")
    elif num == 6:
        print("이게 무슨일이야! 축하합니다 1등 당첨 되셨어요 !! 상금은 10억원 입니다.")
    else: # num<3 일때
        print("아쉽게도 {}개의 수를 맞춰서 상금 혜택이 없네요, 다음에 또 이용하세요 !".format(num))

rottery=[43,2,41,18,19,21]
lotto(rottery)


