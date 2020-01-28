# load tidyverse
# my new file

library(tidyverse)

data("Titanic")
data("Loblolly")


rm(Titanic)
?Loblolly
class(Loblolly$Seed)
class(Loblolly$height)
Loblolly$Seed[1]
num1 <- Loblolly[1]
num1

str(Loblolly)
summary(Loblolly)



table(Loblolly$Seed)
levels(Loblolly$Seed)
as.numeric(Loblolly$Seed)
as.character(Loblolly$Seed)

nums1 <- as.character(Loblolly$Seed) %>%
  as.numeric

nums1[1] + 1

glimpse(Loblolly)

hist(Loblolly$height, breaks = 84)
hist(Loblolly$age)

plot(y=Loblolly$height, x=Loblolly$age, col=Loblolly$Seed,
     pch=19, main = "Trees Grow, yo!", xlab = "Tree Age", ylab = "Tree Height")
plot(x=Loblolly$Seed, y=Loblolly$height)

table(Loblolly$seed,Loblolly$age)
plot (x=Loblolly$Seed,y=Loblolly$age)
