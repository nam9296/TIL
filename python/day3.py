# # 튜플, 시퀀스, 딕셔너리
#
# # 튜플 : 리스트와 거의 동일하다, but 값을 변경할 수 없다. ()를 사용
#
# t1= (1,2,3)
# print(t1)
# print(type(t1)) # <class 'tuple'>
#
# # del t1[1] 튜플은 수정할 수 없다고 에러코드가 뜸
# # t1[0]=5 에러
# print(t1[2]) # 3 인덱싱은 가능
# print(t1[1:]) # (2, 3) 슬라이싱 가능
# t2 = ('a',3,4)
# print(t1+t2) # (1, 2, 3, 'a', 3, 4)
# t3 = (5,6)
# print(t3*5) # (5, 6, 5, 6, 5, 6, 5, 6, 5, 6)
# print(len(t3)) #2

# person=('kim',20,60.5,True)
# print(person)

# t4 = (7)
# print(t4)
# print(type(t4)) # <class 'int'> 왜 튜플이 아닐까?? 단일요소면 int로 인식할 수 있음
# 
# t4 = (7,)
# print(t4)
# print(type(t4)) # <class 'tuple'>
#
# t5 = 5,8
# print(type(t5)) # <class 'tuple'>

# t6 = (1,2, (3,4))
# print(t6) # (1, 2, (3, 4))
# print(type(t6)) # <class 'tuple'>

# print(list(range(5))) # [0, 1, 2, 3, 4]
# print(tuple(range(5))) # (0, 1, 2, 3, 4)



# # 튜플을 리스트로 변환할 수 있다.
# x = tuple(range(1,10))
# print(x) # (1, 2, 3, 4, 5, 6, 7, 8, 9)
# # x에 저장된 5를 50으로 저장하고싶은 경우
# # 튜플 -> 리스트 -> 요소값 변경
# print(list(x)) # [1, 2, 3, 4, 5, 6, 7, 8, 9]
# tempx = list(x)
# print(tempx)
# tempx[5] = 50
# print(tempx)
#
# # 리스트를 튜플로 변환할 수 있다.
# y= [1,2,3]
# tempy=tuple(y)
# print(type(tempy))

# s= 'hello'
# print(list(s))  # ['h', 'e', 'l', 'l', 'o']
# # 리스트에 문자열을 주면 문자리스트가 만들어 짐
# print(tuple(s)) # ('h', 'e', 'l', 'l', 'o')
#
# a,b,c = 1,2,3
# print(a)
# print(type(a)) # <class 'int'>
#
# a,b,c = [1,2,3]
# print(a)
# print(type(a)) # <class 'int'>
#
# a,b,c = (1,2,3)
# print(a)
# print(type(a)) # <class 'int'>


# 시퀀스 자료형 : 연속적으로 저장
# 리스트, 튜플, 문자열, range, bytes, bytearray 등은 모두 다 값들이 연속적으로 저장되어 있는 시퀀스 자료형
# [1,2,3], (1,2,3), "hello", range(3)

# 시퀀스 자료형(리스트, 튜플, 문자열, range, bytes, bytearray )의 공통 기능
# 데이터 존재 유무 확인
# 작성방법 : 찾고자 하는 값 in 시퀀스객체

# # a= [0,10,20,30,...,80,90]
# a = list(range(0,91,10))
#
# # a에 30을 찾아주세요
#
# print(30 in a) # True
# print(45 in a) # False
#
# # a 에 30이 없는지 확인
# print(30 not in a) #False
# print(45 in a) # True
#
# print('hello 문자열에 h문자가 있나요 ? ','h' in 'hello')
# print(1 in range(5))
#
# # 튜플도 되는지 간단하게 확인해보자
# print("5가 있나요 ?",5 in (1,2,3,4,5)) # True
#
# print('hello 문자열에 h문자가 있나요?','h' in 'hello')

