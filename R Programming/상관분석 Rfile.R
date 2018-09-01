# 180901 상관분석

# 놀이공원 데이터 가져오기
df_amuse <- read.csv("http://goo.gl/HKnl74")
df_amuse

names(df_amuse)

# 상관분석을 진행함에 있어 결측치가 있으면 NA로 나오므로 제거해야함
colSums(is.na(df_amuse))
# 결과 결측치가 없다.


# 산점도 그리기
# 산점도란 직교 좌표계를 이용해 두 개 변수 간의 관계를 나타내는 방법임.
# 산점도로부터 두 변수 간에 관련성을 그림을 이용하여 시각적으로 파악

attach(df_amuse)

# plot(Y~X)
# 함수의 Y, x에 변수를 입력하면 산점도 생성 Y : 종속변수 //X : 독립변수
plot(overall ~ rides, main = "놀이기구에 대한 만족도와 전체만족도",
     xlab = "놀이기구 만족도", ylab= "전체만족도", cex=1, pch=1, col="red")
# R 시각화 그래프의 제목 입력
# main = "제목"
# xlab = "x축 이름" ylab = "ylab 이름"
# cex = 점의 크기(숫자로 입력)
# pch = 점의 모양(숫자로 입력)
# col = 색상
# xlim = x축 리미트(출력 제한 범위)
# ylim = y축 동일
# lty = 출력되는 선의 형태 지정

# 공분산과 상관계수
# 공분산은 2개의 확률변수의 상관정도를 나타내는 값이다.
# 만약 2개의 변수 중 하나의 값이 상승하는 경ㄴ향을 보일 때 다른 값도 상승하면
# 공분산의 값은 양수
# 반대로 다른 값이 하강하는 경향을 보이면 공분산의 값은 음수가 나온다.
cov(overall,rides)
# overall과 rides의 상관관계는 상승하는 경향
# 어느정도의 상관관계인지만 확인
# 그래서 공분산을 표준화 시킨 상관계수를 통해 파악
# cor함수를 통해 선형관계 강도 확인
cor(overall,rides)


# 상관관계 test
# cor.test함수 : 상관 계수에 대한 가설 검정을 수행한다.
# cor.test(x,y, alterantive= "양측 단측(less,greater)) 기본값은 양측,
#          method= "pearson","kendall","spearman") 상관계수의 종류 기본은 피어슨

cor.test(overall,rides,alternative="two.sided",method="pearson")
# 귀무가설 : 상관관계가 없다에 대한 검정결과 p-value = 2.2e-16 <0.05 이므로 귀무가설 기각

###################################################
# 추세선 그리기
plot(df_amuse[,4:8],apnel=panel.smooth())

# 다른 추세선
library(PerformanceAnalytics)
chart.Correlation(df_amuse[,4:8],histogram=T,pch=19)

# 상관관계 숫자로 표현하기
install.packages("corrplot")
library(corrplot)

cor(df_amuse[,4:8])
# 4:8 열 상관계수 Dataframe
df_amuse_cor <- cor(df_amuse[,4:8])
corrplot(df_amuse_cor)
corrplot(df_amuse_cor,method="number")

# 상관계수가 0이면 선형관계는 없는 것이지만 비선형관계는 있을 수도 있음.
# 상관계수가 1인 것은 x,y가 선으로 되어있는 관계이며 기울기는 상관없음
# y값이 0인 선은 상관계수 값이 없음.

#########################################################################

# 회귀분석
# 단순선형회귀분석(종속변수 1 독립변수1 일때)
# 회귀식을 구하기위해 회귀계수 추정 많이 쓰는 방법이 최소제곱법

# 놀이기구 만족도와 전체만족도 간의 관계 분석하기
# lm함수 > 회귀식을 구하는 함수.
lm(overall ~ rides)
# 절편 : -94.962 , 기울기 1.703
# overall = -94.962 + 1.703*rides

# 회귀식을 바탕으로 산점도 구하기
m1 <- lm(overall~rides)
plot(overall~rides)
abline(m1,col="blue")

# 회귀식 모델 summary를 통해 유의한지 판단할 수 있음.
summary(m1)
# 회귀모형의 검정 및 적합도 파악
# 통계적으로 유의한지, 변수가 유의하게 영향을 미치는지, 얼마나 설명력을 가지는지
# F-statistic : 도출된 회귀식이 회귀모델 전체에 대해 통계적으로 의미가 있는지 파악
# P-value : 각 변수가 종속변수에 미치는 영향이 유의한지 파악
# Adjusted R-squared : 회귀직선에 의해 설명되는 변동이 총 변동 중에서 차지하고
  # 상대적인 비율이 얼마인지 나타냄
# 회귀직선이 종속변수의 몇%를 설명할수 있는지 나타냄(설명력이라고 보면 됨)

################ 회귀분석 예제
df_ad <- read.csv("simple regression.csv",header=T)
# 데이터 가져와서 확인하기
summary(df_ad)
head(df_ad)
detach(df_amuse)
attach(df_ad)

# 산점도를 통해 선형, 비선형 확인
plot(sales~cost)

# 회귀식 도출
df_ad_lm <- lm(sales~cost,df_ad)
df_ad_lm
abline(df_ad_lm,col="red")
summary(df_ad_lm)
# p값 0.05보다작으므로 모델 유의
# 설명력 68.81% sales에 대한 cost의 유의성 매우 높음

# 각 데이터의 광고비값에 대해 모델에 의한 예측된 매출액값은 fiitted함수로 구함
# 이 값은 모델이 데이터에 적합된 결과이므로 fiited value라고 부른다.
fitted(df_ad_lm)
# 잔차(residuals) : 선형 회귀 모델을 작성한 다음 모델로부터 구한 예측값과
# 실제 값 사이의 차이를 의미함.
# 잔차를 통해 정규분포에서 얼마나 벗어났는지를 알 수 있다.

names(df_ad_lm)
# 원데이터의 매출액과 선형회귀분석모델 매출액 비교
head(df_ad$sales)
head(df_ad_lm$fitted.values)
# 잔차
head(df_ad_lm$residuals) # = 원 매출액 - 분석모델 매출액
head(df_ad$sales-df_ad_lm$fitted.values)

summary(df_ad_lm)

# 모형 진단 그래프
par(mfrow=c(2,2))
plot(df_ad_lm)

# 첫 그래프는 잔차 vs Fitted plot
# 잔차의 평균은 0을 중심으로 일정하게 패턴 없이 분포

