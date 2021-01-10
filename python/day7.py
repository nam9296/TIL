# # 파이썬 라이브러리 : 수 많은 파이썬 함수
#
# # abs() : 절댓값을 출력하는 함수
# print(abs(-3)) # 3
# print(abs(-1.2)) # 1.2
#
# # all() : 모두 참이면 True를 반환 , 하나라도 거짓이 있으면 False 반환
# print(all([1,2,3])) # 1,2,3 모두 다 True
# print(all([1,2,3,0])) # 0이 있으므로 False
#
# # any() : 어느 하나라도 참이 있으면 True 반환, 모두 거짓일때만 False 반환
# print(any([1,2,3,0])) # 참이 하나이상 존재하므로 True
# print(any([0,"",0])) # 참이 하나도 없으므로 False
# print(any([])) # 비어있는 리스트도 False
#
# # chr() : (character) / 아스키 코드입력-> 문자 출력 함수
# print(chr(65)) # A
#
# # ord() : 문자 입력 -> 아스키 코드 출력 함수
# print(ord('A')) # 65
#
# # enumerate() : 열거형 데이터를 표현하는 함수, for문과 함께 사용되는 경우를 흔하게 볼 수 있음.
# # 리스트, 튜플, 문자열등 (시퀀스 데이터)
# # 시퀀스 데이터 - > 입력 -> 인덱스를 포함하는 enumerate 객체 생성
# for i in ['aaa','bbb','bbb']:
#     print(i)
# for idx, i in enumerate(['aaa','bbb','bbb']):
#     print(idx,i)
# # idx(인덱스) : 자료의 위치, 순서
#
#
# # eval() : 문자열로 구성된 수식 입력 -> 문자열을 실행한 결과를 출력
# print("10+20") # 10+20
# print(eval("10+20")) # 30
# print(eval("10+20*(3+10)")) # stack 사용
# # 문자열이긴한데 계산결과를 알고싶어
#
# print(type("10+20")) # <class 'str'>
# print(type(eval("10+20"))) # <class 'int'>
#
# # print('divmod(5,3')) #(1, 2)
# print(eval('divmod(5,3)'))

# # filter() : 원하는 데이터 걸러내는 함수
# # filter(함수이름, 첫번째 인수에 있는 함수에 입력될 반복 가능한 자료형)
# # filter 함수의 리턴값이 True(참)인 값들만 묶어서 반환한다.
#
# # example1
# def pos(alist):
#     res=[]
#     for i in alist:
#         if i >0:
#             res.append(i)
#     return res
#
#
# print(pos([1,3,-5,-7,9])) # [1, 3, 9]
#
# # example2 filter함수 이용
# def pos2(alist):
#     return alist>0
# print(filter(pos2,[1,3,-5,-7,9])) # <filter object at 0x00000227C61D68B0>
# print(list(filter(pos2,[1,3,-5,-7,9]))) # [1, 3, 9]
#
# # example3 filter + lambda함수
# print(list(filter(lambda alist:alist>0,[1,3,-5,-7,9])))
#
# # hex() : 16진수로 반환
# print(hex(234)) #0xea = 14*16+10*1 =234
#
# # int() : 정수형으로 출력
# print(int('3')) # 3
# # 문자열 ea가 16진수인데 정수로 바꿔줘
# print(int('ea',16)) # 234
#
# # float() : 실수형으로 출력
# print(float('3.4'))


