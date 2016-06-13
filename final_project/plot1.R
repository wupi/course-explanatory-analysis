#exploratory analysis - final project
#plot 1

scc <- readRDS("./course-explanatory-analysis/final_project/Source_Classification_Code.rds")
nei <- readRDS("./course-explanatory-analysis/final_project/summarySCC_PM25.rds")

plot1 <- aggregate(Emissions ~ year, nei, sum)
with(plot1, plot(year, Emissions, type = 'l'))

dev.copy(png, "./course-explanatory-analysis/final_project/plot1.png")
dev.off()