# 통계적 추정 상관과 회귀

# 상관분석 - 상관계수 구하기
# cor()함수
# 지각횟수와 판매량의 관계

late <- c(1,2,3,4,5)
sales <- c(8,7,6,4,5)
cor(late, sales)
# -0.9 > 강한 음의 상관관계
# 지각을 많이 할수록 판매량이 떨어진다.

# 작업자들의 교육과 생산량의 관계
edu <- c(1,3,5,7)
man <- c(35,45,35,45)
cor(edu, man)
# 0.447 양의 상관관계

x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)
cor.test(x,y,alternative = "two.sided", conf.level=0.9)
# x, y는 상관이 없을 것이다 귀무가설 채택


library(ggplot2)
head(mpg)
cor.test(mpg$cty, mpg$hwy)


#####################################################

# 회귀분석
# 회귀분석은 두 변수간의 인과관계를 찾아 식을 도출하고 식을 바탕으로
# 예측 기법에 활용가능하다.
# cars 데이터의 speed,와 dist(제동 거리)간의 관계 확인하기
# lm함수 < 회귀식의
m <- lm(dist ~ speed , data=cars)
# 결과의 intercept = y절편, speed 값은 기울기
# 회귀식 y = -17.579 + 3.932*cars$speed

# 선형 회귀 결과 해석하기.
# 1. 회귀 계수 측정 함수 coef() - 회귀식의 y절편, 기울기를 표시
coef(m)

# 2. 적합된 값 측정 fitted() - 각 speed 값에 대해 예측된 dist 값을 표시해줌.
fitted(m)

# 3. 잔차 측정 함수 residuals() - 예측값과 실제 모델의 차이를 표시해 줌.
residuals(m)
# fitted 값과 residuals(잔차)의 합은 실제 값과 같음 > 당연한 소리
cars$dist==(fitted(m)+residuals(m))

# 4. 회귀 계수의 신뢰 구간 측정 함수 - confint()
confint(m)
# 단순 선형 회귀에서 절편과 speed의 기울기는 정규 분포를 따름.
# 따라서 t분포를 사용한 신뢰 구간을 confint를 통해 구할 수 있음.

# 5. 잔차 제곱의 합 측정 함수 - deviance()
# check
deviance(m)


# 회구분석 예측과 신뢰 구간
# lm을 통해 회귀 모델을 만들고 그 후 predict로 예측값을 구할 수 있다.
# predict.glm, predict.lm, predict.nls 등으로 호출
# 선형 회귀의 경우 predict.lm()함수 사용
# predict.lm(선형 회귀 모델, new data) 반환 값을 newdata 예측 결과.
m <- lm(dist ~ speed, data=cars)
predict.lm(m, newdata=data.frame(speed=3))
# speed가 3일 때 제동 거리가 -5.781869로 예측값이 나옴
# 실제 회귀식 값과 비교해보기
coef(m)
-17.579095 + 3.932409*3

# predict 함수 에서 신뢰 구간 추정하기
predict(m, newdata=data.frame(speed=3), interval="confidence")
# fit 값은 해당 데이터에 대한 예측값, lwr의 신뢰구간 하한, upr은 신뢰구간 상한
# 위 식은 평균적인 차량의 제동 거리에 해당한다.
# 평균적인 차량에 대한 추정이므로 오차를 고려하지 않는다.
# 오차의 평균은 0이기 때문

# But, 특정 차 한 대가 주어졌다면 오차를 무시할 수 없다.
# 이 때 interval 옵션을 prediction으로 사용한다.

summary(m)
model <- lm(formula = hp ~ . , data=mtcars)
head(mtcars)
summary(model)

model2 <- lm(hp ~ disp + carb, data=mtcars)
summary(model2)
library(car)
vif(model)
mpg_lm <- lm(cty ~drv , data=mpg)
summary(mpg_lm)
plot(cars$speed, cars$dist)