# # 리스트 내포(컴프리헨션)
# # for문을 이용한 리스트 저장
# num=[]
# for n in range(11):
#     num.append(n)
# print(num)
#
# # 리스트 내포(컴프리헨션)
# print([n for n in range(11)])
#
# print([n*2 for n in range(11)])
#
# # 1~10 까지 짝수만 저장
#
# evenNum = []
# for i in range(1,11):
#     if i % 2==0:
#         evenNum.append(i)
# print(evenNum)
#
# # 리스트 컴프리헨션
# print([i for i in range(1,11) if i % 2 == 0])
# # range(1,11) - > i ->if i % 2 == 0-> 참거짓
# #-> 거짓이면 문장 실행을 하지않습니다.
#
#
# '''
# [('쌈밥','사과'),
#  ('쌈밥','아이스크림'),
#  ('쌈밥','커피'),
#  ('치킨','사과'),
#  ('치킨','아이스크림'),
#  ('치킨','커피'),
#  ('피자','사과'),
#  ('피자','아이스크림'),
#  ('피자','커피')]
# '''
# ['쌈밥','치킨','피자']
# ['사과','아이스크림','커피']
#
# li=[]
# for x in ['쌈밥','치킨','피자']:
#     for y in ['사과','아이스크림','커피']:
#         for z in ['사','아','커']:
#             li.append((x,y,z))
# print(li)
#
# print([(x,y) for x in ['쌈밥','치킨','피자'] for y in ['사과','아이스크림','커피']])
# print([(x,y,z) for x in ['쌈밥','치킨','피자'] for y in ['사과','아이스크림','커피'] for z in ['사','아','커']])

# # if 문도 중첩해서 표현기 가능함
# # 0~9까지 수 중에서 5보다 작으면서 2로 나누어 떨어지는 수를 리스트에 저장하시오
# #[0,2,4]
#
# print([i for i in range(10) if i<5 if i %2 ==0])
# print([i for i in range(10) if i<5 and i %2 ==0])
#
# print([x+y for x in range(10) for y in range(10)])
#
# # 셋{} 컴프리헨션
# print({x + y for x in range(10) for y in range(10)})
# print(type({x + y for x in range(10) for y in range(10)})) # <class 'set'>
#
# # 딕셔너리{} 컴프리헨션
# print({x+y:"값" for x in range(10) for y in range(10)})
# print(type({x+y:"값" for x in range(10) for y in range(10)})) # <class 'dict'>

# scores= {'철수':50,'영희':70,'순신':100}
# print({name : score for name, score in scores.items() if name != '순신'})

# # 점수가 60 이상이면 pass, 미만이면 fail
# # 출력 = {'철수':fail, '영희':pass,'순신':pass}
# scores= {'철수':50,'영희':70,'순신':100}
# print({name: 'pass' if score > 60 else 'fail' for name, score in scores.items() })
#
#
# print({name : "pass" if score>=60 else "fail" for name, score in scores.items()})

## 일반적인 구문 : [표현식  for 변수명 in 시퀀스  ]

# words = ['Computer', 'Coke', 'Bread']
# print([i.lower() for i in words ])


# # a에 저장된 값이 0 보다 크면 a값을, 작으면 0을 저장
# a = [1,-5,4,2,-2,10]
# #[1, 0, 4, 2, 0, 10]
#
# print([i if i > 0 else 0 for i  in a])


# a = [1,2,3,4,5]
# # a 값이 1이면 "pass", 2이면 "fail", 나머지 "no"
# print(["pass" if i ==1 else "fail" if i ==2 else "no" for i in a])
# # if i ==1 이면 "pass" , else if i==2 이면 "fail" else 이면 "no"



# # 딕셔너리 응용
# x={'a':10,'b':20,'c':30}
# print(x)
#
# x['aa'] = 40
# print(x)
#
# # setdefault('d') # 키 d가 추가되고 value는 None이 저장됨
# x.setdefault('d')
# print(x)
#
# x['a'] = 100
# print(x)
#
# # update(b=200) : b라는 키에 200라는 값을 줌
# # update()는 여러개를 추가할 수 있는 것이 장점
# x.update(b=200)
# print(x)
#
# x.update(z=99)
# print(x)
#
# x.update(c=200,s=90,k=80)
# print(x)
#
# x.update({'a':10,'d':30})
# print(x)
#
#
# # print(list(zip([1,2],['one','two'])))
# x.update(zip(['aa','c'],[999,777]))
# print(x)
#
# x={'a':10,'b':20,'c':30,'d':40}
# #v=x.pop('b') # 딕셔너리는 순서가 없기때문에 반드시 ('key') 해야함
# #print(v) # v에는 value가 저장됨
# # 없는 키를 줘볼까 ?
# #x.pop('z') # KeyErrorp
# #print(x.pop('z',0))# key가 없을때는 0을 반환
#
# del x['b']
# print(x)
#
# x.clear()# 다 지워줘용
# print(x)


