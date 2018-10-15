# 다중 로지스틱 회귀분석(Multimomial Logistic Regression)
# - y의 범주가 3개이상이며 명목형 변수 일 때 사용하는 로지스틱 회귀분석

# 예제 데이터셋
library(foreign)
library(nnet)
ml <- read.dta("https://stats.idre.ucla.edu/stat/data/hsbdemo.dta")
head(ml)
str(ml)

# Y: prog(프로그램 타입)
# X : ses(social economic status), write(writing score)

# 다중 회귀분석을 통해 종속변수와 독립변수간의 관계를 알아보자

# 빈도 테이블과 그룹 평균을 통해 ses와 prog의 관계 알아보기
with(ml,table(ses,prog))
table(ml$ses,ml$prog)
xtabs(~ses+prog,data=ml)

# 리스트를 벡터로 변환한다.
# do.call함수로 리스트를 개별 인자들로 ㅂㄴ해한 쓰려고 하는 함수에 적용 한다.
# 행과 열이 나뉘어진 부분 합치기.
with(ml, do.call(rbind, tapply(write,prog, function(x) c(M=mean(x), SD=sd(x)))))

# nnet 패키지의 multinom 함수를 통해 다중로지스틱 회귀분석 실시
ml$prog2 <- relevel(ml$prog, ref="academic")
test <- multinom(prog2~ses + write, data=ml)
# multinom을 실행하기 전 relevel이라는 함수를통해 reference를 지정해 줌
# reference를 기준으로 결과를 해석할 수 있음. 따라서 이 refrence는 baseline이 되어 ㅎ함
# multinom 함수를 실행하면 모델이 fitting되어 계수가 결정되고 이 정보는 test에 담김

summary(test)
# 결과 해석
# write가 1단위로 증가할 때, academic이 general될 오즈비가 -0.058
# write가 1단위로 증가할 때, academic이 vocation될 오즈비가 -0.01136037
# ses:low 에서 high로 변할 때, academic이 general 될 오즈비 -1.1628..
# ses:low 에서 middle로 변할 때, academic이 general 될 오즈비 -0.5332...
# ses:low 에서 high로 변할 때, academic이 vocation 될 오즈비 -0.9826649
# ses:low 에서 middle로 변할 때, academic이 vocation 될 오즈비 +0.2913...

# 변수의 유의성 판단
# coefficient가 0이라는 귀무가설 하에서 coef~N(0,sd^2)라는걸 이용해 z검정을 함
z <- summary(test)$coefficients/summary(test)$standard.errors
z

# write가 평균일 때, ses에 따라 예측값이 어떻게 달라지는가?
dses <- data.frame(ses=c("low","middle","high"),write = mean(ml$write))
dses
test_pr <- predict(test, newdata=dses,"probs")
test_pr



