df<-read.csv("train.csv",header = T, na.strings="")
df
str(df)

View(df)

# 기술통계량 함수
install.packages("psych")
library(psych)


# 결측맵 함수가 포함된 패키지
install.packages("Amelia")
library(Amelia)

missmap(df,col=c("red","grey"))# (결측치색,다른색)


library(dplyr)
df<-select(df,Survived, Pclass, Age, Sex, SibSp, Parch)
df
missmap(df,col=c("red","grey"))

df<-na.omit(df1)
missmap(df,col=c("red","grey"))

class(df$Survived)
df$Survived<-factor(df$Survived)

df$Pclass
df$Pclass<-factor(df$Pclass,order=TRUE, levels=c(3,2,1))
df$Pclass

str(df)


# 시각화 패키지
install.packages("ggplot2")
library(ggplot2)

install.packages("GGally")
library(GGally)


df<-read.csv("train.csv",na.strings = "")
# 상관계수(cor-relation)
ggcorr(df,nbreaks = 8, label = TRUE,
       label_size = 3, color="grey50")




mtcars
str(mtcars)
#match함수를 이용한 데이터셋 결합

a<-c(1,2,3,4,5)
b<-c(2,5,7,8,9)
# 첫번째 인수 a가 두번째 인수의 몇번째 있는지 알려줌
# 없는 경우에는 NA가 반환이됨
match(a,b)
match(a,b,nomatch = 0)


car<-mtcars
car$name<-row.names(car)
head(car)
row.names(car)<-NULL
head(car)

# 145마력이 넘는 힘이 쎈 자동차 모델로만 데이터프레임을 구성
highhp.car<-car[car$hp>145,]
highhp.car

# car에서 무게가 3200파운드 미만 자동차 모델로만 데이터프레임을 구성
lightwt.car<-car[car$wt<3.2,]
lightwt.car

# 무게가 가벼우면서 힘이 쎈 자동차 모델을 출력하고자 함
index<-match(highhp.car$name,lightwt.car$name)
lightwt.car[na.omit(index),]

# match함수 대신 %in% 연산자 사용 가능
vec<-10:1
vec
7%in%vec
c(20,15,11,9,8,3,1,0) %in% vec
match(c(20,15,11,9,8,3,1,0),vec)
!is.na(match(c(20,15,11,9,8,3,1,0),vec))

#%in%연산자를 이용하여 마력 높고, 무게 낮은 차량 추출

idx<-highhp.car$name %in% lightwt.car$name
highhp.car[idx,]


# 서브셋

# $ : 데이터로부터 하나의 원소를 추출,
#     데이터프레임에 적용하면 벡터로 반환

#[[]] : 데이터로부터 하나의 원소를 추출
#     이름과 위치에 의해 원소를 선택가능,
#     리스트나 데이터프레임 모두 사용 가능

# [] : 데이터로부터 여러개의 원소를 추출

mtcars$mpg
str(mtcars)
mtcars[[1]]
mtcars[['mpg']]

mtcars[c(1,4)]
mtcars[c('mpg','hp')]

# 음수 인덱스를 사용하면 특정 원소를 제외한 서브셋 생성
mtcars[-c(2,3,5,7:11)]
#특정열 제거
mtcars[1]<-NULL
mtcars

# #음수, 양수 인덱스를 섞어서 사용 못함
#mtcars[c(-1,2)]

iris
str(iris)

data(iris)
str(iris)
# 퀴즈1
#1~4번열 추출하고 코드를 카페 업로드
iris[c(1:4)]
iris[c(1,2,3,4)]
iris[1:4]
iris[-5]


iris[,c("Sepal.Length","Sepal.Width")]

iris[,"Sepal.Length"]

iris[,"Sepal.Length",drop=FALSE]

class(iris[,"Sepal.Length",drop=FALSE])


iris["Sepal.Length"] 
#iris[,"Sepal.Length",drop=FALSE] 와 같이 데이터프레임으로 나옴

iris[,"Sepal.Length"] # 벡터로 나옴

