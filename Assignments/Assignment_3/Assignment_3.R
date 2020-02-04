# Assignment Week 3




# topics:   type conversions, factors, plot(), making a data frame from "scratch",
#           reordering, 


# vector operations!

vector1 = c(1,2,3,4,5,6,7,8,9,10)
vector2 = c(5,6,7,8,4,3,2,1,3,10)

vector1*vector2

list.files()

dat = read.csv("./Data/thatch_ant.csv")
names(dat)

#why are these plots different???
plot(x=dat$Headwidth..mm., y=dat$Mass)
plot(x=dat$Size.class, y=dat$Mass)

#Headwith are quantitative while size.class is categorical


#check the classes of these vectors
class(dat$Headwidth..mm.)
class(dat$Size.class)

# plot() function behaves differently depending on classes of objects given to it!

# Check all classes (for each column in dat)
str(dat)
class(dat$Colony)
class(dat$Distance)
class(dat$Mass)
class(dat$Headwidth)
class(dat$Headwidth..mm.)
class(dat$Size.class)
dat$Headwidth

# Two of them are "Factor" ....why is the column "Headwidth" a factor? It looks numeric!

dat$Headwidth
#because they are "43.000" not 43.000

# we can try to coerce one format into another with a family of functions
# as.factor, as.matrix, as.data.frame, as.numeric, as.character, as.POSIXct, etc....

#make a numeric vector to play with:
nums = c(1,1,2,2,2,2,3,3,3,4,4,4,4,4,4,4,5,6,7,8,9)
class(nums) # make sure it's numeric

# convert to a factor
as.factor(nums) # show in console
nums_factor = as.factor(nums) #assign it to a new object as a factor
class(nums_factor) # check it

#check it out
plot(nums) 
plot(nums_factor)
# take note of how numeric vectors and factors behave differently in plot()

# Let's modify and save these plots. Why not!?
?plot()
plot(nums, main = "My Title", xlab = "My axis label", ylab = "My other axis label")


?jpeg()

jpeg(filename = "Assignment_3_Plot")
dev.off()



# back to our ant data...
dat$Headwidth
levels(dat$Headwidth) # levels gives all the "options" of a factor you feed it

# I notice a couple weird ones in there: "" and "41mm"
# The "" means a missing value, basically. The "41mm" sure looks like a data entry error.
                                            # It should probably be "41.000"

# FIND WHICH ONES HAVE "41mm"

?filter
filter(dat$Headwidth)
?sort
?summary
?list
list(dat = [,,,"41mm"])

#sum(dat$Headwidth == "41mm")
#which(dat$Headwidth == "41mm")
#dat$Headwidth[1031]
#bad41 <- which(dat$Headwidth == "41mm")
#dat$Headwidth[bad41]
#dat$Headwidth[bad41] <- "any thing here"
#levels(dat$Headwidth) <- c(levels(dat$Headwidth),"anything here")

dat$Headwidth == "41mm"
options(max.print=10000000)

# CONVERT THOSE TO "41.000"

dat$Headwidth[dat$Headwidth == "41mm"] <- "41.000"

# DO THE SAME FOR "", BUT CONVERT THOSE TO "NA"

#bademptys <- which(dat$Headwith == "")
#dat$Headwidth[bademptys] <- NA

dat$Headwidth == ""
dat$Headwidth[dat$Headwidth == ""] <- "NA"

# NOW, REMOVE ALL THE ROWS OF "dat" THAT HAVE AN "NA" VALUE
dat2 <- na.omit(dat)


# NOW, CONVERT THAT PESKY "Headwidth" COLUMN INTO A NUMERIC VECTOR WITHIN "dat"
levels(dat2$Headwidth)
unique(dat2$Headwidth)

dat2$Headwith <- factor(dat2$Headwidth,levels = unique(dat2$Headwidth))
levels(dat2$Headwith)


dat2$Headwidth <- as.numeric(as.character(dat2$Headwith))
# how to do it with tidyverse pipes dat2$headwith %>% as.character() %>% as.numeric

plot(dat2$Headwidth,dat2$Mass)
class(dat2$Headwidth)




# LET'S LEARN HOW TO MAKE A DATA FRAME FROM SCRATCH... WE JUST FEED IT VECTORS WITH NAMES!


# make some vectors *of equal length* (or you can pull these from existing vectors)
col1 = c("hat", "tie", "shoes", "bandana")
col2 = c(1,2,3,4)
col3 = factor(c(1,2,3,4)) # see how we can designate something as a factor             

