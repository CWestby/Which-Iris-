library(dplyr)
library(ggplot2)
library(gridExtra)

data(iris)

head(iris)

str(iris)

boxplot(iris[,1:4], main = "All Species", ylab = "Centimeters")
hist(iris$Petal.Length, breaks = 100)

setosa <- iris %>%
  filter(Species == "setosa")

versicolor <- iris %>%
  filter(Species == "versicolor")

virginica <- iris %>%
  filter(Species == "virginica")

par(mfrow=c(1, 3))
boxplot(setosa[, 1:4], main = "Setosa", ylab = "Centimeters") 
boxplot(versicolor[, 1:4], main = "Versicolor", ylab = "Centimeters")
boxplot(virginica[, 1:4], main = "Virginica", ylab = "Centimeters")


g_sepw <- ggplot(iris, aes(x=Species, y = Sepal.Width)) + 
  geom_boxplot()
g_sepw

g_sepl <- ggplot(iris, aes(x=Species, y = Sepal.Length)) + 
  geom_boxplot()
g_sepl

g_petw <- ggplot(iris, aes(x=Species, y = Petal.Width)) + 
  geom_boxplot()
g_petw

g_petl <- ggplot(iris, aes(x=Species, y = Petal.Length)) + 
  geom_boxplot()
g_petl

grid.arrange(g_sepl, g_sepw, g_petl, g_petw, nrow = 2, ncol = 2)
