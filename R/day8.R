df<-read.csv("train.csv",header = T, na.strings="")
df
str(df)

View(df)

# �����跮 �Լ�
install.packages("psych")
library(psych)


# ������ �Լ��� ���Ե� ��Ű��
install.packages("Amelia")
library(Amelia)

missmap(df,col=c("red","grey"))# (����ġ��,�ٸ���)


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


# �ð�ȭ ��Ű��
install.packages("ggplot2")
library(ggplot2)

install.packages("GGally")
library(GGally)


df<-read.csv("train.csv",na.strings = "")
# ������(cor-relation)
ggcorr(df,nbreaks = 8, label = TRUE,
       label_size = 3, color="grey50")




mtcars
str(mtcars)
#match�Լ��� �̿��� �����ͼ� ����

a<-c(1,2,3,4,5)
b<-c(2,5,7,8,9)
# ù��° �μ� a�� �ι�° �μ��� ���° �ִ��� �˷���
# ���� ��쿡�� NA�� ��ȯ�̵�
match(a,b)
match(a,b,nomatch = 0)


car<-mtcars
car$name<-row.names(car)
head(car)
row.names(car)<-NULL
head(car)

# 145������ �Ѵ� ���� �� �ڵ��� �𵨷θ� �������������� ����
highhp.car<-car[car$hp>145,]
highhp.car

# car���� ���԰� 3200�Ŀ�� �̸� �ڵ��� �𵨷θ� �������������� ����
lightwt.car<-car[car$wt<3.2,]
lightwt.car

# ���԰� ������鼭 ���� �� �ڵ��� ���� ����ϰ��� ��
index<-match(highhp.car$name,lightwt.car$name)
lightwt.car[na.omit(index),]

# match�Լ� ��� %in% ������ ��� ����
vec<-10:1
vec
7%in%vec
c(20,15,11,9,8,3,1,0) %in% vec
match(c(20,15,11,9,8,3,1,0),vec)
!is.na(match(c(20,15,11,9,8,3,1,0),vec))

#%in%�����ڸ� �̿��Ͽ� ���� ����, ���� ���� ���� ����

idx<-highhp.car$name %in% lightwt.car$name
highhp.car[idx,]


# �����

# $ : �����ͷκ��� �ϳ��� ���Ҹ� ����,
#     �����������ӿ� �����ϸ� ���ͷ� ��ȯ

#[[]] : �����ͷκ��� �ϳ��� ���Ҹ� ����
#     �̸��� ��ġ�� ���� ���Ҹ� ���ð���,
#     ����Ʈ�� ������������ ��� ��� ����

# [] : �����ͷκ��� �������� ���Ҹ� ����

mtcars$mpg
str(mtcars)
mtcars[[1]]
mtcars[['mpg']]

mtcars[c(1,4)]
mtcars[c('mpg','hp')]

# ���� �ε����� ����ϸ� Ư�� ���Ҹ� ������ ����� ����
mtcars[-c(2,3,5,7:11)]
#Ư���� ����
mtcars[1]<-NULL
mtcars

# #����, ��� �ε����� ��� ��� ����
#mtcars[c(-1,2)]

iris
str(iris)

data(iris)
str(iris)
# ����1
#1~4���� �����ϰ� �ڵ带 ī�� ���ε�
iris[c(1:4)]
iris[c(1,2,3,4)]
iris[1:4]
iris[-5]


iris[,c("Sepal.Length","Sepal.Width")]

iris[,"Sepal.Length"]

iris[,"Sepal.Length",drop=FALSE]

class(iris[,"Sepal.Length",drop=FALSE])


iris["Sepal.Length"] 
#iris[,"Sepal.Length",drop=FALSE] �� ���� ���������������� ����

iris[,"Sepal.Length"] # ���ͷ� ����

iris[1:5] # 1~5 �������� ��ü�� ����
iris[1:5,] # 1~5 �� �ε��� �����Ͱ� ����


iris[1:5,c("Sepal.Length","Sepal.Width")]
iris[1:5,c(1,2)] # ���� ����


# ����2
# Sepal.Length�� 7 �ʰ��� ��ü �����͸� ����

iris[iris["Sepal.Length"]>7,]
iris[iris$Sepal.Length>7,]


subset(iris,
       select=c("Sepal.Length","Sepal.Width"),
       subset = (Sepal.Length>7))







# ������ -> �� -> ����/�з�

# �𵨸�?
# 1)�����͸� �Ʒÿ�(70%)/�׽�Ʈ��(30%) ���� ����
# 2)���� �Ʒÿ� ������ ������ ��(����/�з�)�� ����
# - ������(overfitting) : �Ʒ� �����ͷ� �� ��� >> �׽�Ʈ ������ ��
# - ���� : �����Ͱ� ���� -> ����, ������ �ʹ� ����(������)->�������(������),���߰�����
# 3)�׽�Ʈ





# ������ ������ ǥ�� ����
# sample�Լ�/ sample(�����ͼ�,ǥ������,�������⿩��)
# 1~10 �߿��� 5�� ���ڸ� �񺹿� ����
sample(1:10,5)# �⺻�� :replace=FALSE => (�񺹿�����)
sample(1:10,5,TRUE) # ��������

