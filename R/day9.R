iris.copy<-iris
class(iris.copy$Species)# factor

# character Ÿ������ ����
class(as.character(iris.copy$Species))# character


iris.copy$Sepal.Ratio<-iris.copy$Sepal.Length/iris.copy$Sepal.Width
head(iris.copy)

# �Ļ����� �߰�
# transform�Լ� : ����(��ó)�� ��ȯ

iris.copy<-iris
iris.trans<-transform(iris.copy,
          Species=as.character(Species),
          SepalRatio=Sepal.Length/Sepal.Width
          )
iris.trans


# apply family
# apply(), lapply(), sapply()

# apply() : �����ϰ����ϴ� �����Ͱ� ��� or �迭�� �� ��밡��
# ������� : ����, ��� 

x<-1:20
dim(x)<-c(4,5)
x

apply(x,1,max)


x<-1:24
dim(x)<-c(4,3,2)
x
apply(x,1,paste)
# margin 1-> �����, 2-> ������, 3->�����
apply(x,1,paste,collapse=",")
apply(x,2,paste,collapse=",")
apply(x,3,paste,collapse=",")

apply(x,c(1,2),paste,collapse=",")


class(apply(x,1,paste,collapse=",")) # character


# Ÿ��Ÿ��, 4���� ������ �������� ����
Titanic
str(Titanic)

# ��޺� ž���ο��� �ľ�
apply(Titanic,1,sum)

# ����(�ι�° ����) ž���ο� �ľ�
apply(Titanic,2,sum)

# ���ɺ�(����° ����) ž���ο� �ľ�
apply(Titanic,3,sum)

# �����ں�(�׹�° ����) ž���ο� �ľ�
apply(Titanic,4,sum)


# �°� ��޺� ������ ��谡 �˰� �ʹٸ�?
apply(Titanic,c(1,4),sum)



# lapply(),sapply()
# :  l�� list�� ����,s�� simplify�� ����
# �����Ͱ� ����Ʈor�����϶� ���
# �μ��� 2��, ù��° �μ��� ������, �ι�° �μ��� �Լ��� ����
# lapply�Լ���� : �׻� ����Ʈ�������� ��ȯ
# sapply�Լ���� : ���� �Ǵ� ��ķ� �ܼ�ȭ�ؼ� ��ȯ
# ���ʹ� ���̰� 1, ����� ���̰� 2�̻� �̸鼭 ��� ���� ���

# sapply���� ���̰� 2�̻��̸鼭 ���� �ٸ���쿡�� ����Ʈ�� ���

# ���̰� �ٸ��� ����
exams<-list(s1=c(80,70,60,50,100),
     s2=c(80,70,60,50),
     s3=c(30,70,60,50,100,90),
     s4=c(80,70,60,50,100))
exams

lapply(exams, length)
# ��°���� list�������� ����, ��������� ���̰� 1�̴�

sapply(exams, length)
# ��°���� vector�� ����, ���̰� ��� 1�� �����ϱ� ������


lapply(exams, mean)# list
sapply(exams, mean)# vector

lapply(exams, sd)# list
sapply(exams, sd)# vector

lapply(exams, range) # list
sapply(exams, range) # �̰� ��ķ� ������ (���̰� ��� 2�� ����)

# lapply,sapply�� �����������ӿ� ���� ��밡��

iris
lapply(iris, class)
sapply(iris, class)

#sapply(iris, mean)
sapply(iris, function(X) ifelse(is.numeric(x), mean(x), NA))



# mapply()�� �����Լ��� ���Ϳ����� �������� ���� �� �����ϰ� ���
# mapply(�Լ�,)
mapply(rep,1:4,4:1)
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))# ���� ������

# ���� ���
# 1.�켱 ���͸� ���ܺ��� ����(split, unstack)
car<-mtcars
car<-within(car,
       am<-factor(am,
              levels = c(0,1),
              labels = c("Automatic","Manual"))
       )

str(car)

# data("mtcars")
# car<-mtcars

# mpg�� ���ӱ� ����(2����)�� ���� ����
g<-split(car$mpg,car$am)
g

# ���ܺ� mpg���
class(g)

g[[1]]
mean(g[[1]])
mean(g[["Manual"]])
sapply(g,mean)

# split�� ������ unstack�Լ�
data.frame(car$mpg,car$am)
unstack(data.frame(car$mpg,car$am)) # (������ ����, ���� ��������?)


data.frame(iris$Sepal.Length,iris$Species)
gg<-unstack(data.frame(iris$Sepal.Length,iris$Species))
str(gg)



# �� �Ȱ��� �ߴµ� ���� ������ �ٸ��� ?

# unstack�Լ��� 
# �׷캰�� ���ҵ� �������� ���̰� �����ϸ� ������������
# �������������� ����Ʈ�� ���
g1<-unstack(data.frame(car$mpg,car$am))
g2<-unstack(data.frame(iris$Sepal.Length,iris$Species))