iris[1:5] # 1~5 열데이터 전체가 추출
iris[1:5,] # 1~5 행 인덱스 데이터가 추출


iris[1:5,c("Sepal.Length","Sepal.Width")]
iris[1:5,c(1,2)] # 위와 같음


# 퀴즈2
# Sepal.Length가 7 초과한 전체 데이터를 추출

iris[iris["Sepal.Length"]>7,]
iris[iris$Sepal.Length>7,]


subset(iris,
       select=c("Sepal.Length","Sepal.Width"),
       subset = (Sepal.Length>7))







# 데이터 -> 모델 -> 예측/분류

# 모델링?
# 1)데이터를 훈련용(70%)/테스트용(30%) 으로 분할
# 2)오직 훈련용 데이터 만으로 모델(예측/분류)을 생성
# - 과적합(overfitting) : 훈련 데이터로 평가 결과 >> 테스트 데이터 평가
# - 원인 : 데이터가 부족 -> 보충, 변수가 너무 많음(고차원)->차원축소(저차원),다중공선성
# 3)테스트





# 데이터 무작위 표본 추출
# sample함수/ sample(데이터셋,표본개수,복원추출여부)
# 1~10 중에서 5개 숫자를 비복원 추출
sample(1:10,5)# 기본값 :replace=FALSE => (비복원추출)
sample(1:10,5,TRUE) # 복원추출

sample(1:10) # size 기본값 : 10개 


# sample함수 동일한 난수가 발생
#시드(seed)
# seed를 동일하게 주면, 매번 발생되는 난수가 동일하게 추출됨

# 시드값 설정
set.seed(20210303)

sample(1:10)
# 데이터 -> 일부를 추출하여 모델 생성
# ex) 데이터가 1~10번까지 10개
# 랜덤 : 1245679번 추출(훈련데이터)->모델->평가 (3,8,10번)
# 정확도 30%

set.seed(1)
sample(1:10,5,replace = TRUE)

# 데이터프레임으로부터 무작위 추출

sample(iris,3)
# 데이터프레임 행으로부터 표본추출
set.seed(1)
# 행 번호 추출
index<-sample(1:nrow(iris),5) 
iris[index,]


# 일반적으로 중복값은 제거
# duplicated() : 중복여부를 논리값으로 출력
duplicated(c(1,2,3,1,1,4,3))


id<-c("a001","a002","a003")
name<-c("mouse","keyboard","usb")
price<-c(3000,9000,5000)
product<-data.frame(id=id,name=name,price=price)
product

# c("a001","mouse",3000) 추가
product<-rbind(product,c("a001","mouse",3000))
duplicated(product)

product[!duplicated(product),]
product[-duplicated(product),]

# ! : 논리값에 대한 반전
# - : 특정 컬럼을 대상에서 제외할 때

product.uniqe<-product[!duplicated(product),]
# which(TRUE에 해당되는 index를 찾아줌), duplicated함수를 이용해서 중복위치 파악
duplicated(product)
which(duplicated(product)) #4 중복자료에 위치

# 중복행 제거
idx<-which(duplicated(product))
product.unique<-product[-idx,]
product.unique

# 중복원소 파악하지 않고, 제거만 수행
product
unique(product)

# complete.cases 함수 : 결측값 제거
#   - 결측값 여부를 TURE/FALSE로 출력
airquality
str(airquality)
complete.cases(airquality)
# 결측값이 없는 행만 추출
airquality[complete.cases(airquality),]
# 결측값이 있는 행만 추출
airquality[!complete.cases(airquality),]


airquality.nona<-airquality[complete.cases(airquality),]
str(airquality.nona)

# 호칭        나이
# 아주머니    45  
# 아저씨      47
# 아가씨      22
# 소녀        15
# 소년        16
# ...
# NA          48

airquality.nona2<-na.omit(airquality)
airquality.nona2


# cut함수 : 데이터를 구간에 따라 그룹별로 범주화
# () : 개구간
# [] : 폐구간
# (3,10) : 3초과 10미만
# [3,10] : 3이상 10이하