sample(1:10) # size �⺻�� : 10�� 


# sample�Լ� ������ ������ �߻�
#�õ�(seed)
# seed�� �����ϰ� �ָ�, �Ź� �߻��Ǵ� ������ �����ϰ� �����

# �õ尪 ����
set.seed(20210303)

sample(1:10)
# ������ -> �Ϻθ� �����Ͽ� �� ����
# ex) �����Ͱ� 1~10������ 10��
# ���� : 1245679�� ����(�Ʒõ�����)->��->�� (3,8,10��)
# ��Ȯ�� 30%

set.seed(1)
sample(1:10,5,replace = TRUE)

# ���������������κ��� ������ ����

sample(iris,3)
# ������������ �����κ��� ǥ������
set.seed(1)
# �� ��ȣ ����
index<-sample(1:nrow(iris),5) 
iris[index,]


# �Ϲ������� �ߺ����� ����
# duplicated() : �ߺ����θ� ���������� ���
duplicated(c(1,2,3,1,1,4,3))


id<-c("a001","a002","a003")
name<-c("mouse","keyboard","usb")
price<-c(3000,9000,5000)
product<-data.frame(id=id,name=name,price=price)
product

# c("a001","mouse",3000) �߰�
product<-rbind(product,c("a001","mouse",3000))
duplicated(product)

product[!duplicated(product),]
product[-duplicated(product),]

# ! : �������� ���� ����
# - : Ư�� �÷��� ��󿡼� ������ ��

product.uniqe<-product[!duplicated(product),]
# which(TRUE�� �ش�Ǵ� index�� ã����), duplicated�Լ��� �̿��ؼ� �ߺ���ġ �ľ�
duplicated(product)
which(duplicated(product)) #4 �ߺ��ڷῡ ��ġ

# �ߺ��� ����
idx<-which(duplicated(product))
product.unique<-product[-idx,]
product.unique

# �ߺ����� �ľ����� �ʰ�, ���Ÿ� ����
product
unique(product)

# complete.cases �Լ� : ������ ����
#   - ������ ���θ� TURE/FALSE�� ���
airquality
str(airquality)
complete.cases(airquality)
# �������� ���� �ุ ����
airquality[complete.cases(airquality),]
# �������� �ִ� �ุ ����
airquality[!complete.cases(airquality),]


airquality.nona<-airquality[complete.cases(airquality),]
str(airquality.nona)

# ȣĪ        ����
# ���ָӴ�    45  
# ������      47
# �ư���      22
# �ҳ�        15
# �ҳ�        16
# ...
# NA          48

airquality.nona2<-na.omit(airquality)
airquality.nona2


# cut�Լ� : �����͸� ������ ���� �׷캰�� ����ȭ
# () : ������
# [] : �󱸰�
# (3,10) : 3�ʰ� 10�̸�
# [3,10] : 3�̻� 10����

iris$Sepal.Width
min(iris$Sepal.Width)
max(iris$Sepal.Width)

cut(iris$Sepal.Width,breaks = c(0,1,2,3,4,5),right = FALSE)
# table(), summary() �̿��ϸ� ����
iris.cut1<-cut(iris$Sepal.Width,breaks = c(0,1,2,3,4,5))
table(iris.cut1)
summary(iris.cut1)


iris.cut2<-cut(iris$Sepal.Width,
    breaks = c(0,1,2,3,4,5),
    labels=(c("Smaller","Small","Medium","Big","Bigger")))
table(iris.cut2)
summary(iris.cut2)

# ������ �ڵ����� �и�
cut(iris$Sepal.Width,breaks =5)
cut(iris$Sepal.Width,breaks =5, include.lowest = TRUE)
cut(iris$Sepal.Width,breaks =5, include.lowest = FALSE)


iris.cut3<-cut(iris$Sepal.Width,
               breaks = 5,
               labels=(c("Smaller","Small","Medium","Big","Bigger")),
               include.lowest = TRUE)

iris.cut3
table(iris.cut3)


# ����
x<-c(3,7,5,1,2,5)
sort(x)                   # ��������
sort(x,decreasing = TRUE) # ��������
length(x)
length(x)<-7
x # NA�� ����

sort(x) # NA�� �ȳ���
sort(x,na.last = TRUE)
sort(x,na.last = FALSE)

# order() : ����, ������������ ���Ľ� ���
y<-c(11,22,33,55,44)
order(y)
y[order(y)]



z<-c("ss","bb","ii","aa","pp")
df<-data.frame(y,z)
df

# y���� �������� �������� ����
df[order(df$y),]


# y���� �������� �������� ����
df[order(df$y,decreasing = TRUE),]

w<-c("c","c","n","n","n")
df<-data.frame(y,z,w)
df
# w�� 1�� ����, y�� 2�� ����

df[order(df$w,df$y),]
df[order(df$w,df$z),]

