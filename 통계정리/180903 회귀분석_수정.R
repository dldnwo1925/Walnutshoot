# 회귀분석

# 분산과 표준편차
x <- c(1,2,3,4,5)

# 분산을 구하는 함수 var
var(x)

# 평균, 중앙값
mean(x)
median(x)

# 표준편차를 구하는 함수 sd
sd(x)
# sd(x) = sqrt(var(x))
sqrt(var(x))

# 이산확률분포와 연속확률분포
# 우리나라 남자 평균키 173cm, 표준편차 5인 정규분포를 따른다 185cm이상인
# 사람의 비율을 구해보기

x <- (150:200)
dnorm(x,mean=173,sd=5)
x
x[dnorm(x,mean=173,sd=5)==max(dnorm(x,mean=173,sd=5))]
plot(x,dnorm(x,mean=173,sd=5)) # 확률을 계산
plot(x,pnorm(x,mean=173,sd=5)) # 누적확률을 계산
pnorm(185,mean=173,sd=5)
qnorm(0.99)

# 정규분포 그래프
x <- seq(-3,3, length =200) # -3과 3사이 200개로 나누기
plot(x, dnorm(x,mean=0,sd=1),type="l", main= "정규분포, X~N(0,1)")
x <- seq(-1,1,length=200)

# dnorm > 확률을 계산하는 함수
# pnorm > 누적 확률을 계산하는 함수
# qnorm > 누적 확률의 반대


plot(x,dnorm(x,mean=175,sd=5))
plot(x,pnorm(x,mean=175,sd=5))
dnorm(185,mean=173,sd=5)
pnorm(185,mean=173,sd=5,lower.tail = F)

# 누적 정규 분포 곡선
plot(x,pnorm(x,mean=0,sd=1))

#-1부터 1까지 0.1씩
x1 <- seq(-1,1,0.1)
# 
dnorm(x1,mean=0,sd=1)
dnorm(0.5,mean=0,sd=1)
pnorm(0.5)

plot(x,dnorm(x,mean=0,sd=1))

qnorm(0.3)

##############################################################
# 연습문제
# 전구회사에서 생산하는 전구 수명은 평균 800일 표준편차는 40일인 정규분포
# 전구의 수명이 750 이하일 확률구하기
# 750일 확률
dnorm(750,mean=800,sd=40)
# 누적확률 750이하일 확률
pnorm(750,mean=800,sd=40)


# 어느 한 회사 사원들의 근무기간 평균11년 분산 16년임. 20년 이상근무한 종업원의 비율
pnorm(20,mean=11,sd=sqrt(16),lower.tail = F)
# 같은 식 lowertail로 뒤집어줄 수 있음
1-pnorm(20,mean=11,sd=sqrt(16))

# 답 약 1.2%


# 고3 학생들 수학 성적은 평균 70 표준편차 8 정규분포
# 점수가 80점 이상 90점 이하인 학생의 비율 구하기

pnorm(90,mean=70,sd=8) - pnorm(80,mean=70,sd=8)


# 중심극한정리
set.seed(43210)
rn1 <- rnorm(10000,mean=0,sd=1)
hist(rn1)
rn2 <- c()
rn3 <- c()
rn4 <- c()

for(i in 1:100){
  rn2[i] <- mean(sample(rn1, size=5, replace=T))
  rn3[i] <- mean(sample(rn1, size=100, replace=T))
  rn4[i] <- mean(sample(rn1, size=10000, replace=T))
}

par(mfrow=c(2,2))
par(mfrow=c(1,1))

hist(rn1,freq=F)
hist(rn2,freq=F)
hist(rn3,freq=F)
hist(rn4,freq=F)




