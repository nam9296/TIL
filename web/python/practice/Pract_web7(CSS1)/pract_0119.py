'''
1.
A씨는 두 개의 버전을 비교하는 프로그램을 작성해야 한다.

버전은 다음처럼 "." 으로 구분된 문자열이다.

버전 예) 1.0.0, 1.0.23, 1.1

두 개의 버전을 비교하는 프로그램을 작성하시오.

다음은 버전 비교의 예이다.

0.0.2 > 0.0.1
1.0.10 > 1.0.3
1.2.0 > 1.1.99
1.1 > 1.0.1

'''
def Compare_Ver(a,b):
    verson1 = map(int, a.split('.'))
    verson2 = map(int, b.split('.'))

    for (x, y) in zip(verson1, verson2):
        if x > y:
            print("{0} > {1}".format(a,b))
            break
        elif x < y:
            print("{0} > {1}".format(b,a))
            break


Compare_Ver('0.0.2','0.0.1')
Compare_Ver('1.0.10 ','1.0.3')
Compare_Ver('1.2.0 ','1.1.99')

'''
2.
약 2,000년 전에는 전쟁에서 병사들이 적들에 의해 동굴에 갇히게 되는 경우가 종종 있었다고 한다.
그들은 포로가 되는것을 방지하기 위해 동그랗게 서서 마지막 한 사람이 남을 때 까지 순서대로 돌아가며 세번째에 해당되는 사람을 죽여 나갔다고 한다.
마지막으로 남게되는 사람은 자살하기로 약속되어 있었지만 보통 적들에게 항복을 하는 경우가 많았다고 한다.
여러분이 풀어야 할 문제는 총 인원수(N)와 간격(K)이 주어졌을 때 가장 마지막에 살아남는 병사의 위치(the safe position)를 알아내는 것이다.
예를 들어 병사수가 총 10명이고 돌아가며 세번째에 해당되는 병사를 제거하는 경우는 다음과 같다:
N = 10, K = 3
위의 경우 다음과 같은 순서로 병사들이 제거된다. (괄호는 제거되는 병사를 의미한다)
1st round: 1 2 (3) 4 5 (6) 7 8 (9) 10
2nd round:                            1 (2) 4 5 (7) 8 10
3rd round:                                                (1) 4 5 (8) 10
4th round:                                                               4 (5) 10
5th round:                                                                        4 (10)
위 예에서 끝가지 살아남는 병사는 4, 즉 4번째 병사이다.
입력 데이터는 총 병사수 N과 간격 K이다.
출력 데이터는 마지막까지 살아남는 병사의 위치이다.
(단, 최초 시작은 1번 병사부터이다.)
입출력 예는 다음과 같다:

initial data:
10 3

answer:
4
'''
#요세푸스 순열
def Killing_Order(n,k):
    number=[i for i in range(1,n+1)]
    count = (k-1)
    while len(number) >1:
        del number[count]
        count = (count+k-1)%len(number)
    return number[0]
print(Killing_Order(10,3))


'''
3.
텍스트가 입력으로 주어질 때, 단어의 개수를 세는 프로그램을 작성한다.
"문자 세기"와 "단어 세기"는 프로그래밍 입문에 성공했는지를 가늠하는 문제라고 할 수 있습니다.

입력
아래 내용을 가진 텍스트파일을 미리 만들어 두고, 프로그램을 실행하면 파일 내용을 읽어들인다(출처: Wikipedia).
As the country became embroiled in a domestic crisis, the first government was dislodged and succeeded by several different administrations. Bolikango served as Deputy Prime Minister in one of the new governments before a partial state of stability was reestablished in 1961. He mediated between warring factions in the Congo and briefly served once again as Deputy Prime Minister in 1962 before returning to the parliamentary opposition. After Joseph-Desire Mobutu took power in 1965, Bolikango became a minister in his government. Mobutu soon dismissed him but appointed him to the political bureau of the Mouvement Populaire de la Revolution. Bolikango left the bureau in 1970. He left Parliament in 1975 and died seven years later. His grandson created the Jean Bolikango Foundation in his memory to promote social progress. The President of the Congo posthumously awarded Bolikango a medal in 2005 for his long career in public service.

출력
구분자(Separator)는 마침표 '.', 쉼표 ',', 공백 ' ' 이다.
가장 많이 나온 순서대로 단어 10개와 그 단어의 빈도를 출력한다.
빈도가 같은 단어들 사이의 순서는 무시한다.

in 12
the 10
Bolikango 5
a 4
of 4
and 3
to 3
his 3
became 2
government 2
'''



with open('Wikipedia.txt','r',encoding='UTF8') as f:
    text = f.read()
text = text.replace(",", " ").replace(".", " ").split()
text = list(set([(i, text.count(i)) for i in text]))
text.sort(key=lambda x: x[1], reverse=True)
for i in range(10):
    print(*text[i])

