# [a-zA-Z] : 모든 알파벳을 의미
# [1-9] :모든 숫자를 의미
# [^0-9] : [not 0-9]

# 소문자와 대문자는 서로 상반되는 의미
# \d : 숫자 ([0-9]) 와 같음
# \D : not \d를 의미 , [^1-9]와 같음

# \s : 공백문자, 탭문자, 엔터문자 등
# \S : not \s , 공백문자, 탭문자, 엔터문자가 아님

# \w : 문자 + 숫자를 [의미, [a-zA-Z0-9] 와 같음
# \w : not \w , 문자 + 숫자가 아님, [^a-zA-Z0-9] 와 같음


# ?또는 .  : 문자가 1개만 있는지 판단하고자 할 때
# ? 는 문자가 0개 또는 1개인지 판단하는 기호 = (0,1) = 최소 0개 이상 최대 1개
# . 은 문자가 1개 인지를 판단하는 기호
# ab?c => ab가 있어도 없어도 됨 +c
import re
# print(re.match('h?' ,'h')) # match='h'
# print(re.match('h?','he'))
# print(re.match('h?','his'))
# print(re.match('ab?c','abc')) # match='abc'
# print(re.match('ab?c','ac'))# match='ac'
# print(re.match('ab?c','abbc')) # None
# print(re.match('ab*?c','abbc')) # match='abbc'


# print(re.match('h.','hello'))  #match='he'
# print(re.match('a.b','aab')) #match='aab'
# print(re.match('a.b','a0b')) #match='a0b'
# print(re.match('a.b','ab')) # None 사이에 무조건 문자하나이상 있어야함
# print(re.match('a.b','abb')) #match='abb'

# print(re.match('a.b','abb'))
# print(re.match('a[.]b','abb')) # None
#
# print(re.match("[123]","3"))
# print(re.match("[123]","32")) # match='3'
# print(re.match("[123]+","32321")) # match='32321'
# print(re.match("[123]+","32321"))
# print(re.match("[123]+","3235217")) # match='323'

# print(re.match("[1-7]+","3235217")) # match='3235217'
# print(re.match("\d+","3235217")) # match='3235217'
# 
# print(re.match("[1]+","111222"))# match='111'
# 
# print(re.match('a.b','abb')) # . 은 문자 1개
# print(re.match('a[.]b','abb')) # [.]은 특수문자(마침표) .
# print(re.match('a[.^#$]b','a#b')) # match='a#b'


'''
빅데이터파일
abc.txt        [a-zA-Z0-9]+[.]+[a-zA-Z]+
abc.exe
abc.cfg
...
sadklif 잘못된 파일명 
잘못된 파일명을 걸러줄줄 알아야함'''




# fn = "abc.txt"
# res=print(re.match('[a-zA-Z0-9]+[.]+[a-zA-Z]+',fn))
# if res:
#     print("정상적인 파일명")
# else:
#     print("잘못된 파일명")


# print(re.match("do*g","dg")) #  match='dg' o가 0번 이상
# print(re.match("do*g","dog"))
# print(re.match("do*g","doooooooog"))
# print(re.match("do*g","doooooooookg")) # None
#
# print(re.match("do+g","dg")) #None
# print(re.match("do+g","dog"))
# print(re.match("do+g","doooooooog"))
# print(re.match("do+g","doooooooookg")) # None
#

# 반복 :
# {최대,최소} : 최소 횟수 이상, 최대 횟수 이하 반복
# {최소, } : 최소 횟수 이상 반복
# {, 최대} : 최대 횟수 이하 반복

# print(re.match("do{2}g","dog")) # None # o 문자가 반드시 2번 반복
# print(re.match("do{2}g","doog"))
# print(re.match("do{2}g","doooooooooooog")) # None
#
#
# print(re.match("do{2,5}g","dog")) # None # o 문자가 반드시 2번 이상 5번 이하 반복
# print(re.match("do{2,5}g","doog"))
# print(re.match("do{2,5}g","doooooooooooooog")) # None # 5번 초과함
# print(re.match("do{2,5}g","dooooog")) # match
#
# print(re.match("do{2,}g","dog")) # 두번 이상 나와야함
# print(re.match("do{2,}g","doooooooooooooog")) # match
# print(re.match("do{,2}g","dog")) # match
# print(re.match("do{,2}g","dooog"))# None

