# 로지스틱 회귀분석 (Logistic Regression Analysis)
# 이항 회귀모형, 범주형 변수
# 일반화 선형 모형(Generailzed Linear Model, GLM)의 이항분포를 따르는 모형의 일부로 해석하기도 함.

# GLM
# 선형호귀에 대한 대안.
# 오차항의 분포가 정규분포가 아닌 경우를 허용하는 방법.
# 데이터의 편차가 심할 때 반응변수(y)가 계수(count)자료이거나 이항(binary)인 경우 사용함.
# 계수를 셀 수 있거나 이항적인 변수일 경우
# GLM의 중요 특성 : 오차구조, 선형예측량, 연결함수.

# 오차구조 : 모델링에 사용할 오차항의 분포에 대한 정보
# family 옵션으로 지정, 포아송분포, 감마분포 등
# ex) glm(y~ . , family = poisson or Gamma)

# 선형예측량 : 모형에 포함된 독립변수들에 대한 정보 관련 설명변수들의 효과의 선형결합으로 정의
               #(실제값과 평균값의 관계)
# 연결함수 : 선형 예측량과 반응변수의 평균 사이의 관계 지정, 달느 연갈함수를 사용한 후 성능비교 가능

# 편차 : 적합도 통계량의 질로 정의, 가설검정에 주로 사용
# 정준연결함수 : 각 오차구조에 해당하는 필요한 기본함수.

# 오차구조, 정준연결함수 참조
# famliy(object,...) : Family objects for Models 관련 옵션
# 1. binomial(link="logit") : 연속된 n번의 독립적 시행에서 각 시행 확률 p를 가질 때 이산 확률분포, 베르누이 분포
# ex) 주사위를 10회 던져 숫자 6이 나오는 회수, 이 분포는 n=10 p=1/6인 이항분포.
# 2. gaussian(link = "identity") : 정규분포 또는 가우스 분포 - 연속 확률 분포의 하나.
# 3. Gamma(link="inverse") : 지수 분포나 포아송 분포 등 매개변수에 대한 켤레 사전 확률 분포, 이에 따라
#                            베이즈 확률론에서 사전 확률 분포로 사용
# 4. inverse.gaussian(link="logit")
# 5. poisson(link ="log") : 단위 시간 안에 어떤 사건이 몇 번 발생할 것인지 표현하는 이산 확률 분포
# 6. quasi(link = "identity", variance = "constant")
# 7. quasibinomial(link = "logit")
# 8. quasipoisson(link = "log")

# 종속변수의 분포가 정규분포인 경우 -> family 옵션 = gaussian
# 이항분포인 경우 -> family 옵션 = binomial
# 포아송분포인 경우 -> family 옵션 = poisson
# 역정규분포인 경우 -> family 옵션 = inverse.gaussian
# 감마분포인 경우 -> family 옵션 = gamma
# 응답분포가 확실하지 않은 때를 위한 유사가능도 모형인 경우 quasi를 사용.

# glm 함수
# glm(
#   formula = , 모델 포뮬러 식
#   data =, 표뮬러를 적용할 데이터
#   family = , 오차 분포의 링크 함수, 로지스틱 회귀 모델은 이항 모델이기 때문에 binomial 사용.
# )
# 반환값은 일반화 선형 모델인 glm 객체

# predict.glm : 일반화 선형 모델을 사용한 예측을 수행함.
# predict.glm(
#   object = , glm 모델 객체
#   newdata = , 모델을 적용할 데이터
#   type = , link, response, terms
#   link 옵션 : 선형 독립 변수들의 연산 결과의 크기로 값을 반환, 로지스틱 회귀 모델의 경우
#               로그 오즈 log(p / (1-p))값
#   response : 반응 변수의 크기로 값을 반환하며 로지스틱 회귀 모델의 경우 p가 이에 해당함.
#   terms : 행렬에 모델 표물러의 각 변수에 대한 저갛ㅂ된 값을 선형 예측 변수의 크기로 반환함.
# )
# 반환 값은 모델을 사용한 예측 결과.
# 새로운 설명변수의 값이 주어질 때 반응변수에 속할 확률이 얼마인지를 추정함.

