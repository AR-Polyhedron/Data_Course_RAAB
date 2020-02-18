library(tidyverse)
data("iris")
data("iris")
#ggplot
#first argument is a dataframe

#scatter plot colored by species
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point()

#bar chart colored by species
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_bar()

?stat_count

ggplot(iris,aes(x = Sepal.Length, color = Species)) + geom_bar()

ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_col()

ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_bar(stat = "identity")

ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, fill = Species)) + geom_bar(stat = "identity")

#bar chart showing mean of each species sepal lenghth

ggplot(iris,aes(x = Species, y = Sepal.Length)) + geom_col()

ggplot(iris,aes(x = Species, y = Sepal.Length)) + geom_col()

iris %>% group_by(Species) %>%
  summarize(Mean= mean(Sepal.Length)) %>%

ggplot(aes(x =Species, y =Mean, fill=Species)) + geom_col()

#another scatterplot
#setosa and versicolor
#scatterplot: x=Sepal.length y= Sepal.Width, color= Speciies

iris %>% filter(Species %in% c("versicolor","setosa")) %>%
  ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point()

#You can keep adding with a +

iris %>% filter(Species %in% c("versicolor","setosa")) %>%
  ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point() + geom_smooth()

?geom_smooth
?stat_count

iris %>% filter(Species %in% c("versicolor","setosa")) %>%
  ggplot(aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point() + geom_smooth(method = "lm")

names(mtcars)
ggplot(mtcars)

#plot with mpg on y-axis 

ggplot(mtcars, aes(x=hp, y=mpg, color=factor(wt)) + geom_point() + geom_smooth(method = "lm")

ggplot(mtcars, aes(x=disp, y=mpg)) + 
  geom_point(aes(color=factor(cyl)),size=3, shape=2) + 
  geom_smooth(method = 'lm', color="black",size=4,linetype=2) +
  labs(x="Displacement",y="Miles per Gallon",title="MPG~Disp",
       subtitle="Stuff",caption = "This is brought o you by the color black",
       color="Cylinders")

?geom_smooth
