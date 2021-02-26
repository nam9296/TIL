id<-c("a1","a2","a3")
name<-c("X","y","z")
price<-c(1000,2000,3000)
product<-data.frame(id,name,price,stringsAsFactors = FALSE)
product
str(product)

# a4,s,4000을 추가
product<-rbind(product,c("a4","s",4000))
product

new.rows<-data.frame(id=c("a5","a6"),
           name=c("i","j"),
           price=c(5000,6000))

# 주의사항 : 열 이름이 동일해야함
product<-rbind(product,new.rows)


# cbind(): 새로운 열을 추가
cbind(product,madein=c("kor","chi","chi","kor","kor","usa"))
# 다른 방법
product$madein<-c("kor","chi","chi","kor","kor","usa")

# 두개 이상의 열을 추가
new.cols<-data.frame(manu=c("aa","bb","aa","cc","aa","bb"),
           quantity=c(10,20,30,20,10,25))
new.cols           

product<-cbind(product,new.cols)
product


df1<-data.frame(sex="f",months=1, weight=3.5)
df2<-data.frame(sex="m",months=3, weight=4.5)
df3<-data.frame(sex="m",months=4, weight=5.5)
df4<-data.frame(sex="f",months=7, weight=6.5)
df5<-data.frame(sex="f",months=8, weight=7.5)
lst<-list(df1,df2,df3,df4,df5)
lst

lst[1] # list형식
lst[[1]] # data.frame 형식

str(lst[[1]])

rbind(lst[[1]],lst[[2]])

# rbind(lst[[1]],lst[[2]],...,lst[[120]])
# do.call(적용하고자하는 함수,리스트) 
#: 리스트 내의 여러 개 데이터 프레임을 합치는 작업
do.call(rbind,lst)


lst1<-data.frame(sex="f",months=1, weight=3.5)
lst2<-data.frame(sex="m",months=3, weight=4.5)
lst3<-data.frame(sex="m",months=4, weight=5.5)
lst4<-data.frame(sex="f",months=7, weight=6.5)
lst5<-data.frame(sex="f",months=8, weight=7.5)

lst<-list(lst1,lst2,lst3,lst4,lst5)
lst

# lst에 저장되어 있는 리스트들을 묶어서 하나의 데이터프레임으로 생성
#do.call(rbind,lst)
#lst[1]<-as.data.frame(lst[1]) # 리스트-> 데이터프레임
#lst[2]<-as.data.frame(lst[2])
#...
#lst[5]<-as.data.frame(lst[5])
#이렇게 해도되긴하지만 자료가 많으면 가능한 작업이 아니다.

# lapply(): 첫번째 인수에는 리스트, 적용 함수(반복)
lapply(lst, as.data.frame) 
# lst(리스트)에 저장되어 있는 각 원소에 대해 
# as.data.frame를 반복해서 적용해라


do.call(rbind,lapply(lst, as.data.frame))
# lst(리스트)에 저장되어 있는 각각의 요소에 대해
# as.data.frame 함수를 적용하고, 변환된 데이터프레임들을
# rbind함수를 모두 적용하여 하나의 데이터프레임으로 연결

# merge함수 : 데이터 프레임을 결합하는 함수

state.x77
class(state.x77) # matrix

states<-data.frame(state.x77)
states
str(states)

row.names(states) # 행이름 추출

#행이름들을 열의 요소로 추가하고싶다.
states$name<-row.names(states)
states
colnames(states)
#요소로 추가했으니 행이름을 지우자
row.names(states)<-NULL
states
head(states)
tail(states)
tail(states,10)

#states에서 Income이 5000달러 이상에 해당되는 자료를 출력
states[states$Income>5000,"name"]
states[states$Income>5000,c("name","Income")]

#states에서 Area이 100000 이상에 해당되는 자료를 출력(name, Area)
states[states$Area>100000,c("name","Area")]




#데이터프레임 결합(기본값:공통으로 열(name)이 일치하는 행만 선택:조건이있다면 두조건을 만족하는 열만 출력)
merge(rich.states, large.states) #all=FALSE default

#         name Income   Area
# 1     Alaska   6315 566432
# 2 California   5114 156361
# 3     Nevada   5149 109889

merge(rich.states, large.states,all=TRUE)
#  Area의 조건에는 만족하지만 income에 적용된 조건에는 만족이아니라면 NA로 출력이되고 반대상황도 마찬가지

#            name Income   Area
# 1        Alaska   6315 566432
# 2       Arizona     NA 113417
# 3    California   5114 156361
# 4      Colorado     NA 103766
# 5   Connecticut   5348     NA
# 6      Illinois   5107     NA
# 7      Maryland   5299     NA
# 8       Montana     NA 145587
# 9        Nevada   5149 109889
# 10   New Jersey   5237     NA
# 11   New Mexico     NA 121412
# 12 North Dakota   5087     NA
# 13        Texas     NA 262134

