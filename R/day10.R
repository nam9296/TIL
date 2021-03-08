# 데이터 전처리(S-A-C) 패키지 : dplyr 사용
# 데이터 분할(S) -> 분할 자료에 대해 함수를 적용(A) -> 결과를 취합(C)

# arrange(정렬),filter(행추출), select.list(열추출)
# mutate(열 추가), summarise(요약)
head(airquality)
library(dplyr)

airquality$Month
airquality$Month==6
airquality[airquality$Month==6,]
subset(airquality, subset = (Month==6))
#  위 과정을 filter를 이용해서 나타내보자

filter(airquality, Month==6)
air<-filter(airquality, Month==6)
head(air)

# Month가 6이면서 temp가 90 초과

air<-filter(airquality,Month==6, Temp>90)
head(air)

# or 연산
# 만약 temp가 90초과 이거나 오존이 80보다 큰자료
air<-filter(airquality,Temp>90|Ozone>80)
air
# slice() : 단순히 특정 위치의 행 데이터 추출
slice(airquality,6:10) # 추출하고자 하는 행 번호

# arrange() : 데이터프레임을 정렬할 때 사용 (지정한 열을 기준으로)
arrange(airquality, Temp) # temp를 기준으로 오름차순
arrange(airquality, desc(Temp)) # temp를 기준으로 내림차순
# 만약 중복값이 있다면 처리를 어떻게 할 것이냐
arrange(airquality, Temp,Month)# 다른 기준을 제시하면됨
arrange(airquality, Temp,Month,Day)


# 퀴즈 1 order함수로 변경하세요

airquality[order(airquality$Temp,airquality$Month,airquality$Day,decreasing = TRUE),]

airquality[order(-airquality$Temp, airquality$Month, airquality$Day),]
with(airquality,airquality[order(-Temp, Month, Day),])

#select 열 추출(,는 여러개의 떨어진 열을 추출, : 기호는 연속적인 열을 추출 할 때 사용)
air<-select(airquality,Month,Day,Temp)
air
head(airquality)

select(airquality,Temp:Day)

select(airquality,-(Ozone:Wind)) # -는 특정 열을 제외하고 추출
select(airquality,Solar.R)
select(airquality,Solar=Solar.R)
# 열 이름 변경은 select를 사용하지말고 rename을 쓰는 것을 권장
air<-rename(airquality,Solar=Solar.R)
head(air)

# select + distinct 함수 조합 (unique 함수와 비슷함)
# 특정 열에 포함된 중복되지않은 데이터 추출
distinct(select(airquality,Month)) # 데이터프레임으로
unique(airquality$Month) # 벡터로

# mutate : 새로운 열(파생변수)을 추가할 때
airquality$Temp
# 화씨 -> 섭씨 : (화씨-32)/1.8

(airquality-32)/1.8

head(mutate(airquality,(Temp-32)/1.8))

# mutate함수는 생성한 새로운 열(Temp.c)을 동일한 함수 내(Diff)에서 사용 가능
head(mutate(airquality, Temp.c=(Temp-32)/1.8, Diff=Temp.c-mean(Temp.c)))


# transform함수로는 에러발생
# 새로운 열을 동일한 함수 내에서 사용 불가
# transform(airquality, Temp.c=(Temp-32)/1.8, Diff=Temp.c-mean(Temp.c))


summarise(airquality)
summarise(airquality,mean(Temp))

summarise(airquality,
          Min=min(Temp,na.rm = TRUE),
          Median=median(Temp,na.rm = TRUE),
          Mean=mean(Temp,na.rm = TRUE),
          Sd=sd(Temp,na.rm = TRUE),
          Max=max(Temp,na.rm = TRUE),
          N=n())



