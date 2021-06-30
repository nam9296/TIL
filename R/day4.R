id<-c("a1","a2","a3")
name<-c("X","y","z")
price<-c(1000,2000,3000)
product<-data.frame(id,name,price,stringsAsFactors = FALSE)
product
str(product)

# a4,s,4000�� �߰�
product<-rbind(product,c("a4","s",4000))
product

new.rows<-data.frame(id=c("a5","a6"),
           name=c("i","j"),
           price=c(5000,6000))

# ���ǻ��� : �� �̸��� �����ؾ���
product<-rbind(product,new.rows)


# cbind(): ���ο� ���� �߰�
cbind(product,madein=c("kor","chi","chi","kor","kor","usa"))
# �ٸ� ���
product$madein<-c("kor","chi","chi","kor","kor","usa")

# �ΰ� �̻��� ���� �߰�
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

lst[1] # list����
lst[[1]] # data.frame ����

str(lst[[1]])

rbind(lst[[1]],lst[[2]])

# rbind(lst[[1]],lst[[2]],...,lst[[120]])
# do.call(�����ϰ����ϴ� �Լ�,����Ʈ) 
#: ����Ʈ ���� ���� �� ������ �������� ��ġ�� �۾�
do.call(rbind,lst)


lst1<-data.frame(sex="f",months=1, weight=3.5)
lst2<-data.frame(sex="m",months=3, weight=4.5)
lst3<-data.frame(sex="m",months=4, weight=5.5)
lst4<-data.frame(sex="f",months=7, weight=6.5)
lst5<-data.frame(sex="f",months=8, weight=7.5)

lst<-list(lst1,lst2,lst3,lst4,lst5)
lst

# lst�� ����Ǿ� �ִ� ����Ʈ���� ��� �ϳ��� ���������������� ����
#do.call(rbind,lst)
#lst[1]<-as.data.frame(lst[1]) # ����Ʈ-> ������������
#lst[2]<-as.data.frame(lst[2])
#...
#lst[5]<-as.data.frame(lst[5])
#�̷��� �ص��Ǳ������� �ڷᰡ ������ ������ �۾��� �ƴϴ�.

# lapply(): ù��° �μ����� ����Ʈ, ���� �Լ�(�ݺ�)
lapply(lst, as.data.frame) 
# lst(����Ʈ)�� ����Ǿ� �ִ� �� ���ҿ� ���� 
# as.data.frame�� �ݺ��ؼ� �����ض�


do.call(rbind,lapply(lst, as.data.frame))
# lst(����Ʈ)�� ����Ǿ� �ִ� ������ ��ҿ� ����
# as.data.frame �Լ��� �����ϰ�, ��ȯ�� �����������ӵ���
# rbind�Լ��� ��� �����Ͽ� �ϳ��� ���������������� ����

# merge�Լ� : ������ �������� �����ϴ� �Լ�

state.x77
class(state.x77) # matrix

states<-data.frame(state.x77)
states
str(states)

row.names(states) # ���̸� ����

#���̸����� ���� ��ҷ� �߰��ϰ��ʹ�.
states$name<-row.names(states)
states
colnames(states)
#��ҷ� �߰������� ���̸��� ������
row.names(states)<-NULL
states
head(states)
tail(states)
tail(states,10)

#states���� Income�� 5000�޷� �̻� �ش�Ǵ� �ڷḦ ���
states[states$Income>5000,"name"]
states[states$Income>5000,c("name","Income")]

#states���� Area�� 100000 �̻� �ش�Ǵ� �ڷḦ ���(name, Area)
states[states$Area>100000,c("name","Area")]




#������������ ����(�⺻��:�������� ��(name)�� ��ġ�ϴ� �ุ ����:�������ִٸ� �������� �����ϴ� ���� ���)
merge(rich.states, large.states) #all=FALSE default

 #         name Income   Area
# 1     Alaska   6315 566432
# 2 California   5114 156361
# 3     Nevada   5149 109889

merge(rich.states, large.states,all=TRUE)
#  Area�� ���ǿ��� ���������� income�� ����� ���ǿ��� �����̾ƴ϶�� NA�� ����̵ǰ� �ݴ��Ȳ�� ��������

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

#subset(�����Ұ�,���ǽ�):��� ���� ����

states[states$Income>5000,]
# ���Ʒ� �Ѵ� ����� �����ϴ�
subset(states,Income>5000) 
#stateds���տ��� Income>5000������ �����ϴ� �κ������� ����

