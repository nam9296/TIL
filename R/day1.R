print("hello")
print(
  "hello"
)
print("hi")

savehistory("c:/rwork/day1.Rhistory")

?apply

# ����, ��Į��, ���, ������������, ����Ʈ 

a<-3
a
print(a)


# ���� : ������ �м����� �ڷ��� �⺻��
# ��Į�� : ���̰� 1�� ����

b<-2
print(b)


c(1,2,3)
c("we","love","data")

odd <-c(1,3,5)
even<-c(2,4,6)
c(odd,even)
3:9
5:1


#�پ��� ����ġ�� �̿��� ���� ����
seq(from=3,to=9) #3:9
seq(from=3,to=9, by=0.5)
seq(from=9,to=3, by=-0.5)
seq(from=3,to=9) #3:9
# ������ ���̸� ����
seq(from=0,to=100, length.out=5)


# ���� ��ü�� �ݺ��� �� times�� ���
rep(1,times=3)


# ������ �� ���Ұ����� �ݺ� each ���
rep(c(1,2,3), each=5)
rep(1:3, length.out=8)




# Ű ������ ������ ����
# (170,60,A,30)  ���Ͷ�� ��

# (170,60,A,30)
# (180,60,B,39)
#...
# (170,45,O,20)  ����̶�� ��

# �ϳ��� ���͸� �̷�� �������� ������ N ���̸�
# N���� ���Ͷ�� ��

#�̹��� ������ (100*100 �ȼ�)
# ex) (250,225,0,0,...,210,255)
#     <-------10000��-------->
# �׷� 10000����


# ���ʹ� ������ ������ �������� ǥ����

n<-c(1,2,3)
cha<-c("x","y","z")
c(n,cha)

# str�Լ� : ������ ���� �� ���� Ȯ��
str(num)
str(cha)
# ������ ���� : 3 , 3���� ���Ҹ� ���� 1���� ����

# length: ������ ���̸��� Ȯ��
length(n)

# �������
LETTERS # �빮�� ���ĺ��� ����
letters # �ҹ��� ���ĺ��� ����
month.abb
month.name
pi


month<-c(12,9,3,5,1)
month.name[month]


# �ð� ���� �ŷ���  (feature, variable)
# 100 200  500


# ����ȭ(vectorized) ���� => �ӵ��� ������

1+2 # 1�̶�� ���Ϳ� 2 ��� ������ +������ ����
2^10 
10%%3  # 10�� 3���� ���� ������
10%/%3  # 10�� 3���� ���� ��


# ���Ϳ����� ���ҿ� �������� ���� ����
c(1,2,3)+c(4,5,6)
x <-c(1,2,3)
x*c(4,5,6)

y<-c(10,20,30)
y/c(2,4,6)

y%%c(3,5,7)
y%/%c(3,5,7)

# ���̰� 1�� ���ͷ� ������� 
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


# r�� true�� 1, false�� 0���� ����
as.numeric(TRUE) # ������ -> ���ڷ� ��ȯ
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


# any�Լ�, all�Լ� 
# any : �������� �ϳ��� TRUE�̸� ����� TRUE
# all : �������� ��� TRUE���߸� ����� TRUE
a<- -3:3
a
a>0
any(a>0)
all(a>0)

# 2�� �������� ���� => 2  ������ 
# r������ 2�� �ƴմϴ�.(�ε��Ҽ����� ����)

sqrt(2)^2==2

sqrt(2)^2-2 # 0�� �ȳ��� 


# ��ġ �񱳽� ���е� ������ ���ϱ� ���ؼ��� all.equal()�Լ��� �̿�
all.equal(sqrt(2)^2,2)
# �ణ�� ������ �����ϵ���, �ΰ��� ���ٰ� ���



# ���ں��� �ٷ궧 ���� ����ϴ� �Լ�
# paste(): ���� ���͵� ������ ���� ���� �� 

fruits<-c("Apple","Banana","Strawberry")
food<-c("Pie","Juice","cake")
# food+fruits �ϸ� ����
paste(fruits,food)
paste(fruits,"Juice")


# abs():������ ��ȯ
x<- -3:3
abs(x)

# log() : ���� e�� �ڿ��α�
log(1:5)

log(1:5,base=3) # ���� 3�� �α�
log(1:10,base=10)

#���� 2�� 10�� �α��Լ�
log10(1:10)
log2(1:10)

# exp() : �����Լ�
exp(1:5)


y<-exp(1:5)
log(y)


# factorial() : ���丮�� ���� ��

factorial(1:5)

choose(5,2) # 5�� �߿��� 2���� �����ϴ� ��� 5C2

# nCr = n! / r!(n-r)! => 120/12 = 10

# sqrt(): square root ������ 
sqrt(1:5)
# ��ȿ�ڸ����� �Ҽ��� �Ʒ� 7�ڸ��� �ִ�
options("digits") # ��ȿ�ڸ���

# ��ȿ�ڸ��� ���� �ݿ�
signif(456.789,digits=2)
signif(456.789,digits=3)
signif(456.789,digits=4)

# �ݿø�
round(456.789,digits=1)
round(456.789,digits=2)
round(456.789,digits=3)

round(456.789,digits=1)
round(456.789,digits=-1)
round(456.789,digits=-2)
round(456.789,digits=-3)


# 1���� 10���� ���� ���� ������ �������� ���Ѵ��� 
# �Ҽ����� 2�ڸ����� ���

