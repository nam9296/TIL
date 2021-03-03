# 스크립트 : 명령어의 집합
# yard - > meter (야드를 미터로 변환)

# x<-c(30,50,90)
# tlength<-round(x*0.9144,1)
# tlength
# result<-paste(tlength,"m",sep="")
# print(result)
# 파일명 : transLength.R 로 저장

# day 7 에서 transLength.R을 실행하고자 함
source("transLength.R")

# r에서는 들여쓰기를 사용할 필요 없음
# transLength함수를 정의
transLength<-function(x){
  tlength<-round(x*0.9144,1)
  result<-paste(tlength,"m",sep="")
  return(result)
}
# 메모리에 적재가 됨

# ls() : 메모리에 적재된 변수, 함수 등의 이름이 목록으로 출력 
ls()

transLength(10)

y<- c(100,150,200)
transLength(y)

trans2<-transLength
trans2(y)

trans2



f1<-function(x,y){x+y}
f1(1,3)


# 함수에서 실행할 문장이 1개인 경우에는 중괄호 생량이 가능
f2<-function(x,y) x+y
f2(2,5)


tran3<-function(x){
  if(!is.numeric(x)){
    return("not a number")
  }
    
  tlength<-round(x*0.9144,1)
  result<-paste(tlength,"m",sep="")
  return(result)
}
tran3("abc")



# 피트(feet),인치(inch) 변환이 가능한 함수
# 1야드 = 3피트, 1야드=36인치
transLength<-function(x,mult=0.9144,unit="m"){
  tlength<-round(x*mult,digits=1)
  result<-paste(tlength,unit,sep="")
  return(result)
}

y<-c(100,150,200)
# transLength(y,,) # 피트로 변환하여 출력
# transLength(y,,) # 인치로 변환하여 출력


transLength(y,mult=3,unit='ft')
transLength(y,mult=36,unit='in')
transLength(y)

transLength(y,3,'ft')




transLength<-function(x,mult=0.9144,unit="m",...){
  tlength<-round(x*mult,...)
  result<-paste(tlength,unit,sep="")
  return(result)
}
y<-c(100,150,200)
transLength(y, digits=3)

transLength(y) # round(x*mult, ...) => round(x*mult)

round(3.46789)# 디폴트값(기본값)이 digits=0으로 되ㅣ어있음


transLength<-function(x,mult=0.9144,unit="m",dig=1){
  tlength<-round(x*mult,digits=dig)
  result<-paste(tlength,unit,sep="")
  
}
y<-c(100,150,200)
transLength(y, digits=3)


# 함수 자체를 인수처럼 취급할 수 있음

transLength<-function(x,mult=0.9144,unit="m",FUN=round,...){
  tlength<-FUN(x*mult,...)
  paste(tlength,unit,sep="")
  
}
y<-c(100,150,200)
transLength(y)

transLength(y,FUN=floor) # 가까운 정수로 출력
transLength(y,FUN=signif,digits=3)

x<-pi
y<-3
if(x>y)x
if(x>y){
  print(x)
}
if(x<y) x else y

# 조건문은 벡터 연산을 사용할 수 없다.
# 조건문에 벡터가 사용되면 첫번째 값만 연산됨
# 아래에서 y가 5개지만, 첫번째 원소인 1 만 x와 비교
x<-pi
y<-1:5
if(x<y) x else y

# 조건문에 벡터를 포함하고자 한다면
# ifelse()함수를 사용
# ifelse()함수는 벡터연산을 가능하게 한다.
#ifelse(조건,참,거짓)
t<-c(TRUE,FALSE,TRUE,FALSE,TRUE)
y<- 1:5
n<-0
ifelse(t,y,n)

x<-pi
y<-1:5
ifelse(x>y,x,y)

# mean: 평균, median : 중앙값, trimmed : 절사평균
# switch함수 
# - 첫번째 인수로 주어진 값에 따라, 두번째 이후의 인수에 
#   지정된 코드가 실행