subset(states, subset=(Income>5000 & Area>50000),select=1:3) 
#&,| ���밡��
#select���� �̸��� �ü� ����
#�ΰ��� �ÿ��� c(Income, Illit eracy)

#name�� �˷���ī�� ��� ���� ����
subset(states, name=="Alaske")

mtcars
#mpg�� 30���� ū �ڵ��� ������ ���
#1
mtcars[mtcars['mpg']>30,]
#2
subset(mtcars,mpg>30)
subset(mtcars,subset=mpg>30)

#mpg�� 30���� ū �ڵ��� ������ ���

subset(mtcars,subset=mpg>30, select = mpg)

#�Ǹ���(cyl)�� 4�� �̸鼭 am�� 0�� �ڷ��� mpg,hp,wt�� ���


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
# subset�Լ� Sepal.Width, Petal.Length ���� ����
subset(iris, select = c(Sepal.Width, Petal.Length))

subset(iris, select = -c(Sepal.Width, Petal.Length))

subset(iris, select = -Sepal.Width)


# iris Sepal.Length�� Sepal.Width�� ����
iris$Sepal.Length/iris$Sepal.Width
# Ư������(feature engineering)
# �־��� ������ �÷����� ���� ������ �����Ͽ� ���ο� �÷����� ���� 
with(iris,Sepal.Length/Sepal.Width)

#with(iris,{
  #���ɹ� ���
#})

# ��� ���
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
# with ���� �ۿ����� stats��ü ������ ����

with(iris,{
  stats<<-summary(Sepal.Length)
  stats
})
stats

# <<- �� ����ϴ� �ۿ����� �ȴ�.


iris$Sepal.Ratio<-iris$Sepal.Length/iris$Sepal.Width

iris<-within(iris,Sepal.Ratio<-Sepal.Length/Sepal.Width)
iris

# with, within ���� �����ϴ�.(�ڵ��� ���� �ٿ���)
# �������� within�� ������ ������ ����
# with�� ������ ���� �Ұ���

within(iris,{
  ifelse(is.na(Sepal.Ratio),median(Sepal.Ratio,na.rm=T),Sepal.Ratio)
})
# Sepal/Ratio���� ���� na-> �߾Ӱ����� ��ü




#ifelse(is.na(Sepal.Ratio),median(Sepal.Ratio,na.rm=T),Sepal.Ratio)
#            ����                ��                         ����

#sqldf ��Ű�� : SQL ���ɹ��� ����� �� ����
install.packages("sqldf") #��Ű�� ��ġ
library(sqldf)# ��ġ�� ��Ű���� ���α׷����� �ҷ�����

#SQL(Structured Query Language) : 
# ������ ���̽��� �����͸� �˻�/����/����/�߰� �۾���
# ������ �� �ֵ��� ���ִ� ������ ��ӵ� �����ͺ��̽� ǥ�� ���Ǿ�
#�˻�(select)/����(update)/����(delete)/�߰�(insert into)
mtcars
sqldf("select*from mtcars")
# ��>mtcars�� ����Ǿ� �ִ� ���(*) �����͸� �����Ͻÿ��� �ǹ�
# �˻� = select ���� �÷� 1,....,���� �÷�n from table�̸�

sqldf("select cyl from mtcars")

sqldf("select cyl, hp, gear from mtcars")

sqldf("select cyl, hp, gear from mtcars", row.names=TRUE)

mtcars
sqldf("select * from mtcars", row.names=TRUE)

sqldf("select * from mtcars where mpg>30", row.names=TRUE)

sqldf("select * from mtcars where mpg>30 order by hp", row.names=TRUE)

sqldf("select avg(mpg) as avg_mpg from mtcars where mpg>30 group by cyl", row.names=TRUE)




state.x77
class(state.x77) # �迭��
st<-state.x77
# st�� ���������������� �ٲټ���
st<-data.frame(st)
colnames(st)
rownames(st)

# ����?
dim(st) # 50��, ����(��ó) 8��

rowSums(st)
rowMeans(st)


library(MASS)
head(cats)



# 1.���� ������ ���� R ���� ��Ÿ���ÿ�.
# 
# �� �ڷ� -0.2, 1, 2, 1.5, 2.2�� �ڷẤ�ͷ� x�� �����϶�.
x<-c(-0.2,1,2,1.5,2.2)
# �� "Kim", "Lee", "Park", "Lim"�� �ڷẤ�� name���� �����϶�. 
name<-c("kim","Lee","Park","Lim")
# �� 2���� 9������ �������͸� �����϶�.
2:9
# �� 0���� 10���� 0.5�� �����ϴ� �Ǽ� ���͸� �����϶�.
seq(from=0,to=10, by=0.5)
# �� ���� 1,2,3�� 3�� �ݺ��ϴ� ���͸� �����϶�.
rep(c(1,2,3),times=3)