summarise(airquality,
          Min=min(Temp,na.rm = TRUE),
          Median=median(Temp,na.rm = TRUE),
          Mean=mean(Temp,na.rm = TRUE),
          Sd=sd(Temp,na.rm = TRUE),
          Max=max(Temp,na.rm = TRUE),
          N=n(),
          Distinct.Month=n_distinct(Month),
          First.Month=first(Month),
          Last.Month=last(Month),
          )

summary(airquality)

# sample_n : 표본 추출(개수)
# sample_frac : 표본 추출(비율)
# 옵션 : replace=TRUE (복원 추출)

sample_n(airquality,5) # (데이터,표본추출개수)

sample_frac(airquality,0.1) 

#group_by함수 : 그룹별로 분할 -> 그룹단위 함수 적용
air.group<-group_by(airquality,Month) # (데이터, 그룹화 기준 열 이름)
air.group # 월별로 그룹화

# 월별 통계량
summarise(air.group,
          Mean_Temp=mean(Temp,na.rm=TRUE))

air.group.Temp<-summarise(group_by(airquality,Month),
          Mean_Temp=mean(Temp,na.rm=TRUE))
air.group.Temp


#파이프연산자: %>%,한 함수로 부터 연산 결과가 다음 함수의 인수로
#전달되도록 하는 연산자

# iris %>% head
# 1:10 %>% mean
# 
# a<-1:10
# m<-mean(a)
# s<-sqrt(m)
# 1:10 %>% mean %>% sqrt


# 1) 파이프 연산자를 사용하지 않은 경우
a1<-select(airquality,Ozone,Temp,Month)

#a1 데이터를 Month기준으로 그룹화

a2<-group_by(a1,Month)

a3<-summarise(a2,
          Mean.Ozone=mean(Ozone,na.rm=T),
          Mean.Temp=mean(Temp,na.rm=T),
)
a3

# a3 자료중 ozone이 40 초과하거나 Temp가 80초과인 데이터 행 추출

a4<- filter(a3,Mean.Ozone>40 |Mean.Temp>80)
a4


# 2) 파이프 연산자를 사용하는 경우
air<-airquality %>% 
  select(Ozone,Temp,Month) %>% #a1
  group_by(Month) %>%         #a2
  summarise(Mean.Ozone=mean(Ozone, na.rm=TRUE),
            Mean.Temp=mean(Temp, na.rm=TRUE)) %>% # a3 
  filter(Mean.Ozone>40 | Mean.Temp>80)   # a4
air


# tibble -> data frame
air_df<-as.data.frame(air)
air_df

# data frame -> tibble
tbl_df(air_df)


install.packages("Lahman")
library(Lahman)
str(Batting)
tail(Batting)


Batting.tbl.df<-tbl_df(Batting)
Batting.tbl.df


# 데이터 변환
# 데이터의 외형상 특징 : 와이드형, 롱형

# subject               var      value
# abercda01           stint       1
# abercda01           teamID      1
# abercda01             ...       ...
# abercda01             ...
# abercda01             ...
# abercda01             ...
# abercda01             ...
# abercda01             HR

# 와이드형 <-> 롱형 변환
# melt : 와이드형 -> 롱형 변환
# dcast : 롱형 -> 와이드형 변환
install.packages("reshape2")
library(reshape2)

smiths # reshape2에 포함된 데이터  와이드 형식임
# 롱으로 변환해보자
smiths.long<-melt(data=smiths)
smiths.long

smiths.long<-melt(smiths, id.vars = "subject")
smiths.long

str(smiths)
# subject가 팩터로 되어있으므로
# melt 함수를 이용하여 와이드-> 롱형으로 변환시
# 자동으로 subject변수를 식별자로 사용하게 됨


# 롱형을 와이드형으로 바꿔보자
# 변수베치는 formula로 지정한다
# x~y : x에는 식별자 변수, y에는 측정변수, 변수가 여러개면 +로 연결

smiths.wide<-dcast(smiths.long, formula = subject~variable)
smiths.wide


