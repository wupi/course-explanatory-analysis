#exploratory analysis - final project
#plot 2

library(sqldf)
scc <- readRDS("./course-explanatory-analysis/final_project/Source_Classification_Code.rds")
nei <- readRDS("./course-explanatory-analysis/final_project/summarySCC_PM25.rds")

plot2 <- sqldf("select year, sum(Emissions) as Emissions from nei where fips = 24510 group by year")
with(plot2, plot(year, Emissions, type = 'l'))

dev.copy(png, "./course-explanatory-analysis/final_project/plot2.png")
dev.off()