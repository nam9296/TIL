# 정규 표현식


- 정규 표현식은 Regular Expressions의 첫글자만 따서 re로 import한다.
- 복잡한 문자열 처리에 유용하다.
- 흔하게 정규식이라고도 부른다.


### 메타 문자(meta characters)
- 메타 문자란 원래 그 문자가 가진 뜻이 아닌 특별한 용도로 사용하는 문자를 말한다.
```. ^ $ * + ? { } [ ] \ | ( )```

-  [a-zA-Z] : 알파벳 모두
- [0-9] : 숫자
- 문자 클래스([ ]) 안에는 어떤 문자나 메타 문자도 사용할수 있지만 주의해야 할 메타 문자가 1가지 있다. 그것은 바로 ^인데, 문자 클래스 안에 ^ 메타 문자를 사용할 경우에는 반대(not)라는 의미를 갖는다. 예를 들어 \[^0-9]라는 정규 표현식은 숫자가 아닌 문자만 매치된다.


### 문자 클래스

- [0-9] 또는 [a-zA-Z] 등은 무척 자주 사용하는 정규 표현식이다. 이렇게 자주 사용하는 정규식은 별도의 표기법으로 표현할 수 있다. 다음을 기억해 두자.

	- \d - 숫자와 매치, [0-9]와 동일한 표현식이다.
	- \D - 숫자가 아닌 것과 매치, \[^0-9]와 동일한 표현식이다.
	- \s - whitespace 문자와 매치, [ \t\n\r\f\v]와 동일한 표현식이다. 맨 앞의 빈 칸은 공백문자(space)를 의미한다.
	- \S - whitespace 문자가 아닌 것과 매치,\[^ \t\n\r\f\v]와 동일한 표현식이다.
	- \w - 문자+숫자(alphanumeric)와 매치, [a-zA-Z0-9_]와 동일한 표현식이다.
	- \W - 문자+숫자(alphanumeric)가 아닌  매치,\[^a-zA-Z0-9_]와 동일한 표현식이다.
대문자로 사용된 것은 소문자의 반대임을 추측할 수 있다.


### Dot(.)
- 정규 표현식의 Dot(.) 메타 문자는 줄바꿈 문자인 \n을 제외한 모든 문자와 매치됨을 의미한다.
```a.b```

> a+모든문자+b

```a[.]b```

>a+Dot(.)문자+b



### *와 +의 차이

```a+```

abb와 같이 a와 b사이에 단 하나의 문자만 들어갈 수 있음을 말한다.

```a*b```

aaaaaaaabbbbbbbbbb와 같이 a와 b사이에 많은 문자들이 들어갈 수 있음을 말한다.





#### {}사용

```ca{2}t```

a가 {}안의 수만큼 반복됨을 의미한다.

| 정규식 | 문자열 | match여부| 설명|
| ----- | ----- | ----- |----|
|```ca{2}t```|  cat     |   No    |"a"가 1번만 반복되어 매치되지 않음 |
|```ca{2}t```|   caat   |  Yes     |"a"가 2번 반복되어 매치 |



```ca{2,5}t```
c + a(2~5회 반복) + t

| 정규식 | 문자열 | match여부| 설명|
| ----- | ----- | ----- |----|
|```ca{2,5}t```|  cat     |   No    |"a"가 1번만 반복되어 매치되지 않음 |
|```ca{2,5}t```|   caat   |  Yes     |"a"가 2번 반복되어 매치 |
|```ca{2,5}t```|   caaaaat   |  Yes     |"a"가 5번 반복되어 매치 |



#### ? 활용

- 반복은 아니지만 이와 비슷한 개념으로 ```?```가 있다.

- ```?```는 ```{0,1}```의 수를 의미하고, '있어도, 없어도 된다' 로 사용된다.

  ```ab?c```

  a + b(있어도 되고 없어도 된다) + c

| 정규식 | 문자열 | match여부| 설명|
| ----- | ----- | ----- |----|
|ab?c|abc|   Yes    |"b"가 1번 사용되어 매치 |
|ab?c|   ac   |  Yes     |"b"가 0번 사용되어 매치 |







