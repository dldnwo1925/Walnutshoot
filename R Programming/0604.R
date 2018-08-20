# 컴바인 벡터
var1 <- c(1,2,3,4,5)
# 벡터로 1~5 만들기
var2 <- c(1:5)
# 시퀀스 순차적인 값 만들기
var3 <- seq(1,1000);
# 시퀀스 순차적으로 3씩 띄운 값 만들기
var4 <- seq(1,15,3);
var3
# 변수 삭제
rm(vat3)

# 문자 변수 생성
str <- 'hello world!'
print(str)
str1 <- "hi world"

# 문자끼리 연산은 안됨 print(str + str1)
# 컴바인 벡터 문자열 생성
text <- c("oh","my","god","it's","so","boring")
text
# 평균을 구하는 함수
mean(var1)

# 문자열 collapse = "" 를 통해 인덱스 사이에 기호를 넣어 연속 출력 가능
paste(text,collapse = " ")
text

#함수만들기
func <- function(a,b,c){
  return ((a+b+c)/3)
}

func(1,2,3);
#패키지 삭제
remove.packages("ggplot2")
#패키지 설치
install.packages("ggplot2")
install.packages("ggplot")
#패키지 적용
library(ggplot2)
library(ggplot)
holjjak <- function(x){
  if(x%%2 ==1 ) y <- "hol"
  else y <- "jjak"
  return(y)
}
holjjak(2)

rm(x)
# qplot 함수 (벡터 안의 빈도 세기)
x <- c("a","a","b","c",1,2)
qplot(x)

a <- c(holjjak(2),holjjak(5),holjjak(3),holjjak(1))
qplot(a)



# 암기 하기
# 변수명       - 내용

# manufacturer - 제조 회사
# displacement - 배기량
# cylinders - 실린더 개수
# drive wheel - 구동방식
# highway - 고속도로연비
# class - 자동차 종류
# model - 자동차모델명
# year - 생산연도
# transmission - 변속기종류
# city - 도시연비
# fuel - 연료종류

# Mile Per Gelon , Hwu > 1갤런으로 갈 수 있는 거리
# mpg 데이터에서 hwy를 그래프로 보기
qplot(data=mpg,x=hwy)
# mpg 데이터에서 도시연비 보기
qplot(data=mpg , x=cty);
# 데이터 확인하기
ss <- data(mpg);
ss
y <- 1
# 데이터의 타입출력 함수 str();
str(y)

# 구동방식에 따른 고속도로 연비
qplot(data = mpg, x =drv,y= hwy);
# 배기량과 고속도로 연비의 관계
ggplot(data=mpg ,aes(x=displ,y=hwy))
# x축 drv, y축 hwy , 선 그래프 형태(line),점 형식은 (point),박스형태(boxplot) 
qplot(data = mpg, x=drv,y=hwy  , geom ="line")
qplot(data = mpg, x=drv,y=hwy  , geom ="boxplot", colour=drv)
# boxplot 에서 박스 안의 라인은 중위값(가운데 값) 점으로 나오는것은 극단값()
# boxplot 박스밖의 실선은 최대,최소값 

# 연습 문제
# 다섯 명의 수험 점수 평균내기, 평균 낸것 변수에 만들어 담기
score <- c(80,60,70,50,90)
score
mean(score)
avg <- mean(score)
avg

# 데이터 프레임
# 데이터 행의 증가
# - 분석차원에는 문제가 없음
# - 컴퓨터의 처리 속도가 느려짐, 소스를 많이 사용함
# - 빅데이터 처리 (분산 처리의 필요성) > 하둡의 발생

# 데이터 열의 증가
# - 변수의 조합의 차이에 따라 분석기술이 달라지고 복잡해짐
# - 머신 러닝, 인공지능 등의 필요 대두

#데이터 프레임 만들기
name <- c('jones','james','john','jane')
eng <- c(70, 80 , 70 ,70)
math <- c(50,60,100,90)
class <- c(1,2,1,2)
df_midterm <- data.frame(name,eng,math,class)
df_midterm
mean(df_midterm$eng)

#a <- if(df_midterm$class==1)mean(df_midterm$eng.class==1)
# df_midtern 데이터에서 class별 eng mean 구하기
aggregate(eng~class,df_midterm,mean);
if(df_midterm$class==1){
  return(mean(df_midterm$eng))
}



# 데이터 프레임 한 번에 만들기
df_midterm2 <- data.frame(eng2 = c(10,20,30,40),
                          math = c(20,30,40,50),
                          class = c(1,2,1,2))

df_midterm2
# 연습문제 2 
df_prac <- data.frame(product =c('apple','strawberry','watermelon'),
                      price = c(1800,1500,3000),
                      amount = c(24,38,13))
df_prac
mean(df_prac$price)
mean(df_prac$amount)

#엑셀 파일 불러오기
# readxl 패키지 설치
install.packages("readxl")
# readxl 패키지 로드
library(readxl)

# 작업 디렉토리 만들기와 확인하기
setwd("C:\\Users\\tj\\Documents\\R")
getwd()
# 엑셀 파일 불러오기
df_exam <- read_excel("C:/Users/tj/Documents/R/excel_exam.xlsx")
df_exam
mean(df_exam$math)

aggregate(math~class,df_exam,mean)

# 엑셀 데이터 불러올 때 기본값 첫 행은 제목
# col_names를 F로 두면 첫 행부터 데이터로 들어감
excel_novar <- read_excel("C:/Users/tj/Documents/R/excel_exam_novar.xlsx",col_names = F)
excel_novar

# 세 번째 시트의 데이터를 가져옴
excel_sheet <- read_excel("excel_exam_sheet.xlsx", sheet=3)
excel_sheet

#csv 파일 불러오기
df_csv_exam <- read.csv("파일 이름")
csv_exam <- read.csv("csv_exam.csv")
csv_exam 
#csv 파일 헤더 False 기능
csv_exam2 <- read.csv("csv_exam.csv",header = F)
csv_exam2
# 문자 들어가 있는 csv파일 불러올 땐 stringsAsFactors = F
csv_exam3 <- read.csv("csv_exam1.csv",stringsAsFactors = T)
csv_exam3

#데이터 프레임을 csv 파일로 저장하
#write.csv(데이터 프레임, file = "만들 파일이름.csv")

write.csv(df_midterm,file = "dataFramePractice.csv")

# 데이터 프레임을 RData 파일로 저장하기
# save(데이터 프레임 이름,file = "파일이름.rda")
save(df_midterm,file ="saveByRda.rda")

#테스트용 데이터 삭제
rm(df_midterm)
df_midterm
#RData 불러오기
load("saveByRda.rda")


# 파일형식마다 불러올떄의 차이점
# 1. 엑셀 파일 - 불러와 변수에 할당해야함
# ex) 저장할 변수 이름 <- read_excel("파일이름.xlsx")
# 2. csv 파일 - 불러와 변수에 할당해야함
# ex) 저장할 변수 이름 <- read_csv("파일이름.csv")
# 3. rda 파일 - 불러오기만 해도됨
# ex) load("파일이름.rda")
