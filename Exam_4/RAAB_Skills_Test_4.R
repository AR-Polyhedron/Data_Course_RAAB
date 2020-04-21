library(tidyverse)
library(patchwork)
max.print=1000000000
df <- read.csv("../Exam_1/DNA_Conc_by_Extraction_Date.csv")
hist(x=df$DNA_Concentration_Ben, main="Ben", xlab="DNA Concentration")
hist(x=df$DNA_Concentration_Katy, main="Katy", xlab="DNA Concentration")
class(df$DNA_Concentration_Ben)
class(df$Year_Collected)
df2 <- df
df2$Year_Collected <- as.factor(df2$Year_Collected)
jpeg("RAAB_Plot2")
plot(y=df2$DNA_Concentration_Ben, x=df2$Year_Collected,
     main="Ben's Extractions", xlab="Year",ylab="DNA Concentration")
dev.off()

jpeg("RAAB_Plot2")
plot(y=df2$DNA_Concentration_Katy, x=df2$Year_Collected,
     main="Ben's Extractions", xlab="Year",ylab="DNA Concentration")
dev.off()

plot(y=df$DNA_Concentration_Ben/df$DNA_Concentration_Katy, x=df$Year_Collected)
ggplot(df,aes(y=DNA_Concentration_Ben/DNA_Concentration_Katy, 
              x=Year_Collected)) + geom_point()

ggplot(df,aes(x=DNA_Concentration_Ben/DNA_Concentration_Katy)) + 
  geom_histogram() + facet_wrap(~Year_Collected)

#I just did not get POSIXct at all so don't expect much from this section.
?POSIXct()
?POSIXlt

Downstairs <- subset.data.frame(df, Lab == "Downstairs")
Downstairs$as.numeric(Downstairs$Year_Collected)
as.POSIXct(Downstairs$Year_Collected, origin = "2004-01-01")

as.difftime(Downstairs$Year_Collected, units = "mon")
as.POSIXct(class)

plot(x=Downstairs$Year_Collected, y=Downstairs$DNA_Concentration_Ben)

?filter()

Years <- unique(df$Year_Collected)
df %>% filter(Year_Collected=="2000") -> df3 
Means <- mean(df3$DNA_Concentration_Ben)
df %>% filter(Year_Collected=="2001") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2002") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2003") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2004") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2005") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2006") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2007") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2008") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2010") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2011") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))
df %>% filter(Year_Collected=="2012") -> df3 
Means <- c(Means,mean(df3$DNA_Concentration_Ben))


df4 <- data.frame(x=Years,y=Means)

df4 %>% 
  rename(
    Year.Collected = x,
    DNA.Concentration.Ben = y
  ) -> df4
write.csv(df4, file = "./Ben_Average_Conc.csv")
