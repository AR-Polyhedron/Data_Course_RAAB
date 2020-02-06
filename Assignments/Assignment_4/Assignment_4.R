max.print=100000000000
df <- read.csv("../../Data/ITS_mapping.csv", sep="")
summary(df)
boxplot(x=df$Ecosystem,y=df$Lat)
str(df$Ecosystem)
levels(df$Ecosystem)
str(df$Lat)
levels(df$Lat)
df2 <- df

levels(df2$Ecosystem)
df2$Ecosystem <- [df2$Ecosystem == "ITS1F"] <- "NA"
df2$Ecosystem[df2$Ecosystem == "LRORF_Coral-PCR1"] <- "NA"
df2$Ecosystem[df2$Ecosystem == "ITS1f-PCR1"] <- "NA"
df2$Ecosystem[df2$Ecosystem == "42244"] <- "NA"
df2$Ecosystem[df2$Ecosystem == "42340"] <- "NA"
levels(df$Ecosystem)
df2$Ecosystem == "ITS1F"
unique(df2$Ecosystem)
df2$Ecosystem[df2$Ecosystem == "ITS2"] <- "NA"
df2$Ecosystem == ""
df2$Headwidth[df2$Ecosystem == ""] <- "NA"

df2$Ecosystem <- na.omit(df2$Ecosystem)

unique(df2$Ecosystem)
df2$Ecosystem <- as.numeric(as.character(df2$Ecosystem))
boxplot(x=df2$Ecosystem,y=df2$Lat, main = "Silly Boxplot", ylab = "Lat", xlab = "Ecosystem")
#Yeah I don't know how to clean up Lat. I'm not sure how to convert the "."." numbers into actual numbers, when I just separate down to the stuff that is actual numbers it doesn't change the plot either. Also way to many unique levels to manually change all this .fasta and etc garbage. This is a data set I would tell those acking me to clean it up that I can't cause it makes no fucking sense.

png(filename = "./silly_boxplot.png")
boxplot(x=df2$Ecosystem,y=df2$Lat, main = "Silly Boxplot", ylab = "Lat", xlab = "Ecosystem")
dev.off()