# 2.x=c(2, -1, 3, 7, 0.5, 8)�� ����Ǿ��� ����. ���� ������ R ���� ���Ͻÿ�.
x=c(2, -1, 3, 7, 0.5, 8)
x
# �� 5��° ���Ҵ�?
x[5]
# �� ù ��°���� 3��°������ ���Ҵ�?
x[1:3]
# �� 6, 2, 4��° ���Ҹ� ���ÿ� ã�ƶ�.
x[c(6,2,4)]
# �� 3��° ���Ҹ� ������ ������ ���Ҵ�?
x[-3]
# �� x�� ���� �� 0���� ū ���� ã�ƶ�.
x[x>0]
# �� ¦�� ���ҵ��� ã�ƶ�.
x[x%%2==0]
# �� x���� Ȧ�����Ҹ� ã�� �����϶�.
x[x%%2==1]<-NA
x[is.na(x)==FALSE]


# 3.��Ű���� ����� ������ cats�� ���� 3���� ������ �����Ǿ� �ִ�.
# library(MASS) # MASS��Ű���� �ε�
# head(cats)    # cats�������������� �� �� ����

library(MASS)
head(cats)
# -���� �ڷ�(cats)�� �ڷ��� ���� ���Ͻÿ�
nrow(cats)
# -������ �����Կ� ������ ����(Bwt�� Hwt)�� ��հ� ǥ�������� ���϶�.
# ������ ��հ� ǥ������
mean(cats$Bwt)
sd(cats$Bwt)
# ������ ���� ��հ� ǥ������
mean(cats$Hwt)
sd(cats$Hwt)
# -������ �ϼ��� �����Կ� ������ ������ ��հ� ǥ�������� ���� ���϶�.

# 4. ���� d1, d2�� ������ ���� �� �� ������ �����ϱ� ���� �ڵ带 �ۼ��ϰ� ���� ���Ͻÿ�.
d1 <- 1:50
d2 <- 51:100

# d1, d2�� ���� ����Ͻÿ�.
d1
d2
# d2�� ����(������ ����)�� ���̽ÿ�.
length(d2)
# d1+d2, d2-d1, d1*d2, d2/d1�� ������ ����� ����Ͻÿ�.
d1+d2
d2-d1
d1*d2 
d2/d1
# d1, d2�� ������ ���� ���� ����Ͻÿ�.
sum(d1)
sum(d2)
# d1, d2�� �ִ� ��� ������ ���� ����Ͻÿ�.
sum(c(d1,d2))
# d2���� ���� ū ���� ���� ���� ���� ����Ͻÿ�.
min(d2)
max(d2)
# d2�� d1�� ������ ��հ��� ���� ���ϰ� �� ����� ���̸� ����Ͻÿ�.
mean(d1)
mean(d2)
abs(mean(d1)-mean(d2))


# 5.������ ���� ���� v1�� ������ ���� �� ������ �����ϱ� ���� �ڵ带 �ۼ��ϰ� ���� ���Ͻÿ�
# (������ Ǯ�� ���� v1�� ������ ����Ǳ⵵ �ϴµ�, ��� ������ ������ v1�� ������� �Ͽ� �ذ� �� ��).
# v1<- 30:100 ���� ���� ��,
v1<-30:100 
# v1���� 60���� ���� ���� ��� ����Ͻÿ�.
v1[v1<60]
# v1���� 70���� ���� ���� �� ������ ����Ͻÿ�.
length(v1[v1<70])
# v1���� 65���� ū ������ ���� ����Ͻÿ�.
sum(v1[v1<65])
# v1���� 60���� ũ�� 73���� ���� ���� ��� ����Ͻÿ�.
v1[v1>60&v1<73]
# v1���� 65���� �۰ų� 80���� ū ���� ��� ����Ͻÿ�.
v1[v1<65|v1>80]
# v1���� 7�� �������� �� �������� 3�� ���� ��� ����Ͻÿ�.
v1[v1%%7==3]
# v1���� 7�� ������� ���� 0���� �����Ͻÿ�.
v1[v1%%7==0]<-0
v1
# v1���� ¦���� ��� ���� ���� ����Ͻÿ�.
v1 <- 51:90
sum(v1[v1%%2==0])
# v1���� Ȧ���̰ų� 80���� ū ���� ��� ����Ͻÿ�.
v1[v1%%2==1|v1>80]
# v1���� 3�� 5�� ������� ����Ͻÿ�.
v1[v1%%3==0|v1%%5==0]
# v1���� ¦���� ���ؼ��� 2�� ���Ͽ� �����Ͻÿ�.
v1[v1%%2==0]<-v1[v1%%2==0]*2
# v1���� 7�� ������� ������ �� v1�� ������ ����Ͻÿ�.
v1[v1%%7==0]<-NA
v1[is.na(v1)==FALSE]