# # 리스트(튜플) -> 딕셔너리 생성
# # dict.formkeys
# li = ['a','b','c'] # keylist
# d=dict.fromkeys(li)
# print(d)#{'a': None, 'b': None, 'c': None}
#
# d2 = dict.fromkeys(li,10)
# print(d2) # {'a': 10, 'b': 10, 'c': 10}
#
# from collections import defaultdict
# d2 = defaultdict(int)
# print(d2['z']) # 에러가 아니라 0으로 반환

# d3 = {'a':10,'b':20}
# # print(d3.keys())# dict_keys(['a', 'b'])
# # print(d3.values())# dict_values([10, 20])
# # print(d3.items())# dict_items([('a', 10), ('b', 20)])
#
# # for k in d3:
# #     print(k)
# for k in d3.keys():
#     print(k)
#
# for v in d3.values():
#     print(v)
# for k,v in d3.items():
#     print(k,v)
#

# keys = ['a','b','c','d']
# print(dict.fromkeys(keys))

# #dict.fromkeys(keys) 는 딕셔너리
# for key , value in dict.fromkeys(keys).items():
#     print(key,value)
#

# d4 = {key : value for key , value in dict.fromkeys(keys).items()}
# print(d4)

# x = {'a': 10, 'b': 20, 'c': 30, 'd': 40}
#
# # newx는 x에 저장된 데이터에서 'b'를 뺀 나머지를 저장하도록
# newx={k:v for k,v in x.items() if k!='b'}
# print(newx)
#
#
# # newx는 x에 저장된 데이터에서 값이 20 인 자료를 뺀 나머지를 저장하도록
# newx={k:v for k,v in x.items() if v!=20}
# print(newx)

# # json
# # 딕셔너리 = {키1 : {키a:값a,키b:값b },키2:{키c:값c,키d:값d}}
# 영화평점 = {'BTS':{'머큐리':4.5,'매트릭스':4.0}, '소녀시대':{'머큐리':3.5,'매트릭스':3.0},}
#
# print(영화평점['BTS']['매트릭스'])
#
# 영화평점['BTS']['매트릭스']=5.0
# print(영화평점['BTS']['매트릭스'])

# x= {'a':0,'b':1}
# # y=x 사용
# y=x
# print(x is y)# True 변수이름만 다를 뿐 x,y는 같은 객체
#
# x['a']=100
# print(y) # x를 바꿧는데 y도 바뀌어있음
#
# # copy()
# y=x.copy()
# print(x is y) # False copy를 이용하면 다른 2개의 딕셔너리가 만들어짐
#
# x['a']=111
# print(y) # x를 바꿨는데 y는 바뀌지 않음
#
#
#
#
# x={'a':{'python':'3.8'},'b':{'python':'2.7'}}
# y= x.copy()
#
# y['a']['python'] = '2.77777'
# print(y)
#
# print(x)
# # y를 바꿧는데 왜 x가 바뀌었지 ???????
#
# # 중첩 딕셔너리에서는 copy메서드 대신 copy모듈에 deepcopy를 사용해야함
#
# x={'a':{'python':'3.8'},'b':{'python':'2.7'}}
# import copy
# y=copy.deepcopy(x) # 깊은복사
# y['a']['python'] = '2.77777'
# print(y)
# print("="*50)
# print(x)
