abline(model, col="red")
abline(m1, col="black")
m1 <- lm(dist ~ speed, data=cars)

#####################################################
# 단순선형회귀분석
# 회귀분석 > 잔차를 최소화 하는 선형회귀식을 찾는 것
# 1. 단순선형회귀분석
# sales 데이터를 통해 찾아 볼 것
sim_regre <- read.csv("simple regression.csv",header=T)
getwd()
head(sim_regre)
sim_regre_lm <- lm(sales ~ cost, data=sim_regre)
plot(sim_regre)
abline(sim_regre_lm,col="red")

summary(sim_regre_lm)
# F검정 유의하다고 판단. cost도 유의하다고 판단
# 회귀식 : 0.6411 + 0.8134*cost
coef(sim_regre_lm)
fitted(sim_regre_lm)
sim_regre$sales
sim_regre_lm$fitted.values

# 잔차
sim_regre$sales - sim_regre_lm$fitted.values
residuals(sim_regre_lm)

summary(sim_regre_lm)
fitted(sim_regre_lm)[1:4]
names(sim_regre_lm)

sim_regre$sales
sim_regre_lm$fitted.values
par(mfrow=c(2,2))
plot(sim_regre_lm)
# 첫 번째 그래프는 잔차와 fitted value의 관계
# 여기서는 평균은 0을 중심으로 일정하게 분포함.

# 두 번째 그래프는 Normarl Q-Q plot잔차가 정규분포를 따르는지 확인함
# 직선 관계가 뚜렷하게 나타나야 함.

# 세 번째 그래프는 Scale-Location plot
# 표준화 잔차는 잔차/잔차의 표준편차로 계산함.
# -표준화 잔차 : 잔차의 분산을 ㄹ없애 표준화한 잔차
# 이상치(outlier)을 탐지할 수 있는 그래프임
# 빨간색 추세선이 0인 직선이 가장 이상적이다.
# 빨간색 추세선에서 크게 벗어난 값은 이상점일 가능성이 있다.

# 네 번쨰 그래프는 잔차 vs Leverage plot
# Leverage : 설명변수가 얼마나 극단에 치우쳐 있는지 설명
# Cook's distance : 회귀 직선의 모양(기울기, 절편)에 크게 영향을
# 끼치는 점을 찾는 그래프.

#######################################################
# 다중회귀분석
# 하나 이상의 독립 변수가 사용된 선형 회귀
# 스마트폰의 사용자가 만족을 느끼는 요인 - 디자인, 유용성, 편의성
# 종속변수 : 만족도
# 독립변수 - 디자인, 유용성, 편의성
df_sp <- read.csv("multi regression.csv", header=T)
sp_lm <- lm(satisfaction ~ . , data=df_sp)
summary(sp_lm)
df_sp$satisfaction[1:4]
fitted(sp_lm)[1:4]
residuals(sp_lm)[1:4]

# 다중공선성
# 회귀 모델의 독립변수들 사이에 상관관계가 있는 경우를 말함.
# 다중공선성이 존재할 경우
# - 모델의 정확도 하락
# - 두 변수 간에 다중 공선성이 존재할 경우 설명력이 더 적은 변수 제거 후
#   모델을 재구성 함
# 다중공선성을 확인하는 함수 VIF
# vif 지수가 4이상이면 다중공선성이 있다고 판단한다.
library(car)
vif(sp_lm)
# 세 변수는 없다고 봐도 됨

#######################################################

# 단계적 회귀분석
# 1. 후진제거법 : 독립변수를 모두 포함시킨 모형에서 분석을 시작함.
# 가장 영향력이 적은 변수부터 제거하고 더 이상 제거할 변수가 없을 때
# 제거를 중단하고 모형을 최정적으로 선택하여 분석함.

# 2. 전진제거법 : 종족변수에 가장 영향력을 주는 독립변수부터 모형에 포함
# 추가될 독립변수가 없을 때 변수의 선택을 중단, 분석을 시작