# 와이드형 자료(매일 측정, 행단위로 일 측정 결과)
airquality # 153개 행으로 구성됨
# 롱형 변환
aq.long<-melt(airquality)
aq.long # 153행 *6 = 918개의 행
tail(aq.long)

# Month와 Day를 묶어서 식별자로 사용하면
aq.long<-melt(airquality, id.vars = c("Month","Day"))
aq.long
head(aq.long)
tail(aq.long)

# aq.long -> 와이드 형 변환
aq.wide<-dcast(aq.long, formula = Month+Day ~ variable)
aq.wide


# left_join() : 열 데이터 합치기
# bind_rows() : 행 데이터 합치기

# 1. csv 읽어오기
exam<-read.csv('csv_exam.csv',na.strings = '')
exam
# 2. exam에서 class가 1인 자료들만 추출 ( %>% 이용)
exam %>% 
  filter(class==1)

# 3. exam에서 class가 1이 아닌 자료들만 추출
exam %>% 
  filter(!class==1)

exam %>% 
  filter(class!=1)

# 4. 수학점수가 50점을 초과한 데이터만 추출

exam %>% 
  filter(math>50)

# 5. 수학점수가 50점을 초과하면서 1반인 데이터만 추출

exam %>% 
  filter(math>50 & class==1)


# 6. 수학점수가 90점 이상이거나 영어점수가 90점 이상인 데이터 추출
exam %>% 
  filter(math>90 | english>90)

# 7. 1반, 2반, 3반 자료만 추출
exam %>% 
  filter(class==1|class==2|class==3)
  
exam %>% 
  filter(class %in% c(1,2,3))

# 8. 1반 2반 자료에 각각 자료를 넣으세요
class1<-exam %>% 
  filter(class==1)

class2<-exam %>% 
  filter(class==2)


# 9. 1반 2반 수학점수의 평균 출력
mean(class1$math)
mean(class2$math)

# 10. class가 1인 행만 추출한 다음에 english열을 추출

exam %>% 
  filter(class==1) %>% # 행은 filter
  select(english) # 열은 select


# 11. id열과 math열을 추출하는데 앞부분 6개만 출력

exam %>% 
  select(id , math) %>% 
  head()


# 12. exam에서 math를 기준으로 오름차순 정렬
exam %>% 
  arrange(math)

# 13. exam에서 math를 기준으로 내림차순 정렬
exam %>% 
  arrange(desc(math))

# 14. exam에서 수학 영어 과학점수를 모두 더하여 total변수 추가

exam %>% 
  mutate(total=math+english+science) %>% 
  head()

exam %>% 
  mutate(total=math+english+science,
         mean=total/3) %>% 
  head()

# 15. 과학 과목이 60점 이상이면 pass, 미만이면 fail을 test열에 추가

exam %>% 
  mutate(test=ifelse(science>=60,"pass","fail")) %>% 
  head()

# 16. 수학, 영어, 과학점수를 합하여 total열을 추가
# total열을 기준으로 오름차순 정렬하여 출력

exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(total) %>% 
  head

# 17. 그룹단위 요약, exam에서 반별 수학점수 평균 출력

exam %>%
  group_by(class) %>% 
  summarise(Math_mean=mean(math))
# 집단별로 요약할때는 summarise이용

# 18. 반별로 수학점수 합계,평균, 중위수,학생수 출력

exam %>% 
  group_by(class) %>% 
  summarise(Math_mean=mean(math),
            Math_sum=sum(math),
            Math_Med=median(math),
            Num_Stu=length(math)) # n() 해도됨



# manufacturer, drv
# 회사별 구동박식별 그룹화
# cty평균 출력
library(ggplot2)
mpg
head(mpg)


mpg %>% 
  group_by(manufacturer,drv) # 첫번째 그룹화 기준(manufacturer), 두번째 그룹화 기준(drv)
# 제조사 : 15 * 구동방식 3 = 45 이지만 일부 제조사에서는 구동방식이 여러개다


mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(Mean_City=mean(cty)) 

# mpg에서 제조사 별로 그룹화

mpg %>% 
  group_by(manufacturer)



mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>%    # 제조사 그룹단위로 suv를 추출
  # cty와 hwy의 평규을 귀하여 tot라는 새로운 열을 추가
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% # 그룹별 통합 연비의 평균 출력
  arrange(desc(mean_tot)) %>% 
  head(5)




# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test1
test2

total<-left_join(test1,test2,by="id")
total


name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))



# class기준으로 합치기

name
exam
examNew<-left_join(exam,name,by="class")
examNew


# 학생 1~5 번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
# 학생 6~10 번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))


group_a
group_b
group_all<-bind_rows(group_a,group_b)
group_all



# 1.
# mpg 데이터를 이용해 분석 문제를 해결해 보세요.
# ??? Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와
# 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.
mpg_a <- mpg %>% filter(displ <= 4)  
mpg_b <- mpg %>% filter(displ >= 5) 
mean(mpg_a$hwy)
mean(mpg_b$hwy)

# ??? Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota" 중 어느
# manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지 알아보세요.
mpg_audi<-mpg %>% 
  filter(manufacturer=="audi")
mpg_toyota<-mpg %>% 
  filter(manufacturer=="toyota")
mean(mpg_audi$cty)
mean(mpg_toyota$cty)

# ??? Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의
# 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
mpg_1<-mpg %>% 
  filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_1$hwy)


# 2.
# mpg 데이터를 이용해서 분석 문제를 해결해보세요.
# ??? Q1. mpg 데이터는 11 개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에 활용하려고 합니다. mpg
# 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요. 새로 만든
# 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.
mpg_clct<-mpg %>% 
  select(class,cty)
mpg_clct
# ??? Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를 이용해서
# class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더
# 높은지 알아보세요
mpg_suv<-mpg %>% 
  filter(class=="suv")

mpg_compact<-mpg %>% 
  filter(class=="compact")
mean(mpg_suv$cty)
mean(mpg_compact$cty)


# 3.
# mpg 데이터를 이용해서 분석 문제를 해결해보세요.
# ??? "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 합니다. 
# "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하세요.
mpg_audi %>% 
  arrange(desc(hwy)) %>% 
  head(5)


# 4.
# mpg 데이터를 이용해서 분석 문제를 해결해보세요.
# mpg 데이터는 연비를 나타내는 변수가 hwy(고속도로 연비), cty(도시 연비) 두 종류로 분리되어 있습니다. 두
# 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 분석하려고 합니다.
# ??? Q1. mpg 데이터 복사본을 만들고, cty 와 hwy 를 더한 '합산 연비 변수'를 추가하세요.
mpg_copy<-mpg
mpg_copy<-mpg_copy %>% 
  mutate(합산연비=cty+hwy)
# ??? Q2. 앞에서 만든 '합산 연비 변수'를 2 로 나눠 '평균 연비 변수'를 추가세요.
mpg_copy<-mpg_copy %>% 
  mutate(평균연비=합산연비/2)
# ??? Q3. '평균 연비 변수'가 가장 높은 자동차 3 종의 데이터를 출력하세요.
mpg_copy %>% 
  arrange(desc(평균연비)) %>% 
  head(3)

# ??? Q4. 1~3 번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 출력하세요. 데이터는 복사본 대신
# mpg 원본을 이용하세요.

mpg %>% 
  mutate(합산연비=cty+hwy,
             평균연비=합산연비/2) %>% 
  arrange(desc(평균연비)) %>% 
  head(3)


# 5.
# mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# ??? Q1. mpg 데이터의 class 는 "suv", "compact" 등 자동차를 특징에 따라 일곱 종류로 분류한 변수입니다. 
# 어떤 차종의 연비가 높은지 비교해보려고 합니다. class 별 cty 평균을 구해보세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))