# # 시퀀스 객체 연결(range는 연결할 수없다 )
# a= [2,1]
# b= [3,4]
# print(a+b)
#
# # print(range(0,4)+range(4,6)  에러
# # range 객체들을 연결할 수 없으므로, range->list로 변경한 다음 연결하면 가능
# print(list(range(0,4))+list(range(4,6)))
# print('hi'+'hello')
#
# # 문자열 연결 : +
# # 문자열과 숫자 연결
# # print('hi'+100) # 에러발생
# # 숫자 -> 문자로 변경
# print('hi'+ str(100))

# # 시퀀스 반복(*) 단 range에서는 *연산자 사용 불가
# # 시퀀스객체 * 정수
# print([1,2,3]*5) # [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3]
# print(5*[1,2,3])

# # print(range(0,5,1)*3) # 에러
# # range객체를 튜플또는 리스트로 변경하고 * 사용가능
# print(list(range(0,5))*3)

# # len(시퀀스객체) : 시퀀스 데이터(요소) 갯수
# a = [10,20,30,40]
# print(len(a)) # 4
# b=(1,2,3,4)
# print(len(b))
# print(len(range(1,10,2)))
# print(len('hello'))

# # len 함수는 길이를 구함,
# # 파이썬 2.7 버전에서는 실제 바이트수가 나옴
# # 파이썬 3 버전부터는 글자의 수가 나옴
# s= "안녕하세요"
# print(len(s.encode('utf-8'))) # 15
# # 'utf-8' 에서는 한글 한 글자가 3byte, 3*5 = 15 바이트
# print(s.encode('utf-8')) #b'\xec\x95\x88\xeb\x85\x95\xed\x95\x98\xec\x84\xb8\xec\x9a\x94'

# # 시퀀스 객체는 대괄효[] 기호로 참조
# a = [5,6,7,8,9]
# print(a[3])
# a=(5,6,7,8,9)
# print(a[3])
# r = range(1,10,2)
# print(r[2])
# s= "hello"
# print(s[3])

# # del 시퀀스객체[인덱스] :튜플과 range, 문자열도 삭제 안됨
# b = [10,20,30,40]
# del b[1]
# print(b) #[10, 30, 40]

# # 시퀀스 슬라이싱
# a = [10,20,30,40,50]
# print(a[0:3])
# print(a[0:1])
# print(a[1:-1:])
# print(a[0:len(a)])
# print(a[:3:2])
#
# r = range(20)
# print(r[3:8])
# print(list(r[:15:3]))
#
# s= "hello python"
# print(s[:10])
# print(s[:10:2])
#
# # slice객체를 이용하여 slicing
# print(list(range(20)[slice(3,9,2)]))
# print(list(range(20)[3:9:2]))
#
# a = list(range(10))
# print(a)
# a[1:4] = ['a','b','c']
# print(a) # [0, 'a', 'b', 'c', 4, 5, 6, 7, 8, 9]
# a = list(range(10))
# a[2:7:2] = ['x','y','z']
# print(a)
# del a[2:9:2]
# print(a)
#
# # 딕셔너리{}: 키(key) = 값(value) 형식으로 표현
# # 딕셔너리는 시퀀스 객체가 아님. 데이터 참조 방법이 다름.
# # 딕셔너리 = {키:값, 키:값, ...}
# # 키는 변하지 않는 값, 값에는 변하는 값을 표현
# d= {'name':'kim','addr':'seoul','age':25,'nn':{'별명1','별명2'}}
# # {키:값,.....}, 키는 작은(큰) 따옴표로 묶어서 표현, 값은 수치는 그대로, 문자는 작은(큰)따옴표로
#
# myname = 'lee'
# myname= 'park'
# print(myname)
#
# d2 = {1:"hi"}
# print(d2)
#
# # [1,10,15,20,30,70] 데이터들 사이에 연관 관계가 없음
# # 리스트(튜플) 구조로 연관 관계가 있는 데이터를 표현하기가(이해하기도) 어려움
# # ex) 게임 캐릭터 정보를 리스트로 표현
# # ['홍길동', 10, 100, 20, 200, 50, .....]
#
# # 딕셔너리 : 연관 데이터를 저장하기 위한 용도의 자료형
# # ex) 게임 캐릭터 정보를 리스트로 표현
# # {'아이디':'홍길동','레벨':10,'체력':200,'마나':20,'공격력':200,'방어력':50,...}
#
# dic = {'아이디':'홍길동','레벨':10,'체력':200,'마나':20,'공격력':200,'방어력':50}
# print(dic)
#
# # 키가 중복되면 마지막 키와 값만 저장
# dic = {'아이디':'홍길동','레벨':10,'체력':200,'마나':20,'공격력':200,'방어력':50,'아이디':'임꺽정'}
# dic = {'아이디':['홍길동','이순신','임꺽정'],'레벨':10,'체력':200,'마나':20,'공격력':200,'방어력':50}
# print(dic)
# # 키에는 딕셔너리, 리스트등 자료구조가 올 수 없다.
# # dic= {[10,20]:30} ERROR


