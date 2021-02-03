# id를 이용한 데이터 참조의  다양한 방법
from bs4 import BeautifulSoup
fp = open("lang.html", mode="r", encoding="utf-8").read()
soup = BeautifulSoup(fp,"html.parser")
# print(soup)
# print("="*50)
# print(soup.select_one("ul> li"))
# print("="*50)
# print(soup.select("ul> li")) # 리스트로 출력


# # 을 이용해서 id가 py인 데이터 추출
# print(soup.select_one("ul> li#py").string)
# print(soup.select_one("li#py").string)
# print(soup.select_one("#py").string)
# print("="*50)
# print(soup.select_one("ul"))
# print("="*50)
# print(soup.select_one("ul#language > li"))
# print("="*50)
# print(soup.select_one("ul#language > li#py"))
# print("="*50)
# print(soup.select_one("#language>li#py"))
# print(soup.select_one("#language>#py"))
# print(soup.select_one("#language #py"))
# print(soup.select_one("li[id='py']"))
# print("="*50)
# print(soup.select_one("li:nth-of-type(3)"))
# print(soup.select("li")[2])
# print(soup.select("li")[2])
# print(soup.find_all("li")[2])


# # 웹에서 크롤링하기
import urllib.request as req
# # 네이버 달러 환율 정보 가져오기
# # https://finance.naver.com/marketindex/?tabSel=exchange#tab_section
# url ="https://finance.naver.com/marketindex/?tabSel=exchange#tab_section"
# res = req.urlopen(url).read().decode('euc-kr')
# print(res)
# # print(res) # <http.client.HTTPResponse object at 0x0000015B0CC1CE50>
# soup = BeautifulSoup(res, "html.parser",)
# print(soup.select("span.value"))

#
# # 밑에 식은 불편한 방법
# # 공백은 . 으로 , class 이름도 .을 이용
# print("달러당",soup.select("a.head.usd>div>span.value")[0].string+"원")
#
# # 세련된 방법
# # 크롬 - f12 - 왼쪽 상단박스 클릭-해당구간 클릭 복사 -copy-copy selector
# print("달러당",soup.select("#exchangeList > li.on > a.head.usd > div > span.value")[0].string)
# print("달러당",soup.select_one("#exchangeList > li.on > a.head.usd > div > span.value").string)
# # #exchangeList > li.on > a.head.usd > div > span.value
# print("금값",soup.select_one("#oilGoldList > li.on > a.head.wti > div > span.value").string)


# # 위키피디어
# import urllib.request as req
# url ="https://ko.wikisource.org/wiki/%EC%A0%80%EC%9E%90:%EC%9C%A4%EB%8F%99%EC%A3%BC"
# res = req.urlopen(url)
# soup = BeautifulSoup(res, "html.parser")
# #print(soup.select_one("#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li > b > a").string)
# mylist=soup.select("#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li>ul>li")
# # print(len(mylist)) # 19
# for li in mylist:
#     print(li.string)




fp=open("fruits-vegetables.html",encoding="utf-8")
soup=BeautifulSoup(fp,"html.parser")
# print(soup)
# print(soup.select("div")
# print(soup.select("#fr-list"))
# print(soup.select("li"))
# print(soup.select("li.black"))

# print(soup.select("li.black")[1].string)
# print(soup.select("#ve-list>.black")[1].string)
# print(soup.select("#ve-list > li:nth-of-type(4)")[0].string)
# print(soup.select("#ve-list > li[data-lo='us']")[1].string)


# dic={"data-lo":"us"} # {속성명:속성값}
# print(soup.find("li")) # select_one함수와 같음
# print(soup.findAll("li")) # select함수와 같음
# print(soup.find("li",dic))
# print(soup.findAll("li",dic))

# dic={"data-lo":"us", "class":"black"}
# print(soup.find("li",dic))
# print(soup.findAll("li",dic))


# # find함수를 중복으로 사용할 수 있음
# print(soup.find(id="ve-list").find("li",dic))



# Selenium : 웹 브라우저를 제어하는 프로그램

from selenium import webdriver


# 크롭드라이버를 다운로드 받아 설치

# chromedriver는 크롬 웹브라우저를 제어하는 프로그램


driver=webdriver.Chrome("c:/scrap/chromedriver.exe")
# data:, 크롬창 뜨는지 확인

# # 네이버에서 소스코드를 가져와보자
# url = "https://www.naver.com"
# driver.get(url)
# html=driver.page_source
# print(html)
#




# 멜론에서 차트를 스크랩해보자

url = "https://www.melon.com/chart/index.htm"
driver.get(url)
html=driver.page_source
# print(html)
soup=BeautifulSoup(html, "html.parser")
#print(soup)
songs=soup.select("tr")[1:]
print(len(songs))
print(songs)
song = songs[2]
title=song.select("a")
print(title)
print("="*50)

# for song in songs:
#     print("곡명 : ",song.select("div.ellipsis.rank01>span > a")[0].string)
#     print("가수명 : ",song.select("div.ellipsis.rank02>span > a")[0].string)
#     print("="*50)



# 내일 : 인스타그램 크롤링(제주도 맛집)


# # 이거 주소가 바뀌어서 코드 구현 보류
# # 네이버 -> 강아지 -> 이미지 탭 주소
# # https://search.naver.com/search.naver?where=image&sm=tab_jum&query=%EA%B0%95%EC%95%84%EC%A7%80
# # 네이버 -> 고양이 -> 이미지 탭 주소
# # https://search.naver.com/search.naver?where=image&sm=tab_jum&query=%EA%B3%A0%EC%96%91%EC%9D%B4
# baseUrl="https://search.naver.com/search.naver?where=image&sm=tab_jum&query="
# word=input("검색어를 입력하세요:")
# from urllib.request import urlopen
# from urllib.parse import quote_plus
# num=int(input("갯수 입력 : "))
# url= baseUrl +quote_plus(word)
# # print(url)
# html =urlopen(url)
# # print(html)
# soup=BeautifulSoup(html,"html.parser")
#
# img=soup.select("_img")
# print(len(img))













































