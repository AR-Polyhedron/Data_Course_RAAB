library(tidyverse)
library(patchwork)
library(colorblindr)
options(scipen = 999)
df1 <- read.csv("./landdata-states.csv")

p1 <- ggplot(df1,aes(y=Land.Value, x=Year, color=region)) + 
  geom_smooth(size=1.4) + labs(y="Land Value (USD)", color="Region") +
  theme_minimal()


df1$State %in% df1$region == "NA"
df1$region == NA
levels(df1$region)
summary(df1%region)
summary(df1)
df1$region
sum(is.na(df1$region))
is.na(df1)
df1[1-90]
#It's the Ak states

df2 <- read.csv("./unicef-u5mr.csv")
summary(df2)
df3 <- gather(df2,key = "Year",value = "MortalityRate", 2:67)
newyearnames <- str_remove(df3$Year,"U5MR.") 
df3$Year <- newyearnames

p2 <- ggplot(df3,aes(y=MortalityRate,x=Year, color=Continent)) + 
  geom_point(size=2) + 
  theme_minimal() +
  scale_x_discrete(breaks = c("1960","1980","2000"))


df4 <- aggregate(MortalityRate ~ Year+Continent, data = df3, mean)


p3 <- ggplot(df4, aes(Year, MortalityRate, group = Continent, color=Continent)) +
  geom_line(size=2) + theme_minimal() + 
  labs(y="Mean Mortality Rate (deaths per 1000 live births)") +
  scale_x_discrete(breaks = c("1960","1980","2000"))


p4 <- ggplot(df3,aes(y=MortalityRate/1000,x=Year)) +
  geom_point(colour="blue",size=1) + facet_wrap(~Region) +
  scale_x_discrete(breaks = c("1960","1980","2000")) +
  labs(y="Mortality Rate") +
  theme(strip.background =element_rect(fill="white",size=1, color="black"))
  
p1
ggsave("RAAB_Fig_1.jpg", device = "jpg")
p2
ggsave("RAAB_Fig_2.jpg", device = "jpg")
p3
ggsave("RAAB_Fig_3.jpg", device = "jpg")
p4
ggsave("RAAB_Fig_4.jpg", device = "jpg")