# 휴대폰 전화번호
# 3자리-4자리-4자리
# 010-1234-5678 정상 전화번호
# 010-1234-567 비정상 전화번호
# abc-1234-5678 비정상 전화번호
# 01c-1234-5678 비정상 전화번호
# 010-12345-5678 비정상 전화번호
# 010-1234-567k 비정상 전화번호
# 01012345678 비정상 전화번호

# print(re.match("\d{3}[-]\d{4}[-]\d{4}","010-1234-5678"))
# print(re.match("[0-9]{3}[-][0-9]{4}[-][0-9]{4}", "010-1234-5678"))

# # match : 첫 문자열부터 , search : 문자열 전체
# # findall , finditer // findall이 더 많이쓰임
#
# # findall : 정규식과 매치되는 모든 문자열을 리스트로 리턴
# # finditer : 정규식과 매치되는 모든 문자열을 반복 가능한 객체(iterable)형태로 리턴
#
# print(re.match("[a-z]+","python"))
# # 밑과 같은 문장임
# pat = re.compile("[a-z]+") # 정의한 패턴을 pat에 저장
# res=pat.match("python")# match 함수열을 이용하여 문자열이 패턴에 맞는지 확인
# print(res)
#
# print(re.match("[a-z]+","7python"))
# print(re.search("[a-z]+","7python8java9cpp"))
# # search 결과는 1개의 매치 객체가 리턴
# print(re.findall("[a-z]+","7python8java9cpp"))
# #['python', 'java', 'cpp']
#
# pat =re.compile("[a-z]+")
# res=pat.findall("7python8java9cpp")
# print(res) # ['python', 'java', 'cpp']




# res = re.finditer("[a-z]+","7python8java9cpp") # 반복 가능한 객체로 리턴
# for i in res:
#     print(i)
#     print(i.start()) # 매치된 위치의 시작지점
#     print(i.end()) # 매치된 위치의 끝지점
#     print(i.group()) # 매치된 문자열
#     print(i.span()) # 매치 시작, 끝 위치
'''
<re.Match object; span=(1, 7), match='python'>
1
7
python
(1, 7)
<re.Match object; span=(8, 12), match='java'>
8
12
java
(8, 12)
<re.Match object; span=(13, 16), match='cpp'>
13
16
cpp
(13, 16)
'''


# # . : 점(.) 메타문자는 모든 문자 1개와 매치. 예외(줄바꿈 문자 : \n)
# print(re.match("a.b","a0b"))
# print(re.match("a.b","a\nb")) # None
#
# # DOTALL \n 문자도 포함하겠다.
# pat=re.compile("a.b", re.DOTALL)
# print(pat.match("a\nb"))
# # <re.Match object; span=(0, 3), match='a\nb'>
#
# pat =re.compile("[a-z]")
# print(pat.match("python"))
# print(pat.match("Python")) # None
# #pat =re.compile("[a-zA-Z]")
# print(pat.match("PYTHON"))
#
# pat =re.compile("[a-z]", re.I) # I : Ignorecase : 대소문자 무시
# print(pat.match("python"))
# print(pat.match("Python"))
# print(pat.match("PYTHON"))



'''
문자열에서"\section" 을 찾고싶다
print(re.search("\section","kldfkljdsfklds \section klskds"))
# 패턴 : \s 는 엔터, 공백, 텝 등 문자
\ 문자가 문자열 자체임을 나타내기 위해서 역슬래쉬 2개를 입력해줘야 한다.

'''


