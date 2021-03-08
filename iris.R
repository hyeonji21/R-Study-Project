getwd() # 현재 경로

data(package = "datasets")
data(package = "ggplot2")
data(package = "dplyr")

library("dplyr")
library("ggplot2")


### datesets 속 여러 데이터 탐구
data(list = "ChickWeight", package = "datasets")
class(ChickWeight)
str(ChickWeight)
head(ChickWeight)

data(list = "airquality", package = "datasets")
class(airquality)
str(airquality)
head(airquality)

data(list = "diamonds", package = "ggplot2")
class(diamonds)
str(diamonds)
head(diamonds)

data(list = "storms", package = "dplyr")
class(storms)
str(storms)
head(storms)


### iris 데이터
# 붓꽃의 3가지 종(setosa, versicolor, virginica)에 대해 
# 꽃받침(sepal)과 꽃잎(petal)의 길이를 정리한 데이터
install.packages("knitr")

install.packages("rmarkdown")

library(knitr)

library(rmarkdown)


# Sepal.Length (꽃받침의 길이) : num
# Sepal.Width (꽃받침의 너비) : num
# Petal.Length (꽃잎의 길이) : num
# Petal.Width (꽃잎의 너비) : num
# Species (붓꽃의 종) : Factor


# 데이터셋 일반 정보
data(list="iris", package = "datasets")
class(iris) # 데이터 형태
str(iris) 
head(iris)
tail(iris)
dim(iris) # 행, 열 

# 4개 열 데이터에 대한 데이터 분포 확인
summary(iris) # iris 통계정보 요약
summary(iris[,1])
summary(iris[,2])
summary(iris[,"Petal.Length"])
summary(iris$Petal.Width) # 변수명 형태로 가져오기

# sd : 표준편차 (퍼진 정도)
# 크면 : 평균으로 넓게 퍼짐
# 작으면 : 평균 주변에 모여 있음
sd(iris[,1])
sd(iris[,2])
sd(iris[,3])
sd(iris[,4])

# 상관관계
# 강한 양의 상관 관계를 보임
cor(iris$Sepal.Length, iris$Petal.Length)

cor(iris$Sepal.Width, iris$Petal.Width)


# 열 데이터에 대해 그룹별 분포 확인
par(mfrow = c(2, 2))  
# 2행, 2열로 나눠서 그래프 표현

# 네 개의 변수 사이에서는 각 그룹 간(품종별) 데이터 크기 차이 존재
# 이상치에 속하는 데이터가 일부 있음. 
boxplot(Sepal.Length~Species, data=iris,
        main = "Sepal.Length")
boxplot(Sepal.Width~Species, data=iris,
        main = "Sepal.Width")
boxplot(Petal.Length~Species, data=iris,
        main = "Petal.Length")
boxplot(Petal.Width~Species, data=iris,
        main = "Petal.Width")


# 산점도 (그룹별 분포)
# 품종 별 분포 및 두 변수 사이의 상관성 관찰

point <- as.numeric(iris$Species) # 포인트 모양
color <- c("red", "green", "blue") # 포인트 컬러
pairs(iris[,-5],
      pch=c(point),
      col=color[iris[,5]])
# 빨간색 : 두개와 다른 양상을 보임
# 파랑/초록 : 두개의 품종 사이에 이 데이터만으로는 구분이 x






write.table(iris, file="iris.csv", sep=",", row.names=FALSE)
irisData <- read.table("iris.csv", header = TRUE, sep=",", stringsAsFactors = FALSE)
str(irisData)

order(iris$Sepal.Length) # Sepal.Length 기준으로 정렬
split(iris, iris$Species) # Species 기준으로 정렬 
sub.setosa <- subset(iris, Species=='setosa')  
# Species가 setosa인 데이터를 부분집합으로 뽑기

# with를 이용해 iris$ 생략 가능 
with(iris,
     {
       print("Max of Sepal.Width \n")
       print(max(Sepal.Width))
     })
print(max(iris$Sepal.Width))

# which, aggregate :
# which : 몇번째 있는 값?
which.max(iris$Sepal.Length) 
which.min(iris$Sepal.Length)
iris[132,]
iris[14,]

aggregate(Sepal.Width~Species, iris, mean)
aggregate(Sepal.Width~Species, iris, max)


sample(1:10, 5, replace=TRUE)  # 1~10 사이의 숫자 중, 5개를 복원 추출