center<-function(x,type){
  switch(type,
        mean=mean(x),
        median=median(x),
        trimmed=mean(x,trim=0.1), # 10% 절사평균
        "choose one of mean, median and trimmed"
        )
}
x<-c(2,3,5,7,11,13,17)
center(x,"mean")
center(x,"median")
center(x,"trimmed")


# 절사평균 : 산술평균(mean)이 outlier(이상치)에 
# 민감하게 반응하는 것을 보정해서 평균을 낸 것.

center(x,"other")

i<-5
repeat{if(i>25)break
  else{
    print(i)
    i<-i+5
  }
}

i<-5
while (i<=25) {
  print(i)
  i<-i+5
}


# for(변수 in 리스트) 반복 명령문
for(i in seq(from=5,to=25,by=5))
  print(i)

# 반복문 작성시 참고사항

# 1) 실행 결과는 루프 안에서는 출력되지 않는다.-> 명시적으로
# ex) # ex) for(i in seq(from=5,to=25,by=5)) i

# ex) for(i in seq(from=5,to=25,by=5)) print(i)

# 2) for문이 종료된 이후에도 변수는 사라지지 않는다.
i<-1
for(i in seq(from=5,to=25,by=5)) i
i # 가장 마지막에 i에 할당된 25가 저장되어 있다.



# 데이터 전처리
# - 분석 목적에 적합한 형태
# 수집되어 전처리 되어야 할 대상 데이터를 r에서 어떤 자료구조로 표현할 것인가?
# 자료구조 : 벡터(하나의 차원),
# 행렬(배열), 리스트, 데이터프레임 등 두개 이상의 차원을 갖는 경우
# 행렬/배열은 동일한 데이터 유형으로 구성

# 데이터 프레임과 리스트는 숫자, 문자가 섞여있는 데이터 유형으로 구성

# mode(): 데이터 유형(숫자, 문자, 논리(불), 리스트, 함수...)
mode(3.14)
mode(c(3.14,1.5))
mode("Batman")
mode(c("Batman","Superman","HaLim"))
mode(factor("High","Med","Low"))
mode(as.Date("2021-03-02"))
mode(5>2)
list(1.2,"apple",c(3,4))
mode(list(1.2,"apple",c(3,4)))
mode(mean)

d<-as.Date("2021-03-02")
d+1
as.integer(d)
# 1970년 1월 1일을 기준으로 현재까지 경과한 날
length(d)
as.numeric(1.618)
as.integer(1.618)
as.character(1.618)
# as.numeric("test") 변환이 불가능한 경우 NA가 출력 


mode(as.numeric("1.234"))
as.numeric(c("-1","1.5","3.14"))
a<-as.numeric(c("-1","1.5","3.14","test"))
a

# 논리값 -> 숫자
as.numeric(TRUE)


sum(c(TRUE,FALSE,TRUE))

# c(1,3,5,7,9)에서 4보다 큰 수는 총 몇 개인가?

sum(c(1,3,5,7,9)>4)

# 리스트 -> 분석 모델에서 요구하는 타입이 데이터프레임
# 타입을 변환해야한다.

as.data.frame(x)
as.list(x)
# r에서는 as.변환하고자하는타입()을 이용해서 데이터 변환

# is.data.frame(x)
# is.factor(x)
# is.vector(x)

# 벡터에서 다른 타입으로 변환
vec<-1:6
vec
# 각각 원소가 리스트의 원소로 변환
as.list(vec) # 둘이
list(vec)    # 다르다
# 전체가 하나의 원소를 갖는 리스트로 변환


# 벡터를 행렬로 변환
# cbind(), rbind(), as.matrix()
vec<-1:6

cbind(vec)
rbind(vec)
as.matrix(vec)
matrix(vec)
matrix(vec,2,3)

# 벡터를 하나의 열로 구성된 데이터프레임으로 변환
as.data.frame(vec)

# 벡터를 하나의 열로 구성된 데이터프레임으로 변환
as.data.frame(rbind(vec))

class(rbind(vec))
# vector -> matrix -> dataframe


