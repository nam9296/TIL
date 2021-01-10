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

'''
2.
회문(palindrome)? 순서를 거꾸로 해서 읽어도 제대로 읽을때와 같은 단어 or 문장
rotator, sos, abba (nurses run)
문제: 임의의 단어(문장)을 입력받아 회문 여부를 출력 => True or False 출력

'''
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

