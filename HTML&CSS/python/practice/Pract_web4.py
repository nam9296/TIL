# 1번 2번 오류계속나옴 포기


'''
3. 보배드림 -> 차량정보추출
https://www.bobaedream.co.kr/mycar/mycar_list.php?gubun=K
1)연식
2)연료
3)가격
'''

url="https://www.bobaedream.co.kr/mycar/mycar_list.php?gubun=K"
from bs4 import BeautifulSoup
import urllib.request as req
from selenium import webdriver
driver=webdriver.Chrome("c:/scrap/chromedriver.exe")

driver.get(url)
html=driver.page_source
soup =BeautifulSoup(html,'html.parser')
cars=soup.select("li.product-item")

for car in cars:
    print("연식 :",''.join((car.select("div.mode-cell.year>span")[0]).strings))
    print("연료 :",car.select("div.mode-cell.fuel>span")[0].string)
    print("가격 :",car.select("div.mode-cell.price>b>em")[0].string,"만원")
    print("=" * 50)


'''
4. https://www.rottentomatoes.com/ => popular streaming movies
순위와 함께 영화 제목 추출
'''
from bs4 import BeautifulSoup
import urllib.request as req
from selenium import webdriver
driver=webdriver.Chrome("c:/scrap/chromedriver.exe")
url="https://www.rottentomatoes.com/"
driver.get(url)
html=driver.page_source
soup =BeautifulSoup(html,'html.parser')

movies=soup.select("div.js-scores-lists-wrapper.ordered-layout__scores-wrap>div:nth-child(1)>section> text-list > ul>li")
for movie in movies:
    print(movie.select("a:nth-child(1) > span")[0].string)