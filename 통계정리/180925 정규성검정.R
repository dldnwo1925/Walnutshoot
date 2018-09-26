# 정규성 검정
# UsingR 라이브러리 cfb 데이터사용.  cfb > 소비자 재정에 관한 설문조자 샘플data
library(UsingR)
str(cfb)
dim(cfb)
# observation 1000, Variables 14

# 1. 샤피로 테스트
# cfb의 INCOME 소득 변수만 사용할 것
# 귀무가설 : cfb$INCOME 은 정규분포를 따른다.
# 대립가설 : cfb$INCOME 모집단은 정규분포를 따르지 않는다.
shapiro.test(cfb$INCOME)
# p-value <0.05 대립가설 채택
# cfb$INCOME 정규분포를 따르지 않는다.
# 통계량만을 가지고 정규성여부를 검정하는 것은 부족함.
# 그래프와 병행해 확인할 필요가 있다.

# 2. Histogram, Kernel Density plot
hist(cfb$INCOME,breaks = 100) # breaks = 블럭의 개수
# 그래프로 봐도 정규분포가 아니다.
shapiro.test(cfb$INCOME)
# 통계량 검정도 해본 예

# Kernel Density plot
hist(cfb$INCOME, freq=F, breaks=100, main="Kernel Density Plot")
lines(density(cfb$INCOME), col="blue", lwd=3)
# 히스토그램에서 빈도 대신 밀도(Density)로 표현하는 것
# hist() 함수의 freq=FALSE, main= 제목 이름
# 그 다음 lines(density(변수),col=색깔, lwd=선 굵기)


# 3. 분위수 분위수 그림 Q-Qplot : qqnorm(), qqline() 함수
qqnorm(cfb$INCOME)
qqline(cfb$INCOME)

######################################################
# Cars93 데이터셋 활용하기.
dim(Cars93)

df_Cars93 <- as.data.frame(Cars93)
df_Cars93
str(df_Cars93)
table(df_Cars93$Type)

# 빈도 분포 확인 함수 xtabs()
# xtabs( ~ y, data="데이터 셋)
# y= 빈도를 확인하고 싶은 변수
cars1 <- xtabs(~Type,data=df_Cars93)
cars1

# with 함수를 활용한 빈도 확인
cars2 <- with(data = df_Cars93, table(Type))
cars2
cars2[1:3]


# 상대도수분포표 - prop.table() 함수
options("digits"=2) # 소수점 자리수 설정해주는 옵션
prop.table(cars1) # 점유율로 나타내는 함수.

str(Cars93)
# xtab함수 독립수를 추가해 주면 해당 상황에 해당하는 경우의수로 나누어줌
cars3 <- xtabs(~ Type + Cylinders, data=Cars93)
cars3

#######################################################
data(UCBAdmissions)
str(UCBAdmissions)
df_UCBA <- as.data.frame(UCBAdmissions)
xtabs(~ Gender + Admit, data=df_UCBA)
xtabs(Freq ~ Gender + Admit, data=df_UCBA) # Freq 해당 합을 계산해주는 것
sum(df_UCBA$Freq[df_UCBA$Gender=="Male"])
dim(df_UCBA)
df_UCBA

chisq.test(cars3)

# 빈도수가 5이하인 셀이 전체의 20%인 경우 사용
fisher.test(xtabs(~ Type+Cylinders, data=df_Cars93))
#?? check

# Q-Q plot 해석은 경험분포, 이론적 분포가 서로 근접 하게 분포하고 있으면
# 정규성을 띤다고 평가.
# 반대로 경험분포와 이론적 분포가 멀어질수록 정규분포를 띠지 않음.
# 정규확률 산점도 그림에서 대각선을 기준으로(qqline 함수)
# 산점도 점들이 가깝게 선형을 이루며 붙으면 정규성을 띤다고 평가,
# 그렇지 않으면 정규성을 띠지 않는다고 봄.

# 정규성 여부 검정
# 샤피로 테스트, qqnorm qqline

# 정규분포 그래프, 평균 63, 분산 64, right-sided test
x1 <- c(33:93)
dnorm(x1, mean=63, sd=8)
plot(x1, dnorm(x1, mean=63, sd=sqrt(64)),type = "l")
abline(v=63, col="blue", lty=3)
# abline 함수 (v= 선을 그릴 x축 값, 컬러, lty 선의 간격)
abline(v=63+1.96*8 , col="red", lty=2)



