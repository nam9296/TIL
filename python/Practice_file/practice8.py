'''
1. 문자열 바꾸기
다음과 같은 문자열이 있다.
a:b:c:d
문자열의 split와 join 함수를 사용하여 위 문자열을 다음과 같이 고치시오.
a#b#c#d
'''
string='a:b:c:d'
string_1=string.split(':')
print('#'.join(list(string_1)))

'''
2. 리스트 평균 구하기
다음은 A학급 학생의 점수를 나타내는 리스트이다. 다음 리스트에서 60점 이상 점수의 평균을 구하시오.

A = [20, 55, 67, 82, 45, 33, 90, 87, 100, 25]
'''
A = [20, 55, 67, 82, 45, 33, 90, 87, 100, 25]
B =[]
C=0
for i in A:
    if i >= 60:
        B.append(i)
# print(B)
for j in B:
    C+=j
print(C / len(B))

'''
3. 평균값 구하기
다음과 같이 총 10줄로 이루어진 sample.txt 파일이 있다. sample.txt 파일의 숫자 값을 모두 읽어 총합과 평균 값을 구한 후 평균 값을 result.txt 파일에 쓰는 프로그램을 작성하시오.

70
60
55
75
95
90
80
80
85
100
'''
lines='''70
60
55
75
95
90
80
80
85
100'''
with open("sample.txt","w") as f:
    f.writelines(lines)

total = 0
line=lines.replace('\n',' ')
v=list(line.split(' '))
print(v)
for i in v:
    total += int(i)
average= total/len(v)
print(average)
with open("result.txt","w") as f:
    f.write(str(average))


'''
4. 모스 부호 해독
문자열 형식으로 입력받은 모스 부호(dot:. dash:-)를 해독하여 영어 문장으로 출력하는 프로그램을 작성하시오.

글자와 글자 사이는 공백 1개, 단어와 단어 사이는 공백 2개로 구분한다.
예를 들어 다음 모스 부호는 "HE SLEEPS EARLY"로 해석해야 한다.
.... .  ... .-.. . . .--. ...  . .- .-. .-.. -.--
모스부호 규칙 표

문자	부호	문자	부호
A	.-	 N	-.
B	-... O	---
C	-.-. P	.--.
D	-..	 Q	--.-
E	.	 R	.-.
F	..-. S	...
G	--.	 T	-
H	.... U	..-
I	..	 V	...-
J	.--- W	.--
K	-.-	 X	-..-
L	.-.. Y	-.--
M	--	 Z	--..
'''


mos ='.... .  ... .-.. . . .--. ...  . .- .-. .-.. -.--'
mos_dic ={
    '.-':'A','-...':'B','-.-.':'C','-..':'D','.':'E','..-.':'F',
    '--.':'G','....':'H','..':'I','.---':'J','-.-':'K','.-..':'L',
    '--':'M','-.':'N','---':'O','.--.':'P','--.-':'Q','.-.':'R',
    '...':'S','-':'T','..-':'U','...-':'V','.--':'W','-..-':'X',
    '-.--':'Y','--..':'Z'
}
def transMos(mos):
    result=[]
    mos_sep=mos.split("  ")
    for word in mos_sep:
        word=word.split(" ")
        for words in word:
            result.append(mos_dic[words])
        result.append(" ")
    print("".join(result))


transMos(mos)


'''
5. ngram 기반 두 문장 유사도 구하기(n=2, 3)
"오늘 멀티캠퍼스에서 너무 쉬운 프로그래밍을 공부했다."
"멀티캠퍼스에서 공부했던 오늘의 프로그래밍은 너무 쉬웠다."
'''
text1 = "오늘 멀티캠퍼스에서 너무 쉬운 프로그래밍을 공부했다"
text2 = "멀티캠퍼스에서 공부했던 오늘의 프로그래밍은 너무 쉬웠다"



def N_gram(text,n):
    result = []
    text=text.replace(" ", "")
    for a in range(len(text) - n + 1):
        result.append(text[a : a + n])
    return result

#print(N_gram(text1,2))
# print(N_gram(text1,3))
#print(N_gram(text2,2))
# print(N_gram(text2,3))

def percent_text(text1,text2,n):
    count = 0
    r=[]
    nText1=N_gram(text1,n)
    nText2=N_gram(text2,n)
    for i in nText1:
        for j in nText2:
            if i ==j:
                count += 1
                r.append(i)

    similary = count / len(nText1) * 100
    print("첫번째 문장과의 유사도는 {0}% 입니다.".format(similary))
percent_text(text1,text2,2)
percent_text(text1,text2,3)




