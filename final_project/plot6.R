#exploratory analysis - final project
#plot 6
library(ggplot2)
library(sqldf)

scc <- readRDS("./course-explanatory-analysis/final_project/Source_Classification_Code.rds")
nei <- readRDS("./course-explanatory-analysis/final_project/summarySCC_PM25.rds")

motorscc2 <- scc[grep("[Mm][Oo][Tt][Oo][Rr]", x = scc$Short.Name), ]
motornei2 <- merge(motorscc, nei[nei$fips== '24510' | nei$fips == '06037',], by = "SCC")
plot6 <- sqldf("select year, case when fips = '24510' then 'Baltimore' else 'LA' end as city, sum(Emissions) as Emission from motornei2 group by year, fips ")

qplot(year, Emission, data = plot6, color = city) + geom_line()

dev.copy(png, "./course-explanatory-analysis/final_project/plot6.png")
dev.off()