# c=dict(아이디='홍길동',레벨=10,체력=200, 마나=20, 공격력=200, 방어력=50)
# print(c)
# # 한글 변수 가능/

# # 빈 리스트 생성
# a=[]
# print(a)
# b = list()
# print(b)
#
# # 빈 딕셔너리 생성
# a= {}
# print(a)
# b = dict()
# print(b)

#
# c1=dict(zip(아이디='홍길동',레벨=10,체력=200, 마나=20, 공격력=200, 방어력=50))
# # zip 함수는 엮어주는 역할을 함
# print(zip(['a','b'],[1,2])) # <zip object at 0x0000021B70DBC1C0>
# print(dict(zip(['a','b'],[1,2]))) # {'a': 1, 'b': 2}

#
# c2= dict(zip(['아이디','레벨','체력','마나','공격력','방어력'], ['홍길동',10,100,20,200,50]))
# print(c2)
#
# # 리스트 내부에 (키,값) 형식의 튜플로 표현
# c3=dict([('아이디','홍길동'),('레벨',10),('체력',200), ('마나',20), ('공격력',200),('방어력',50)])
# print(c3)
#
# # 중괄호로 표현
# c4 = dict({'아이디':'홍길동','레벨':10,'체력':200,'마나':20,'공격력':200,'방어력':50})
# print(c4)

# # 딕셔너리 데이터 추가/삭제
# a = {'nn':'bear'}
# print(a)
# # 딕셔너리 a에 데이터 추가
# a['addr'] = 'seoul'
# a[100]=300
# # 딕셔너리변수명[key]=value
# print(a)
# a['hobby']=['a','b','c']
# print(a)
#
# del a[100]
# print('삭제 후 : ',a)
#
# # del 딕셔너리변수[키] => 키와 값을 모두 제거
#
# # 딕셔너리 활용 - > json 파일 포맷(웹)
# dic={'아이디':'홍길동', '레벨':10, '체력':100, '마나':20, '공격력':200, '방어력':50}
# print(dic.keys())
# print(dic.values())
# print(dic.items())
#
# print('='*50)
#
# mykey= dic.keys()
# print(mykey)
# #print(mykey[0]) 에러
# listmykey=list(mykey)
# print(listmykey)
# print(listmykey[0])

# dic={'아이디':'홍길동', '레벨':10, '체력':100, '마나':20, '공격력':200, '방어력':50}
# dic['저항력']=100
# print(dic)
#
# print(dic['마나']) # 20
#
# # print(dic['민첩성'] ) # 없는 키를 참조하면 ERROR
# # 딕셔너리에 키가 있는지 확인?
# # print(dic.keys())
# print('민첩성' in dic) # False
# print('민첩성' not in dic) # True
# print(len(dic))
#
















