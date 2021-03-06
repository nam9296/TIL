x<-c(2,-1,3,7,0,5,8)
x%%2 # 나머지 출력
x%%2==0
x[x%%2==0] # 짝수 출력
x[x%%2!=0] # 짝수가 아닌수 출력

which(x%%2!=0)
x[which(x%%2!=0)]
x[-which(x%%2!=0)]

# R에서 데이터를 정렬하는 대표적인 함수 2개
# sort(), order()

# sort() : 데이터가 정렬된 결과가 나옴
# order() : 데이터 크기의 색인을 출력

v1<-c(20,10,50,40,30)
v2<-c(300,200,100,700,600)
v3<-c("a","b","b","a","b")
df<-data.frame(v1,v2,v3)
df

# 벡터 정렬
v1
sort(v1) # 오름차순이 디폴트
sort(v1,decreasing = TRUE) # 내림차순

# order : 정렬 색인 값을 추출
v1
order(v1) # 오름차순 정렬을 했을 때, 
# 20 10 50 40 30 -> 10 20 30 40 50
# 1  2  3  4  5     2  1  5  4  3
v1[order(v1)]
v1[order(-v1)] # 내림차순
# sort() 는 데이터프레임에서 사용할 수 없다
# order() 는 데이터프레임에서 사용할 수 있다.

df

order(v1)
order(v2)
order(v3)

df[order(v1),] # v1을 기준으로 df를 정렬
df[order(v1,-v2,v3),] # v1이 동일하면 v2기준, 그다음 v3기준



v1<-c(20,10,50,40,20)
v2<-c(300,200,100,700,600)
v3<-c("a","b","b","a","b")
df<-data.frame(v1,v2,v3)
df

df[order(v1,-v2,v3),]


install.packages("plyr")
library(plyr)
arrange(df, v1)
arrange(df, v1,-v2)
arrange(df, v1,desc(v2),v3)

sort(letters,decreasing = TRUE)



# 텍스트마이닝
# 베이지안 필터 이메일분류기 (햄/스팸) 나중에 만들 예정
# text mining

x<- "We have a dream"
nchar(x) # 문자의 개수 출력됨 공백문자도 문자로 취급
length(x) # 문자 벡터의 벡터길이 (원소의 개수가 1개)

length(c("we","have","a", "dream")) # 4

y<-c("we","have","a", "dream")
y[4]
length(y[4])
nchar(y[4])


# 대소문자 변환
x<- "We have a dream"
tolower(x)
toupper(x)

# 문장 쪼개기
strsplit(x,split=" ") 
class(strsplit(x,split=" ")) # list형식임
# 공백 문자로 구분된 각각의 단어들로 구성된 벡터가 리스트에 저장된다.

strsplit(x,split="")

# strsplit 결과가 리스트로 저장
strsplit(x,split=" ") 
# 리스트를 벡터로 바꿔볼까?
unlist(strsplit(x,split=" ") )
class(unlist(strsplit(x,split=" ") ))


res<-strsplit(x,split=" ")[[1]]
res[4]


x1<- "We have a dream"
x2<- "How are you"
x3<- "I am fine"

myword<-c(x1,x2,x3)
myword
length(myword)

strsplit(myword," ")

strsplit(myword," ")[[3]]

strsplit(myword," ")[[3]][3]


# 대소문자 구분됨 what What WHAT whaT ...

# 단어통일 korea, Korea, KOREA, 한국, 대한민국, 조선, ...


said<- "WHAT IS ESSENTIAL is invisible to the Eye"
said.word<-strsplit(said," ")

# unique() : 유일한 단어를 추출
unique(said.word)

unique(said.word[[1]])

unique(tolower(said.word[[1]]))



# 자연어 ->sql
# 우리 회사에서 직급이 대리인 사람의 이름을 모두 출력해라
# =>SELECT name FROM company WHERE 직급='대리'

# paste(): 문자열을 결합 함수 ->하나의 문자열로 생성
paste("Everybody","wants","to","fly")
# "Everybody wants to fly"
paste(c("Everybody","wants","to","fly"))
#애초의 하나의 벡터이기 때문에 합져주지 않습니다.
# paste():분리된 벡터를 결합하는 함수,벡터의 원소들을 분리해서 결합하지 않는다


said<-"WHAT IS ESSENTIAL is invisible to the Eye"

