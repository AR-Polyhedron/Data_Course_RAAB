library(tidyverse)
library(gapminder)
data("gapminder")
df = gapminder
head(gapminder)

#Excerise 3

summary(gapminder$country)
levels(gapminder$continent)
gapminder$continent + "Antarica"
?add_column()
?addmargins()
?table
addmargins(df, margin = df$continent, FUN = Antartica)
levels(df) <- c(levels(df),"Antartica")
levels(df)
levels(df$continent)

levels(df$continent) <- c(levels(df$continent), "Antartica")

#Exercise 2

levels(df$continent) <- c(levels(df$continent), "North America") 
levels(df$continent) <- c(levels(df$continent), "South America") 
levels(df$continent) <- c(levels(df$continent), "Central America")
 
  
#Exercise 3

south <-  c("Argentina","Bolivia","Brazil","Chile","Columbia","Ecuador")
north <- c("United States","Canada","Mexico")
central <- c("Costa Rica","El Salvador","Guatemala","Honduras","Nicaragua","Panama")

levels(df$continent)
