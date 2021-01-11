'''
1. daum 입사문제
1차원의 점들이 주어졌을 때, 그 중 가장 거리가 짧은 것의 쌍을 출력하는 함수를 작성하시오.
(단 점들의 배열은 모두 정렬되어있다고 가정한다.)
예를들어 S={1, 3, 4, 8, 13, 17, 20} 이 주어졌다면, 결과값은 (3, 4)가 될 것이다.

'''
S={1, 3, 4, 8, 13, 17, 20}

def short_point(aset):
    alist=list(aset)
    distance = [abs(a - b) for a, b in zip(alist, alist[1:])]
    dis_idx = distance.index(min(distance))
    return alist[dis_idx], alist[dis_idx + 1]

print(short_point(S))


# 선생님 답
# 풀이해주신건 자료가 list형식이었다.
number_list=[1, 3, 4, 8, 13, 17, 20]
def find_shortest(number_list):
    result = 0
    min_val = max(number_list)-min(number_list)
    for i in range(len(number_list)-1):
        val=number_list[i+1] - number_list[i]
        if min_val > val:
            min_val=val
            result = i
    return print(number_list[result],number_list[result+1])
find_shortest(number_list)

'''
2.
회문(palindrome)? 순서를 거꾸로 해서 읽어도 제대로 읽을때와 같은 단어 or 문장
rotator, sos, abba (nurses run)
문제: 임의의 단어(문장)을 입력받아 회문 여부를 출력 => True or False 출력

'''
# 회문 : 유전자 염기서열 분석
# n-gram: 언어패턴
word = ("nurses run")
def palindrome(word):
    word1= list(word.replace(" ",""))
    #print(word1)
    reverse= word1[::-1]
    #print(reverse)
    if word1 == reverse:
        print(True)
    elif word1 != reverse:
        print(False)

palindrome(word)

# 선생님 답
w = input("단어 입력 :  ")
isPalindrome = True # 회문여부, 초기값은 true
w=w.replace(" ","")
for i in range(len(w)//2):
    if w[i] != w[-1-i]: # 왼쪽 문자와 오른쪽 문자가 다른경우
        isPalindrome = False
        break
print(isPalindrome)




w = input("단어 입력 :  ")
print(w==w[::-1])
print(w)
print(w[::-1])


# reversed를 이용하고 list로 묶어주면 역순의 리스트를 만들어냄
w = input("단어 입력 :  ")
print(list(reversed(w)))

w = 'level'
print(w)
print(''.join(reversed(w)))

print(w==''.join(reversed(w)))


