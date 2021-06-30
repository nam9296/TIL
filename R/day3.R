# �迭
# - ����� �Ϲ�ȭ�� ������ ����, ������ �Ӽ����� ���� ����
# ����(1����), ���(2����) ��� �迭�̶�� �� �� ����
# dim�Լ��� �迭 ����


a<-1:24
dim(a)<-c(3,4,2) # 3�� 4�� 3���� 2���� ��
a

# array�Լ� : ������ �迭 ����

ary<-array(1:24,c(3,4,2))
ary
ary[1,3,2]
ary[1,,]
ary[,1,]
ary[,,2]

#ary�迭�� 2��° �鿡 �ִ� 1�� ���� ���� ����
ary[,1,2]

#2���� ��ķ� ���
ary[,1,2,drop=FALSE]



# list() : ����Ʈ 
# �پ��� ������ Ÿ���� ������ �� ����
# ���Ϳ� ����� ������ ������ Ÿ���� ��� ���ƾ���
lst<-list(0.6,0.9,0.5)
lst
# [[1]]�� ������ ��ġ(�ε���)�� �ǹ�
# [1]0.6�� ������ ��
# ����Ʈ�� ��Į��, ����(����/����), ���, �Լ� ���� ���

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
# �̸��� �ָ� [[1]]������ $�̸����� �����

lst$n1

lst
names(lst)
length(lst)

# lst[[n]]
#:lst����Ʈ�� n��° ���Ұ� ����, ������ ���� ������ �״�� ������ �����

#lst[n]
# : n��° ���Ұ� ����, ���Ұ� ����Ʈ �������� ����� ��.

product<-list("a001","mouse",30000)
product
product[[3]]
product[3]

# class()
# Ÿ���� Ȯ���ϴ� �Լ�
class(product[[3]])# numeric
class(product[3]) # list

product[[3]]*0.9
# product[3]*0.9 �� ���ڰ� �ƴϹǷ� �����߻�

# 2�� �̻��� ����Ʈ ��Ҹ� �Ѳ����� ����, ���� ����¸���Ʈ
product
product[c(1,2)]

product[c(TRUE,FALSE,TRUE)]


product[-1]


# �̸��� �����ϱ�
product<-list(id="a001",name="mouse",price=30000)
# 1.
product$name
# 2.
product[["name"]]


# �ΰ� �̻��� ���� ����, ����� ����Ʈ
product[c("name","price")]


product[["name"]]
# product[["nn"]] ���� �̸����� �ϸ� NULL
# product[[4]]�����߻�

lst<-list(one=1,two=2,three=list(a=3.1,b=3.2))
lst

lst[["three"]]
lst$three
# 3��° ��Ҹ� ����, ���� ��� ���� ����Ʈ

lst$three$a
lst[["three"]][["a"]] # ����
lst[["three"]]["a"] # ����Ʈ

# ����Ʈ ���� : [[]], $ ��ȣ ����Ͽ� ��� ����
product<-list(id="a001",name="mouse",price=30000)

# product[["price"]]<-50000
# product[[3]]<-50000
# product$price<-50000


product[3]
class(product[3])
# product[3]<50000
# ���� 1���� �Ҵ��� ���� [[]],[] �Ѵ� ��밡��



# �ϳ��� ���ҿ� ���� ���� ���� �Ҵ��� ���� [[]] �� []�� �ٸ�
product<-list(id="a001",name="mouse",price=30000)
# [[]]�� �Ҵ�Ǵ� �����Ͱ� ��������
# []�� �Ҵ��ϰ��� �ϴ� ���� ����Ʈ�������� ��ȯ�ؾ���

product[[3]]<-c(40000,50000)
product

# product[3]<-c(20000,30000) ����
product[3]<-list(c(20000,30000))
product

# �ΰ� �̻��� ���� ������ ���ÿ� �����Ҷ��� []���
product[1:2]
product[1:3]<-list("a02","monitor",999)
product


product[[4]]<-c("domestic","export")
product

product$madein<-c("korea","india")
product

product[["madein2"]]<-c("ac","ext")
product




#����Ʈ�� ������ ���Ҹ� �ѹ��� �߰�(����Ʈ ������ ����,Ÿ���� ��� ���� ��쿡�� ���� ������ ����)

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

# ����Ʈ���� ���� ���Ŵ� NULL�� �Ҵ�
mylist[["two"]]<-NULL
mylist

mylist[c("one","three")]<-NULL
mylist


