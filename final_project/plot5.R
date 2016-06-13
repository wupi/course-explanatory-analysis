#exploratory analysis - final project
#plot 5


scc <- readRDS("./course-explanatory-analysis/final_project/Source_Classification_Code.rds")
nei <- readRDS("./course-explanatory-analysis/final_project/summarySCC_PM25.rds")

motorscc <- scc[grep("[Mm][Oo][Tt][Oo][Rr]", x = scc$Short.Name), ]
motornei <- merge(motorscc, nei[nei$fips== '24510',], by = "SCC")
plot5 <- aggregate(Emissions ~ year, data = motornei,  sum)

with(plot5, plot(year, Emissions, type = 'l'))

dev.copy(png, "./course-explanatory-analysis/final_project/plot5.png")
dev.off()