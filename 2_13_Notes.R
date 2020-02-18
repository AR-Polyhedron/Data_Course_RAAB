#load and install packages for dataset
library(carData)
library(tidyverse)
library(skimr)
library(plotly)

#set global options
options(scipen = 999)

#load data from carData
df <- MplsStops
df2 <- MplsDemo

#Quick look at the data
skim(df)
skim(df2)

#identify dependent and independent variables of interest

ggplot(df, aes(x=race)) + geom_histogram(stat = "count")

ggplot(df, aes(x=race)) + geom_violin()

ggplot(df, aes(x=lat, y=long, color=race)) + geom_point()

ggplot(df, aes(x=lat, y=long, color=race)) + geom_point(alpha=.1)

#need to combine demographic info with stop info....

names(df)
names(df2)

df3 <- full_join(df,df2, by="neighborhood")

ggplot(df3, aes(x=lat, y=long, color=black, fill=race)) + geom_point(alpha=.1)

ggplot(df3, aes(x=lat, y=long, color=black, size=collegeGrad)) + geom_point(alpha=.1)

p <- ggplot(df3, aes(x=lat, y=long, color=black, size=collegeGrad)) + geom_point(alpha=.1)

ggplotly(p)

ggplot(df3, aes(x=lat, y=long, color=race, fill=race)) +
  geom_density_2d(linemitre = 20)

ggplot(df3, aes(x=lat, y=long, color=race, fill=race)) +
  geom_hex(alpha = .5)

ggplot(df2,aes(x=white, y=collegeGrad)) +
  geom_point() + geom_smooth(method = "lm")

ggplot(df2,aes(x=foreignBorn, y=collegeGrad,)) +
  geom_point(aes(size=hhIncome), color="purple",alpha=.5) + 
  geom_smooth(method = "lm") +
  labs(y="% College Graduate", x="% Foreign Born",size="House Hold Income") +
  theme_bw()


df4 <- carData::Friendly
?Friendly

ggplot(df4, aes(x=condition, y=correct, color=condition)) +
  geom_boxplot() +geom_point(alpha=.25) + theme_bw()

ggplot(df4, aes(x=condition, y=correct, fill=condition)) +
  geom_violin() + geom_jitter(height = 0) +  
  geom_boxplot() +geom_point(alpha=.25) + theme_bw()

df5 <- carData::Chile
?Chile


skim(df5)

ggplot(df5,aes(x=sex,y=income)) + geom_violin()
  
ggplot(df5,aes(x=statusquo,y=income,color=vote)) + geom_point()

df5 %>% 
  filter(vote %in% c("N","Y")) %>%
  ggplot(aes(x=statusquo,y=age,color=vote)) + 
  geom_point(alpha=.5) +
  facet_wrap(~education) 


ggplot(df5,aes(x=statusquo, fill=sex)) +
  geom_density(alpha=.5) +
  facet_wrap(~region) + theme_minimal() +
  labs(x="Status Quo Score", y="Density") +
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male"))

ggplot(df5,aes(x=income, fill=sex)) +
  geom_density(alpha=.5) +
  facet_wrap(~region) 

ggplot(df5,aes(x=income,y=statusquo)) +geom_smooth(method = "lm") +geom_point()
