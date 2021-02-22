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


# �Ҹ�����
p
p<10
p[p<10] # p<10 ���� ���� ���鸸 ���� ���


p
p[c(TRUE,TRUE,FALSE)]

# which(): ������ -> TRUE��ġ �ε��� ���� �Լ�
# which.max(),min()

data<-c(100:111) # 12�� ������!(1~12���� �����Ͷ�� �غ���)
data
which(data>105)

#month.abb�� ����ϴ� ������� ���� ����
month.abb[which(data>105)]
month.name[which(data>105)]

which.min(data)
which.max(data)
#����� �ڷ�� �߿��� �ּ�,�ִ��� �ε����� �����


# ���Ϻ� ������ ����ڼ� ������
traffic.death<-c(100,90,80,70,120,150,200) # ��~�� �����

# ����� ����� ��
traffic.death[6]

# names : ������ ��ҿ� ���� �̸��� ����
names(traffic.death)<-c("mon","tue","wed","thu","fri","sat","sun")
names(traffic.death)
traffic.death["sat"]

# ����� ���� 100�� �̻��� ���ϸ� ���
traffic.death[traffic.death>=100]
names(traffic.death[traffic.death>=100])


# ����(factor) : ī�װ��� �����ϴ� �������� ���Ǵ� ������ ������
# ����(level) : ������(����)�� ���Ե� ���ְ�
# factor()�Լ� : ������ �Ĥ����ͷ� ����ϰ��� �ϴ� ���� �Ǵ� ���� ���͸� ���ͷ� ��ȯ���ִ� �Լ�

review <- c("good","good","bad","indifferent",
            "bad", "good") 
# ���ں���

review.factor<-factor(review)
review.factor

# str() : �������� ������ �����ִ� �Լ� (structure)
str(review.factor)
str(review)


# ������ -> ���ں��ͷ� ��ȯ
as.numeric(review.factor)


everyday<-c("mon","mon","fri","tue","tue")
everyday.factor<-factor(everyday)
everyday.factor
# �̷��� �ϸ� Ʋ����� ������ 3���ۿ�����

#�̰� �´� ��� (�������� �������� �� �ִ�.)
everyday<-c("mon","mon","fri","tue","tue")
everyday.factor<-factor(everyday, levels =c("mon","tue","wed","thu","fri","sat","sun"))
everyday.factor
# �������� ���� �������ָ� ���� ������ ������� ���´�.

#���������� �˰��ʹ�.
levels(everyday.factor)

levels(review.factor)<-c("B","G","I")
review.factor


# nlevels() : levels�� ������ �˰��ʹ�
nlevels(review.factor)
length(levels(review.factor))

# ��������(ordered factor) : ������ �ִ� ������ ������
eval<-c("Medium","Low","High","Medium","High")
eval.factor<-factor(eval)
eval.factor

eval.ordered<-factor(eval, levels=c("Low","Medium","High"),ordered=TRUE)
eval.ordered

# table() : �� ������ ��
eval.factor
table(eval.factor)
table(eval.ordered)


# ���ں��� -> ���ͷ� ��ȯ
# ���� :1, ���� :2
sex<-c(2,1,2,2,1,0)
factor(sex)
sex.factor<-factor(sex,levels = c(1,2), labels=c("Male","Female"))
sex.factor





# ��� : 2���� ����, ������ ������ �ο�(dim)
# ����� ���ͷ� ����, ���ʹ� Ÿ���� ��� ����
# matrix�Լ��ε� ��� ����
v<-1:12
dim(v)<-c(3,4) # ��:3, ��:4
v
dim(v)


#matrix
matrix(data=v,nrow =3,ncol = 4 ) 
# ���������� �����

matrix(data=v,nrow =3,ncol = 4 ,byrow=TRUE) 
# ��������� �����

# ���� �ᵵ ��
matrix(v,3, 4 ,TRUE) 


#��� ���� �̸��� �Է��غ��� 
rnames<-c("r1","r2","r3")
cnames<-c("c1","c2","c3","c4")

matrix(data=v,nrow =3,ncol = 4 ,byrow=TRUE, dimnames=list(rnames,cnames)) 



matrix(0,3,4)
matrix(NA,3,4)
mat<-matrix(v,ncol=4)
# ����� 2��������
str(mat)
dim(mat)
dim(mat)[1]
dim(mat)[2]
nrow(mat)
ncol(mat)
length(mat) # ������ ����

# �� ���͸� �����ؼ� ����� ���� �� �ִ�
v1<-1:5
v2<-6:10

rbind(v1,v2)
cbind(v1,v2)

# ���Ϳ� ����� �����Ͽ� ���ο� ����� ����
1:3
4:6
cbind(1:3,4:6,matrix(7:12,3,2))


# ��İ� ��ð� �����Ͽ� ���ο� ��� ����
matrix(1:6,2,3)
matrix(7:12,2,3)
rbind(matrix(1:6,2,3),matrix(7:12,2,3))

c<-1:12
mat<-matrix(v,3,4)
mat


mat[1,]
mat[,1]