#subset(적용할곳,조건식):행과 열을 선택

states[states$Income>5000,]
# 위아래 둘다 결과가 같습니다
subset(states,Income>5000) 
#stateds집합에서 Income>5000조건을 만족하는 부분집합을 추출

subset(states, subset=(Income>5000 & Area>50000),select=1:3) 
#&,| 적용가능
#select에는 이름도 올수 있음
#두가지 시에는 c(Income, Illit eracy)

#name이 알래스카인 모든 행을 추출
subset(states, name=="Alaske")

mtcars
#mpg가 30보다 큰 자동차 데이터 출력
#1
mtcars[mtcars['mpg']>30,]
#2
subset(mtcars,mpg>30)
subset(mtcars,subset=mpg>30)

#mpg가 30보다 큰 자동차 데이터 출력

subset(mtcars,subset=mpg>30, select = mpg)

#실린더(cyl)가 4개 이면서 am이 0인 자료의 mpg,hp,wt를 출력


subset(mtcars,subset= (cyl==4 & am==0), select = c(mpg,hp,wt))
#                mpg hp    wt
# Merc 240D     24.4 62 3.190
# Merc 230      22.8 95 3.150
# Toyota Corona 21.5 97 2.465
subset(x=mtcars,subset=(mpg>mean(mpg)), select = c(mpg,hp,wt))
subset(mtcars,subset=(mpg>mean(mpg)), select = c(mpg,hp,wt))
subset(mtcars,mpg>mean(mpg), c(mpg,hp,wt))




iris
class(iris)
colnames(iris)
# subset함수 Sepal.Width, Petal.Length 열을 추출
subset(iris, select = c(Sepal.Width, Petal.Length))

subset(iris, select = -c(Sepal.Width, Petal.Length))

subset(iris, select = -Sepal.Width)


# iris Sepal.Length와 Sepal.Width간 비율
iris$Sepal.Length/iris$Sepal.Width
# 특성공학(feature engineering)
# 주어진 데이터 컬럼으로 부터 연산을 수행하여 새로운 컬럼값을 생성 
with(iris,Sepal.Length/Sepal.Width)

#with(iris,{
  #명령문 기술
#})

# 기술 통계
summary(iris$Sepal.Length)

with(iris,{
  print(summary(Sepal.Length))
  #plot(Sepal.Length,Sepal.Width)
  #plot(Petal.Length,Petal.Width)
})


with(iris,{
  stats<-summary(Sepal.Length)
  stats
})

#stats
# with 구문 밖에서는 stats객체 에러가 나옴

with(iris,{
  stats<<-summary(Sepal.Length)
  stats
})
stats

# <<- 를 사용하니 밖에서도 된다.


iris$Sepal.Ratio<-iris$Sepal.Length/iris$Sepal.Width

iris<-within(iris,Sepal.Ratio<-Sepal.Length/Sepal.Width)
iris

# with, within 거의 동일하다.(코드의 양을 줄여줌)
# 차이점은 within은 데이터 수정이 가능
# with는 데이터 수정 불가능

within(iris,{
  ifelse(is.na(Sepal.Ratio),median(Sepal.Ratio,na.rm=T),Sepal.Ratio)
})
# Sepal/Ratio열의 값이 na-> 중앙값으로 대체




#ifelse(is.na(Sepal.Ratio),median(Sepal.Ratio,na.rm=T),Sepal.Ratio)
#            조건                참                         거짓

#sqldf 패키지 : SQL 명령문을 사용할 수 있음
install.packages("sqldf") #패키지 설치
library(sqldf)# 설치된 패키지를 프로그램에서 불러오기

#SQL(Structured Query Language) : 
# 데이터 베이스에 데이터를 검색/수정/삭제/추가 작업을
# 수행할 수 있도록 해주는 사전에 약속된 데이터베이스 표준 질의어
#검색(select)/수정(update)/삭제(delete)/추가(insert into)
mtcars
sqldf("select*from mtcars")
# ㄴ>mtcars에 저장되어 있는 모든(*) 데이터를 추출하시오를 의미
# 검색 = select 추출 컬럼 1,....,추출 컬럼n from table이름

sqldf("select cyl from mtcars")

sqldf("select cyl, hp, gear from mtcars")

sqldf("select cyl, hp, gear from mtcars", row.names=TRUE)

mtcars
sqldf("select * from mtcars", row.names=TRUE)

sqldf("select * from mtcars where mpg>30", row.names=TRUE)

