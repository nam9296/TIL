# 배열
# - 행렬의 일반화된 데이터 형식, 차원을 속성으로 갖는 벡터
# 벡터(1차원), 행렬(2차원) 모두 배열이라고 할 수 있음
# dim함수로 배열 생성


a<-1:24
dim(a)<-c(3,4,2) # 3행 4열 3차원 2개의 면
a

# array함수 : 다차원 배열 생성

ary<-array(1:24,c(3,4,2))
ary
ary[1,3,2]
ary[1,,]
ary[,1,]
ary[,,2]

#ary배열의 2번째 면에 있는 1번 열의 값을 추출
ary[,1,2]

#2차원 행렬로 출력
ary[,1,2,drop=FALSE]



# list() : 리스트 
# 다양한 데이터 타입을 저장할 수 있음
# 벡터와 행렬은 원소의 데이터 타입이 모두 같아야함
lst<-list(0.6,0.9,0.5)
lst
# [[1]]은 원소의 위치(인덱스)를 의미
# [1]0.6은 원소의 값
# 리스트는 스칼라, 벡터(숫자/문자), 행렬, 함수 저장 기능

lst<-list(1.5, "apple", c(2,3,4), matrix(1:6,ncol=3), mean)
lst
lst[[1]]<-1.5
lst[[2]]<-"apple"
lst[[3]]<-c(2,3,4)
lst[[4]]<-matrix(1:6,ncol=3)
lst[[5]]<-mean()
lst

lst<-list(0.6,0.9,0.5)
lst
names(lst)<-c("n1","n2","n3")
lst
# 이름을 주면 [[1]]형식이 $이름으로 변경됨

lst$n1

lst
names(lst)
length(lst)

# lst[[n]]
#:lst리스트의 n번째 원소가 선택, 원소의 저장 형식을 그대로 가지고 출력함

#lst[n]
# : n번째 원소가 선택, 원소가 리스트 형식으로 출력이 됨.

product<-list("a001","mouse",30000)
product
product[[3]]
product[3]

# class()
# 타입을 확인하는 함수
class(product[[3]])# numeric
class(product[3]) # list

product[[3]]*0.9
# product[3]*0.9 는 숫자가 아니므로 에러발생

# 2개 이상의 리스트 요소를 한꺼번에 참조, 참조 결과는리스트
product
product[c(1,2)]

product[c(TRUE,FALSE,TRUE)]


product[-1]


# 이름을 지정하기
product<-list(id="a001",name="mouse",price=30000)
# 1.
product$name
# 2.
product[["name"]]


# 두개 이상의 원소 참조, 결과는 리스트
product[c("name","price")]


product[["name"]]
# product[["nn"]] 없는 이름으로 하면 NULL
# product[[4]]에러발생

lst<-list(one=1,two=2,three=list(a=3.1,b=3.2))
lst

lst[["three"]]
lst$three
# 3번째 요소를 추출, 추출 결과 또한 리스트

lst$three$a
lst[["three"]][["a"]] # 벡터
lst[["three"]]["a"] # 리스트

# 리스트 조작 : [[]], $ 기호 사용하여 요소 접근
product<-list(id="a001",name="mouse",price=30000)

# product[["price"]]<-50000
# product[[3]]<-50000
# product$price<-50000


product[3]
class(product[3])
# product[3]<50000
# 값을 1개만 할당할 때는 [[]],[] 둘다 사용가능



# 하나의 원소에 여러 개의 값을 할당할 때는 [[]] 와 []는 다름
product<-list(id="a001",name="mouse",price=30000)
# [[]]는 할당되는 데이터가 벡터형식
# []는 할당하고자 하는 값을 리스트형식으로 변환해야함

product[[3]]<-c(40000,50000)
product

# product[3]<-c(20000,30000) 에러
product[3]<-list(c(20000,30000))
product

# 두개 이상의 원소 값들을 동시에 변경할때는 []사용
product[1:2]
product[1:3]<-list("a02","monitor",999)
product


