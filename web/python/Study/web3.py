
import re
# print(re.match("\d{4}","1234"))
# if re.match("\d{4}$","12345"):  # 숫자 4자리로 끝나야합니다
#     print("정상 전화번호")
# else:
#     print("비정상 전화번호")





# # sub함수
#
# # 대한민국, 한국, 코리아, ...=> 대한민국
# # re.sub("패턴","바꿀문자열","문자열",바꿀횟수)
# print(re.sub("apple|orange","fruit","apple tree banana orange"))
# # fruit tree banana fruit
#
# # "1 2 apple 3 banana 4 7 9 30 tree"
# # 수치데이터 => num으로 변경
# print(re.sub("[0-9]+","num","1 2 apple 3 banana 4 7 9 30 tree"))
#
#
# # 지정된 횟수만큼만 바꾸고싶다면
# print(re.sub("[0-9]+","num","1 2 apple 3 banana 4 7 9 30 tree",1))
# print(re.sub("[0-9]+","num","1 2 apple 3 banana 4 7 9 30 tree",count=1))

# # 원래는 두줄임, 같은식을 써보자
# print(re.sub("apple|orange","fruit","apple tree banana orange"))
#
# pat = re.compile("apple|orange")
# print(pat.sub("fruit","apple tree banana orange"))


#https://www.multicampus.com/img/saas/main/logo/CUS0001/pc_main.png

import urllib.request
# url ="https://www.multicampus.com/img/saas/main/logo/CUS0001/pc_main.png"
# urllib.request.urlretrieve(url, "test.png")
# print("저장되었습니다.")

# url ="https://www.multicampus.com/img/saas/main/logo/CUS0001/pc_main.png"
# mem=urllib.request.urlopen(url).read() # 접속.읽어오기
# with open("test2.png","wb")as f:
#     f.write(mem) # f에 mem(읽어온파일)을 작성(저장)
#     print("저장되었습니다.")



# # http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp
#
#
# # 웹에서 사용하는 언어
# # - 서버, 클라이언트 간에 데이터를 주고 받을 때 사용하는 언어
# # 클라이언트(페이지요청, 웹 브라운저에 www.naver.com)-> 웹서버-> 메인페이지 제공(index.html)
# # HTML : Hyper-Text Markup Language
# # XML : Extensible Markup Language
#
#
# # 구조화된 문서 (XML)
# # 비구조화된 문서(HTML)
#
# # 클라이언트(날씨 클릭) - > 웹서버(날씨 (동적)페이지 생성)
# # -> 생성된 페이지를 HTML문서로 만들어서 제공 -> 웹브라우저 해석
# # -> 결과를 화면에 출력
# # 출력 : 오늘의 날씨는 맑습니다. 기온은 섭씨 영하 2도 입니다.
#
# # 정적 페이지 : 변하지 않는 페이지  : HTML, XML 둘다 정적페이지이긴 함
# # 동적 페이지 : 주기적으로 변하는 페이지  : JSP,ASP,PHP 등등
#
# # 검색어 : BTS
# # BTS가 기억이 안나서 노래제목, 멤버들, ...
# # 비구조화된 문서 : 웹페이지 내용에 대해 기계가 해석하지 못하는 문서 => 검색어를 기반으로 검색
# # ex)BTS가 서울 강남구에서 공연을 했습니다.
#
# # 구조화된 문서 : 웹페이지 내용에 대해 기계까 해석 가능한 문서 => 검색어의 의미를 기반으로 검색
# # 검색 폭이 넓음, 검색 결과에 대한 정확도 높음
#
# # ex)
# # <가수>
# #   <그룸명>BTS</그룸명>
# #   <도시명>서울</도시명>
# #   <구이름>강남구</구이름>
# #   <멤버이름>...</멤버이름>
# # </가수>
#
# import urllib.parse as parse
# import urllib.request as request
# addr = "http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp"
# values={'stdId':'109'}
#
# params=parse.urlencode(values)
#
# url=addr+"?"+params
# print(url)
#
# data=request.urlopen(url).read()
# data=data.decode('utf-8')
# print(data)
#
# # 제주시의 1월 16일 자정 온도를 가져와라

# 웹 스크래핑 : BeautifulSoup패키지 이용
from bs4 import BeautifulSoup

# html1="""
# <html><body>
# <h1>스크레핑</h1>
# <p>웹 페이지 분석</p>
# <p>원하는 부분 추출</p>
# </body></html>
# """
# soup=BeautifulSoup(html1, "html.parser")
# # 대문자로 시작하면 클래스
# # 붕어빵봉투 = 붕어빵 기계(크림, 10센티)
# print(soup.html.body.h1) # <h1>스크레핑</h1>
#
# print(soup.html.body.p.string) # 웹 페이지 분석
# p1=soup.html.body.p
# # p2=p1.next_sibling # 줄바꿈문자
# # print(p2.next_sibling.string) # 원하는 부분 추출
# # 두번 해주니까 다음요소가 나왓네?
# p2=p1.next_sibling.next_sibling.string # 두번써도되네
# print(p2) # 원하는 부분 추출