res<-strsplit(said," ")[[1]]

paste(res) #역시 하나의 벡터이기 때문에 결합자체를 안함

#기본값으로 공백문자
paste("Everybody","wants","to","fly")
# "Everybody wants to fly"

paste("Everybody","wants","to","fly",sep="-")
# "Everybody-wants-to-fly"
paste("Everybody","wants","to","fly",sep="")
# "Everybodywantstofly"


paste(pi,sqrt(pi)) #숫자벡터여도 문자로 바꿔서 결합
# [1] "3.14159265358979 1.77245385090552"

paste("aaa",1+2,"bbb")
# [1] "aaa 3 bbb"

heroes<-c("Batman","Captain America","Hulk")
colors<-c("Black","Blue","Green")

paste(colors,heroes)
# [1] "Black Batman""Blue Captain America" "Green Hulk"  
#벡터를 인수로 준 경우에는 요소값 결합



paste("type",1)
paste("type",1:5)
# c(1,2,3,4,5)와 c("type")이 결합한것
c("type") #길이1->길이5로 변경됨(c('type','type','type','type','type'))
# [1] "type 1" "type 2" "type 3" "type 4" "type 5"

paste(heroes,"wants","to")
# [1] "Batman wants to"  "Captain America wants to"
# [3] "Hulk wants to"    



# paste함수 collapse옵션:텍스트 결합을 통해 생성된 텍스트들을 다시 하나로 연결
# 하는 구분자 정의
paste(c("Everybody","wants","to","fly"),collapse = " ")

# [1] "Everybody wants to fly"


#"Batman wants to fly, and Captain America wants to fly, and Hulk wants to fly"
#만들기
heroes<-c("Batman","Captain America","Hulk")
st<-paste(c("Everybody","wants","to","fly"),collapse = " ")



st1<-paste(strsplit(st," ")[[1]][-1],collapse = " ")
st1

paste(heroes,st1,collapse = ", and ")
# [1] "Batman wants to fly, and Captain America wants to fly, and Hulk wants to fly"


#"Batman-wants-to-fly;Captain America-wants-to-fly;Hulk-wants-to-fly"
#만들기
heroes<-c("Batman","Captain America","Hulk")
st<-paste(c("Everybody","wants","to","fly"),collapse = " ")

st1<-paste(strsplit(st," ")[[1]][-1],collapse = "-")
st1

paste(heroes,st1,sep="-", collapse = ";")
# [1] "Batman-wants-to-fly;Captain America-wants-to-fly;Hulk-wants-to-fly"


# paste 함수에 sep, collapse 옵션
# Batman-wants-to-fly;captain America-wants to fly; Hulk-wants to-fly
heros<- c("Batman","Catpain America", "Hulk")
paste(heros,"wants","to","fly",sep='-')



# outer함수 
# : 두 집합에 대해 가능한 모든 순서쌍의 곱을 수행(카티전 곱; default)
outer(c(1,2,3),c(3,2,1))

# outer + paste 함수를 결합해서 문자열 생성
# outer함수의 3번째 인수자리에 함수를 작성하여 모든 순서쌍에 대해
# 카티전 곱이 아닌 다른 작업을 수행할 수 있게됨

asia.countries<-c("Korea","China","India")
info<-c("GDP","Population","Area")
outer(asia.countries,info, FUN=paste, sep='-')
class(outer(asia.countries,info, FUN=paste, sep='-'))

out<-outer(asia.countries,info, FUN=paste, sep='-')
# as vector() : 행렬 -> 벡터형식
as.vector(out)


res<-outer(asia.countries,asia.countries, FUN=paste, sep='-')
res
# [,1]          [,2]          [,3]         
# [1,] "Korea-Korea" "Korea-China" "Korea-India"
# [2,] "China-Korea" "China-China" "China-India"
# [3,] "India-Korea" "India-China" "India-India"

# 하삼각행렬
lower.tri(res)
res[lower.tri(res)]
!lower.tri(res)
res[!lower.tri(res)]
# 상삼각행렬
upper.tri(res)
res[upper.tri(res)]


# substr(): 텍스트에 특정 부분 문자열을 추출
substr("Data Analyics",1,4)
substr("Data Analyics",6,14)

# substring() : 텍스트의 특정 부분 문자열 추출, 끝위치 생량
substring("Data Analyics",6)