product[[4]]<-c("domestic","export")
product

product$madein<-c("korea","india")
product

product[["madein2"]]<-c("ac","ext")
product




#리스트에 여러개 원소를 한번에 추가(리스트 구조로 저장,타입이 모두 같은 경우에는 벡터 구조도 가능)

product[8:10]<-list(0.1,0.2,"0.3")
product

product[8:10]<-list(0.1,0.2,0.3)
product


product[11:13]<-c(0.1,0.2,0.3)
product

product[11:13]<-list(0.1,0.2,"0.3")
product

n<-c("one","two","three")
v<-c(100,200,300)
mylist<-list()
mylist[n]<-v
mylist

# 리스트에서 원소 제거는 NULL을 할당
mylist[["two"]]<-NULL
mylist

mylist[c("one","three")]<-NULL
mylist


n<-c("one","two","three")
v<-c(100,200,300)
mylist<-list()
mylist[n]<-v
mylist

# 조건에 따른 원소 제거
mylist<200
mylist[mylist<200]
mylist[mylist<200]<-NULL
mylist


# 리스트 결합 (벡터결합과 같다)

w1<-list("a","b","c")
w2<-list("d","e","f")
w3<-c(w1,w2)
w3


# r의 수치연산 관련 함수 대부분으느 벡터 자료구조를 사용
mydata<-list(1.5,2.0,3.5,4.5)
# 만약 리스트로 저장된 데이터를 연산하려면, 벡터로 변환
# unlist함수 : 리스트 -> 벡터

class(mydata)
class(unlist(mydata))
mean(unlist(mydata))
max(unlist(mydata))


# 데이터 프레임
# 행과 열로 구성, 2차원 구조 (행렬과 같음)
# 행렬은 모든 데이터 타입이 일치
# 데이터프레임은 서로 다른 데이터 타입을 가질 수 있음.(리스트와 같음)
# 데이터 프레임은(2차원 구조), 리스트는(1차원구조)

# 데이터 프레임은
# 동일한 길이의 벡터로 이루어진 리스트를 
# 구성요소로 하는 데이터 구조


# data.frame() 함수를 이용하여 벡터로 부터 데이터 프레임을 생성
v1<-c("a1","a2","a3")
v2<-c(10,20,30)
v3<-c("x","y")
data.frame(v1,v2)
# data.frame(v1,v2,v3) 에러가 뜸 row의 수가 다름
v3[3]<-"z"
v3
data.frame(v1,v2,v3)
df<-data.frame(v1,v2,v3)
str(df)
# obs->observations
# 3 variables(features)




#    x1 x2 ... x10000
# 0  0  20  ...  255
#    0  20  ...  255
#    0  20  ...  255
#    ...
# 99 0  20  ...  255
# 
# 
# 100(obs, instance, object)장의 이미지
# 각 이미지 데이터의 차원은?10000차원, feature가 10000개 있음,
# 각각의 이미지가 10000차원 공간의 (0,20,...,255) 위치에 점으로 표시가 됨
# 유클리디안 거리 또는 코사인 유사도 등의 알고리즘 기반 거리 계산을 통해
# 유사한 데이터를 찾아낼 수 있음.



# 행 이름으로 특정 벡터를 지정
data.frame(row.names=v1,v2,v3)
p<-data.frame(id=v1,name=v3,price=v2)
str(p)




v1<-c("a1","a2","a3")
v2<-c(10,20,30)
v3<-c("x","y","z")
df<-data.frame(v1,v2,v3)
data.frame(id=v1, price=v2, name=v3)
p
str(p)

# stringsAsFactors
# 벡터 -> 데이터프레임 생성할 때 데이터 타입을 팩터로 지정
#(데이터를 Factor형태로서 string(문자열)을 읽겠습니까?)

stringsAsFactors=FALSE
# 팩터로 문자열을 읽지 않겠다. 즉 문자열로 읽겠다.