# 이항형인 데이터에 적용하였을 떄 종속 변수 y의 결과가 범위(0,1)로 제한됨.
# 종속 변수가 이진적이기 때문에 조건부 확률의 분포가 정규분포 대신 이항분포를 따름

# 로지스틱 회귀가 분류의 목적으로 사용될 경우 기준값보다 크면 Y=1인 잡단 아니면 0으로 분류.

# 합성약물 투여량이 쥐 20마리 치사율에 미치는 영향
# 1: 집단, 2: 약물투여 정도, 3. 성별, 4. 죽은수, 5.살아남은 수
cmp1.ld <- read.table(header=TRUE, text='
                      lethaldose sex numdead numalive
                      1 0 M 1 19
                      2 1 M 3 17
                      3 2 M 9 11
                      4 3 M 14 6
                      5 4 M 17 3
                      6 5 M 20 0
                      7 0 F 0 20
                      8 1 F 2 18
                      9 2 F 2 18
                      10 3 F 3 17
                      11 4 F 4 16
                      12 5 F 6 14
                      ')
str(cmp1.ld)
attach(cmp1.ld)
# 집단 당 20마리 사망 비율 구하기
proportion_dead <- numdead/20
proportion_dead

# 산점도를 통해 비교하기
plot(proportion_dead ~ lethaldose, pch=as.character(sex))
# 수컷은 사용량이 증가하면 치사량도 많음
# 암컷은 증가하긴 하지만 완만한 편

# 죽은 횟수와 산 횟수로 보기
counts <- cbind(numdead, numalive)
# glm 모델 생성
# family는 분포에 따라 사용자가 지정해주어야 한다.
cmp1.ld_glm <- glm(counts~ sex * lethaldose, family=binomial)
summary(cmp1.ld_glm)
# 결과
# sexM:lethaldose Pr값이 0.05보다 작아 유의하게 나온다.
# 귀무가설 : 교호작용이 없다.
# sexM과 lethaldose사이에 교호작용이 있는것으로 보인다.
# 이 때 과대산포(Overdispersion)문제 확인
# 과대산포 요인 : 양의 공분산, 관측에서 상관관계
# Resiudal deviance : 3.939 자유도 = 8
3.939 /8
# 과대산포값이 1보다 작으면 문제가 없음. > 여기선 문제가 없다고 판단 됨.
# 1보다 크다면 과대산포를 고려한느 오차구조인 준이항을 이용해 다시 모형 적합.

summary(glm(counts~sex*lethaldose, family=quasibinomial))
# p값이 바뀌긴 했지만 오차구조를 바꾼 것이 큰 차이가 없다.
# 귀무가설 기각, 대립가설 채택, 교호작용이 있다.

cmp1.ld_glm2 <- update(cmp1.ld_glm, ~. -sex:lethaldose)
summary(cmp1.ld_glm2)
# 편차값/자유도 > 1보다 큼 > 과대산포 가능성 시사
# sexM : lethaldose를 제거하면 문제가 있을 수 있음.
11.975/9 # 1보다 크면 오류가 있는 것 과대산포

# 두 모형이 유의하게 다른지 anova 함수로 검정
# 하나 이상의 적합 모델 객체에 대한 분산(또는 편차)으로 계산
# 이항오차 구조일 때가 중요하다
# 이항오차구조를 가진 경우 test인수를 카이제곱으로 지정
# 카이제곱 분산분석(anova)
anova(cmp1.ld_glm, cmp1.ld_glm2, test="Chi")
# Pr 값이 0.05보다 작으므로 유의하게 다르다고 판단. 모형이 다르다.
# 두번째 모형이 과대산포 가능성이 있었으므로 첫 모형이 더 나은것으로 판단함.
# 모형의 간면성(parsimoony)를 최대화 하며 가장 작은 잔자편차값(적합도)을 갖는
# 모형을 고르면 가장 좋은 모형이다.