n<-c("one","two","three")
v<-c(100,200,300)
mylist<-list()
mylist[n]<-v
mylist

# ���ǿ� ���� ���� ����
mylist<200
mylist[mylist<200]
mylist[mylist<200]<-NULL
mylist


# ����Ʈ ���� (���Ͱ��հ� ����)

w1<-list("a","b","c")
w2<-list("d","e","f")
w3<-c(w1,w2)
w3


# r�� ��ġ���� ���� �Լ� ��κ����� ���� �ڷᱸ���� ���
mydata<-list(1.5,2.0,3.5,4.5)
# ���� ����Ʈ�� ����� �����͸� �����Ϸ���, ���ͷ� ��ȯ
# unlist�Լ� : ����Ʈ -> ����

class(mydata)
class(unlist(mydata))
mean(unlist(mydata))
max(unlist(mydata))


# ������ ������
# ��� ���� ����, 2���� ���� (��İ� ����)
# ����� ��� ������ Ÿ���� ��ġ
# �������������� ���� �ٸ� ������ Ÿ���� ���� �� ����.(����Ʈ�� ����)
# ������ ��������(2���� ����), ����Ʈ��(1��������)

# ������ ��������
# ������ ������ ���ͷ� �̷���� ����Ʈ�� 
# ������ҷ� �ϴ� ������ ����


# data.frame() �Լ��� �̿��Ͽ� ���ͷ� ���� ������ �������� ����
v1<-c("a1","a2","a3")
v2<-c(10,20,30)
v3<-c("x","y")
data.frame(v1,v2)
# data.frame(v1,v2,v3) ������ �� row�� ���� �ٸ�
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
# 100(obs, instance, object)���� �̹���
# �� �̹��� �������� ������?10000����, feature�� 10000�� ����,
# ������ �̹����� 10000���� ������ (0,20,...,255) ��ġ�� ������ ǥ�ð� ��
# ��Ŭ����� �Ÿ� �Ǵ� �ڻ��� ���絵 ���� �˰����� ��� �Ÿ� ����� ����
# ������ �����͸� ã�Ƴ� �� ����.



# �� �̸����� Ư�� ���͸� ����
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
# ���� -> ������������ ������ �� ������ Ÿ���� ���ͷ� ����
#(�����͸� Factor���·μ� string(���ڿ�)�� �аڽ��ϱ�?)

stringsAsFactors=FALSE
# ���ͷ� ���ڿ��� ���� �ʰڴ�. �� ���ڿ��� �аڴ�.

stringsAsFactors=TRUE
# ���ͷ� ���ڿ��� �аڴ�. �� ���ڿ��� ���ͷ� �аڴ�.


data.frame(id=v1, price=v2, name=v3, stringsAsFactors = TRUE)
str(p)



# ���ڿ� �� 10��, stringsAsFactors=False
# 2�� ���� (chr-> factor��ȯ), 8�� ���ں���

# as.data.frame �Լ�
# ���, ����Ʈ�� ���� ������ ������ ����
mat<-matrix(c(1,2,3,4,5,6),ncol=2)
mat
# ���->������������
num<-as.data.frame(mat)
colnames(num)# �� �̸� ���
colnames(num)<-c("d1","d2")
num


# ����Ʈ->������������
v1<-c("a1","a2","a3")
v2<-c(10,20,30)
v3<-c("x","y","z")
lst<-list(v1,v2,v3)
p<-as.data.frame(lst)
colnames(p)
colnames(p)<-c("id","name","price")
p


# length�Լ�
# ��Ŀ��� �������� ����(������ ����)
# �����������ӿ����� column�� ����
length(p)
ncol(p)
nrow(p)




# datasets��Ű�� 
# r ��ġ�� �⺻������ ����Ǿ� �ִ� ������ ��

state.abb# �̱� 50������ ����
state.name
state.region
state.area # ��渶��(����)

str(state.abb)
str(state.name)
str(state.region)
str(state.area)
table(state.region)

us.state<-data.frame(state.abb,state.name,state.region,state.area)
us.state

str(us.state)

# state.name �� ����
us.state$state.name
#[[]] or [] ����Ͽ� �� ����
#[[]] : �� �ϳ��� ����or ���ͷ� ���
# [] : ������ �������� ����, �ϳ� �Ǵ� �������� ���� ������ �� �ִ�.
us.state[[2]]
str(us.state[[2]])

us.state[2]
str(us.state[2])

