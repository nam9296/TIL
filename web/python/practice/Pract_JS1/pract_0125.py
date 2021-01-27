'''
1. (파이썬)
구글 전화면접 문제
n개의 정수를 가진 배열이 있다. 이 배열은 양의정수와 음의 정수를 모두 가지고 있다. 이제 당신은 이 배열을 좀 특별한 방법으로 정렬해야 한다.
정렬이 되고 난 후, 음의 정수는 앞쪽에 양의정수는 뒷쪽에 있어야 한다. 또한 양의정수와 음의정수의 순서에는 변함이 없어야 한다.

예. -1 1 3 -2 2 ans: -1 -2 1 3 2.
'''

# int_list = list(map(int,input("수를 입력하세요    : ").split()))
#
# neg_pos_list = list(x for x in int_list if x < 0 ) + list(x for x in int_list if x >= 0)
# print(neg_pos_list)


'''
2. (파이썬)
A씨는 게시판 프로그램을 작성하고 있다.
A씨는 게시물의 총 건수와 한 페이지에 보여줄 게시물수를 입력으로 주었을 때 총 페이지수를 리턴하는 프로그램이 필요하다고 한다.
입력 : 총건수(m), 한페이지에 보여줄 게시물수(n) (단 n은 1보다 크거나 같다. n >= 1)
출력 : 총페이지수

A씨가 필요한 프로그램을 작성하시오.
예) 프로그램 수행 시 다음과 같은 결과값이 나와야 함.

m	n	출력
0	1	0
1	1	1
2	1	2
1	10	1
10	10	1
11	10	2
'''
m,n = map(int,input("총 건수와 게시물 수를 입력하세요").split())
x, y = divmod(m,n)
print(x,y)
if y > 0:
    x += 1
print("m={0}  n={1}  출력={2}".format(m,n,x))

'''
3. (파이썬)
아래 조건에 따라 리스트를 회전하는 프로그램을 작성하시오.

조건
입력값은 한 행의 문자열로 주어지며, 각 값은 공백으로 구분된다.
첫 번째 값은 리스트를 회전하는 양과 방향(음수의 경우 좌측으로, 양수의 경우 우측으로 회전)이다.
첫 번째 값을 제외한 나머지 값은 리스트의 각 항목의 값이다.
회전된 리스트를 문자열로 출력한다.
구현에 이용할 자료구조에 대한 조건이나 제약은 없다.
입력되는 리스트의 항목의 개수는 유한한다.

입출력예
예 1)
입력: 1 10 20 30 40 50
출력: 50 10 20 30 40

예 2)
입력: 4 가 나 다 라 마 바 사              
출력: 라 마 바 사 가 나 다

예 3)
입력: -2 A B C D E F G                     
출력: C D E F G A B

예 4)
입력: 0 똘기 떵이 호치 새초미
출력: 똘기 떵이 호치 새초미
'''
# def spin_list(alist):
#     a=''
#     alist = alist.split(" ")
#     num = int(alist.pop(0))
#     if num > 0:
#         a = -1
#     else :
#         a = 1
#     num = abs(num) % len(alist)*a
#     print(' '.join(alist[num:] + alist[:num]))
#
# spin_list('-1 가 나 다 라 마 바 사 ')