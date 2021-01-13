# # 정규 표현식
# # 복잡한 문자열 처리에 유용함(퇴근시간을 대폭 단축)
#
# jumin="""
# park 850101-1234567
# kim 950202-2345678
# """
# # print(jumin)
#
# # jumin 데이터의 뒷부분을 모두 *로 변환하여 출력
# # park 850101-*******
# # kim 950202-*******
#
# for line in jumin.split("\n"):
#     for word in line.split(" "):
#         if len(word)==14 and word[:6].isdigit() and word[7:].isdigit():
#             word =word[:7]+"*"*7
#             print(word)
#
# # 정규포현식을 이용해서 코딩
# jumin="""
# park 850101-1234567
# kim 950202-2345678
# """
# import re # regular expression (정규 표현식 모듈)
# # re.compile() : 정규식 작성
# p =re.compile("(\d{6})[-]\d{7}") # \d(digit) {숫자6자리}[-]\d{숫자7자리}
# print(p.sub("\g<1>-*******",jumin))
#
# # 정상적인 주민번호에 대한 일반적인 규칙을 정의(숫자 6자리 - 숫자 7자리)


# # re.match("패턴","문자열") # 문자열이 패턴에 부합되나요 ?
# # "hello, world" 문자열에 hello라는 문자열이 있는지 판단
# print(re.match("hello","hello, world" ))
# # 출력(매치됨) : <re.Match object; span=(0, 5), match='hello'>
# print(re.match("hi","hello, world" ))
# # 출력(매치안됨) : None
#
# if re.match("hello","hello, world" ): # None은 거짓
#     print("주어진 hello, world 문자열은 hello문자열 패턴에 매치가 됐습니다.")
# else:
#     print("주어진 hello, world 문자열에 패턴이 매치되지 않았습니다.")
#
# print("hello, world".find("hello")) # 0

# 특정 문자열이 맨앞/끝 오는지 판단?
# 문자열 맨 앞에 ^를 붙이면 맨 앞에 오는지 판단할 수 있다.
# 문자열 맨 끝에 $를 붙히면 맨 끝에 오는지 판단할 수 있다.

import re
# print(re.search("^hello","hello, world")) # hello로 시작하는지 확인
# # <re.Match object; span=(0, 5), match='hello'>
# print(re.search("world$","hello, world")) # world로 끝나는지 확인
# # <re.Match object; span=(7, 12), match='world'>
#
# # hello 또는  world 문자열이 포함되어 있는지 확인
# print(re.match("hello|world","hello"))
# # <re.Match object; span=(0, 5), match='hello'>
# print(re.match("hi|world","hello"))
# # None

# 정규표현식 메타문자 (메타:정보의 정보, 데이터의 데이터,...)
# 데이터(전화번호부)의 데이터(색인)
# 메타문자 종류 : ( ) { } [ ] \ | ? + * $ ^ ...
"""
[] 메타문자 : 대괄호 안에는 어떤 문자도 올 수 있음
ex) [abcdef] 의미 ? a,b,...,f중에서 어떤 한 개의 문자와 매치
'a' 문자는 정규표현식에 매치됨
"""
"""
print(re.match("[abcdef]","a"))
# <re.Match object; span=(0, 1), match='a'>
print(re.match("[abcdef]","g"))
# None
print(re.match("[abcdef]","abc"))
# <re.Match object; span=(0, 1), match='a'>
# a가 매치됬으나 한개의 문자만 매치시킬 수 있으므로 a만 인식됨
print(re.match("[abcdef]","c"))
# <re.Match object; span=(0, 1), match='c'>

print(re.match("my","hello my world")) # None
print(re.match("my","my hello world")) # match
print(re.search("my","hello my world")) # match
"""
# [from-to]
# [a-d] 정규식 의미 : [abcd], [a-f]==[abcdef]
# [0-5]==[012345]

