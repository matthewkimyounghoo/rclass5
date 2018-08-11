# R 언어에는 객체타입 대표 6로
# Vector, List, Matrix, Array, Factor, Data Frame
# 이 있고... 이들은 Vector 가 확장합니다.
# Vector 는 다시 6개 기본타입에 따라 
# Logical(T,F), Numeric(실수), Integer(정수), 
# Complex (허수), Character (문자열), Raw (주소값)
# 로 종류가 나뉘는데 보통은 
# Logical, Numeric, Character 세가지가 쓰입니다

## 월요일 문제
# 체질량 지수(體質量指數, Body Mass Index, BMI)는 인간의 비만도를 나타내는 지수로, 
# 체중과 키의 관계로 계산된다.
# 키가 t 미터, 체중이 w 킬로그램일 때, BMI는 다음과 같다.
# (키의 단위가 센티미터가 아닌 미터임에 유의해야 한다.)
# 공식은 https://ko.wikipedia.org/wiki/%EC%B2%B4%EC%A7%88%EB%9F%89_%EC%A7%80%EC%88%98
# 가면 구할 수 있습니다.
# 이 BMI 지수를 구하는 Function 객체를 구하시오
# 이 문제는 스위치버전은 구할수 없고 if-else 버전만 가능합니다.

x <- 180 # 키
y <- 70 # 몸무게
bmi <- function(x,y){return ()}

res <- bmi(180, 70)
res
# '정상' 으로 나오도록 코드를 완성하시오

bmi <- function(t,w){
  res <- w%/%((t/100)^2)
  kk <-if (res>=18.5 & res<=22.9) '정상' else
    if (res>=35) '고도비만' else
    if (res>=30 & res<35) '중증도 비만' else
    if (res>=25 & res<30) '경도 비만' else
    if (res>=23 & res<=24.9) '과체중' else
    if (res<18.5) '저체중'
  return(kk)
}

bmi(180,70)

bmi <- function(t,w){
  res <- w%/%((t/100)^2)
  return(if (res>=18.5 & res<=22.9) '정상' else
    if (res>=35) '고도비만' else
    if (res>=30 & res<35) '중증도 비만' else
    if (res>=25 & res<30) '경도 비만' else
    if (res>=23 & res<=24.9) '과체중' else
    if (res<18.5) '저체중')
}

bmi(180,70)

