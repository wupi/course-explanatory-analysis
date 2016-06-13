#exploratory analysis - final project
#plot 3

library(sqldf)
library(ggplot2)

scc <- readRDS("./course-explanatory-analysis/final_project/Source_Classification_Code.rds")
nei <- readRDS("./course-explanatory-analysis/final_project/summarySCC_PM25.rds")

plot3 <- sqldf("select year,type, sum(Emissions) as Emissions from nei where fips = 24510 group by year, type")
qplot(year, Emissions, data = plot3, color = type) + geom_line()

dev.copy(png, "./course-explanatory-analysis/final_project/plot3.png")
dev.off()