html2="""
<html><body>
<h1 id='title'>스크레핑</h1>
<p id='body'>웹 페이지 분석</p>
<p>원하는 부분 추출</p>
</body></html>
"""
#
# soup2 = BeautifulSoup(html2, "html.parser")
# # print(soup2.html.body.h1.string)
# print(soup2.find(id='title')) # <h1 id="title">스크레핑</h1>
# print(soup2.find(id='title').string) # 스크레핑
# print(soup2.find(id='body').string) # 웹 페이지 분석

html3="""
<html><body>
<ul>
<li><a href = "http://www.naver.com">naver</a></li>
<li><a href = "http://www.daum.net">dawm</a></li>
<ul>
<body><html>
"""
# # <태그명 속성명=속성값 속성명=속성값...>
# # 태그명 : a ,속성명 : href, 속성값 : "http://www.naver.com"
# soup3=BeautifulSoup(html3, "html.parser")
# # print(soup3) # 문자열=>html.parser로 분석할 수 있는 객체로 변환
# # print(html3) # 문자열을 저장하고 있는 변수
#
# # print(soup3.find_all("a")) # 오 ? 리스트형태네 ?
# # print(html3.find_all("a")) # ERROR 내용이 같으나 type이 다름
#
# links =soup3.find_all("a")
# # print(links[0])
# # print(links[1])
#
# for i in links:
#     # print(i.attrs['href']) # attrs : attribute(속성)
#     href=i.attrs['href']
#     na=i.string
#     print(na, "-->" ,href)

html4="""
<p><a href="aaa.html" name="kkk">aaa page</a></p>
"""
#
# soup4=BeautifulSoup(html4, "html.parser")
# print(soup4.p.a.string)
# print(soup4.a.string)
#
# print(soup4.a.attrs) # {'href': 'aaa.html'} 딕셔너리로 나오넹?
# mydict=soup4.a.attrs
# # print(mydict.keys())
# # print(mydict.items())
#
# print('href' in mydict)
# # if 'href' in mydict:
# #     ...
# # else:
# #     ...
# for i in mydict.values():
#     print(i)


# http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp
import urllib.request as req
url="http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp"
res = req.urlopen(url) # res는 페이지 내용이 담겨있는 '포장지'와 같다
#print(res) # <http.client.HTTPResponse object at 0x0000029A120A8730>

# 정상 응답 = > 200 : ok
# 문서를 찾지 못한 경우 => (ex) ERROR 404
# 서버 자체의 오류 = ERROR 50X

soup5=BeautifulSoup(res, "html.parser")
# print(soup5) # 전문이 다 나옴
# print(type(soup5)) # <class 'bs4.BeautifulSoup'>
# print("문서 제목:",soup5.title.string)
# print("문서 제목:",soup5.find("title").string) # 위아래 모두 같은값을 출력함
# print("문서 제목:",soup5.find_all("title")[0].string)



## 모든 wf 태그의 내용을 출력
# print(soup5.find("wf").string)
# print(soup5.find_all("wf"))
# print(len(soup5.find_all("wf")) )# 534개의 wf태그문이 있음


from bs4 import BeautifulSoup


html6 = """
<html><body>
<div id="lang">
    <h1>programming</h1>  
    <ul class="items">    
        <li>python</li>
        <li>java</li>
        <li>cpp</li>
    </ul>
</div>
</body></html>
"""

# h1태그는 큰글씨로 보여줌
# ul (unordered list) 순서가 없는 리스트임 번호출력이 안됨

soup6=BeautifulSoup(html6, "html.parser")
# print(soup6.select("div")) # 리스트형태로 들어감
# print(soup6.select("div#lang")) # lang이라는 id를 가지고있는 내용만 select
# print(soup6.select("div#lang > h1")) # h1로 묶인 리스트가 나옴
# print(soup6.select("div#lang > h1")[0].string) # programming


# # 여러 개를 추출할 때 select 사용
# # 한 개를 추출할 때 select_one 사용
# # select_one은 리스트형태가 아닌 문자열 형태로 출력됨
# print(soup6.select_one("div#lang > h1"))

# print(soup6.select("div#lang > ul")) # 리스트
# print(soup6.select_one("div#lang > ul")) # 문자열

# print(soup6.select("div#lang > ul.items ")) # . 뒤에는 클래스가 나옴
# print(soup6.select("div#lang > ul.items > li"))
# print(soup6.select_one("div#lang > ul.items > li"))

# mylist1=soup6.select("div#lang > ul.items > li")
# for i in mylist1:
#     print(i.string)

































































































































































































































