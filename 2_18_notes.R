data("mtcars")
library(tidyverse)
library(patchwork)
library(usethis)
library(devtools)
devtools::install_github("wilkelab/cowplot")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")
devtools::install_github("clauswilke/colorblindr")
library(colorspace)
library(ggplot2)
library(colorblindr)
library(RColorBrewer)

ggplot(mtcars,aes(x=drat, y=am, color=hp)) + geom_point() + geom_path()
ggplot(mtcars,aes(x=disp,y=mpg)) + geom_point()
ggsave("./testplot.png", dpi=600,height = 4, width = 4)

p1 <- ggplot(mtcars,aes(x=disp,y=mpg)) + geom_smooth()
ggsave(p1,"./test2.png")
p1
ggsave("./test2.png", plot=p1, device = "png")
p2 <- ggplot(mtcars,aes(x=disp,y=mpg)) + geom_point()
p1/p2
p2/p1
p3 <- ggplot(mtcars,aes(x=hp,y=mpg)) + geom_point()

(p2+p1)/p3
p2+p1+p3
ggsave("multiplot.png")

p2 + theme_bw()

p2 +scale_x_reverse()
p4 <- p2 +scale_x_reverse()
p4 + theme_minimal()

p5 <- ggplot(mtcars,aes(x=disp,y=mpg, color=as.factor(cyl))) + geom_point()
p5
p5 + theme_bw() +
  labs(title = "Miles per gallon vs Dsiplacement",
       x="Engine displacement",
       y="Miles per gallon",
       color="Number \n of cylinders",
       subtitle="sure why not",
       caption="Brought to you by mtcars dataset") +
  scale_color_grey()


mod <- lm(mtcars,formula = mpg ~ disp)
summary(mod)
residuals(mod)
mtcars$resids <- residuals(mod)
mtcars <- mutate(mtcars, DIFF=mpg-resids)

ggplot(mtcars,aes(x=disp,y=mpg)) +
  geom_point() + geom_smooth(method="lm",se=FALSE) +
  geom_segment(aes(x=disp,y=mpg,yend=resids,xend=disp))

ggplot(mtcars,aes(x=disp,y=mpg)) +
  geom_point() + geom_smooth(method="lm",se=FALSE) +
  scale_x_log10()
df <- read.csv("./Data/mushroom_growth.csv")
glimpse(df)

library(ggplot2)
ggplot(df,aes(x=Nitrogen,y=GrowthRate))
+ geom_point(aes(color=Species))

ggplot(df,aes(x=Nitrogen,y=GrowthRate,color=Light)) + 
  geom_point() + 
  geom_smooth(method = "lm",formula = y ~ poly(x,6)) +
  facet_wrap(~Species) +
  scale_color_gradient(low = "Blue", high = "Red")
library(ggimage)
?ggimage

ggplot(mtcars,aes(x=disp,y=mpg)) + geom_pokemon(image="tauros")
list.pokemon()
