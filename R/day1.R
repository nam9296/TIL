print("hello")
print(
  "hello"
)
print("hi")

savehistory("c:/rwork/day1.Rhistory")

?apply

# 벡터, 스칼라, 행렬, 데이터프레임, 리스트 

a<-3
a
print(a)


# 벡터 : 데이터 분석에서 자료의 기본형
# 스칼라 : 길이가 1인 벡터

b<-2
print(b)


c(1,2,3)
c("we","love","data")

odd <-c(1,3,5)
even<-c(2,4,6)
c(odd,even)
3:9
5:1


#다양한 증감치를 이용한 수열 생성
seq(from=3,to=9) #3:9
seq(from=3,to=9, by=0.5)
seq(from=9,to=3, by=-0.5)
seq(from=3,to=9) #3:9
# 수열의 길이를 지정
seq(from=0,to=100, length.out=5)


# 벡터 전체를 반복할 때 times를 사용
rep(1,times=3)


# 벡터의 각 원소값들을 반복 each 사용
rep(c(1,2,3), each=5)
rep(1:3, length.out=8)




# 키 몸무게 혈액형 나이
# (170,60,A,30)  벡터라고 함

# (170,60,A,30)
# (180,60,B,39)
#...
# (170,45,O,20)  행렬이라고 함

# 하나의 벡터를 이루는 데이터의 개수가 N 개이면
# N차원 벡터라고 함

#이미지 데이터 (100*100 픽셀)
# ex) (250,225,0,0,...,210,255)
#     <-------10000개-------->
# 그럼 10000차원


# 벡터는 동일한 데이터 유형으로 표현됨

n<-c(1,2,3)
cha<-c("x","y","z")
c(n,cha)

# str함수 : 벡터의 유형 및 구조 확인
str(num)
str(cha)
# 벡터의 길이 : 3 , 3개의 원소를 갖는 1차원 벡터

# length: 벡터의 길이만을 확인
length(n)

# 상수벡터
LETTERS # 대문자 알파벳이 나옴
letters # 소문자 알파벳이 나옴
month.abb
month.name
pi


month<-c(12,9,3,5,1)
month.name[month]


# 시가 종가 거래량  (feature, variable)
# 100 200  500


# 벡터화(vectorized) 연산 => 속도가 빠르다

1+2 # 1이라는 벡터와 2 라는 벡터의 +연산을 수행
2^10 
10%%3  # 10을 3으로 나눈 나머지
10%/%3  # 10을 3으로 나눈 몫


# 벡터연산은 원소와 원소끼리 연산 수행
c(1,2,3)+c(4,5,6)
x <-c(1,2,3)
x*c(4,5,6)

y<-c(10,20,30)
y/c(2,4,6)

y%%c(3,5,7)
y%/%c(3,5,7)

# 길이가 1인 벡터로 만들어줌 
x<-c(1:3) #123123
y<-c(4:9) #456789
x+y

c(1,3,5) +10

# == != < > <= >= !x x|y x&y isTRUE(x)

v<-pi
w<-10/3
v == w
v != w
!(v>w)

(v==w)|(v<w)
(v==w)&(v<w)
isTRUE(v==w)


x<-c(1,3,5)
y<-c(3,3,3)
x==y
x==3


# r은 true는 1, false는 0으로 간주
as.numeric(TRUE) # 논리갑 -> 숫자로 변환
as.numeric(FALSE)
TRUE+TRUE # 1 + 1 = 2
FALSE+TRUE # 0 + 1 = 1
FALSE*TRUE # 0 * 1 = 0


x<-c(0,25,50,75,100)
x>50

sum(1:5)
sum(1,2,3)
sum(1:2,3:5)
sum(TRUE,FALSE,TRUE)


# any함수, all함수 
# any : 논리값이 하나라도 TRUE이면 결과가 TRUE
# all : 논리값이 모두 TRUE여야만 결과가 TRUE
a<- -3:3
a
a>0
any(a>0)
all(a>0)

# 2의 제곱근의 제곱 => 2  이지만 
# r에서는 2가 아닙니다.(부동소수점수 연산)

sqrt(2)^2==2

sqrt(2)^2-2 # 0이 안나옴 


# 수치 비교시 정밀도 문제를 피하기 위해서는 all.equal()함수를 이용
all.equal(sqrt(2)^2,2)
# 약간의 오차를 무시하도록, 두값이 같다고 출력



# 문자벡터 다룰때 많이 사용하는 함수
# paste(): 문자 벡터들 끼리의 합을 구할 때 

fruits<-c("Apple","Banana","Strawberry")
food<-c("Pie","Juice","cake")
# food+fruits 하면 오류
paste(fruits,food)
paste(fruits,"Juice")


# abs():절댓값을 변환
x<- -3:3
abs(x)

# log() : 밑이 e인 자연로그
log(1:5)

log(1:5,base=3) # 밑이 3인 로그
log(1:10,base=10)

#밑이 2와 10인 로그함수
log10(1:10)
log2(1:10)

# exp() : 지수함수
exp(1:5)


y<-exp(1:5)
log(y)


# factorial() : 펙토리얼 구할 때

factorial(1:5)

choose(5,2) # 5개 중에서 2개를 선택하는 경우 5C2

# nCr = n! / r!(n-r)! => 120/12 = 10

# sqrt(): square root 제곱근 
sqrt(1:5)
# 유효자릿수가 소수점 아래 7자리가 최대
options("digits") # 유효자리수

# 유효자릿수 기준 반올림
signif(456.789,digits=2)
signif(456.789,digits=3)
signif(456.789,digits=4)