round(sqrt(1:10),2)



# �ݿø� ���ڰ� 5�ΰ�� ����� ¦���� �ݿø�
round(11.5)
round(12.5)

round(12.51)
round(12.49)

# floor : ���� ����� ������ �ݿø�
# ceiling : ū ���� ����� ������ �ݿø�
# trunc : 0�� ���� ����� ������ �ݿø�

ceiling(456.78) #457
ceiling(-456.78) #-456

floor(456.78) # 456
floor(-456.78) # -457

trunc(456.78) # 456
trunc(-456.78) # -456

# Inf : ���Ѵ� 
3/0
5-Inf
Inf*Inf
Inf*(-Inf)

# r������ 1.8*10�� 308�� ���� ǥ������
10^306 # 1e+306
2*10^308 # Inf


is.infinite(10^306) # FALSE 
is.infinite(10^307) # FALSE
is.infinite(10^308) # FALSE
is.infinite(10^309) # TRUE
is.infinite(2*10^308) # TRUE


# NaN (Not a Number) : ���ڰ� �ƴ�, ��� ����� ������ �� ����
Inf/Inf
Inf*0
log(-2)
NaN+3

is.nan(Inf*0)


# NA(Not Available) : ������
k<-NA
K+2


# ���п� ���Ǵ� �Լ�
z<-1:5
z
sum(z) # ��ҵ��� �� ����
prod(z) # ��ҵ��� �� ����
min(z) # ��ҵ� �� �ּڰ��� ����
max(z) # ��ҵ� �� �ִ��� ����
mean(z) # ��ҵ��� ��հ��� ����
median(z) # ��ҵ��� �߰����� ����
var(z) # ��ҵ��� �л��� ������
sd(z) # ��ҵ��� ǥ�������� ����
range(z) # ��ҵ��� �ִ밪�� �ּҰ�

z<-c(z,NA)
z # 1  2  3  4  5 NA

# NA�� �־ �ٸ�������� �Ұ��������� 
# ��� ó���ϸ� ������ ?

#  NA�� ����
sum(z, na.rm = TRUE)
sum(na.omit(z))



# cumsum�Լ� : ������
traffic.death<-c(10,20,30,20)
cumsum(traffic.death)

traffic.death<-c(10,20,NA,30,20)
cumsum(traffic.death)


# diff�Լ� : ���� ���� ���� ���� �� 
traffic.death<-c(10,20,30,20)
diff(traffic.death)

1:10
diff(1:10)
diff(1:10,lag=3) # 3ĭ ������ ���Ұ��� �� 



# union():�� ���Ϳ� ���� ������
p<-1:10
q<-6:15
union(p,q)

# intersect():�� ���Ϳ� ���� ������
p<-1:10
q<-6:15
intersect(p,q)

# setdiff():�� ���Ϳ� ���� ������
p<-1:10
q<-6:15
setdiff(p,q)

# setequal(): �� ������ �������� Ȯ���� �� 
p<-1:10
q<-6:15
setequal(p,q)

# is.element() : ù��° �μ��� ���� ���� �ι�° ������ ��������
is.element(3,1:5)
is.element(6,1:5)


# ���� �ε���
num <- 0:30
num
num[5]
num[5:10] # ���̽�� ������ �ٸ��� ����
num[c(2,5,10,27)]


prime<- c(2,3,5,7,11,13)
idx<-c(1,3,5)
prime[idx] # �̷���� �м��� �� ���̳���

prime[-3] # 3�� �ε����� ���ܽ�Ű�� ������ ���

prime[-2:-4] # 2~4�� �ε����� �����ϰ� ������ ���
prime[-(2:4)] # ���� ����


prime<- c(2,3,5,7,11,13)
length(prime)

prime[1:(length(prime)-2)] # 1~4������ �ε���

prime[-length(prime)]

# Ư����ġ�� ���(������) �ٲٱ�
prime[2] <- 30
prime

prime[c(3,4)] <- c(30,40)
prime



# 1. : ������ Ȱ�� ���� ����

#1~10
#10~1
#1~10~1


c(1:10)
c(10:1)
c(1:10,9:1)

# 2. 3.141592�� ���� �ݿø� ���� �Լ��� �پ��� ������� Ȯ���غ��ÿ�
# 
# ex) siginif(pi, digits=3)

signif(3.141592,3)
round(3.141592, 2)
ceiling(3.141592)
floor(3.141592)
trunc(3.141592)

# 3. 
# Ű: 180, 160, 165, 185, 155
# ������:75, 70, 60, 100, 65
# BMI�� ���Ͻÿ�. BMI=������(KG)/Ű(m)����
# bmi�� 25���� ū ����� �����Ը� ����Ͻÿ�.

height<-c(180, 160, 165, 185, 155)
weight<-c(75, 70, 60, 100, 65)
BMI<-weight/{(height*0.01)^2}
weight[BMI>25]


#4.sum�Լ��� ���������� �̿��Ͽ� 1~100���� ���� ��� 7�� ����� ���� ������ ���Ͻÿ�.
num<-c(1:100)
sum(num%%7==0)


#5. ���� x�� 1~10���� ���� �Ҵ��ϰ� �� ������ ���0�� ǥ������1�� ǥ��ȭ�Ͻÿ�.
# ǥ��ȭ= (�� data - ��ü data���)/��ü dataǥ������
x<-c(1:10)
x-mean(x)/sd(x)