summary(g1)
summary(g2)
# summary�Լ��� �����������ӿ� ���� �����踦 �����ִ� �Լ�


# �׷� ���� �۾� -> �׷캰 ���� �۾�
# �� �۾��� ���ÿ� �����ϰڴٸ�...

# tapply(), aggregate(), by()

# tapply(������ ����, �׷� ����, �׷캰 ���� �Լ�) : 3�� �μ�,

tapply(iris$Sepal.Length, iris$Species, mean)
# iris�� ���� �ɹ�ħ�� ���̿� ���� ���

tapply(iris$Sepal.Width,iris$Species, length)
# iris�� ���� �� �������� ������ ���


str(car)
# �Ǹ���(cyl) ������ am ������ ���տ� ���� mpg���
#     a   m
# 4
# 6
# 8

tapply(car$mpg, list(car$cyl,car$am), mean)
with(car,tapply(mpg, list(cyl,am), mean))# ������


# aggregate(���� �Լ�)
# : �׷캰�� ������ �Լ��� ������ �� �ְ� ���ִ� �Լ�
# aggregate(����, ������ ��Ÿ���� ������ ����Ʈ���·�, FUN)
with(car, aggregate(mpg,list(Cylinder=cyl,Transmission=am),mean))

# car[c(1:6)] ������ ���, �Ǹ����� ������ ���ӱ� ������ ���տ� ����

aggregate(car[c(1:6)],list(Cylinder=car$cyl,Transmission=car$am),mean)


# aggregate�Լ� ����Ͽ� ���̸��� �� ������ ���� ������ (4��)���

aggregate(iris[c(1:4)],list(Species=iris$Species),mean)

# by�Լ� : �������������� �׷캰 �����͸� ó��
by(iris,iris$Species,summary)

by(iris,iris$Species,function(x) mean(x$Sepal.Length))



rowsum(iris[-5],iris$Species)

# ���ֺ� ������ ����
tabulate(car$gear)
1:length(tabulate(car$gear))

gc<-tabulate(car$gear)
names(gc)<-1:length(tabulate(car$gear))
gc

table(car$gear)
table(car$am,car$gear)

# xtabs�Լ� : table�Լ��� ���� ����, ���ķ� ���
xtabs(~am,data=car)
xtabs(~am+gear,data=car)

# ���ķ���,
# ������ ó���� � ���� ����� �������� ��Ÿ�� ����

aggregate(mpg~cyl+am,car,mean)

# cyl�� am������ mpg���� ����� ���Ͻÿ�
with(car,aggregate(mpg,list(cyl=cyl,am=am),mean))


# dplyr : ����(S)-����(A)-����(C)
# �۾��� �����ϰ� �� �� �ֵ��� ������ �ִ� ���̺귯��
library(dplyr)
airquality
air<-filter(airquality,Month ==6)
head(air)

airquality[airquality$Month==6,]

subset(airquality,
       subset = (Month==6))
# ����ǥ��


air<-filter(airquality,Month==6,Temp>90) # ,�� and����
air


air<-filter(airquality,Month==6 & Temp>90)
air


air<-filter(airquality,Ozone>80|Temp>90)
air




# 1. Survived �� ���
# - ������/����� ��ü ����
titanic<-read.csv('train.csv',na.strings = '')
prop.table(table(titanic$Survived))

# - ������ ���� ������/�����
with(titanic, tapply(Survived, list(Sex), mean))


# 2. Pclass �� ���
# - ��� ����
prop.table(table(titanic$Pclass))

# - ��ǿ� ���� ������/����� ����
with(titanic, tapply(Survived, list(Pclass), mean))

# 3. Age ��
# - ���̴븦 ������ ��, �� ���̴뺰 ������
age_cut<-cut(titanic$Age,
                     breaks=c(0,10,20,30,40,50,81),
                     right=FALSE,
                     labels=c("10��̸�", "10��", "20��", "30��", "40��","50���̻�"))

prop.table(table(age_cut,titanic$Survived),1)

# 4. Fare ��
# - ������ ��ü 5�� �������� �и��� ��,
# �� ������ ������

fare_cut<-cut(x=titanic$Fare, 
                   breaks = 5,
                   include.lowest=TRUE)
prop.table(table(fare_cut,titanic$Survived),1)


# 5. Name �� 
# - ȣĪ�� ������ �̸����� ������ ������ ����
# - ������ ���� ������ ������ ����


spl_name <- tolower(gsub('[^[:alpha:]]','',titanic$Name))
spl_name<-strsplit(spl_name,'')
class(spl_name)

���� <- lapply(spl_name, grep, pattern = "[a,e,i,o,u]", value = TRUE)

���� <- lapply(spl_name, grep, pattern = "[^a,e,i,o,u]",value = TRUE)

����<-unlist(����)
����<-unlist(����)
prop.table(rowSums(c("����","����")),1)
proportions(colSums(c("����","����")))
# 6. Embarked ��
# - �� �¼� �ױ��� ������


