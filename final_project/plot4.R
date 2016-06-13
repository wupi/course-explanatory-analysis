#exploratory analysis - final project
#plot 4

scc <- readRDS("./course-explanatory-analysis/final_project/Source_Classification_Code.rds")
nei <- readRDS("./course-explanatory-analysis/final_project/summarySCC_PM25.rds")

coalscc <- scc[grep("coal", scc$Short.Name), ]
coalnei <- merge(coalscc, nei, by = "SCC")
plot4 <- aggregate(Emissions ~ year, data = coalnei,  sum)

with(plot4, plot(year, Emissions, type = 'l'))

dev.copy(png, "./course-explanatory-analysis/final_project/plot4.png")
dev.off()