# 3. 단계적 방법 : 여러개의 독립 변수 중 설명력이 가장 높은 독립변수부터
# 차례로 삽입한 다음 의미 없는 독립변수를 제거하는 방식.

# AIC 후진제거법
# 스마트폰 예제
stepback <- read.csv("step regressin.csv",header=T)
summary(stepback)

sb_lm <- lm(satisfaction ~ design + convenience + usefulness + brand, data=stepback)
step(sb_lm, direction="backward")
# AIC = 영향력
# 제일 작은 것 부터 없애고 더 이상 없을 때 분석 시작.
# brand가 영향력이 없다고 판단 되고 삭제 후 분석시작.
# 결과 lm회귀 포뮬러식, 회귀식 도출

# AIC 전진제거법
# 한 번 더 확인.
sb_lm #그대로 활용
stepback_null <- lm(satisfaction~1, data=stepback)
stepback_null # 아무것도 없을 때 값을 구하는 것
step(stepback_null, direction = "forward", scope=list(lower=stepback_null, upper=sp_lm))

# 단계적 방법
# 전진, 후진을 번갈아가며 진행.
# 모든 부분집합을 고려함. Best변수 선택방법
# 변수선택법중 많이 사용함

step_both <- read.csv("step regressin.csv",header=T)
step_both_null <- lm(satisfaction ~1,data=step_both)
step_both_lm <- step(step_both_null, direction="both", scope=list(upper=sb_lm))
summary(step_both_lm)
vif(step_both_lm)

#######################################################
# 로지스틱 회귀 분석
# 이항 회귀모형, 범주형 변수
# 일반화선형모형(Generalized Linear Model, GLM)의 이항분포를 따르는 모형의
# 일부로 해석하기도 한다.
# 새로운 설명변수의 값이 주어질 때 반응변수에 속할 확률이 얼마인지 추정
# 이항형인 데이터에 적용하였을때 0,1로 제한
# 종속 변수가 이진적이기 때문에 조건부 확률의 분포가 정규분포 대신
# 이항 분포를 따름.

movie <- read.csv("drama_genre.csv")
head(movie)
summary(movie)

# 주연배우 나이 합계, 뺨 맞는 회수, 장르로 구분
# 로지스틱은 2가지 카테고리만으로 판단할 것 > 장르를 두 가지로 줄여보자
# 장르 전처리
library(dplyr)
movie_log <- movie %>% filter(movie$genre %in% c("막장드라마","멜로드라마"))
movie_log <- subset(movie, genre %in% c("막장드라마","멜로드라마"))
summary(movie_log)
# 두 가지 전처리 방법 가능

# fcator 레벨을 3에서 2로 줄여주기(청소년드라마가 레벨에 껴있기 때문에 삭제 해주는 것)
movie_log$genre <- as.factor(as.character(movie_log$genre))

# 데이터 분포 실펴보기
library(scales)
library(ggplot2)

par(mfrow=c(1,1))
# 산점도
plot(sum_age_mainactors ~ avg_slap_face, data=movie_log, col=alpha(c("blue","green"),0.8)[movie_log$genre],xlab="회당 뺨 맞는 횟수",ylab = "주연배우 나이 합계",main = "드라마 장르 분포")
# 범례
legend("topleft", legend= levels(movie_log$genre), pch=1, col=alpha(c(
  "blue","green"), 0.8),cex=0.9, bty="n")

# 로지스틱 회귀분석 glm함수 사용하기
full <- glm(genre ~. , data=movie_log, family = "binomial")
summary(full)
names(full)