## 정규식을 이용한 문자열 검색

- 이제 컴파일된 패턴 객체를 사용하여 문자열 검색을 수행해 보자. 컴파일된 패턴 객체는 다음과 같은 4가지 메서드를 제공한다.

  | Method     | 목적                                                         |
  | ---------- | ------------------------------------------------------------ |
  | match()    | 문자열의 처음부터 정규식과 매치되는지 조사한다.              |
  | search()   | 문자열 전체를 검색하여 정규식과 매치되는지 조사한다.         |
  | findall()  | 정규식과 매치되는 모든 문자열(substring)을 리스트로 돌려준다. |
  | finditer() | 정규식과 매치되는 모든 문자열(substring)을 반복 가능한 객체로 돌려준다. |



#### Match 이용

```
>>> import re
>>> p = re.compile('[a-z]+')
```

```
>>> m = p.match("python")
>>> print(m)
<_sre.SRE_Match object at 0x01F3F9F8>
```

- "python" 문자열은 `[a-z]+` 정규식에 부합되므로 match 객체를 돌려준다.

```
>>> m = p.match("3 python")
>>> print(m)
None
```

- "3 python" 문자열은 처음에 나오는 문자 3이 정규식 `[a-z]+`에 부합되지 않으므로 None을 돌려준다.

```
p = re.compile(정규표현식) 
m = p.match( 'string goes here' )
if m:
	print('Match found: ', m.group())
else:
	print('No match')
```



#### Search 이용

```
>>> m = p.search("python")
>>> print(m)
<_sre.SRE_Match object at 0x01F3FA68>
```

- "python" 문자열에 search 메서드를 수행하면 match 메서드를 수행했을 때와 동일하게 매치된다.

```
>>> m = p.search("3 python")
>>> print(m)
<_sre.SRE_Match object at 0x01F3FA30>
```

- "3 python" 문자열의 첫 번째 문자는 "3"이지만 search는 문자열의 처음부터 검색하는 것이 아니라 문자열 전체를 검색하기 때문에 "3 " 이후의 "python" 문자열과 매치된다.



##### Match와 Search 메서드는 문자열을 처음부터 검색할지의 여부에 따라서 다르게 사용된다.



#### findall 이용

```
>>> result = p.findall("life is too short")
>>> print(result)
['life', 'is', 'too', 'short']
```

- "life is too short" 문자열의 'life', 'is', 'too', 'short' 단어를 각각 `[a-z]+` 정규식과 매치해서 리스트로 돌려준다.

#### finditer 이용

```
>>> result = p.finditer("life is too short")
>>> print(result)
<callable_iterator object at 0x01F5E390>
>>> for r in result: print(r)
...
<_sre.SRE_Match object at 0x01F3F9F8>
<_sre.SRE_Match object at 0x01F3FAD8>
<_sre.SRE_Match object at 0x01F3FAA0>
<_sre.SRE_Match object at 0x01F3F9F8>
```

##### findall과 finditer 메서드는 동일하지만 반복 가능한 객체를 돌려준다.  반복 가능한 객체가 포함되는 각각의 요소는 match객체이다.



### match 객체의 메서드

| method  | 목적                                                  |
| ------- | ----------------------------------------------------- |
| group() | 매치된 문자열을 돌려준다.                             |
| start() | 매치된 문자열의 시작 위치를 돌려준다.                 |
| end()   | 매치된 문자열의 끝 위치를 돌려준다.                   |
| span()  | 매치된 문자열의 (시작,끝)에 해당되는 튜플을 돌려준다. |

예를 들어보자

```
>>> m = p.match("python")
>>> m.group()
'python'
>>> m.start()
0
>>> m.end()
6
>>> m.span()
(0, 6)
```

search 메서드 사용

```
>>> m = p.search("3 python")
>>> m.group()
'python'
>>> m.start()
2
>>> m.end()
8
>>> m.span()
(2, 8)
```