# here's the data frame command:
data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # colname = vector, colname = vector....
df1 = data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # assign to df1
df1 # look at it...note column names are what we gave it.



# Make a data frame from the first 20 rows of the ant data that only has "Colony" and "Mass"
# save it into an object called "dat3"
?head
head(dat2$Mass)
df2_Mass <- head(dat2$Mass, n=20L)
df2_Colony <- head(dat2$Colony, n=20L)



###### WRITING OUT FILES FROM R #######
?write.csv()


# Write your new object "dat3" to a file named "LASTNAME_first_file.csv" in your PERSONAL git repository


dat2$Mass
summary(dat2$Mass)
plot(y=dat2$Mass,x=dat2$Size.class)


under30mass <- dat2 %>% filter(Size.class == "<30") %>%
  select(Mass) 
mean(under30mass)

under30mass <- dat2 %>% filter(Size.class == "30:34") %>%
  select(Mass) 
mean(under30mass)

### for loops in R ###

#simplest example:
for(i in 1:10){
  print(i)
}

#another easy one
for(i in levels(dat2$Size.class)){
  print(i)
}

# can calculate something for each value of i ...can use to subset to groups of interest
for(i in levels(dat2$Size.class)){
  print(mean(dat[dat2$Size.class == i,"Mass"]))
}

# more complex:
# define a new vector or data frame outside the for loop first
new_vector = c() # it's empty
# also define a counter
x = 1

for(i in levels(dat$Size.class)){
  new_vector[x] = mean(dat[dat$Size.class == i,"Mass"])
  x = x+1 # add 1 to the counter (this will change the element of new_vector we access each loop)
}
  
#check it
new_vector



# PUT THIS TOGETHER WITH THE LEVELS OF OUR FACTOR SO WE HAVE A NEW DATA FRAME:
# FIRST COLUMN WILL BE THE FACTOR LEVELS....
# SECOND COLUMN WILL BE NAMED "MEAN" AND WILL BE VALUES FROM  new_vector

#fill it in
size_class_mean_mass = data.frame(Size_Class = levels(dat2$Size.class),
                                  MEAN =new_vector)

dat2 %>% group_by(Size.class) %>%
  summarize(MEAN = mean(Mass))

dat2summary <- dat2 %>% group_by(Size.class) %>%
  summarize(Firstvariable = mean(Mass),
            secondvariable = mean(Headwidth),
            thirdvariable = mean(Distance))
view(dat2summary)

############ YOUR HOMEWORK ASSIGNMENT ##############

# 1.  Make a scatterplot of headwidth vs mass. See if you can get the points to be colored by "Colony"

class(dat2$Headwidth)
class(dat2$Mass)
as.character(dat2$Headwidth)
plot(x=dat2$Headwidth, y=dat2$Mass, col=dat2$Colony, pch=20)


# 2.  Write the code to save it (with meaningful labels) as a jpeg file

jpeg("Assignment_3_Plot_Homework_Section")
plot(x=dat2$Headwidth, y=dat2$Mass, col=dat2$Colony, pch=20, main="Assignment 3 Plot", ylab = "Meaningful Mass", xlab = "Meaningful Headwith")
dev.off()

# 3.  Subset the thatch ant data set to only include ants from colony 1 and colony 2

class(dat2$Colony)
levels(dat2$Colony)
dat2$Colony
dat2$Colony[dat2$Colony == "3"] <- "NA"
dat2$Colony[dat2$Colony == "4"] <- "NA"
dat2$Colony[dat2$Colony == "5"] <- "NA"
dat2$Colony[dat2$Colony == "6"] <- "NA"
dat2$Colony[dat2$Colony == "7"] <- "NA"
dat2$Colony[dat2$Colony == "8"] <- "NA"
dat2$Colony[dat2$Colony == "9"] <- "NA"
dat2$Colony[dat2$Colony == "10"] <- "NA"
dat2$Colony[dat2$Colony == "11"] <- "NA"
dat3 <- na.omit(dat2)
dat3
plot(x=dat3$Headwidth, y=dat3$Mass, col=dat3$Colony)
# 4.  Write code to save this new subset as a .csv 

#?file.create()
#file.create(Assignment_3_dat3.csv)
#?save
#save(dat3, file = dat3)

?write.csv()
write.csv(dat3,file = "Assignment_3_dat3")
?read.csv
dat3 = read.csv("./Assignment_3_dat3")

# 5.  Upload this R script (with all answers filled in and tasks completed) to canvas
      # I should be able to run your R script and get all the plots created and saved, etc.
