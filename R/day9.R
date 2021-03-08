iris.copy<-iris
class(iris.copy$Species)# factor

# character 타입으로 변경
class(as.character(iris.copy$Species))# character


iris.copy$Sepal.Ratio<-iris.copy$Sepal.Length/iris.copy$Sepal.Width
head(iris.copy)

# 파생변수 추가
# transform함수 : 변수(피처)를 변환

iris.copy<-iris
iris.trans<-transform(iris.copy,
          Species=as.character(Species),
          SepalRatio=Sepal.Length/Sepal.Width
          )
iris.trans


# apply family
# apply(), lapply(), sapply()

# apply() : 적용하고자하는 데이터가 행렬 or 배열일 때 사용가능
# 결과유형 : 벡터, 행렬 

x<-1:20
dim(x)<-c(4,5)
x

apply(x,1,max)


x<-1:24
dim(x)<-c(4,3,2)
x
apply(x,1,paste)
# margin 1-> 행단위, 2-> 열단위, 3->면단위
apply(x,1,paste,collapse=",")
apply(x,2,paste,collapse=",")
apply(x,3,paste,collapse=",")

apply(x,c(1,2),paste,collapse=",")


class(apply(x,1,paste,collapse=",")) # character


# 타이타닉, 4차원 데이터 형식으로 저장
Titanic
str(Titanic)

# 등급별 탑승인원을 파악
apply(Titanic,1,sum)

# 성별(두번째 차원) 탑승인원 파악
apply(Titanic,2,sum)

# 연령별(세번째 차원) 탑승인원 파악
apply(Titanic,3,sum)

# 생존자별(네번째 차원) 탑승인원 파악
apply(Titanic,4,sum)


# 승객 등급별 생존자 통계가 알고 싶다면?
apply(Titanic,c(1,4),sum)



# lapply(),sapply()
# :  l이 list의 약자,s는 simplify의 약자
# 데이터가 리스트or벡터일때 사용
# 인수가 2개, 첫번째 인수에 데이터, 두번째 인수에 함수를 지정
# lapply함수결과 : 항상 리스트형식으로 반환
# sapply함수결과 : 벡터 또는 행렬로 단순화해서 반환
# 벡터는 길이가 1, 행렬은 길이가 2이상 이면서 모두 같은 경우

# sapply사용시 길이가 2이상이면서 서로 다른경우에는 리스트로 출력

# 길이가 다를때 예시
exams<-list(s1=c(80,70,60,50,100),
     s2=c(80,70,60,50),
     s3=c(30,70,60,50,100,90),
     s4=c(80,70,60,50,100))
exams

lapply(exams, length)
# 출력결과가 list형식으로 나옴, 결과값들의 길이가 1이다

sapply(exams, length)
# 출력결과가 vector로 나옴, 길이가 모두 1로 동일하기 때문에


lapply(exams, mean)# list
sapply(exams, mean)# vector

lapply(exams, sd)# list
sapply(exams, sd)# vector

lapply(exams, range) # list
sapply(exams, range) # 이건 행렬로 나오네 (길이가 모두 2로 동일)

# lapply,sapply는 데이터프레임에 대해 사용가능

iris
lapply(iris, class)
sapply(iris, class)

#sapply(iris, mean)
sapply(iris, function(X) ifelse(is.numeric(x), mean(x), NA))



# mapply()는 적용함수가 벡터연산을 지원하지 않을 때 유용하게 사용
# mapply(함수,)
mapply(rep,1:4,4:1)
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))# 위랑 같음음

# 집단 요약
# 1.우선 벡터를 집단별로 분할(split, unstack)
car<-mtcars
car<-within(car,
       am<-factor(am,
              levels = c(0,1),
              labels = c("Automatic","Manual"))
       )

str(car)

# data("mtcars")
# car<-mtcars

# mpg를 변속기 종류(2가지)에 따라 분할
g<-split(car$mpg,car$am)
g

# 집단별 mpg평균
class(g)

g[[1]]
mean(g[[1]])
mean(g[["Manual"]])
sapply(g,mean)

# split과 유사한 unstack함수
data.frame(car$mpg,car$am)
unstack(data.frame(car$mpg,car$am)) # (분할할 벡터, 집단 변수기준?)


data.frame(iris$Sepal.Length,iris$Species)
gg<-unstack(data.frame(iris$Sepal.Length,iris$Species))
str(gg)



# 왜 똑같이 했는데 둘의 구조가 다를까 ?

# unstack함수는 
# 그룹별로 분할된 데이터의 길이가 동일하면 데이터프레임
# 동일하지않으면 리스트로 출력
g1<-unstack(data.frame(car$mpg,car$am))
g2<-unstack(data.frame(iris$Sepal.Length,iris$Species))

summary(g1)
summary(g2)
# summary함수는 데이터프레임에 대해 기술통계를 구해주는 함수


