'''
1. IT기업 코딩 테스트문제
주어진 문자열(공백 없이 쉼표로 구분되어 있음)을 가지고 아래 문제에 대한 프로그램을 작성하세요.

이유덕,이재영,권종표,이재영,박민호,강상희,이재영,김지완,최승혁,이성연,박영서,박민호,전경헌,송정환,김재성,이유덕,전경헌

김씨와 이씨는 각각 몇 명 인가요?
"이재영"이란 이름이 몇 번 반복되나요?
중복을 제거한 이름을 출력하세요.
중복을 제거한 이름을 오름차순으로 정렬하여 출력하세요.
'''

name="이유덕,이재영,권종표,이재영,박민호,강상희,이재영,김지완,최승혁,이성연,박영서,박민호,전경헌,송정환,김재성,이유덕,전경헌"
names=name.split(',')
# 1.김씨와 이씨는 각각 몇 명 인가요?
Kim = []
Lee = []
for i in names:
    if i[0]=="이":
        Lee+=i[0]
    elif i[0] == "김":
        Kim+=i[0]
print("김씨는 {0}명, 이씨는 {1}명 입니다.".format(len(Kim),len(Lee)))

# 2."이재영"이란 이름이 몇 번 반복되나요?
print("이재영이란 이름은 {0}번 반복됩니다.".format(names.count("이재영")))

# 3.중복을 제거한 이름을 출력하세요.
set_name = set(names)
print(set_name)

# 4.중복을 제거한 이름을 오름차순으로 정렬하여 출력하세요.
print(sorted(names))



'''
2. 토지 원고 데이터
1) 저자명 추출
2) 제목 추출
3) 출판사명 추출
4) 인용부호(큰 따옴표)로 묶여있는 내용을 모두 추출하여 리스트에 저장
5) 토지 원고 전체에서 한글에 해당되는 내용만 추출하여 저장, 가장 많이 사용된 단어
100개를 출력
6) 각 장의 제목 저장 및 출력

'''
import re
from bs4 import BeautifulSoup
with open("toji.txt", "r",encoding='utf-16') as f:
    toji=f.read()
    soup=BeautifulSoup(toji,'html.parser')

# 1) 저자명 추출
print("저자 :",soup.find('author').string)

# # 2) 제목 추출
print('작품제목 :',soup.select('title')[0].string[:4])
#
# # 3) 출판사명 추출
print('출판사 :', soup.find('publisher').string)


# 4) 인용부호(큰 따옴표)로 묶여있는 내용을 모두 추출하여 리스트에 저장

p_teg=soup.select("p")
print(re.findall("[\"]+(.*?)[\"]", str(p_teg)))


# 5) 토지 원고 전체에서 한글에 해당되는 내용만 추출하여 저장, 가
# 장 많이 사용된 단어 100개를 출력

toji=re.findall('[ㄱ-ㅎ가-힣]+',toji)

dic={}
for i in toji:
    if i not in dic:
        dic[i]=1
    else:
        dic[i]+=1
print(sorted(dic.keys(),reverse=True,key=lambda x : dic[x] )[:100])

# 6) 각 장의 제목 저장 및 출력

head= soup.find_all('head')
for i in head:
    Title=i.string
    print(Title)