stringsAsFactors=TRUE
# 팩터로 문자열을 읽겠다. 즉 문자열을 팩터로 읽겠다.


data.frame(id=v1, price=v2, name=v3, stringsAsFactors = TRUE)
str(p)



# 문자열 총 10개, stringsAsFactors=False
# 2개 팩터 (chr-> factor변환), 8개 문자벡터

# as.data.frame 함수
# 행렬, 리스트로 부터 데이터 프레임 생성
mat<-matrix(c(1,2,3,4,5,6),ncol=2)
mat
# 행렬->데이터프레임
num<-as.data.frame(mat)
colnames(num)# 열 이름 출력
colnames(num)<-c("d1","d2")
num


# 리스트->데이터프레임
v1<-c("a1","a2","a3")
v2<-c(10,20,30)
v3<-c("x","y","z")
lst<-list(v1,v2,v3)
p<-as.data.frame(lst)
colnames(p)
colnames(p)<-c("id","name","price")
p


# length함수
# 행렬에서 데이터의 길이(원소의 갯수)
# 데이터프레임에서는 column의 갯수
length(p)
ncol(p)
nrow(p)




# datasets패키지 
# r 설치시 기본적으로 내장되어 있는 데이터 셋

state.abb# 미국 50개주의 약자
state.name
state.region
state.area # 평방마일(면적)

str(state.abb)
str(state.name)
str(state.region)
str(state.area)
table(state.region)

us.state<-data.frame(state.abb,state.name,state.region,state.area)
us.state

str(us.state)

# state.name 열 추출
us.state$state.name
#[[]] or [] 사용하여 열 추출
#[[]] : 열 하나를 벡터or 팩터로 출력
# [] : 데이터 프레임이 추출, 하나 또는 여러개의 열을 추출할 수 있다.
us.state[[2]]
str(us.state[[2]])

us.state[2]
str(us.state[2])

us.state[c(2,3)]
str(us.state[c(2,3)])

# 행렬 인덱싱 사용 가능
us.state
us.state[,2]
us.state[,2, drop=FALSE]
# 행렬에서는 drop=FALSE 적용시, 출력결과의 타입이 행렬
# 데이터프레임에서는 drop=FALSE 적용시, 출력 결과의 타입이 데이터프레임

us.state[,c(2,4)]

us.state[["state.name"]]
us.state$state.name
us.state[,"state.name"]

us.state[c("state.name", "state.area")] #리스트 인덱싱
us.state[,c("state.name", "state.area")] # 행렬 인덱싱





id<-c("a1","a2","a3")
price<-c(10,20,30)
name<-c("x","y","z")

product<-data.frame(id,name,price)
product
str(product)


#rbind(): 데이터프레임에 행 추가
product<-rbind(product,c("a4","k",40))

# 4번 행 제거
product<-product[-4,]

product


# 여러 행 추가
new.rows<-data.frame(id=c("a5","a6"),
           name=c("a","b"),
           price=c(50,60))
new.rows
product<-rbind(product,new.rows)
product

# as.numeric()
# price가 문자열로 인식됫으니 숫자형으로 변경
product$price<-as.numeric(product$price)
str(product)

#1. 
#다음 리스트에서 A를 a로 변경하시오
#list(c(3,5,7),c("A","B","C))
a<-list(c(3,5,7),c("A","B","C"))
a[[c(2,1)]] <- "a"
a

# 2. 
# 다음 리스트는 중간고사 및 기말고사 점수이다. 
# 중간고사 평균, 기말고사 평균, 전체 평균을 계산하시오
# list(math=list(95,90),eng=list(80,90),kor=list(85,80))

b<-list(math=list(95,90),eng=list(80,90),kor=list(85,80))

# 중간고사 평균
b.sum1<-unlist(b[[1]][1])+unlist(b[[2]][1])+unlist(b[[3]][1])
b.sum1/3

