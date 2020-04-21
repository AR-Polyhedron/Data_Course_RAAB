
library(rmarkdown)
library(tidyverse)
library(patchwork)
library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyr)

df1 <- read.csv(file =  "../../Data/mushroom_growth.csv")
ggplot(df1,aes(y=GrowthRate, x=Nitrogen, color=Species)) + geom_point()
ggplot(df1,aes(y=GrowthRate, x=Light, color=Species)) + geom_point()
ggplot(df1,aes(x=GrowthRate, y=Humidity, color=Species)) + geom_point()

mod1 = lm(GrowthRate ~ Nitrogen, data = df1)
summary(mod1)

mod2 = lm(GrowthRate ~ Nitrogen+Light, data = df1)
summary(mod2)

mod3 <- lm(GrowthRate ~ Nitrogen+Species, data = df1)
summary(mod3)

mod4 <-  lm(GrowthRate ~ Nitrogen/Species, data = df1)
summary(mod4)

mod5 <-  lm(GrowthRate ~ Nitrogen*Species, data = df1)
summary(mod5)

plot(df1$GrowthRate ~ df1$Nitrogen)
abline(mod1)
abline(mod2)
abline(mod3)
abline(mod4)
abline(mod5)


mod21 = aov(GrowthRate ~ Nitrogen, data = df1)
summary(mod21)

mod22 = aov(GrowthRate ~ Nitrogen+Light, data = df1)
summary(mod22)

mod23 <- aov(GrowthRate ~ Nitrogen+Species, data = df1)
summary(mod23)

mod24 <-  aov(GrowthRate ~ Nitrogen/Species, data = df1)
summary(mod24)

mod25 <-  aov(GrowthRate ~ Nitrogen*Species, data = df1)
summary(mod25)

plot(df1$GrowthRate ~ df1$Nitrogen)
abline(mod21)
abline(mod22)
abline(mod23)
abline(mod24)
abline(mod25)


mean(mod1$residuals^2)
mean(mod3$residuals^2)
mean(mod4$residuals^2)
mean(mod5$residuals^2)
mean(mod21$residuals^2)
mean(mod22$residuals^2)
mean(mod23$residuals^2)
mean(mod24$residuals^2)
mean(mod25$residuals^2)

preds = add_predictions(df1, mod21) 

preds[1:10,c(6,7)]
df2 <- 
{plot(df1$GrowthRate ~ df1$Nitrogen,xlim=c(0,1000),ylim=c(-10,50))
  points(x=preds$Nitrogen, col="Red")
  abline(mod21)}