# Null Deviance와 Residual Deviance는 값이 작을수록 해당모형이 자료를 잘 적용한 것
# Null Model은 절편항만 가지는 모형으로 추정할 모수가 1개이다.
# Resid.Dev 값이 많이 하락 할수록 의미있는 변수이며 그 값이 작을수록 모델의 성능이 좋다.
# 변수가 하나씩 포함될 때마다 Resid.Dev값으로 모델의 성능 개선을 확인할 수 있음
# 적합도 검정 : 범주형이므로 카이제곱분석
anova(full,test="Chisq")
full
confint(full)
# 유의수준 5% 검정 각 변수 별 신뢰구간 추정

# 오즈비
# 오즈비가 0.5.보다 작거나 2보다 클 떄 효과가 보통이라고 함.
# 지수변환하기 exp
exp(confint(full))

# 다중 로지스틱 회귀분석 (변수가 2개 이상)
df_mc <- as.data.frame(mtcars)
# 엔진 유형 : V엔진과 staright 엔진 0,1 로 구분
# 이항 변수를 반응 변수로
# mpg와 am을 예측변수로 하는 로지스틱 회귀모형을 만들어보자

glm_vs <- glm(vs~mpg + am, data=df_mc, family=binomial)
summary(glm_vs)

# odds ratio : 오즈비 = p/(1-p)
# 독립변수 한 단위가 증가할 때 종속변수가 얼마나 변화하는지 확인하는 비율

# 예시
# 1= 구입, 0 미구입
# a^1 = 3.72 이면 소득이 한 단위 증가하면 물품을 구매하지 않을 확률에
# 대한 구매할 확률이 exp(3.72)배 증가
exp(3.72)

# 오즈비 활용
summary(glm_vs)
# mpg에 대한 회귀식이 -12.7051 + 0.6809*mpg로 나왔다.
# 이는 1단위당 0.6809의 변화율이 있다는 것
# 오즈비에 대입해보자
exp(0.6809)
# 1.98배 증가하는 것을 알 수 있다.

# am에 대한 회귀식을 활용해 대입해 보면
exp(-3.0073)
# 약 0.05배가 나옴.
# mpg가 주어질 때 변속기가 수동인 경우 자동에 비해 오즈가 95%감소
# 회귀 계수의 부호가 양수이고 값이 커지면 p값이 커지므로 성공 확률이 높아짐.
# 부호가 음수이고 절대값이 커지면 p가 작아지므로 성공 확률이 낮아진다.

# 적합도 검정
anova(glm_vs , test="Chisq")

install.packages("pscl")
library(pscl)
pR2(glm_vs)
# McFadden 값?
# lm함수의 수정계수의 의미 > 분석 모델의 설명력

# 오즈비가 0.5보다 작거나 2보다 클 때 효과가 보통이라고 함.
exp(coef(glm_vs))



##################################################

# 다항 로지스틱 회귀분석
# 예측하고자 하는 분류가 0,1 두 가지가 아닌 여러개의 경우 사용함
# nnet패키지의 multinom함수 사용함.

library(nnet)
m <- multinom(Species ~ .,data=iris)

# 작성한 모델이 주어진 훈련데이터를 어떻게 분류하는지 fitted를 사용해 고나찰

fitted(m)
# 결과로 행의 데이터가 각 분류에 속할 확률이 나온다.
# 50개씩 나뉘어져 있기 때문에 50개씩 대부분 일치 너무 좋은 데이터라 확률도 높음

predict(m, newdata = iris[c(1,51,101),],type="class")
a <- predict(m, newdata = iris[c(1,51,101),],type="probs")
#a[colnames(a)=="setosa"] %>% min(a)
# 1번째 51번째 101번째 데이터를 분류를 class로 예측해보았다.

# 각 분류에 속할 확률을 예측하고자 한다면 type을 probs으로!
# 모델의 정확도는 예측된 Species와 실제 Species를 비교함.

predicted <- predict(m, newdata=iris)
sum(predicted == iris$Species)/NROW(iris)
# 정확도가 98.6%로 나옴

# 분류 대상이 2개 이상인 경우 분할표 그려보기
xtabs(~predicted + iris$Species)
predicted
predicted[min(predicted)]