# print(re.match("[0-9]","1234")) # 1234는 0부터 9까지 숫자에 해당
# # <re.Match object; span=(0, 1), match='1'>
# print(re.match("[0-9]*","1234"))
# # *의 의미는 문자(숫자)가 0개 이상 있는지 확인
# #<re.Match object; span=(0, 4), match='1234'>
# print(re.match("[0-9]","a1234"))
# # a1234에서 a는 [0-9] 범위가 아님 None
# print(re.match("[0-9]*","a1234"))
# # <re.Match object; span=(0, 0), match=''>
# # 매치가 되지만 0개로 매칭 된 것으로 출력됨
# print(re.match("[0-9]+","1234"))
# # + 는 1개 이상 있는지 확인
# print(re.match("[0-9]+","12a34"))
# # 12만 매치가됨
#
#
#
# print(re.match("[0-9]+","a12a34"))
# # None
# print(re.match("[0-9]*","a12a34"))
# # <re.Match object; span=(0, 0), match=''>
#
# # [a-z],[A-Z],[a-zA-Z],[^0-9]: 0~9숫자를 제외한 문자
#
# print(re.search("^hi","hello, hi")) # 문자열이 hi로 시작해야함 # None
#
# print(re.search("hi","hello, hi"))
# # <re.Match object; span=(7, 9), match='hi'>
# print(re.match("hi","hello, hi")) # None 앞에서 hi로 시작해야함
#
#
# print(re.match("hello|hi|good","hi"))
# # <re.Match object; span=(0, 2), match='hi'>
# print(re.match("hello|hi|good","goodhi")) # good만 매치됨
# # <re.Match object; span=(0, 4), match='good'>
# print(re.match("hello|goodhi","goodhi")) # good만 매치됨
# # <re.Match object; span=(0, 6), match='goodhi'>
#
# print(re.match("[0-9]","12a3bcd"))
# # <re.Match object; span=(0, 1), match='1'>
# print(re.match("[0-9]*","12a3bcd"))
# # <re.Match object; span=(0, 2), match='12'>
# print(re.match("[0-9]+","12a3bcd"))
# # <re.Match object; span=(0, 2), match='12'>
#
# print(re.match("[0-9]*","a12a3bcd")) # match 숫자가 0개 이상 있는지 판단
# print(re.match("[0-9]+","a12a3bcd")) # None 숫자가 1개 이상 있는지 판단
#
#
# print(re.match("[a-z]*","12a3")) # match
# print(re.match("[a-z]+","12a3")) # None
#
# print(re.match("[a-z]*","aabb12a3")) # match='aabb'
# print(re.match("[a-z]+","aabb12a3")) # match='aabb'
#
# print(re.match("ab","abcba")) # match='ab'>
# print(re.match("ba","abcba")) # None 처음에 b가 있지 않아서

# print(re.search("ab","abcba")) # span=(0, 2), match='ab'
# print(re.search("ba","abcba")) # span=(3, 5), match='ba'
#
# print(re.match("a*","b")) # match=''
# print(re.match("b*","b")) # match='b'
#
# print(re.match("a*b","b")) # a문자가 0개 이상 있고 b가 나오면 매치
# print(re.match("a*b","bb"))
#
# print(re.match("a+b","b"))  # a문자가 1개 이상 있고 뒤에 b가 나와야함
# print(re.match("a+b","abbb"))
#
# print(re.match("a+b*","aaaabbbbbbbb"))
# print(re.match("a+b+","aaaabbbbbbbb"))
#
# print(re.match("a+cb+","aaaabbbbbbbb")) # None
# print(re.match("a+c*b+","aaaabbbbbbbb")) # match
#
# print(re.match("a+cb+","aaaacbbbbbbbb")) # match
#
# # 패턴이 문자열에 있는지만 보면 됨 (문자열이 패턴을 반드시 가지고 있어야 함)
#
#
# # 대한한한한민국 = 대한민국 으로 만들고싶다
# print(re.match("대한+민국","대한한한한민국"))

# []를 무조건 문자 하나로 보자 [a-z]+














































