myclass<-c("Data Analyics","Data Mining", "Data Visualization")
substr(myclass,1,4)

substr(myclass,nchar(myclass)-5,nchar(myclass))

islands

class(islands)

landmasses<-names(islands)
landmasses

# grep():
# New 문자열이 포함된 단어의 인덱스를 추출
index<-grep(pattern="New", x=landmasses)
landmasses[index]

grep(pattern = "New", landmasses, value=TRUE)


# 두 개 이상의 단어로 이루어진 대륙 또는 섬을 출력

grep(pattern = " ", landmasses, value=TRUE)
landmasses[grep(pattern = " ", landmasses)]


# sub(), gsub() : 문자열 검색 -> 다른 문자열 변경
# sub함수는 처음 문자열 1개만 다른 문자열로 변경
# gsub함수는 전체를 다 찾아서 다른문자열로 변경

txt<- " Data Anal is useful. Data Anal is interesting."
sub(pattern = "Data", replacement = "Business",txt)
gsub(pattern = "Anal", replacement = "Analyist",txt)

# 확장자를 제외한 파일명만 출력 
x<-c("input.csv","data.csv","big.csv")

gsub(pattern=".csv",replacement = "",x)

#finance.yahoo.com-> samsung->Historical Data


df<-read.csv("samsung.csv", header =TRUE, sep=",")
df

df2<-read.csv("samsung.csv")
df2
# header=TRUE, sep="," 가 디폴트값

class(df)
df



# 1. Happy, Birthday, to, you로 구성된 텍스트 벡터 생성하시오
# -벡터의 길이 
# -문자 개수의 합

x<-c("Happy","Birthday","to","you")
length(x)
sum(nchar(x))

# 2. 1번 문제 벡터를 모두 연결하시오("Happy Birthday to you")
# - 텍스트 벡터의 길이
# - 문자 개수의 합을 출력하시오


x<-paste(x,collapse = " ")
x
length(x)
sum(nchar(x))


# 3. paste함수와 LETTERS 상수 벡터를 이용하여 다음 문자 벡터 생성하시오
# - "A 1" "B 2" "C 3" "D 4" "E 5"
# -"A1" "B2" "C3" "D4" "E5"

y<-c("A 1", "B 2", "C 3", "D 4", "E 5")
gsub(pattern=" ",replacement = "",y)


# 4. 단어 단위로 분할하고, 모든 쉼표와 하이픈은 제거하시오.
# c("Yesterday is history,", "That's, why we call it the present - from Kung")
z<-c("Yesterday is history,", "That's, why we call it the present - from Kung")
z
strsplit(z,split=" ") 

z<-gsub(pattern=",",replacement = "",z)
z<-gsub(pattern="-",replacement = "",z)
z<-strsplit(z,split=" ") 
z

# 5. 주민번호 뒤 일곱 자리 수를 *로 모두 대체하시오(?)
# "110101-1234123" "950102-2121212"

jumin<-c("110101-1234123", "950102-2121212")

substring(jumin,8)<-"*******"
jumin



# 6. paste함수와 month.abb를 결합하여 "Jan_1-Feb_2- ... Dec_12"를 생성하시오

paste(month.abb,1:12,sep='_',collapse='-')


# 7. read.csv(file="samsung.csv")

df<-read.csv("samsung.csv")
# 1) Open, High, Low, Close, Adj.Close, Volume 열을 추출
colnames(df)
df[,-1]

# 2) 각 열에 대해 최소값, 최대값, 평균, 표준편차 출력
apply(df[,-1],2, min)
apply(df[,-1],2, max)
apply(df[,-1],2, mean)
apply(df[,-1],2, sd)

# 3) 각 열에 대해 정규화 / 표준화
# 정규화
apply(df[,-1],2,function(x){(x-min(x))/(max(x)-min(x))})
# 표준화
apply(df[,-1],2,function(x){(x-mean(x))/sd(x)})

# 4) Low 열과 High 열 각각에 대해 최대 낙차 출력
# - High 열 최대낙차 =  Max(High(n-1)-High(n))  here, n은 특정일을 의미

High<- abs(df[,2][1:248]-df[,2][2:249])
max(High)
Low<- abs(df[,3][1:248]-df[,3][2:249])
max(Low)