sqldf("select * from mtcars where mpg>30 order by hp", row.names=TRUE)

sqldf("select avg(mpg) as avg_mpg from mtcars where mpg>30 group by cyl", row.names=TRUE)




state.x77
class(state.x77) # 배열열
st<-state.x77
# st를 데이터프레임으로 바꾸세요
st<-data.frame(st)
colnames(st)
rownames(st)

# 차원?
dim(st) # 50개, 변수(피처) 8개

rowSums(st)
rowMeans(st)


library(MASS)
head(cats)



# 1.다음 물음의 답을 R 언어로 나타내시오.
# 
# ① 자료 -0.2, 1, 2, 1.5, 2.2를 자료벡터로 x로 저장하라.
x<-c(-0.2,1,2,1.5,2.2)
# ② "Kim", "Lee", "Park", "Lim"을 자료벡터 name으로 저장하라. 
name<-c("kim","Lee","Park","Lim")
# ③ 2부터 9까지의 정수벡터를 생성하라.
2:9
# ④ 0부터 10까지 0.5씩 증가하는 실수 벡터를 생성하라.
seq(from=0,to=10, by=0.5)
# ⑤ 정수 1,2,3이 3번 반복하는 벡터를 생성하라.
rep(c(1,2,3),times=3)


# 2.x=c(2, -1, 3, 7, 0.5, 8)가 실행되었다 하자. 다음 물음을 R 언어로 답하시오.
x=c(2, -1, 3, 7, 0.5, 8)
x
# ① 5번째 원소는?
x[5]
# ② 첫 번째부터 3번째까지의 원소는?
x[1:3]
# ③ 6, 2, 4번째 원소를 동시에 찾아라.
x[c(6,2,4)]
# ④ 3번째 원소를 제외한 나머지 원소는?
x[-3]
# ⑤ x의 원소 중 0보다 큰 값을 찾아라.
x[x>0]
# ⑥ 짝수 원소들을 찾아라.
x[x%%2==0]
# ⑦ x에서 홀수원소를 찾아 제거하라.
x[x%%2==1]<-NA
x[is.na(x)==FALSE]


# 3.패키지에 내장된 데이터 cats는 다음 3개의 변수로 구성되어 있다.
# library(MASS) # MASS패키지를 로드
# head(cats)    # cats데이터프레임의 앞 줄 보기

library(MASS)
head(cats)
# -생쥐 자료(cats)의 자료의 수를 구하시오
nrow(cats)
# -생쥐의 몸무게와 심장의 무게(Bwt와 Hwt)의 평균과 표준편차를 구하라.
# 몸무게 평균과 표준편차
mean(cats$Bwt)
sd(cats$Bwt)
# 심장의 무게 평균과 표준편차
mean(cats$Hwt)
sd(cats$Hwt)
# -생쥐의 암수별 몸무게와 심장의 무게의 평균과 표준편차를 각각 구하라.

# 4. 벡터 d1, d2가 다음과 같을 때 각 문제를 수행하기 위한 코드를 작성하고 답을 구하시오.
d1 <- 1:50
d2 <- 51:100

# d1, d2의 값을 출력하시오.
d1
d2
# d2의 길이(원소의 개수)를 보이시오.
length(d2)
# d1+d2, d2-d1, d1*d2, d2/d1의 각각의 결과를 출력하시오.
d1+d2
d2-d1
d1*d2 
d2/d1
# d1, d2의 값들의 합을 각각 출력하시오.
sum(d1)
sum(d2)
# d1, d2에 있는 모든 값들의 합을 출력하시오.
sum(c(d1,d2))
# d2에서 가장 큰 값과 가장 작은 값을 출력하시오.
min(d2)
max(d2)
# d2와 d1의 값들의 평균값을 각각 구하고 두 평균의 차이를 출력하시오.
mean(d1)
mean(d2)
abs(mean(d1)-mean(d2))