# 반올림
round(456.789,digits=1)
round(456.789,digits=2)
round(456.789,digits=3)

round(456.789,digits=1)
round(456.789,digits=-1)
round(456.789,digits=-2)
round(456.789,digits=-3)


# 1부터 10까지 수에 대한 각각의 제곱근을 구한다음 
# 소수이하 2자리까지 출력

round(sqrt(1:10),2)



# 반올림 숫자가 5인경우 가까운 짝수로 반올림
round(11.5)
round(12.5)

round(12.51)
round(12.49)

# floor : 작은 가까운 정수로 반올림
# ceiling : 큰 가장 가까운 정수로 반올림
# trunc : 0에 가장 가까운 정수로 반올림

ceiling(456.78) #457
ceiling(-456.78) #-456

floor(456.78) # 456
floor(-456.78) # -457

trunc(456.78) # 456
trunc(-456.78) # -456

# Inf : 무한대 
3/0
5-Inf
Inf*Inf
Inf*(-Inf)

# r에서는 1.8*10의 308승 까지 표현가능
10^306 # 1e+306
2*10^308 # Inf


is.infinite(10^306) # FALSE 
is.infinite(10^307) # FALSE
is.infinite(10^308) # FALSE
is.infinite(10^309) # TRUE
is.infinite(2*10^308) # TRUE


# NaN (Not a Number) : 숫자가 아님, 계산 결과를 정의할 수 없다
Inf/Inf
Inf*0
log(-2)
NaN+3

is.nan(Inf*0)


# NA(Not Available) : 결측값
k<-NA
K+2


# 수학에 사용되는 함수
z<-1:5
z
sum(z) # 요소들을 다 더함
prod(z) # 요소들을 다 곱함
min(z) # 요소들 중 최솟값을 구함
max(z) # 요소들 중 최댓값을 구함
mean(z) # 요소들의 평균값을 구함
median(z) # 요소들의 중간값을 구함
var(z) # 요소들의 분산을 구함함
sd(z) # 요소들의 표준편차를 구함
range(z) # 요소들의 최대값과 최소값

z<-c(z,NA)
z # 1  2  3  4  5 NA

# NA가 있어서 다른연산들이 불가능해진다 
# 어떻게 처리하면 좋을까 ?

#  NA를 빼라
sum(z, na.rm = TRUE)
sum(na.omit(z))



# cumsum함수 : 누적합
traffic.death<-c(10,20,30,20)
cumsum(traffic.death)

traffic.death<-c(10,20,NA,30,20)
cumsum(traffic.death)

# diff함수 : 뒤의 값과 앞의 값의 차 
traffic.death<-c(10,20,30,20)
diff(traffic.death)

1:10
diff(1:10)
diff(1:10,lag=3) # 3칸 떨어진 원소간의 차 



# union():두 벡터에 대한 합집합
p<-1:10
q<-6:15
union(p,q)

# intersect():두 벡터에 대한 교집합
p<-1:10
q<-6:15
intersect(p,q)

# setdiff():두 벡터에 대한 차집합
p<-1:10
q<-6:15
setdiff(p,q)

# setequal(): 두 집합이 동일한지 확인할 때 
p<-1:10
q<-6:15
setequal(p,q)

# is.element() : 첫번째 인수에 오는 값이 두번째 벡터의 원소인지
is.element(3,1:5)
is.element(6,1:5)


# 벡터 인덱싱
num <- 0:30
num
num[5]
num[5:10] # 파이썬과 범위가 다르니 주의
num[c(2,5,10,27)]


prime<- c(2,3,5,7,11,13)
idx<-c(1,3,5)
prime[idx] # 이런모양 분석할 때 많이나옴

prime[-3] # 3번 인덱스를 제외시키고 나머지 출력

prime[-2:-4] # 2~4번 인덱스를 제외하고 나머지 출력
prime[-(2:4)] # 위와 같음


prime<- c(2,3,5,7,11,13)
length(prime)

prime[1:(length(prime)-2)] # 1~4번까지 인덱싱

prime[-length(prime)]

# 특정위치에 요소(데이터) 바꾸기
prime[2] <- 30
prime

prime[c(3,4)] <- c(30,40)
prime



# 1. : 연산자 활용 벡터 생성

#1~10
#10~1
#1~10~1


c(1:10)
c(10:1)
c(1:10,9:1)

# 2. 3.141592에 대해 반올림 관련 함수를 다양한 방식으로 확인해보시오
# 
# ex) siginif(pi, digits=3)

signif(3.141592,3)
round(3.141592, 2)
ceiling(3.141592)
floor(3.141592)
trunc(3.141592)

# 3. 
# 키: 180, 160, 165, 185, 155
# 몸무게:75, 70, 60, 100, 65
# BMI를 구하시오. BMI=몸무게(KG)/키(m)제곱
# bmi가 25보다 큰 사람의 몸무게를 출력하시오.

height<-c(180, 160, 165, 185, 155)
weight<-c(75, 70, 60, 100, 65)
BMI<-weight/{(height*0.01)^2}
weight[BMI>25]


#4.sum함수와 논리연산을 이용하여 1~100까지 정수 가운데 7의 배수인 정수 개수를 구하시오.
num<-c(1:100)
sum(num%%7==0)


#5. 변수 x에 1~10까지 값을 할당하고 이 값들을 평균0과 표준편차1로 표준화하시오.
# 표준화= (각 data - 전체 data평균)/전체 data표준편차
x<-c(1:10)
x-mean(x)/sd(x)