us.state[c(2,3)]
str(us.state[c(2,3)])

# ��� �ε��� ��� ����
us.state
us.state[,2]
us.state[,2, drop=FALSE]
# ��Ŀ����� drop=FALSE �����, ��°���� Ÿ���� ���
# �����������ӿ����� drop=FALSE �����, ��� ����� Ÿ���� ������������

us.state[,c(2,4)]

us.state[["state.name"]]
us.state$state.name
us.state[,"state.name"]

us.state[c("state.name", "state.area")] #����Ʈ �ε���
us.state[,c("state.name", "state.area")] # ��� �ε���





id<-c("a1","a2","a3")
price<-c(10,20,30)
name<-c("x","y","z")

product<-data.frame(id,name,price)
product
str(product)


#rbind(): �����������ӿ� �� �߰�
product<-rbind(product,c("a4","k",40))

# 4�� �� ����
product<-product[-4,]

product


# ���� �� �߰�
new.rows<-data.frame(id=c("a5","a6"),
           name=c("a","b"),
           price=c(50,60))
new.rows
product<-rbind(product,new.rows)
product

# as.numeric()
# price�� ���ڿ��� �νĵ����� ���������� ����
product$price<-as.numeric(product$price)
str(product)

#1. 
#���� ����Ʈ���� A�� a�� �����Ͻÿ�
#list(c(3,5,7),c("A","B","C))
a<-list(c(3,5,7),c("A","B","C"))
a[[c(2,1)]] <- "a"
a

# 2. 
# ���� ����Ʈ�� �߰����� �� �⸻���� �����̴�. 
# �߰����� ���, �⸻���� ���, ��ü ����� ����Ͻÿ�
# list(math=list(95,90),eng=list(80,90),kor=list(85,80))

b<-list(math=list(95,90),eng=list(80,90),kor=list(85,80))

# �߰����� ���
b.sum1<-unlist(b[[1]][1])+unlist(b[[2]][1])+unlist(b[[3]][1])
b.sum1/3

# �⸻���� ���
b.sum2<-unlist(b[[1]][2])+unlist(b[[2]][2])+unlist(b[[3]][2])
b.sum2/3

# ��ü ���
mean(unlist(b))


# 3.
# ������ 1��~12������ ����� ����̴�.
# -2.4, 0.4, 5.7 12.5, 17.8, 22.2, 24.9, 25.7, 21.2, 14.8, 7.2, 0.4
# 1) �� �̸�(Jan~Dec)�� ������ ����Ʈ�� ����ÿ�.
# 2) 0�� �̸��� ���� �����Ͻÿ�
# 3) ����� ��º��� ���� ���� �����Ͻÿ�.
# 4) ����� ��º��� ū ���� ����Ʈ���� �����Ͻÿ�.

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
# ����Ʈ list(a=1, b=2)�� ���� pi�� �����Ͽ� ���ο� ����Ʈ�� �����ϰ�,
# ������ ����Ʈ���� pi�� �����Ͻÿ�.
d <- c(list(a=1,b=2),pi)
d[[3]]


# 5.
# 1. ��� X�� ������ ���� ���ǵǵ��� R�� �ۼ��϶�.
#   c1 c2 c3
# r1  1  4  7
# r2  2  5  8
# r3  3  6  9
# �� matrix() �Լ��� �̿��϶�.
mtx<-matrix(1:9,3,3,dimnames = list(c('c1','c2','c3'),c('r1','r2','r3')))
mtx

# �� cbind()�� rbind() �Լ��� �̿��϶�.

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

# �� dim() �Լ��� �̿��϶�.
mtx<-c(1:9)
dim(mtx)<-c(3,3) 
dimnames(mtx)<-list(c('r1','r2','r3'),c('c1','c2','c3'))
mtx

# 6. 
# �� ������ ��� X�� ���� ������ �˾Ƴ��� ����� R�� ���϶�.
# �� ��� ���� ����.  �� �຤�� �� �������� �̸�.  �� ������ ����

#1)
nrow(mtx)
ncol(mtx)

#2)
rownames(mtx)
colnames(mtx)

#3)
length(mtx)