# 5.다음과 같이 벡터 v1을 생성한 다음 각 문제를 수행하기 위한 코드를 작성하고 답을 구하시오
# (문제를 풀다 보면 v1의 내용이 변경되기도 하는데, 모든 문제는 최초의 v1을 대상으로 하여 해결 할 것).
# v1<- 30:100 벡터 생성 후,
v1<-30:100 
# v1에서 60보다 작은 수를 모두 출력하시오.
v1[v1<60]
# v1에서 70보다 작은 수가 몇 개인지 출력하시오.
length(v1[v1<70])
# v1에서 65보다 큰 수들의 합을 출력하시오.
sum(v1[v1<65])
# v1에서 60보다 크고 73보다 작은 수를 모두 출력하시오.
v1[v1>60&v1<73]
# v1에서 65보다 작거나 80보다 큰 수를 모두 출력하시오.
v1[v1<65|v1>80]
# v1에서 7로 나누었을 때 나머지가 3인 수를 모두 출력하시오.
v1[v1%%7==3]
# v1에서 7의 배수들은 값을 0으로 변경하시오.
v1[v1%%7==0]<-0
v1
# v1에서 짝수를 모두 합한 값을 출력하시오.
v1 <- 51:90
sum(v1[v1%%2==0])
# v1에서 홀수이거나 80보다 큰 수를 모두 출력하시오.
v1[v1%%2==1|v1>80]
# v1에서 3과 5의 공배수를 출력하시오.
v1[v1%%3==0|v1%%5==0]
# v1에서 짝수에 대해서만 2를 곱하여 저장하시오.
v1[v1%%2==0]<-v1[v1%%2==0]*2
# v1에서 7의 배수들을 제거한 후 v1의 내용을 출력하시오.
v1[v1%%7==0]<-NA
v1[is.na(v1)==FALSE]

# 6. iris데이터에서
# Sepal.Length Sepal.Width Petal.Length Petal.Width 값이 각각 
# (4.0, 3.0, 1.5, 0.15)일때 예상되는 종(setosa, verisicolor, virginica)을 출력하시오
# (4.0, 3.0, 1.5, 0.15)와 가장 유클리디안 거리가 가까운 데이터를 9개 찾아낸다
# 9개의 데이터에 대한 종별 빈도수를 기반으로 유추
# ex) setosa:6, veri:2, vir:1 => setosa 예상
iris
ex <- c(4.0, 3.0, 1.5, 0.15)
iris<-(rbind(iris,ex))
tail(iris)

temp <- t(iris[1:4])
iris$distance <- sqrt(colSums((temp-ex)^2))
table(head(iris[order(iris$distance),],9)$Species)


iris
# data(iris) 원래 데이터로 돌이키고싶을 때
iris


# 표준화(평균:0, 표준편차:1)
# 표준화 = (각 열 data- 각 열 평균)/ 각 열 표준편차

# 정규화(0~1)
# 정규화 =(각 열 data- 각 열 최솟값)/ (각 열 최댓값 - 각 열 최소값)


misl<-mean(iris$Sepal.Length)
misw<-mean(iris$Sepal.Width)
mipl<-mean(iris$Petal.Length)
mipw<-mean(iris$Sepal.Width)

sisl<-sd(iris$Sepal.Length)
sisw<-sd(iris$Sepal.Width)
sipl<-sd(iris$Petal.Length)
sipw<-sd(iris$Sepal.Width)

# 표준화 = (각 열 data- 각 열 평균)/ 각 열 표준편차
misl
dim(t(iris[1:4]))

tempIris<-t(iris[1:4])
tempIris


siris<-(tempIris-c(misl,misw,mipl,mipw))/c(sisl,sisw,sipl,sipw)
siris

t(siris)





# 사실 위 과정은 다른걸로 이용할 수 있음
# scale 함수를 이용한 표준화

data(iris)
scale(iris[,1])

data(iris)
#sd(iris[,1])

head(iris[,1]-mean(iris[,1]))/sd(iris[,1])
head(scale(iris[,1])) #둘이 동일함

class(head(iris[,1]-mean(iris[,1]))/sd(iris[,1])) # vector
class(head(scale(iris[,1])) ) # matrix



# 정규화
(iris[,1]-min(iris[,1]))/ (max(iris[,1])- min(iris[,1]))

# iris의 1번째 열에 대한 표준화
(iris[,1] - mean(iris[,1])) / sd(iris[,1])

scale(iris[,1])


cbind(iris, scale=scale(iris[,-5]))

# apply(데이터, 행(1)/열(2), 함수)
apply(iris[,-5],2,scale) # 열단위로 한것
apply(iris[,-5],1,scale) # 행단위로 한것

# 다음시간에 배울예정임 참고하길바람
apply(iris[,-5],2,function(x){(x-mean(x))/sd(x)})
# 데이터에 na가 있다면
siris<-apply(iris[,-5],2,function(x){(x-mean(x,na.rm=TRUE))/sd(x,na.rm=TRUE)})

cbind(iris,siris)





# 정규화
apply(iris[,-5],2,function(x){(x-min(x,na.rm=TRUE))/(max(x,na.rm=TRUE)-min(x,na.rm=TRUE))})

cbind(iris,ss=scale(iris[,-5]))
scale(iris[,-5])



#sd(iris[,-5])
#var(iris[,-5])
#mean(iris[,-5])  에러 나올때 사용하면 좋음

apply(iris[,-5],2,sd)
apply(iris[,-5],2,var)
apply(iris[,-5],2,mean)



