data(mtcars)
str(mtcars)
library(tidyverse)
library(patchwork)
filter(mtcars$am == 0)
?dplyr(mtcars$am == 0)
summary(mtcars$am == 0)
mtcars[mtcars$am == 0, ]
automatic_mtcars.csv <- mtcars[mtcars$am == 0, ]
?write_csv
write.csv(automatic_mtcars.csv, file.path("./automatic_mtcars.csv"))


p1 <- ggplot(automatic_mtcars.csv, aes(x=hp, y=mpg)) +
  geom_point() + labs(title = "Horsepower vs Miles per gallon of Automatic Cars",
                      x="Horsepower", y="Miles per Gallon")
ggsave("./mpg_vs_hp_auto.png", plot=p1, device = "png")

p2 <- ggplot(automatic_mtcars.csv, aes(x=wt, y=mpg)) +
  geom_point() + labs(title = "Weight vs Miles per gallon of Automatic Cars",
                      x="Weight", y="Miles per Gallon")
p2
ggsave("./mpg_vs_wt_auto.tiff", plot=p2, device = "tiff")

mt3 <- mtcars[mtcars$disp <= 200, ]
write.csv(mt3, file.path("./mtcars_max200_displ.csv"))
?max()

cat(max(mtcars$disp)) %>%
  cat(max(automatic_mtcars.csv$disp)) %>%
  cat(max(mt3$disp))

t1 <- cat(max(mtcars$disp)) %>%
  cat(max(automatic_mtcars.csv$disp)) %>%
  cat(max(mt3$disp))

t1 <- summary(mtcars)
t1
summary(max(mtcars$disp))
t1 <- summary(max(mtcars$disp))
t1

t1 <- summary(max(mtcars$disp)) 
t1
t2 <- summary(max(automatic_mtcars.csv$disp))
t3 <- summary(max(mt3$disp))
anti_join(t1+t2+t3)
?anti_join
t4
table(t1,t2,t3)

write.table(mtcars, file = "", sep = "\t",
            row.names = TRUE, col.names = NA)