# ??? Q2. 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있습니다. 어떤 차종의 도시 연비가 높은지
# 쉽게 알아볼 수 있도록 cty 평균이 높은 순으로 정렬해 출력하세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))


# ??? Q3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 합니다. hwy 평균이 가장 높은 회사
# 세 곳을 출력하세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(3)

# ??? Q4. 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고 합니다. 각 회사별
# "compact" 차종 수를 내림차순으로 정렬해 출력하세요.
mpg %>% 
  filter(class=="compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count))


# 6.
# mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# mpg 데이터의 fl 변수는 자동차에 사용하는 연료(fuel)를 의미합니다. 아래는 자동차 연료별 가격을 나타낸
# 표입니다.
# fl 연료 종류 가격(갤런당 USD)
# c CNG 2.35
# d diesel 2.38
# e ethanol E85 2.11
# p premium 2.76
# r regular 2.22
# 우선 이 정보를 이용해서 연료와 가격으로 구성된 데이터 프레임을 만들어 보세요.
# fuel # 출력


# 
# ##   fl price_fl
# ## 1 c   2.35
# ## 2 d   2.38
# ## 3 e   2.11
# ## 4 p   2.76
# ## 5 r    2.22

data<-data.frame(fl = c("c", "d", "e", "p", "r"),
                 가격 = c(2.35, 2.38, 2.11, 2.76, 2.22),
                 stringsAsFactors = F)

# ??? Q1. mpg 데이터에는 연료 종류를 나타낸 fl 변수는 있지만 연료 가격을 나타낸 변수는 없습니다. 위에서
# 만든 fuel 데이터를 이용해서 mpg 데이터에 price_fl(연료 가격) 변수를 추가하세요.
mpg_copy<-mpg
mpg_copy<-left_join(mpg,data ,by="fl")

# ??? Q2. 연료 가격 변수가 잘 추가됐는지 확인하기 위해서 model, fl, price_fl 변수를 추출해 앞부분 5 행을
# 출력해 보세요.
mpg_copy %>%
  select(model, fl, 가격) %>%   
  head(5)     



# 7.
# 미국 동북중부 437개 지역의 인구통계 정보를 담고 있는 midwest 데이터를 사용해 데이터 분석 문제를
# 해결해 보세요. midwest는 ggplot2 패키지에 들어 있습니다.
# ??? 문제 1. popadults 는 해당 지역의 성인 인구, poptotal 은 전체 인구를 나타냅니다. midwest 데이터에
# '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.
library(ggplot2)
data(midwest)
midwest_copy<-midwest
midwest_copy<-midwest_copy %>% 
  mutate(percent_child=(poptotal-popadults)/poptotal*100)
colnames(midwest_copy)


# ??? 문제 2. 미성년 인구 백분율이 가장 높은 상위 5 개 county(지역)의 미성년 인구 백분율을 출력하세요.

midwest_copy %>%
  arrange(desc(percent_child)) %>%   
  select(county, percent_child) %>%  
  head(5)                          

# ??? 문제 3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지
# 알아보세요.
# 분류 기준
# large 40% 이상
# middle 30% ~ 40% 미만
# small 30% 미만
midwest_copy <- midwest_copy %>%
  mutate(grade = ifelse(percent_child >= 40, "large",
                        ifelse(percent_child >= 30, "middle", "small")))
table(midwest_copy$grade) 

# ??? 문제4. popasian은 해당 지역의 아시아인 인구를 나타냅니다. '전체 인구 대비 아시아인 인구 백분율' 
# 변수를 추가하고, 하위 10개 지역의 state(주), county(지역명), 아시아인 인구 백분율을 출력하세요
midwest_copy<-midwest_copy %>%
  mutate(percent_asian = (popasian/poptotal)*100) 

midwest_copy %>%  
  arrange(percent_asian) %>%                         
  select(state, county, percent_asian) %>%            
  head(10)                                          

colnames(midwest_copy)



