# 기말고사 평균
b.sum2<-unlist(b[[1]][2])+unlist(b[[2]][2])+unlist(b[[3]][2])
b.sum2/3

# 전체 평균
mean(unlist(b))


# 3.
# 다음은 1월~12월까지 월평균 기온이다.
# -2.4, 0.4, 5.7 12.5, 17.8, 22.2, 24.9, 25.7, 21.2, 14.8, 7.2, 0.4
# 1) 월 이름(Jan~Dec)을 지정한 리스트를 만드시오.
# 2) 0도 미만인 월을 추출하시오
# 3) 연평균 기온보다 작은 월을 추출하시오.
# 4) 연평균 기온보다 큰 월을 리스트에서 제거하시오.

#1)
c<-list(-2.4, 0.4, 5.7 ,12.5, 17.8, 22.2, 24.9, 25.7, 21.2, 14.8, 7.2, 0.4)
names(c)<-c(month.abb)
c

#2)
c[c<0]

#3)
c.mean<-mean(unlist(c))
c.mean
c[c<c.mean]

#4
c[unlist(c) > mean(unlist(c))] <-NULL
c
# 4. 
# 리스트 list(a=1, b=2)와 벡터 pi를 결합하여 새로운 리스트를 생성하고,
# 생성한 리스트에서 pi를 추출하시오.
d <- c(list(a=1,b=2),pi)
d[[3]]


# 5.
# 1. 행렬 X가 다음과 같이 정의되도록 R로 작성하라.
#   c1 c2 c3
# r1  1  4  7
# r2  2  5  8
# r3  3  6  9
# ① matrix() 함수를 이용하라.
mtx<-matrix(1:9,3,3,dimnames = list(c('c1','c2','c3'),c('r1','r2','r3')))
mtx

# ② cbind()와 rbind() 함수를 이용하라.

#cbind()
c1<-1:3
c2<-4:6
c3<-7:9
mtx<-cbind(c1,c2,c3)
rownames(mtx)<-list("r1","r2","r3")
mtx

#rbind()
r1<-c(1,4,7)
r2<-c(2,5,8)
r3<-c(3,6,9)
mtx<-rbind(r1,r2,r3)
colnames(mtx)<-list("c1","c2","c3")
mtx

# ③ dim() 함수를 이용하라.
mtx<-c(1:9)
dim(mtx)<-c(3,3) 
dimnames(mtx)<-list(c('r1','r2','r3'),c('c1','c2','c3'))
mtx

# 6. 
# 앞 문제의 행렬 X에 대해 다음을 알아내는 방법을 R로 답하라.
# ① 행과 열의 개수.  ② 행벡터 및 열벡터의 이름.  ③ 원소의 개수

#1)
nrow(mtx)
ncol(mtx)

#2)
rownames(mtx)
colnames(mtx)

#3)
length(mtx)

# 7. 
# 다음 두 행렬 A, B에 대해 물음에 답하라.
# A=matrix(c(1,4,1,0,1,2), 2, byrow=T),    B=rbind(c(1,0,1),c(-1,1,-1))
# ① A+B, A-B, B*A, B/A
# ② 행렬 A의 2행 벡터를 c(1,2,1)로 치환하라.
# ③ 행렬 B의 1열 벡터와 2열 벡터를 교환하라.
# ④ 행렬 A의 2행을 제거하라.
# ⑤ 행렬 B에서 1보다 작은 원소를 0으로 치환하라.

A=matrix(c(1,4,1,0,1,2), 2, byrow=T)  
B=rbind(c(1,0,1),c(-1,1,-1))

#1)
A+B
A-B
B*A
B/A

#2)
A[2,]<-c(1,2,1)
A

#3)
b1<-B[,1]
b2<-B[,2]
B[,1]<-b2
B[,2]<-b1
B

#4)
A<-A[-2,]
A

#5)
B[B<1] <- 0
B

# 8.
# 행렬과 배열(array)의 차이점을 말하고, 3×2×3 배열의 예를 하나 만들어보아라.


