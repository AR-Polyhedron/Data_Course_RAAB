max.print=1000000000
df <- read.csv("./DNA_Conc_by_Extraction_Date.csv")
hist(x=df$DNA_Concentration_Ben, main="Ben", xlab="DNA Concentration")
hist(x=df$DNA_Concentration_Katy, main="Katy", xlab="DNA Concentration")
class(df$Year_Collected)
class(df$DNA_Concentration_Ben)
class(df$DNA_Concentration_Katy)
df2 <- df
df2$Year_Collected <- as.ordered(as.factor(df2$Year_Collected))
df2$DNA_Concentration_Ben <- as.ordered(as.factor(df2$DNA_Concentration_Ben))
class(df2$DNA_Concentration_Ben)
class(df2$Year_Collected)

jpeg("RAAB_BenPlot")
plot(x=df2$Year_Collected, y=df2$DNA_Concentration_Ben, main="Ben's Extractions", ylab="DNA Concentration", xlab="Year")
dev.off()

jpeg("RAAB_KatyPlot")
plot(x=df2$Year_Collected, y=df2$DNA_Concentration_Katy, main="Katy's Extractions", ylab="DNA Concentration", xlab="Year")
dev.off()

list(df$DNA_Concentration_Ben > df$DNA_Concentration_Katy)
sum(df$DNA_Concentration_Ben)