# xtfrm() : �������� ���� ���� ����� �����ϰ��� �Ѵ�.
# ���͸� �������� �������� �� ������ ��Ÿ���� ���ں��Ͱ� ����

df$w
xtfrm(df$w) # ���� ���ͷ� ��ȯ���ֳ�

# w���� �������� ��������, y�� �������� ��������
order(xtfrm(df$w))
index<-order(-xtfrm(df$w),df$y)
df[index,]


# quiz3
# iris�� �� (species)���� 1�� �������� ����, Sepal.Length�������� ������������

iris$Species
idx<-order(-xtfrm(iris$Species),iris$Sepal.Length)
iris[idx,]






# 1. mtcars������ weight�� �߰�, ���԰� ���������� ū �ڵ����� heavy, �׷��� ���� �ڵ����� light�� ����
# - �� ������ ������ �Ǽ� ���, ����

car<-mtcars
car$weight<-cut(car$wt,
    breaks = 2,
    labels = (c("heavy","light")))
car
str(car$weight)
table(car$weight)



# 2. mtcars �����ͼ� ������ ���ʿ��� ���������� ������������ ��ġ�ǵ��� �ۼ�


# 3. iris�����Ϳ��� 70% �����͸� ������ ǥ������
sample((nrow(iris)*0.7))

# 4. ggplot2 ��Ű������ �̱� �����ߺ� 437�� ������ �α���� ������ ���� midwest��� �����Ͱ� ���ԵǾ� ����. 
# midwest �����͸� ����Ͽ�,
# �ҷ����� : midwest<-as.data.frame(ggplot2::midwest)

# - ggplot2 �� midwest �����͸� ������ ������ ���·� �ҷ��ͼ� �������� Ư���� �ľ�
ggplot2::midwest
midwest<-as.data.frame(ggplot2::midwest)
midwest
str(midwest)

# - poptotal(��ü �α�)�� total ��, popasian(�ƽþ� �α�)�� asian ���� �������� ����
midwest<-rename(midwest,total=poptotal,asian=popasian)
colnames(midwest)

# - total, asian ������ �̿��� '��ü �α� ��� �ƽþ� �α� �����' �Ļ����� ����

midwest$asian_rate <- (midwest$asian / midwest$total) * 100
midwest$asian_rate

# - �ƽþ� �α� ����� ��ü ����� ���ϰ�, ����� �ʰ��ϸ� "large", �� �ܿ��� "small"�� �ο��ϴ� �Ļ����� ����
mean1<-mean(midwest$asian_rate)
midwest$mean1 <- ifelse(midwest$asian_rate > mean1,
                           "Large", "Small")
midwest$mean1

# - "large"�� "small"�� �ش��ϴ� ������ �󸶳� �Ǵ��� �󵵼��� ���
table(midwest$mean1)


# 5. Ÿ��Ÿ�� ������ �м�

# -Ÿ��Ÿ�� ������ �ҷ�����
titanic<-read.csv("train.csv",header = T, na.strings="")
titanic
# - ������ ��, ����� �� ���
colnames(titanic)
table(titanic$Survived)
# - pclass, embarked �� �°��� ���(����)
table(titanic$Pclass)
table(titanic$Embarked)
str(titanic)

# - Name���� ȣĪ ���� ���, ȣĪ ���� �� �°��� ���
titanic$Name
# - ȣĪ�� �Ʒ��� ���� �����Ͽ� name2���� �߰�
# * "Mlle", "Ms", "Lady", "Dona" �� "Miss"�� ����
# * "Mme"��  "Mrs"�� ����
# * "Capt", "Col", "Major", "Dr", "Rev", "Don",  "Sir", "the Countess", "Jonkheer"�� "Officer"�� ����
# * "Mr", "Mrs", "Miss"�� �״��
# * ������ ȣĪ�� "Others"
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

# -name2 ���� factor��(5���� ����) ��ȯ
titanic$name2<-as.factor(titanic$name2)
str(titanic$name2)

# -name2���� ȣĪ�� �ο��� ���

table(titanic$name2)
# -ȣĪ ������ �������� ����(Age) ������ ��ü(ȣĪ �� ������ ��հ�)
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

# -age���� ������ �ο��� ���
# 10�� �̸�, 10��, 20��, 30��, 40��, 50�� �̻�
max(titanic$Age, na.rm=T) #80
titanic.cut<-cut(x=titanic$Age,
                 breaks = c(0,10,20,30,40,50,81),
                 labels= c("10�� �̸�", "10��", "20��", "30��", "40��", "50�� �̻�"),
                 right=FALSE )

table(titanic.cut)

# -cabin �÷��� 1��° ���� ���(NA�� ����)
substr(titanic$Cabin[!is.na(titanic$Cabin)],1,1)


# - fare�� ���� ���� �ִ�/�ּ�/���/ǥ������ ���
max(titanic$Fare)
min(titanic$Fare)
mean(titanic$Fare)
sd(titanic$Fare)


# - sibsp + parch�� ���Ͽ� ���Ӱ� family���� ����
titanic$family<-titanic$SibSp+titanic$Parch
titanic