# 행렬 구조를 벡터, 리스트, 데이터프레임으로 변환
# as.vector(), as.list(), as.data.frame()
 
# 3행 2열(1~6값이 저장됨)=> 벡터,리스트,데이터프레임 구조로 변환

a<-1:6
a<-matrix(a,3,2)

as.vector(a)
as.list(a)
as.data.frame(a)

# 리스트 -> 다른구조
# unlist() : 리스트-> 벡터
# 리스트 요소에 이름이 있는 경우 이름을 갖는 벡터로 변환됨

lst<-list(odd=c(1,3,5),even=c(2,4,6))
lst

unlist(lst)
# as.vector()를 이용해도 아무 변화 없음
as.vector(lst)

# 두개가 같은걸까 ?
identical(as.vector(lst),lst) # TRUE

lst2<-list(odd=c(1,3,5), even=c("two","four","six"))
lst2

unlist(lst2)


# 리스트 -> 행렬 : unlist -> 벡터를 행렬로 변환

lst<-list(odd=c(1,3,5),even=c(2,4,6))
lstvec<-unlist(lst)
lstvec
matrix(lstvec,3,2)

# dimnames인수 : 리스트의 원소 이름을 행렬의 행 또는 열 이름으로 사용
matrix(unlist(lst),3,2,dimnames = list(NULL,names(lst)))
# 주의사항 : 리스트에 matrix함수, as.matrix를 그대로 적용하면 행렬로 변환 안됨

# matrix(lst)
# as.matrix(lst)

# as.data.frame함수 : 리스트 -> 데이터프레임으로 변환
# 숫자와 문자가 섞여 있으면, 숫자->숫자벡터, 문자-> 문자벡터로 변환됨
lst<-list(odd=c(1,3,5),even=c(2,4,6))
lstdf<-as.data.frame(lst)
str(lstdf)

# 문자가 있다면?
lst2<-list(odd=c(1,3,5),even=c("two","four","six"))
lstdf2<-as.data.frame(lst2)
str(lstdf2)
lstdf2

# 데이터프레임 -> 다른 구조로 변환
# 데이터프레임 인덱싱을 이용하여 열로부터 벡터를 생성
# 데이터프레임 행-> 데이터프레임으로 출력

df1<-data.frame(odd=c(1,3,5),even=c(2,4,6))
df1
df1[1,]
str(df1[1,])

df1[,1]
str(df1[,1])
# 행을 추출하면 dataframe형식, 열을 추출하면 vector형식

df1[1]
df1[2]
str(df1[1]) # 열이나오는데 dataframe으로 나오네

df1[[1]]
str(df1[[1]]) # 이건 벡터로 나오네


# 데이터프레임 전체를 벡터로 변환(데이터프레임이 하나의 행 또는 열로 구성된 경우에만 가능)
df2<-data.frame(odd=c(1,3,5),even=c(2,4,6))
df2

# as.vector(df2) 아무 변화가 없네

# 1)데이터프레임 -> 행렬
as.matrix(df2)
mode(as.matrix(df2))
# 2)행렬 -> as.vector -> 벡터
as.vector(as.matrix(df2))


df3<-data.frame(odd=c(1,3,5),even=c("two","four","six"))
df3
as.matrix(df3)
as.vector(as.matrix(df3))

# as.list(): 데이터프레임 -> 리스트
# 숫자 -> 숫자벡터, 문자->문자벡터로 변환 (이전버전은 팩터로 변환)
df4<-data.frame(odd=c(1,3,5),even=c(2,4,6))
as.list(df4)
str(as.list(df4))

df5<-data.frame(odd=c(1,3,5),even=c("two","four","six"))
as.list(df5)
str(as.list(df5))

# as.matrix() :  데이터프레임 -> 행렬
# 모두 숫자로 구성 -> 숫자행렬
# 모두 문자로 구성 -> 문자행렬
# 숫자,문자 섞인구성 -> 문자로 변환된 행렬 

