# ���ڿ� ��ü : 
# grep�Լ� : fixed=FALSE(default)
# pattern�� �ۼ��� ���� ����ǥ�������� �ؼ�
# fixed=TRUE �̶�� 
# pattern�� �ۼ��� ���� ���ڿ��� �����

words<- c("at","bat","cat","cheap","check","cheese","chick","hat","chase")
grep("che",words,value = TRUE)
grep("che",words)

grep("at",words,value = TRUE)
# ����ǥ������ ���Ե� ���ڿ� ����

#c �Ǵ� h�� ���Ե� ���ڿ� �˻�
grep("[ch]",words,value = TRUE)
grep("c|h",words,value = TRUE)

# a �Ǵ� t�� ���Ե� ���ڿ� �˻�
grep("[at]",words,value = TRUE)
grep("a|t",words,value = TRUE)

# ch �Ǵ� at�� ���Ե� ���ڿ� �˻�
grep("[ch|at]",words,value = TRUE)

# check,chick ch+e�Ǵ�i+ ck
grep("ch(e|i)ck",words,value = TRUE)

# ? => ?�տ� ���ڰ� 0�� �Ǵ� 1�� ��Ÿ���� ����(�ִ� 1��)
# * => *�տ� ���ڰ� 0�� �̻� �ݺ��Ǵ� ���� (�ּ� 0��)
# + => +�տ� ���ڰ� 1�� �̻� �ݺ��Ǵ� ���� (�ּ� 1��)
words<- c("at","bat","cat","cheap","check",
          "cheese","chick","hat","chase",
          "chaenomeles","chasse")

grep("chas?e",words,value = TRUE)
grep("chas*e",words,value = TRUE)
grep("chas+e",words,value = TRUE)

#chase, cheese
grep("ch(a*|e*)se",words,value = TRUE)


# ^ �� $ �̿��ϱ�
grep("^a",words,value = TRUE) #c�� ����
grep("t$",words,value = TRUE) #t�� ����

# . : ��� ���ڸ� �ǹ�
#.*

# c�� �����ϰ� t�� ������ ��� ���ڿ��� �˻�
grep("^c.t$",words,value = TRUE)

# at�տ� �ƹ� ���ڵ� ���ų� h �Ǵ� c�� �����ϴ� ���ڿ��� �˻�
grep("^[hc]?at",words,value = TRUE)



words2<-c("12 Dec", "OK", "http://", "<TITLE>Time?</TITLE>","12345", "Hi there")

# [[:alnum:]] : ���ĺ� +����
# [[:digit:]] : ����
# [[:punct:]] : �����ȣ, Ư������
# [[:space:]] : ����
# [[:alpha:]] : ���ĺ�

grep("[[:alnum:]]",words2,value = TRUE)
grep("\\w",words2,value = TRUE)



grep("[[:alpha:]]",words2,value = TRUE)

grep("[[:digit:]]",words2,value = TRUE)

grep("[[:punct:]]",words2,value = TRUE)

grep("[[:space:]]",words2,value = TRUE)
grep("\\s",words2,value = TRUE)


Sys.Date()
date()
Sys.time()

class(Sys.Date()) # Date Ÿ��
class("2021-02-26") # character
# ���ڿ� -> ��¥ ��ȯ

as.Date("2021-02-26")
class(as.Date("2021-02-26")) # DateŸ��

# as.Date("02/26/2021") ���� ���� �⺻������ �ƴ�
as.Date("02/26/2021",format="%m/%d/%y") # �⺻������ �ƴϸ� format ����

d<-as.Date("2021-02-26")
format(d,format="%m/%d/%y")
class(format(d,format="%m/%d/%y"))

today<-Sys.Date()
today
format(today, format="%y/%m/%d %A")

# Ư�� ��¥�� ���������� ���
weekdays(as.Date("2021-02-27"))

# ���Ϳ����� ������
d<-as.Date("2021-02-27")
d-1
d+1:10

weekdays(d)
weekdays(d+1:10)

# seq�Լ� : ���ӵ� ��¥ ����
s<-as.Date("2021-02-26")
e<-as.Date("2021-04-01")
seq(from=s, to=e, by=1)
seq(s,e,1)

