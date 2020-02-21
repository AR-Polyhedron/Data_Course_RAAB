library(tidyverse)
library(ggimage)

data("iris")

?ggimage()
labnames <- c("Middle is Versicolor", "First is Setosa", "Species 3")
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length)) + 
  geom_image(aes(image="./pie-chart.png")) + 
  geom_bgimage(image = "./Zahn.png") + 
  geom_path(color="Purple", linetype=8,)+ 
  labs(title = "Brought to you by the Pie-Chart",
                    subtitle = "Praise be unto the pie chart",
                    y="each of the segments of the corolla of a flower, 
                    which are modified leaves and are typically colored. 
                    the measurement or extent of something from end to end; 
                    the greater of two or the greatest of three dimensions 
                    of a body.",
                    x="each of the parts of the calyx of a flower, 
                    enclosing the petals and typically green and 
                    leaflike.the amount of time \n
                    occupied by something",
       tag = "Hey isn't it really annoying how this shoves the plot into the 
       cornern making it harder to read? \n Anyway Did you ever hear the tragedy of Darth Plagueis
       The Wise? I thought not. It’s not a story the Jedi would tell you. 
       It’s a Sith legend. Darth Plagueis was a Dark Lord of the Sith, 
       so powerful and so wise he could use the Force to influence the 
       midichlorians to create life… He had such a knowledge of the dark side 
       that he could even keep the ones he cared about from dying. 
       The dark side of the Force is a pathway to many abilities some consider 
       to be unnatural. He became so powerful… the only thing he was afraid of 
       was losing his power, which eventually, of course, he did. Unfortunately,
       he taught his apprentice everything he knew, then his apprentice killed 
       him in his sleep. Ironic. He could save others from death, but not 
       himself.") + coord_flip() + 
  facet_wrap(~Species,labeller = labeller(Species=labnames))+
  theme_linedraw()
  