# - 행렬은 2차원 벡터이고, 배열은 1,2,3차원 벡터이다
array1 <- 1:18
dim(array1) <- c(3,2,3) 
array1
# 3×2×3 <=> 3행 2열, 3개의 면

# 9. 
# 다음과 같은 번호(ID), 성명(name), 성적(score)를 성분으로 하는 리스트가 있다. 물음에 답하라.
# L=list(ID=c(1,2,3), 
#        name=c('Kim', 'Lee', 'Park'),
#        score=c(80, 95, 75))
# 
# ① length(L)은 얼마이며, 이것은 무엇을 의미하는가?
# ② 이름 성적 75을 80으로 수정하라.
# ③ L$name=='Park'의 결과를 쓰고, 무엇을 의미하는지 설명하라.
# ④ L$score[L$name=='Park']의 결과를 쓰고, 문장이 무엇을 의미하는지 설명하라.
# ⑤ 1번 학생의 이름과 성적을 알아내는 문장을 만들어 보아라.

L=list(ID=c(1,2,3),
       name=c('Kim', 'Lee', 'Park'),
       score=c(80, 95, 75))
L
# ①
length(L) #3 key의 값 , 구성요소의 개수

# ②
L[[3]][3]<-80
L

# ③
L$name=='Park' # FALSE FALSE  TRUE
# name 피쳐에 'Park'인 요소인지 여부를 bool형태로 출력

# ④
L$score[L$name=='Park'] # 80
# name이 'Park'인 요소의 위치를 score피쳐에서의 인덱싱/ Park의 점수라고 생각할 수 있다.

# ⑤
c(L[[2]][1],L[[3]][1])


# 10. 
# 다음의 표를 데이터프레임으로 작성해 보아라.
# 
# id	age	sex 	height	weight
# 1	21	'남'	175	80
# 2	22	'여'	165	55
# 3	31	'여'	155	45
# 4	40	'여'	160	50

id <- c(1:4)
age <- c(21,22,31,40)
sex <- c("남","여","여","여")
height <- c(175,165,155,160)
weight <- c(80,55,45,50)
data.frame(id,age,sex,height,weight)



# 11. 
# 다음 데이터를(자료구조는 자유선택) 저장한 후, 유클리디안 거리를 활용하여 
# 손흥민과 가장 유사하게 평점을 준(거리가 가까운) 사람의 이름과 거리를 
# 출력하시오.
# 
# critics={
#   'BTS':{'밀정':5, '경이로운소문':4, '국제시장':1.5},
#   '손흥민':{'밀정':4,'경이로운소문':5, '국제시장':2},
#   '레드벨벳':{'밀정':2.5, '경이로운소문':2, '국제시장':1},
#   '트와이스':{'밀정':3.5, '경이로운소문':4, '국제시장':5}
# }

BTS<-c(5,4,1.5)
손흥민<-c(4,5,2)
레드벨벳<-c(2.5,2,1)
트와이스<-c(3.5,4,5)

a<-list(BTS=BTS,손흥민=손흥민,레드벨벳=레드벨벳,트와이스=트와이스)
str(a$BTS[1]-a$손흥민[1])
BTS손<-sqrt((a$손흥민[1]-a$BTS[1])^2+(a$손흥민[2]-a$BTS[2])^2+(a$손흥민[3]-a$BTS[3])^2)
BTS손

레드손<-sqrt((a$손흥민[1]-a$레드벨벳[1])^2+(a$손흥민[2]-a$레드벨벳[2])^2+(a$손흥민[3]-a$레드벨벳[3])^2)
레드손

트와손<-sqrt((a$손흥민[1]-a$트와이스[1])^2+(a$손흥민[2]-a$트와이스[2])^2+(a$손흥민[3]-a$트와이스[3])^2)
트와손

#BTS손이 제일 작으므로 BTS가 가장 유사한 평점을 주었다.
