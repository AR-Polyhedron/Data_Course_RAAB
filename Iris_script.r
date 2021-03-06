library(tidyverse)
# load some data

data("iris")

# subset

glimpse(iris)
iris <-iris %>% filter(Species == "virginica") #subset == Virginica

#Plot Sepal. Lenght as y-axis; Petal.Lenth is X-axis
#Colored points in scatter plot
plot(y=iris$Sepal.Length, x=iris$Petal.Length, col=iris$Species, pch = 20, main="You're gonna hate iris beofre this is all done",ylab="Sepal Length",xlab="Petal Length")


summary(iris)


# boxplot of sepal lenght as function of specieis

boxplot(y=iris$Sepal.Length, x=iris$Species, main="You're gonna hate iris beofre this is all done",ylab="Sepal Length",xlab="Petal Length")

hist(iris$Sepal.Length,breaks= 20)
plot(density(iris$Sepal.Length))

# how to save a plot

jpeg("densityplot.jpeg")
plot(density(iris$Sepal.Length))
dev.off()