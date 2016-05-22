#note

#sample data
fileurl <- "https://raw.githubusercontent.com/DataScienceSpecialization/courses/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv"
pollution <- read.csv( fileurl, colClasses = c("numeric", 'character', 'factor', 'numeric', 'numeric'), skip = 0)

########### Graphs
#histgram
hist(pollution$pm25, col = 'green')
abline(v= median(pollution$pm25), col = 'magenta' , lwd = 5)

#boxplot
boxplot(pollution$pm25, col = 'blue')
abline(h = 12)
#multi boxplots
boxplot(pm25 ~ region, data = pollution, col = 'blue')

#barplot
barplot(table(pollution$region) , main = "number of stats in region")

#scatter plot
with(pollution, plot(latitude, pm25))
with(pollution, plot(latitude, pm25, col = region))
legend("topright", col = c("blue", "red"), legend = unique(pollution$region), pch = 1)

#export it to a pdf
pdf(file = "./course-explanatory-analysis/xxx.pdf")
#generate graph here
dev.off()
#or
dev.copy2pdf(, file = './course-explanatory-analysis/xxx.pdf')

