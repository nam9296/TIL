# '''
# 1.숫자를 입력받으면 그에해당하는 자릿수를 출력하는 코드를 작성하라.
# 입력 : 156 출력 : 100의자리수
# 입력 : 18961 출력 : 10000의자릿수
# '''
# num=len(input("숫자를 입력하세요    :"))
# print("{}의 자리수".format(10**(num-1)))
#
# '''
# 2.
# 리스트에 있는 숫자들의 중앙값을 구하는 프로그램을 만들어라.
#
# [7, 9, 14] = 9
# [24, 31, 35, 49] = 33
# [17, 37, 37, 47, 57] = 37
#
# 중앙값 : 자료를 작은 값에서부터 크기순으로 나열할 때 중앙에 위치한 값
# ① 자료의 개수가 홀수이면 가운데 위치한 값이 중앙값이다.
# ② 자료의 개수가 짝수이면 가운데 위치한 두 값의 평균이 중앙값이다.
# '''
#
# alist=[24, 31, 35, 49]
# alist.sort()
# if len(alist)%2==1:
#     print(alist[(len(alist)//2)])
# elif len(alist)%2 ==0 :
#     print((alist[int(len(alist)/2)]+alist[int(len(alist)/2)-1])/2)



# 선생님의 답


import statistics
test = [17, 37, 37, 47, 57]
print(statistics.median(test))
'''
3.
아래와 같은 결과를 출력하는 function을 구현하라

bool OneEditApart(string s1, string s2)

OneEditApart("cat", "dog") = false
OneEditApart("cat", "cats") = true 
OneEditApart("cat", "cut") = true 
OneEditApart("cat", "cast") = true 
OneEditApart("cat", "at") = true
OneEditApart("cat", "acts") = false 
한개의 문자를 삽입, 제거, 변환을 했을때 s1, s2가 동일한지를 판별하는 OneEditApart 함수를 작성하시오.
'''


# def OneEditApart(s1,s2):
#     count=0
#     if abs(len(s1)-len(s2))>1:
#         print("False")
#     for i in range(min(len(s1),len(s2))):
#         if s1[i] != s2[i] and s1[-i] != s2[-i]:
#             count+=1
#     if count<2:
#         print("True")
#     else:
#         print("False")
# OneEditApart("cat", "dog")
# OneEditApart("cat", "cats")
# OneEditApart("cat", "cut")
# OneEditApart("cat", "cast")
# OneEditApart("cat", "at")
# OneEditApart("cat", "acts")


''' 
4.
2018년 카카오 신입 공채 1차 코딩 테스트 문제입니다.

네오는 평소 프로도가 비상금을 숨겨놓는 장소를 알려줄 비밀지도를 손에 넣었다. 그런데 이 비밀지도는 숫자로 암호화되어 있어 위치를 확인하기 위해서는 암호를 해독해야 한다. 다행히 지도 암호를 해독할 방법을 적어놓은 메모도 함께 발견했다.

지도는 한 변의 길이가 n인 정사각형 배열 형태로, 각 칸은 “공백”(“ “) 또는 “벽”(“#”) 두 종류로 이루어져 있다.
전체 지도는 두 장의 지도를 겹쳐서 얻을 수 있다. 각각 “지도 1”과 “지도 2”라고 하자. 지도 1 또는 지도 2 중 어느 하나라도 벽인 부분은 전체 지도에서도 벽이다. 지도 1과 지도 2에서 모두 공백인 부분은 전체 지도에서도 공백이다.
“지도 1”과 “지도 2”는 각각 정수 배열로 암호화되어 있다.
암호화된 배열은 지도의 각 가로줄에서 벽 부분을 1, 공백 부분을 0으로 부호화했을 때 얻어지는 이진수에 해당하는 값의 배열이다.


네오가 프로도의 비상금을 손에 넣을 수 있도록, 비밀지도의 암호를 해독하는 작업을 도와줄 프로그램을 작성하라.

입력 형식

입력으로 지도의 한 변 크기 n 과 2개의 정수 배열 arr1, arr2가 들어온다.

1 ≦ n ≦ 16
arr1, arr2는 길이 n인 정수 배열로 주어진다.
정수 배열의 각 원소 x를 이진수로 변환했을 때의 길이는 n 이하이다. 즉, 0 ≦ x ≦ 2^n - 1을 만족한다.
출력 형식

원래의 비밀지도를 해독하여 "#", 공백으로 구성된 문자열 배열로 출력하라.

입출력 예제

매개변수	값
n	5
arr1	[9, 20, 28, 18, 11]
arr2	[30, 1, 21, 17, 28]
출력	["#####","# # #", "### #", "#  ##", "#####"]
매개변수	값
n	6
arr1	[46, 33, 33 ,22, 31, 50]
arr2	[27 ,56, 19, 14, 14, 10]
출력	["######", "###  #", "##  ##", " #### ", " #####", "### # "]
'''

