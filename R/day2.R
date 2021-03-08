p<-c(2,3,5,7,11,13,17,19)
p
p[3]
p[3:5]

p[-3]
p[-3:-5]
p[-(3:5)]

p[1:length(p)-1]
p[-length(p)]


p[2]<-1
p[c(6,8)]<-c(100,200)
p
length(p)
p[15]<-99
p


# 불린참조
p
p<10
p[p<10] # p<10 보다 작은 값들만 참조 출력


p
p[c(TRUE,TRUE,FALSE)]

# which(): 논리값 -> TRUE위치 인덱스 추출 함수
# which.max(),min()

data<-c(100:111) # 12건 데이터!(1~12월의 데이터라고 해보자)
data
which(data>105)

#month.abb를 사용하니 축약형인 월이 나옴
month.abb[which(data>105)]
month.name[which(data>105)]

which.min(data)
which.max(data)
#저장된 자료들 중에서 최소,최댓값의 인덱스를 출력함


# 요일별 교통사고 사망자수 데이터
traffic.death<-c(100,90,80,70,120,150,200) # 월~일 사망자

# 토요일 사망자 수
traffic.death[6]

# names : 벡터의 요소에 대한 이름을 지정
names(traffic.death)<-c("mon","tue","wed","thu","fri","sat","sun")
names(traffic.death)
traffic.death["sat"]
traffic.death
# 사망자 수가 100명 이상인 요일만 출력
traffic.death[traffic.death>=100]
names(traffic.death[traffic.death>=100])


# 팩터(factor) : 카테고리 구분하는 목적으로 사용되는 범주형 데이터
# 레벨(level) : 범주형(팩터)에 포함된 범주값
# factor()함수 : 범주형 데이터로 사용하고자 하는 문자 또는 숫자 벡터를 팩터로 변환해주는 함수

review <- c("good","good","bad","indifferent",
            "bad", "good") 
# 문자벡터

review.factor<-factor(review)
review.factor

# str() : 데이터의 구조를 보여주는 함수 (structure)
str(review.factor)
str(review)


# 팩터형 -> 숫자벡터로 변환
review.factor<-as.numeric(review.factor)

# 숫자벡터-> 팩터형으로 변환
review.factor<-as.factor(review.factor)

everyday<-c("mon","mon","fri","tue","tue")
everyday.factor<-factor(everyday)
everyday.factor
# 이렇게 하면 틀린방법 레벨이 3개밖에없음

# 이게 맞는 방법 (레벨스를 지정해줄 수 있다.)
everyday<-c("mon","mon","fri","tue","tue")
everyday.factor<-factor(everyday, levels =c("mon","tue","wed","thu","fri","sat","sun"))
everyday.factor
# 레벨스를 직접 지정해주면 내가 적어준 순서대로 나온다.

#난레벨스만 알고싶다.
levels(everyday.factor)

levels(review.factor)<-c("B","G","I")
review.factor


# nlevels() : levels의 갯수를 알고싶다
nlevels(review.factor)
length(levels(review.factor))

# 서열팩터(ordered factor) : 순서가 있는 범주형 데이터
eval<-c("Medium","Low","High","Medium","High")
eval.factor<-factor(eval)
eval.factor

eval.ordered<-factor(eval, levels=c("Low","Medium","High"),ordered=TRUE)
eval.ordered

# table() : 각 레벨별 빈도
eval.factor
table(eval.factor)
table(eval.ordered)


# 숫자벡터 -> 팩터로 변환
# 남자 :1, 여자 :2
sex<-c(2,1,2,2,1,0)
factor(sex)
sex.factor<-factor(sex,levels = c(1,2), labels=c("Male","Female"))
sex.factor





# 행렬 : 2차원 벡터, 벡터의 차원을 부여(dim)
# 행렬은 벡터로 구성, 벡터는 타입이 모두 동일
# matrix함수로도 행렬 생성
v<-1:12
dim(v)<-c(3,4) # 행:3, 열:4
v
dim(v)


#matrix
matrix(data=v,nrow =3,ncol = 4 ) 
# 열방향으로 저장됨

matrix(data=v,nrow =3,ncol = 4 ,byrow=TRUE) 
# 행방향으로 저장됨

# 빼고 써도 됨
matrix(v,3, 4 ,TRUE) 


#행과 열의 이름을 입력해보자 
rnames<-c("r1","r2","r3")
cnames<-c("c1","c2","c3","c4")

matrix(data=v,nrow =3,ncol = 4 ,byrow=TRUE, dimnames=list(rnames,cnames)) 



matrix(0,3,4)
matrix(NA,3,4)
mat<-matrix(v,ncol=4)
# 행렬은 2차원벡터
str(mat)
dim(mat)
dim(mat)[1]
dim(mat)[2]
nrow(mat)
ncol(mat)
length(mat) # 벡터의 길이

# 두 벡터를 결합해서 행렬을 만들 수 있다
v1<-1:5
v2<-6:10

rbind(v1,v2)
cbind(v1,v2)

# 벡터와 행렬을 결합하여 새로운 행렬을 생성
1:3
4:6
cbind(1:3,4:6,matrix(7:12,3,2))


# 행렬과 행련간 결합하여 새로운 행렬 생성
matrix(1:6,2,3)
matrix(7:12,2,3)
rbind(matrix(1:6,2,3),matrix(7:12,2,3))
cbind(matrix(1:6,2,3),matrix(7:12,2,3))


c<-1:12
mat<-matrix(v,3,4)
mat


mat[1,]
mat[,1]


# 행 또는 열이 2차원 형식을 그대로 유지
mat[1,,drop=FALSE] # 여전히 행렬로 출력
mat[,3,drop=FALSE] # 여전히 행렬로 출력

