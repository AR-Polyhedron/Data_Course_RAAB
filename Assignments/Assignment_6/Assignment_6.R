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

hp_orig <- mtcars[which.max(mtcars$hp),]
hp_200 <- mt3[which.max(mt3$hp),]
hp_auto <- automatic_mtcars.csv[which.max(automatic_mtcars.csv$hp),]

max_hp <- full_join(hp_orig,hp_200) %>% full_join(hp_auto)

write.table(max_hp,"./hp_maximums.txt")