df5 <-data.frame(odd=c(1,3,5), even=c(2,4,6))
as.matrix(df5)

df6 <-data.frame(odd=c(1,3,5), even=c("two","four","six"))
as.matrix(df6)


# 1. for문으로 다음과 같이 월 이름을 출력
# The month of January
# ...
# The month of December

paste('The month of',month.name)
#or
for(i in month.name)
  print(paste("The month of", i))




# 2. 짝수이면 TRUE, 홀수이면 FALSE를 출력하는 함수 작성.
# 다음 벡터로 테스트하시오.

x<-c(-5:5)
isEven<-function(x){
  ifelse(x %% 2 ==0, TRUE, FALSE) 
}

isEven(x)
# or
even <-function(x){
  return(x%%2==0)
}

even(-5:5)





# 3. 짝수 개수를 세는 함수 작성.
# 다음 벡터로 테스트하시오.

even <-function(x){
  return(sum(x%%2==0))
}

even(-5:5)

#or

countEven<-function(x){
  sum(ifelse(x%%2==0,TRUE, FALSE))
}

countEven(c(-5:5))





# 4. 주어진 숫자가 원주율보다 크면 TRUE, 아니면 FALSE를 출력하는 함수 작성.
# 3과 1:5 벡터에 대해 테스트하시오
a<-3
b<-1:5

greaterThanPi<-function(x){
  ifelse(x>pi, TRUE, FALSE)
}

greaterThanPi(a)
greaterThanPi(b)

#or
pi.num <-function(x){
  return(x>pi)
}
pi.num(c(-5:5))



# 5. 주어진 그림과 같은 데이터프레임을 생성하여
# df_midterm에 저장하시오
# - 각 과목별 평균을 구하시오.
# - 각 번호별 평균을 구하시오.

english<-c(90,80,60,70)
math<-c(50,60,100,20)
class<-c(1,1,2,2)

df_midterm<-data.frame(english,math,class)
df_midterm

apply(df_midterm[,-3],2,mean)
apply(df_midterm[,-3],1,mean)





# 6. 2~99까지 수에 대해
# - 3의 배수에 해당하는 수의 합계를 구하시오.
sum(which(c(2:99)%%3==0))
#or
vec<-2:99
sum(vec[vec%%3==0])

# - 3의 배수에 해당하는 수의 개수를 구하시오.
sum(c(2:99)%%3==0)





# 7. 임의의 수 n을 전달받아, n!을 출력하는 함수를 완성하시오. (n>=2, 5!=5*4*3*2*1)

fac <-function(x){
  return(factorial(x))
}
fac(4)

#or
factorial_n<-function(x){
  if(x==0){
    return(1)
  }
  f<-1
  for(i in 1:x)
    f<-f*i
  return(f)
}






# 8. 반복문을 이용하여 구구단을 출력하시오
for(i in 1:9)
  print(i*c(1:9))
#or
for(i in 2:9){
  mul<-c()
  for(j in 1:9){
    mul <-c(mul,i*j)
  }
  print(paste(mul,collapse = ' '))
}




# 9. 반복문을 활용하여 출력하시오
#     *
#    ***
#   *****
#  *******
for(i in seq(from=1,to=7,by=2)){
  print(paste(rep('*',i),collapse = ''))
}
#or
i<-1  
while(i<5){
  print(paste(rep(c(" ","*"),c(4-i,2*i-1)),collapse = ""))
  i<-i+1
}


# 10.  타이타닉 데이터 전처리
# - train.csv 파일 읽을 때 "" 는 na로 처리하시오.
titanic<-read.csv("train.csv",header = T, na.strings="")
titanic

# - Surived 컬럼의 타입을 확인하시오.
mode(titanic$Survived) #numeric
class(titanic$Survived) #integer
str(titanic$Survived) #int
typeof(titanic$Survived) #integer


# - Survived 컬럼의 타입을 factor 타입으로 바꾸어 저장하시오.
Survived.factor<-as.factor(titanic$Survived)
is.factor(Survived.factor)
Survived.factor