# 6. iris�����Ϳ���
# Sepal.Length Sepal.Width Petal.Length Petal.Width ���� ���� 
# (4.0, 3.0, 1.5, 0.15)�϶� ����Ǵ� ��(setosa, verisicolor, virginica)�� ����Ͻÿ�
# (4.0, 3.0, 1.5, 0.15)�� ���� ��Ŭ����� �Ÿ��� ����� �����͸� 9�� ã�Ƴ���
# 9���� �����Ϳ� ���� ���� �󵵼��� ������� ����
# ex) setosa:6, veri:2, vir:1 => setosa ����
iris
ex <- c(4.0, 3.0, 1.5, 0.15)
iris<-(rbind(iris,ex))
tail(iris)

temp <- t(iris[1:4])
iris$distance <- sqrt(colSums((temp-ex)^2))
table(head(iris[order(iris$distance),],9)$Species)


iris
# data(iris) ���� �����ͷ� ����Ű������ ��
iris


# ǥ��ȭ(���:0, ǥ������:1)
# ǥ��ȭ = (�� �� data- �� �� ���)/ �� �� ǥ������

# ����ȭ(0~1)
# ����ȭ =(�� �� data- �� �� �ּڰ�)/ (�� �� �ִ� - �� �� �ּҰ�)


misl<-mean(iris$Sepal.Length)
misw<-mean(iris$Sepal.Width)
mipl<-mean(iris$Petal.Length)
mipw<-mean(iris$Sepal.Width)

sisl<-sd(iris$Sepal.Length)
sisw<-sd(iris$Sepal.Width)
sipl<-sd(iris$Petal.Length)
sipw<-sd(iris$Sepal.Width)

# ǥ��ȭ = (�� �� data- �� �� ���)/ �� �� ǥ������
misl
dim(t(iris[1:4]))

tempIris<-t(iris[1:4])
tempIris


siris<-(tempIris-c(misl,misw,mipl,mipw))/c(sisl,sisw,sipl,sipw)
siris

t(siris)





# ��� �� ������ �ٸ��ɷ� �̿��� �� ����
# scale �Լ��� �̿��� ǥ��ȭ

data(iris)
scale(iris[,1])

data(iris)
#sd(iris[,1])

head(iris[,1]-mean(iris[,1]))/sd(iris[,1])
head(scale(iris[,1])) #���� ������

class(head(iris[,1]-mean(iris[,1]))/sd(iris[,1])) # vector
class(head(scale(iris[,1])) ) # matrix



# ����ȭ
(iris[,1]-min(iris[,1]))/ (max(iris[,1])- min(iris[,1]))

# iris�� 1��° ���� ���� ǥ��ȭ
(iris[,1] - mean(iris[,1])) / sd(iris[,1])

scale(iris[,1])


cbind(iris, scale=scale(iris[,-5]))

# apply(������, ��(1)/��(2), �Լ�)
apply(iris[,-5],2,scale) # �������� �Ѱ�
apply(iris[,-5],1,scale) # ������� �Ѱ�

# �����ð��� ��￹���� �����ϱ�ٶ�
apply(iris[,-5],2,function(x){(x-mean(x))/sd(x)})
# �����Ϳ� na�� �ִٸ�
siris<-apply(iris[,-5],2,function(x){(x-mean(x,na.rm=TRUE))/sd(x,na.rm=TRUE)})

cbind(iris,siris)





# ����ȭ
apply(iris[,-5],2,function(x){(x-min(x,na.rm=TRUE))/(max(x,na.rm=TRUE)-min(x,na.rm=TRUE))})

cbind(iris,ss=scale(iris[,-5]))
scale(iris[,-5])



#sd(iris[,-5])
#var(iris[,-5])
#mean(iris[,-5])  ���� ���ö� ����ϸ� ����

apply(iris[,-5],2,sd)
apply(iris[,-5],2,var)
apply(iris[,-5],2,mean)