iris$Sepal.Width
min(iris$Sepal.Width)
max(iris$Sepal.Width)

cut(iris$Sepal.Width,breaks = c(0,1,2,3,4,5),right = FALSE)
# table(), summary() 이용하면 좋다
iris.cut1<-cut(iris$Sepal.Width,breaks = c(0,1,2,3,4,5))
table(iris.cut1)
summary(iris.cut1)


iris.cut2<-cut(iris$Sepal.Width,
    breaks = c(0,1,2,3,4,5),
    labels=(c("Smaller","Small","Medium","Big","Bigger")))
table(iris.cut2)
summary(iris.cut2)

# 구간을 자동으로 분리
cut(iris$Sepal.Width,breaks =5)
cut(iris$Sepal.Width,breaks =5, include.lowest = TRUE)
cut(iris$Sepal.Width,breaks =5, include.lowest = FALSE)


iris.cut3<-cut(iris$Sepal.Width,
               breaks = 5,
               labels=(c("Smaller","Small","Medium","Big","Bigger")),
               include.lowest = TRUE)

iris.cut3
table(iris.cut3)


# 정렬
x<-c(3,7,5,1,2,5)
sort(x)                   # 오름차순
sort(x,decreasing = TRUE) # 내림차순
length(x)
length(x)<-7
x # NA가 생김

sort(x) # NA가 안나옴
sort(x,na.last = TRUE)
sort(x,na.last = FALSE)

# order() : 정렬, 데이터프레임 정렬시 사용
y<-c(11,22,33,55,44)
order(y)
y[order(y)]



z<-c("ss","bb","ii","aa","pp")
df<-data.frame(y,z)
df

# y열을 기준으로 오름차순 정렬
df[order(df$y),]


# y열을 기준으로 내림차순 정렬
df[order(df$y,decreasing = TRUE),]

w<-c("c","c","n","n","n")
df<-data.frame(y,z,w)
df
# w열 1차 기준, y열 2차 기준

df[order(df$w,df$y),]
df[order(df$w,df$z),]

# xtfrm() : 동일하지 않은 정렬 방법을 적용하고자 한다.
# 벡터를 오름차순 정렬했을 때 순서를 나타내는 숫자벡터가 추출

df$w
xtfrm(df$w) # 숫자 벡터로 변환해주네

# w열을 기준으로 내림차순, y열 기준으로 오름차순
order(xtfrm(df$w))
index<-order(-xtfrm(df$w),df$y)
df[index,]


# quiz3
# iris의 종 (species)별로 1차 내림차순 정렬, Sepal.Length기준으로 오름차순정렬

iris$Species
idx<-order(-xtfrm(iris$Species),iris$Sepal.Length)
iris[idx,]






# 1. mtcars데이터 weight열 추가, 무게가 중위수보다 큰 자동차는 heavy, 그렇지 않은 자동차는 light를 저장
# - 각 종류별 데이터 건수 출력, 비율

car<-mtcars
car$weight<-cut(car$wt,
    breaks = 2,
    labels = (c("heavy","light")))
car
str(car$weight)
table(car$weight)



# 2. mtcars 데이터셋 열들이 왼쪽에서 오른쪽으로 오름차순으로 배치되도록 작성


# 3. iris데이터에서 70% 데이터를 무작위 표본추출
sample((nrow(iris)*0.7))

# 4. ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라는 데이터가 포함되어 있음. 
# midwest 데이터를 사용하여,
# 불러오기 : midwest<-as.data.frame(ggplot2::midwest)

# - ggplot2 의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악
ggplot2::midwest
midwest<-as.data.frame(ggplot2::midwest)
midwest
str(midwest)

# - poptotal(전체 인구)을 total 로, popasian(아시아 인구)을 asian 으로 변수명을 수정
midwest<-rename(midwest,total=poptotal,asian=popasian)
colnames(midwest)

# - total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수 생성

midwest$asian_rate <- (midwest$asian / midwest$total) * 100
midwest$asian_rate