mat
mat[2:3,]
mat[,3:4]
mat[1:2,2:3]
mat[c(1:3),]      

#특정 열만 추출하기
mat[,c(1,4)]
mat[,-c(2,3)]



# 행렬의 특정 부분을 고치고 싶을 때
mat[1,3]<-77
mat[2,]<-c(22,55,22,55)
mat

mat[2,]<-c(22,55) # 이렇게 써도 반복되게 되어있음

mat[2:3,3:4]<-c(1,2,3,4)
mat




# quiz 
# matrix를 생성하시오
#        seoul busan daegu gwangju jeonju
# seoul    0     350   300  300      200
# busan   350     0
# daegu 
# gwangju 
# jeonju


data<-c(0,350,300,300,200,350,0,50,200,190,300,50,0,180,200,300,200,180,0,80,200,190,200, 80,0)
rnames<-c("seoul","busan","daegu","gwangju","jeonju")
cnames<-c("seoul","busan","daegu","gwangju","jeonju")

city.distance.mat<-matrix(data=data,nrow =5,ncol = 5 ,byrow=TRUE, dimnames=list(rnames,cnames)) 
city.distance.mat
city.distance.mat["seoul",]
city.distance.mat["seoul","busan"]
city.distance.mat[,"seoul"]
city.distance.mat[c("seoul","gwangju"),]


# 행렬과 길이가 1인 벡트(스칼라)간의 연산산
w<-c(1,2,3,4,5,6)
mtx<-matrix(w,2,3)
mtx

mtx+1
mtx*2

# 행렬간의 연산할 때는 두 행렬의 차원이 같아야함

matrix(1:6,2,3)
matrix(6:1,2,3)
matrix(1:6,2,3)+matrix(6:1,2,3)

# element-wise product
matrix(1:6,2,3)*matrix(6:1,2,3)

# 행렬의 곱셈은 앞의 행렬의 열의 갯수와 뒤의 행열의 행의 개수가 일치 해야함
w
matrix(w,2,3)
matrix(w,3,2)
matrix(w,2,3)%*%matrix(w,3,2)# 행렬의곱 %*%
matrix(w,3,2)%*%matrix(w,2,3)

# 행렬과 벡터의 곱

mtx<-matrix(w,2,3)
mtx%*%1:3 # 길이가 3인 벡터가 3행 1열로 자동변환됨


# t() : transpose 전치행렬 만들기
mtx
t(mtx)
t(t(mtx))

rowSums(mtx)
colSums(mtx)
rowMeans(mtx)
colMeans(mtx)


# 연습문제

# 1. 
# 변수 x에 1~10까지 값 할당, y에 3~1까지 값 할당
#- letters 상수벡터를 이용하여 x에 알파벳 소문자 이름 부여
#- x+y를 수행하고 결과를 설명

x<-c(1:10)
y<-c(3:1)
letters[x]
x+y

# [1]  4  4  4  7  7  7 10 10 10 13
#경고메시지(들): 
#  In x + y : 두 객체의 길이가 서로 배수관계에 있지 않습니다


#2. 
#숫자 2,5,3을 원소로 갖는 벡터 생성한 후 rep함수를 이용하여 다음 벡터를 생성
#- 2,5,3,2,5,3,2,5,3,2,5,3,2,5,3
#- 2,5,3,2,5,3,2,5,3,2
#- 2,2,5,5,5,5,5,3,3,3

rep(c(2,5,3),5)
rep(c(2,5,3),length.out=10)
rep(c(2,5,3), c(2,5,3))


#3. 
#주사위를 7번 던져서 나온 3,2,5,1,5,6,5의 값을 
#1)여섯 개의 레벨을 갖는 팩터로 저장하시오.
#2)각 레벨에 one, two, ... six로 이름 부여하시오.
#3)레벨별 발생 빈도를 출력하시오.


dice<-factor(c(3,2,5,1,5,6,5), levels=c(1,2,3,4,5,6), labels = c('one', 'two', 'three', 'four', 'five', 'six'))
table(dice)



# 4. 
#1~12까지의 숫자 벡터로 3*4행렬 생성하고 변수에 저장하시오.
#알파벳 소문자 상수 벡터 letters를 이용하여 행과 열이름을 각각 지정하시오.
#   a  b   c   d
#a  1  4
#b  2  5   ...
#c  3  6       12

data<-c(1:12)
data.mtx<-matrix(data,3,4,dimnames=list(letters[1:3],letters[1:4]))
data.mtx


#5. 
#4번에서 생성한 행렬로부터 1번째와 3번째 열을 추출하여 부분행렬을 생성하고,
#2번째와 4번째 열을 추출하여 부분행렬을 생성하고,
#이들을 열의 방향으로 결합한 새로운 행렬을 생성하시오.

new1 <-data.mtx[,c(1,3)]
new2 <-data.mtx[,c(2,4)]
new.mtx<-cbind(new1,new2)
new.mtx


#6. 
#4번과 5번문제에서 생성한 두 행렬에 대해 
#+, -, *, /, %*% 연산을 수행하시오
plus<-data.mtx+new.mtx
plus

minus<-data.mtx-new.mtx
minus

multiple<-data.mtx*new.mtx
multiple

division<-data.mtx/new.mtx
division

# 4by4
mtx.multi4<-t(data.mtx)%*%new.mtx
mtx.multi4
# 3by3
mtx.multi3<-data.mtx%*%t(new.mtx)
mtx.multi3

#7. 
#1~9999까지 정수로 9개의 열을 갖는 행렬을 생성하시오.
#마지막 세 개 행과 마지막 두 개 열로 구성된 3*2 부분행렬을 만드시오.
mtx<-matrix(1:9999,,9)
mtx[(nrow(mtx)-2):nrow(mtx),8:9]