# 7. 
# ���� �� ��� A, B�� ���� ������ ���϶�.
# A=matrix(c(1,4,1,0,1,2), 2, byrow=T),    B=rbind(c(1,0,1),c(-1,1,-1))
# �� A+B, A-B, B*A, B/A
# �� ��� A�� 2�� ���͸� c(1,2,1)�� ġȯ�϶�.
# �� ��� B�� 1�� ���Ϳ� 2�� ���͸� ��ȯ�϶�.
# �� ��� A�� 2���� �����϶�.
# �� ��� B���� 1���� ���� ���Ҹ� 0���� ġȯ�϶�.

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
# ��İ� �迭(array)�� �������� ���ϰ�, 3��2��3 �迭�� ���� �ϳ� �����ƶ�.


# - ����� 2���� �����̰�, �迭�� 1,2,3���� �����̴�
array1 <- 1:18
dim(array1) <- c(3,2,3) 
array1
# 3��2��3 <=> 3�� 2��, 3���� ��

# 9. 
# ������ ���� ��ȣ(ID), ����(name), ����(score)�� �������� �ϴ� ����Ʈ�� �ִ�. ������ ���϶�.
# L=list(ID=c(1,2,3), 
#        name=c('Kim', 'Lee', 'Park'),
#        score=c(80, 95, 75))
# 
# �� length(L)�� ���̸�, �̰��� ������ �ǹ��ϴ°�?
# �� �̸� ���� 75�� 80���� �����϶�.
# �� L$name=='Park'�� ����� ����, ������ �ǹ��ϴ��� �����϶�.
# �� L$score[L$name=='Park']�� ����� ����, ������ ������ �ǹ��ϴ��� �����϶�.
# �� 1�� �л��� �̸��� ������ �˾Ƴ��� ������ ����� ���ƶ�.

L=list(ID=c(1,2,3),
       name=c('Kim', 'Lee', 'Park'),
       score=c(80, 95, 75))
L
# ��
length(L) #3 key�� �� , ��������� ����

# ��
L[[3]][3]<-80
L

# ��
L$name=='Park' # FALSE FALSE  TRUE
# name ���Ŀ� 'Park'�� ������� ���θ� bool���·� ���

# ��
L$score[L$name=='Park'] # 80
# name�� 'Park'�� ����� ��ġ�� score���Ŀ����� �ε���/ Park�� ������� ������ �� �ִ�.

# ��
c(L[[2]][1],L[[3]][1])


# 10. 
# ������ ǥ�� ���������������� �ۼ��� ���ƶ�.
# 
# id	age	sex 	height	weight
# 1	21	'��'	175	80
# 2	22	'��'	165	55
# 3	31	'��'	155	45
# 4	40	'��'	160	50

id <- c(1:4)
age <- c(21,22,31,40)
sex <- c("��","��","��","��")
height <- c(175,165,155,160)
weight <- c(80,55,45,50)
data.frame(id,age,sex,height,weight)



# 11. 
# ���� �����͸�(�ڷᱸ���� ��������) ������ ��, ��Ŭ����� �Ÿ��� Ȱ���Ͽ� 
# ����ΰ� ���� �����ϰ� ������ ��(�Ÿ��� �����) ����� �̸��� �Ÿ��� 
# ����Ͻÿ�.
# 
# critics={
#   'BTS':{'����':5, '���̷ο�ҹ�':4, '��������':1.5},
#   '�����':{'����':4,'���̷ο�ҹ�':5, '��������':2},
#   '���座��':{'����':2.5, '���̷ο�ҹ�':2, '��������':1},
#   'Ʈ���̽�':{'����':3.5, '���̷ο�ҹ�':4, '��������':5}
# }

BTS<-c(5,4,1.5)
�����<-c(4,5,2)
���座��<-c(2.5,2,1)
Ʈ���̽�<-c(3.5,4,5)

a<-list(BTS=BTS,�����=�����,���座��=���座��,Ʈ���̽�=Ʈ���̽�)
str(a$BTS[1]-a$�����[1])
BTS��<-sqrt((a$�����[1]-a$BTS[1])^2+(a$�����[2]-a$BTS[2])^2+(a$�����[3]-a$BTS[3])^2)
BTS��

�����<-sqrt((a$�����[1]-a$���座��[1])^2+(a$�����[2]-a$���座��[2])^2+(a$�����[3]-a$���座��[3])^2)
�����

Ʈ�ͼ�<-sqrt((a$�����[1]-a$Ʈ���̽�[1])^2+(a$�����[2]-a$Ʈ���̽�[2])^2+(a$�����[3]-a$Ʈ���̽�[3])^2)
Ʈ�ͼ�

#BTS���� ���� �����Ƿ� BTS�� ���� ������ ������ �־���.