seq(from=s, by=1, length.out=10)

seq(from=s, by=7, length.out=9)

seq(from=s, by="week", length.out=9)

seq(from=s, by="month", length.out=9)
seq(from=s, by="2 month", length.out=9)

seq(from=s, by="year", length.out=9)
seq(from=s, by="2 year",length.out=9)

seq(from=as.Date("2021-01-30"), by="month",length.out=5)

s<-as.Date("2021-02-26")
qrt<-seq(from=s,by="3 months", length.out=4)
qrt
months(qrt)
quarters(qrt) # �б� ���� ���


# �Է�
product<-data.frame()
product

product<-edit(product) # ������ â�� ��
product
# product<-edit(product) fix(product)�� ���� ����
str(product)

# �����ϱ�
write.csv(product, file="myproduct.csv")
product
# �� ���ȣ�� ���ֳ� �Ž�����
write.csv(product, file="myproduct.csv", row.names = FALSE)

# rwork ���Ͽ� ���� ����� name ��ҵ� �����ϱ�
p<-readClipboard()
p
# ��� �����ߴ� ������ �о���±���, �������� ���縦 �ϸ� Ŭ����Ʈ �����̱���
# ��ü�� �����غ���
p<-readClipboard()
p 
# �� �����͵� ���̿� \t�� ����ֳ� 
# �̰��� ���̺� �����̶�� ��
# read.table(file="clipboard",sep='\t')
# �� ù��° ���� �����ͷ� �о���ǳ� 
p<-read.table(file="clipboard",sep='\t',header=TRUE)
p



read.csv("product.csv")

read.csv("product-with-no-header.csv", header=FALSE)

p<-read.csv("product.csv", stringsAsFactors = FALSE)

str(p)

p<-read.csv("product.csv", as.is = TRUE)
# as.is=TRUE �� stringsAsFactors = FALSE �� ����
p

p<-read.table("product.txt",header = TRUE)
p
str(p)


p<-read.table("product-colon.txt",sep=':',header = TRUE)
p
str(p)




#NA : �����Ͱ� ����

p<-read.table("product-missing.txt",header=TRUE,na.strings='.')
p
# ���������Ϳ� . �� "����", USB�� "����"�� �ٲ㺸��
p<-read.table("product-missing.txt",header=TRUE,na.strings=c('����','����'))
p
# �� . ���� NA�̰� USB�ڸ����� <NA>�ϱ� ?
# ������ character �����̶� 

#read.table()�� #���� �����ϴ� ������ �ּ������� �����ϰ� ������

read.table("product-comment.txt",header=TRUE)



brand.eval<-read.table("brand-eval.csv",header=TRUE,sep = ',',row.names = "id")
brand.eval
str(brand.eval)

brand.eval<-read.table("brand-eval.csv",header=TRUE,sep = ',',row.names = "id",
                       colClasses = c("character","character","numeric","numeric","numeric"))
brand.eval


# ���� ������ �б�
install.packages("openxlsx")
library(openxlsx)
read.xlsx("product.xlsx",sheet=1)



# https://archive.ics.uci.edu/ml/datasets.php
# iris�˻� Ŭ�� ->data folderŬ��-> iris.dataŬ��
# https://archive.ics.uci.edu/ml/machine-learning-databases/iris/ ���� iris.data ��ũ ����

#https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data
url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris.uci<-read.csv(url,header = FALSE)
iris.uci

download.file(url=url,destfile = "myIris.csv")

#http://seanlahman.com/files/database/baseballdatabank-master_2016-03-02.zip
url<-"http://seanlahman.com/files/database/baseballdatabank-master_2016-03-02.zip"
local.copy<-"baseball.zip"
download.file(url,local.copy)

bs<-read.csv(unzip(zipfile = local.copy, "baseballdatabank-master/core/Salaries.csv"))
bs




install.packages("ggplot2")
library("ggplot2")
mpg
mpg$manufacturer

midwest<-as.data.frame(midwest) # tibble-> dataframe

install.packages("dplyr")
library(dplyr)

#rename(������������,�������÷��̸�=������ �÷��̸�)
midwest


rename(midwest, cg=category)