# print(re.search("\section","kldfkljdsfklds \section klskds"))
# # None
# print(re.search(r"\\section","kldfkljdsfklds \section klskds"))
# # r"\\section" => \section
#
#
# print(re.match("ab[0-9]?c","abc"))
# print(re.match("ab[0-9]?c","ab9c"))
# print(re.match("ab.c","ab9c"))
#
# print(re.match("h{3}","hhhiii"))
#
#
# # () 를 이용해서 group 화 시킬 수 있다.
# # hi가 세번 반복되는지
# print(re.match("hi{3}","hihihihelloworld")) # h뒤에 i가 세번오냐는뜻
# print(re.match("(hi){3}","hihihihelloworld")) # 이게 맞는표현
# print(re.match("(hi){3,5}","hihihihelloworld")) # 이게 맞는표현
#
# print(re.match("[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}","02-1234-5689")) # 이게 맞는표현
#
# print(re.match("[ㄱ-ㅎ]+","ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅎㅎㅎ"))
# print(re.match("[ㄱ-ㅎ가-힣]+","ㅋㅋㅋㅋ캬캬캬ㅋㅋㅋㅎㅎㅎ"))
# print(re.search("[^ㄱ-ㅎ가-힣]+","ㅋㅋsdfㅋㅋ캬캬캬ㅋㅋ234ㅋㅎㅎ^*$ㅎ"))
# print(re.fildall("[ㄱ-ㅎ가-힣]+","ㅋㅋsdfㅋㅋ캬캬캬ㅋㅋ234ㅋㅎㅎ^*$ㅎ"))
#
#
# print(re.fildall("[^ㄱ-ㅎ가-힣]","문자열"))  # 한글을 제외한 모든 문자를 추출

news="""
(서울=연합뉴스) 신선미 기자 = 국내 신종 코로나바이러스 감염증(코로나19) '3차 대유행'이 완만한 감소세로 접어든 가운데 이번 주 신규 확진자 발생 추이가 주목된다.

신규 확진자 감소세 지속이냐 재확산이냐의 흐름을 가늠해 볼 수 있기 때문이다.

지난달 말까지만 해도 연일 1천명 안팎으로 발생하던 신규 확진자는 새해 들어 600명대로 줄었다가 11일 400명대 중반까지 더 떨어진 뒤 12일에는 500명대로 소폭 증가한 상태다.

큰 틀의 통계만 보면 확실한 감소 내지 안정국면으로 접어드는 것 아니냐는 관측이 나온다.

하지만 신규 확진자가 400명∼500명대까지 낮아진 데는 주말과 휴일 검사건수 감소 영향도 있어 아직 상황을 낙관하기에는 이르다는 게 감염병 전문가들의 공통된 의견이다.

방역당국 역시 긴장의 끈을 풀기에는 위험 요인이 너무 많다며 국민 개개인의 지속적인 방역 협조를 당부하고 있다.
# """
print(re.findall("[ㄱ-ㅎ가-힣]+",news))
#
print(re.findall("[0-9]+",news))
#
# print(re.findall("[ㄱ-ㅎ가-힣]+[0-9]+",news))
#
# print(re.findall("[0-9]+[ㄱ-ㅎ가-힣]+",news))
#
print(re.findall("[0-9]+[명]+",news))
#
#
#
# print(re.match("[^A-Z]+","Hello"))
# print(re.match("[^A-Z]+","hello"))
# print(re.search("[^A-Z]+","Hello"))
# print(re.match("[0-9]+","hello119"))
# print(re.search("[0-9]+$","hello119"))

# print(re.search("[*]","3*5")) # * 문자가 있는지 판단
# #print(re.search("*","3*5")) #ERROR
# 
# 
# print(re.search("\*","3*5"))
# print(re.search("\*+","3*****5"))


# print(re.search("\$\([a-z]+\)","$(document)"))
#
# print(re.search("[$()a-z]+","$(document)"))



# # "abcabcabc ok" 문자열이 있을 때
# # abc가 있는지 조사하라
# print(re.search("abc","abcabcabc ok"))
# print(re.search("(abc)+","abcabcabc ok")) # abc가 여러번 반복되는지
#
s = "abc"

print(re.search("\w+\s+\d+[-]\d+[-]\d+","kim 010-1234-1234"))
#
# res=re.search("\w+\s+\d+[-]\d+[-]\d+","kim 010-1234-1234")
# # print(res.group().split()[0])

# # ()를 엮는 순서대로 group이 매겨짐
# res=re.search("(\w+)\s+(\d+)[-]\d+[-]\d+","kim 010-1234-1234")
# print(res)
# print(res.group(0))
# print(res.group(1))
# print(res.group(2))
#
# # 그룹 이름을 부여할 수 있다.
# res=re.search("(?P<name>\w+)\s+(?P<num>\d+[-]\d+[-]\d+)","kim 010-1234-1234")
# # 작성 방법 : (?P<그룹명>...)
# print(res.group('name'))
# print(res.group('num'))


# print(re.findall("hello|hi","hello how are you bye hi hi"))




