# �� �Ǵ� ���� 2���� ������ �״�� ����
mat[1,,drop=FALSE] # ������ ��ķ� ���
mat[,3,drop=FALSE] # ������ ��ķ� ���

mat
mat[2:3,]
mat[,3:4]
mat[1:2,2:3]
mat[c(1:3),]      

#Ư�� ���� �����ϱ�
mat[,c(1,4)]
mat[,-c(2,3)]



# ����� Ư�� �κ��� ��ġ�� ���� ��
mat[1,3]<-77
mat[2,]<-c(22,55,22,55)
mat

mat[2,]<-c(22,55) # �̷��� �ᵵ �ݺ��ǰ� �Ǿ�����

mat[2:3,3:4]<-c(1,2,3,4)
mat




# quiz 
# matrix�� �����Ͻÿ�
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
city.distance.mat["seoul",]
city.distance.mat["seoul","busan"]
city.distance.mat[,"seoul"]
city.distance.mat[c("seoul","gwangju"),]


# ��İ� ���̰� 1�� ��Ʈ(��Į��)���� �����
w<-c(1,2,3,4,5,6)
mtx<-matrix(w,2,3)
mtx

mtx+1
mtx*2

# ��İ��� ������ ���� �� ����� ������ ���ƾ���

matrix(1:6,2,3)
matrix(6:1,2,3)
matrix(1:6,2,3)+matrix(6:1,2,3)

# element-wise product
matrix(1:6,2,3)*matrix(6:1,2,3)

# ����� ������ ���� ����� ���� ������ ���� �࿭�� ���� ������ ��ġ �ؾ���
w
matrix(w,2,3)
matrix(w,3,2)
matrix(w,2,3)%*%matrix(w,3,2)# ����ǰ� %*%


# ��İ� ������ ��

mtx<-matrix(w,2,3)
mtx%*%1:3 # ���̰� 3�� ���Ͱ� 3�� 1���� �ڵ���ȯ��


# t() : transpose ��ġ��� �����
mtx
t(mtx)
t(t(mtx))

rowSums(mtx)
colSums(mtx)
rowMeans(mtx)
colMeans(mtx)


# ��������

# 1. 
# ���� x�� 1~10���� �� �Ҵ�, y�� 3~1���� �� �Ҵ�
#- letters ������͸� �̿��Ͽ� x�� ���ĺ� �ҹ��� �̸� �ο�
#- x+y�� �����ϰ� ����� ����

x<-c(1:10)
y<-c(3:1)
letters[x]
x+y

# [1]  4  4  4  7  7  7 10 10 10 13
#����޽���(��): 
#  In x + y : �� ��ü�� ���̰� ���� ������迡 ���� �ʽ��ϴ�


#2. 
#���� 2,5,3�� ���ҷ� ���� ���� ������ �� rep�Լ��� �̿��Ͽ� ���� ���͸� ����
#- 2,5,3,2,5,3,2,5,3,2,5,3,2,5,3
#- 2,5,3,2,5,3,2,5,3,2
#- 2,2,5,5,5,5,5,3,3,3

rep(c(2,5,3),5)
rep(c(2,5,3),length.out=10)
rep(c(2,5,3), c(2,5,3))


#3. 
#�ֻ����� 7�� ������ ���� 3,2,5,1,5,6,5�� ���� 
#1)���� ���� ������ ���� ���ͷ� �����Ͻÿ�.
#2)�� ������ one, two, ... six�� �̸� �ο��Ͻÿ�.
#3)������ �߻� �󵵸� ����Ͻÿ�.


dice<-factor(c(3,2,5,1,5,6,5), levels=c(1,2,3,4,5,6), labels = c('one', 'two', 'three', 'four', 'five', 'six'))
table(dice)



# 4. 
#1~12������ ���� ���ͷ� 3*4��� �����ϰ� ������ �����Ͻÿ�.
#���ĺ� �ҹ��� ��� ���� letters�� �̿��Ͽ� ��� ���̸��� ���� �����Ͻÿ�.
#   a  b   c   d
#a  1  4
#b  2  5   ...
#c  3  6       12

data<-c(1:12)
data.mtx<-matrix(data,3,4,dimnames=list(letters[1:3],letters[1:4]))
data.mtx


#5. 
#4������ ������ ��ķκ��� 1��°�� 3��° ���� �����Ͽ� �κ������ �����ϰ�,
#2��°�� 4��° ���� �����Ͽ� �κ������ �����ϰ�,
#�̵��� ���� �������� ������ ���ο� ����� �����Ͻÿ�.

new1 <-data.mtx[,c(1,3)]
new2 <-data.mtx[,c(2,4)]
new.mtx<-cbind(new1,new2)
new.mtx


#6. 
#4���� 5���������� ������ �� ��Ŀ� ���� 
#+, -, *, /, %*% ������ �����Ͻÿ�
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
#1~9999���� ������ 9���� ���� ���� ����� �����Ͻÿ�.
#������ �� �� ��� ������ �� �� ���� ������ 3*2 �κ������ ����ÿ�.
mtx<-matrix(1:9999,,9)
mtx[(nrow(mtx)-2):nrow(mtx),8:9]