# 그룹 분할 작업 -> 그룹별 연산 작업
# 위 작업을 동시에 진행하겠다면...

# tapply(), aggregate(), by()

# tapply(데이터 벡터, 그룹 팩터, 그룹별 연산 함수) : 3개 인수,

tapply(iris$Sepal.Length, iris$Species, mean)
# iris의 종별 꽃받침의 길이에 대한 평균

tapply(iris$Sepal.Width,iris$Species, length)
# iris의 종별 꽃 데이터의 개수를 출력


str(car)
# 실린더(cyl) 개수별 am 유형별 조합에 따른 mpg평균
#     a   m
# 4
# 6
# 8

tapply(car$mpg, list(car$cyl,car$am), mean)
with(car,tapply(mpg, list(cyl,am), mean))# 같은값


# aggregate(집계 함수)
# : 그룹별로 각각의 함수를 적용할 수 있게 해주는 함수
# aggregate(벡터, 집단을 나타내는 변수를 리스트형태로, FUN)
with(car, aggregate(mpg,list(Cylinder=cyl,Transmission=am),mean))

# car[c(1:6)] 변수의 평균, 실린더의 개수와 변속기 유형의 조합에 따라서

aggregate(car[c(1:6)],list(Cylinder=car$cyl,Transmission=car$am),mean)


# aggregate함수 사용하여 아이리스 꽃 종류별 측정 변수별 (4개)요약

aggregate(iris[c(1:4)],list(Species=iris$Species),mean)

# by함수 : 데이터프레임을 그룹별 데이터를 처리
by(iris,iris$Species,summary)

by(iris,iris$Species,function(x) mean(x$Sepal.Length))



rowsum(iris[-5],iris$Species)

# 범주별 관측값 개수
tabulate(car$gear)
1:length(tabulate(car$gear))

gc<-tabulate(car$gear)
names(gc)<-1:length(tabulate(car$gear))
gc

table(car$gear)
table(car$am,car$gear)

# xtabs함수 : table함수와 거의 동일, 포뮬러 사용
xtabs(~am,data=car)
xtabs(~am+gear,data=car)

# 포뮬러란,
# 데이터 처리시 어떤 열을 사용할 것인지를 나타낸 수식

aggregate(mpg~cyl+am,car,mean)

# cyl와 am유형별 mpg열의 평균을 구하시오
with(car,aggregate(mpg,list(cyl=cyl,am=am),mean))


# dplyr : 분할(S)-적용(A)-결합(C)
# 작업을 수월하게 할 수 있도록 도움을 주는 라이브러리
library(dplyr)
airquality
air<-filter(airquality,Month ==6)
head(air)

airquality[airquality$Month==6,]

subset(airquality,
       subset = (Month==6))
# 같은표현


air<-filter(airquality,Month==6,Temp>90) # ,는 and연산
air


air<-filter(airquality,Month==6 & Temp>90)
air


air<-filter(airquality,Ozone>80|Temp>90)
air




# 1. Survived 열 요약
# - 생존자/사망자 전체 비율
titanic<-read.csv('train.csv',na.strings = '')
prop.table(table(titanic$Survived))

# - 성별에 따른 생존자/사망자
with(titanic, tapply(Survived, list(Sex), mean))


# 2. Pclass 열 요약
# - 등실 비율
prop.table(table(titanic$Pclass))

# - 등실에 따른 생존자/사망자 비율
with(titanic, tapply(Survived, list(Pclass), mean))

# 3. Age 열
# - 나이대를 구분한 후, 각 나이대별 생존율
age_cut<-cut(titanic$Age,
                     breaks=c(0,10,20,30,40,50,81),
                     right=FALSE,
                     labels=c("10대미만", "10대", "20대", "30대", "40대","50대이상"))

prop.table(table(age_cut,titanic$Survived),1)

# 4. Fare 열
# - 운임을 전체 5개 구간으로 분리한 후,
# 각 구간별 생존율

fare_cut<-cut(x=titanic$Fare, 
                   breaks = 5,
                   include.lowest=TRUE)
prop.table(table(fare_cut,titanic$Survived),1)


# 5. Name 열 
# - 호칭을 제외한 이름에서 자음과 모음의 비율
# - 성별에 따른 자음과 모음의 비율


spl_name <- tolower(gsub('[^[:alpha:]]','',titanic$Name))
spl_name<-strsplit(spl_name,'')
class(spl_name)

모음 <- lapply(spl_name, grep, pattern = "[a,e,i,o,u]", value = TRUE)

자음 <- lapply(spl_name, grep, pattern = "[^a,e,i,o,u]",value = TRUE)

모음<-unlist(모음)
자음<-unlist(자음)
prop.table(rowSums(c("모음","자음")),1)
proportions(colSums(c("모음","자음")))
# 6. Embarked 열
# - 각 승선 항구별 생존율