# - 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수 생성
mean1<-mean(midwest$asian_rate)
midwest$mean1 <- ifelse(midwest$asian_rate > mean1,
                           "Large", "Small")
midwest$mean1

# - "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도수를 출력
table(midwest$mean1)


# 5. 타이타닉 데이터 분석

# -타이타닉 데이터 불러오기
titanic<-read.csv("train.csv",header = T, na.strings="")
titanic
# - 생존자 수, 사망자 수 출력
colnames(titanic)
table(titanic$Survived)
# - pclass, embarked 별 승객수 출력(비율)
table(titanic$Pclass)
table(titanic$Embarked)
str(titanic)

# - Name에서 호칭 종류 출력, 호칭 종류 별 승객수 출력
titanic$Name
# - 호칭을 아래와 같이 변경하여 name2열에 추가
# * "Mlle", "Ms", "Lady", "Dona" 는 "Miss"로 변경
# * "Mme"는  "Mrs"로 변경
# * "Capt", "Col", "Major", "Dr", "Rev", "Don",  "Sir", "the Countess", "Jonkheer"는 "Officer"로 변경
# * "Mr", "Mrs", "Miss"는 그대로
# * 나머지 호칭은 "Others"
name2<-titanic$Name

name2 <- gsub("^.*,(.*?)\\..*$", "\\1", name2)
name2
table(name2)

name2<-gsub("Mlle|Ms|Lady|Dona","Miss",name2)
table(name2)
name2<-gsub("Mme","Mrs",name2)
table(name2)
name2<-gsub("Capt|Col|Major|Dr|Rev|Don|Sir|the Countess|Jonkheer","Officer",name2)
table(name2)
name2<-gsub("Master","Others",name2)
table(name2)
titanic$name2<-name2

# -name2 열을 factor로(5가지 범주) 변환
titanic$name2<-as.factor(titanic$name2)
str(titanic$name2)

# -name2열의 호칭별 인원수 출력

table(titanic$name2)
# -호칭 정보를 바탕으로 나이(Age) 결측값 대체(호칭 별 나이의 평균값)
mean.Miss<-mean(titanic$Age[titanic$name2=="Miss."], na.rm=T)
mean.Mrs<-mean(titanic$Age[titanic$name2=="Miss."], na.rm=T)
mean.Officer<-mean(titanic$Age[titanic$name2=="Officer."], na.rm=T)
mean.Others<-mean(titanic$Age[titanic$name2=="Others."], na.rm=T)
mean.Mr<-mean(titanic$Age[titanic$name2=="Mr."], na.rm=T)

titanic$Age[titanic$name2=="Miss." & is.na(titanic$Age)] <- mean.Miss
titanic$Age[titanic$name2=="Mrs." & is.na(titanic$Age)] <- mean.Mrs
titanic$Age[titanic$name2=="Officer." & is.na(titanic$Age)] <- mean.Officer
titanic$Age[titanic$name2=="Others." & is.na(titanic$Age)] <- mean.Others
titanic$Age[titanic$name2=="Mr." & is.na(titanic$Age)] <- mean.Mr

titanic$Age

# -age열의 구간별 인원수 출력
# 10대 미만, 10대, 20대, 30대, 40대, 50대 이상
max(titanic$Age, na.rm=T) #80
titanic.cut<-cut(x=titanic$Age,
                 breaks = c(0,10,20,30,40,50,81),
                 labels= c("10대 미만", "10대", "20대", "30대", "40대", "50대 이상"),
                 right=FALSE )

table(titanic.cut)

# -cabin 컬럼의 1번째 글자 출력(NA는 제외)
substr(titanic$Cabin[!is.na(titanic$Cabin)],1,1)


# - fare열 값에 대해 최대/최소/평균/표준편차 출력
max(titanic$Fare)
min(titanic$Fare)
mean(titanic$Fare)
sd(titanic$Fare)


# - sibsp + parch를 더하여 새롭게 family열에 저장
titanic$family<-titanic$SibSp+titanic$Parch
titanic















